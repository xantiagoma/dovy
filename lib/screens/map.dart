import 'package:dovy/general.dart';
import 'package:fl_chart/fl_chart.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    Key key,
  }) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>
    with AutomaticKeepAliveClientMixin<MapScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<StationsCubit, BuiltList<Station>>(
      builder: (context, state) => BlocBuilder<LinesCubit, BuiltList<Line>>(
          builder: (context, snapshot) {
        return Mapa();
      }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class Mapa extends HookWidget {
  const Mapa({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cmsConfigsMemo = useMemoized(() => context.i<CmsService>().configs);
    final cmsConfigsMemo$ = useFuture(cmsConfigsMemo);

    if (cmsConfigsMemo$.data == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    final mapController = MapController();

    final options = cmsConfigsMemo$.data;
    final String mapTileUrl = options['map_tile_url'];
    // 'https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}{r}.png'
    final List<String> mapTileSubdomains = List.from(
      options['map_tile_subdomains'],
    );
    // ['a', 'b', 'c']
    final Map<String, String> mapTileAdditionalOptions = Map.from(
      options['map_tile_additional_options'],
    );
    // {'r': '@2x',}

    final LatLng mapTileCenter = Map.from(
          options['map_tile_center'],
        ).cast<String, num>().latlng ??
        LatLng(37.42796133580664, -122.085749655962);

    final double mapTileZoom = options['map_tile_zoom'].toDouble();

    final stations = context.bloc<StationsCubit>().state;
    final lines = context.bloc<LinesCubit>().state;
    // final zoomLevel = context.bloc<PositionCubit>().state.zoom;

    return BlocBuilder<PositionCubit, MapPosition>(
        builder: (context, mapPosition) {
      final zoom = (mapPosition?.zoom ?? 12) - 10;
      return FlutterMap(
        mapController: mapController,
        options: MapOptions(
          center: mapTileCenter,
          zoom: mapTileZoom,
          maxZoom: 18.49,
          minZoom: 2,
          onPositionChanged: (position, _) =>
              context.bloc<PositionCubit>().change(position),
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: mapTileUrl,
            subdomains: mapTileSubdomains,
            additionalOptions: mapTileAdditionalOptions,
            backgroundColor: context.theme.scaffoldBackgroundColor,
          ),
          PolylineLayerOptions(
            polylines: lines
                .map(
                  (l) => Polyline(
                    points: l.path?.map((p) => p.latlng)?.toList() ?? [],
                    color: l.color.toColor(),
                    strokeWidth: 2,
                  ),
                )
                .toList(),
          ),
          MarkerLayerOptions(
            markers: stations
                .map(
                  (s) => Marker(
                    point: s.latlng,
                    builder: (context) => IconButton(
                      icon: DonutColors(
                        colors: s.lines.map((c) => c.color.toColor()).toList(),
                        radius: zoom,
                        centerRatio: 0.1,
                      ),
                      onPressed: () {
                        Flushbar msg;
                        msg = Flushbar(
                          margin: EdgeInsets.all(10),
                          borderRadius: 10,
                          titleText: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                s.name,
                                style: context.theme.textTheme.subtitle1,
                              ),
                              IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  msg.dismiss();
                                },
                              ),
                            ],
                          ),
                          messageText: Row(
                            children: s.lines
                                .map(
                                  (l) => SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Stack(
                                      children: <Widget>[
                                        DonutColors(
                                          radius: 15,
                                          centerColor: l.color.toColor(),
                                          colors: [l.color.toColor()],
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(l.name),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        );
                        context.show(msg);
                      },
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      );
    });
  }
}

class DonutColors extends StatelessWidget {
  final double radius;
  final double centerSpaceRadius;
  final List<Color> colors;
  final Color centerColor;

  const DonutColors({
    Key key,
    @required this.colors,
    double radius = 12,
    double centerRatio = 0.6,
    this.centerColor = Colors.black,
  })  : this.radius = radius * (1 - centerRatio),
        this.centerSpaceRadius = radius * centerRatio,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sectionsSpace: 0,
        centerSpaceRadius: 4,
        borderData: FlBorderData(
          show: false,
        ),
        centerSpaceColor: centerColor,
        sections: colors
            .map(
              (c) => PieChartSectionData(
                color: c,
                value: 1,
                showTitle: false,
                radius: radius,
              ),
            )
            .toList(),
      ),
    );
  }
}

import 'package:dovy/general.dart';

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
                    icon: Icon(Icons.trip_origin),
                    onPressed: () {
                      context.show(
                        Flushbar(
                          title: s.name,
                          message: s.lines.map((e) => e.name).join(', '),
                          duration: 1.5.seconds,
                        ),
                      );
                    },
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

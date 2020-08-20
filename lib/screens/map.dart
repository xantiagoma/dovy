import 'package:dovy/general.dart';
import 'package:dovy/hooks/graphql.dart';
import 'package:dovy/state/system_cubit.dart';

class MapScreen extends StatefulHookWidget {
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

    return Stack(
      children: <Widget>[
        Mapa(),
        Align(
          alignment: Alignment.bottomRight,
          child: SettingsButton(),
        ),
      ],
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
    final hookContext = useContext();
    final snapshot = useMemoizedFuture(context.i<CmsService>().configs);
    final select = useBloc<SystemSelectCubit>();
    final systemsList = useBloc<SystemsListCubit>();

    useEffect(() {
      final system = select.state.system;
      if (system == null) {
        systemsList.loadSystems().then((list) {
          // First Load
          select.selectSystem(list[0]["id"]);
        });
      }

      return () {};
    }, [select.state.system]);

    if (snapshot.data == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    final mapController = MapController();

    final options = snapshot.data;
    final String mapTileUrl = options['map_tile_url'];
    final List<String> mapTileSubdomains = List.from(
      options['map_tile_subdomains'],
    );
    final Map<String, String> mapTileAdditionalOptions = Map.from(
      options['map_tile_additional_options'],
    );

    final LatLng mapTileCenter = Map.from(
          options['map_tile_center'],
        ).cast<String, num>().latlng ??
        LatLng(37.42796133580664, -122.085749655962);

    final double mapTileZoom = options['map_tile_zoom'].toDouble();

    return MapStateBuilder(
        builder: (context, select, systemsList, linesList, stationsList) {
      // print(
      //     "$select: systems: ${systemsList.length}, lines: ${linesList.length}, stations: ${stationsList.length}");

      final systems = mapKeysFromList(systemsList, (s) => s['id']);
      final lines = mapKeysFromList(linesList, (s) => s['id']);
      final stations = mapKeysFromList(stationsList, (s) => s['id']);

      final system = systems[select.system];
      final line = lines[select.line];
      final station = stations[select.station];

      final polylines = <Polyline>[];
      final markers = <Marker>[];

      if (system != null) {
        system["lines"].forEach((payload) {
          final id = payload["id"];
          if (id == null) {
            return;
          }
          final line = lines[id];
          if (line == null) {
            return;
          }

          if (select.line != null && select.line != id) {
            return;
          }

          final points = (line["shape"] as String)?.toLatLngList() ?? [];
          //TODO
          // if (points.isEmpty) {
          //   return;
          // }
          final polyline = Polyline(
            points: points,
            color: (line["color"] as String).toColor(),
            strokeWidth: 2,
          );
          polylines.add(polyline);

          final stations = line["stations"];

          stations.forEach((station) {
            final id = station["id"] as String;
            if (select.station != null && select.station != id) {
              return;
            }

            final location = station["location"];
            if (location == null) {
              return;
            }
            final latitude = location["latitude"];
            final longitude = location["longitude"];

            if (latitude == null || longitude == null) {
              return;
            }

            final point = LatLng(latitude, longitude);

            final List stationLines = station["lines"]
                .map((payload) => payload["id"])
                .map((id) => lines[id])
                .toList();
            final colors = stationLines
                .map((p) => p["color"])
                .map((e) => (e.toString().toColor()))
                .toList();

            final marker = Marker(
              point: point,
              builder: (context) => DonutColors(
                colors: colors,
                radius: 5,
                centerRatio: 0.1,
                onTap: () => clickStation(hookContext, station, stationLines),
              ),
            );

            markers.add(marker);
          });
        });
      }

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
              onTap: (l) {
                clickPlace(context, l);
              }),
          layers: [
            TileLayerOptions(
              urlTemplate: mapTileUrl,
              subdomains: mapTileSubdomains,
              additionalOptions: mapTileAdditionalOptions,
              backgroundColor: context.theme.scaffoldBackgroundColor,
            ),
            PolylineLayerOptions(
              polylines: polylines,
            ),
            MarkerLayerOptions(
              markers: markers,
            ),
          ],
        );
      });
    });
  }
}

void clickStation(BuildContext context, station, List lines) {
  Flushbar msg;
  msg = Flushbar(
    margin: EdgeInsets.all(10),
    borderRadius: 10,
    titleText: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          station["name"],
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
      children: lines.map(
        (l) {
          final color = (l["color"] as String).toColor();
          return Padding(
            padding: EdgeInsets.only(right: 10),
            child: Chip(
              label: Text(
                l["name"],
                style: TextStyle(
                  color: color.inverseBW,
                ),
              ),
              backgroundColor: color,
            ),
          );
        },
      ).toList(),
    ),
  );
  context.show(msg);
}

void clickPlace(BuildContext context, LatLng point) {
  Flushbar msg;
  msg = Flushbar(
    margin: EdgeInsets.all(10).copyWith(bottom: 120),
    borderRadius: 10,
    icon: Icon(Icons.info_outline),
    messageText: FutureBuilder<Map<String, dynamic>>(
      future: LocationService.getLocation(point),
      builder: (context, snapshot) {
        return Row(children: [
          if (snapshot.connectionState == ConnectionState.done)
            Expanded(child: Text(snapshot.data["display_name"]))
          else
            Expanded(child: Center(child: CircularProgressIndicator()))
        ]);
      },
    ),
  );

  context.show(msg);
}

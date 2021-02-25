import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dovy/general.dart';

class Mapa extends HookWidget {
  const Mapa({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hookContext = useContext();
    final select = useProvider(selectProvider);
    final systems = useProvider(systemsProvider);
    final lines = useProvider(linesProvider)?.data?.value ?? [];
    final stations = useProvider(stationsProvider)?.data?.value ?? [];
    final options = useProvider(configsProvider).data?.value;
    final mapController = useProvider(mapControllerProvider);

    useEffect(() {
      final system = select.state.system;
      if (system == null) {
        // First Load
        Future.microtask(() {
          final item = systems?.data?.value;
          if (item != null) {
            select.state = select.state.setSystem(item[0].id);
          }
        });
      }

      return () {};
    }, [select.state.system, systems.data?.value]);

    if (options == null) {
      return Center(
        child: SpinKitFadingFour(
          color: Colors.white,
        ),
      );
    }

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

    return Consumer(
      builder: (context, watch, child) {
        final position = watch(positionProvider);

        return FlutterMap(
          mapController: mapController,
          options: MapOptions(
            center: mapTileCenter,
            zoom: mapTileZoom,
            maxZoom: 18.49,
            minZoom: 2,
            onPositionChanged: (newPosition, _) {
              Future.microtask(() {
                position.state = newPosition;
              });
            },
            plugins: [
              TappablePolylineMapPlugin(),
            ],
            onLongPress: (l) {
              clickPlace(context, l);
            },
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: mapTileUrl,
              subdomains: mapTileSubdomains,
              additionalOptions: mapTileAdditionalOptions,
              backgroundColor: context.theme.scaffoldBackgroundColor,
            ),
            if (!kIsWeb)
              TappablePolylineLayerOptions(
                polylineCulling: true,
                polylines: [
                  for (final line in lines)
                    TaggedPolyline(
                      tag: line.id,
                      points: line?.points,
                      color: line?.color?.toColor(),
                      strokeWidth: 2.0,
                    ),
                ],
                onTap: (TaggedPolyline polyline) =>
                    clickLine(context, polyline.tag),
                onMiss: () {},
              ),
            if (kIsWeb)
              PolylineLayerOptions(
                // polylineCulling: true,
                polylines: [
                  for (final line in lines)
                    Polyline(
                      points: line?.points,
                      color: line?.color?.toColor(),
                      strokeWidth: 2.0,
                    ),
                ],
              ),
            MarkerLayerOptions(
              markers: [
                for (final station in stations)
                  if (station.id == select.state.station ||
                      select.state.station == null)
                    Marker(
                      height: 18,
                      width: 18,
                      point: station.location,
                      builder: (context) => Material(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(18),
                        child: InkWell(
                          onTap: () => clickStation(hookContext, station),
                          child: CircleDonut(
                            colors: [
                              for (final line in station.lines)
                                line.color.toColor(),
                            ],
                            thickness: 4,
                          ),
                        ),
                      ),
                    ),
              ],
            ),
          ],
        );
      },
    );
  }
}

void clickStation(BuildContext context, Station station) {
  showFlash(
    context: context,
    builder: (context, controller) {
      return StationCard(
        controller: controller,
        stationId: station.id,
      );
    },
  );
}

void clickLine(BuildContext context, String lineId) {
  showFlash(
    context: context,
    builder: (context, controller) {
      return LineCard(
        controller: controller,
        lineId: lineId,
      );
    },
  );
}

void clickPlace(BuildContext context, LatLng point) {
  showFlash(
    context: context,
    builder: (context, controller) {
      return PlaceCard(
        controller: controller,
        point: point,
      );
    },
  );
}

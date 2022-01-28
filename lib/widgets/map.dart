import 'package:flutter/material.dart';
import 'package:dovy/general.dart';

T logAndReturn<T>(T val, {String tag = 'default'}) {
  print('> Log (${tag}): $val');
  return val;
}

class Mapa extends HookConsumerWidget {
  const Mapa({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hookContext = useContext();
    final systemId = ref.watch(selectSystemProvider);
    final stationId = ref.watch(selectStationProvider);
    final systems = ref.watch(systemsProvider);
    final lines = ref.watch(linesProvider).maybeWhen(
          orElse: () => null,
          data: (d) => d,
        );
    final stations = ref.watch(stationsProvider).asData?.value ?? [];
    final mapController = ref.watch(mapControllerProvider);

    useEffect(() {
      if (systemId == null) {
        // First Load
        Future.microtask(() {
          final item = systems.asData?.value;
          if (item != null) {
            ref
                .read(selectSystemProvider.notifier)
                .update((state) => item[0]['id']);
          }
        });
      }

      return () {};
    }, [systemId, systems.asData?.value]);

    final String mapTileUrl =
        "https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png";
    final List<String> mapTileSubdomains = ["a", "b", "c"];
    final Map<String, String> mapTileAdditionalOptions = {"r": "@2x"};
    final LatLng mapTileCenter = LatLng(6.2466949, -75.5851195);
    final double mapTileZoom = 13.75;
    final position = ref.watch(positionProvider);

    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        center: mapTileCenter,
        zoom: mapTileZoom,
        maxZoom: 18.49,
        minZoom: 2,
        onPositionChanged: (newPosition, _) {
          Future.microtask(() {
            ref.read(positionProvider.notifier).update((state) => newPosition);
          });
        },
        // plugins: [],
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
        // if (!kIsWeb)
        //   TappablePolylineLayerOptions(
        //     polylineCulling: true,
        //     polylines: [
        //       for (final line in (lines ?? <Line>[]))
        //         TaggedPolyline(
        //           tag: line.id!,
        //           points: logAndReturn(line.points, tag: 'Line ${line.id}'),
        //           color: Colors.red, // getColor(line.color),
        //           strokeWidth: 2.0,
        //         ),
        //     ],
        //     onTap: (TaggedPolyline polyline) =>
        //         clickLine(context, polyline.tag),
        //     onMiss: () {},
        //   ),
        // if (kIsWeb)
        if (lines != null && lines.isNotEmpty)
          PolylineLayerOptions(
            // polylineCulling: true,
            polylines: [
              for (final line in lines)
                Polyline(
                  points: decodeEncodedPolyline(line['attributes']['shape']),
                  color: getColor(line['attributes']['color'])!,
                  strokeWidth: 2.0,
                ),
            ],
          ),
        MarkerLayerOptions(
          markers: [
            for (final station in stations)
              if (station['id'] == stationId || stationId == null)
                Marker(
                  height: 18,
                  width: 18,
                  point: LatLng(
                    station['attributes']['location']['lat'],
                    station['attributes']['location']['lng'],
                  ),
                  builder: (context) => Material(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(18),
                    child: InkWell(
                      onTap: () => clickStation(hookContext, station),
                      child: CircleDonut(
                        colors: [
                          for (final line in station['attributes']['lines']
                              ['data'])
                            getColor(line['attributes']['color']) ??
                                Colors.grey,
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
  }
}

void clickStation(BuildContext context, Map<String, dynamic> station) {
  showFlash(
    context: context,
    builder: (context, controller) {
      return StationCard(
        controller: controller,
        stationId: station['id'],
      );
    },
  );
}

void clickLine(BuildContext context, int lineId) {
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

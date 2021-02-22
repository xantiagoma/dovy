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
    final systemsList = useProvider(systemsProvider);
    final linesList = useProvider(linesProvider);
    final options = useProvider(configsProvider).data?.value;

    useEffect(() {
      final system = select.state.system;
      if (system == null) {
        // First Load
        Future.microtask(() {
          final item = systemsList?.data?.value;
          if (item != null) {
            select.state = select.state.setSystem(item[0].id);
          }
        });
      }

      return () {};
    }, [select.state.system, systemsList.data?.value]);

    final mapController = MapController();

    if (options == null) {
      return Center(
        child: CircularProgressIndicator(),
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

    final systems = mapKeysFromList(
        systemsList.data?.value ?? <System>[], (System s) => s.id);
    final lines =
        mapKeysFromList(linesList.data?.value ?? <Line>[], (Line l) => l.id);

    final system = systems[select.state.system];

    final polylines = <TaggedPolyline>[];
    final markers = <Marker>[];

    if (system != null) {
      system.lines?.forEach((payload) {
        final id = payload.id;
        if (id == null) {
          return;
        }
        final line = lines[id];
        if (line == null) {
          return;
        }

        if (select.state.line != null && select.state.line != id) {
          return;
        }

        final points = line?.shape?.toLatLngList() ?? [];

        final polyline = TaggedPolyline(
          tag: line.id,
          points: points,
          color: line?.color?.toColor(),
          strokeWidth: 2.0,
        );
        polylines.add(polyline);

        final stations = line?.stations ?? [];

        stations.forEach((station) {
          final id = station?.id;
          if (select.state.station != null && select.state.station != id) {
            return;
          }

          final location = station?.location;
          if (location == null) {
            return;
          }
          final latitude = location["latitude"];
          final longitude = location["longitude"];

          if (latitude == null || longitude == null) {
            return;
          }

          final point = LatLng(latitude, longitude);

          final List<Line> stationLines = station?.lines
              .map((payload) => payload.id)
              .map((id) => lines[id])
              .toList();
          final colors = stationLines
              .map((p) => p?.color)
              .map((e) => (e?.toString()?.toColor()))
              .toList();

          final marker = Marker(
            point: point,
            builder: (context) => DonutColors(
              colors: colors,
              radius: 5,
              centerRatio: 0.1,
              onTap: () => clickStation(hookContext, station),
            ),
          );

          markers.add(marker);
        });
      });
    }

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
            // PolylineLayerOptions(
            //   polylines: polylines,
            // ),
            TappablePolylineLayerOptions(
              polylineCulling: true,
              polylines: polylines,
              onTap: (TaggedPolyline polyline) =>
                  clickLine(context, polyline.tag),
            ),
            MarkerLayerOptions(
              markers: markers,
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

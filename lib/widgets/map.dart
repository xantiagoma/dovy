import 'package:flutter/material.dart';
import 'package:dovy/general.dart';

class Mapa extends HookWidget {
  const Mapa({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hookContext = useContext();
    final select = useProvider(systemSelectProvider);
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

    final polylines = <Polyline>[];
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

        final polyline = Polyline(
          points: points,
          color: line?.color?.toColor(),
          strokeWidth: 2,
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
              onTap: () => clickStation(hookContext, station, stationLines),
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
      },
    );
  }
}

void clickStation(BuildContext context, station, List lines) {
  showFlash(
    context: context,
    persistent: false,
    builder: (context, controller) {
      return Flash(
        controller: controller,
        backgroundColor: context.theme.scaffoldBackgroundColor.lighten(),
        margin: EdgeInsets.all(18),
        borderRadius: BorderRadius.circular(10),
        child: FlashBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                station["name"],
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  controller.dismiss();
                },
              ),
            ],
          ),
          message: Row(
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
        ),
      );
    },
  );
}

void clickPlace(BuildContext context, LatLng point) {
  showFlash(
    context: context,
    builder: (context, controller) {
      return Flash(
        controller: controller,
        backgroundColor: context.theme.scaffoldBackgroundColor.lighten(),
        margin: EdgeInsets.all(18),
        borderRadius: BorderRadius.circular(10),
        child: FlashBar(
          icon: Icon(Icons.info_outline),
          message: Consumer(
            builder: (context, watch, child) {
              final location = watch(locationDataProvider(point));

              return location.when(
                data: (data) {
                  return Text(data["display_name"]);
                },
                loading: () {
                  return Center(child: CircularProgressIndicator());
                },
                error: (e, s) {
                  return Text(e.toString());
                },
              );
            },
          ),
        ),
      );
    },
  );
}

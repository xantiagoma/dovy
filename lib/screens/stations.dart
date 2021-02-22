import 'package:flutter/material.dart';
import 'package:dovy/general.dart';

class StationsScreen extends StatefulHookWidget {
  const StationsScreen({
    Key key,
  }) : super(key: key);

  @override
  _StationsScreenState createState() => _StationsScreenState();
}

class _StationsScreenState extends State<StationsScreen>
    with AutomaticKeepAliveClientMixin<StationsScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final select = useProvider(selectProvider).state;
    final systemsList = useProvider(systemsProvider)?.data?.value;
    final lines = useProvider(linesProvider)?.data?.value;

    if (systemsList == null || lines == null) {
      return CircularProgressIndicator();
    }

    final systems = mapKeysFromList(systemsList, (System k) => k.id);
    final system = systems[select.system];
    final name = system.name;

    // TODO
    final stations = uniqBy(
      lines
          .map((line) => line.stations)
          .toList()
          .expand((element) => element)
          .toList(),
      (Station s) => s.id,
    );

    final linesBy = mapKeysFromList(lines, (Line l) => l.id);

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text("$name - Stations"),
          actions: <Widget>[
            // TODO
          ],
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, i) {
              final station = stations[i];
              final name = station.name;
              final lines = station.lines
                  .map((p) => p.id)
                  .map((id) => linesBy[id])
                  .toList();
              return InkWell(
                onTap: () {
                  context.navigateTo(
                    '/station/${station.id}',
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          for (final line in lines)
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Builder(builder: (context) {
                                final color =
                                    line?.color?.toColor() ?? Colors.white;
                                return Chip(
                                  backgroundColor: color,
                                  label: Text(
                                    line.name,
                                    style: TextStyle(
                                      color: color.inverseBW,
                                    ),
                                  ),
                                );
                              }),
                            ),
                        ],
                      ),
                      Text(name),
                    ],
                  ),
                ),
              );
            },
            childCount: stations.length,
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

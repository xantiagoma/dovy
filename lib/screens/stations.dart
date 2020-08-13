import 'package:dovy/general.dart';

class StationsScreen extends StatefulWidget {
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

    return MapStateBuilder(
      builder: (context, select, systemsList, linesList, s) {
        final systems = mapKeysFromList(systemsList, (k) => k["id"]);
        final system = systems[select.system];
        final name = system["name"];

        final stations = uniqBy(
          linesList
              .map((line) => line["stations"])
              .toList()
              .expand((element) => element)
              .toList(),
          (s) => s["id"],
        );

        final linesBy = mapKeysFromList(linesList, (s) => s["id"]);

        return CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text("$name - Stations"),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    final message = Flushbar(
                      title: "Options",
                      messageText: SelectSystem(),
                      margin: EdgeInsets.all(10),
                      borderRadius: 20,
                    );
                    context.show(message);
                  },
                )
              ],
            ),
            SliverPadding(
              padding: EdgeInsets.all(20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) {
                    final station = stations[i];
                    final name = station["name"];
                    final lines = station["lines"]
                        .map((p) => p["id"])
                        .map((id) => linesBy[id])
                        .toList();
                    return Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            for (final line in lines)
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Builder(builder: (context) {
                                  final color =
                                      (line["color"] as String).toColor();
                                  return Chip(
                                    backgroundColor: color,
                                    label: Text(
                                      line["name"],
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
                    );
                  },
                  childCount: stations.length,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

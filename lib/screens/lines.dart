import 'package:dovy/general.dart';

class LinesScreen extends StatefulHookWidget {
  const LinesScreen({
    Key key,
  }) : super(key: key);

  @override
  _LinesScreenState createState() => _LinesScreenState();
}

class _LinesScreenState extends State<LinesScreen>
    with AutomaticKeepAliveClientMixin<LinesScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MapStateBuilder(
        builder: (context, select, systemsList, lines, stationsList) {
      final systems = mapKeysFromList(systemsList, (k) => k["id"]);
      final system = systems[select.system];
      final name = system["name"];
      return CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("$name - Lines"),
          ),
          SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: buildGridView(lines), // TODO: Change
          )
        ],
      );
    });
  }

  SliverGrid buildGridView(List lines) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, i) {
          final line = lines[i];
          final color =
              (line["color"] as String).toColor().desaturate().lighten();
          return Material(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: InkWell(
              onTap: () {
                final msg = Flushbar(
                  message: line["name"],
                );
                context.show(msg);
              },
              child: Center(
                child: Text(
                  line["name"],
                  style: context.theme.textTheme.headline4.copyWith(
                    color: color.inverseBW,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
        childCount: lines.length,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

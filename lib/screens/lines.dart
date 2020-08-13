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
      return CustomScrollView(
        slivers: <Widget>[
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(20),
              sliver: buildGridView(lines), // TODO: Change
            ),
          ),
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
          return Material(
            color: (line["color"] as String).toColor().desaturate().lighten(),
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
                  style: context.theme.textTheme.headline2,
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

import 'package:dovy/general.dart';
import 'package:dovy/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

    final select = useProvider(systemSelectProvider).state;
    final systemsList = useProvider(systemsListProvider).data.value;
    final lines = useProvider(linesListProvider).data.value;

    if (systemsList == null || lines == null) {
      return CircularProgressIndicator();
    }

    final systems = mapKeysFromList(systemsList, (k) => k["id"]);
    final system = systems[select.system];
    final name = system["name"];

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text("$name - Lines"),
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
          sliver: buildGridView(lines),
        )
      ],
    );
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
            child: Center(
              child: Text(
                line["name"],
                style: context.theme.textTheme.headline4.copyWith(
                  color: color.inverseBW,
                ),
                textAlign: TextAlign.center,
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

import 'package:dovy/general.dart';

class LinesScreen extends StatefulWidget {
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

    return BlocBuilder<LinesCubit, BuiltList<Line<Station<String>>>>(
        builder: (context, snapshot) {
      if (snapshot == null) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      return CustomScrollView(
        slivers: <Widget>[
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(20),
              sliver: buildGridView(snapshot),
            ),
          ),
        ],
      );
    });
  }

  SliverGrid buildGridView(BuiltList<Line<Station<String>>> snapshot) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, i) {
          final line = snapshot[i];
          return Material(
            color: line.color.toColor().desaturate().lighten(),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: InkWell(
              onTap: () {
                final msg = Flushbar(
                  message: line.name,
                );
                context.show(msg);
              },
              child: Center(
                child: Text(
                  line.name,
                  style: context.theme.textTheme.headline2,
                ),
              ),
            ),
          );
        },
        childCount: snapshot.length,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

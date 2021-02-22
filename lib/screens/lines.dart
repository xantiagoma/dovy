import 'package:flutter/material.dart';
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

    final select = useProvider(selectProvider).state;
    final systemsList = useProvider(systemsProvider)?.data?.value ?? [];
    final lines = useProvider(linesProvider)?.data?.value ?? [];

    if (systemsList == null || lines == null) {
      return CircularProgressIndicator();
    }

    final systems = mapKeysFromList(systemsList, (System k) => k.id);
    final system = systems[select.system];
    final name = system.name;

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text("$name - Lines"),
          actions: <Widget>[],
        ),
        SliverPadding(
          padding: EdgeInsets.all(20),
          sliver: buildGridView(lines),
        )
      ],
    );
  }

  SliverGrid buildGridView(List<Line> lines) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, i) {
          final line = lines[i];
          final color = line.color.toColor().desaturate().lighten();
          return Material(
            color: color,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                context.navigateTo(
                  '/line/${line.id}',
                );
              },
              child: Center(
                child: Text(
                  line.name,
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

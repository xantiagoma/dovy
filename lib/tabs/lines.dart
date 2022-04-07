import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dovy/general.dart';

class LinesHomeTab extends StatefulHookConsumerWidget {
  const LinesHomeTab({
    Key? key,
  }) : super(key: key);

  @override
  _LinesHomeTabState createState() => _LinesHomeTabState();
}

class _LinesHomeTabState extends ConsumerState<LinesHomeTab>
    with AutomaticKeepAliveClientMixin<LinesHomeTab> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final systemsList = ref.watch(systemsProvider).asData?.value;
    final lines = ref.watch(linesProvider).asData?.value;
    final systemId = ref.watch(selectSystemProvider);

    if (systemsList == null || lines == null) {
      return Center(
        child: SpinKitFadingFour(
          color: Colors.white,
        ),
      );
    }

    final systems =
        mapKeysFromList(systemsList, (Map<String, dynamic> k) => k['id']);
    final system = systems[systemId];
    final name = system?['attributes']['name'];

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: context.theme.scaffoldBackgroundColor.darken(),
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

  SliverGrid buildGridView(List<Map<String, dynamic>> lines) {
    return SliverGrid(
      gridDelegate: kIsWeb
          ? SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            )
          : SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
      delegate: SliverChildBuilderDelegate(
        (context, i) {
          final line = lines[i];
          final color =
              getColor(line['attributes']['color'])!.desaturate().lighten();
          return Material(
            color: color,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                ref
                    .read(routerProvider)
                    .navigateTo(context, '/line/${line['id']}');
              },
              child: Center(
                child: Text(
                  line['attributes']['name'],
                  style: context.theme.textTheme.headline4!.copyWith(
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

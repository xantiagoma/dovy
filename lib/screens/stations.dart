import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dovy/general.dart';

class StationsScreen extends StatefulHookConsumerWidget {
  const StationsScreen({
    Key? key,
  }) : super(key: key);

  @override
  _StationsScreenState createState() => _StationsScreenState();
}

class _StationsScreenState extends ConsumerState<StationsScreen>
    with AutomaticKeepAliveClientMixin<StationsScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final systemId = ref.watch(selectSystemProvider);
    final systemsList = ref.watch(systemsProvider).asData?.value;
    final stations = ref.watch(stationsProvider).asData?.value;
    final router = ref.watch(routerProvider);

    if (stations == null) {
      return Center(
        child: SpinKitFadingFour(
          color: Colors.white,
        ),
      );
    }

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text("Stations"),
          backgroundColor: context.theme.scaffoldBackgroundColor.darken(),
          actions: <Widget>[
            // TODO
          ],
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, i) {
              final station = stations[i];
              final name = station['attributes']['name'];

              return InkWell(
                onTap: () {
                  router.navigateTo(
                    context,
                    '/station/${station['id']}',
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: kIsWeb ? 10 : 0,
                  ),
                  child: Row(
                    children: <Widget>[
                      // Row(
                      //   children: <Widget>[
                      //     for (final line in lines)
                      //       Padding(
                      //         padding: const EdgeInsets.only(right: 10),
                      //         child: Builder(builder: (context) {
                      //           final color =
                      //               getColor(line?.color) ?? Colors.white;
                      //           return Chip(
                      //             backgroundColor: color,
                      //             label: Text(
                      //               line!.name!,
                      //               style: TextStyle(
                      //                 color: color.inverseBW,
                      //               ),
                      //             ),
                      //           );
                      //         }),
                      //       ),
                      //   ],
                      // ),
                      Text(name!),
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

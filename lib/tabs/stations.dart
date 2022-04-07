import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dovy/general.dart';

class StationsHomeTab extends StatefulHookConsumerWidget {
  const StationsHomeTab({
    Key? key,
  }) : super(key: key);

  @override
  _StationsHomeTabState createState() => _StationsHomeTabState();
}

class _StationsHomeTabState extends ConsumerState<StationsHomeTab>
    with AutomaticKeepAliveClientMixin<StationsHomeTab> {
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
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Colors.white10,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: Row(
                    children: <Widget>[
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

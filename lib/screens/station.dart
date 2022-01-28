import 'package:dovy/general.dart';
import 'package:flutter/material.dart';

class StationScreen extends HookConsumerWidget {
  final int id;

  const StationScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final station = ref.watch(stationProvider(id)).asData?.value;
    final router = ref.watch(routerProvider);

    if (station == null) {
      return Scaffold(
        body: Center(
          child: SpinKitFadingFour(
            color: Colors.white,
          ),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(station['attributes']['name']),
          ),
          SliverToBoxAdapter(
            child: Text("Lines:"),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final line = station['attributes']['lines']['data'][index];
                return InkWell(
                  onTap: () {
                    router.navigateTo(context, '/line/${line['id']}');
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Chip(
                          label: Text(
                            line['attributes']['name'],
                            style: TextStyle(
                              color: getColor(line['attributes']['color'])!
                                  .inverseBW,
                            ),
                          ),
                          backgroundColor:
                              getColor(line['attributes']['color']),
                        ),
                      ),
                      if (line['attributes']['description'] != null)
                        Text(line['attributes']['description']),
                    ],
                  ),
                );
              },
              childCount: station['attributes']['lines']['data'].length,
            ),
          ),
        ],
      ),
    );
  }
}

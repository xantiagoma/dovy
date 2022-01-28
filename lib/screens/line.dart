import 'package:dovy/general.dart';
import 'package:flutter/material.dart';

class LineScreen extends HookConsumerWidget {
  final int id;

  const LineScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final line = ref.watch(lineProvider(id)).asData?.value;
    final router = ref.watch(routerProvider);

    if (line == null) {
      return Scaffold(
        body: Center(
          child: SpinKitFadingFour(
            color: Colors.white,
          ),
        ),
      );
    }

    final lineColor = getColor(line['attributes']['color']);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              "${line['attributes']['name']}: ${line['attributes']['description'] ?? ''}",
              style: TextStyle(color: lineColor?.inverseBW),
            ),
            backgroundColor: lineColor,
          ),
          SliverToBoxAdapter(
            child: Text("Stations:"),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final station = line['attributes']['stations']['data'][index];
              return InkWell(
                onTap: () {
                  router.navigateTo(context, '/station/${station['id']}');
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(station['attributes']['name']),
                ),
              );
            }, childCount: line['attributes']['stations']['data'].length),
          ),
        ],
      ),
    );
  }
}

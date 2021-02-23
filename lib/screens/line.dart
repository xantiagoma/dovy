import 'package:dovy/general.dart';
import 'package:flutter/material.dart';

class LineScreen extends HookWidget {
  final String id;

  const LineScreen({
    Key key,
    @required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final line = useProvider(lineProvider(id))?.data?.value;

    if (line == null) {
      return Scaffold(
        body: Center(
          child: SpinKitFadingFour(
            color: Colors.white,
          ),
        ),
      );
    }

    final lineColor = line.color.toColor();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              "${line.name}: ${line.description.body}",
              style: TextStyle(color: lineColor.inverseBW),
            ),
            backgroundColor: lineColor,
          ),
          SliverToBoxAdapter(
            child: Text("Stations:"),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final station = line.stations[index];
              return InkWell(
                onTap: () {
                  context.navigateTo('/station/${station.id}');
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(station.name),
                ),
              );
            }, childCount: line.stations.length),
          ),
        ],
      ),
    );
  }
}

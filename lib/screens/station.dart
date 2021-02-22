import 'package:dovy/general.dart';
import 'package:flutter/material.dart';

class StationScreen extends HookWidget {
  final String id;

  const StationScreen({
    Key key,
    @required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final station = useProvider(stationProvider(id))?.data?.value;

    if (station == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(station.name),
          ),
          SliverToBoxAdapter(
            child: Text("Lines:"),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final line = station.lines[index];
                return InkWell(
                  onTap: () {
                    context.navigateTo('/line/${line.id}');
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Chip(
                          label: Text(
                            line.name,
                            style: TextStyle(
                              color: line.color.toColor().inverseBW,
                            ),
                          ),
                          backgroundColor: line.color.toColor(),
                        ),
                      ),
                      Text(line.description.body),
                    ],
                  ),
                );
              },
              childCount: station.lines.length,
            ),
          ),
        ],
      ),
    );
  }
}

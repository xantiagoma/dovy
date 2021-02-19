import 'package:flutter/material.dart';
import 'package:dovy/general.dart';

final void Function() vCallback = () {};

class DonutColors extends StatelessWidget {
  final double radius;
  final double centerSpaceRadius;
  final List<Color> colors;
  final Color centerColor;
  final void Function() onTap;

  const DonutColors({
    Key key,
    @required this.colors,
    double radius = 12,
    double centerRatio = 0.6,
    this.centerColor = Colors.black,
    this.onTap,
  })  : this.radius = radius * (1 - centerRatio),
        this.centerSpaceRadius = radius * centerRatio,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? vCallback,
      child: PieChart(
        PieChartData(
          sectionsSpace: 0,
          centerSpaceRadius: 4,
          borderData: FlBorderData(
            show: false,
          ),
          centerSpaceColor: centerColor,
          sections: colors
              .map(
                (c) => PieChartSectionData(
                  color: c,
                  value: 1,
                  showTitle: false,
                  radius: radius,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

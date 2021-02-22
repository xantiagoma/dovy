import 'package:dovy/general.dart';
import 'package:flutter/material.dart';

class StationCard<T> extends HookWidget {
  final FlashController<T> controller;
  final String stationId;

  StationCard({
    Key key,
    @required this.controller,
    @required this.stationId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final station = useProvider(stationProvider(stationId))?.data?.value;

    final backgroundColor = context.theme.scaffoldBackgroundColor.lighten();
    final margin = EdgeInsets.all(18);
    final borderRadius = BorderRadius.circular(10);

    return Flash(
      controller: controller,
      backgroundColor: backgroundColor,
      margin: margin,
      borderRadius: borderRadius,
      child: FlashBar(
        showProgressIndicator: station == null,
        icon: IconButton(
          icon: Icon(Icons.arrow_upward),
          onPressed: () {
            controller.dismiss();
            context.navigateTo('/station/${station.id}');
          },
        ),
        primaryAction: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            controller.dismiss();
          },
        ),
        message: station != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    station.name,
                  ),
                  Row(
                    children: [
                      for (final line in station.lines)
                        Padding(
                          padding: EdgeInsets.only(right: 10),
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
                    ],
                  ),
                ],
              )
            : SizedBox(),
      ),
    );
  }
}

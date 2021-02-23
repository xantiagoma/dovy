import 'package:dovy/general.dart';
import 'package:flutter/material.dart';

class LineCard<T> extends HookWidget {
  final FlashController<T> controller;
  final String lineId;

  LineCard({
    Key key,
    @required this.controller,
    @required this.lineId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final line = useProvider(lineProvider(lineId))?.data?.value;

    final backgroundColor = context.theme.scaffoldBackgroundColor.lighten();
    final margin = EdgeInsets.all(18);
    final borderRadius = BorderRadius.circular(10);

    return Flash(
      controller: controller,
      backgroundColor: backgroundColor,
      margin: margin,
      borderRadius: borderRadius,
      child: FlashBar(
        showProgressIndicator: line == null,
        progressIndicatorBackgroundColor: Colors.transparent,
        icon: IconButton(
          icon: Icon(Icons.arrow_upward),
          onPressed: () {
            controller.dismiss();
            context.navigateTo('/line/${line.id}');
          },
        ),
        primaryAction: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            controller.dismiss();
          },
        ),
        message: line != null
            ? Row(
                children: [
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
                  Text(line.description.body),
                ],
              )
            : SizedBox(),
      ),
    );
  }
}

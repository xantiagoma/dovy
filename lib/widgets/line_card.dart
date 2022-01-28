import 'package:dovy/general.dart';
import 'package:flutter/material.dart';

class LineCard<T> extends HookConsumerWidget {
  final FlashController<T> controller;
  final int lineId;

  LineCard({
    Key? key,
    required this.controller,
    required this.lineId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final line = ref.watch(lineProvider(lineId)).asData?.value;
    final router = ref.watch(routerProvider);

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
            router.navigateTo(context, '/line/${line?['id']}');
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
                        line['name'],
                        style: TextStyle(
                          color: getColor(line['color'])?.inverseBW,
                        ),
                      ),
                      backgroundColor: getColor(line['color']),
                    ),
                  ),
                  Text(line['description']),
                ],
              )
            : SizedBox(),
      ),
    );
  }
}

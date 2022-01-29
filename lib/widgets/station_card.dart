import 'package:dovy/general.dart';
import 'package:flutter/material.dart';

class StationCard<T> extends HookConsumerWidget {
  final FlashController<T> controller;
  final int stationId;

  StationCard({
    Key? key,
    required this.controller,
    required this.stationId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final station = ref.watch(stationProvider(stationId)).asData?.value;
    final router = ref.watch(routerProvider);

    final backgroundColor = context.theme.scaffoldBackgroundColor.lighten();
    final margin = EdgeInsets.all(18);
    final borderRadius = BorderRadius.circular(10);

    return Flash(
      alignment: Alignment.bottomCenter,
      controller: controller,
      backgroundColor: backgroundColor,
      margin: margin,
      borderRadius: borderRadius,
      child: FlashBar(
        showProgressIndicator: station == null,
        progressIndicatorBackgroundColor: Colors.transparent,
        icon: IconButton(
          icon: Icon(Icons.arrow_upward),
          onPressed: () {
            controller.dismiss();
            router.navigateTo(context, '/station/${station?['id']}');
          },
        ),
        primaryAction: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            controller.dismiss();
          },
        ),
        content: station != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    station['attributes']['name'],
                  ),
                  Row(
                    children: [
                      for (final line in station['attributes']['lines']['data'])
                        Padding(
                          padding: EdgeInsets.only(right: 10),
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
                    ],
                  ),
                ],
              )
            : SizedBox(),
      ),
    );
  }
}

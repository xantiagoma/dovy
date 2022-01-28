import 'package:dovy/general.dart';
import 'package:flutter/material.dart';

class PlaceCard<T> extends HookConsumerWidget {
  final FlashController<T> controller;
  final LatLng point;

  PlaceCard({
    Key? key,
    required this.controller,
    required this.point,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = ref.watch(locationDataProvider(point));

    final backgroundColor = context.theme.scaffoldBackgroundColor.lighten();
    final margin = EdgeInsets.all(18);
    final borderRadius = BorderRadius.circular(10);

    return Flash(
      controller: controller,
      backgroundColor: backgroundColor,
      margin: margin,
      borderRadius: borderRadius,
      child: FlashBar(
        primaryAction: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            controller.dismiss();
          },
        ),
        message: location.when(
          data: (details) {
            return Text(details.displayName!);
          },
          loading: () {
            return Center(
              child: SpinKitPulse(
                color: Colors.white,
              ),
            );
          },
          error: (_, _st) => SizedBox(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:dovy/general.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: context.theme.primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
      ),
      child: InkWell(
        onTap: () {
          showFlash(
            context: context,
            builder: (context, controller) {
              return Flash(
                controller: controller,
                backgroundColor:
                    context.theme.scaffoldBackgroundColor.lighten(),
                margin: EdgeInsets.all(18),
                borderRadius: BorderRadius.circular(10),
                child: FlashBar(
                  title: Text("Options"),
                  message: SelectSystem(),
                ),
              );
            },
          );
        },
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Icon(Icons.settings),
        ),
      ),
    );
  }
}

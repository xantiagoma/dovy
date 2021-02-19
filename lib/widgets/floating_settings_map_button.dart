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
          final message = Flushbar(
            title: "Options",
            messageText: SelectSystem(),
            margin: EdgeInsets.all(10),
            borderRadius: 20,
          );
          context.show(message);
        },
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Icon(Icons.settings),
        ),
      ),
    );
  }
}

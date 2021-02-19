import 'package:flutter/material.dart';
import 'package:dovy/general.dart';

class MapScreen extends StatefulHookWidget {
  const MapScreen({
    Key key,
  }) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>
    with AutomaticKeepAliveClientMixin<MapScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Stack(
      children: <Widget>[
        Mapa(),
        Align(
          alignment: Alignment.bottomRight,
          child: SettingsButton(),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

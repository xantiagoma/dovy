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
      appBar: AppBar(),
      body: Container(
        child: Text('station: $station'),
      ),
    );
  }
}

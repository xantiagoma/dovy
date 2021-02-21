import 'package:dovy/general.dart';
import 'package:flutter/material.dart';

class LineScreen extends HookWidget {
  final String id;

  const LineScreen({
    Key key,
    @required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final line = useProvider(lineProvider(id))?.data?.value;

    if (line == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text('line: $line'),
      ),
    );
  }
}

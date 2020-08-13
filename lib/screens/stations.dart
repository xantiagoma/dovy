import 'package:dovy/general.dart';

class StationsScreen extends StatefulWidget {
  const StationsScreen({
    Key key,
  }) : super(key: key);

  @override
  _StationsScreenState createState() => _StationsScreenState();
}

class _StationsScreenState extends State<StationsScreen>
    with AutomaticKeepAliveClientMixin<StationsScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ListView.builder(
      itemCount: 0,
      itemBuilder: (context, i) {
        // final line = snapshot[i];
        // return Text('${line.code} - ${line.name}');
        return Text('Line');
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

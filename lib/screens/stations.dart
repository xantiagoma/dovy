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

    return BlocBuilder<StationsCubit, BuiltList<Station<Line<String>>>>(
        builder: (context, snapshot) {
      if (snapshot == null) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      return ListView.builder(
        itemCount: snapshot.length,
        itemBuilder: (context, i) {
          final line = snapshot[i];
          return Text('${line.code} - ${line.name}');
        },
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}

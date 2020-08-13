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

    return MapStateBuilder(
      builder: (context, select, systemsList, linesList, stations) {
        final stations = uniqBy(
          linesList
              .map((line) => line["stations"])
              .toList()
              .expand((element) => element)
              .toList(),
          (s) => s["id"],
        );

        return ListView.builder(
          itemCount: stations.length,
          itemBuilder: (context, i) {
            return Text(stations[i]["name"]);
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

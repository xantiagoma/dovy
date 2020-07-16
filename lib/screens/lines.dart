import 'package:dovy/general.dart';

class LinesScreen extends StatefulWidget {
  const LinesScreen({
    Key key,
  }) : super(key: key);

  @override
  _LinesScreenState createState() => _LinesScreenState();
}

class _LinesScreenState extends State<LinesScreen>
    with AutomaticKeepAliveClientMixin<LinesScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<LinesCubit, BuiltList<Line<Station<String>>>>(
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

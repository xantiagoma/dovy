import 'package:dovy/general.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Text(context.s.appDescription),
          FlatButton(
            color: context.theme.primaryColor,
            child: Text("Init"),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

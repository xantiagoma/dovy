import 'package:dovy/general.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        title: Text(
          context.s.appName,
          style: TextStyle(
            color: context.theme.primaryColor,
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Text(context.s.appDescription),
          Container(
            decoration: BoxDecoration(
              color: context.theme.accentColor,
              shape: BoxShape.circle,
            ),
            width: context.media.size.width,
            height: context.media.size.width,
            margin: EdgeInsets.all(context.media.size.width * 0.1),
            child: Lottie.asset(
              "assets/lottie/map-location.json",
              fit: BoxFit.contain,
            ),
          ),
          FlatButton(
            color: context.theme.primaryColor,
            child: Text("Start"),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

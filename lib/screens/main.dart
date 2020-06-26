import 'package:dovy/general.dart';

class MainScreen extends HookWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reverse = useState(false);

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
          GestureDetector(
            onTap: () {
              reverse.value = !reverse.value;
            },
            child: Container(
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
                animate: reverse.value,
              ),
            ),
          ),
          FlatButton(
            color: reverse.value
                ? context.theme.primaryColor
                : context.theme.accentColor,
            child: Text("Start"),
            onPressed: () {
              context.navigateTo(
                "/init",
                transition: TransitionType.cupertino,
              );
            },
          )
        ],
      ),
    );
  }
}

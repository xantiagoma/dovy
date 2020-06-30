import 'package:dovy/general.dart';

class MainScreen extends HookWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showLogin = useState(false);
    useEffect(() {
      context.i.allReady().then((_) {
        context.i<AuthService>().checkUser.then((value) {
          if (value) {
            context.navigateTo(
              "/home",
              clearStack: true,
              transition: TransitionType.fadeIn,
            );
          } else {
            showLogin.value = true;
          }
        });
      });
      return () => {};
    });

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
          if (showLogin.value)
            FlatButton(
              color: context.theme.primaryColor,
              child: Text("Start"),
              onPressed: () {
                context.navigateTo(
                  "/login",
                  transition: TransitionType.cupertino,
                );
              },
            )
          else
            CircularProgressIndicator()
        ],
      ),
    );
  }
}

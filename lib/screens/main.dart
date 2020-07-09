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
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Button(
                            text: 'Login',
                            onTap: () {
                              context.navigateTo(
                                "/login",
                                transition:
                                    TransitionType.materialFullScreenDialog,
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          // width: double.infinity,
                          // color: Colors.blue,
                          child: Button(
                            text: 'Sign Up',
                            onTap: () {
                              context.navigateTo(
                                "/signup",
                                transition: TransitionType.cupertino,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: Button(
                      text: "Forgot Password",
                      color: Colors.transparent,
                      borderRadius: BorderRadius.zero,
                      highlightColor: Colors.transparent,
                      customBorder: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(28.0),
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            )
          else
            Center(
              child: SpinKitDoubleBounce(
                color: context.theme.primaryColor,
              ),
            )
        ],
      ),
    );
  }
}

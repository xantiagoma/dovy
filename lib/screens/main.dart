import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dovy/general.dart';

class MainScreen extends HookWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showLogin = useState(false);
    final loaded = useProvider(loadedProvider);
    final user = useProvider(userProvider);

    useEffect(
      () {
        final u = user.when(
          data: identity,
          loading: () => null,
          error: (_, _s) => null,
        );
        if (loaded) {
          if (u != null) {
            Future.microtask(() {
              context.navigateTo(
                "/home",
                clearStack: true,
                transition: TransitionType.fadeIn,
              );
            });
          } else {
            showLogin.value = true;
          }
        }

        return () => {};
      },
      [loaded, user],
    );

    return Stack(
      children: <Widget>[
        Positioned(
          bottom: -150,
          left: 0,
          child: Container(
            width: context.media.size.height / 1.1,
            height: context.media.size.height / 1.1,
            decoration: BoxDecoration(
              color: context.theme.scaffoldBackgroundColor.darken(),
              borderRadius: BorderRadius.all(
                Radius.circular(context.media.size.height / 2),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 22,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: context.theme.scaffoldBackgroundColor.darken(),
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
          ),
        ),
        Column(
          children: <Widget>[
            SafeArea(
              child: Text(
                context.s.appName,
                style: context.theme.textTheme.headline3.copyWith(
                  color: context.theme.primaryColor,
                ),
              ),
            ),
            Text(context.s.appDescription),
            Container(
              decoration: BoxDecoration(
                color: context.theme.accentColor,
                shape: BoxShape.circle,
              ),
              width: min(context.media.size.width, 200),
              height: min(context.media.size.width, 200),
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
      ],
    );
  }
}

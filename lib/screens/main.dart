import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dovy/general.dart';

class MainScreen extends HookConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showLogin = useState(false);
    final loaded = ref.watch(loadedProvider);
    final user = ref.watch(userProvider);
    final router = ref.watch(routerProvider);

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
              router.navigateTo(
                context,
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
        Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 375,
              maxHeight: 600,
            ),
            child: Column(
              children: <Widget>[
                SafeArea(
                  child: Text(
                    context.s.appName,
                    style: context.theme.textTheme.headline3!.copyWith(
                      color: context.theme.primaryColor,
                    ),
                  ),
                ),
                Text(context.s.appDescription),
                Lottie.asset(
                  // "https://assets9.lottiefiles.com/packages/lf20_UVNhCL.json",
                  "assets/lottie/map-location.json",
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                  onWarning: print,
                  frameRate: FrameRate.max,
                  options: LottieOptions(
                    enableMergePaths: true,
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
                                    router.navigateTo(
                                      context,
                                      "/login",
                                      transition: TransitionType
                                          .materialFullScreenDialog,
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
                                    router.navigateTo(
                                      context,
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
          ),
        ),
      ],
    );
  }
}

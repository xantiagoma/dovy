import 'package:dovy/general.dart';
import 'package:dovy/hooks/rubber_animation.dart';
import 'package:dovy/hooks/scroll_controller.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animationController = useRubberAnimationController(
      duration: 1.seconds,
      upperBoundValue: AnimationControllerValue(percentage: 1.0),
    );
    final scrollController = useScrollController();

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: RubberBottomSheet(
          scrollController: scrollController,
          animationController: animationController,
          lowerLayer: Container(
            decoration: BoxDecoration(
              color: context.theme.accentColor,
            ),
            child: ListView(
              children: <Widget>[
                RaisedButton(
                  onPressed: () async {
                    await context.i<AuthService>().logout();
                    final msg = Flushbar(
                      icon: Icon(
                        Icons.info_outline,
                        color: Colors.orangeAccent,
                      ),
                      margin: EdgeInsets.all(8),
                      duration: 2.seconds,
                      borderRadius: 8,
                      message: 'Logged',
                    );
                    await msg.show(context);
                    context.navigateTo('/', clearStack: true);
                  },
                  child: Text("Logout"),
                ),
                RaisedButton(
                  onPressed: () {
                    animationController.animateTo(to: 1.0);
                  },
                  child: Text('Scroll'),
                )
              ],
            ),
          ),
          upperLayer: Container(
            decoration: BoxDecoration(
              color: context.theme.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            child: ListView(
              controller: scrollController,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Text("Holi"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

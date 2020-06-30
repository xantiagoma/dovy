import 'package:dovy/general.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
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
      ),
    );
  }
}

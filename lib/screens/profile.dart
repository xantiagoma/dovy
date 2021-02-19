import 'package:flutter/material.dart';
import 'package:dovy/general.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key key,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with AutomaticKeepAliveClientMixin<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text('Profile'),
        ),
        SliverToBoxAdapter(child: ProfileHook()),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ProfileHook extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final snap = useProvider(userDataProvider);

    final ipData = useProvider(ipDataProvider);

    print("snap: $snap");

    // if (snap.data == null) {
    //   return Center(child: CircularProgressIndicator());
    // }

    // final Map<String, dynamic> user = snap.data.data['me'];

    return Column(
      children: <Widget>[
        snap.when(
          data: (data) {
            return Column(
              children: [
                Text(
                  '@${data["username"]}',
                  style: context.theme.textTheme.headline5,
                ),
                Text(
                  data["email"],
                  style: context.theme.textTheme.headline6,
                ),
              ],
            );
          },
          loading: () {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
          error: (e, _) {
            return Text(e.toString());
          },
        ),
        ipData.when(
          data: (data) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Table(
                children: [
                  for (final entry in data.entries)
                    TableRow(children: [
                      Text(entry.key),
                      Text(entry.value.toString()),
                    ]),
                ],
              ),
            );
          },
          loading: () {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
          error: (e, _) {
            return Text(e.toString());
          },
        ),
        Button(
          onTap: () async {
            final authService = context.read(authServiceProvider);
            await authService.logout();
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
          width: context.media.size.width / 3,
          text: "Logout",
        ),
      ],
    );
  }
}

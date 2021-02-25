import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dovy/general.dart' hide Path;

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
    final snap = useProvider(userProvider);
    final ipData = useProvider(ipDataProvider);

    return Column(
      children: <Widget>[
        snap.when(
          data: (data) {
            if (data == null) {
              return Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                Row(
                  children: [
                    if (data.firstname != null)
                      Text(
                        data.firstname ?? '',
                        style: context.theme.textTheme.headline5,
                      ),
                    if (data.lastname != null)
                      Text(
                        data.lastname ?? '',
                        style: context.theme.textTheme.headline5,
                      ),
                  ],
                ),
                Text(
                  '@${data.username}',
                  style: context.theme.textTheme.headline5,
                ),
                Text(
                  data.email,
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
              child: Text(data.ip),
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

            showFlash(
              context: context,
              duration: Duration(seconds: 3),
              builder: (context, controller) {
                return Flash(
                  controller: controller,
                  backgroundColor:
                      context.theme.scaffoldBackgroundColor.lighten(),
                  margin: EdgeInsets.all(18),
                  borderRadius: BorderRadius.circular(10),
                  child: FlashBar(
                    icon: Icon(
                      Icons.info_outline,
                      color: Colors.orangeAccent,
                    ),
                    message: Text("Logged out"),
                  ),
                );
              },
            );
            context.navigateTo('/', clearStack: true);
          },
          width: context.media.size.width / 3,
          text: "Logout",
        ),
      ],
    );
  }
}

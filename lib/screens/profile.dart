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
        SliverToBoxAdapter(
          child: FutureBuilder<User>(
            future: GetIt.I<CmsService>()
                .s
                .findOne('users', 'me')
                .then((value) => value.data)
                .then(
                  (value) => value.load(User.fromJson),
                ),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Center(child: CircularProgressIndicator());
              }

              final user = snapshot.data;
              return Column(
                children: <Widget>[
                  Text(
                    '@${user.username}',
                    style: context.theme.textTheme.headline5,
                  ),
                  Text(
                    user.email,
                    style: context.theme.textTheme.headline6,
                  ),
                  Text(
                    user.created.toHumanString(),
                    style: context.theme.textTheme.subtitle1,
                  ),
                  buildLogoutButton(context),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildLogoutButton(BuildContext context) {
    return Button(
      onTap: () async {
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
      width: context.media.size.width / 3,
      text: "Logout",
    );
  }

  @override
  bool get wantKeepAlive => true;
}

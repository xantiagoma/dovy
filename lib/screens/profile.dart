import 'package:dovy/general.dart';
import 'package:dovy/hooks/graphql.dart';

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
    final snap = useQuery(QueryOptions(
      documentNode: gql("""
        query {
          me {
            username
            email
          }
        }
      """),
    ));

    if (snap.data == null) {
      return Center(child: CircularProgressIndicator());
    }
    if (snap.data.hasException) {
      return Text("Error");
    }
    final Map<String, dynamic> user = snap.data.data['me'];

    return Column(
      children: <Widget>[
        Text(
          '@${user["username"]}',
          style: context.theme.textTheme.headline5,
        ),
        Text(
          user["email"],
          style: context.theme.textTheme.headline6,
        ),
        FutureBuilder<Map<String, dynamic>>(
          future: LocationService.getIpInfo(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Table(
                children: [
                  for (final entry in snapshot.data.entries)
                    TableRow(children: [
                      Text(entry.key),
                      Text(entry.value.toString()),
                    ]),
                ],
              ),
            );
          },
        ),
        Button(
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
        ),
      ],
    );
  }
}

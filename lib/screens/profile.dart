import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dovy/general.dart' hide Path;

class ProfileScreen extends StatefulHookConsumerWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with AutomaticKeepAliveClientMixin<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final loaded = ref.watch(loadedProvider);
    final user = ref.watch(userProvider).asData?.value;

    if (!loaded) {
      return Center(
        child: SpinKitRing(
          color: Colors.white,
        ),
      );
    } else if (loaded && user != null) {
      return CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Profile'),
          ),
          SliverToBoxAdapter(child: ProfileHook()),
        ],
      );
    } else {
      return CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Login'),
            backgroundColor: context.theme.scaffoldBackgroundColor.darken(),
          ),
          SliverFillRemaining(
            child: MainScreen(),
          ),
        ],
      );
    }
  }

  @override
  bool get wantKeepAlive => true;
}

class ProfileHook extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snap = ref.watch(userProvider);
    final ipData = ref.watch(ipDataProvider);
    final router = ref.watch(routerProvider);

    return Column(
      children: <Widget>[
        snap.when(
          data: (data) {
            if (data == null) {
              return Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                Text(
                  data['username'],
                  style: context.theme.textTheme.headline6,
                ),
                Text(
                  data['email'],
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
        if (!kIsWeb)
          ipData.when(
            data: (data) {
              if (data == null) {
                return SizedBox.shrink();
              }
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(data.ip!),
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
            final authService = ref.read(authServiceProvider);
            await authService!.logout();

            showFlash(
              context: context,
              duration: Duration(seconds: 3),
              builder: (context, controller) {
                return Flash(
                  alignment: Alignment.bottomCenter,
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
                    content: Text("Logged out"),
                  ),
                );
              },
            );
            router.navigateTo(context, '/', clearStack: true);
          },
          width: context.media.size.width / 3,
          text: "Logout",
        ),
      ],
    );
  }
}

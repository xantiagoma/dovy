import 'package:built_collection/built_collection.dart';
import 'package:dovy/general.dart';
// import 'package:dovy/hooks/rubber_animation.dart';
// import 'package:dovy/hooks/scroll_controller.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(
      initialLength: 5,
    );

    final index = useState(0);

    useEffect(() {
      final listener = () {
        index.value = tabController.index;
      };
      tabController.addListener(listener);
      return () => tabController.removeListener(listener);
    }, [tabController]);

    return Scaffold(
      bottomNavigationBar: buildBottomNavigation(tabController, context),
      body: buildTabs(tabController, index.value),
    );
  }

  // Widget buildBottomSheet() {
  //       final animationController = useRubberAnimationController(
  //     duration: 1.seconds,
  //     upperBoundValue: AnimationControllerValue(percentage: 1.0),
  //     lowerBoundValue: AnimationControllerValue(percentage: 0.1),
  //     halfBoundValue: AnimationControllerValue(percentage: 1.3 / 2),
  //   );
  //   final scrollController = useScrollController();
  //   RubberBottomSheet(
  //         scrollController: scrollController,
  //         animationController: animationController,
  //         // menuLayer: buildBottomNavigation(tabController),
  //         lowerLayer: buildLowerLayer(mapController, tabController),
  //         upperLayer: buildSheet(scrollController, animationController),
  //       ),
  //     ),
  // }

  Widget buildSheet(ScrollController scrollController,
      RubberAnimationController animationController) {
    final context = useContext();
    return Container(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  animationController.animateTo(to: 1.0);
                },
                child: Text('Scroll'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTabs(
    TabController tabController,
    int index,
  ) {
    return TabBarView(
      controller: tabController,
      physics: index == 0 ? NeverScrollableScrollPhysics() : null,
      children: [
        MapScreen(),
        Center(
          child: Text("2"),
        ),
        Center(
          child: Text("3"),
        ),
        MessagesScreen(),
        ProfileScreen(),
      ],
    );
  }

  Widget buildBottomNavigation(
      TabController tabController, BuildContext context) {
    return ConvexAppBar(
      controller: tabController,
      backgroundColor: context.theme.scaffoldBackgroundColor.darken(),
      top: -30,
      items: [
        TabItem(icon: Icons.location_on, title: 'Map'),
        TabItem(icon: Icons.map, title: 'Discovery'),
        TabItem(icon: Icons.add, title: 'Add'),
        TabItem(icon: Icons.message, title: 'Message'),
        TabItem(icon: Icons.people, title: 'Profile'),
      ],
      initialActiveIndex: 0, //optional, default as 0
      // onTap: (int i) => print('click index=$i'),
    );
  }
}

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({
    Key key,
  }) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen>
    with AutomaticKeepAliveClientMixin<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(itemBuilder: (ctx, i) {
      return Container(
        child: Text("Item: $i"),
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

class MapScreen extends StatelessWidget {
  const MapScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Multibloc");

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PositionCubit(null),
        ),
        BlocProvider(
          create: (context) => StationsCubit(null)..load(),
        ),
        BlocProvider(
          create: (context) => LinesCubit(null)..load(),
        ),
      ],
      child: BlocBuilder<StationsCubit, BuiltList<Station>>(
        builder: (context, state) => BlocBuilder<LinesCubit, BuiltList<Line>>(
            builder: (context, snapshot) {
          return Mapa();
        }),
      ),
    );
  }
}

class Mapa extends HookWidget {
  const Mapa({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cmsConfigsMemo = useMemoized(() => context.i<CmsService>().configs);
    final cmsConfigsMemo$ = useFuture(cmsConfigsMemo);

    if (cmsConfigsMemo$.data == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    final mapController = MapController();

    final options = cmsConfigsMemo$.data;
    final String mapTileUrl = options['map_tile_url'];
    // 'https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}{r}.png'
    final List<String> mapTileSubdomains = List.from(
      options['map_tile_subdomains'],
    );
    // ['a', 'b', 'c']
    final Map<String, String> mapTileAdditionalOptions = Map.from(
      options['map_tile_additional_options'],
    );
    // {'r': '@2x',}

    final LatLng mapTileCenter = Map.from(
          options['map_tile_center'],
        ).cast<String, num>().latlng ??
        LatLng(37.42796133580664, -122.085749655962);

    final double mapTileZoom = options['map_tile_zoom'].toDouble();

    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        center: mapTileCenter,
        zoom: mapTileZoom,
        maxZoom: 18.49,
        minZoom: 2,
        onPositionChanged: (position, _) =>
            context.bloc<PositionCubit>().change(position),
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: mapTileUrl,
          subdomains: mapTileSubdomains,
          additionalOptions: mapTileAdditionalOptions,
          backgroundColor: context.theme.scaffoldBackgroundColor,
        ),
        MarkerLayerOptions(
          markers: context
              .bloc<StationsCubit>()
              .state
              .map(
                (s) => Marker(
                  point: s.latlng,
                  builder: (context) => IconButton(
                    icon: Icon(Icons.place),
                    onPressed: () {
                      context.show(
                        Flushbar(
                          title: s.name,
                          message: s.lines.toString(),
                          duration: 1.5.seconds,
                        ),
                      );
                    },
                  ),
                ),
              )
              .toList(),
        )
      ],
    );
  }
}

import 'package:dovy/general.dart';
import 'package:dovy/hooks/tab_controller.dart';
import 'package:flutter/gestures.dart';
// import 'package:dovy/hooks/rubber_animation.dart';
// import 'package:dovy/hooks/scroll_controller.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cmsConfigsMemo = useMemoized(() => context.i<CmsService>().configs);
    final cmsConfigsMemoFuture = useFuture(cmsConfigsMemo);
    // final cbmController = useState(CircularBottomNavigationController(0));

    final mapController = useMemoized(
      () => cmsConfigsMemoFuture.data == null
          ? null
          : createMapController(cmsConfigsMemoFuture.data),
      [cmsConfigsMemoFuture],
    );

    final tabController = useTabController();

    final index = useState(0);

    useEffect(() {
      final listener = () {
        index.value = tabController.index;
      };
      tabController.addListener(listener);
      return () => tabController.removeListener(listener);
    }, [tabController]);

    return Scaffold(
      bottomNavigationBar: buildBottomNavigation(tabController),
      body: buildTabs(mapController, tabController, index.value),
    );
  }

  StatefulMapController createMapController(Map<String, dynamic> options) {
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

    final s = StatefulMapController(
      mapController: MapController(),
      customTileLayer: TileLayerOptions(
        urlTemplate: mapTileUrl,
        subdomains: mapTileSubdomains,
        additionalOptions: mapTileAdditionalOptions,
      ),
      tileLayerType: TileLayerType.normal,
    )..mapOptions = MapOptions(
        center: mapTileCenter,
        zoom: mapTileZoom,
      );
    return s;
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
    StatefulMapController mapController,
    TabController tabController,
    int index,
  ) {
    return TabBarView(
      controller: tabController,
      physics: index == 0 ? NeverScrollableScrollPhysics() : null,
      children: [
        MapScreen(
          mapController: mapController,
        ),
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
    TabController tabController,
  ) {
    return ConvexAppBar(
      controller: tabController,
      backgroundColor: Colors.blueGrey.shade900,
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
    return Center(
      child: Button(
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
    );
  }
}

class MapScreen extends StatelessWidget {
  final StatefulMapController mapController;

  const MapScreen({
    Key key,
    @required this.mapController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (mapController == null) {
        return CircularProgressIndicator();
      }
      return FlutterMap(
        mapController: mapController.mapController,
        options: mapController.mapOptions,
        layers: [
          mapController.tileLayer,
          MarkerLayerOptions(
            markers: mapController.markers,
          ),
        ],
      );
    });
  }
}

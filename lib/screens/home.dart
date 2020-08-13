import 'package:dovy/general.dart';

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
        LinesScreen(),
        StationsScreen(),
        SearchScreen(),
        ProfileScreen(),
      ],
    );
  }

  Widget buildBottomNavigation(
    TabController tabController,
    BuildContext context,
  ) {
    return ConvexAppBar(
      controller: tabController,
      backgroundColor: context.theme.scaffoldBackgroundColor.darken(),
      top: -30,
      items: [
        TabItem(icon: Icons.location_on, title: 'Map'),
        TabItem(icon: MdiIcons.chartTimelineVariant, title: 'Lines'),
        TabItem(icon: Icons.trip_origin, title: 'Stations'),
        TabItem(icon: Icons.search, title: 'Search'),
        TabItem(icon: Icons.people, title: 'Profile'),
      ],
      initialActiveIndex: 0, //optional, default as 0
    );
  }
}

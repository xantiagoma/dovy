import 'package:flutter/material.dart';
import 'package:dovy/general.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
    );
  }
}

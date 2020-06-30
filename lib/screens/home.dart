import 'package:dovy/general.dart';
import 'package:dovy/hooks/rubber_animation.dart';
import 'package:dovy/hooks/scroll_controller.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animationController = useRubberAnimationController(
      duration: 1.seconds,
      upperBoundValue: AnimationControllerValue(percentage: 1.0),
    );
    final scrollController = useScrollController();

    final sMapController = useState<StatefulMapController>(
      StatefulMapController(
        mapController: MapController(),
        customTileLayer: TileLayerOptions(
          urlTemplate:
              'https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}{r}.png',
          subdomains: ['a', 'b', 'c'],
          additionalOptions: {
            'r': '@2x',
          },
        ),
        tileLayerType: TileLayerType.normal,
      )
        ..mapOptions = MapOptions(
          center: LatLng(37.42796133580664, -122.085749655962),
          zoom: 13.0,
        )
        ..addMarker(
          marker: Marker(
            builder: (context) => Icon(Icons.location_on),
            point: LatLng(37.42796133580664, -122.085749655962),
          ),
          name: 'current_pin',
        ),
    );

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (v) async {
              switch (v) {
                case 'Logout':
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
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return ["Logout"].map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Container(
        child: RubberBottomSheet(
          scrollController: scrollController,
          animationController: animationController,
          lowerLayer: Container(
            decoration: BoxDecoration(
              color: context.theme.accentColor,
            ),
            child: FlutterMap(
              mapController: sMapController.value.mapController,
              options: sMapController.value.mapOptions,
              layers: [
                sMapController.value.tileLayer,
                MarkerLayerOptions(
                  markers: sMapController.value.markers,
                ),
              ],
            ),
          ),
          upperLayer: Container(
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
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:dovy/general.dart';

class MapScreen extends StatefulHookWidget {
  const MapScreen({
    Key key,
  }) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>
    with AutomaticKeepAliveClientMixin<MapScreen> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final select = useProvider(selectProvider);
    final system =
        useProvider(systemProvider(select.state.system))?.data?.value;
    final systems = useProvider(systemsProvider)?.data?.value ?? [];
    final showSelector = useState(false);

    return Stack(
      children: <Widget>[
        Mapa(),
        if (!showSelector.value)
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 10,
                bottom: 10,
              ),
              child: Material(
                color: context.theme.primaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
                child: InkWell(
                  onTap: () {
                    showSelector.value = true;
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.settings),
                  ),
                ),
              ),
            ),
          ),
        if (showSelector.value)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 150,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: context.theme.scaffoldBackgroundColor.lighten(),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      left: 40,
                      right: 40,
                    ),
                    child: SelectSystem(),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.arrow_downward),
                      onPressed: () {
                        showSelector.value = false;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (system != null)
          Align(
            alignment: Alignment.topCenter,
            child: SafeArea(
              child: Material(
                color: context.theme.primaryColor,
                borderRadius: BorderRadius.circular(50),
                child: InkWell(
                  onTap: systems.isNotEmpty
                      ? () {
                          showFlash(
                            context: context,
                            builder: (context, controller) {
                              return Flash.dialog(
                                controller: controller,
                                alignment: Alignment.topCenter,
                                margin: const EdgeInsets.only(
                                  top: 50,
                                  left: 80,
                                  right: 80,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                backgroundColor:
                                    context.theme.scaffoldBackgroundColor,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    for (final system in systems)
                                      InkWell(
                                        onTap: () {
                                          select.state =
                                              select.state.setSystem(system.id);
                                          controller.dismiss();
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 40,
                                            vertical: 15,
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(system.name),
                                        ),
                                      )
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      : null,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 20,
                    ),
                    child: Text(system.name),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

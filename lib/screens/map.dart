import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dovy/general.dart';

class MapScreen extends StatefulHookWidget {
  const MapScreen({
    Key? key,
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
    final system = useProvider(systemProvider(select.state.system)).data?.value;
    final systems = useProvider(systemsProvider).data?.value ?? [];
    final showSelector = useState(false);
    final flashController = useState<FlashController?>(null);

    return Stack(
      children: <Widget>[
        Mapa(),
        Align(
          alignment: Alignment.topLeft,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        context.read(mapControllerProvider).zoomBy(1);
                      },
                    ),
                    Container(
                      color: Colors.blueGrey,
                      height: 1,
                      width: 30,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.remove,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        context.read(mapControllerProvider).zoomBy(-1);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
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
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
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
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                      right: 40,
                    ),
                    child: Center(
                      child: SelectSystem(),
                    ),
                  ),
                  Positioned(
                    top: -15,
                    right: -15,
                    child: Material(
                      color: context.theme.scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(50),
                      child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          showSelector.value = false;
                        },
                      ),
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
              child: Padding(
                padding: EdgeInsets.only(top: kIsWeb ? 10 : 0),
                child: Material(
                  color: context.theme.primaryColor,
                  borderRadius: BorderRadius.circular(50),
                  child: InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    onTap: systems.isNotEmpty
                        ? () async {
                            if (flashController.value != null) {
                              flashController.value!.dismiss();
                              flashController.value = null;
                              return;
                            }

                            await showFlash(
                              context: context,
                              builder: (context, controller) {
                                Future.microtask(() {
                                  try {
                                    flashController.value = controller;
                                  } catch (_) {}
                                });

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
                                            select.state = select.state
                                                .setSystem(system.id!);
                                            controller.dismiss();
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 40,
                                              vertical: 15,
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(system.name!),
                                          ),
                                        )
                                    ],
                                  ),
                                );
                              },
                            );

                            flashController.value = null;
                          }
                        : null,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 20,
                      ),
                      child: Text(system.name!),
                    ),
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

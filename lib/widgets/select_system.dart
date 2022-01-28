import 'package:flutter/material.dart';
import 'package:dovy/general.dart';

class SelectSystem extends HookConsumerWidget {
  const SelectSystem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lineId = ref.watch(selectLineProvider);
    final stationId = ref.watch(selectStationProvider);

    final lines = ref.watch(linesProvider).asData?.value ?? [];
    final stations = ref.watch(stationsProvider).asData?.value ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (lines.isNotEmpty)
          Material(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(5),
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<int>(
                isExpanded: true,
                underline: DropdownButtonHideUnderline(child: Container()),
                hint: Text("Select a line"),
                value: lineId,
                icon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    ref
                        .read(selectLineProvider.notifier)
                        .update((state) => null);
                  },
                ),
                items: [
                  for (final line in lines)
                    DropdownMenuItem<int>(
                      value: line['id'],
                      child: Text(line['attributes']['name']),
                    )
                ],
                onChanged: (val) {
                  ref.read(selectLineProvider.notifier).update((state) => val);
                },
              ),
            ),
          ),
        SizedBox(
          height: 10,
        ),
        if (stations.isNotEmpty && lineId != null)
          Material(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(5),
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<int>(
                isExpanded: true,
                underline: DropdownButtonHideUnderline(child: Container()),
                hint: Text("Select a station"),
                value: stationId,
                icon: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    ref
                        .read(selectStationProvider.notifier)
                        .update((state) => null);
                  },
                ),
                items: [
                  for (final station in stations)
                    DropdownMenuItem<int>(
                      value: station['id'],
                      child: Text(station['attributes']['name']),
                    )
                ],
                onChanged: (val) {
                  ref
                      .read(selectStationProvider.notifier)
                      .update((state) => val);
                },
              ),
            ),
          ),
      ],
    );
  }
}

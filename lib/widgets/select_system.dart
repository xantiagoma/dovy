import 'package:flutter/material.dart';
import 'package:dovy/general.dart' hide Listener;

class SelectSystem extends HookWidget {
  const SelectSystem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectState = useProvider(selectProvider);
    final lines = useProvider(linesProvider).data?.value ?? [];
    final stations = useProvider(stationsProvider).data?.value ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (lines.isNotEmpty)
          DropdownButton(
            isExpanded: true,
            hint: Text("Select a line"),
            value: selectState.state.line,
            icon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                selectState.state = selectState.state.setLine(null);
              },
            ),
            items: [
              for (final line in lines)
                DropdownMenuItem<String>(
                  value: line.id,
                  child: Text(line.name),
                )
            ],
            onChanged: (val) {
              selectState.state = selectState.state.setLine(val);
            },
          ),
        if (stations.isNotEmpty && selectState.state.line != null)
          DropdownButton(
            isExpanded: true,
            hint: Text("Select a station"),
            value: selectState.state.station,
            icon: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                selectState.state = selectState.state.setStation(null);
              },
            ),
            items: [
              for (final station in stations)
                DropdownMenuItem<String>(
                  value: station.id,
                  child: Text(station.name),
                )
            ],
            onChanged: (val) {
              selectState.state = selectState.state.setStation(val);
            },
          ),
      ],
    );
  }
}

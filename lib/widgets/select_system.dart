import 'package:flutter/material.dart';
import 'package:dovy/general.dart';

class SelectSystem extends HookWidget {
  const SelectSystem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final systemSelectState$ = useProvider(systemSelectProvider);
    final systemsListState$ = useProvider(systemsListProvider);
    final linesListState$ = useProvider(linesListProvider);
    final stationsListState$ = useProvider(stationsListProvider);

    final systemSelectState = systemSelectState$.state;
    final systemsListState = systemsListState$.data?.value ?? [];
    final linesListState = linesListState$.data?.value ?? [];
    final stationsListState = stationsListState$.data?.value ?? [];

    return Column(
      children: <Widget>[
        if (systemsListState.isNotEmpty)
          SearchableDropdown.single(
            value: systemSelectState.system,
            items: systemsListState
                .map(
                  (system) => DropdownMenuItem(
                    child: Text(system["name"]),
                    value: system["id"],
                  ),
                )
                .toList(),
            onChanged: (res) {
              systemSelectState$.state =
                  systemSelectState$.state.setSystem(res);
            },
            displayClearIcon: false,
            onClear: () {
              systemSelectState$.state =
                  systemSelectState$.state.setSystem(null);
            },
            hint: "System",
            searchHint: "Select a System",
          ),
        if (linesListState.isNotEmpty)
          SearchableDropdown.single(
            value: systemSelectState.line,
            items: linesListState
                .map(
                  (line) => DropdownMenuItem(
                    child: Text(line["name"]),
                    value: line["id"],
                  ),
                )
                .toList(),
            onChanged: (res) {
              systemSelectState$.state = systemSelectState$.state.setLine(res);
            },
            onClear: () {
              systemSelectState$.state = systemSelectState$.state.setLine(null);
            },
            hint: "Line",
            searchHint: "Select a Line",
          ),
        if (stationsListState.isNotEmpty)
          SearchableDropdown.single(
            value: systemSelectState.station,
            items: stationsListState
                .map(
                  (line) => DropdownMenuItem(
                    child: Text(line["name"]),
                    value: line["id"],
                  ),
                )
                .toList(),
            onChanged: (res) {
              systemSelectState$.state =
                  systemSelectState$.state.setStation(res);
            },
            onClear: () {
              systemSelectState$.state =
                  systemSelectState$.state.setStation(null);
            },
            hint: "Station",
            searchHint: "Select a Station",
          ),
      ],
    );
  }
}

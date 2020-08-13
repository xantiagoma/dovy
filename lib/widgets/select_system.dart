import 'package:dovy/general.dart';
import 'package:dovy/hooks/graphql.dart';

class SelectSystem extends HookWidget {
  const SelectSystem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final systemSelectBloc = useBloc<SystemSelectCubit>();

    return BlocBuilder<SystemsListCubit, List<dynamic>>(
        builder: (context, systemsListState) {
      return BlocBuilder<LinesListCubit, List<dynamic>>(
          builder: (context, linesListState) {
        return BlocBuilder<StationsListCubit, List<dynamic>>(
            builder: (context, stationsListState) {
          return BlocBuilder<SystemSelectCubit, SystemSelectState>(
              builder: (context, systemSelectState) {
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
                    onChanged: systemSelectBloc.selectSystem,
                    displayClearIcon: false,
                    onClear: () => systemSelectBloc.selectSystem(null),
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
                    onChanged: systemSelectBloc.selectLine,
                    onClear: () => systemSelectBloc.selectLine(null),
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
                    onChanged: systemSelectBloc.selectStation,
                    onClear: () => systemSelectBloc.selectStation(null),
                    hint: "Station",
                    searchHint: "Select a Station",
                  ),
              ],
            );
          });
        });
      });
    });
  }
}

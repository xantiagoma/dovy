import 'package:dovy/general.dart';

typedef MapStateBuilderFunction = Widget Function(
  BuildContext context,
  SystemSelectState systemSelectState,
  List systemsListState,
  List linesListState,
  List stationsListState,
);

class MapStateBuilder extends StatelessWidget {
  MapStateBuilder({Key key, @required this.builder}) : super(key: key);

  final MapStateBuilderFunction builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SystemsListCubit, List<dynamic>>(
        builder: (_, systemsListState) {
      return BlocBuilder<LinesListCubit, List<dynamic>>(
          builder: (_, linesListState) {
        return BlocBuilder<StationsListCubit, List<dynamic>>(
            builder: (_, stationsListState) {
          return BlocBuilder<SystemSelectCubit, SystemSelectState>(
              builder: (_, systemSelectState) {
            return builder(context, systemSelectState, systemsListState,
                linesListState, stationsListState);
          });
        });
      });
    });
  }
}

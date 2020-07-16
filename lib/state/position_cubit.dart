import 'package:dovy/general.dart';
import 'package:built_collection/built_collection.dart';

class PositionCubit extends Cubit<MapPosition> {
  PositionCubit(MapPosition state) : super(state);

  void change(MapPosition mapPosition) => emit(mapPosition);
}

class StationsCubit extends Cubit<BuiltList<Station<Line<String>>>> {
  StationsCubit() : super(BuiltList<Station<Line<String>>>());

  void load() async {
    print("StationsCubit loading...");
    final stations = await GetIt.I<CmsService>().getStations();
    emit(stations);
    return;
  }
}

class LinesCubit extends Cubit<BuiltList<Line<Station<String>>>> {
  LinesCubit() : super(BuiltList<Line<Station<String>>>());

  void load() async {
    print("LinesCubit loading...");
    final lines = await GetIt.I<CmsService>().getLines();
    emit(lines);
    return;
  }
}

import 'package:dovy/general.dart';
import 'package:built_collection/built_collection.dart';

class PositionCubit extends Cubit<MapPosition> {
  PositionCubit(MapPosition state) : super(state);

  void change(MapPosition mapPosition) => emit(mapPosition);
}

class StationsCubit extends Cubit<BuiltList<Station<Line<String>>>> {
  StationsCubit(MapPosition state) : super(BuiltList<Station<Line<String>>>());

  void load() async {
    print("StationsCubit loading...");
    final m = (await GetIt.I<CmsService>().s.find('stations'))
        .map((e) => e.data)
        .toList();

    final o = serializers.deserialize(
      m,
      specifiedType: FullType(
        BuiltList,
        [
          FullType(
            Station,
            [
              FullType(
                Line,
                [
                  FullType(
                    String,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
    emit(o);
    return;
  }
}

class LinesCubit extends Cubit<BuiltList<Line>> {
  LinesCubit(MapPosition state) : super(BuiltList<Line>());

  void load() async {
    print("LinesCubit loading...");
    // final m = (await GetIt.I<CmsService>().s.find('Lines'))
    //     .map(
    //       (e) => Line.fromJson(e.data),
    //     )
    //     .toBuiltList();
    // print(m);
    // emit(m);
    return;
  }
}

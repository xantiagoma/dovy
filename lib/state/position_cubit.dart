import 'package:dovy/general.dart';

class PositionCubit extends Cubit<MapPosition> {
  PositionCubit() : super(null);

  void change(MapPosition mapPosition) => emit(mapPosition);
}

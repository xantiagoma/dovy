import 'package:dovy/general.dart';

Map<T, S> mapKeysFromList<S, T>(Iterable<S> values, T key(S element)) {
  final map = Map<T, S>();
  groupBy<S, T>(values, key).forEach((key, value) {
    map.putIfAbsent(key, () => value.first);
  });
  return map;
}

List<S> uniqBy<S, T>(Iterable<S> values, T key(S element)) =>
    mapKeysFromList(values, key).values.toList();

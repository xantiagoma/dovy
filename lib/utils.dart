import 'package:dovy/general.dart';

Map<T, S> mapKeysFromList<S, T>(Iterable<S> values, T Function(S) key) {
  final map = Map<T, S>();
  groupBy<S, T>(values ?? [], key).forEach((key, value) {
    map.putIfAbsent(key, () => value.first);
  });
  return map;
}

List<S> uniqBy<S, T>(Iterable<S> values, T key(S element)) =>
    mapKeysFromList(values, key).values.toList();

S identity<S>([S s]) => s ?? null;

List<LatLng> decodeEncodedPolyline(String encoded) {
  List<LatLng> poly = [];
  int index = 0, len = encoded.length;
  int lat = 0, lng = 0;
  BigInt Big0 = BigInt.from(0);
  BigInt Big0x1f = BigInt.from(0x1f);
  BigInt Big0x20 = BigInt.from(0x20);

  while (index < len) {
    int shift = 0;
    BigInt b, result;
    result = Big0;
    do {
      b = BigInt.from(encoded.codeUnitAt(index++) - 63);
      result |= (b & Big0x1f) << shift;
      shift += 5;
    } while (b >= Big0x20);
    BigInt rshifted = result >> 1;
    int dlat;
    if (result.isOdd)
      dlat = (~rshifted).toInt();
    else
      dlat = rshifted.toInt();
    lat += dlat;

    shift = 0;
    result = Big0;
    do {
      b = BigInt.from(encoded.codeUnitAt(index++) - 63);
      result |= (b & Big0x1f) << shift;
      shift += 5;
    } while (b >= Big0x20);
    rshifted = result >> 1;
    int dlng;
    if (result.isOdd)
      dlng = (~rshifted).toInt();
    else
      dlng = rshifted.toInt();
    lng += dlng;

    poly.add(LatLng((lat / 1E5).toDouble(), (lng / 1E5).toDouble()));
  }
  return poly;
}

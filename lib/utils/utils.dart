import 'package:dovy/general.dart';
import 'package:flutter/material.dart';
export './geojson.dart';

Map<T, S> mapKeysFromList<S, T>(Iterable<S>? values, T Function(S) key) {
  final map = Map<T, S>();
  groupBy<S, T>(values ?? [], key).forEach((key, value) {
    map.putIfAbsent(key, () => value.first);
  });
  return map;
}

List<S> uniqBy<S, T>(Iterable<S> values, T key(S element)) =>
    mapKeysFromList(values, key).values.toList();

S? identity<S>([S? s]) => s ?? null;

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

Color? getColor(String? color) {
  if (color == null) {
    return null;
  }

  color = color.trim();

  Color? rgbColor = getRGBColorFromString(color);
  if (rgbColor != null) {
    return rgbColor;
  }

  late Color? finalColor;
  if (hasCorrectHexPattern(color)) {
    color = color.replaceAll("#", "");
    int size = color.length;
    if (size == 6 || size == 3) {
      if (size == 3) {
        color = color[0] + color[0] + color[1] + color[1] + color[2] + color[2];
      }

      int value = int.parse(color, radix: 16);
      value = value + 0xFF000000;
      finalColor = new Color(value);
    } else if (size == 8 || size == 4) {
      if (size == 4) {
        color = color[0] +
            color[0] +
            color[1] +
            color[1] +
            color[2] +
            color[2] +
            color[3] +
            color[3];
      }
      String alpha = color.substring(6);
      color = alpha + color.substring(0, 6);
      int value = int.parse(color, radix: 16);
      finalColor = new Color(value);
    }
  }

  if (finalColor != null) {
    return finalColor;
  }

  return null;
}

Color? getRGBColorFromString(String string) {
  string = string.replaceAll(" ", ""); // pseudo-trimming
  if (string.startsWith("rgb(") && string.endsWith(")")) {
    // Correct
    string = string.replaceAll("rgb(", "");
    string = string.replaceAll(")", "");
    List<String> rgb = string.split(",");
    if (rgb.length == 3) {
      int r = int.parse(rgb[0]);
      int g = int.parse(rgb[1]);
      int b = int.parse(rgb[2]);
      return new Color.fromARGB(255, r, g, b);
    }
    return null;
  }

  if (string.startsWith("rgba(") && string.endsWith(")")) {
    // Correct
    string = string.replaceAll("rgba(", "");
    string = string.replaceAll(")", "");
    List<String> rgba = string.split(",");
    if (rgba.length == 4) {
      int r = int.parse(rgba[0]);
      int g = int.parse(rgba[1]);
      int b = int.parse(rgba[2]);
      double o = double.parse(rgba[3]);
      return new Color.fromRGBO(r, g, b, o);
    }

    return null;
  }
  return null;
}

bool hasCorrectHexPattern(String string) {
  string = string.replaceAll("#", "");
  String validChars = "0123456789AaBbCcDdEeFf";
  for (int i = 0; i < string.length; i++) {
    if (!validChars.contains(string[i])) {
      return false;
    }
  }
  return true;
}

T logAndReturn<T>(T val, {String tag = 'default'}) {
  print('> Log (${tag})[${T.runtimeType}]: $val');
  return val;
}

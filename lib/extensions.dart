import 'package:flutter/material.dart';
import 'package:dovy/general.dart';

extension BuildContext_ on BuildContext {
  S get s => S.of(this);
  ThemeData get theme => Theme.of(this);
  MediaQueryData get media => MediaQuery.of(this);
  NavigatorState get navigator => Navigator.of(this);
  Future navigateTo(
    String path, {
    bool replace = false,
    bool clearStack = false,
    bool maintainState = true,
    bool rootNavigator = false,
    TransitionType? transition,
    Duration? transitionDuration,
    RouteTransitionsBuilder? transitionBuilder,
    RouteSettings? routeSettings,
  }) =>
      read(routerProvider).navigateTo(
        this,
        path,
        replace: replace,
        clearStack: clearStack,
        maintainState: maintainState,
        rootNavigator: rootNavigator,
        transition: transition,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder,
        routeSettings: routeSettings,
      );
}

extension Future_<T> on Future<T> {
  Future<T?> get tryOrNull async {
    try {
      return await this;
    } catch (_) {
      return null;
    }
  }
}

extension Kolor on Color {
  static Color alphaBlend(Color foreground, Color background) =>
      Color.alphaBlend(foreground, background);
  static Color fromARGB(int a, int r, int g, int b) =>
      Color.fromARGB(a, r, g, b);
  static Color fromCSSColor(CSSColor color) => Pigment.fromCSSColor(color);
  static Color fromHSL(HslColor hsl) => TinyColor.fromHSL(hsl).color;
  static Color fromHSV(HSVColor hsv) => TinyColor.fromHSV(hsv).color;

  static Color fromRGBO(int r, int g, int b, double opacity) =>
      Color.fromRGBO(r, g, b, opacity);
  static Color fromString(String color) => Pigment.fromString(color);
  static int getAlphaFromOpacity(double opacity) =>
      Color.getAlphaFromOpacity(opacity);

  HSVColor get hsv => TinyColor(this).toHsv();
  HslColor get hsl => TinyColor(this).toHsl();
  Color get clone => TinyColor(this).clone().color;

  Color get inverseBW {
    double luminance =
        (0.2126 * this.red + 0.7152 * this.green + 0.0722 * this.blue);
    return (luminance < 140) ? Color(0xffffffff) : Color(0xff000000);
  }
}

extension MapLatLng_ on Map<String, num> {
  LatLng? get latlng {
    if (!this.containsKey('latitude') || !this.containsKey('longitude')) {
      return null;
    }
    return LatLng(
      this['latitude']?.toDouble() ?? 0,
      this['longitude']?.toDouble() ?? 0,
    );
  }
}

extension LoadMap_ on Map<String, dynamic> {
  T load<T>(T Function(Map<String, dynamic>) f) => f(this);
}

extension LatLng_ on LatLng {
  Map<String, num> get map => {
        'latitude': this.latitude.toDouble(),
        'longitude': this.longitude.toDouble(),
      };
}

String latLngBoundsToString(LatLngBounds? t) => t == null
    ? 'NullLatLng'
    : """\n
        ${t.runtimeType} {
          isValid: ${t.isValid},
          west: ${t.west},
          south: ${t.south},
          east: ${t.east},
          north: ${t.north},
          southWest: ${t.southWest},
          northEast: ${t.northEast},
          northWest: ${t.northWest},
          southEast: ${t.southEast},
        }
  """;

String mapPositionToString(MapPosition t) => """\n
    ${t.runtimeType} {
      bounds: ${latLngBoundsToString(t.bounds)},
      center: ${t.center},
      hasGesture: ${t.hasGesture},
      zoom: ${t.zoom},
    }
  """;

extension LatLngBounds_ on LatLngBounds {
  String get string => latLngBoundsToString(this);
}

extension MapPosition_ on MapPosition {
  String get string => mapPositionToString(this);
}

extension PolylineDecode_ on String {
  List<LatLng> toLatLngList() {
    return decodeEncodedPolyline(this);
  }
}

extension AsyncValueLoadingt_<T> on AsyncValue<T> {
  bool get loading => this.when(
        data: (_) => false,
        loading: () => true,
        error: (_, _st) => false,
      );
}

extension MapController_ on MapController {
  zoomBy([factor = 1]) => this.move(center, zoom + factor);
}

extension ListNull_<T> on Iterable<T?> {
  List<T> get valid {
    return [
      for (final item in this)
        if (item != null) item,
    ];
  }
}

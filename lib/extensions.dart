import 'package:dovy/general.dart';

extension BuildContext_ on BuildContext {
  S get s => S.of(this);
  ThemeData get theme => Theme.of(this);
  MediaQueryData get media => MediaQuery.of(this);
  NavigatorState get navigator => Navigator.of(this);
  GetIt get i => GetIt.I;
  Router get router => GetIt.I<Router>();
  Future navigateTo(
    String path, {
    bool replace = false,
    bool clearStack = false,
    TransitionType transition,
    Duration transitionDuration = const Duration(milliseconds: 250),
    RouteTransitionsBuilder transitionBuilder,
  }) =>
      GetIt.I<Router>().navigateTo(
        this,
        path,
        replace: replace,
        clearStack: clearStack,
        transition: transition,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder,
      );
  Future<T> show<T>(Flushbar<T> flushbar) => flushbar.show(this);
}

extension FormBuilder_ on ValueNotifier<GlobalKey<FormBuilderState>> {
  FormBuilderState get form => this.value.currentState;
}

extension Future_<T> on Future<T> {
  Future<T> get tryOrNull async {
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
  static Color fromRGB({int r, int g, int b, int a}) =>
      TinyColor.fromRGB(r: null, g: null, b: null).color;
  static Color fromRGBO(int r, int g, int b, double opacity) =>
      Color.fromRGBO(r, g, b, opacity);
  static Color fromString(String color) => Pigment.fromString(color);
  static Color lerp(Color a, Color b, double t) => Color.lerp(a, b, t);
  static int getAlphaFromOpacity(double opacity) =>
      Color.getAlphaFromOpacity(opacity);

  /// Lighten the color a given amount, from 0 to 100. Providing 100 will always return white.
  Color lighten([int amount = 10]) => TinyColor(this).lighten(amount).color;

  /// Brighten the color a given amount, from 0 to 100.
  Color brighten([int amount = 10]) => TinyColor(this).brighten(amount).color;

  /// Darken the color a given amount, from 0 to 100. Providing 100 will always return black.
  Color darken([int amount = 10]) => TinyColor(this).darken(amount).color;

  /// Mix the color with pure white, from 0 to 100. Providing 0 will do nothing, providing 100 will always return white.
  Color tint([int amount = 10]) => TinyColor(this).tint(amount).color;

  /// Mix the color with pure black, from 0 to 100. Providing 0 will do nothing, providing 100 will always return black.
  Color shade([int amount = 10]) => TinyColor(this).shade(amount).color;

  /// Desaturate the color a given amount, from 0 to 100. Providing 100 will is the same as calling greyscale.
  Color desaturate([int amount = 10]) =>
      TinyColor(this).desaturate(amount).color;

  /// Saturate the color a given amount, from 0 to 100.
  Color saturate([int amount = 10]) => TinyColor(this).saturate(amount).color;

  /// Completely desaturates a color into greyscale. Same as calling desaturate(100).
  Color get greyscale => TinyColor(this).greyscale().color;

  /// Spin the hue a given amount, from -360 to 360. Calling with 0, 360, or -360 will do nothing (since it sets the hue back to what it was before).
  Color spin([double amount = 0]) => TinyColor(this).spin(amount).color;

  /// Returns the perceived brightness of a color, from 0-255, as defined by Web Content Accessibility Guidelines (Version 1.0).Returns the perceived brightness of a color, from 0-255, as defined by Web Content Accessibility Guidelines (Version 1.0).
  double get brightness => TinyColor(this).getBrightness();

  /// Return the perceived luminance of a color, a shorthand for flutter Color.computeLuminance
  double get luminance => TinyColor(this).getLuminance();

  /// Return a boolean indicating whether the color's perceived brightness is light.
  bool get isLight => TinyColor(this).isLight();

  /// Return a boolean indicating whether the color's perceived brightness is dark.
  bool get isDark => TinyColor(this).isDark();

  /// Returns the Complimentary Color for dynamic matching
  Color get compliment => TinyColor(this).complement().color;

  /// Blends the color with another color a given amount, from 0 - 100, default 50.
  Color mix(Color toColor, [int amount = 50]) =>
      TinyColor(this).mix(input: toColor, amount: amount).color;

  /// Converts standard Color to TinyColor object
  TinyColor get tiny => TinyColor(this);
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
  LatLng get latlng {
    if (!this.containsKey('latitude') || !this.containsKey('longitude')) {
      return null;
    }
    return LatLng(this['latitude'].toDouble(), this['longitude'].toDouble());
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

String latLngBoundsToString(LatLngBounds t) => """\n
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

extension Location_ on Location {
  LatLng get latlng => LatLng(this.latitude, this.longitude);
}

extension Station_ on Station {
  LatLng get latlng => Location_(this.location).latlng;
}

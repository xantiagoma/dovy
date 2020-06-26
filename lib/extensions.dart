import 'package:dovy/general.dart';

extension BuildContext_ on BuildContext {
  S get s => S.of(this);
  ThemeData get theme => Theme.of(this);
  MediaQueryData get media => MediaQuery.of(this);
}

extension Kolor on Color {
  static Color alphaBlend(Color foreground, Color background) =>
      Color.alphaBlend(foreground, background);
  static Color fromARGB(int a, int r, int g, int b) =>
      Color.fromARGB(a, r, g, b);
  static Color fromRGBO(int r, int g, int b, double opacity) =>
      Color.fromRGBO(r, g, b, opacity);
  static int getAlphaFromOpacity(double opacity) =>
      Color.getAlphaFromOpacity(opacity);
  static Color lerp(Color a, Color b, double t) => Color.lerp(a, b, t);
  static Color fromString(String color) => Pigment.fromString(color);
  static Color fromCSSColor(CSSColor color) => Pigment.fromCSSColor(color);
}

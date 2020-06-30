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

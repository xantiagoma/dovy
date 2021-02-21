import 'package:flutter/material.dart';
import 'package:dovy/general.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      child: App(),
    ),
  );
}

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final router = useProvider(routerProvider);

    return MaterialApp(
      // Localization
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      // End Localization
      debugShowCheckedModeBanner: false,
      title: S?.current?.appName ?? 'Dovy',
      theme: lightTheme,
      onGenerateRoute: router.generator,
    );
  }
}

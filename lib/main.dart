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

class App extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

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
      title: 'Dovy',
      theme: lightTheme,
      onGenerateRoute: router.generator,
    );
  }
}

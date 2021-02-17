import 'package:dovy/general.dart';
import 'package:dovy/providers/providers.dart';
import 'package:dovy/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
    final graphQLClient = useProvider(graphQlProvider);

    return GraphQLProvider(
      client: ValueNotifier(graphQLClient),
      child: MaterialApp(
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
      ),
    );
  }
}

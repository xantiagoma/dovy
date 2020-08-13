import 'package:dovy/general.dart';
import 'package:dovy/setup.dart';
import 'package:dovy/state/system_cubit.dart';
import 'package:dovy/theme.dart';

void main() {
  setUp();
  runApp(App());
}

final positionCubit = PositionCubit();
final systemSelectCubit = SystemSelectCubit();
final systemsListCubit = SystemsListCubit();
final linesListCubit = LinesListCubit(systemSelectCubit);
final stationsListCubit = StationsListCubit(systemSelectCubit);

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: positionCubit),
        BlocProvider.value(value: systemsListCubit),
        BlocProvider.value(value: systemSelectCubit),
        BlocProvider.value(value: linesListCubit),
        BlocProvider.value(value: stationsListCubit),
      ],
      child: GraphQLProvider(
        client: GetIt.I<ValueNotifier<GraphQLClient>>(),
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
          onGenerateRoute: context.router.generator,
        ),
      ),
    );
  }
}

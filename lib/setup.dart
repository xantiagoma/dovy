import 'package:dovy/general.dart';
import 'package:dovy/graphql.dart';
import 'package:dovy/router.dart';
import 'package:dovy/services/localstorage.dart';

setUp() {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingleton(router);
  GetIt.I.registerSingleton(CmsService());
  GetIt.I.registerSingleton(AuthService());
  GetIt.I.registerSingletonAsync<LocalStorage>(() async {
    final i = LocalStorage();
    await i.init();
    return i;
  });
  GetIt.I.registerSingleton<ValueNotifier<GraphQLClient>>(graphQLClient);
}

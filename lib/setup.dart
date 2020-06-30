import 'package:dovy/general.dart';
import 'package:dovy/router.dart';
import 'package:dovy/services/localstorage.dart';

setUp() {
  GetIt.I.registerSingleton(router);
  GetIt.I.registerSingleton(CmsService());
  GetIt.I.registerSingleton(AuthService());
  GetIt.I.registerSingletonAsync<LocalStorage>(() async {
    final i = LocalStorage();
    await i.init();
    return i;
  });
}

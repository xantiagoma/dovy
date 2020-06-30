import 'package:dovy/general.dart';
import 'package:dovy/router.dart';

setUp() {
  GetIt.I.registerSingleton(router);
  GetIt.I.registerSingleton(CmsService());
  GetIt.I.registerSingleton(AuthService());
}

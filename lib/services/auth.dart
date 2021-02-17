import 'package:dovy/general.dart';

class AuthService {
  final HiveInterface store;
  final CmsService cmsService;

  AuthService({
    @required this.store,
    @required this.cmsService,
  });

  Future<Box<String>> get box async {
    final box = await store.openBox<String>('auth_box');
    return box;
  }

  Future<Map<String, dynamic>> login(String id, String password) async {
    final r = await cmsService.s.http.post("/auth/local", data: {
      "identifier": id,
      "password": password,
    });

    final authResponse = r.data;
    (await box).put('jwt', authResponse["jwt"]);
    cmsService.token = authResponse["jwt"];
    return authResponse;
  }

  Future<bool> get checkUser async {
    try {
      final token = (await box).get('jwt');
      if (token == null) {
        return false;
      }
      cmsService.token = token;
      final r = await cmsService.s.http.get("/users/me");
      if (r.statusCode < 400) {
        // cmsService.s.http.interceptors.add(PrettyDioLogger(
        //       responseBody: false,
        //     ));
        return true;
      }
      return false;
    } catch (_) {
      return false;
    }
  }

  Future<String> get token async {
    return (await box).get('jwt');
  }

  Future<void> logout() async {
    cmsService.s.http.interceptors.clear();
    return (await box).delete('jwt');
  }
}

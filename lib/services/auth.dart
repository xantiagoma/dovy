import 'package:dovy/general.dart';

class AuthService {
  Future<Box<String>> get box async {
    final store = GetIt.I<LocalStorage>().store;
    final box = await store.openBox<String>('auth_box');
    return box;
  }

  Future<Map<String, dynamic>> login(String id, String password) async {
    final r = await GetIt.I<CmsService>().s.http.post("/auth/local", data: {
      "identifier": id,
      "password": password,
    });

    final authResponse = r.data;
    (await box).put('jwt', authResponse["jwt"]);
    GetIt.I<CmsService>().token = authResponse["jwt"];
    return authResponse;
  }

  Future<bool> get checkUser async {
    try {
      final token = (await box).get('jwt');
      if (token == null) {
        return false;
      }
      GetIt.I<CmsService>().token = token;
      final r = await GetIt.I<CmsService>().s.http.get("/users/me");
      if (r.statusCode < 400) {
        // GetIt.I<CmsService>().s.http.interceptors.add(PrettyDioLogger(
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
    GetIt.I<CmsService>().s.http.interceptors.clear();
    return (await box).delete('jwt');
  }
}

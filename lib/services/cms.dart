import 'package:dovy/general.dart';
import 'package:dovy/models/models.dart';
import 'package:hive/hive.dart';

class AuthService {
  Future<Box<String>> get box async {
    final store = GetIt.I<LocalStorage>().store;
    final box = await store.openBox<String>('auth_box');
    return box;
  }

  Future<AuthResponse> login(String id, String password) async {
    final r = await GetIt.I<CmsService>()
        .externalService
        .http
        .post("/auth/local", data: {
      "identifier": id,
      "password": password,
    });

    final authResponse = AuthResponse.fromJson(r.data);
    (await box).put('jwt', authResponse.jwt);
    return authResponse;
  }

  Future<String> get checkToken async {
    return (await box).get('jwt');
  }

  Future<void> logout() async {
    return (await box).delete('jwt');
  }
}

class CmsService {
  static String baseUrl = 'https://servy-4npeq4oexa-ue.a.run.app';
  final externalService = Strapi.newClient()..initialize(base_url: baseUrl);
}

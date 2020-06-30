import 'package:dovy/general.dart';
import 'package:dovy/models/models.dart';

class AuthService {
  Future<AuthResponse> login<T>(String id, String password) async {
    final r = await GetIt.I<CmsService>()
        .externalService
        .http
        .post("/auth/local", data: {
      "identifier": id,
      "password": password,
    });
    return AuthResponse.fromJson(r.data);
  }
}

class CmsService {
  static String baseUrl = 'https://servy-4npeq4oexa-ue.a.run.app';
  final externalService = Strapi.newClient()..initialize(base_url: baseUrl);
}

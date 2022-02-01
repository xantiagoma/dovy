import 'package:dovy/general.dart';

class AuthService {
  final Box<String> box;
  final Strapi strapi;

  AuthService({
    required this.box,
    required this.strapi,
  });

  Future<Map<String, dynamic>> login(String id, String password) async {
    final r = await strapi.http.post(
      "api/auth/local",
      data: {
        "identifier": id,
        "password": password,
      },
      options: Options(
        headers: {
          "Authorization": "Bearer ",
        },
      ),
    );

    final authResponse = r.data;

    await box.put('jwt', authResponse["jwt"]);
    return authResponse;
  }

  Future<void> logout() async {
    return box.delete('jwt');
  }
}

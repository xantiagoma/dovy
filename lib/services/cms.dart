import 'package:dovy/general.dart';

class CmsService {
  static String baseUrl = 'https://xantiagoma.herokuapp.com';

  Strapi s = Strapi.newClient()
    ..initialize(
      base_url: baseUrl,
      token: '',
    );

  Future<Map<String, dynamic>> get configs async {
    final response = await s.http.get('/configs');
    final configs = response.data;
    return configs;
  }

  set token(String jwt) {
    s = Strapi.newClient()
      ..initialize(
        base_url: baseUrl,
        token: jwt ?? '',
      );
  }

  Future<List> getStations({
    Map<String, dynamic> queryParameters,
  }) async {
    final m = (await s.find('stations')).map((e) => e.data).toList();
    return m;
  }

  Future<List> getLines({
    Map<String, dynamic> queryParameters,
  }) async {
    final m = (await s.find('lines')).map((e) => e.data).toList();
    return m;
  }
}

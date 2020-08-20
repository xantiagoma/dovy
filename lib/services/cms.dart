import 'package:dovy/general.dart';

class CmsService {
  static String baseUrl = 'https://server.xantiagoma.com';

  Strapi s = Strapi.newClient()
    ..initialize(
      base_url: baseUrl,
      token: '',
    );

  Future<Map<String, dynamic>> get configs async {
    final d = await s.find('configs');
    final configs = d?.fold<Map<String, dynamic>>(
      <String, dynamic>{},
      (previousValue, element) {
        final json = element.data;
        previousValue[json['key']] = json['value'];
        return previousValue;
      },
    );
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
    final m = (await GetIt.I<CmsService>().s.find('stations'))
        .map((e) => e.data)
        .toList();
    return m;
  }

  Future<List> getLines({
    Map<String, dynamic> queryParameters,
  }) async {
    final m = (await GetIt.I<CmsService>().s.find('lines'))
        .map((e) => e.data)
        .toList();
    return m;
  }
}

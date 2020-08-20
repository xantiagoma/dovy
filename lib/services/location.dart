import 'package:dovy/general.dart';

class LocationService {
  static Future<Map<String, dynamic>> getLocation(LatLng point) async =>
      (await Dio().get(
        "https://xantiagoma.com/api/address-details",
        queryParameters: {
          "latitude": point.latitude,
          "longitude": point.longitude,
        },
      ))
          .data;

  static Future<Map<String, dynamic>> getIpInfo() async =>
      (await Dio().get("https://xantiagoma.com/api/ip-api")).data;
}

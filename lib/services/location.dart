import 'package:dovy/general.dart';

class LocationService {
  static Future<AddressDetails> getLocation(LatLng point) async =>
      AddressDetails.fromJson((await Dio().get(
        "https://xantiagoma.com/api/address-details",
        queryParameters: {
          "latitude": point.latitude,
          "longitude": point.longitude,
        },
      ))
          .data);

  static Future<IPData> getIpInfo() async => IPData.fromJson(
      (await Dio().get("https://xantiagoma.com/api/ip-api")).data);
}

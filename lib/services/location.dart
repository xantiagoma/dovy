import 'package:dovy/general.dart';

class LocationService {
  static Future<AddressDetails> getLocation(LatLng point) async =>
      AddressDetails.fromJson((await Dio().get(
        "https://api.xantiagoma.com/address-details",
        queryParameters: {
          "latitude": point.latitude,
          "longitude": point.longitude,
        },
      ))
          .data);

  static Future<IPData> getIpInfo() async => IPData.fromJson((await Dio().get(
        "https://api.xantiagoma.com/ip-info",
      ))
          .data);
}

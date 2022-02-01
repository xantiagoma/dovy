import 'package:geocore/geocore.dart';

extension GeoJsonPolylines on FeatureCollection<Feature<Geometry>> {
  List<Feature<Geometry>> getFeaturesByGeometryType<T>() => this
      .features
      .where(
        (feature) => feature.geometry is T,
      )
      .toList();

  List<Feature<Geometry>> get polylines =>
      this.getFeaturesByGeometryType<LineString<GeoPoint>>();

  List<Feature<Geometry>> get multilines =>
      this.getFeaturesByGeometryType<MultiLineString<GeoPoint>>();

  List<Feature<Geometry>> get polygons =>
      this.getFeaturesByGeometryType<Polygon<GeoPoint>>();

  List<Feature<Geometry>> get points =>
      this.getFeaturesByGeometryType<GeoPoint2>();
}

FeatureCollection<Feature<Geometry>>? parseGeoJSON(dynamic geoJSONData) {
  try {
    return geoJSON.featureCollection(
      geoJSONData,
    );
  } on FormatException {
    return null;
  } catch (_) {
    rethrow;
  }
}

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dovy/models/models.dart';
export 'package:built_value/serializer.dart';

part 'serializers.g.dart';

@SerializersFor([
  AuthResponse,
  User,
  Role,
  ModelEntity,
  Config,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:dovy/models/serializers.dart';
export 'package:dovy/models/serializers.dart';

part 'models.g.dart';

@BuiltValue(instantiable: false)
abstract class ModelEntity {
  @nullable
  String get id;
  @nullable
  String get createdAt;
  @nullable
  String get updatedAt;
  @nullable
  @BuiltValueField(wireName: '__v')
  int get v;

  DateTime get created => DateTime.tryParse(this.createdAt);
  DateTime get updated => DateTime.tryParse(this.updatedAt);
}

abstract class User with ModelEntity implements Built<User, UserBuilder> {
  @nullable
  bool get confirmed;
  @nullable
  bool get blocked;
  @nullable
  String get id;
  @nullable
  String get username;
  @nullable
  String get email;
  @nullable
  String get provider;
  @nullable
  Role get role;
  @nullable
  String get userId;

  User._();
  factory User([void Function(UserBuilder) updates]) = _$User;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(User.serializer, this);
  }

  static User fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(User.serializer, json);
  }

  static Serializer<User> get serializer => _$userSerializer;
}

abstract class Role with ModelEntity implements Built<Role, RoleBuilder> {
  @nullable
  String get id;
  @nullable
  String get name;
  @nullable
  String get description;
  @nullable
  String get type;
  @nullable
  String get roleId;

  Role._();
  factory Role([void Function(RoleBuilder) updates]) = _$Role;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Role.serializer, this);
  }

  static Role fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Role.serializer, json);
  }

  static Serializer<Role> get serializer => _$roleSerializer;
}

abstract class AuthResponse
    with ModelEntity
    implements Built<AuthResponse, AuthResponseBuilder> {
  @nullable
  String get jwt;
  @nullable
  User get user;

  AuthResponse._();
  factory AuthResponse([void Function(AuthResponseBuilder) updates]) =
      _$AuthResponse;

  static Serializer<AuthResponse> get serializer => _$authResponseSerializer;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(AuthResponse.serializer, this);
  }

  static AuthResponse fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AuthResponse.serializer, json);
  }
}

abstract class Config<T>
    with ModelEntity
    implements Built<Config<T>, ConfigBuilder<T>> {
  @nullable
  String get key;
  @nullable
  T get value;

  Config._();
  factory Config([void Function(ConfigBuilder<T>) updates]) = _$Config<T>;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Config.serializer, this);
  }

  static Config fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Config.serializer, json);
  }

  static Serializer<Config> get serializer => _$configSerializer;
}

abstract class Station<T> implements Built<Station<T>, StationBuilder<T>> {
  @nullable
  String get name;

  @nullable
  String get code;

  @nullable
  Location get location;

  @nullable
  BuiltList<T> get lines;

  Station._();
  factory Station([void Function(StationBuilder<T>) updates]) = _$Station<T>;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Station.serializer, this);
  }

  static Station<T> fromJson<T>(Map<String, dynamic> json) {
    return serializers.deserializeWith(Station.serializer, json);
  }

  static Serializer<Station> get serializer => _$stationSerializer;
}

abstract class Location implements Built<Location, LocationBuilder> {
  @nullable
  double get latitude;

  @nullable
  double get longitude;

  // TODO META
  // @nullable
  // dynamic get meta;

  Location._();
  factory Location([void Function(LocationBuilder) updates]) = _$Location;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Location.serializer, this);
  }

  static Location fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Location.serializer, json);
  }

  static Serializer<Location> get serializer => _$locationSerializer;
}

abstract class Line<T> implements Built<Line<T>, LineBuilder<T>> {
  @nullable
  String get color;

  @nullable
  String get type;

  @nullable
  String get name;

  @nullable
  String get code;

  @nullable
  BuiltList<T> get stations;

  @nullable
  BuiltList<Location> get path;

  Line._();
  factory Line([void Function(LineBuilder<T>) updates]) = _$Line<T>;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Line.serializer, this);
  }

  static Line<T> fromJson<T>(Map<String, dynamic> json) {
    return serializers.deserializeWith(Line.serializer, json);
  }

  static Serializer<Line> get serializer => _$lineSerializer;
}

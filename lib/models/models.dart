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

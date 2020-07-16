// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<User> _$userSerializer = new _$UserSerializer();
Serializer<Role> _$roleSerializer = new _$RoleSerializer();
Serializer<AuthResponse> _$authResponseSerializer =
    new _$AuthResponseSerializer();
Serializer<Config<Object>> _$configSerializer = new _$ConfigSerializer();
Serializer<Station<Object>> _$stationSerializer = new _$StationSerializer();
Serializer<Location> _$locationSerializer = new _$LocationSerializer();
Serializer<Line<Object>> _$lineSerializer = new _$LineSerializer();

class _$UserSerializer implements StructuredSerializer<User> {
  @override
  final Iterable<Type> types = const [User, _$User];
  @override
  final String wireName = 'User';

  @override
  Iterable<Object> serialize(Serializers serializers, User object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.confirmed != null) {
      result
        ..add('confirmed')
        ..add(serializers.serialize(object.confirmed,
            specifiedType: const FullType(bool)));
    }
    if (object.blocked != null) {
      result
        ..add('blocked')
        ..add(serializers.serialize(object.blocked,
            specifiedType: const FullType(bool)));
    }
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.username != null) {
      result
        ..add('username')
        ..add(serializers.serialize(object.username,
            specifiedType: const FullType(String)));
    }
    if (object.email != null) {
      result
        ..add('email')
        ..add(serializers.serialize(object.email,
            specifiedType: const FullType(String)));
    }
    if (object.provider != null) {
      result
        ..add('provider')
        ..add(serializers.serialize(object.provider,
            specifiedType: const FullType(String)));
    }
    if (object.role != null) {
      result
        ..add('role')
        ..add(serializers.serialize(object.role,
            specifiedType: const FullType(Role)));
    }
    if (object.userId != null) {
      result
        ..add('userId')
        ..add(serializers.serialize(object.userId,
            specifiedType: const FullType(String)));
    }
    if (object.createdAt != null) {
      result
        ..add('createdAt')
        ..add(serializers.serialize(object.createdAt,
            specifiedType: const FullType(String)));
    }
    if (object.updatedAt != null) {
      result
        ..add('updatedAt')
        ..add(serializers.serialize(object.updatedAt,
            specifiedType: const FullType(String)));
    }
    if (object.v != null) {
      result
        ..add('__v')
        ..add(serializers.serialize(object.v,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  User deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'confirmed':
          result.confirmed = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'blocked':
          result.blocked = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'provider':
          result.provider = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'role':
          result.role.replace(serializers.deserialize(value,
              specifiedType: const FullType(Role)) as Role);
          break;
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'updatedAt':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case '__v':
          result.v = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$RoleSerializer implements StructuredSerializer<Role> {
  @override
  final Iterable<Type> types = const [Role, _$Role];
  @override
  final String wireName = 'Role';

  @override
  Iterable<Object> serialize(Serializers serializers, Role object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.type != null) {
      result
        ..add('type')
        ..add(serializers.serialize(object.type,
            specifiedType: const FullType(String)));
    }
    if (object.roleId != null) {
      result
        ..add('roleId')
        ..add(serializers.serialize(object.roleId,
            specifiedType: const FullType(String)));
    }
    if (object.createdAt != null) {
      result
        ..add('createdAt')
        ..add(serializers.serialize(object.createdAt,
            specifiedType: const FullType(String)));
    }
    if (object.updatedAt != null) {
      result
        ..add('updatedAt')
        ..add(serializers.serialize(object.updatedAt,
            specifiedType: const FullType(String)));
    }
    if (object.v != null) {
      result
        ..add('__v')
        ..add(serializers.serialize(object.v,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Role deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RoleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'roleId':
          result.roleId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'updatedAt':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case '__v':
          result.v = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$AuthResponseSerializer implements StructuredSerializer<AuthResponse> {
  @override
  final Iterable<Type> types = const [AuthResponse, _$AuthResponse];
  @override
  final String wireName = 'AuthResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, AuthResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.jwt != null) {
      result
        ..add('jwt')
        ..add(serializers.serialize(object.jwt,
            specifiedType: const FullType(String)));
    }
    if (object.user != null) {
      result
        ..add('user')
        ..add(serializers.serialize(object.user,
            specifiedType: const FullType(User)));
    }
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.createdAt != null) {
      result
        ..add('createdAt')
        ..add(serializers.serialize(object.createdAt,
            specifiedType: const FullType(String)));
    }
    if (object.updatedAt != null) {
      result
        ..add('updatedAt')
        ..add(serializers.serialize(object.updatedAt,
            specifiedType: const FullType(String)));
    }
    if (object.v != null) {
      result
        ..add('__v')
        ..add(serializers.serialize(object.v,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  AuthResponse deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AuthResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'jwt':
          result.jwt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(User)) as User);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'updatedAt':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case '__v':
          result.v = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ConfigSerializer implements StructuredSerializer<Config<Object>> {
  @override
  final Iterable<Type> types = const [Config, _$Config];
  @override
  final String wireName = 'Config';

  @override
  Iterable<Object> serialize(Serializers serializers, Config<Object> object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = <Object>[];
    if (object.key != null) {
      result
        ..add('key')
        ..add(serializers.serialize(object.key,
            specifiedType: const FullType(String)));
    }
    if (object.value != null) {
      result
        ..add('value')
        ..add(serializers.serialize(object.value, specifiedType: parameterT));
    }
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.createdAt != null) {
      result
        ..add('createdAt')
        ..add(serializers.serialize(object.createdAt,
            specifiedType: const FullType(String)));
    }
    if (object.updatedAt != null) {
      result
        ..add('updatedAt')
        ..add(serializers.serialize(object.updatedAt,
            specifiedType: const FullType(String)));
    }
    if (object.v != null) {
      result
        ..add('__v')
        ..add(serializers.serialize(object.v,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Config<Object> deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = isUnderspecified
        ? new ConfigBuilder<Object>()
        : serializers.newBuilder(specifiedType) as ConfigBuilder;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'key':
          result.key = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'value':
          result.value =
              serializers.deserialize(value, specifiedType: parameterT);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'updatedAt':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case '__v':
          result.v = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$StationSerializer implements StructuredSerializer<Station<Object>> {
  @override
  final Iterable<Type> types = const [Station, _$Station];
  @override
  final String wireName = 'Station';

  @override
  Iterable<Object> serialize(Serializers serializers, Station<Object> object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = <Object>[];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.code != null) {
      result
        ..add('code')
        ..add(serializers.serialize(object.code,
            specifiedType: const FullType(String)));
    }
    if (object.location != null) {
      result
        ..add('location')
        ..add(serializers.serialize(object.location,
            specifiedType: const FullType(Location)));
    }
    if (object.lines != null) {
      result
        ..add('lines')
        ..add(serializers.serialize(object.lines,
            specifiedType: new FullType(BuiltList, [parameterT])));
    }
    return result;
  }

  @override
  Station<Object> deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = isUnderspecified
        ? new StationBuilder<Object>()
        : serializers.newBuilder(specifiedType) as StationBuilder;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'location':
          result.location.replace(serializers.deserialize(value,
              specifiedType: const FullType(Location)) as Location);
          break;
        case 'lines':
          result.lines.replace(serializers.deserialize(value,
                  specifiedType: new FullType(BuiltList, [parameterT]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$LocationSerializer implements StructuredSerializer<Location> {
  @override
  final Iterable<Type> types = const [Location, _$Location];
  @override
  final String wireName = 'Location';

  @override
  Iterable<Object> serialize(Serializers serializers, Location object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.latitude != null) {
      result
        ..add('latitude')
        ..add(serializers.serialize(object.latitude,
            specifiedType: const FullType(double)));
    }
    if (object.longitude != null) {
      result
        ..add('longitude')
        ..add(serializers.serialize(object.longitude,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  Location deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LocationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'latitude':
          result.latitude = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'longitude':
          result.longitude = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$LineSerializer implements StructuredSerializer<Line<Object>> {
  @override
  final Iterable<Type> types = const [Line, _$Line];
  @override
  final String wireName = 'Line';

  @override
  Iterable<Object> serialize(Serializers serializers, Line<Object> object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = <Object>[];
    if (object.color != null) {
      result
        ..add('color')
        ..add(serializers.serialize(object.color,
            specifiedType: const FullType(String)));
    }
    if (object.type != null) {
      result
        ..add('type')
        ..add(serializers.serialize(object.type,
            specifiedType: const FullType(String)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.code != null) {
      result
        ..add('code')
        ..add(serializers.serialize(object.code,
            specifiedType: const FullType(String)));
    }
    if (object.stations != null) {
      result
        ..add('stations')
        ..add(serializers.serialize(object.stations,
            specifiedType: new FullType(BuiltList, [parameterT])));
    }
    if (object.path != null) {
      result
        ..add('path')
        ..add(serializers.serialize(object.path,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Location)])));
    }
    return result;
  }

  @override
  Line<Object> deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = isUnderspecified
        ? new LineBuilder<Object>()
        : serializers.newBuilder(specifiedType) as LineBuilder;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'stations':
          result.stations.replace(serializers.deserialize(value,
                  specifiedType: new FullType(BuiltList, [parameterT]))
              as BuiltList<Object>);
          break;
        case 'path':
          result.path.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Location)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

abstract class ModelEntityBuilder {
  void replace(ModelEntity other);
  void update(void Function(ModelEntityBuilder) updates);
  String get id;
  set id(String id);

  String get createdAt;
  set createdAt(String createdAt);

  String get updatedAt;
  set updatedAt(String updatedAt);

  int get v;
  set v(int v);
}

class _$User extends User {
  @override
  final bool confirmed;
  @override
  final bool blocked;
  @override
  final String id;
  @override
  final String username;
  @override
  final String email;
  @override
  final String provider;
  @override
  final Role role;
  @override
  final String userId;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final int v;

  factory _$User([void Function(UserBuilder) updates]) =>
      (new UserBuilder()..update(updates)).build();

  _$User._(
      {this.confirmed,
      this.blocked,
      this.id,
      this.username,
      this.email,
      this.provider,
      this.role,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.v})
      : super._();

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        confirmed == other.confirmed &&
        blocked == other.blocked &&
        id == other.id &&
        username == other.username &&
        email == other.email &&
        provider == other.provider &&
        role == other.role &&
        userId == other.userId &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        v == other.v;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, confirmed.hashCode),
                                            blocked.hashCode),
                                        id.hashCode),
                                    username.hashCode),
                                email.hashCode),
                            provider.hashCode),
                        role.hashCode),
                    userId.hashCode),
                createdAt.hashCode),
            updatedAt.hashCode),
        v.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('User')
          ..add('confirmed', confirmed)
          ..add('blocked', blocked)
          ..add('id', id)
          ..add('username', username)
          ..add('email', email)
          ..add('provider', provider)
          ..add('role', role)
          ..add('userId', userId)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('v', v))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User _$v;

  bool _confirmed;
  bool get confirmed => _$this._confirmed;
  set confirmed(bool confirmed) => _$this._confirmed = confirmed;

  bool _blocked;
  bool get blocked => _$this._blocked;
  set blocked(bool blocked) => _$this._blocked = blocked;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _provider;
  String get provider => _$this._provider;
  set provider(String provider) => _$this._provider = provider;

  RoleBuilder _role;
  RoleBuilder get role => _$this._role ??= new RoleBuilder();
  set role(RoleBuilder role) => _$this._role = role;

  String _userId;
  String get userId => _$this._userId;
  set userId(String userId) => _$this._userId = userId;

  String _createdAt;
  String get createdAt => _$this._createdAt;
  set createdAt(String createdAt) => _$this._createdAt = createdAt;

  String _updatedAt;
  String get updatedAt => _$this._updatedAt;
  set updatedAt(String updatedAt) => _$this._updatedAt = updatedAt;

  int _v;
  int get v => _$this._v;
  set v(int v) => _$this._v = v;

  UserBuilder();

  UserBuilder get _$this {
    if (_$v != null) {
      _confirmed = _$v.confirmed;
      _blocked = _$v.blocked;
      _id = _$v.id;
      _username = _$v.username;
      _email = _$v.email;
      _provider = _$v.provider;
      _role = _$v.role?.toBuilder();
      _userId = _$v.userId;
      _createdAt = _$v.createdAt;
      _updatedAt = _$v.updatedAt;
      _v = _$v.v;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$User build() {
    _$User _$result;
    try {
      _$result = _$v ??
          new _$User._(
              confirmed: confirmed,
              blocked: blocked,
              id: id,
              username: username,
              email: email,
              provider: provider,
              role: _role?.build(),
              userId: userId,
              createdAt: createdAt,
              updatedAt: updatedAt,
              v: v);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'role';
        _role?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'User', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Role extends Role {
  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String type;
  @override
  final String roleId;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final int v;

  factory _$Role([void Function(RoleBuilder) updates]) =>
      (new RoleBuilder()..update(updates)).build();

  _$Role._(
      {this.id,
      this.name,
      this.description,
      this.type,
      this.roleId,
      this.createdAt,
      this.updatedAt,
      this.v})
      : super._();

  @override
  Role rebuild(void Function(RoleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RoleBuilder toBuilder() => new RoleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Role &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        type == other.type &&
        roleId == other.roleId &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        v == other.v;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, id.hashCode), name.hashCode),
                            description.hashCode),
                        type.hashCode),
                    roleId.hashCode),
                createdAt.hashCode),
            updatedAt.hashCode),
        v.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Role')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('type', type)
          ..add('roleId', roleId)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('v', v))
        .toString();
  }
}

class RoleBuilder implements Builder<Role, RoleBuilder> {
  _$Role _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  String _roleId;
  String get roleId => _$this._roleId;
  set roleId(String roleId) => _$this._roleId = roleId;

  String _createdAt;
  String get createdAt => _$this._createdAt;
  set createdAt(String createdAt) => _$this._createdAt = createdAt;

  String _updatedAt;
  String get updatedAt => _$this._updatedAt;
  set updatedAt(String updatedAt) => _$this._updatedAt = updatedAt;

  int _v;
  int get v => _$this._v;
  set v(int v) => _$this._v = v;

  RoleBuilder();

  RoleBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _description = _$v.description;
      _type = _$v.type;
      _roleId = _$v.roleId;
      _createdAt = _$v.createdAt;
      _updatedAt = _$v.updatedAt;
      _v = _$v.v;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Role other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Role;
  }

  @override
  void update(void Function(RoleBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Role build() {
    final _$result = _$v ??
        new _$Role._(
            id: id,
            name: name,
            description: description,
            type: type,
            roleId: roleId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            v: v);
    replace(_$result);
    return _$result;
  }
}

class _$AuthResponse extends AuthResponse {
  @override
  final String jwt;
  @override
  final User user;
  @override
  final String id;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final int v;

  factory _$AuthResponse([void Function(AuthResponseBuilder) updates]) =>
      (new AuthResponseBuilder()..update(updates)).build();

  _$AuthResponse._(
      {this.jwt, this.user, this.id, this.createdAt, this.updatedAt, this.v})
      : super._();

  @override
  AuthResponse rebuild(void Function(AuthResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthResponseBuilder toBuilder() => new AuthResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthResponse &&
        jwt == other.jwt &&
        user == other.user &&
        id == other.id &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        v == other.v;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, jwt.hashCode), user.hashCode), id.hashCode),
                createdAt.hashCode),
            updatedAt.hashCode),
        v.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AuthResponse')
          ..add('jwt', jwt)
          ..add('user', user)
          ..add('id', id)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('v', v))
        .toString();
  }
}

class AuthResponseBuilder
    implements Builder<AuthResponse, AuthResponseBuilder> {
  _$AuthResponse _$v;

  String _jwt;
  String get jwt => _$this._jwt;
  set jwt(String jwt) => _$this._jwt = jwt;

  UserBuilder _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder user) => _$this._user = user;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _createdAt;
  String get createdAt => _$this._createdAt;
  set createdAt(String createdAt) => _$this._createdAt = createdAt;

  String _updatedAt;
  String get updatedAt => _$this._updatedAt;
  set updatedAt(String updatedAt) => _$this._updatedAt = updatedAt;

  int _v;
  int get v => _$this._v;
  set v(int v) => _$this._v = v;

  AuthResponseBuilder();

  AuthResponseBuilder get _$this {
    if (_$v != null) {
      _jwt = _$v.jwt;
      _user = _$v.user?.toBuilder();
      _id = _$v.id;
      _createdAt = _$v.createdAt;
      _updatedAt = _$v.updatedAt;
      _v = _$v.v;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AuthResponse;
  }

  @override
  void update(void Function(AuthResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthResponse build() {
    _$AuthResponse _$result;
    try {
      _$result = _$v ??
          new _$AuthResponse._(
              jwt: jwt,
              user: _user?.build(),
              id: id,
              createdAt: createdAt,
              updatedAt: updatedAt,
              v: v);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AuthResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Config<T> extends Config<T> {
  @override
  final String key;
  @override
  final T value;
  @override
  final String id;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final int v;

  factory _$Config([void Function(ConfigBuilder<T>) updates]) =>
      (new ConfigBuilder<T>()..update(updates)).build();

  _$Config._(
      {this.key, this.value, this.id, this.createdAt, this.updatedAt, this.v})
      : super._() {
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError('Config', 'T');
    }
  }

  @override
  Config<T> rebuild(void Function(ConfigBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfigBuilder<T> toBuilder() => new ConfigBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Config &&
        key == other.key &&
        value == other.value &&
        id == other.id &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        v == other.v;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, key.hashCode), value.hashCode), id.hashCode),
                createdAt.hashCode),
            updatedAt.hashCode),
        v.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Config')
          ..add('key', key)
          ..add('value', value)
          ..add('id', id)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('v', v))
        .toString();
  }
}

class ConfigBuilder<T> implements Builder<Config<T>, ConfigBuilder<T>> {
  _$Config<T> _$v;

  String _key;
  String get key => _$this._key;
  set key(String key) => _$this._key = key;

  T _value;
  T get value => _$this._value;
  set value(T value) => _$this._value = value;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _createdAt;
  String get createdAt => _$this._createdAt;
  set createdAt(String createdAt) => _$this._createdAt = createdAt;

  String _updatedAt;
  String get updatedAt => _$this._updatedAt;
  set updatedAt(String updatedAt) => _$this._updatedAt = updatedAt;

  int _v;
  int get v => _$this._v;
  set v(int v) => _$this._v = v;

  ConfigBuilder();

  ConfigBuilder<T> get _$this {
    if (_$v != null) {
      _key = _$v.key;
      _value = _$v.value;
      _id = _$v.id;
      _createdAt = _$v.createdAt;
      _updatedAt = _$v.updatedAt;
      _v = _$v.v;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Config<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Config<T>;
  }

  @override
  void update(void Function(ConfigBuilder<T>) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Config<T> build() {
    final _$result = _$v ??
        new _$Config<T>._(
            key: key,
            value: value,
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            v: v);
    replace(_$result);
    return _$result;
  }
}

class _$Station<T> extends Station<T> {
  @override
  final String name;
  @override
  final String code;
  @override
  final Location location;
  @override
  final BuiltList<T> lines;

  factory _$Station([void Function(StationBuilder<T>) updates]) =>
      (new StationBuilder<T>()..update(updates)).build();

  _$Station._({this.name, this.code, this.location, this.lines}) : super._() {
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError('Station', 'T');
    }
  }

  @override
  Station<T> rebuild(void Function(StationBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StationBuilder<T> toBuilder() => new StationBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Station &&
        name == other.name &&
        code == other.code &&
        location == other.location &&
        lines == other.lines;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), code.hashCode), location.hashCode),
        lines.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Station')
          ..add('name', name)
          ..add('code', code)
          ..add('location', location)
          ..add('lines', lines))
        .toString();
  }
}

class StationBuilder<T> implements Builder<Station<T>, StationBuilder<T>> {
  _$Station<T> _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _code;
  String get code => _$this._code;
  set code(String code) => _$this._code = code;

  LocationBuilder _location;
  LocationBuilder get location => _$this._location ??= new LocationBuilder();
  set location(LocationBuilder location) => _$this._location = location;

  ListBuilder<T> _lines;
  ListBuilder<T> get lines => _$this._lines ??= new ListBuilder<T>();
  set lines(ListBuilder<T> lines) => _$this._lines = lines;

  StationBuilder();

  StationBuilder<T> get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _code = _$v.code;
      _location = _$v.location?.toBuilder();
      _lines = _$v.lines?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Station<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Station<T>;
  }

  @override
  void update(void Function(StationBuilder<T>) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Station<T> build() {
    _$Station<T> _$result;
    try {
      _$result = _$v ??
          new _$Station<T>._(
              name: name,
              code: code,
              location: _location?.build(),
              lines: _lines?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'location';
        _location?.build();
        _$failedField = 'lines';
        _lines?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Station', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Location extends Location {
  @override
  final double latitude;
  @override
  final double longitude;

  factory _$Location([void Function(LocationBuilder) updates]) =>
      (new LocationBuilder()..update(updates)).build();

  _$Location._({this.latitude, this.longitude}) : super._();

  @override
  Location rebuild(void Function(LocationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LocationBuilder toBuilder() => new LocationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Location &&
        latitude == other.latitude &&
        longitude == other.longitude;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, latitude.hashCode), longitude.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Location')
          ..add('latitude', latitude)
          ..add('longitude', longitude))
        .toString();
  }
}

class LocationBuilder implements Builder<Location, LocationBuilder> {
  _$Location _$v;

  double _latitude;
  double get latitude => _$this._latitude;
  set latitude(double latitude) => _$this._latitude = latitude;

  double _longitude;
  double get longitude => _$this._longitude;
  set longitude(double longitude) => _$this._longitude = longitude;

  LocationBuilder();

  LocationBuilder get _$this {
    if (_$v != null) {
      _latitude = _$v.latitude;
      _longitude = _$v.longitude;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Location other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Location;
  }

  @override
  void update(void Function(LocationBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Location build() {
    final _$result =
        _$v ?? new _$Location._(latitude: latitude, longitude: longitude);
    replace(_$result);
    return _$result;
  }
}

class _$Line<T> extends Line<T> {
  @override
  final String color;
  @override
  final String type;
  @override
  final String name;
  @override
  final String code;
  @override
  final BuiltList<T> stations;
  @override
  final BuiltList<Location> path;

  factory _$Line([void Function(LineBuilder<T>) updates]) =>
      (new LineBuilder<T>()..update(updates)).build();

  _$Line._(
      {this.color, this.type, this.name, this.code, this.stations, this.path})
      : super._() {
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError('Line', 'T');
    }
  }

  @override
  Line<T> rebuild(void Function(LineBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LineBuilder<T> toBuilder() => new LineBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Line &&
        color == other.color &&
        type == other.type &&
        name == other.name &&
        code == other.code &&
        stations == other.stations &&
        path == other.path;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, color.hashCode), type.hashCode), name.hashCode),
                code.hashCode),
            stations.hashCode),
        path.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Line')
          ..add('color', color)
          ..add('type', type)
          ..add('name', name)
          ..add('code', code)
          ..add('stations', stations)
          ..add('path', path))
        .toString();
  }
}

class LineBuilder<T> implements Builder<Line<T>, LineBuilder<T>> {
  _$Line<T> _$v;

  String _color;
  String get color => _$this._color;
  set color(String color) => _$this._color = color;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _code;
  String get code => _$this._code;
  set code(String code) => _$this._code = code;

  ListBuilder<T> _stations;
  ListBuilder<T> get stations => _$this._stations ??= new ListBuilder<T>();
  set stations(ListBuilder<T> stations) => _$this._stations = stations;

  ListBuilder<Location> _path;
  ListBuilder<Location> get path =>
      _$this._path ??= new ListBuilder<Location>();
  set path(ListBuilder<Location> path) => _$this._path = path;

  LineBuilder();

  LineBuilder<T> get _$this {
    if (_$v != null) {
      _color = _$v.color;
      _type = _$v.type;
      _name = _$v.name;
      _code = _$v.code;
      _stations = _$v.stations?.toBuilder();
      _path = _$v.path?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Line<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Line<T>;
  }

  @override
  void update(void Function(LineBuilder<T>) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Line<T> build() {
    _$Line<T> _$result;
    try {
      _$result = _$v ??
          new _$Line<T>._(
              color: color,
              type: type,
              name: name,
              code: code,
              stations: _stations?.build(),
              path: _path?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'stations';
        _stations?.build();
        _$failedField = 'path';
        _path?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Line', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

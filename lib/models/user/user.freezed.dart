// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

// ignore: unused_element
  _User call(
      {bool blocked,
      bool confirmed,
      bool isActive,
      DateTime createdAt,
      DateTime updatedAt,
      int v,
      List<UserRole> roles,
      String email,
      String firstname,
      String id,
      String lastname,
      String provider,
      String userId,
      String username,
      UserRole role}) {
    return _User(
      blocked: blocked,
      confirmed: confirmed,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
      v: v,
      roles: roles,
      email: email,
      firstname: firstname,
      id: id,
      lastname: lastname,
      provider: provider,
      userId: userId,
      username: username,
      role: role,
    );
  }

// ignore: unused_element
  User fromJson(Map<String, Object> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  bool get blocked;
  bool get confirmed;
  bool get isActive;
  DateTime get createdAt;
  DateTime get updatedAt;
  int get v;
  List<UserRole> get roles;
  String get email;
  String get firstname;
  String get id;
  String get lastname;
  String get provider;
  String get userId;
  String get username;
  UserRole get role;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {bool blocked,
      bool confirmed,
      bool isActive,
      DateTime createdAt,
      DateTime updatedAt,
      int v,
      List<UserRole> roles,
      String email,
      String firstname,
      String id,
      String lastname,
      String provider,
      String userId,
      String username,
      UserRole role});

  $UserRoleCopyWith<$Res> get role;
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object blocked = freezed,
    Object confirmed = freezed,
    Object isActive = freezed,
    Object createdAt = freezed,
    Object updatedAt = freezed,
    Object v = freezed,
    Object roles = freezed,
    Object email = freezed,
    Object firstname = freezed,
    Object id = freezed,
    Object lastname = freezed,
    Object provider = freezed,
    Object userId = freezed,
    Object username = freezed,
    Object role = freezed,
  }) {
    return _then(_value.copyWith(
      blocked: blocked == freezed ? _value.blocked : blocked as bool,
      confirmed: confirmed == freezed ? _value.confirmed : confirmed as bool,
      isActive: isActive == freezed ? _value.isActive : isActive as bool,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
      updatedAt:
          updatedAt == freezed ? _value.updatedAt : updatedAt as DateTime,
      v: v == freezed ? _value.v : v as int,
      roles: roles == freezed ? _value.roles : roles as List<UserRole>,
      email: email == freezed ? _value.email : email as String,
      firstname: firstname == freezed ? _value.firstname : firstname as String,
      id: id == freezed ? _value.id : id as String,
      lastname: lastname == freezed ? _value.lastname : lastname as String,
      provider: provider == freezed ? _value.provider : provider as String,
      userId: userId == freezed ? _value.userId : userId as String,
      username: username == freezed ? _value.username : username as String,
      role: role == freezed ? _value.role : role as UserRole,
    ));
  }

  @override
  $UserRoleCopyWith<$Res> get role {
    if (_value.role == null) {
      return null;
    }
    return $UserRoleCopyWith<$Res>(_value.role, (value) {
      return _then(_value.copyWith(role: value));
    });
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool blocked,
      bool confirmed,
      bool isActive,
      DateTime createdAt,
      DateTime updatedAt,
      int v,
      List<UserRole> roles,
      String email,
      String firstname,
      String id,
      String lastname,
      String provider,
      String userId,
      String username,
      UserRole role});

  @override
  $UserRoleCopyWith<$Res> get role;
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object blocked = freezed,
    Object confirmed = freezed,
    Object isActive = freezed,
    Object createdAt = freezed,
    Object updatedAt = freezed,
    Object v = freezed,
    Object roles = freezed,
    Object email = freezed,
    Object firstname = freezed,
    Object id = freezed,
    Object lastname = freezed,
    Object provider = freezed,
    Object userId = freezed,
    Object username = freezed,
    Object role = freezed,
  }) {
    return _then(_User(
      blocked: blocked == freezed ? _value.blocked : blocked as bool,
      confirmed: confirmed == freezed ? _value.confirmed : confirmed as bool,
      isActive: isActive == freezed ? _value.isActive : isActive as bool,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
      updatedAt:
          updatedAt == freezed ? _value.updatedAt : updatedAt as DateTime,
      v: v == freezed ? _value.v : v as int,
      roles: roles == freezed ? _value.roles : roles as List<UserRole>,
      email: email == freezed ? _value.email : email as String,
      firstname: firstname == freezed ? _value.firstname : firstname as String,
      id: id == freezed ? _value.id : id as String,
      lastname: lastname == freezed ? _value.lastname : lastname as String,
      provider: provider == freezed ? _value.provider : provider as String,
      userId: userId == freezed ? _value.userId : userId as String,
      username: username == freezed ? _value.username : username as String,
      role: role == freezed ? _value.role : role as UserRole,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_User implements _User {
  _$_User(
      {this.blocked,
      this.confirmed,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.roles,
      this.email,
      this.firstname,
      this.id,
      this.lastname,
      this.provider,
      this.userId,
      this.username,
      this.role});

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  final bool blocked;
  @override
  final bool confirmed;
  @override
  final bool isActive;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final int v;
  @override
  final List<UserRole> roles;
  @override
  final String email;
  @override
  final String firstname;
  @override
  final String id;
  @override
  final String lastname;
  @override
  final String provider;
  @override
  final String userId;
  @override
  final String username;
  @override
  final UserRole role;

  @override
  String toString() {
    return 'User(blocked: $blocked, confirmed: $confirmed, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, roles: $roles, email: $email, firstname: $firstname, id: $id, lastname: $lastname, provider: $provider, userId: $userId, username: $username, role: $role)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.blocked, blocked) ||
                const DeepCollectionEquality()
                    .equals(other.blocked, blocked)) &&
            (identical(other.confirmed, confirmed) ||
                const DeepCollectionEquality()
                    .equals(other.confirmed, confirmed)) &&
            (identical(other.isActive, isActive) ||
                const DeepCollectionEquality()
                    .equals(other.isActive, isActive)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.v, v) ||
                const DeepCollectionEquality().equals(other.v, v)) &&
            (identical(other.roles, roles) ||
                const DeepCollectionEquality().equals(other.roles, roles)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.firstname, firstname) ||
                const DeepCollectionEquality()
                    .equals(other.firstname, firstname)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.lastname, lastname) ||
                const DeepCollectionEquality()
                    .equals(other.lastname, lastname)) &&
            (identical(other.provider, provider) ||
                const DeepCollectionEquality()
                    .equals(other.provider, provider)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(blocked) ^
      const DeepCollectionEquality().hash(confirmed) ^
      const DeepCollectionEquality().hash(isActive) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(v) ^
      const DeepCollectionEquality().hash(roles) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(firstname) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(lastname) ^
      const DeepCollectionEquality().hash(provider) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(role);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User implements User {
  factory _User(
      {bool blocked,
      bool confirmed,
      bool isActive,
      DateTime createdAt,
      DateTime updatedAt,
      int v,
      List<UserRole> roles,
      String email,
      String firstname,
      String id,
      String lastname,
      String provider,
      String userId,
      String username,
      UserRole role}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  bool get blocked;
  @override
  bool get confirmed;
  @override
  bool get isActive;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  int get v;
  @override
  List<UserRole> get roles;
  @override
  String get email;
  @override
  String get firstname;
  @override
  String get id;
  @override
  String get lastname;
  @override
  String get provider;
  @override
  String get userId;
  @override
  String get username;
  @override
  UserRole get role;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith;
}

UserRole _$UserRoleFromJson(Map<String, dynamic> json) {
  return _UserRole.fromJson(json);
}

/// @nodoc
class _$UserRoleTearOff {
  const _$UserRoleTearOff();

// ignore: unused_element
  _UserRole call(
      {DateTime createdAt,
      DateTime updatedAt,
      int v,
      String code,
      String description,
      String id,
      String name,
      String roleId,
      String type}) {
    return _UserRole(
      createdAt: createdAt,
      updatedAt: updatedAt,
      v: v,
      code: code,
      description: description,
      id: id,
      name: name,
      roleId: roleId,
      type: type,
    );
  }

// ignore: unused_element
  UserRole fromJson(Map<String, Object> json) {
    return UserRole.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $UserRole = _$UserRoleTearOff();

/// @nodoc
mixin _$UserRole {
  DateTime get createdAt;
  DateTime get updatedAt;
  int get v;
  String get code;
  String get description;
  String get id;
  String get name;
  String get roleId;
  String get type;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $UserRoleCopyWith<UserRole> get copyWith;
}

/// @nodoc
abstract class $UserRoleCopyWith<$Res> {
  factory $UserRoleCopyWith(UserRole value, $Res Function(UserRole) then) =
      _$UserRoleCopyWithImpl<$Res>;
  $Res call(
      {DateTime createdAt,
      DateTime updatedAt,
      int v,
      String code,
      String description,
      String id,
      String name,
      String roleId,
      String type});
}

/// @nodoc
class _$UserRoleCopyWithImpl<$Res> implements $UserRoleCopyWith<$Res> {
  _$UserRoleCopyWithImpl(this._value, this._then);

  final UserRole _value;
  // ignore: unused_field
  final $Res Function(UserRole) _then;

  @override
  $Res call({
    Object createdAt = freezed,
    Object updatedAt = freezed,
    Object v = freezed,
    Object code = freezed,
    Object description = freezed,
    Object id = freezed,
    Object name = freezed,
    Object roleId = freezed,
    Object type = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
      updatedAt:
          updatedAt == freezed ? _value.updatedAt : updatedAt as DateTime,
      v: v == freezed ? _value.v : v as int,
      code: code == freezed ? _value.code : code as String,
      description:
          description == freezed ? _value.description : description as String,
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      roleId: roleId == freezed ? _value.roleId : roleId as String,
      type: type == freezed ? _value.type : type as String,
    ));
  }
}

/// @nodoc
abstract class _$UserRoleCopyWith<$Res> implements $UserRoleCopyWith<$Res> {
  factory _$UserRoleCopyWith(_UserRole value, $Res Function(_UserRole) then) =
      __$UserRoleCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime createdAt,
      DateTime updatedAt,
      int v,
      String code,
      String description,
      String id,
      String name,
      String roleId,
      String type});
}

/// @nodoc
class __$UserRoleCopyWithImpl<$Res> extends _$UserRoleCopyWithImpl<$Res>
    implements _$UserRoleCopyWith<$Res> {
  __$UserRoleCopyWithImpl(_UserRole _value, $Res Function(_UserRole) _then)
      : super(_value, (v) => _then(v as _UserRole));

  @override
  _UserRole get _value => super._value as _UserRole;

  @override
  $Res call({
    Object createdAt = freezed,
    Object updatedAt = freezed,
    Object v = freezed,
    Object code = freezed,
    Object description = freezed,
    Object id = freezed,
    Object name = freezed,
    Object roleId = freezed,
    Object type = freezed,
  }) {
    return _then(_UserRole(
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
      updatedAt:
          updatedAt == freezed ? _value.updatedAt : updatedAt as DateTime,
      v: v == freezed ? _value.v : v as int,
      code: code == freezed ? _value.code : code as String,
      description:
          description == freezed ? _value.description : description as String,
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      roleId: roleId == freezed ? _value.roleId : roleId as String,
      type: type == freezed ? _value.type : type as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_UserRole implements _UserRole {
  _$_UserRole(
      {this.createdAt,
      this.updatedAt,
      this.v,
      this.code,
      this.description,
      this.id,
      this.name,
      this.roleId,
      this.type});

  factory _$_UserRole.fromJson(Map<String, dynamic> json) =>
      _$_$_UserRoleFromJson(json);

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final int v;
  @override
  final String code;
  @override
  final String description;
  @override
  final String id;
  @override
  final String name;
  @override
  final String roleId;
  @override
  final String type;

  @override
  String toString() {
    return 'UserRole(createdAt: $createdAt, updatedAt: $updatedAt, v: $v, code: $code, description: $description, id: $id, name: $name, roleId: $roleId, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserRole &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.v, v) ||
                const DeepCollectionEquality().equals(other.v, v)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.roleId, roleId) ||
                const DeepCollectionEquality().equals(other.roleId, roleId)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(v) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(roleId) ^
      const DeepCollectionEquality().hash(type);

  @JsonKey(ignore: true)
  @override
  _$UserRoleCopyWith<_UserRole> get copyWith =>
      __$UserRoleCopyWithImpl<_UserRole>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserRoleToJson(this);
  }
}

abstract class _UserRole implements UserRole {
  factory _UserRole(
      {DateTime createdAt,
      DateTime updatedAt,
      int v,
      String code,
      String description,
      String id,
      String name,
      String roleId,
      String type}) = _$_UserRole;

  factory _UserRole.fromJson(Map<String, dynamic> json) = _$_UserRole.fromJson;

  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  int get v;
  @override
  String get code;
  @override
  String get description;
  @override
  String get id;
  @override
  String get name;
  @override
  String get roleId;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$UserRoleCopyWith<_UserRole> get copyWith;
}

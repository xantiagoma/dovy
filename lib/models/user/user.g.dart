// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    blocked: json['blocked'] as bool?,
    confirmed: json['confirmed'] as bool?,
    isActive: json['isActive'] as bool?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    v: json['v'] as int?,
    roles: (json['roles'] as List<dynamic>?)
        ?.map((e) => UserRole.fromJson(e as Map<String, dynamic>))
        .toList(),
    email: json['email'] as String?,
    firstname: json['firstname'] as String?,
    id: json['id'] as int?,
    lastname: json['lastname'] as String?,
    provider: json['provider'] as String?,
    userId: json['userId'] as String?,
    username: json['username'] as String?,
    role: json['role'] == null
        ? null
        : UserRole.fromJson(json['role'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'blocked': instance.blocked,
      'confirmed': instance.confirmed,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'v': instance.v,
      'roles': instance.roles?.map((e) => e.toJson()).toList(),
      'email': instance.email,
      'firstname': instance.firstname,
      'id': instance.id,
      'lastname': instance.lastname,
      'provider': instance.provider,
      'userId': instance.userId,
      'username': instance.username,
      'role': instance.role?.toJson(),
    };

_$_UserRole _$_$_UserRoleFromJson(Map<String, dynamic> json) {
  return _$_UserRole(
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    v: json['v'] as int?,
    code: json['code'] as String?,
    description: json['description'] as String?,
    id: json['id'] as int?,
    name: json['name'] as String?,
    roleId: json['roleId'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$_$_UserRoleToJson(_$_UserRole instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'v': instance.v,
      'code': instance.code,
      'description': instance.description,
      'id': instance.id,
      'name': instance.name,
      'roleId': instance.roleId,
      'type': instance.type,
    };

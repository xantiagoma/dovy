import 'package:dovy/general.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    bool? blocked,
    bool? confirmed,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    List<UserRole>? roles,
    String? email,
    String? firstname,
    int? id,
    String? lastname,
    String? provider,
    String? userId,
    String? username,
    UserRole? role,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class UserRole with _$UserRole {
  factory UserRole({
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    String? code,
    String? description,
    int? id,
    String? name,
    String? roleId,
    String? type,
  }) = _UserRole;

  factory UserRole.fromJson(Map<String, dynamic> json) =>
      _$UserRoleFromJson(json);
}

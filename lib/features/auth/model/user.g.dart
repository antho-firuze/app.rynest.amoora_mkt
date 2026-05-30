// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: (json['id'] as num?)?.toInt(),
  roleId: (json['role_id'] as num?)?.toInt(),
  name: json['name'] as String? ?? '',
  email: json['email'] as String? ?? '',
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'role_id': instance.roleId,
  'name': instance.name,
  'email': instance.email,
};

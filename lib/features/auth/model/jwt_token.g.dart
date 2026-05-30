// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JwtToken _$JwtTokenFromJson(Map<String, dynamic> json) => _JwtToken(
  accessToken: json['access_token'] as String?,
  refreshToken: json['refresh_token'] as String?,
);

Map<String, dynamic> _$JwtTokenToJson(_JwtToken instance) => <String, dynamic>{
  'access_token': instance.accessToken,
  'refresh_token': instance.refreshToken,
};

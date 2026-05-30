// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:amoora_mkt/cff/utils/jwt_decoder.dart';

part 'jwt_token.freezed.dart';
part 'jwt_token.g.dart';

@freezed
abstract class JwtToken with _$JwtToken {
  factory JwtToken({
    // @JsonKey(name: 'token_type') @Default('Bearer') String type,
    // @JsonKey(name: 'expires_in') @Default(0) int expiresIn,
    @JsonKey(name: 'access_token') String? accessToken,
    @JsonKey(name: 'refresh_token') String? refreshToken,
  }) = _JwtToken;

  factory JwtToken.fromJson(Map<String, dynamic> json) => _$JwtTokenFromJson(json);
}

extension JwtTokenX on JwtToken {
  bool isExpired() => JwtDecoder.isExpired(accessToken!);
}

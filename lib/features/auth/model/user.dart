// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  factory User({
    int? id,
    @JsonKey(name: 'role_id') int? roleId,
    @Default('') String name,
    @Default('') String email,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

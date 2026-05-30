// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'airline.freezed.dart';
part 'airline.g.dart';

@freezed
abstract class Airline with _$Airline {
  factory Airline({
    int? id,
    @JsonKey(name: 'airline_id') int? airlineId,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'code') @Default('') String code,
    @JsonKey(name: 'image') @Default('') String image,
    @JsonKey(name: 'check_in') DateTime? checkIn,
    @JsonKey(name: 'check_out') DateTime? checkOut,
  }) = _Airline;

  factory Airline.fromJson(Map<String, dynamic> json) => _$AirlineFromJson(json);
}
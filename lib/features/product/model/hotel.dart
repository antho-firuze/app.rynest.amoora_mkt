// ignore_for_file: invalid_annotation_target

import 'package:amoora_mkt/cff/utils/json_converter_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hotel.freezed.dart';
part 'hotel.g.dart';

@freezed
abstract class Hotel with _$Hotel {
  factory Hotel({
    int? id,
    @JsonKey(name: 'hotel_id') int? hotelId,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'rating') @Default(3) @JsonIntConverter() int rating,
    @JsonKey(name: 'address') @Default('') String address,
    @JsonKey(name: 'link_map') @Default('') String linkMap,
    @JsonKey(name: 'check_in') DateTime? checkIn,
    @JsonKey(name: 'check_out') DateTime? checkOut,
  }) = _Hotel;

  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);
}

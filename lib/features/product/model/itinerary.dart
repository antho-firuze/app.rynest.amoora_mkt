// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'itinerary.freezed.dart';
part 'itinerary.g.dart';

@freezed
abstract class Itinerary with _$Itinerary {
  factory Itinerary({
    int? id,
    @JsonKey(name: 'title') @Default('') String title,
    @JsonKey(name: 'sub_title') @Default('') String subTitle,
    @JsonKey(name: 'detail_itinerary') @Default('') String desc,
    @JsonKey(name: 'activity_date') DateTime? activityDate,
  }) = _Itinerary;

  factory Itinerary.fromJson(Map<String, dynamic> json) => _$ItineraryFromJson(json);
}
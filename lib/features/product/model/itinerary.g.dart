// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Itinerary _$ItineraryFromJson(Map<String, dynamic> json) => _Itinerary(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String? ?? '',
  subTitle: json['sub_title'] as String? ?? '',
  desc: json['detail_itinerary'] as String? ?? '',
  activityDate: json['activity_date'] == null
      ? null
      : DateTime.parse(json['activity_date'] as String),
);

Map<String, dynamic> _$ItineraryToJson(_Itinerary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'sub_title': instance.subTitle,
      'detail_itinerary': instance.desc,
      'activity_date': instance.activityDate?.toIso8601String(),
    };

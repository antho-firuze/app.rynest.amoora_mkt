// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Hotel _$HotelFromJson(Map<String, dynamic> json) => _Hotel(
  id: (json['id'] as num?)?.toInt(),
  hotelId: (json['hotel_id'] as num?)?.toInt(),
  name: json['name'] as String? ?? '',
  rating: json['rating'] == null
      ? 3
      : const JsonIntConverter().fromJson(json['rating']),
  address: json['address'] as String? ?? '',
  linkMap: json['link_map'] as String? ?? '',
  checkIn: json['check_in'] == null
      ? null
      : DateTime.parse(json['check_in'] as String),
  checkOut: json['check_out'] == null
      ? null
      : DateTime.parse(json['check_out'] as String),
);

Map<String, dynamic> _$HotelToJson(_Hotel instance) => <String, dynamic>{
  'id': instance.id,
  'hotel_id': instance.hotelId,
  'name': instance.name,
  'rating': const JsonIntConverter().toJson(instance.rating),
  'address': instance.address,
  'link_map': instance.linkMap,
  'check_in': instance.checkIn?.toIso8601String(),
  'check_out': instance.checkOut?.toIso8601String(),
};

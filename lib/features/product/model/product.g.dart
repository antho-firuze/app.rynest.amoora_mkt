// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String? ?? '',
  duration: (json['duration'] as num?)?.toInt() ?? 9,
  departureDate: json['departure_date'] == null
      ? null
      : DateTime.parse(json['departure_date'] as String),
  quota: (json['quota'] as num?)?.toInt() ?? 50,
  included: json['including'] as String? ?? '',
  notIncluded: json['not_included'] as String? ?? '',
  termsConditions: json['terms_and_condition'] as String?,
  downPayment: (json['price_downpayment_rupiah'] as num?)?.toDouble() ?? 0,
  doublePrice: (json['price_total_double_rupiah'] as num?)?.toDouble() ?? 0,
  triplePrice: (json['price_total_triple_rupiah'] as num?)?.toDouble() ?? 0,
  quadPrice: (json['price_total_quad_rupiah'] as num?)?.toDouble() ?? 0,
  image: json['image'] as String? ?? '',
  categoryId: (json['product_category_id'] as num?)?.toInt() ?? 0,
  categoryName: json['product_category_name'] as String? ?? '',
  hotels: (json['hotels'] as List<dynamic>?)
      ?.map((e) => Hotel.fromJson(e as Map<String, dynamic>))
      .toList(),
  airlines: (json['airlines'] as List<dynamic>?)
      ?.map((e) => Airline.fromJson(e as Map<String, dynamic>))
      .toList(),
  itineraries: (json['itineraries'] as List<dynamic>?)
      ?.map((e) => Itinerary.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'duration': instance.duration,
  'departure_date': instance.departureDate?.toIso8601String(),
  'quota': instance.quota,
  'including': instance.included,
  'not_included': instance.notIncluded,
  'terms_and_condition': instance.termsConditions,
  'price_downpayment_rupiah': instance.downPayment,
  'price_total_double_rupiah': instance.doublePrice,
  'price_total_triple_rupiah': instance.triplePrice,
  'price_total_quad_rupiah': instance.quadPrice,
  'image': instance.image,
  'product_category_id': instance.categoryId,
  'product_category_name': instance.categoryName,
  'hotels': instance.hotels,
  'airlines': instance.airlines,
  'itineraries': instance.itineraries,
};

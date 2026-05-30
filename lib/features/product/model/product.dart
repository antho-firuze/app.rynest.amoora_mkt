// ignore_for_file: invalid_annotation_target

import 'package:amoora_mkt/features/product/model/airline.dart';
import 'package:amoora_mkt/features/product/model/hotel.dart';
import 'package:amoora_mkt/features/product/model/itinerary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
abstract class Product with _$Product {
  factory Product({
    int? id,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'duration') @Default(9) int duration,
    @JsonKey(name: 'departure_date') DateTime? departureDate,
    @JsonKey(name: 'quota') @Default(50) int quota,
    @JsonKey(name: 'including') @Default('') String included,
    @JsonKey(name: 'not_included') @Default('') String notIncluded,
    @JsonKey(name: 'terms_and_condition') String? termsConditions,
    @JsonKey(name: 'price_downpayment_rupiah') @Default(0) double downPayment,
    @JsonKey(name: 'price_total_double_rupiah') @Default(0) double doublePrice,
    @JsonKey(name: 'price_total_triple_rupiah') @Default(0) double triplePrice,
    @JsonKey(name: 'price_total_quad_rupiah') @Default(0) double quadPrice,
    @JsonKey(name: 'image') @Default('') String image,
    @JsonKey(name: 'product_category_id') @Default(0) int categoryId,
    @JsonKey(name: 'product_category_name') @Default('') String categoryName,
    List<Hotel>? hotels,
    List<Airline>? airlines,
    List<Itinerary>? itineraries,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}

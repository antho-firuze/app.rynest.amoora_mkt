// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'travel.freezed.dart';
part 'travel.g.dart';

@freezed
abstract class Travel with _$Travel {
  factory Travel({
    String? id,
    String? title,
    String? icon,
    String? hero,
    List<String>? galery,
    @JsonKey(name: 'total_seat') @Default(45) int totalSeat,
    @JsonKey(name: 'remaining_seat') @Default(45) int remainingSeat,
    @JsonKey(name: 'quad_price') @Default(0) double quadPrice,
    @JsonKey(name: 'triple_price') @Default(0) double triplePrice,
    @JsonKey(name: 'double_price') @Default(0) double doublePrice,
    @JsonKey(name: 'quad_price_tag') @Default(['29.5', '31.5']) List<String> quadPriceTag,
    @JsonKey(name: 'triple_price_tag') @Default(['30.5', '33']) List<String> triplePriceTag,
    @JsonKey(name: 'double_price_tag') @Default(['32.3', '34.7']) List<String> doublePriceTag,
    @JsonKey(name: 'departure_date') DateTime? departureDate,
    @JsonKey(name: 'departure_place') @Default(['Jakarta']) List<String> departurePlace,
    @JsonKey(name: 'travel_duration') @Default(12) int travelDuration,
    String? airline,
    @JsonKey(name: 'hotel_class') @Default([3, 4]) List<int> hotelClass,
    List<Hotel>? hotels,
    List<Flights>? flights,
    List<Transportation>? transportations,
    List<Itinerary>? itineraries,
    String? included,
    @JsonKey(name: 'not_included') String? notIncluded,
    @JsonKey(name: 'terms_conditions') String? termsConditions,
    @JsonKey(name: 'is_financial_support') @Default(false) bool isFinancialSupport,
    @Default(false) bool onPromo,
    @Default(false) bool anySpecialGuest,
    @JsonKey(name: 'is_favorite') @Default(false) bool isFavorite,
  }) = _Umroh;

  factory Travel.fromJson(Map<String, dynamic> json) => _$TravelFromJson(json);
}

@freezed
abstract class Travels with _$Travels {
  factory Travels({
    @JsonKey(name: "data") List<Travel>? travels
  }) = _Travels;

  factory Travels.fromJson(Map<String, dynamic> json) => _$TravelsFromJson(json);
}

@freezed
abstract class Hotel with _$Hotel {
  factory Hotel({
    String? image,
    String? name,
    String? desc,
    @Default(0) int star,
    String? city,
    double? lat,
    double? lng,
    @JsonKey(name: 'check_in') DateTime? checkIn,
    @JsonKey(name: 'check_out') DateTime? checkOut,
  }) = _Hotel;

  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);
}

@freezed
abstract class Flights with _$Flights {
  factory Flights({
    String? name,
    String? code,
    @JsonKey(name: 'flight_code') String? flightCode,
    @JsonKey(name: 'departure_date') DateTime? departureDate,
    @JsonKey(name: 'departure_place') String? departurePlace,
    @JsonKey(name: 'arrival_date') DateTime? arrivalDate,
    @JsonKey(name: 'arrival_place') String? arrivalPlace,
  }) = _Flights;

  factory Flights.fromJson(Map<String, dynamic> json) => _$FlightsFromJson(json);
}

@freezed
abstract class Transportation with _$Transportation {
  factory Transportation({
    String? image,
    String? name,
    String? desc,
    double? lat,
    double? lng,
  }) = _Transportation;

  factory Transportation.fromJson(Map<String, dynamic> json) => _$TransportationFromJson(json);
}

@freezed
abstract class Itinerary with _$Itinerary {
  factory Itinerary({
    DateTime? date,
    String? place,
    String? desc,
  }) = _Itinerary;

  factory Itinerary.fromJson(Map<String, dynamic> json) => _$ItineraryFromJson(json);
}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Umroh _$UmrohFromJson(Map<String, dynamic> json) => _Umroh(
  id: json['id'] as String?,
  title: json['title'] as String?,
  icon: json['icon'] as String?,
  hero: json['hero'] as String?,
  galery: (json['galery'] as List<dynamic>?)?.map((e) => e as String).toList(),
  totalSeat: (json['total_seat'] as num?)?.toInt() ?? 45,
  remainingSeat: (json['remaining_seat'] as num?)?.toInt() ?? 45,
  quadPrice: (json['quad_price'] as num?)?.toDouble() ?? 0,
  triplePrice: (json['triple_price'] as num?)?.toDouble() ?? 0,
  doublePrice: (json['double_price'] as num?)?.toDouble() ?? 0,
  quadPriceTag:
      (json['quad_price_tag'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const ['29.5', '31.5'],
  triplePriceTag:
      (json['triple_price_tag'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const ['30.5', '33'],
  doublePriceTag:
      (json['double_price_tag'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const ['32.3', '34.7'],
  departureDate: json['departure_date'] == null
      ? null
      : DateTime.parse(json['departure_date'] as String),
  departurePlace:
      (json['departure_place'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const ['Jakarta'],
  travelDuration: (json['travel_duration'] as num?)?.toInt() ?? 12,
  airline: json['airline'] as String?,
  hotelClass:
      (json['hotel_class'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const [3, 4],
  hotels: (json['hotels'] as List<dynamic>?)
      ?.map((e) => Hotel.fromJson(e as Map<String, dynamic>))
      .toList(),
  flights: (json['flights'] as List<dynamic>?)
      ?.map((e) => Flights.fromJson(e as Map<String, dynamic>))
      .toList(),
  transportations: (json['transportations'] as List<dynamic>?)
      ?.map((e) => Transportation.fromJson(e as Map<String, dynamic>))
      .toList(),
  itineraries: (json['itineraries'] as List<dynamic>?)
      ?.map((e) => Itinerary.fromJson(e as Map<String, dynamic>))
      .toList(),
  included: json['included'] as String?,
  notIncluded: json['not_included'] as String?,
  termsConditions: json['terms_conditions'] as String?,
  isFinancialSupport: json['is_financial_support'] as bool? ?? false,
  onPromo: json['onPromo'] as bool? ?? false,
  anySpecialGuest: json['anySpecialGuest'] as bool? ?? false,
  isFavorite: json['is_favorite'] as bool? ?? false,
);

Map<String, dynamic> _$UmrohToJson(_Umroh instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'icon': instance.icon,
  'hero': instance.hero,
  'galery': instance.galery,
  'total_seat': instance.totalSeat,
  'remaining_seat': instance.remainingSeat,
  'quad_price': instance.quadPrice,
  'triple_price': instance.triplePrice,
  'double_price': instance.doublePrice,
  'quad_price_tag': instance.quadPriceTag,
  'triple_price_tag': instance.triplePriceTag,
  'double_price_tag': instance.doublePriceTag,
  'departure_date': instance.departureDate?.toIso8601String(),
  'departure_place': instance.departurePlace,
  'travel_duration': instance.travelDuration,
  'airline': instance.airline,
  'hotel_class': instance.hotelClass,
  'hotels': instance.hotels,
  'flights': instance.flights,
  'transportations': instance.transportations,
  'itineraries': instance.itineraries,
  'included': instance.included,
  'not_included': instance.notIncluded,
  'terms_conditions': instance.termsConditions,
  'is_financial_support': instance.isFinancialSupport,
  'onPromo': instance.onPromo,
  'anySpecialGuest': instance.anySpecialGuest,
  'is_favorite': instance.isFavorite,
};

_Travels _$TravelsFromJson(Map<String, dynamic> json) => _Travels(
  travels: (json['data'] as List<dynamic>?)
      ?.map((e) => Travel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TravelsToJson(_Travels instance) => <String, dynamic>{
  'data': instance.travels,
};

_Hotel _$HotelFromJson(Map<String, dynamic> json) => _Hotel(
  image: json['image'] as String?,
  name: json['name'] as String?,
  desc: json['desc'] as String?,
  star: (json['star'] as num?)?.toInt() ?? 0,
  city: json['city'] as String?,
  lat: (json['lat'] as num?)?.toDouble(),
  lng: (json['lng'] as num?)?.toDouble(),
  checkIn: json['check_in'] == null
      ? null
      : DateTime.parse(json['check_in'] as String),
  checkOut: json['check_out'] == null
      ? null
      : DateTime.parse(json['check_out'] as String),
);

Map<String, dynamic> _$HotelToJson(_Hotel instance) => <String, dynamic>{
  'image': instance.image,
  'name': instance.name,
  'desc': instance.desc,
  'star': instance.star,
  'city': instance.city,
  'lat': instance.lat,
  'lng': instance.lng,
  'check_in': instance.checkIn?.toIso8601String(),
  'check_out': instance.checkOut?.toIso8601String(),
};

_Flights _$FlightsFromJson(Map<String, dynamic> json) => _Flights(
  name: json['name'] as String?,
  code: json['code'] as String?,
  flightCode: json['flight_code'] as String?,
  departureDate: json['departure_date'] == null
      ? null
      : DateTime.parse(json['departure_date'] as String),
  departurePlace: json['departure_place'] as String?,
  arrivalDate: json['arrival_date'] == null
      ? null
      : DateTime.parse(json['arrival_date'] as String),
  arrivalPlace: json['arrival_place'] as String?,
);

Map<String, dynamic> _$FlightsToJson(_Flights instance) => <String, dynamic>{
  'name': instance.name,
  'code': instance.code,
  'flight_code': instance.flightCode,
  'departure_date': instance.departureDate?.toIso8601String(),
  'departure_place': instance.departurePlace,
  'arrival_date': instance.arrivalDate?.toIso8601String(),
  'arrival_place': instance.arrivalPlace,
};

_Transportation _$TransportationFromJson(Map<String, dynamic> json) =>
    _Transportation(
      image: json['image'] as String?,
      name: json['name'] as String?,
      desc: json['desc'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TransportationToJson(_Transportation instance) =>
    <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
      'desc': instance.desc,
      'lat': instance.lat,
      'lng': instance.lng,
    };

_Itinerary _$ItineraryFromJson(Map<String, dynamic> json) => _Itinerary(
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  place: json['place'] as String?,
  desc: json['desc'] as String?,
);

Map<String, dynamic> _$ItineraryToJson(_Itinerary instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'place': instance.place,
      'desc': instance.desc,
    };

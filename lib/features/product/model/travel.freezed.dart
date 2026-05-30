// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
Travel _$TravelFromJson(
  Map<String, dynamic> json
) {
    return _Umroh.fromJson(
      json
    );
}

/// @nodoc
mixin _$Travel {

 String? get id; String? get title; String? get icon; String? get hero; List<String>? get galery;@JsonKey(name: 'total_seat') int get totalSeat;@JsonKey(name: 'remaining_seat') int get remainingSeat;@JsonKey(name: 'quad_price') double get quadPrice;@JsonKey(name: 'triple_price') double get triplePrice;@JsonKey(name: 'double_price') double get doublePrice;@JsonKey(name: 'quad_price_tag') List<String> get quadPriceTag;@JsonKey(name: 'triple_price_tag') List<String> get triplePriceTag;@JsonKey(name: 'double_price_tag') List<String> get doublePriceTag;@JsonKey(name: 'departure_date') DateTime? get departureDate;@JsonKey(name: 'departure_place') List<String> get departurePlace;@JsonKey(name: 'travel_duration') int get travelDuration; String? get airline;@JsonKey(name: 'hotel_class') List<int> get hotelClass; List<Hotel>? get hotels; List<Flights>? get flights; List<Transportation>? get transportations; List<Itinerary>? get itineraries; String? get included;@JsonKey(name: 'not_included') String? get notIncluded;@JsonKey(name: 'terms_conditions') String? get termsConditions;@JsonKey(name: 'is_financial_support') bool get isFinancialSupport; bool get onPromo; bool get anySpecialGuest;@JsonKey(name: 'is_favorite') bool get isFavorite;
/// Create a copy of Travel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TravelCopyWith<Travel> get copyWith => _$TravelCopyWithImpl<Travel>(this as Travel, _$identity);

  /// Serializes this Travel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Travel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.hero, hero) || other.hero == hero)&&const DeepCollectionEquality().equals(other.galery, galery)&&(identical(other.totalSeat, totalSeat) || other.totalSeat == totalSeat)&&(identical(other.remainingSeat, remainingSeat) || other.remainingSeat == remainingSeat)&&(identical(other.quadPrice, quadPrice) || other.quadPrice == quadPrice)&&(identical(other.triplePrice, triplePrice) || other.triplePrice == triplePrice)&&(identical(other.doublePrice, doublePrice) || other.doublePrice == doublePrice)&&const DeepCollectionEquality().equals(other.quadPriceTag, quadPriceTag)&&const DeepCollectionEquality().equals(other.triplePriceTag, triplePriceTag)&&const DeepCollectionEquality().equals(other.doublePriceTag, doublePriceTag)&&(identical(other.departureDate, departureDate) || other.departureDate == departureDate)&&const DeepCollectionEquality().equals(other.departurePlace, departurePlace)&&(identical(other.travelDuration, travelDuration) || other.travelDuration == travelDuration)&&(identical(other.airline, airline) || other.airline == airline)&&const DeepCollectionEquality().equals(other.hotelClass, hotelClass)&&const DeepCollectionEquality().equals(other.hotels, hotels)&&const DeepCollectionEquality().equals(other.flights, flights)&&const DeepCollectionEquality().equals(other.transportations, transportations)&&const DeepCollectionEquality().equals(other.itineraries, itineraries)&&(identical(other.included, included) || other.included == included)&&(identical(other.notIncluded, notIncluded) || other.notIncluded == notIncluded)&&(identical(other.termsConditions, termsConditions) || other.termsConditions == termsConditions)&&(identical(other.isFinancialSupport, isFinancialSupport) || other.isFinancialSupport == isFinancialSupport)&&(identical(other.onPromo, onPromo) || other.onPromo == onPromo)&&(identical(other.anySpecialGuest, anySpecialGuest) || other.anySpecialGuest == anySpecialGuest)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,icon,hero,const DeepCollectionEquality().hash(galery),totalSeat,remainingSeat,quadPrice,triplePrice,doublePrice,const DeepCollectionEquality().hash(quadPriceTag),const DeepCollectionEquality().hash(triplePriceTag),const DeepCollectionEquality().hash(doublePriceTag),departureDate,const DeepCollectionEquality().hash(departurePlace),travelDuration,airline,const DeepCollectionEquality().hash(hotelClass),const DeepCollectionEquality().hash(hotels),const DeepCollectionEquality().hash(flights),const DeepCollectionEquality().hash(transportations),const DeepCollectionEquality().hash(itineraries),included,notIncluded,termsConditions,isFinancialSupport,onPromo,anySpecialGuest,isFavorite]);

@override
String toString() {
  return 'Travel(id: $id, title: $title, icon: $icon, hero: $hero, galery: $galery, totalSeat: $totalSeat, remainingSeat: $remainingSeat, quadPrice: $quadPrice, triplePrice: $triplePrice, doublePrice: $doublePrice, quadPriceTag: $quadPriceTag, triplePriceTag: $triplePriceTag, doublePriceTag: $doublePriceTag, departureDate: $departureDate, departurePlace: $departurePlace, travelDuration: $travelDuration, airline: $airline, hotelClass: $hotelClass, hotels: $hotels, flights: $flights, transportations: $transportations, itineraries: $itineraries, included: $included, notIncluded: $notIncluded, termsConditions: $termsConditions, isFinancialSupport: $isFinancialSupport, onPromo: $onPromo, anySpecialGuest: $anySpecialGuest, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class $TravelCopyWith<$Res>  {
  factory $TravelCopyWith(Travel value, $Res Function(Travel) _then) = _$TravelCopyWithImpl;
@useResult
$Res call({
 String? id, String? title, String? icon, String? hero, List<String>? galery,@JsonKey(name: 'total_seat') int totalSeat,@JsonKey(name: 'remaining_seat') int remainingSeat,@JsonKey(name: 'quad_price') double quadPrice,@JsonKey(name: 'triple_price') double triplePrice,@JsonKey(name: 'double_price') double doublePrice,@JsonKey(name: 'quad_price_tag') List<String> quadPriceTag,@JsonKey(name: 'triple_price_tag') List<String> triplePriceTag,@JsonKey(name: 'double_price_tag') List<String> doublePriceTag,@JsonKey(name: 'departure_date') DateTime? departureDate,@JsonKey(name: 'departure_place') List<String> departurePlace,@JsonKey(name: 'travel_duration') int travelDuration, String? airline,@JsonKey(name: 'hotel_class') List<int> hotelClass, List<Hotel>? hotels, List<Flights>? flights, List<Transportation>? transportations, List<Itinerary>? itineraries, String? included,@JsonKey(name: 'not_included') String? notIncluded,@JsonKey(name: 'terms_conditions') String? termsConditions,@JsonKey(name: 'is_financial_support') bool isFinancialSupport, bool onPromo, bool anySpecialGuest,@JsonKey(name: 'is_favorite') bool isFavorite
});




}
/// @nodoc
class _$TravelCopyWithImpl<$Res>
    implements $TravelCopyWith<$Res> {
  _$TravelCopyWithImpl(this._self, this._then);

  final Travel _self;
  final $Res Function(Travel) _then;

/// Create a copy of Travel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? icon = freezed,Object? hero = freezed,Object? galery = freezed,Object? totalSeat = null,Object? remainingSeat = null,Object? quadPrice = null,Object? triplePrice = null,Object? doublePrice = null,Object? quadPriceTag = null,Object? triplePriceTag = null,Object? doublePriceTag = null,Object? departureDate = freezed,Object? departurePlace = null,Object? travelDuration = null,Object? airline = freezed,Object? hotelClass = null,Object? hotels = freezed,Object? flights = freezed,Object? transportations = freezed,Object? itineraries = freezed,Object? included = freezed,Object? notIncluded = freezed,Object? termsConditions = freezed,Object? isFinancialSupport = null,Object? onPromo = null,Object? anySpecialGuest = null,Object? isFavorite = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,hero: freezed == hero ? _self.hero : hero // ignore: cast_nullable_to_non_nullable
as String?,galery: freezed == galery ? _self.galery : galery // ignore: cast_nullable_to_non_nullable
as List<String>?,totalSeat: null == totalSeat ? _self.totalSeat : totalSeat // ignore: cast_nullable_to_non_nullable
as int,remainingSeat: null == remainingSeat ? _self.remainingSeat : remainingSeat // ignore: cast_nullable_to_non_nullable
as int,quadPrice: null == quadPrice ? _self.quadPrice : quadPrice // ignore: cast_nullable_to_non_nullable
as double,triplePrice: null == triplePrice ? _self.triplePrice : triplePrice // ignore: cast_nullable_to_non_nullable
as double,doublePrice: null == doublePrice ? _self.doublePrice : doublePrice // ignore: cast_nullable_to_non_nullable
as double,quadPriceTag: null == quadPriceTag ? _self.quadPriceTag : quadPriceTag // ignore: cast_nullable_to_non_nullable
as List<String>,triplePriceTag: null == triplePriceTag ? _self.triplePriceTag : triplePriceTag // ignore: cast_nullable_to_non_nullable
as List<String>,doublePriceTag: null == doublePriceTag ? _self.doublePriceTag : doublePriceTag // ignore: cast_nullable_to_non_nullable
as List<String>,departureDate: freezed == departureDate ? _self.departureDate : departureDate // ignore: cast_nullable_to_non_nullable
as DateTime?,departurePlace: null == departurePlace ? _self.departurePlace : departurePlace // ignore: cast_nullable_to_non_nullable
as List<String>,travelDuration: null == travelDuration ? _self.travelDuration : travelDuration // ignore: cast_nullable_to_non_nullable
as int,airline: freezed == airline ? _self.airline : airline // ignore: cast_nullable_to_non_nullable
as String?,hotelClass: null == hotelClass ? _self.hotelClass : hotelClass // ignore: cast_nullable_to_non_nullable
as List<int>,hotels: freezed == hotels ? _self.hotels : hotels // ignore: cast_nullable_to_non_nullable
as List<Hotel>?,flights: freezed == flights ? _self.flights : flights // ignore: cast_nullable_to_non_nullable
as List<Flights>?,transportations: freezed == transportations ? _self.transportations : transportations // ignore: cast_nullable_to_non_nullable
as List<Transportation>?,itineraries: freezed == itineraries ? _self.itineraries : itineraries // ignore: cast_nullable_to_non_nullable
as List<Itinerary>?,included: freezed == included ? _self.included : included // ignore: cast_nullable_to_non_nullable
as String?,notIncluded: freezed == notIncluded ? _self.notIncluded : notIncluded // ignore: cast_nullable_to_non_nullable
as String?,termsConditions: freezed == termsConditions ? _self.termsConditions : termsConditions // ignore: cast_nullable_to_non_nullable
as String?,isFinancialSupport: null == isFinancialSupport ? _self.isFinancialSupport : isFinancialSupport // ignore: cast_nullable_to_non_nullable
as bool,onPromo: null == onPromo ? _self.onPromo : onPromo // ignore: cast_nullable_to_non_nullable
as bool,anySpecialGuest: null == anySpecialGuest ? _self.anySpecialGuest : anySpecialGuest // ignore: cast_nullable_to_non_nullable
as bool,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Travel].
extension TravelPatterns on Travel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Umroh value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Umroh() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Umroh value)  $default,){
final _that = this;
switch (_that) {
case _Umroh():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Umroh value)?  $default,){
final _that = this;
switch (_that) {
case _Umroh() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? title,  String? icon,  String? hero,  List<String>? galery, @JsonKey(name: 'total_seat')  int totalSeat, @JsonKey(name: 'remaining_seat')  int remainingSeat, @JsonKey(name: 'quad_price')  double quadPrice, @JsonKey(name: 'triple_price')  double triplePrice, @JsonKey(name: 'double_price')  double doublePrice, @JsonKey(name: 'quad_price_tag')  List<String> quadPriceTag, @JsonKey(name: 'triple_price_tag')  List<String> triplePriceTag, @JsonKey(name: 'double_price_tag')  List<String> doublePriceTag, @JsonKey(name: 'departure_date')  DateTime? departureDate, @JsonKey(name: 'departure_place')  List<String> departurePlace, @JsonKey(name: 'travel_duration')  int travelDuration,  String? airline, @JsonKey(name: 'hotel_class')  List<int> hotelClass,  List<Hotel>? hotels,  List<Flights>? flights,  List<Transportation>? transportations,  List<Itinerary>? itineraries,  String? included, @JsonKey(name: 'not_included')  String? notIncluded, @JsonKey(name: 'terms_conditions')  String? termsConditions, @JsonKey(name: 'is_financial_support')  bool isFinancialSupport,  bool onPromo,  bool anySpecialGuest, @JsonKey(name: 'is_favorite')  bool isFavorite)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Umroh() when $default != null:
return $default(_that.id,_that.title,_that.icon,_that.hero,_that.galery,_that.totalSeat,_that.remainingSeat,_that.quadPrice,_that.triplePrice,_that.doublePrice,_that.quadPriceTag,_that.triplePriceTag,_that.doublePriceTag,_that.departureDate,_that.departurePlace,_that.travelDuration,_that.airline,_that.hotelClass,_that.hotels,_that.flights,_that.transportations,_that.itineraries,_that.included,_that.notIncluded,_that.termsConditions,_that.isFinancialSupport,_that.onPromo,_that.anySpecialGuest,_that.isFavorite);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? title,  String? icon,  String? hero,  List<String>? galery, @JsonKey(name: 'total_seat')  int totalSeat, @JsonKey(name: 'remaining_seat')  int remainingSeat, @JsonKey(name: 'quad_price')  double quadPrice, @JsonKey(name: 'triple_price')  double triplePrice, @JsonKey(name: 'double_price')  double doublePrice, @JsonKey(name: 'quad_price_tag')  List<String> quadPriceTag, @JsonKey(name: 'triple_price_tag')  List<String> triplePriceTag, @JsonKey(name: 'double_price_tag')  List<String> doublePriceTag, @JsonKey(name: 'departure_date')  DateTime? departureDate, @JsonKey(name: 'departure_place')  List<String> departurePlace, @JsonKey(name: 'travel_duration')  int travelDuration,  String? airline, @JsonKey(name: 'hotel_class')  List<int> hotelClass,  List<Hotel>? hotels,  List<Flights>? flights,  List<Transportation>? transportations,  List<Itinerary>? itineraries,  String? included, @JsonKey(name: 'not_included')  String? notIncluded, @JsonKey(name: 'terms_conditions')  String? termsConditions, @JsonKey(name: 'is_financial_support')  bool isFinancialSupport,  bool onPromo,  bool anySpecialGuest, @JsonKey(name: 'is_favorite')  bool isFavorite)  $default,) {final _that = this;
switch (_that) {
case _Umroh():
return $default(_that.id,_that.title,_that.icon,_that.hero,_that.galery,_that.totalSeat,_that.remainingSeat,_that.quadPrice,_that.triplePrice,_that.doublePrice,_that.quadPriceTag,_that.triplePriceTag,_that.doublePriceTag,_that.departureDate,_that.departurePlace,_that.travelDuration,_that.airline,_that.hotelClass,_that.hotels,_that.flights,_that.transportations,_that.itineraries,_that.included,_that.notIncluded,_that.termsConditions,_that.isFinancialSupport,_that.onPromo,_that.anySpecialGuest,_that.isFavorite);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? title,  String? icon,  String? hero,  List<String>? galery, @JsonKey(name: 'total_seat')  int totalSeat, @JsonKey(name: 'remaining_seat')  int remainingSeat, @JsonKey(name: 'quad_price')  double quadPrice, @JsonKey(name: 'triple_price')  double triplePrice, @JsonKey(name: 'double_price')  double doublePrice, @JsonKey(name: 'quad_price_tag')  List<String> quadPriceTag, @JsonKey(name: 'triple_price_tag')  List<String> triplePriceTag, @JsonKey(name: 'double_price_tag')  List<String> doublePriceTag, @JsonKey(name: 'departure_date')  DateTime? departureDate, @JsonKey(name: 'departure_place')  List<String> departurePlace, @JsonKey(name: 'travel_duration')  int travelDuration,  String? airline, @JsonKey(name: 'hotel_class')  List<int> hotelClass,  List<Hotel>? hotels,  List<Flights>? flights,  List<Transportation>? transportations,  List<Itinerary>? itineraries,  String? included, @JsonKey(name: 'not_included')  String? notIncluded, @JsonKey(name: 'terms_conditions')  String? termsConditions, @JsonKey(name: 'is_financial_support')  bool isFinancialSupport,  bool onPromo,  bool anySpecialGuest, @JsonKey(name: 'is_favorite')  bool isFavorite)?  $default,) {final _that = this;
switch (_that) {
case _Umroh() when $default != null:
return $default(_that.id,_that.title,_that.icon,_that.hero,_that.galery,_that.totalSeat,_that.remainingSeat,_that.quadPrice,_that.triplePrice,_that.doublePrice,_that.quadPriceTag,_that.triplePriceTag,_that.doublePriceTag,_that.departureDate,_that.departurePlace,_that.travelDuration,_that.airline,_that.hotelClass,_that.hotels,_that.flights,_that.transportations,_that.itineraries,_that.included,_that.notIncluded,_that.termsConditions,_that.isFinancialSupport,_that.onPromo,_that.anySpecialGuest,_that.isFavorite);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Umroh implements Travel {
   _Umroh({this.id, this.title, this.icon, this.hero, final  List<String>? galery, @JsonKey(name: 'total_seat') this.totalSeat = 45, @JsonKey(name: 'remaining_seat') this.remainingSeat = 45, @JsonKey(name: 'quad_price') this.quadPrice = 0, @JsonKey(name: 'triple_price') this.triplePrice = 0, @JsonKey(name: 'double_price') this.doublePrice = 0, @JsonKey(name: 'quad_price_tag') final  List<String> quadPriceTag = const ['29.5', '31.5'], @JsonKey(name: 'triple_price_tag') final  List<String> triplePriceTag = const ['30.5', '33'], @JsonKey(name: 'double_price_tag') final  List<String> doublePriceTag = const ['32.3', '34.7'], @JsonKey(name: 'departure_date') this.departureDate, @JsonKey(name: 'departure_place') final  List<String> departurePlace = const ['Jakarta'], @JsonKey(name: 'travel_duration') this.travelDuration = 12, this.airline, @JsonKey(name: 'hotel_class') final  List<int> hotelClass = const [3, 4], final  List<Hotel>? hotels, final  List<Flights>? flights, final  List<Transportation>? transportations, final  List<Itinerary>? itineraries, this.included, @JsonKey(name: 'not_included') this.notIncluded, @JsonKey(name: 'terms_conditions') this.termsConditions, @JsonKey(name: 'is_financial_support') this.isFinancialSupport = false, this.onPromo = false, this.anySpecialGuest = false, @JsonKey(name: 'is_favorite') this.isFavorite = false}): _galery = galery,_quadPriceTag = quadPriceTag,_triplePriceTag = triplePriceTag,_doublePriceTag = doublePriceTag,_departurePlace = departurePlace,_hotelClass = hotelClass,_hotels = hotels,_flights = flights,_transportations = transportations,_itineraries = itineraries;
  factory _Umroh.fromJson(Map<String, dynamic> json) => _$UmrohFromJson(json);

@override final  String? id;
@override final  String? title;
@override final  String? icon;
@override final  String? hero;
 final  List<String>? _galery;
@override List<String>? get galery {
  final value = _galery;
  if (value == null) return null;
  if (_galery is EqualUnmodifiableListView) return _galery;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'total_seat') final  int totalSeat;
@override@JsonKey(name: 'remaining_seat') final  int remainingSeat;
@override@JsonKey(name: 'quad_price') final  double quadPrice;
@override@JsonKey(name: 'triple_price') final  double triplePrice;
@override@JsonKey(name: 'double_price') final  double doublePrice;
 final  List<String> _quadPriceTag;
@override@JsonKey(name: 'quad_price_tag') List<String> get quadPriceTag {
  if (_quadPriceTag is EqualUnmodifiableListView) return _quadPriceTag;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_quadPriceTag);
}

 final  List<String> _triplePriceTag;
@override@JsonKey(name: 'triple_price_tag') List<String> get triplePriceTag {
  if (_triplePriceTag is EqualUnmodifiableListView) return _triplePriceTag;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_triplePriceTag);
}

 final  List<String> _doublePriceTag;
@override@JsonKey(name: 'double_price_tag') List<String> get doublePriceTag {
  if (_doublePriceTag is EqualUnmodifiableListView) return _doublePriceTag;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_doublePriceTag);
}

@override@JsonKey(name: 'departure_date') final  DateTime? departureDate;
 final  List<String> _departurePlace;
@override@JsonKey(name: 'departure_place') List<String> get departurePlace {
  if (_departurePlace is EqualUnmodifiableListView) return _departurePlace;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_departurePlace);
}

@override@JsonKey(name: 'travel_duration') final  int travelDuration;
@override final  String? airline;
 final  List<int> _hotelClass;
@override@JsonKey(name: 'hotel_class') List<int> get hotelClass {
  if (_hotelClass is EqualUnmodifiableListView) return _hotelClass;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hotelClass);
}

 final  List<Hotel>? _hotels;
@override List<Hotel>? get hotels {
  final value = _hotels;
  if (value == null) return null;
  if (_hotels is EqualUnmodifiableListView) return _hotels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Flights>? _flights;
@override List<Flights>? get flights {
  final value = _flights;
  if (value == null) return null;
  if (_flights is EqualUnmodifiableListView) return _flights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Transportation>? _transportations;
@override List<Transportation>? get transportations {
  final value = _transportations;
  if (value == null) return null;
  if (_transportations is EqualUnmodifiableListView) return _transportations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Itinerary>? _itineraries;
@override List<Itinerary>? get itineraries {
  final value = _itineraries;
  if (value == null) return null;
  if (_itineraries is EqualUnmodifiableListView) return _itineraries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? included;
@override@JsonKey(name: 'not_included') final  String? notIncluded;
@override@JsonKey(name: 'terms_conditions') final  String? termsConditions;
@override@JsonKey(name: 'is_financial_support') final  bool isFinancialSupport;
@override@JsonKey() final  bool onPromo;
@override@JsonKey() final  bool anySpecialGuest;
@override@JsonKey(name: 'is_favorite') final  bool isFavorite;

/// Create a copy of Travel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UmrohCopyWith<_Umroh> get copyWith => __$UmrohCopyWithImpl<_Umroh>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UmrohToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Umroh&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.hero, hero) || other.hero == hero)&&const DeepCollectionEquality().equals(other._galery, _galery)&&(identical(other.totalSeat, totalSeat) || other.totalSeat == totalSeat)&&(identical(other.remainingSeat, remainingSeat) || other.remainingSeat == remainingSeat)&&(identical(other.quadPrice, quadPrice) || other.quadPrice == quadPrice)&&(identical(other.triplePrice, triplePrice) || other.triplePrice == triplePrice)&&(identical(other.doublePrice, doublePrice) || other.doublePrice == doublePrice)&&const DeepCollectionEquality().equals(other._quadPriceTag, _quadPriceTag)&&const DeepCollectionEquality().equals(other._triplePriceTag, _triplePriceTag)&&const DeepCollectionEquality().equals(other._doublePriceTag, _doublePriceTag)&&(identical(other.departureDate, departureDate) || other.departureDate == departureDate)&&const DeepCollectionEquality().equals(other._departurePlace, _departurePlace)&&(identical(other.travelDuration, travelDuration) || other.travelDuration == travelDuration)&&(identical(other.airline, airline) || other.airline == airline)&&const DeepCollectionEquality().equals(other._hotelClass, _hotelClass)&&const DeepCollectionEquality().equals(other._hotels, _hotels)&&const DeepCollectionEquality().equals(other._flights, _flights)&&const DeepCollectionEquality().equals(other._transportations, _transportations)&&const DeepCollectionEquality().equals(other._itineraries, _itineraries)&&(identical(other.included, included) || other.included == included)&&(identical(other.notIncluded, notIncluded) || other.notIncluded == notIncluded)&&(identical(other.termsConditions, termsConditions) || other.termsConditions == termsConditions)&&(identical(other.isFinancialSupport, isFinancialSupport) || other.isFinancialSupport == isFinancialSupport)&&(identical(other.onPromo, onPromo) || other.onPromo == onPromo)&&(identical(other.anySpecialGuest, anySpecialGuest) || other.anySpecialGuest == anySpecialGuest)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,icon,hero,const DeepCollectionEquality().hash(_galery),totalSeat,remainingSeat,quadPrice,triplePrice,doublePrice,const DeepCollectionEquality().hash(_quadPriceTag),const DeepCollectionEquality().hash(_triplePriceTag),const DeepCollectionEquality().hash(_doublePriceTag),departureDate,const DeepCollectionEquality().hash(_departurePlace),travelDuration,airline,const DeepCollectionEquality().hash(_hotelClass),const DeepCollectionEquality().hash(_hotels),const DeepCollectionEquality().hash(_flights),const DeepCollectionEquality().hash(_transportations),const DeepCollectionEquality().hash(_itineraries),included,notIncluded,termsConditions,isFinancialSupport,onPromo,anySpecialGuest,isFavorite]);

@override
String toString() {
  return 'Travel(id: $id, title: $title, icon: $icon, hero: $hero, galery: $galery, totalSeat: $totalSeat, remainingSeat: $remainingSeat, quadPrice: $quadPrice, triplePrice: $triplePrice, doublePrice: $doublePrice, quadPriceTag: $quadPriceTag, triplePriceTag: $triplePriceTag, doublePriceTag: $doublePriceTag, departureDate: $departureDate, departurePlace: $departurePlace, travelDuration: $travelDuration, airline: $airline, hotelClass: $hotelClass, hotels: $hotels, flights: $flights, transportations: $transportations, itineraries: $itineraries, included: $included, notIncluded: $notIncluded, termsConditions: $termsConditions, isFinancialSupport: $isFinancialSupport, onPromo: $onPromo, anySpecialGuest: $anySpecialGuest, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class _$UmrohCopyWith<$Res> implements $TravelCopyWith<$Res> {
  factory _$UmrohCopyWith(_Umroh value, $Res Function(_Umroh) _then) = __$UmrohCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? title, String? icon, String? hero, List<String>? galery,@JsonKey(name: 'total_seat') int totalSeat,@JsonKey(name: 'remaining_seat') int remainingSeat,@JsonKey(name: 'quad_price') double quadPrice,@JsonKey(name: 'triple_price') double triplePrice,@JsonKey(name: 'double_price') double doublePrice,@JsonKey(name: 'quad_price_tag') List<String> quadPriceTag,@JsonKey(name: 'triple_price_tag') List<String> triplePriceTag,@JsonKey(name: 'double_price_tag') List<String> doublePriceTag,@JsonKey(name: 'departure_date') DateTime? departureDate,@JsonKey(name: 'departure_place') List<String> departurePlace,@JsonKey(name: 'travel_duration') int travelDuration, String? airline,@JsonKey(name: 'hotel_class') List<int> hotelClass, List<Hotel>? hotels, List<Flights>? flights, List<Transportation>? transportations, List<Itinerary>? itineraries, String? included,@JsonKey(name: 'not_included') String? notIncluded,@JsonKey(name: 'terms_conditions') String? termsConditions,@JsonKey(name: 'is_financial_support') bool isFinancialSupport, bool onPromo, bool anySpecialGuest,@JsonKey(name: 'is_favorite') bool isFavorite
});




}
/// @nodoc
class __$UmrohCopyWithImpl<$Res>
    implements _$UmrohCopyWith<$Res> {
  __$UmrohCopyWithImpl(this._self, this._then);

  final _Umroh _self;
  final $Res Function(_Umroh) _then;

/// Create a copy of Travel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? icon = freezed,Object? hero = freezed,Object? galery = freezed,Object? totalSeat = null,Object? remainingSeat = null,Object? quadPrice = null,Object? triplePrice = null,Object? doublePrice = null,Object? quadPriceTag = null,Object? triplePriceTag = null,Object? doublePriceTag = null,Object? departureDate = freezed,Object? departurePlace = null,Object? travelDuration = null,Object? airline = freezed,Object? hotelClass = null,Object? hotels = freezed,Object? flights = freezed,Object? transportations = freezed,Object? itineraries = freezed,Object? included = freezed,Object? notIncluded = freezed,Object? termsConditions = freezed,Object? isFinancialSupport = null,Object? onPromo = null,Object? anySpecialGuest = null,Object? isFavorite = null,}) {
  return _then(_Umroh(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,hero: freezed == hero ? _self.hero : hero // ignore: cast_nullable_to_non_nullable
as String?,galery: freezed == galery ? _self._galery : galery // ignore: cast_nullable_to_non_nullable
as List<String>?,totalSeat: null == totalSeat ? _self.totalSeat : totalSeat // ignore: cast_nullable_to_non_nullable
as int,remainingSeat: null == remainingSeat ? _self.remainingSeat : remainingSeat // ignore: cast_nullable_to_non_nullable
as int,quadPrice: null == quadPrice ? _self.quadPrice : quadPrice // ignore: cast_nullable_to_non_nullable
as double,triplePrice: null == triplePrice ? _self.triplePrice : triplePrice // ignore: cast_nullable_to_non_nullable
as double,doublePrice: null == doublePrice ? _self.doublePrice : doublePrice // ignore: cast_nullable_to_non_nullable
as double,quadPriceTag: null == quadPriceTag ? _self._quadPriceTag : quadPriceTag // ignore: cast_nullable_to_non_nullable
as List<String>,triplePriceTag: null == triplePriceTag ? _self._triplePriceTag : triplePriceTag // ignore: cast_nullable_to_non_nullable
as List<String>,doublePriceTag: null == doublePriceTag ? _self._doublePriceTag : doublePriceTag // ignore: cast_nullable_to_non_nullable
as List<String>,departureDate: freezed == departureDate ? _self.departureDate : departureDate // ignore: cast_nullable_to_non_nullable
as DateTime?,departurePlace: null == departurePlace ? _self._departurePlace : departurePlace // ignore: cast_nullable_to_non_nullable
as List<String>,travelDuration: null == travelDuration ? _self.travelDuration : travelDuration // ignore: cast_nullable_to_non_nullable
as int,airline: freezed == airline ? _self.airline : airline // ignore: cast_nullable_to_non_nullable
as String?,hotelClass: null == hotelClass ? _self._hotelClass : hotelClass // ignore: cast_nullable_to_non_nullable
as List<int>,hotels: freezed == hotels ? _self._hotels : hotels // ignore: cast_nullable_to_non_nullable
as List<Hotel>?,flights: freezed == flights ? _self._flights : flights // ignore: cast_nullable_to_non_nullable
as List<Flights>?,transportations: freezed == transportations ? _self._transportations : transportations // ignore: cast_nullable_to_non_nullable
as List<Transportation>?,itineraries: freezed == itineraries ? _self._itineraries : itineraries // ignore: cast_nullable_to_non_nullable
as List<Itinerary>?,included: freezed == included ? _self.included : included // ignore: cast_nullable_to_non_nullable
as String?,notIncluded: freezed == notIncluded ? _self.notIncluded : notIncluded // ignore: cast_nullable_to_non_nullable
as String?,termsConditions: freezed == termsConditions ? _self.termsConditions : termsConditions // ignore: cast_nullable_to_non_nullable
as String?,isFinancialSupport: null == isFinancialSupport ? _self.isFinancialSupport : isFinancialSupport // ignore: cast_nullable_to_non_nullable
as bool,onPromo: null == onPromo ? _self.onPromo : onPromo // ignore: cast_nullable_to_non_nullable
as bool,anySpecialGuest: null == anySpecialGuest ? _self.anySpecialGuest : anySpecialGuest // ignore: cast_nullable_to_non_nullable
as bool,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$Travels {

@JsonKey(name: "data") List<Travel>? get travels;
/// Create a copy of Travels
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TravelsCopyWith<Travels> get copyWith => _$TravelsCopyWithImpl<Travels>(this as Travels, _$identity);

  /// Serializes this Travels to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Travels&&const DeepCollectionEquality().equals(other.travels, travels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(travels));

@override
String toString() {
  return 'Travels(travels: $travels)';
}


}

/// @nodoc
abstract mixin class $TravelsCopyWith<$Res>  {
  factory $TravelsCopyWith(Travels value, $Res Function(Travels) _then) = _$TravelsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "data") List<Travel>? travels
});




}
/// @nodoc
class _$TravelsCopyWithImpl<$Res>
    implements $TravelsCopyWith<$Res> {
  _$TravelsCopyWithImpl(this._self, this._then);

  final Travels _self;
  final $Res Function(Travels) _then;

/// Create a copy of Travels
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? travels = freezed,}) {
  return _then(_self.copyWith(
travels: freezed == travels ? _self.travels : travels // ignore: cast_nullable_to_non_nullable
as List<Travel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Travels].
extension TravelsPatterns on Travels {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Travels value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Travels() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Travels value)  $default,){
final _that = this;
switch (_that) {
case _Travels():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Travels value)?  $default,){
final _that = this;
switch (_that) {
case _Travels() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "data")  List<Travel>? travels)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Travels() when $default != null:
return $default(_that.travels);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "data")  List<Travel>? travels)  $default,) {final _that = this;
switch (_that) {
case _Travels():
return $default(_that.travels);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "data")  List<Travel>? travels)?  $default,) {final _that = this;
switch (_that) {
case _Travels() when $default != null:
return $default(_that.travels);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Travels implements Travels {
   _Travels({@JsonKey(name: "data") final  List<Travel>? travels}): _travels = travels;
  factory _Travels.fromJson(Map<String, dynamic> json) => _$TravelsFromJson(json);

 final  List<Travel>? _travels;
@override@JsonKey(name: "data") List<Travel>? get travels {
  final value = _travels;
  if (value == null) return null;
  if (_travels is EqualUnmodifiableListView) return _travels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Travels
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TravelsCopyWith<_Travels> get copyWith => __$TravelsCopyWithImpl<_Travels>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TravelsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Travels&&const DeepCollectionEquality().equals(other._travels, _travels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_travels));

@override
String toString() {
  return 'Travels(travels: $travels)';
}


}

/// @nodoc
abstract mixin class _$TravelsCopyWith<$Res> implements $TravelsCopyWith<$Res> {
  factory _$TravelsCopyWith(_Travels value, $Res Function(_Travels) _then) = __$TravelsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "data") List<Travel>? travels
});




}
/// @nodoc
class __$TravelsCopyWithImpl<$Res>
    implements _$TravelsCopyWith<$Res> {
  __$TravelsCopyWithImpl(this._self, this._then);

  final _Travels _self;
  final $Res Function(_Travels) _then;

/// Create a copy of Travels
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? travels = freezed,}) {
  return _then(_Travels(
travels: freezed == travels ? _self._travels : travels // ignore: cast_nullable_to_non_nullable
as List<Travel>?,
  ));
}


}


/// @nodoc
mixin _$Hotel {

 String? get image; String? get name; String? get desc; int get star; String? get city; double? get lat; double? get lng;@JsonKey(name: 'check_in') DateTime? get checkIn;@JsonKey(name: 'check_out') DateTime? get checkOut;
/// Create a copy of Hotel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotelCopyWith<Hotel> get copyWith => _$HotelCopyWithImpl<Hotel>(this as Hotel, _$identity);

  /// Serializes this Hotel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Hotel&&(identical(other.image, image) || other.image == image)&&(identical(other.name, name) || other.name == name)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.star, star) || other.star == star)&&(identical(other.city, city) || other.city == city)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.checkIn, checkIn) || other.checkIn == checkIn)&&(identical(other.checkOut, checkOut) || other.checkOut == checkOut));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,image,name,desc,star,city,lat,lng,checkIn,checkOut);

@override
String toString() {
  return 'Hotel(image: $image, name: $name, desc: $desc, star: $star, city: $city, lat: $lat, lng: $lng, checkIn: $checkIn, checkOut: $checkOut)';
}


}

/// @nodoc
abstract mixin class $HotelCopyWith<$Res>  {
  factory $HotelCopyWith(Hotel value, $Res Function(Hotel) _then) = _$HotelCopyWithImpl;
@useResult
$Res call({
 String? image, String? name, String? desc, int star, String? city, double? lat, double? lng,@JsonKey(name: 'check_in') DateTime? checkIn,@JsonKey(name: 'check_out') DateTime? checkOut
});




}
/// @nodoc
class _$HotelCopyWithImpl<$Res>
    implements $HotelCopyWith<$Res> {
  _$HotelCopyWithImpl(this._self, this._then);

  final Hotel _self;
  final $Res Function(Hotel) _then;

/// Create a copy of Hotel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? image = freezed,Object? name = freezed,Object? desc = freezed,Object? star = null,Object? city = freezed,Object? lat = freezed,Object? lng = freezed,Object? checkIn = freezed,Object? checkOut = freezed,}) {
  return _then(_self.copyWith(
image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,desc: freezed == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String?,star: null == star ? _self.star : star // ignore: cast_nullable_to_non_nullable
as int,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,checkIn: freezed == checkIn ? _self.checkIn : checkIn // ignore: cast_nullable_to_non_nullable
as DateTime?,checkOut: freezed == checkOut ? _self.checkOut : checkOut // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Hotel].
extension HotelPatterns on Hotel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Hotel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Hotel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Hotel value)  $default,){
final _that = this;
switch (_that) {
case _Hotel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Hotel value)?  $default,){
final _that = this;
switch (_that) {
case _Hotel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? image,  String? name,  String? desc,  int star,  String? city,  double? lat,  double? lng, @JsonKey(name: 'check_in')  DateTime? checkIn, @JsonKey(name: 'check_out')  DateTime? checkOut)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Hotel() when $default != null:
return $default(_that.image,_that.name,_that.desc,_that.star,_that.city,_that.lat,_that.lng,_that.checkIn,_that.checkOut);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? image,  String? name,  String? desc,  int star,  String? city,  double? lat,  double? lng, @JsonKey(name: 'check_in')  DateTime? checkIn, @JsonKey(name: 'check_out')  DateTime? checkOut)  $default,) {final _that = this;
switch (_that) {
case _Hotel():
return $default(_that.image,_that.name,_that.desc,_that.star,_that.city,_that.lat,_that.lng,_that.checkIn,_that.checkOut);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? image,  String? name,  String? desc,  int star,  String? city,  double? lat,  double? lng, @JsonKey(name: 'check_in')  DateTime? checkIn, @JsonKey(name: 'check_out')  DateTime? checkOut)?  $default,) {final _that = this;
switch (_that) {
case _Hotel() when $default != null:
return $default(_that.image,_that.name,_that.desc,_that.star,_that.city,_that.lat,_that.lng,_that.checkIn,_that.checkOut);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Hotel implements Hotel {
   _Hotel({this.image, this.name, this.desc, this.star = 0, this.city, this.lat, this.lng, @JsonKey(name: 'check_in') this.checkIn, @JsonKey(name: 'check_out') this.checkOut});
  factory _Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);

@override final  String? image;
@override final  String? name;
@override final  String? desc;
@override@JsonKey() final  int star;
@override final  String? city;
@override final  double? lat;
@override final  double? lng;
@override@JsonKey(name: 'check_in') final  DateTime? checkIn;
@override@JsonKey(name: 'check_out') final  DateTime? checkOut;

/// Create a copy of Hotel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotelCopyWith<_Hotel> get copyWith => __$HotelCopyWithImpl<_Hotel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HotelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Hotel&&(identical(other.image, image) || other.image == image)&&(identical(other.name, name) || other.name == name)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.star, star) || other.star == star)&&(identical(other.city, city) || other.city == city)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.checkIn, checkIn) || other.checkIn == checkIn)&&(identical(other.checkOut, checkOut) || other.checkOut == checkOut));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,image,name,desc,star,city,lat,lng,checkIn,checkOut);

@override
String toString() {
  return 'Hotel(image: $image, name: $name, desc: $desc, star: $star, city: $city, lat: $lat, lng: $lng, checkIn: $checkIn, checkOut: $checkOut)';
}


}

/// @nodoc
abstract mixin class _$HotelCopyWith<$Res> implements $HotelCopyWith<$Res> {
  factory _$HotelCopyWith(_Hotel value, $Res Function(_Hotel) _then) = __$HotelCopyWithImpl;
@override @useResult
$Res call({
 String? image, String? name, String? desc, int star, String? city, double? lat, double? lng,@JsonKey(name: 'check_in') DateTime? checkIn,@JsonKey(name: 'check_out') DateTime? checkOut
});




}
/// @nodoc
class __$HotelCopyWithImpl<$Res>
    implements _$HotelCopyWith<$Res> {
  __$HotelCopyWithImpl(this._self, this._then);

  final _Hotel _self;
  final $Res Function(_Hotel) _then;

/// Create a copy of Hotel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? image = freezed,Object? name = freezed,Object? desc = freezed,Object? star = null,Object? city = freezed,Object? lat = freezed,Object? lng = freezed,Object? checkIn = freezed,Object? checkOut = freezed,}) {
  return _then(_Hotel(
image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,desc: freezed == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String?,star: null == star ? _self.star : star // ignore: cast_nullable_to_non_nullable
as int,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,checkIn: freezed == checkIn ? _self.checkIn : checkIn // ignore: cast_nullable_to_non_nullable
as DateTime?,checkOut: freezed == checkOut ? _self.checkOut : checkOut // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$Flights {

 String? get name; String? get code;@JsonKey(name: 'flight_code') String? get flightCode;@JsonKey(name: 'departure_date') DateTime? get departureDate;@JsonKey(name: 'departure_place') String? get departurePlace;@JsonKey(name: 'arrival_date') DateTime? get arrivalDate;@JsonKey(name: 'arrival_place') String? get arrivalPlace;
/// Create a copy of Flights
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlightsCopyWith<Flights> get copyWith => _$FlightsCopyWithImpl<Flights>(this as Flights, _$identity);

  /// Serializes this Flights to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Flights&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.flightCode, flightCode) || other.flightCode == flightCode)&&(identical(other.departureDate, departureDate) || other.departureDate == departureDate)&&(identical(other.departurePlace, departurePlace) || other.departurePlace == departurePlace)&&(identical(other.arrivalDate, arrivalDate) || other.arrivalDate == arrivalDate)&&(identical(other.arrivalPlace, arrivalPlace) || other.arrivalPlace == arrivalPlace));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code,flightCode,departureDate,departurePlace,arrivalDate,arrivalPlace);

@override
String toString() {
  return 'Flights(name: $name, code: $code, flightCode: $flightCode, departureDate: $departureDate, departurePlace: $departurePlace, arrivalDate: $arrivalDate, arrivalPlace: $arrivalPlace)';
}


}

/// @nodoc
abstract mixin class $FlightsCopyWith<$Res>  {
  factory $FlightsCopyWith(Flights value, $Res Function(Flights) _then) = _$FlightsCopyWithImpl;
@useResult
$Res call({
 String? name, String? code,@JsonKey(name: 'flight_code') String? flightCode,@JsonKey(name: 'departure_date') DateTime? departureDate,@JsonKey(name: 'departure_place') String? departurePlace,@JsonKey(name: 'arrival_date') DateTime? arrivalDate,@JsonKey(name: 'arrival_place') String? arrivalPlace
});




}
/// @nodoc
class _$FlightsCopyWithImpl<$Res>
    implements $FlightsCopyWith<$Res> {
  _$FlightsCopyWithImpl(this._self, this._then);

  final Flights _self;
  final $Res Function(Flights) _then;

/// Create a copy of Flights
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? code = freezed,Object? flightCode = freezed,Object? departureDate = freezed,Object? departurePlace = freezed,Object? arrivalDate = freezed,Object? arrivalPlace = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,flightCode: freezed == flightCode ? _self.flightCode : flightCode // ignore: cast_nullable_to_non_nullable
as String?,departureDate: freezed == departureDate ? _self.departureDate : departureDate // ignore: cast_nullable_to_non_nullable
as DateTime?,departurePlace: freezed == departurePlace ? _self.departurePlace : departurePlace // ignore: cast_nullable_to_non_nullable
as String?,arrivalDate: freezed == arrivalDate ? _self.arrivalDate : arrivalDate // ignore: cast_nullable_to_non_nullable
as DateTime?,arrivalPlace: freezed == arrivalPlace ? _self.arrivalPlace : arrivalPlace // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Flights].
extension FlightsPatterns on Flights {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Flights value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Flights() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Flights value)  $default,){
final _that = this;
switch (_that) {
case _Flights():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Flights value)?  $default,){
final _that = this;
switch (_that) {
case _Flights() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? code, @JsonKey(name: 'flight_code')  String? flightCode, @JsonKey(name: 'departure_date')  DateTime? departureDate, @JsonKey(name: 'departure_place')  String? departurePlace, @JsonKey(name: 'arrival_date')  DateTime? arrivalDate, @JsonKey(name: 'arrival_place')  String? arrivalPlace)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Flights() when $default != null:
return $default(_that.name,_that.code,_that.flightCode,_that.departureDate,_that.departurePlace,_that.arrivalDate,_that.arrivalPlace);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? code, @JsonKey(name: 'flight_code')  String? flightCode, @JsonKey(name: 'departure_date')  DateTime? departureDate, @JsonKey(name: 'departure_place')  String? departurePlace, @JsonKey(name: 'arrival_date')  DateTime? arrivalDate, @JsonKey(name: 'arrival_place')  String? arrivalPlace)  $default,) {final _that = this;
switch (_that) {
case _Flights():
return $default(_that.name,_that.code,_that.flightCode,_that.departureDate,_that.departurePlace,_that.arrivalDate,_that.arrivalPlace);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? code, @JsonKey(name: 'flight_code')  String? flightCode, @JsonKey(name: 'departure_date')  DateTime? departureDate, @JsonKey(name: 'departure_place')  String? departurePlace, @JsonKey(name: 'arrival_date')  DateTime? arrivalDate, @JsonKey(name: 'arrival_place')  String? arrivalPlace)?  $default,) {final _that = this;
switch (_that) {
case _Flights() when $default != null:
return $default(_that.name,_that.code,_that.flightCode,_that.departureDate,_that.departurePlace,_that.arrivalDate,_that.arrivalPlace);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Flights implements Flights {
   _Flights({this.name, this.code, @JsonKey(name: 'flight_code') this.flightCode, @JsonKey(name: 'departure_date') this.departureDate, @JsonKey(name: 'departure_place') this.departurePlace, @JsonKey(name: 'arrival_date') this.arrivalDate, @JsonKey(name: 'arrival_place') this.arrivalPlace});
  factory _Flights.fromJson(Map<String, dynamic> json) => _$FlightsFromJson(json);

@override final  String? name;
@override final  String? code;
@override@JsonKey(name: 'flight_code') final  String? flightCode;
@override@JsonKey(name: 'departure_date') final  DateTime? departureDate;
@override@JsonKey(name: 'departure_place') final  String? departurePlace;
@override@JsonKey(name: 'arrival_date') final  DateTime? arrivalDate;
@override@JsonKey(name: 'arrival_place') final  String? arrivalPlace;

/// Create a copy of Flights
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlightsCopyWith<_Flights> get copyWith => __$FlightsCopyWithImpl<_Flights>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlightsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Flights&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.flightCode, flightCode) || other.flightCode == flightCode)&&(identical(other.departureDate, departureDate) || other.departureDate == departureDate)&&(identical(other.departurePlace, departurePlace) || other.departurePlace == departurePlace)&&(identical(other.arrivalDate, arrivalDate) || other.arrivalDate == arrivalDate)&&(identical(other.arrivalPlace, arrivalPlace) || other.arrivalPlace == arrivalPlace));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,code,flightCode,departureDate,departurePlace,arrivalDate,arrivalPlace);

@override
String toString() {
  return 'Flights(name: $name, code: $code, flightCode: $flightCode, departureDate: $departureDate, departurePlace: $departurePlace, arrivalDate: $arrivalDate, arrivalPlace: $arrivalPlace)';
}


}

/// @nodoc
abstract mixin class _$FlightsCopyWith<$Res> implements $FlightsCopyWith<$Res> {
  factory _$FlightsCopyWith(_Flights value, $Res Function(_Flights) _then) = __$FlightsCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? code,@JsonKey(name: 'flight_code') String? flightCode,@JsonKey(name: 'departure_date') DateTime? departureDate,@JsonKey(name: 'departure_place') String? departurePlace,@JsonKey(name: 'arrival_date') DateTime? arrivalDate,@JsonKey(name: 'arrival_place') String? arrivalPlace
});




}
/// @nodoc
class __$FlightsCopyWithImpl<$Res>
    implements _$FlightsCopyWith<$Res> {
  __$FlightsCopyWithImpl(this._self, this._then);

  final _Flights _self;
  final $Res Function(_Flights) _then;

/// Create a copy of Flights
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? code = freezed,Object? flightCode = freezed,Object? departureDate = freezed,Object? departurePlace = freezed,Object? arrivalDate = freezed,Object? arrivalPlace = freezed,}) {
  return _then(_Flights(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,flightCode: freezed == flightCode ? _self.flightCode : flightCode // ignore: cast_nullable_to_non_nullable
as String?,departureDate: freezed == departureDate ? _self.departureDate : departureDate // ignore: cast_nullable_to_non_nullable
as DateTime?,departurePlace: freezed == departurePlace ? _self.departurePlace : departurePlace // ignore: cast_nullable_to_non_nullable
as String?,arrivalDate: freezed == arrivalDate ? _self.arrivalDate : arrivalDate // ignore: cast_nullable_to_non_nullable
as DateTime?,arrivalPlace: freezed == arrivalPlace ? _self.arrivalPlace : arrivalPlace // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Transportation {

 String? get image; String? get name; String? get desc; double? get lat; double? get lng;
/// Create a copy of Transportation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransportationCopyWith<Transportation> get copyWith => _$TransportationCopyWithImpl<Transportation>(this as Transportation, _$identity);

  /// Serializes this Transportation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Transportation&&(identical(other.image, image) || other.image == image)&&(identical(other.name, name) || other.name == name)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,image,name,desc,lat,lng);

@override
String toString() {
  return 'Transportation(image: $image, name: $name, desc: $desc, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class $TransportationCopyWith<$Res>  {
  factory $TransportationCopyWith(Transportation value, $Res Function(Transportation) _then) = _$TransportationCopyWithImpl;
@useResult
$Res call({
 String? image, String? name, String? desc, double? lat, double? lng
});




}
/// @nodoc
class _$TransportationCopyWithImpl<$Res>
    implements $TransportationCopyWith<$Res> {
  _$TransportationCopyWithImpl(this._self, this._then);

  final Transportation _self;
  final $Res Function(Transportation) _then;

/// Create a copy of Transportation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? image = freezed,Object? name = freezed,Object? desc = freezed,Object? lat = freezed,Object? lng = freezed,}) {
  return _then(_self.copyWith(
image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,desc: freezed == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [Transportation].
extension TransportationPatterns on Transportation {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Transportation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Transportation() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Transportation value)  $default,){
final _that = this;
switch (_that) {
case _Transportation():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Transportation value)?  $default,){
final _that = this;
switch (_that) {
case _Transportation() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? image,  String? name,  String? desc,  double? lat,  double? lng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Transportation() when $default != null:
return $default(_that.image,_that.name,_that.desc,_that.lat,_that.lng);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? image,  String? name,  String? desc,  double? lat,  double? lng)  $default,) {final _that = this;
switch (_that) {
case _Transportation():
return $default(_that.image,_that.name,_that.desc,_that.lat,_that.lng);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? image,  String? name,  String? desc,  double? lat,  double? lng)?  $default,) {final _that = this;
switch (_that) {
case _Transportation() when $default != null:
return $default(_that.image,_that.name,_that.desc,_that.lat,_that.lng);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Transportation implements Transportation {
   _Transportation({this.image, this.name, this.desc, this.lat, this.lng});
  factory _Transportation.fromJson(Map<String, dynamic> json) => _$TransportationFromJson(json);

@override final  String? image;
@override final  String? name;
@override final  String? desc;
@override final  double? lat;
@override final  double? lng;

/// Create a copy of Transportation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransportationCopyWith<_Transportation> get copyWith => __$TransportationCopyWithImpl<_Transportation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransportationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Transportation&&(identical(other.image, image) || other.image == image)&&(identical(other.name, name) || other.name == name)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,image,name,desc,lat,lng);

@override
String toString() {
  return 'Transportation(image: $image, name: $name, desc: $desc, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class _$TransportationCopyWith<$Res> implements $TransportationCopyWith<$Res> {
  factory _$TransportationCopyWith(_Transportation value, $Res Function(_Transportation) _then) = __$TransportationCopyWithImpl;
@override @useResult
$Res call({
 String? image, String? name, String? desc, double? lat, double? lng
});




}
/// @nodoc
class __$TransportationCopyWithImpl<$Res>
    implements _$TransportationCopyWith<$Res> {
  __$TransportationCopyWithImpl(this._self, this._then);

  final _Transportation _self;
  final $Res Function(_Transportation) _then;

/// Create a copy of Transportation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? image = freezed,Object? name = freezed,Object? desc = freezed,Object? lat = freezed,Object? lng = freezed,}) {
  return _then(_Transportation(
image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,desc: freezed == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$Itinerary {

 DateTime? get date; String? get place; String? get desc;
/// Create a copy of Itinerary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItineraryCopyWith<Itinerary> get copyWith => _$ItineraryCopyWithImpl<Itinerary>(this as Itinerary, _$identity);

  /// Serializes this Itinerary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Itinerary&&(identical(other.date, date) || other.date == date)&&(identical(other.place, place) || other.place == place)&&(identical(other.desc, desc) || other.desc == desc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,place,desc);

@override
String toString() {
  return 'Itinerary(date: $date, place: $place, desc: $desc)';
}


}

/// @nodoc
abstract mixin class $ItineraryCopyWith<$Res>  {
  factory $ItineraryCopyWith(Itinerary value, $Res Function(Itinerary) _then) = _$ItineraryCopyWithImpl;
@useResult
$Res call({
 DateTime? date, String? place, String? desc
});




}
/// @nodoc
class _$ItineraryCopyWithImpl<$Res>
    implements $ItineraryCopyWith<$Res> {
  _$ItineraryCopyWithImpl(this._self, this._then);

  final Itinerary _self;
  final $Res Function(Itinerary) _then;

/// Create a copy of Itinerary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = freezed,Object? place = freezed,Object? desc = freezed,}) {
  return _then(_self.copyWith(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,place: freezed == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as String?,desc: freezed == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Itinerary].
extension ItineraryPatterns on Itinerary {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Itinerary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Itinerary() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Itinerary value)  $default,){
final _that = this;
switch (_that) {
case _Itinerary():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Itinerary value)?  $default,){
final _that = this;
switch (_that) {
case _Itinerary() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? date,  String? place,  String? desc)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Itinerary() when $default != null:
return $default(_that.date,_that.place,_that.desc);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? date,  String? place,  String? desc)  $default,) {final _that = this;
switch (_that) {
case _Itinerary():
return $default(_that.date,_that.place,_that.desc);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? date,  String? place,  String? desc)?  $default,) {final _that = this;
switch (_that) {
case _Itinerary() when $default != null:
return $default(_that.date,_that.place,_that.desc);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Itinerary implements Itinerary {
   _Itinerary({this.date, this.place, this.desc});
  factory _Itinerary.fromJson(Map<String, dynamic> json) => _$ItineraryFromJson(json);

@override final  DateTime? date;
@override final  String? place;
@override final  String? desc;

/// Create a copy of Itinerary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItineraryCopyWith<_Itinerary> get copyWith => __$ItineraryCopyWithImpl<_Itinerary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ItineraryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Itinerary&&(identical(other.date, date) || other.date == date)&&(identical(other.place, place) || other.place == place)&&(identical(other.desc, desc) || other.desc == desc));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,place,desc);

@override
String toString() {
  return 'Itinerary(date: $date, place: $place, desc: $desc)';
}


}

/// @nodoc
abstract mixin class _$ItineraryCopyWith<$Res> implements $ItineraryCopyWith<$Res> {
  factory _$ItineraryCopyWith(_Itinerary value, $Res Function(_Itinerary) _then) = __$ItineraryCopyWithImpl;
@override @useResult
$Res call({
 DateTime? date, String? place, String? desc
});




}
/// @nodoc
class __$ItineraryCopyWithImpl<$Res>
    implements _$ItineraryCopyWith<$Res> {
  __$ItineraryCopyWithImpl(this._self, this._then);

  final _Itinerary _self;
  final $Res Function(_Itinerary) _then;

/// Create a copy of Itinerary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = freezed,Object? place = freezed,Object? desc = freezed,}) {
  return _then(_Itinerary(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,place: freezed == place ? _self.place : place // ignore: cast_nullable_to_non_nullable
as String?,desc: freezed == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

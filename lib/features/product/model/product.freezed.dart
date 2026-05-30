// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Product {

 int? get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'duration') int get duration;@JsonKey(name: 'departure_date') DateTime? get departureDate;@JsonKey(name: 'quota') int get quota;@JsonKey(name: 'including') String get included;@JsonKey(name: 'not_included') String get notIncluded;@JsonKey(name: 'terms_and_condition') String? get termsConditions;@JsonKey(name: 'price_downpayment_rupiah') double get downPayment;@JsonKey(name: 'price_total_double_rupiah') double get doublePrice;@JsonKey(name: 'price_total_triple_rupiah') double get triplePrice;@JsonKey(name: 'price_total_quad_rupiah') double get quadPrice;@JsonKey(name: 'image') String get image;@JsonKey(name: 'product_category_id') int get categoryId;@JsonKey(name: 'product_category_name') String get categoryName; List<Hotel>? get hotels; List<Airline>? get airlines; List<Itinerary>? get itineraries;
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCopyWith<Product> get copyWith => _$ProductCopyWithImpl<Product>(this as Product, _$identity);

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Product&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.departureDate, departureDate) || other.departureDate == departureDate)&&(identical(other.quota, quota) || other.quota == quota)&&(identical(other.included, included) || other.included == included)&&(identical(other.notIncluded, notIncluded) || other.notIncluded == notIncluded)&&(identical(other.termsConditions, termsConditions) || other.termsConditions == termsConditions)&&(identical(other.downPayment, downPayment) || other.downPayment == downPayment)&&(identical(other.doublePrice, doublePrice) || other.doublePrice == doublePrice)&&(identical(other.triplePrice, triplePrice) || other.triplePrice == triplePrice)&&(identical(other.quadPrice, quadPrice) || other.quadPrice == quadPrice)&&(identical(other.image, image) || other.image == image)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&const DeepCollectionEquality().equals(other.hotels, hotels)&&const DeepCollectionEquality().equals(other.airlines, airlines)&&const DeepCollectionEquality().equals(other.itineraries, itineraries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,duration,departureDate,quota,included,notIncluded,termsConditions,downPayment,doublePrice,triplePrice,quadPrice,image,categoryId,categoryName,const DeepCollectionEquality().hash(hotels),const DeepCollectionEquality().hash(airlines),const DeepCollectionEquality().hash(itineraries));

@override
String toString() {
  return 'Product(id: $id, name: $name, duration: $duration, departureDate: $departureDate, quota: $quota, included: $included, notIncluded: $notIncluded, termsConditions: $termsConditions, downPayment: $downPayment, doublePrice: $doublePrice, triplePrice: $triplePrice, quadPrice: $quadPrice, image: $image, categoryId: $categoryId, categoryName: $categoryName, hotels: $hotels, airlines: $airlines, itineraries: $itineraries)';
}


}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res>  {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) = _$ProductCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'name') String name,@JsonKey(name: 'duration') int duration,@JsonKey(name: 'departure_date') DateTime? departureDate,@JsonKey(name: 'quota') int quota,@JsonKey(name: 'including') String included,@JsonKey(name: 'not_included') String notIncluded,@JsonKey(name: 'terms_and_condition') String? termsConditions,@JsonKey(name: 'price_downpayment_rupiah') double downPayment,@JsonKey(name: 'price_total_double_rupiah') double doublePrice,@JsonKey(name: 'price_total_triple_rupiah') double triplePrice,@JsonKey(name: 'price_total_quad_rupiah') double quadPrice,@JsonKey(name: 'image') String image,@JsonKey(name: 'product_category_id') int categoryId,@JsonKey(name: 'product_category_name') String categoryName, List<Hotel>? hotels, List<Airline>? airlines, List<Itinerary>? itineraries
});




}
/// @nodoc
class _$ProductCopyWithImpl<$Res>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? duration = null,Object? departureDate = freezed,Object? quota = null,Object? included = null,Object? notIncluded = null,Object? termsConditions = freezed,Object? downPayment = null,Object? doublePrice = null,Object? triplePrice = null,Object? quadPrice = null,Object? image = null,Object? categoryId = null,Object? categoryName = null,Object? hotels = freezed,Object? airlines = freezed,Object? itineraries = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,departureDate: freezed == departureDate ? _self.departureDate : departureDate // ignore: cast_nullable_to_non_nullable
as DateTime?,quota: null == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as int,included: null == included ? _self.included : included // ignore: cast_nullable_to_non_nullable
as String,notIncluded: null == notIncluded ? _self.notIncluded : notIncluded // ignore: cast_nullable_to_non_nullable
as String,termsConditions: freezed == termsConditions ? _self.termsConditions : termsConditions // ignore: cast_nullable_to_non_nullable
as String?,downPayment: null == downPayment ? _self.downPayment : downPayment // ignore: cast_nullable_to_non_nullable
as double,doublePrice: null == doublePrice ? _self.doublePrice : doublePrice // ignore: cast_nullable_to_non_nullable
as double,triplePrice: null == triplePrice ? _self.triplePrice : triplePrice // ignore: cast_nullable_to_non_nullable
as double,quadPrice: null == quadPrice ? _self.quadPrice : quadPrice // ignore: cast_nullable_to_non_nullable
as double,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,hotels: freezed == hotels ? _self.hotels : hotels // ignore: cast_nullable_to_non_nullable
as List<Hotel>?,airlines: freezed == airlines ? _self.airlines : airlines // ignore: cast_nullable_to_non_nullable
as List<Airline>?,itineraries: freezed == itineraries ? _self.itineraries : itineraries // ignore: cast_nullable_to_non_nullable
as List<Itinerary>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Product].
extension ProductPatterns on Product {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Product value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Product() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Product value)  $default,){
final _that = this;
switch (_that) {
case _Product():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Product value)?  $default,){
final _that = this;
switch (_that) {
case _Product() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'duration')  int duration, @JsonKey(name: 'departure_date')  DateTime? departureDate, @JsonKey(name: 'quota')  int quota, @JsonKey(name: 'including')  String included, @JsonKey(name: 'not_included')  String notIncluded, @JsonKey(name: 'terms_and_condition')  String? termsConditions, @JsonKey(name: 'price_downpayment_rupiah')  double downPayment, @JsonKey(name: 'price_total_double_rupiah')  double doublePrice, @JsonKey(name: 'price_total_triple_rupiah')  double triplePrice, @JsonKey(name: 'price_total_quad_rupiah')  double quadPrice, @JsonKey(name: 'image')  String image, @JsonKey(name: 'product_category_id')  int categoryId, @JsonKey(name: 'product_category_name')  String categoryName,  List<Hotel>? hotels,  List<Airline>? airlines,  List<Itinerary>? itineraries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.name,_that.duration,_that.departureDate,_that.quota,_that.included,_that.notIncluded,_that.termsConditions,_that.downPayment,_that.doublePrice,_that.triplePrice,_that.quadPrice,_that.image,_that.categoryId,_that.categoryName,_that.hotels,_that.airlines,_that.itineraries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'duration')  int duration, @JsonKey(name: 'departure_date')  DateTime? departureDate, @JsonKey(name: 'quota')  int quota, @JsonKey(name: 'including')  String included, @JsonKey(name: 'not_included')  String notIncluded, @JsonKey(name: 'terms_and_condition')  String? termsConditions, @JsonKey(name: 'price_downpayment_rupiah')  double downPayment, @JsonKey(name: 'price_total_double_rupiah')  double doublePrice, @JsonKey(name: 'price_total_triple_rupiah')  double triplePrice, @JsonKey(name: 'price_total_quad_rupiah')  double quadPrice, @JsonKey(name: 'image')  String image, @JsonKey(name: 'product_category_id')  int categoryId, @JsonKey(name: 'product_category_name')  String categoryName,  List<Hotel>? hotels,  List<Airline>? airlines,  List<Itinerary>? itineraries)  $default,) {final _that = this;
switch (_that) {
case _Product():
return $default(_that.id,_that.name,_that.duration,_that.departureDate,_that.quota,_that.included,_that.notIncluded,_that.termsConditions,_that.downPayment,_that.doublePrice,_that.triplePrice,_that.quadPrice,_that.image,_that.categoryId,_that.categoryName,_that.hotels,_that.airlines,_that.itineraries);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'duration')  int duration, @JsonKey(name: 'departure_date')  DateTime? departureDate, @JsonKey(name: 'quota')  int quota, @JsonKey(name: 'including')  String included, @JsonKey(name: 'not_included')  String notIncluded, @JsonKey(name: 'terms_and_condition')  String? termsConditions, @JsonKey(name: 'price_downpayment_rupiah')  double downPayment, @JsonKey(name: 'price_total_double_rupiah')  double doublePrice, @JsonKey(name: 'price_total_triple_rupiah')  double triplePrice, @JsonKey(name: 'price_total_quad_rupiah')  double quadPrice, @JsonKey(name: 'image')  String image, @JsonKey(name: 'product_category_id')  int categoryId, @JsonKey(name: 'product_category_name')  String categoryName,  List<Hotel>? hotels,  List<Airline>? airlines,  List<Itinerary>? itineraries)?  $default,) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.name,_that.duration,_that.departureDate,_that.quota,_that.included,_that.notIncluded,_that.termsConditions,_that.downPayment,_that.doublePrice,_that.triplePrice,_that.quadPrice,_that.image,_that.categoryId,_that.categoryName,_that.hotels,_that.airlines,_that.itineraries);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Product implements Product {
   _Product({this.id, @JsonKey(name: 'name') this.name = '', @JsonKey(name: 'duration') this.duration = 9, @JsonKey(name: 'departure_date') this.departureDate, @JsonKey(name: 'quota') this.quota = 50, @JsonKey(name: 'including') this.included = '', @JsonKey(name: 'not_included') this.notIncluded = '', @JsonKey(name: 'terms_and_condition') this.termsConditions, @JsonKey(name: 'price_downpayment_rupiah') this.downPayment = 0, @JsonKey(name: 'price_total_double_rupiah') this.doublePrice = 0, @JsonKey(name: 'price_total_triple_rupiah') this.triplePrice = 0, @JsonKey(name: 'price_total_quad_rupiah') this.quadPrice = 0, @JsonKey(name: 'image') this.image = '', @JsonKey(name: 'product_category_id') this.categoryId = 0, @JsonKey(name: 'product_category_name') this.categoryName = '', final  List<Hotel>? hotels, final  List<Airline>? airlines, final  List<Itinerary>? itineraries}): _hotels = hotels,_airlines = airlines,_itineraries = itineraries;
  factory _Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'duration') final  int duration;
@override@JsonKey(name: 'departure_date') final  DateTime? departureDate;
@override@JsonKey(name: 'quota') final  int quota;
@override@JsonKey(name: 'including') final  String included;
@override@JsonKey(name: 'not_included') final  String notIncluded;
@override@JsonKey(name: 'terms_and_condition') final  String? termsConditions;
@override@JsonKey(name: 'price_downpayment_rupiah') final  double downPayment;
@override@JsonKey(name: 'price_total_double_rupiah') final  double doublePrice;
@override@JsonKey(name: 'price_total_triple_rupiah') final  double triplePrice;
@override@JsonKey(name: 'price_total_quad_rupiah') final  double quadPrice;
@override@JsonKey(name: 'image') final  String image;
@override@JsonKey(name: 'product_category_id') final  int categoryId;
@override@JsonKey(name: 'product_category_name') final  String categoryName;
 final  List<Hotel>? _hotels;
@override List<Hotel>? get hotels {
  final value = _hotels;
  if (value == null) return null;
  if (_hotels is EqualUnmodifiableListView) return _hotels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Airline>? _airlines;
@override List<Airline>? get airlines {
  final value = _airlines;
  if (value == null) return null;
  if (_airlines is EqualUnmodifiableListView) return _airlines;
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


/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCopyWith<_Product> get copyWith => __$ProductCopyWithImpl<_Product>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Product&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.departureDate, departureDate) || other.departureDate == departureDate)&&(identical(other.quota, quota) || other.quota == quota)&&(identical(other.included, included) || other.included == included)&&(identical(other.notIncluded, notIncluded) || other.notIncluded == notIncluded)&&(identical(other.termsConditions, termsConditions) || other.termsConditions == termsConditions)&&(identical(other.downPayment, downPayment) || other.downPayment == downPayment)&&(identical(other.doublePrice, doublePrice) || other.doublePrice == doublePrice)&&(identical(other.triplePrice, triplePrice) || other.triplePrice == triplePrice)&&(identical(other.quadPrice, quadPrice) || other.quadPrice == quadPrice)&&(identical(other.image, image) || other.image == image)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&const DeepCollectionEquality().equals(other._hotels, _hotels)&&const DeepCollectionEquality().equals(other._airlines, _airlines)&&const DeepCollectionEquality().equals(other._itineraries, _itineraries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,duration,departureDate,quota,included,notIncluded,termsConditions,downPayment,doublePrice,triplePrice,quadPrice,image,categoryId,categoryName,const DeepCollectionEquality().hash(_hotels),const DeepCollectionEquality().hash(_airlines),const DeepCollectionEquality().hash(_itineraries));

@override
String toString() {
  return 'Product(id: $id, name: $name, duration: $duration, departureDate: $departureDate, quota: $quota, included: $included, notIncluded: $notIncluded, termsConditions: $termsConditions, downPayment: $downPayment, doublePrice: $doublePrice, triplePrice: $triplePrice, quadPrice: $quadPrice, image: $image, categoryId: $categoryId, categoryName: $categoryName, hotels: $hotels, airlines: $airlines, itineraries: $itineraries)';
}


}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) = __$ProductCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'name') String name,@JsonKey(name: 'duration') int duration,@JsonKey(name: 'departure_date') DateTime? departureDate,@JsonKey(name: 'quota') int quota,@JsonKey(name: 'including') String included,@JsonKey(name: 'not_included') String notIncluded,@JsonKey(name: 'terms_and_condition') String? termsConditions,@JsonKey(name: 'price_downpayment_rupiah') double downPayment,@JsonKey(name: 'price_total_double_rupiah') double doublePrice,@JsonKey(name: 'price_total_triple_rupiah') double triplePrice,@JsonKey(name: 'price_total_quad_rupiah') double quadPrice,@JsonKey(name: 'image') String image,@JsonKey(name: 'product_category_id') int categoryId,@JsonKey(name: 'product_category_name') String categoryName, List<Hotel>? hotels, List<Airline>? airlines, List<Itinerary>? itineraries
});




}
/// @nodoc
class __$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? duration = null,Object? departureDate = freezed,Object? quota = null,Object? included = null,Object? notIncluded = null,Object? termsConditions = freezed,Object? downPayment = null,Object? doublePrice = null,Object? triplePrice = null,Object? quadPrice = null,Object? image = null,Object? categoryId = null,Object? categoryName = null,Object? hotels = freezed,Object? airlines = freezed,Object? itineraries = freezed,}) {
  return _then(_Product(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,departureDate: freezed == departureDate ? _self.departureDate : departureDate // ignore: cast_nullable_to_non_nullable
as DateTime?,quota: null == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as int,included: null == included ? _self.included : included // ignore: cast_nullable_to_non_nullable
as String,notIncluded: null == notIncluded ? _self.notIncluded : notIncluded // ignore: cast_nullable_to_non_nullable
as String,termsConditions: freezed == termsConditions ? _self.termsConditions : termsConditions // ignore: cast_nullable_to_non_nullable
as String?,downPayment: null == downPayment ? _self.downPayment : downPayment // ignore: cast_nullable_to_non_nullable
as double,doublePrice: null == doublePrice ? _self.doublePrice : doublePrice // ignore: cast_nullable_to_non_nullable
as double,triplePrice: null == triplePrice ? _self.triplePrice : triplePrice // ignore: cast_nullable_to_non_nullable
as double,quadPrice: null == quadPrice ? _self.quadPrice : quadPrice // ignore: cast_nullable_to_non_nullable
as double,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,hotels: freezed == hotels ? _self._hotels : hotels // ignore: cast_nullable_to_non_nullable
as List<Hotel>?,airlines: freezed == airlines ? _self._airlines : airlines // ignore: cast_nullable_to_non_nullable
as List<Airline>?,itineraries: freezed == itineraries ? _self._itineraries : itineraries // ignore: cast_nullable_to_non_nullable
as List<Itinerary>?,
  ));
}


}

// dart format on

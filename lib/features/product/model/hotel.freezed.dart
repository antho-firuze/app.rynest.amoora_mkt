// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hotel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Hotel {

 int? get id;@JsonKey(name: 'hotel_id') int? get hotelId;@JsonKey(name: 'name') String get name;@JsonKey(name: 'rating')@JsonIntConverter() int get rating;@JsonKey(name: 'address') String get address;@JsonKey(name: 'link_map') String get linkMap;@JsonKey(name: 'check_in') DateTime? get checkIn;@JsonKey(name: 'check_out') DateTime? get checkOut;
/// Create a copy of Hotel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotelCopyWith<Hotel> get copyWith => _$HotelCopyWithImpl<Hotel>(this as Hotel, _$identity);

  /// Serializes this Hotel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Hotel&&(identical(other.id, id) || other.id == id)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.name, name) || other.name == name)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.address, address) || other.address == address)&&(identical(other.linkMap, linkMap) || other.linkMap == linkMap)&&(identical(other.checkIn, checkIn) || other.checkIn == checkIn)&&(identical(other.checkOut, checkOut) || other.checkOut == checkOut));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,hotelId,name,rating,address,linkMap,checkIn,checkOut);

@override
String toString() {
  return 'Hotel(id: $id, hotelId: $hotelId, name: $name, rating: $rating, address: $address, linkMap: $linkMap, checkIn: $checkIn, checkOut: $checkOut)';
}


}

/// @nodoc
abstract mixin class $HotelCopyWith<$Res>  {
  factory $HotelCopyWith(Hotel value, $Res Function(Hotel) _then) = _$HotelCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'hotel_id') int? hotelId,@JsonKey(name: 'name') String name,@JsonKey(name: 'rating')@JsonIntConverter() int rating,@JsonKey(name: 'address') String address,@JsonKey(name: 'link_map') String linkMap,@JsonKey(name: 'check_in') DateTime? checkIn,@JsonKey(name: 'check_out') DateTime? checkOut
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? hotelId = freezed,Object? name = null,Object? rating = null,Object? address = null,Object? linkMap = null,Object? checkIn = freezed,Object? checkOut = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,hotelId: freezed == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,linkMap: null == linkMap ? _self.linkMap : linkMap // ignore: cast_nullable_to_non_nullable
as String,checkIn: freezed == checkIn ? _self.checkIn : checkIn // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'hotel_id')  int? hotelId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'rating')@JsonIntConverter()  int rating, @JsonKey(name: 'address')  String address, @JsonKey(name: 'link_map')  String linkMap, @JsonKey(name: 'check_in')  DateTime? checkIn, @JsonKey(name: 'check_out')  DateTime? checkOut)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Hotel() when $default != null:
return $default(_that.id,_that.hotelId,_that.name,_that.rating,_that.address,_that.linkMap,_that.checkIn,_that.checkOut);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'hotel_id')  int? hotelId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'rating')@JsonIntConverter()  int rating, @JsonKey(name: 'address')  String address, @JsonKey(name: 'link_map')  String linkMap, @JsonKey(name: 'check_in')  DateTime? checkIn, @JsonKey(name: 'check_out')  DateTime? checkOut)  $default,) {final _that = this;
switch (_that) {
case _Hotel():
return $default(_that.id,_that.hotelId,_that.name,_that.rating,_that.address,_that.linkMap,_that.checkIn,_that.checkOut);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'hotel_id')  int? hotelId, @JsonKey(name: 'name')  String name, @JsonKey(name: 'rating')@JsonIntConverter()  int rating, @JsonKey(name: 'address')  String address, @JsonKey(name: 'link_map')  String linkMap, @JsonKey(name: 'check_in')  DateTime? checkIn, @JsonKey(name: 'check_out')  DateTime? checkOut)?  $default,) {final _that = this;
switch (_that) {
case _Hotel() when $default != null:
return $default(_that.id,_that.hotelId,_that.name,_that.rating,_that.address,_that.linkMap,_that.checkIn,_that.checkOut);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Hotel implements Hotel {
   _Hotel({this.id, @JsonKey(name: 'hotel_id') this.hotelId, @JsonKey(name: 'name') this.name = '', @JsonKey(name: 'rating')@JsonIntConverter() this.rating = 3, @JsonKey(name: 'address') this.address = '', @JsonKey(name: 'link_map') this.linkMap = '', @JsonKey(name: 'check_in') this.checkIn, @JsonKey(name: 'check_out') this.checkOut});
  factory _Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'hotel_id') final  int? hotelId;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'rating')@JsonIntConverter() final  int rating;
@override@JsonKey(name: 'address') final  String address;
@override@JsonKey(name: 'link_map') final  String linkMap;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Hotel&&(identical(other.id, id) || other.id == id)&&(identical(other.hotelId, hotelId) || other.hotelId == hotelId)&&(identical(other.name, name) || other.name == name)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.address, address) || other.address == address)&&(identical(other.linkMap, linkMap) || other.linkMap == linkMap)&&(identical(other.checkIn, checkIn) || other.checkIn == checkIn)&&(identical(other.checkOut, checkOut) || other.checkOut == checkOut));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,hotelId,name,rating,address,linkMap,checkIn,checkOut);

@override
String toString() {
  return 'Hotel(id: $id, hotelId: $hotelId, name: $name, rating: $rating, address: $address, linkMap: $linkMap, checkIn: $checkIn, checkOut: $checkOut)';
}


}

/// @nodoc
abstract mixin class _$HotelCopyWith<$Res> implements $HotelCopyWith<$Res> {
  factory _$HotelCopyWith(_Hotel value, $Res Function(_Hotel) _then) = __$HotelCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'hotel_id') int? hotelId,@JsonKey(name: 'name') String name,@JsonKey(name: 'rating')@JsonIntConverter() int rating,@JsonKey(name: 'address') String address,@JsonKey(name: 'link_map') String linkMap,@JsonKey(name: 'check_in') DateTime? checkIn,@JsonKey(name: 'check_out') DateTime? checkOut
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? hotelId = freezed,Object? name = null,Object? rating = null,Object? address = null,Object? linkMap = null,Object? checkIn = freezed,Object? checkOut = freezed,}) {
  return _then(_Hotel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,hotelId: freezed == hotelId ? _self.hotelId : hotelId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,linkMap: null == linkMap ? _self.linkMap : linkMap // ignore: cast_nullable_to_non_nullable
as String,checkIn: freezed == checkIn ? _self.checkIn : checkIn // ignore: cast_nullable_to_non_nullable
as DateTime?,checkOut: freezed == checkOut ? _self.checkOut : checkOut // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on

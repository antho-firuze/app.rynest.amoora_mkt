// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'itinerary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Itinerary {

 int? get id;@JsonKey(name: 'title') String get title;@JsonKey(name: 'sub_title') String get subTitle;@JsonKey(name: 'detail_itinerary') String get desc;@JsonKey(name: 'activity_date') DateTime? get activityDate;
/// Create a copy of Itinerary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItineraryCopyWith<Itinerary> get copyWith => _$ItineraryCopyWithImpl<Itinerary>(this as Itinerary, _$identity);

  /// Serializes this Itinerary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Itinerary&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subTitle, subTitle) || other.subTitle == subTitle)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.activityDate, activityDate) || other.activityDate == activityDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subTitle,desc,activityDate);

@override
String toString() {
  return 'Itinerary(id: $id, title: $title, subTitle: $subTitle, desc: $desc, activityDate: $activityDate)';
}


}

/// @nodoc
abstract mixin class $ItineraryCopyWith<$Res>  {
  factory $ItineraryCopyWith(Itinerary value, $Res Function(Itinerary) _then) = _$ItineraryCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'title') String title,@JsonKey(name: 'sub_title') String subTitle,@JsonKey(name: 'detail_itinerary') String desc,@JsonKey(name: 'activity_date') DateTime? activityDate
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = null,Object? subTitle = null,Object? desc = null,Object? activityDate = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subTitle: null == subTitle ? _self.subTitle : subTitle // ignore: cast_nullable_to_non_nullable
as String,desc: null == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String,activityDate: freezed == activityDate ? _self.activityDate : activityDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'title')  String title, @JsonKey(name: 'sub_title')  String subTitle, @JsonKey(name: 'detail_itinerary')  String desc, @JsonKey(name: 'activity_date')  DateTime? activityDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Itinerary() when $default != null:
return $default(_that.id,_that.title,_that.subTitle,_that.desc,_that.activityDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'title')  String title, @JsonKey(name: 'sub_title')  String subTitle, @JsonKey(name: 'detail_itinerary')  String desc, @JsonKey(name: 'activity_date')  DateTime? activityDate)  $default,) {final _that = this;
switch (_that) {
case _Itinerary():
return $default(_that.id,_that.title,_that.subTitle,_that.desc,_that.activityDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'title')  String title, @JsonKey(name: 'sub_title')  String subTitle, @JsonKey(name: 'detail_itinerary')  String desc, @JsonKey(name: 'activity_date')  DateTime? activityDate)?  $default,) {final _that = this;
switch (_that) {
case _Itinerary() when $default != null:
return $default(_that.id,_that.title,_that.subTitle,_that.desc,_that.activityDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Itinerary implements Itinerary {
   _Itinerary({this.id, @JsonKey(name: 'title') this.title = '', @JsonKey(name: 'sub_title') this.subTitle = '', @JsonKey(name: 'detail_itinerary') this.desc = '', @JsonKey(name: 'activity_date') this.activityDate});
  factory _Itinerary.fromJson(Map<String, dynamic> json) => _$ItineraryFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'title') final  String title;
@override@JsonKey(name: 'sub_title') final  String subTitle;
@override@JsonKey(name: 'detail_itinerary') final  String desc;
@override@JsonKey(name: 'activity_date') final  DateTime? activityDate;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Itinerary&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subTitle, subTitle) || other.subTitle == subTitle)&&(identical(other.desc, desc) || other.desc == desc)&&(identical(other.activityDate, activityDate) || other.activityDate == activityDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subTitle,desc,activityDate);

@override
String toString() {
  return 'Itinerary(id: $id, title: $title, subTitle: $subTitle, desc: $desc, activityDate: $activityDate)';
}


}

/// @nodoc
abstract mixin class _$ItineraryCopyWith<$Res> implements $ItineraryCopyWith<$Res> {
  factory _$ItineraryCopyWith(_Itinerary value, $Res Function(_Itinerary) _then) = __$ItineraryCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'title') String title,@JsonKey(name: 'sub_title') String subTitle,@JsonKey(name: 'detail_itinerary') String desc,@JsonKey(name: 'activity_date') DateTime? activityDate
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = null,Object? subTitle = null,Object? desc = null,Object? activityDate = freezed,}) {
  return _then(_Itinerary(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subTitle: null == subTitle ? _self.subTitle : subTitle // ignore: cast_nullable_to_non_nullable
as String,desc: null == desc ? _self.desc : desc // ignore: cast_nullable_to_non_nullable
as String,activityDate: freezed == activityDate ? _self.activityDate : activityDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on

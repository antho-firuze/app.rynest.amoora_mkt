// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reqs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Reqs {

 String? get url; String? get path; Map<String, dynamic>? get queryParameters; Map<String, dynamic>? get data; String? get filePath; String get fileKey;
/// Create a copy of Reqs
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReqsCopyWith<Reqs> get copyWith => _$ReqsCopyWithImpl<Reqs>(this as Reqs, _$identity);

  /// Serializes this Reqs to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Reqs&&(identical(other.url, url) || other.url == url)&&(identical(other.path, path) || other.path == path)&&const DeepCollectionEquality().equals(other.queryParameters, queryParameters)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.fileKey, fileKey) || other.fileKey == fileKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,path,const DeepCollectionEquality().hash(queryParameters),const DeepCollectionEquality().hash(data),filePath,fileKey);

@override
String toString() {
  return 'Reqs(url: $url, path: $path, queryParameters: $queryParameters, data: $data, filePath: $filePath, fileKey: $fileKey)';
}


}

/// @nodoc
abstract mixin class $ReqsCopyWith<$Res>  {
  factory $ReqsCopyWith(Reqs value, $Res Function(Reqs) _then) = _$ReqsCopyWithImpl;
@useResult
$Res call({
 String? url, String? path, Map<String, dynamic>? queryParameters, Map<String, dynamic>? data, String? filePath, String fileKey
});




}
/// @nodoc
class _$ReqsCopyWithImpl<$Res>
    implements $ReqsCopyWith<$Res> {
  _$ReqsCopyWithImpl(this._self, this._then);

  final Reqs _self;
  final $Res Function(Reqs) _then;

/// Create a copy of Reqs
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = freezed,Object? path = freezed,Object? queryParameters = freezed,Object? data = freezed,Object? filePath = freezed,Object? fileKey = null,}) {
  return _then(_self.copyWith(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,queryParameters: freezed == queryParameters ? _self.queryParameters : queryParameters // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,filePath: freezed == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String?,fileKey: null == fileKey ? _self.fileKey : fileKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Reqs].
extension ReqsPatterns on Reqs {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Reqs value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Reqs() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Reqs value)  $default,){
final _that = this;
switch (_that) {
case _Reqs():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Reqs value)?  $default,){
final _that = this;
switch (_that) {
case _Reqs() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? url,  String? path,  Map<String, dynamic>? queryParameters,  Map<String, dynamic>? data,  String? filePath,  String fileKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Reqs() when $default != null:
return $default(_that.url,_that.path,_that.queryParameters,_that.data,_that.filePath,_that.fileKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? url,  String? path,  Map<String, dynamic>? queryParameters,  Map<String, dynamic>? data,  String? filePath,  String fileKey)  $default,) {final _that = this;
switch (_that) {
case _Reqs():
return $default(_that.url,_that.path,_that.queryParameters,_that.data,_that.filePath,_that.fileKey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? url,  String? path,  Map<String, dynamic>? queryParameters,  Map<String, dynamic>? data,  String? filePath,  String fileKey)?  $default,) {final _that = this;
switch (_that) {
case _Reqs() when $default != null:
return $default(_that.url,_that.path,_that.queryParameters,_that.data,_that.filePath,_that.fileKey);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Reqs implements Reqs {
   _Reqs({this.url, this.path, final  Map<String, dynamic>? queryParameters, final  Map<String, dynamic>? data, this.filePath, this.fileKey = 'userfile'}): _queryParameters = queryParameters,_data = data;
  factory _Reqs.fromJson(Map<String, dynamic> json) => _$ReqsFromJson(json);

@override final  String? url;
@override final  String? path;
 final  Map<String, dynamic>? _queryParameters;
@override Map<String, dynamic>? get queryParameters {
  final value = _queryParameters;
  if (value == null) return null;
  if (_queryParameters is EqualUnmodifiableMapView) return _queryParameters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _data;
@override Map<String, dynamic>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  String? filePath;
@override@JsonKey() final  String fileKey;

/// Create a copy of Reqs
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReqsCopyWith<_Reqs> get copyWith => __$ReqsCopyWithImpl<_Reqs>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReqsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reqs&&(identical(other.url, url) || other.url == url)&&(identical(other.path, path) || other.path == path)&&const DeepCollectionEquality().equals(other._queryParameters, _queryParameters)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.fileKey, fileKey) || other.fileKey == fileKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,path,const DeepCollectionEquality().hash(_queryParameters),const DeepCollectionEquality().hash(_data),filePath,fileKey);

@override
String toString() {
  return 'Reqs(url: $url, path: $path, queryParameters: $queryParameters, data: $data, filePath: $filePath, fileKey: $fileKey)';
}


}

/// @nodoc
abstract mixin class _$ReqsCopyWith<$Res> implements $ReqsCopyWith<$Res> {
  factory _$ReqsCopyWith(_Reqs value, $Res Function(_Reqs) _then) = __$ReqsCopyWithImpl;
@override @useResult
$Res call({
 String? url, String? path, Map<String, dynamic>? queryParameters, Map<String, dynamic>? data, String? filePath, String fileKey
});




}
/// @nodoc
class __$ReqsCopyWithImpl<$Res>
    implements _$ReqsCopyWith<$Res> {
  __$ReqsCopyWithImpl(this._self, this._then);

  final _Reqs _self;
  final $Res Function(_Reqs) _then;

/// Create a copy of Reqs
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = freezed,Object? path = freezed,Object? queryParameters = freezed,Object? data = freezed,Object? filePath = freezed,Object? fileKey = null,}) {
  return _then(_Reqs(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,queryParameters: freezed == queryParameters ? _self._queryParameters : queryParameters // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,filePath: freezed == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String?,fileKey: null == fileKey ? _self.fileKey : fileKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Alert {

 int get id;@JsonKey(name: 'user_id') int get userId; String? get title; String? get body; String? get image; String? get topic;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'is_read')@JsonBoolConverter() bool get isRead;@JsonBoolConverter() bool get pinned;@JsonKey(name: 'pinned_duration') int get pinnedDuration;
/// Create a copy of Alert
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlertCopyWith<Alert> get copyWith => _$AlertCopyWithImpl<Alert>(this as Alert, _$identity);

  /// Serializes this Alert to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Alert&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.image, image) || other.image == image)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.pinned, pinned) || other.pinned == pinned)&&(identical(other.pinnedDuration, pinnedDuration) || other.pinnedDuration == pinnedDuration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,title,body,image,topic,createdAt,isRead,pinned,pinnedDuration);

@override
String toString() {
  return 'Alert(id: $id, userId: $userId, title: $title, body: $body, image: $image, topic: $topic, createdAt: $createdAt, isRead: $isRead, pinned: $pinned, pinnedDuration: $pinnedDuration)';
}


}

/// @nodoc
abstract mixin class $AlertCopyWith<$Res>  {
  factory $AlertCopyWith(Alert value, $Res Function(Alert) _then) = _$AlertCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int userId, String? title, String? body, String? image, String? topic,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'is_read')@JsonBoolConverter() bool isRead,@JsonBoolConverter() bool pinned,@JsonKey(name: 'pinned_duration') int pinnedDuration
});




}
/// @nodoc
class _$AlertCopyWithImpl<$Res>
    implements $AlertCopyWith<$Res> {
  _$AlertCopyWithImpl(this._self, this._then);

  final Alert _self;
  final $Res Function(Alert) _then;

/// Create a copy of Alert
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? title = freezed,Object? body = freezed,Object? image = freezed,Object? topic = freezed,Object? createdAt = freezed,Object? isRead = null,Object? pinned = null,Object? pinnedDuration = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,topic: freezed == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,pinned: null == pinned ? _self.pinned : pinned // ignore: cast_nullable_to_non_nullable
as bool,pinnedDuration: null == pinnedDuration ? _self.pinnedDuration : pinnedDuration // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Alert].
extension AlertPatterns on Alert {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Alert value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Alert() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Alert value)  $default,){
final _that = this;
switch (_that) {
case _Alert():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Alert value)?  $default,){
final _that = this;
switch (_that) {
case _Alert() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int userId,  String? title,  String? body,  String? image,  String? topic, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'is_read')@JsonBoolConverter()  bool isRead, @JsonBoolConverter()  bool pinned, @JsonKey(name: 'pinned_duration')  int pinnedDuration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Alert() when $default != null:
return $default(_that.id,_that.userId,_that.title,_that.body,_that.image,_that.topic,_that.createdAt,_that.isRead,_that.pinned,_that.pinnedDuration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'user_id')  int userId,  String? title,  String? body,  String? image,  String? topic, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'is_read')@JsonBoolConverter()  bool isRead, @JsonBoolConverter()  bool pinned, @JsonKey(name: 'pinned_duration')  int pinnedDuration)  $default,) {final _that = this;
switch (_that) {
case _Alert():
return $default(_that.id,_that.userId,_that.title,_that.body,_that.image,_that.topic,_that.createdAt,_that.isRead,_that.pinned,_that.pinnedDuration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'user_id')  int userId,  String? title,  String? body,  String? image,  String? topic, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'is_read')@JsonBoolConverter()  bool isRead, @JsonBoolConverter()  bool pinned, @JsonKey(name: 'pinned_duration')  int pinnedDuration)?  $default,) {final _that = this;
switch (_that) {
case _Alert() when $default != null:
return $default(_that.id,_that.userId,_that.title,_that.body,_that.image,_that.topic,_that.createdAt,_that.isRead,_that.pinned,_that.pinnedDuration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Alert implements Alert {
   _Alert({this.id = 0, @JsonKey(name: 'user_id') this.userId = 0, this.title, this.body, this.image, this.topic, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'is_read')@JsonBoolConverter() this.isRead = false, @JsonBoolConverter() this.pinned = false, @JsonKey(name: 'pinned_duration') this.pinnedDuration = 86400});
  factory _Alert.fromJson(Map<String, dynamic> json) => _$AlertFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey(name: 'user_id') final  int userId;
@override final  String? title;
@override final  String? body;
@override final  String? image;
@override final  String? topic;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'is_read')@JsonBoolConverter() final  bool isRead;
@override@JsonKey()@JsonBoolConverter() final  bool pinned;
@override@JsonKey(name: 'pinned_duration') final  int pinnedDuration;

/// Create a copy of Alert
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlertCopyWith<_Alert> get copyWith => __$AlertCopyWithImpl<_Alert>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlertToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Alert&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.image, image) || other.image == image)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.pinned, pinned) || other.pinned == pinned)&&(identical(other.pinnedDuration, pinnedDuration) || other.pinnedDuration == pinnedDuration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,title,body,image,topic,createdAt,isRead,pinned,pinnedDuration);

@override
String toString() {
  return 'Alert(id: $id, userId: $userId, title: $title, body: $body, image: $image, topic: $topic, createdAt: $createdAt, isRead: $isRead, pinned: $pinned, pinnedDuration: $pinnedDuration)';
}


}

/// @nodoc
abstract mixin class _$AlertCopyWith<$Res> implements $AlertCopyWith<$Res> {
  factory _$AlertCopyWith(_Alert value, $Res Function(_Alert) _then) = __$AlertCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'user_id') int userId, String? title, String? body, String? image, String? topic,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'is_read')@JsonBoolConverter() bool isRead,@JsonBoolConverter() bool pinned,@JsonKey(name: 'pinned_duration') int pinnedDuration
});




}
/// @nodoc
class __$AlertCopyWithImpl<$Res>
    implements _$AlertCopyWith<$Res> {
  __$AlertCopyWithImpl(this._self, this._then);

  final _Alert _self;
  final $Res Function(_Alert) _then;

/// Create a copy of Alert
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? title = freezed,Object? body = freezed,Object? image = freezed,Object? topic = freezed,Object? createdAt = freezed,Object? isRead = null,Object? pinned = null,Object? pinnedDuration = null,}) {
  return _then(_Alert(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,topic: freezed == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,pinned: null == pinned ? _self.pinned : pinned // ignore: cast_nullable_to_non_nullable
as bool,pinnedDuration: null == pinnedDuration ? _self.pinnedDuration : pinnedDuration // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

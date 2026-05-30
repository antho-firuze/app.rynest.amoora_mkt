// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Alert _$AlertFromJson(Map<String, dynamic> json) => _Alert(
  id: (json['id'] as num?)?.toInt() ?? 0,
  userId: (json['user_id'] as num?)?.toInt() ?? 0,
  title: json['title'] as String?,
  body: json['body'] as String?,
  image: json['image'] as String?,
  topic: json['topic'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  isRead: json['is_read'] == null
      ? false
      : const JsonBoolConverter().fromJson(json['is_read']),
  pinned: json['pinned'] == null
      ? false
      : const JsonBoolConverter().fromJson(json['pinned']),
  pinnedDuration: (json['pinned_duration'] as num?)?.toInt() ?? 86400,
);

Map<String, dynamic> _$AlertToJson(_Alert instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'title': instance.title,
  'body': instance.body,
  'image': instance.image,
  'topic': instance.topic,
  'created_at': instance.createdAt?.toIso8601String(),
  'is_read': const JsonBoolConverter().toJson(instance.isRead),
  'pinned': const JsonBoolConverter().toJson(instance.pinned),
  'pinned_duration': instance.pinnedDuration,
};

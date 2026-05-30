// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reqs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Reqs _$ReqsFromJson(Map<String, dynamic> json) => _Reqs(
  url: json['url'] as String?,
  path: json['path'] as String?,
  queryParameters: json['queryParameters'] as Map<String, dynamic>?,
  data: json['data'] as Map<String, dynamic>?,
  filePath: json['filePath'] as String?,
  fileKey: json['fileKey'] as String? ?? 'userfile',
);

Map<String, dynamic> _$ReqsToJson(_Reqs instance) => <String, dynamic>{
  'url': instance.url,
  'path': instance.path,
  'queryParameters': instance.queryParameters,
  'data': instance.data,
  'filePath': instance.filePath,
  'fileKey': instance.fileKey,
};

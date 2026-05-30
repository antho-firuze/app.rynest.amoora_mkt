import 'package:amoora_mkt/cff/utils/datetime_utils.dart';
import 'package:json_annotation/json_annotation.dart';

class JsonIntConverter implements JsonConverter<int, dynamic> {
  const JsonIntConverter();

  @override
  int fromJson(dynamic json) => json == null
      ? 0
      : json is String
      ? (int.tryParse(json) ?? 0)
      : json is double
      ? json.toInt()
      : json;

  @override
  int toJson(int object) => object;
}

class JsonDoubleConverter implements JsonConverter<double, dynamic> {
  const JsonDoubleConverter();

  @override
  double fromJson(dynamic json) => json == null
      ? 0.0
      : json is String
      ? (double.tryParse(json) ?? 0.0)
      : json is int
      ? json.toDouble()
      : json;

  @override
  double toJson(double object) => object;
}

class JsonBoolConverter implements JsonConverter<bool, dynamic> {
  const JsonBoolConverter();

  @override
  bool fromJson(dynamic json) => json == null
      ? false
      : json is String
      ? json == 'true' || json == '1'
            ? true
            : false
      : json is int
      ? json == 1
            ? true
            : false
      : json;

  @override
  bool toJson(bool object) => object;
}

class JsonDateTimeConverter implements JsonConverter<DateTime?, dynamic> {
  const JsonDateTimeConverter();

  @override
  DateTime? fromJson(dynamic json) => json == null
      ? null
      : json is String
      ? json.isEmpty
            ? null
            : DateTime.parse(json)
      : json;

  @override
  String? toJson(DateTime? object) => object?.toString();
}

class JsonTimeConverter implements JsonConverter<DateTime?, dynamic> {
  const JsonTimeConverter();

  @override
  DateTime? fromJson(dynamic json) => json == null
      ? null
      : json is String
      ? json.isEmpty
            ? null
            : json.toTime()
      : json;

  @override
  String? toJson(DateTime? object) => object?.toString();
}

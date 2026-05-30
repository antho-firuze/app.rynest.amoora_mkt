import 'dart:convert';

extension DataTypeUtilDynamic on dynamic {
  bool toBool() {
    return this is String
        ? this == 'true'
              ? true
              : this == '1'
              ? true
              : false
        : this is int
        ? this == 1
              ? true
              : false
        : false;
  }
}

extension DataTypeUtilString on String {
  bool toBool() {
    return this == 'true'
        ? true
        : this == '1'
        ? true
        : false;
  }
}

extension DataTypeUtilMap on Map {
  bool toBool(String key) {
    return this[key] == null
        ? false
        : this[key] is String
        ? this[key].toString().toLowerCase() == 'true' || this[key].toString() == '1'
              ? true
              : false
        : this[key] is int
        ? this[key] == 1
              ? true
              : false
        : false;
  }

  String toStr(String key) => this[key] == null
      ? ''
      : this[key].toString();

  DateTime? toDateTime(String key) => this[key] == null
      ? null
      : this[key] is String
      ? DateTime.tryParse(this[key]) ?? null
      : this[key];

  int toInt(String key) => this[key] == null
      ? 0
      : this[key] is String
      ? (int.tryParse(this[key]) ?? 0)
      : this[key] is double
      ? this[key].toInt()
      : this[key];

  double toDouble(String key) => this[key] == null
      ? 0.0
      : this[key] is String
      ? (double.tryParse(this[key]) ?? 0.0)
      : this[key] is int
      ? this[key].toDouble()
      : this[key];

  DateTime? toDateTimeFromTimestamp(String key) =>
      this[key] == null ? null : DateTime.fromMillisecondsSinceEpoch(this[key] * 1000);

  List<dynamic> toList(String key) => this[key] == null
      ? []
      : this[key] is String
      ? jsonDecode(this[key]) is List
            ? jsonDecode(this[key])
            : []
      : this[key] is List
      ? this[key]
      : [];

  List<String> toListString(String key) => List<String>.from(toList(key));
  List<int> toListInt(String key) => List<int>.from(toList(key));
  List<double> toListDouble(String key) => List<double>.from(toList(key));
  List<DateTime?> toListDateTime(String key) => List<DateTime?>.from(
    toList(key).map(
      (e) => e is String
          ? DateTime.tryParse(e) ?? null
          : e is int
          ? DateTime.fromMillisecondsSinceEpoch(e * 1000)
          : e,
    ),
  );
}

// String jsonStr(dynamic data, String key) => data[key] ?? '';

// DateTime? jsonTime(dynamic data, String key) => data[key] == null
//     ? null
//     : data[key] is String
//     ? DateTime.tryParse(data[key]) ?? null
//     : (data[key] as String).toTime();

// DateTime? jsonDateTime(dynamic data, String key) => data[key] == null
//     ? null
//     : data[key] is String
//     ? DateTime.tryParse(data[key]) ?? null
//     : data[key];

// int jsonInt(dynamic data, String key) => data[key] == null
//     ? 0
//     : data[key] is String
//     ? (int.tryParse(data[key]) ?? 0)
//     : data[key] is double
//     ? data[key].toInt()
//     : data[key];

// double jsonDouble(dynamic data, String key) => data[key] == null
//     ? 0.0
//     : data[key] is String
//     ? (double.tryParse(data[key]) ?? 0.0)
//     : data[key] is int
//     ? data[key].toDouble()
//     : data[key];

// bool jsonBool(dynamic data, String key) => data[key] == null
//     ? false
//     : data[key] is String
//     ? data[key].toString().toLowerCase() == 'true' || data[key].toString() == '1'
//           ? true
//           : false
//     : data[key] is int
//     ? data[key] == 1
//           ? true
//           : false
//     : false;

// DateTime? jsonTimestampToDateTime(dynamic data, String key) =>
//     data[key] == null ? null : DateTime.fromMillisecondsSinceEpoch(data[key] * 1000);

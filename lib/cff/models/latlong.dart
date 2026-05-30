import 'package:freezed_annotation/freezed_annotation.dart';

part 'latlong.freezed.dart';
part 'latlong.g.dart';

@freezed
abstract class LatLong with _$LatLong {
  
  factory LatLong(
    double lat,
    double lng,
  ) = _LatLong;

  factory LatLong.fromJson(Map<String, dynamic> json) => _$LatLongFromJson(json);
}

extension ExtLatLong on LatLong {
  bool isEmpty() => lat == 0 && lng == 0;
}

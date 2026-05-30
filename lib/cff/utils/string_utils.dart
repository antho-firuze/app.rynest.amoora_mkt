
import 'dart:ui';

extension StringExtension on String {
  double toDouble() => double.parse(this);

  int toInt() => int.parse(this);

  bool toBool() => toLowerCase() == 'true'
      ? true
      : this == '1'
          ? true
          : false;

  String toInitial([int length = 2]) => replaceAll(RegExp(r'^\s*|\s*$'), '')
      .replaceAll(RegExp(r'\s{1,}'), ' ')
      .split(' ')
      .map((e) => e[0])
      .take(length)
      .join()
      .toUpperCase();

  String toGender() => [1, '1', 'P', 'M'].contains(this)
      ? 'Pria'
      : [2, '2', 'W', 'F'].contains(this)
          ? 'Wanita'
          : 'Belum tahu';

  String sanitize() => trim().replaceAll(RegExp(r'[!@#$%^&*(),.?":{}|<>]'), '');

  String groupBy4() => replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} ");

  bool isEmail() => RegExp(
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
      .hasMatch(this);

  String formatPhoneNumber() =>
      replaceAllMapped(RegExp(r'(\d{2})(\d{3})(\d{4})(\d+)'), (Match m) => "(${m[1]}) ${m[2]}-${m[3]}-${m[4]}");

  String formatPSTNNumber() =>
      replaceAllMapped(RegExp(r'(\d{4})(\d{3})(\d{3})(\d+)'), (Match m) => "(${m[1]}) ${m[2]} ${m[3]} ${m[4]}");

  String formatCardNumber() =>
      replaceAllMapped(RegExp(r'(\d{4})(\d{4})(\d{4})(\d+)'), (Match m) => "${m[1]} ${m[2]} ${m[3]} ${m[4]}");

  String toCamelCase() => replaceAll(RegExp(r'^\s*|\s*$'), '')
      .replaceAll(RegExp(r'\s{1,}'), ' ')
      .split(' ')
      .map((e) => '${e[0].toUpperCase()}${e.substring(1)}')
      .join(' ');

  Color? toColor() {
    try {
      String hex = replaceAll('#', '').toUpperCase();
      if (hex.length == 6) hex = 'FF$hex';
      return Color(int.parse(hex, radix: 16));
    } catch (e) {
      return null;
    }
  }
}

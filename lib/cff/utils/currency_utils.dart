import 'package:intl/intl.dart';

extension DoubleExtension on double {
  String toCurrency({String? prefix, String? tikom, String? suffix, String? pattern, String locale = "id_idr"}) {
    pattern ??= '#,##0.##';
    prefix = prefix == null ? '' : '$prefix ';
    tikom = tikom ?? '';
    suffix = suffix == null ? '' : ' $suffix';

    var value = NumberFormat(pattern, locale).format(this);
    return "$prefix$value$tikom$suffix";
  }

  String toIDR([String? prefix = 'Rp', String? tikom = ',-', String? suffix]) {
    prefix = prefix == null ? '' : '$prefix ';
    tikom = tikom ?? '';
    suffix = suffix == null ? '' : ' $suffix';

    var value = NumberFormat("#,##0.##", "id_idr").format(this);
    return "$prefix$value$tikom$suffix";
  }

  String toUSD() {
    var value = NumberFormat("#,##0.##", "en_us").format(this);
    return "USD $value";
  }
}

extension NumExtension on num {
  String toCurrency({String? prefix, String? tikom, String? suffix, String? pattern, String locale = "id_idr"}) {
    pattern ??= '#,##0.##';
    prefix = prefix == null ? '' : '$prefix ';
    tikom = tikom ?? '';
    suffix = suffix == null ? '' : ' $suffix';

    var value = NumberFormat(pattern, locale).format(this);
    return "$prefix$value$tikom$suffix";
  }

  String toIDR([String? prefix = 'Rp', String? tikom = ',-', String? suffix]) {
    prefix = prefix == null ? '' : '$prefix ';
    tikom = tikom ?? '';
    suffix = suffix == null ? '' : ' $suffix';

    var value = NumberFormat("#,##0.##", "id_idr").format(this);
    return "$prefix$value$tikom$suffix";
  }

  String toUSD() {
    var value = NumberFormat("#,##0.##", "en_us").format(this);
    return "USD $value";
  }
}

extension StringExtension on String {
  String toCurrency({String? prefix, String? tikom, String? suffix, String? pattern, String locale = "id_idr"}) {
    double? valDbl = double.tryParse(this);
    if (valDbl == null) return this;

    pattern ??= '#,##0.##';
    prefix = prefix == null ? '' : '$prefix ';
    tikom = tikom ?? '';
    suffix = suffix == null ? '' : ' $suffix';

    var value = NumberFormat(pattern, locale).format(valDbl);
    return "$prefix$value$tikom$suffix";
  }

  String toIDR([String? prefix = 'Rp', String? tikom = ',-', String? suffix]) {
    double? valDbl = double.tryParse(this);
    if (valDbl == null) return this;

    prefix = prefix == null ? '' : '$prefix ';
    tikom = tikom ?? '';
    suffix = suffix == null ? '' : ' $suffix';

    var value = NumberFormat("#,##0.##", "id_idr").format(valDbl);
    return "$prefix$value$tikom$suffix";
  }

  String toUSD() {
    double? valDbl = double.tryParse(this);
    if (valDbl == null) return this;

    var value = NumberFormat("#,##0.##", "en_us").format(valDbl);
    return "USD $value";
  }
}

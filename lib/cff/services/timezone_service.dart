import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

Future<void> configureLocalTimeZone() async {
  if (kIsWeb || Platform.isLinux) {
    return;
  }
  await initializeDateFormatting('id');
  tz.initializeTimeZones();
  final TimezoneInfo timeZoneInfo = await FlutterTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(timeZoneInfo.identifier));
  log('init > configureLocalTimeZone');
}

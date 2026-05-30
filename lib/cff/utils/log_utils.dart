import 'dart:developer' show log;

import 'package:flutter/foundation.dart';
import 'package:talker_flutter/talker_flutter.dart';

final talker = TalkerFlutter.init(logger: TalkerLogger(filter: LogLevelFilter(LogLevel.debug)));

extension CustomTalker on Talker {
  void logDCustom(String message, {String? name}) {
    String title = name ?? 'DEBUG';
    if (title != 'DEBUG') {
      title = "DEBUG | $title";
    }
    logCustom(TalkerLog(message, title: title, logLevel: LogLevel.debug, pen: AnsiPen()..xterm(208)));
  }

  void logICustom(String message, {String? name}) {
    // AnsiPen color1 = AnsiPen()..xterm(220);
    // AnsiPen color2 = AnsiPen()..xterm(200);
    // AnsiPen selectedColor = name != null ? color2 : color1;
    String title = name ?? 'INFO';
    if (title != 'INFO') {
      title = "INFO | $title";
    }
    logCustom(TalkerLog(message, title: title, logLevel: LogLevel.info, pen: AnsiPen()..xterm(220)));
  }

  void logECustom(dynamic message, {String name = '', Object? error, StackTrace? stackTrace}) => logCustom(
    TalkerLog(
      message,
      title: name,
      exception: error,
      stackTrace: stackTrace,
      logLevel: LogLevel.error,
      pen: AnsiPen()..red(),
    ),
  );
}

void logD(String message, {String? name}) => talker.logDCustom(message, name: name);

void logI(String message, {String? name}) => talker.logICustom(message, name: name);

void logE(dynamic message, {String name = '', Object? error, StackTrace? stackTrace}) =>
    talker.logECustom(message, name: name, error: error, stackTrace: stackTrace);

void logX(String message, {String? name, Object? error, StackTrace? st}) {
  if (!kReleaseMode) {
    log(message, name: name ?? '', error: error, stackTrace: st);
  }
}

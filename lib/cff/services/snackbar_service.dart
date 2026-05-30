import 'package:amoora_mkt/cff/utils/router.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:amoora_mkt/main.dart';

class SnackBarService {
  static void show({required String message, Duration? duration}) {
    scaffoldKey.currentState!.clearSnackBars();
    scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(message)));
  }

  const SnackBarService({
    required this.message,
    this.duration = const Duration(seconds: 2),
    this.backgroundColor = Colors.black54,
  });
  final Widget message;
  final Duration duration;
  final Color backgroundColor;

  void shown({double? bottom}) {
    final context = rootNavigatorKey.currentContext!;
    scaffoldKey.currentState!.clearSnackBars();
    scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(10)),
                child: message,
              ),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: bottom ?? context.screenHeight / 3),
      ),
    );
  }
}

extension SnackBarExt on BuildContext {
  void showSnackBar(String message, {Duration duration = const Duration(seconds: 2)}) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message), duration: duration));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

import 'router.dart';

final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);

extension DarkModeContext on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}

extension LightDark on Color {
  Color? whenDark(Color? dark, [BuildContext? context]) => Theme.of(context ?? rootNavigatorKey.currentContext!).brightness == Brightness.light ? this : dark;
}

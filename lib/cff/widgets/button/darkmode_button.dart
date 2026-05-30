import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/cff/utils/darkmode_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';

class DarkModeButton extends ConsumerWidget {
  const DarkModeButton({super.key, this.color = oWhite});

  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Icon? icon;
    String? toolTip;
    switch (ref.watch(themeModeProvider)) {
      case ThemeMode.light:
        icon = Icon(Icons.light_mode, color: color);
        toolTip = 'Light Mode';
        break;
      case ThemeMode.dark:
        icon = Icon(Icons.dark_mode, color: color);
        toolTip = 'Dark Mode';
        break;
      default:
        icon = Icon(SuperIcons.bs_lightbulb, color: color);
        toolTip = 'System Theme';
    }

    return IconButton(
      tooltip: toolTip,
      style: IconButton.styleFrom(backgroundColor: primaryLight),
      onPressed: () {
        ref.read(themeModeProvider.notifier).state = switch (ref.watch(themeModeProvider)) {
          ThemeMode.system => ThemeMode.light,
          ThemeMode.light => ThemeMode.dark,
          ThemeMode.dark => ThemeMode.system,
        };
      },
      icon: icon,
    );
  }
}

import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsButton extends ConsumerWidget {
  const SettingsButton({super.key, this.tooltip, this.onPressed});

  final String? tooltip;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      tooltip: tooltip ?? 'Settings',
      onPressed: onPressed,
      icon: const Icon(Icons.settings, color: oWhite),
    );
  }
}

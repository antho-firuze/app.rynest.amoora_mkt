import 'package:flutter/material.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';
import 'package:super_icons/super_icons.dart';

class LoadingFailed extends StatelessWidget {
  const LoadingFailed({super.key, this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Opacity(
        opacity: .3,
        child: Column(
          children: [const Icon(SuperIcons.is_refresh_2_bold, size: 35), const Text('Reload').size(10).clr(oBlack)],
        ),
      ),
    );
  }
}

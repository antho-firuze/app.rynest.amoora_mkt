import 'package:amoora_mkt/cff/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  const IconText({super.key, this.icon, required this.text, this.onTap});

  final Widget? icon;
  final Widget text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[icon!, 5.width],
          text,
        ],
      ),
    );
  }
}

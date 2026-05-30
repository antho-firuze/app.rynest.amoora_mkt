import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class CustomBadge extends StatelessWidget {
  const CustomBadge(this.data, {super.key, this.icon, this.color, this.backgroundColor});

  final String data;
  final IconData? icon;
  final Color? color;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(color: backgroundColor ?? Colors.blue, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[Icon(icon, size: 12, color: color ?? oWhite), 5.width],
          Text(data).tsCaption(scale: .7).bold().clr(color ?? oWhite),
        ],
      ),
    );
  }
}

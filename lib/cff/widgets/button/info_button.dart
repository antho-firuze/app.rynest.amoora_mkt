import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:flutter/material.dart';
import 'package:super_icons/super_icons.dart';

class InfoButton extends StatelessWidget {
  const InfoButton({super.key, this.color = oWhite, this.onPressed});

  final Color? color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(SuperIcons.mg_information_fill, color: color),
    );
  }
}

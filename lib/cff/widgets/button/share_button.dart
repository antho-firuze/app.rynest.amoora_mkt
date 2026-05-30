import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({super.key, this.color = oWhite, this.onPressed});

  final Color? color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.share, color: color),
    );
  }
}

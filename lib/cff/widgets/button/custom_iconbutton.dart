import 'package:amoora_mkt/cff/widgets/spinning.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    this.tooltip,
    this.busy = false,
    this.padding,
    this.color = primaryLight,
    this.shape,
    this.hasNotif = false,
    required this.onPressed,
  });

  final bool busy;
  final Widget icon;
  final String? tooltip;
  final EdgeInsetsGeometry? padding;
  final Color color;
  final OutlinedBorder? shape;
  final bool hasNotif;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip ?? '',
      child: Stack(
        children: [
          IconButton(
            icon: busy ? Spinning(child: icon) : icon,
            onPressed: onPressed,
            style: IconButton.styleFrom(padding: padding, backgroundColor: color, shape: shape),
          ),
          if (hasNotif)
            Positioned(
              right: 9,
              top: 9,
              child: SizedBox(
                width: 7,
                height: 7,
                child: Container(
                  decoration: BoxDecoration(color: oRed50, shape: BoxShape.circle),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

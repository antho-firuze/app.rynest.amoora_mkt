import 'package:flutter/material.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon(
    this.iconData, {
    super.key,
    this.onPressed,
    this.color,
    this.backgroundColor,
    this.size = 32,
    this.padding,
    this.busy = false,
    this.enabled = true,
    this.tooltip,
    this.flat = false,
    this.iconRatio = .75,
    this.borderRadius = 12,
    this.shape = BoxShape.circle,
  });

  final bool busy;
  final bool enabled;
  final String? tooltip;
  final IconData? iconData;
  final Color? color;
  final Color? backgroundColor;
  final double size;
  final EdgeInsetsGeometry? padding;
  final Function()? onPressed;
  final bool flat;
  final double iconRatio;
  final BoxShape shape;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    assert(iconRatio <= 1);
    final onPressed = busy ? null : (enabled ? this.onPressed : null);
    final buttonRectangleStyleNormal = ElevatedButton.styleFrom(
      padding: EdgeInsets.zero,
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
      shadowColor: Colors.transparent,
      elevation: 0,
    );
    final buttonRectangleStyleFlat = ElevatedButton.styleFrom(
      padding: EdgeInsets.zero,
      foregroundColor: primaryLight,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(color: oGrey),
      ),
      shadowColor: Colors.transparent,
      elevation: 0,
    );
    final buttonCircleStyleNormal = ElevatedButton.styleFrom(
      padding: EdgeInsets.zero,
      backgroundColor: backgroundColor,
      shape: const CircleBorder(),
      shadowColor: Colors.transparent,
      elevation: 0,
    );
    final buttonCircleStyleFlat = ElevatedButton.styleFrom(
      padding: EdgeInsets.zero,
      foregroundColor: primaryLight,
      backgroundColor: Colors.transparent,
      shape: const CircleBorder(side: BorderSide(color: oGrey)),
      shadowColor: Colors.transparent,
      elevation: 0,
    );
    return Tooltip(
      message: tooltip ?? '',
      child: Center(
        child: SizedBox(
          width: size,
          height: size,
          child: ElevatedButton(
            onPressed: onPressed,
            style: flat
                ? shape == BoxShape.circle
                      ? buttonCircleStyleFlat
                      : buttonRectangleStyleFlat
                : shape == BoxShape.circle
                ? buttonCircleStyleNormal
                : buttonRectangleStyleNormal,
            child: Icon(iconData, size: size * iconRatio, color: color),
          ),
        ),
      ),
    );
  }
}

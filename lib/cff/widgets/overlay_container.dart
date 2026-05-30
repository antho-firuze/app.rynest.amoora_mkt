import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/cff/utils/darkmode_utils.dart';
import 'package:flutter/material.dart';

class OverlayContainer extends StatelessWidget {
  const OverlayContainer({
    super.key,
    required this.child,
    this.padding = EdgeInsets.zero,
    this.offsetY = 1,
    required this.isShowOverlay,
    this.backgroundColor,
  });

  final Widget child;
  final EdgeInsets padding;
  final double offsetY;
  final bool isShowOverlay;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      offset: Offset(0, isShowOverlay ? 0 : offsetY),
      duration: const Duration(milliseconds: 200),
      child: AnimatedOpacity(
        opacity: isShowOverlay ? 1 : 0,
        duration: const Duration(milliseconds: 200),
        child: Container(
          padding: padding,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: backgroundColor,
            border: context.isDarkMode ? Border.all(width: 2, color: oWhite) : null,
          ),
          child: child,
        ),
      ),
    );
  }
}

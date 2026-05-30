import 'package:flutter/material.dart';

class FadeAnimation extends StatelessWidget {
  const FadeAnimation({
    super.key,
    required this.animation,
    required this.child,
    required this.isExpanded,
  });

  final Animation<double> animation;
  final Widget child;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween(
        begin: isExpanded ? 0.0 : 1.0,
        end: isExpanded ? 1.0 : 0.0,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Interval(
            isExpanded ? 0.5 : 0.2,
            isExpanded ? 1.0 : 0.55,
          ),
        ),
      ),
      child: child,
    );
  }
}

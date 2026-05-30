import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Spinning extends HookWidget {
  const Spinning({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    var controller =
        useAnimationController(duration: const Duration(milliseconds: 1000))
          ..repeat();
    return RotationTransition(
      turns: Tween<double>(begin: 0, end: 1).animate(controller),
      child: child,
    );
  }
}

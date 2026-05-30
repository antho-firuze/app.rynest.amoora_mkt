import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Glowing extends HookWidget {
  const Glowing({
    super.key,
    this.width,
    this.height,
    this.radius = 0,
    this.child,
  });

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    var controller =
        useAnimationController(duration: const Duration(milliseconds: 5000))
          ..repeat();

    // double val = Tween(begin: 0.0, end: 1.0).animate(controller).value;
    controller.addListener(() {
      log(controller.value.toString());
    });
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: const [
            Colors.grey,
            Colors.red,
            Colors.grey,
          ],
          stops: [
            0.0,
            controller.value,
            1.0,
          ],
        ),
      ),
      child: child,
    );
  }
}

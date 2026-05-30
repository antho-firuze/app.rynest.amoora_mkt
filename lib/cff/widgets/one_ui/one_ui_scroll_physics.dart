import 'package:flutter/material.dart';

class OneUIScrollPhysics extends ScrollPhysics {
  final double expandedHeight;

  const OneUIScrollPhysics(this.expandedHeight, {super.parent});

  @override
  ScrollPhysics applyTo(ScrollPhysics? ancestor) {
    assert(ancestor != null);
    return OneUIScrollPhysics(expandedHeight, parent: buildParent(ancestor));
  }

  @override
  Simulation? createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    if (velocity == 0.0 ||
        (velocity > 0.0 && position.pixels >= position.maxScrollExtent) ||
        (velocity < 0.0 && position.pixels <= position.maxScrollExtent)) {
      return null;
    }
    return OneUIScrollSimulation(
      position.pixels,
      velocity,
      expandedHeight: expandedHeight,
    );
  }
}

class OneUIScrollSimulation extends ClampingScrollSimulation {
  OneUIScrollSimulation(
    double position,
    double velocity, {
    required this.expandedHeight,
    super.friction,
    super.tolerance,
  }) : super(
          position: position,
          velocity: velocity,
        ) {
    assert(expandedHeight >= 0);
  }

  final double expandedHeight;

  @override
  double x(double time) {
    final double x = super.x(time);
    return x < 0.0 ? 0.0 : (x > expandedHeight ? expandedHeight : x);
  }

  @override
  bool isDone(double time) => super.isDone(time) || position >= expandedHeight;
}

import 'package:flutter/material.dart';

class PillGesture extends StatelessWidget {
  const PillGesture({
    super.key,
    required this.onVerticalDragStart,
    required this.onVerticalDragUpdate,
    required this.onVerticalDragEnd,
    this.child,
  });

  final GestureDragStartCallback onVerticalDragStart;
  final GestureDragUpdateCallback onVerticalDragUpdate;
  final GestureDragEndCallback onVerticalDragEnd;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onVerticalDragStart: onVerticalDragStart,
      onVerticalDragUpdate: onVerticalDragUpdate,
      onVerticalDragEnd: onVerticalDragEnd,
      child: child,
      // child: Center(
      //   child: Padding(
      //     padding: const EdgeInsets.only(top: 10, bottom: 8),
      //     child: Container(
      //       height: 5.0,
      //       width: 50.0,
      //       decoration: BoxDecoration(
      //         color: pillColor ?? Colors.grey,
      //         borderRadius: BorderRadius.circular(50.0),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

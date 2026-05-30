import 'package:flutter/material.dart';

import 'ui_helper.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key, required this.child, this.largeScreen});

  final Widget child;
  final Widget? largeScreen;

  @override
  Widget build(BuildContext context) {
    if (context.screenWidth < 1000 && context.screenHeight < 1000) {
      return child;
    } else {
      return largeScreen ?? Container();
    }
  }
}

import 'package:amoora_mkt/cff/utils/orientation_utils.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class ScreenDebugInfo extends StatelessWidget {
  const ScreenDebugInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Width: ${context.screenWidth.round()}").clr(Colors.red),
              Text("Height: ${context.screenHeight.round()}").clr(Colors.red),
              Text("Ratio: ${context.aspectRatio}").clr(Colors.red),
              Text("Landscape: ${context.isLandscape}").clr(Colors.red),
              Text("Big Screen: ${context.isBigScreen}").clr(Colors.red),
              Text("Width Screen: ${context.isWidthScreen}").clr(Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}

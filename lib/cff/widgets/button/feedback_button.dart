import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:flutter/material.dart';
// import 'package:wiredash/wiredash.dart';

class FeedbackButton extends StatelessWidget {
  const FeedbackButton({super.key, this.color = oWhite});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'Feedback',
      onPressed: () {
        // Wiredash.of(context).show(inheritMaterialTheme: true);
      },
      icon: Icon(Icons.feedback, color: color),
    );
  }
}

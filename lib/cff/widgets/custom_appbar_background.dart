import 'package:flutter/material.dart';
import 'package:amoora_mkt/cff/widgets/clipper/smile_right_clipper.dart';
import 'package:amoora_mkt/cff/widgets/clipper/smile_right_top_clipper.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';

class CustomAppBarBackground extends StatelessWidget {
  const CustomAppBarBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: primaryDark),
        ClipPath(
          clipper: SmileRightTopClipper(),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [primaryLight, primaryDark],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        ClipPath(
          clipper: SmileRightClipper(),
          child: Container(color: primaryLight),
        ),
      ],
    );
  }
}

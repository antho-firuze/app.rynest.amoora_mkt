import 'package:flutter/material.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/features/user/controller/carousel_ctrl.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';

class HeroLayoutCard extends StatelessWidget {
  const HeroLayoutCard({super.key, required this.item});

  final CarouselItems item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: OverflowBox(
            maxWidth: context.screenWidth,
            minWidth: context.screenWidth,
            child: Image(fit: BoxFit.fitWidth, image: AssetImage(item.image)),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(color: Colors.black.withValues(alpha: .1)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(item.title, softWrap: false).tsBody().bold().clr(oWhite).clip(),
            Text(item.subtitle, softWrap: false).tsBody().bold().clr(oWhite).clip(),
          ],
        ),
      ],
    );
  }
}

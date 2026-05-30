import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:super_icons/super_icons.dart';

enum RatingType { type1, type2 }

class CustomRatingStar extends StatelessWidget {
  const CustomRatingStar({
    super.key,
    this.rating = 1,
    this.type = RatingType.type1,
    this.foregroundColor,
    this.backgroundColor,
  });

  final double rating;
  final RatingType type;
  final Color? foregroundColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    if (type == RatingType.type1) {
      return type1();
    } else {
      return type2();
    }
  }

  Widget type1() {
    return SizedBox(
      height: 15,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            Icon(SuperIcons.mg_star_fill, size: 12, color: (index <= (rating - 1)) ? Colors.orangeAccent : oGrey70),
        separatorBuilder: (context, index) => 5.width,
        itemCount: 5,
      ),
    );
  }

  Widget type2() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(color: backgroundColor ?? oBlue70, borderRadius: BorderRadius.circular(14)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(SuperIcons.bs_star_fill, size: 10, color: foregroundColor),
          3.width,
          Text("$rating").size(14).bold().clr(foregroundColor),
        ],
      ),
    );
  }
}

import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/cff/utils/darkmode_utils.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:super_icons/super_icons.dart';

class ThreeLine extends StatelessWidget {
  const ThreeLine({super.key, required this.caption, required this.value, this.trailing, this.onTap, this.onTapValue});

  final String caption;
  final String value;
  final IconData? trailing;
  final Function()? onTap;
  final Function()? onTapValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: context.screenWidthRatio(.3, .3), child: Text(caption).clr(oBlack50.whenDark(oWhite70))),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: onTapValue ?? onTap,
                  child: Text(
                    value,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: ts.clr(oBlack.whenDark(oWhite)),
                  ),
                ),
              ),
              5.width,
              if (onTap != null)
                Icon(trailing ?? SuperIcons.is_arrow_circle_right_outline).link(onTap: onTap)
              else
                Icon(trailing ?? SuperIcons.is_arrow_circle_right_outline, color: oGrey70),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';

class WarningException extends StatelessWidget {
  const WarningException({super.key, this.title, this.child, this.subTitle});

  final String? title;
  final String? subTitle;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: context.screenWidthRatio(.15, 0)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/im-warning.png', width: context.screenWidthRatio(.5, .25)),
                20.whenLandscape(0)!.height,
                Text(title ?? '').tsTitle().center(),
                if (subTitle != null) ...[10.height, Text(subTitle ?? '').tsTitle().center()],
                20.height,
                child ?? Container(),
              ],
            ),
          ),
        ),
      ],
    );
    // return Image.asset('assets/images/im-warning.png');
  }
}

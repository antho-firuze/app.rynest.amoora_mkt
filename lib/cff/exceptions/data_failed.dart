import 'package:flutter/material.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';
import 'package:super_icons/super_icons.dart';

class DataFailed extends StatelessWidget {
  const DataFailed({super.key, this.message, this.onTap, this.padding});

  final String? message;
  final EdgeInsetsGeometry? padding;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(top: context.screenWidthRatio(.15, 0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(child: Image.asset('assets/images/data-not-found.png', width: context.screenWidthRatio(.5, .3))),
          Text(message ?? 'Data belum tersedia !').tsTitle().center(),
          if (onTap != null)
            GestureDetector(
              onTap: onTap,
              child: Opacity(
                opacity: .3,
                child: Column(
                  children: [
                    const Icon(SuperIcons.is_refresh_2_bold, size: 35),
                    const Text('Reload').size(10).clr(oBlack),
                  ],
                ),
              ),
            ),
          // CustomIconButton(
          //   onPressed: onTap,
          //   icon: const Icon(Iconsax.refresh_2, size: 35),
          // ),
        ],
      ),
    );
  }
}

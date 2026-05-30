import 'package:amoora_mkt/cff/widgets/screen_debug_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/app_color.dart';
import 'system_ui_overlay.dart';
import 'ui_helper.dart';

enum ScreenOrientation { both, portrait, landscape }

class MyUI extends StatelessWidget {
  const MyUI({
    super.key,
    this.decoration,
    required this.child,
    this.isDark = false,
    this.enabledSafeArea = true,
    this.customUiOverlayStyle,
    this.isTransparent = false,
    this.showInfoScreen = false,
    this.orientation = ScreenOrientation.both,
    this.customStatusBarBackground,
    this.customAppBarBackground,
    this.customBackground,
  });

  final Decoration? decoration;
  final Widget child;
  final bool isDark;
  final bool enabledSafeArea;
  final SystemUiOverlayStyle? customUiOverlayStyle;
  final bool isTransparent;
  final bool showInfoScreen;
  final ScreenOrientation orientation;
  final Widget? customStatusBarBackground;
  final Widget? customAppBarBackground;
  final Widget? customBackground;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: customUiOverlayStyle ?? (isDark ? SystemUIOverlay.darkColorOverlay : SystemUIOverlay.lightColorOverlay),
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(.8)),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            // BACKGROUND
            if (customBackground != null)
              customBackground!
            else
              Container(color: Theme.of(context).scaffoldBackgroundColor),
            // STATUS BAR
            if (customStatusBarBackground != null)
              SizedBox(
                width: context.screenWidth,
                height: MediaQuery.of(context).viewPadding.top,
                child: customStatusBarBackground!,
              )
            else
              Container(height: MediaQuery.of(context).viewPadding.top, color: primaryLight),
            // APP BAR
            if (customAppBarBackground != null)
              SizedBox(
                width: context.screenWidth,
                height: MediaQuery.of(context).viewPadding.top + kToolbarHeight,
                child: customAppBarBackground!,
              ),
            SafeArea(top: enabledSafeArea, bottom: false, child: child),
            // Container(
            //   decoration: decoration ?? BoxDecoration(color: isTransparent ? Colors.transparent : primaryLight),
            //   child: SafeArea(
            //     top: enabledSafeArea,
            //     bottom: false,
            //     child: child,
            //   ),
            // ),
            if (showInfoScreen) ScreenDebugInfo(),
          ],
        ),
      ),
    );
  }
}

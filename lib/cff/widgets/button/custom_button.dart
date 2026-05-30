import 'package:amoora_mkt/cff/utils/darkmode_utils.dart';
import 'package:amoora_mkt/cff/utils/orientation_utils.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:super_icons/super_icons.dart';

enum ButtonType { normal, google, apple }

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.type = ButtonType.normal,
    this.busy = false,
    this.enabled = true,
    this.color,
    this.bgColor,
    this.minWidth,
    this.tooltip,
    this.icon,
    this.child,
    this.flat = false,
    this.onPressed,
  });

  final ButtonType type;
  final bool busy;
  final bool enabled;
  final Color? color;
  final Color? bgColor;
  final double? minWidth;
  final String? tooltip;
  final Icon? icon;
  final Widget? child;
  final bool flat;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final onPressed = busy ? null : (enabled ? this.onPressed : null);
    final buttonStyleNormal = ElevatedButton.styleFrom(
      backgroundColor: bgColor,
      iconColor: color ?? oWhite,
      iconSize: 15,
      // alignment: Alignment.center,
      // iconAlignment: IconAlignment.end,
      // textStyle: TextStyle(),
    );
    final buttonStyleFlat = ElevatedButton.styleFrom(
      foregroundColor: primaryLight.whenDark(oWhite, context),
      backgroundColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: primaryLight),
        borderRadius: BorderRadius.circular(8.0),
      ),
      iconColor: primaryLight.whenDark(oWhite, context),
      iconSize: 15,
    );

    if (type == ButtonType.google) {
      return SizedBox(
        width: context.isLandscape || context.isWidthScreen ? minWidth : double.infinity,
        child: Tooltip(
          message: tooltip ?? "Log In dengan akun Google",
          child: ElevatedButton(
            onPressed: onPressed,
            style: buttonStyleFlat,
            child: busy
                ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(SuperIcons.bs_google),
                      20.width,
                      Text('Log In dengan akun Google').tsButton().clr(oBlack.whenDark(oWhite, context)),
                    ],
                  ),
          ),
        ),
      );
    }

    if (type == ButtonType.apple) {
      return SizedBox(
        width: context.isLandscape || context.isWidthScreen ? minWidth : double.infinity,
        child: Tooltip(
          message: tooltip ?? "Log In dengan akun Apple",
          child: ElevatedButton(
            onPressed: onPressed,
            style: buttonStyleFlat.copyWith(iconColor: WidgetStatePropertyAll(oBlack.whenDark(oWhite, context))),
            child: busy
                ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(SuperIcons.bs_apple),
                      20.width,
                      Text('Log In dengan akun Apple').tsButton().clr(oBlack.whenDark(oWhite, context)),
                    ],
                  ),
          ),
        ),
      );
    }

    if (icon != null && child != null) {
      return SizedBox(
        width: context.isLandscape || context.isWidthScreen ? minWidth : double.infinity,
        child: Tooltip(
          message: tooltip ?? "",
          child: ElevatedButton.icon(
            onPressed: onPressed,
            style: flat ? buttonStyleFlat : buttonStyleNormal,
            iconAlignment: IconAlignment.start,
            icon: icon!,
            label: busy
                ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  )
                : child!,
          ),
        ),
      );
    }

    return SizedBox(
      width: context.isLandscape || context.isWidthScreen ? minWidth : double.infinity,
      child: Tooltip(
        message: tooltip ?? "",
        child: ElevatedButton(
          onPressed: onPressed,
          style: flat ? buttonStyleFlat : buttonStyleNormal,
          child: busy
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                )
              : icon != null && child == null
              ? icon
              : child,
        ),
      ),
    );
  }
}

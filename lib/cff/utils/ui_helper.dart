import 'package:amoora_mkt/cff/core/app_theme.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../core/app_color.dart';
import 'darkmode_utils.dart';
import 'orientation_utils.dart';
import 'router.dart';

Color primaryColor() => Theme.of(rootNavigatorKey.currentContext!).colorScheme.primary;
Color secondaryColor() => Theme.of(rootNavigatorKey.currentContext!).colorScheme.secondary;

extension EmptySpace on num {
  SizedBox get height => SizedBox(height: toDouble());

  SizedBox get width => SizedBox(width: toDouble());

  double? whenBigScreen(double? val) =>
      (rootNavigatorKey.currentContext!.screenWidth < 1000 && rootNavigatorKey.currentContext!.screenHeight < 1000)
      ? toDouble()
      : val;

  double? whenLandscape(double? val) => rootNavigatorKey.currentContext!.isLandscape ? val : toDouble();

  int whenLandscapeInt(int val) => rootNavigatorKey.currentContext!.isLandscape ? val : toInt();
}

// final Image oImagePlaceholder = Image.asset(
//   'assets/images/im_photo_placeholder.gif',
//   fit: BoxFit.cover,
// );

// ===== Sizes Sections
// =========================
extension ScreenSize on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  double get aspectRatio => MediaQuery.of(this).size.aspectRatio;

  /// Function to get screen width ratio
  ///
  /// screen_width * p => when portrait <br>
  /// screen_width * l => when landscape
  double screenWidthRatio([double portrait = 1, double landscape = 1]) {
    return isLandscape ? MediaQuery.of(this).size.width * landscape : MediaQuery.of(this).size.width * portrait;
  }
}

Widget divider({EdgeInsets padding = EdgeInsets.zero, bool isHorizontal = true, double thick = 1, Color? color}) =>
    Padding(
      padding: padding,
      child: Container(
        width: isHorizontal ? null : thick,
        height: isHorizontal ? thick : null,
        color: color ?? Colors.grey.withValues(alpha: 0.5),
      ),
    );

const TextStyle ts = TextStyle();

TextStyle tsHeadline([BuildContext? context]) => ts.copyWith(
  fontWeight: AppTheme.fontRegular,
  fontSize: AppTheme.fsHeadlineM.whenBigScreen(AppTheme.fsDisplayS),
  color: oBlack.whenDark(oWhite, context),
);

TextStyle tsTitle([BuildContext? context]) => ts.copyWith(
  fontWeight: AppTheme.fontRegular,
  fontSize: AppTheme.fsTitleM.whenBigScreen(AppTheme.fsHeadlineM),
  color: oBlack.whenDark(oWhite, context),
);

TextStyle tsBody([BuildContext? context]) => ts.copyWith(
  fontWeight: AppTheme.fontRegular,
  fontSize: AppTheme.fsBodyM.whenBigScreen(AppTheme.fsBodyL),
  color: oBlack.whenDark(oWhite, context),
);

extension TextStyleHelpers on TextStyle {
  TextStyle family(String family) => copyWith(fontFamily: family);
  TextStyle clr(Color? color) => copyWith(color: color);
  TextStyle size(double size) => copyWith(fontSize: size);
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  TextStyle get thin => copyWith(fontWeight: FontWeight.w100);
  TextStyle get extraLight => copyWith(fontWeight: FontWeight.w200);
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);
  TextStyle space(double? ltrSpacing) => copyWith(letterSpacing: ltrSpacing);
  TextStyle letterSpace(double value) => copyWith(letterSpacing: value);
  TextStyle bold([FontWeight? fontWeight]) => copyWith(fontWeight: fontWeight ?? FontWeight.bold);
  TextStyle link() => copyWith(color: linkColorLight.whenDark(linkColorDark)).italic;

  /// A method to underline a text with a customizable [distance] between the text
  /// and underline. The [color], [thickness] and [style] can be set
  /// as the decorations of a [TextStyle].
  TextStyle underline({
    Color? color,
    double distance = 1,
    double thickness = 1,
    TextDecorationStyle style = TextDecorationStyle.solid,
  }) {
    return copyWith(
      shadows: [Shadow(color: this.color ?? Colors.black, offset: Offset(0, -distance))],
      color: Colors.transparent,
      decoration: TextDecoration.underline,
      decorationThickness: thickness,
      decorationColor: color ?? this.color,
      decorationStyle: style,
    );
  }
}

extension AnotherTextStyleHelpers on Text {
  Text _text({
    TextStyle? newStyle,
    TextAlign? textAlign,
    TextOverflow? newOverflow,
    int? newMaxLines,
    TextScaler? textScaler,
  }) => Text(
    data!,
    style: newStyle ?? (style ?? ts),
    textAlign: (textAlign ?? this.textAlign),
    overflow: newOverflow ?? overflow,
    maxLines: newMaxLines,
    softWrap: softWrap,
    textScaler: textScaler,
  );

  Text tsHeadline({double scale = .8}) => _text(
    textScaler: TextScaler.linear(scale),
    newStyle: (style ?? ts).copyWith(
      fontWeight: AppTheme.fontRegular,
      fontSize: AppTheme.fsHeadlineM.whenBigScreen(AppTheme.fsDisplayS),
    ),
  );

  Text tsTitle({double scale = .8}) => _text(
    textScaler: TextScaler.linear(scale),
    newStyle: (style ?? ts).copyWith(
      fontWeight: AppTheme.fontRegular,
      fontSize: AppTheme.fsTitleM.whenBigScreen(AppTheme.fsHeadlineM),
    ),
  );

  Text tsBody({double scale = .8}) => _text(
    textScaler: TextScaler.linear(scale),
    newStyle: (style ?? ts).copyWith(
      fontWeight: AppTheme.fontRegular,
      fontSize: AppTheme.fsBodyM.whenBigScreen(AppTheme.fsBodyL),
    ),
  );

  Text tsLabel({double scale = .8}) => _text(
    textScaler: TextScaler.linear(scale),
    newStyle: (style ?? ts).copyWith(
      fontWeight: AppTheme.fontRegular,
      fontSize: AppTheme.fsLabelM.whenBigScreen(AppTheme.fsLabelL),
    ),
  );

  Text tsCaption({double scale = .8}) => _text(
    textScaler: TextScaler.linear(scale),
    newStyle: (style ?? ts).copyWith(
      fontWeight: AppTheme.fontRegular,
      fontSize: AppTheme.fsLabelS.whenBigScreen(AppTheme.fsLabelM),
    ),
  );

  Text tsButton({double scale = .8}) => _text(
    textScaler: TextScaler.linear(scale),
    newStyle: (style ?? ts).copyWith(
      fontWeight: AppTheme.fontMedium,
      fontSize: AppTheme.fsLabelM.whenBigScreen(AppTheme.fsLabelL),
    ),
  );

  Text family(String family) => _text(
    textScaler: this.textScaler,
    newStyle: (style ?? ts).copyWith(fontFamily: family),
  );
  Text clr(Color? color) => _text(
    textScaler: this.textScaler,
    newStyle: (style ?? ts).copyWith(color: color),
  );
  Text size(double size) => _text(
    textScaler: this.textScaler,
    newStyle: (style ?? ts).copyWith(fontSize: size),
  );
  Text get italic => _text(
    textScaler: this.textScaler,
    newStyle: (style ?? ts).copyWith(fontStyle: FontStyle.italic),
  );
  Text get thin => _text(
    textScaler: this.textScaler,
    newStyle: (style ?? ts).copyWith(fontWeight: FontWeight.w100),
  );
  Text get extraLight => _text(
    textScaler: this.textScaler,
    newStyle: (style ?? ts).copyWith(fontWeight: FontWeight.w200),
  );
  Text get light => _text(
    textScaler: this.textScaler,
    newStyle: (style ?? ts).copyWith(fontWeight: FontWeight.w300),
  );
  Text space(double? ltrSpacing) => _text(
    textScaler: this.textScaler,
    newStyle: (style ?? ts).copyWith(letterSpacing: ltrSpacing),
  );
  Text letterSpace(double value) => _text(
    textScaler: this.textScaler,
    newStyle: (style ?? ts).copyWith(letterSpacing: value),
  );
  Text bold([FontWeight? fontWeight]) => _text(
    textScaler: this.textScaler,
    newStyle: (style ?? ts).copyWith(fontWeight: fontWeight ?? FontWeight.bold),
  );

  Text ellipsis() => _text(textScaler: this.textScaler, newOverflow: TextOverflow.ellipsis);
  Text clip() => _text(textScaler: this.textScaler, newOverflow: TextOverflow.clip);
  Text maxLn(int? lines) => _text(textScaler: this.textScaler, newMaxLines: lines);

  // Text Align
  Text right() => _text(textScaler: this.textScaler, textAlign: TextAlign.right);
  Text center() => _text(textScaler: this.textScaler, textAlign: TextAlign.center);
  Text left() => _text(textScaler: this.textScaler, textAlign: TextAlign.left);
  Text justify() => _text(textScaler: this.textScaler, textAlign: TextAlign.justify);

  InkWell link({bool isBold = false, bool isItalic = false, Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: _text(
        textScaler: this.textScaler,
        newStyle: (style ?? ts).copyWith(
          color: linkColorLight.whenDark(linkColorDark),
          fontWeight: isBold ? FontWeight.bold : null,
          fontStyle: isItalic ? FontStyle.italic : null,
        ),
      ),
    );
  }

  /// A method to underline a text with a customizable [distance] between the text
  /// and underline. The [color], [thickness] and [style] can be set
  /// as the decorations of a [TextStyle].
  Text underline({
    Color? color,
    double distance = 1,
    double thickness = 1,
    TextDecorationStyle line = TextDecorationStyle.solid,
  }) {
    return _text(
      textScaler: this.textScaler,
      newStyle: (style ?? ts).copyWith(
        shadows: [Shadow(color: (style ?? ts).color ?? Colors.black, offset: Offset(0, -distance))],
        color: Colors.transparent,
        decoration: TextDecoration.underline,
        decorationThickness: thickness,
        decorationColor: color ?? (style ?? ts).color,
        decorationStyle: line,
      ),
    );
  }
}

extension IconExtensions on Icon {
  GestureDetector link({Function()? onTap, Color? color}) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, color: color ?? oBlack.whenDark(oGold)),
    );
  }

  Icon clr(Color? color) => Icon(icon, color: color);
}

Widget bumperBottom(BuildContext context) => SizedBox(height: MediaQuery.of(context).padding.bottom);

Color getRandomColor() {
  return Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0).withValues(alpha: 1.0);
}

String countryCodeToEmoji(String? countryCode) {
  // 0x41 is Letter A
  // 0x1F1E6 is Regional Indicator Symbol Letter A
  // Example :
  // firstLetter U => 20 + 0x1F1E6
  // secondLetter S => 18 + 0x1F1E6
  // See: https://en.wikipedia.org/wiki/Regional_Indicator_Symbol
  if (countryCode == null) return '';
  final int firstLetter = countryCode.toUpperCase().codeUnitAt(0) - 0x41 + 0x1F1E6;
  final int secondLetter = countryCode.toUpperCase().codeUnitAt(1) - 0x41 + 0x1F1E6;
  return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
}

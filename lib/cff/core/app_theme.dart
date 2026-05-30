import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTheme {
  static const primaryFont = 'diodrum';
  static const secondaryFont = 'uthmanic';

  static final ColorScheme lightColorScheme = ColorScheme.fromSeed(
    seedColor: primaryLight,
    secondary: secondaryLight,
    brightness: Brightness.light,
  );

  static final ColorScheme darkColorScheme = ColorScheme.fromSeed(
    seedColor: primaryDark,
    secondary: secondaryDark,
    brightness: Brightness.dark,
  );

  static ThemeData lightThemeData = themeData(lightColorScheme);
  static ThemeData darkThemeData = themeData(darkColorScheme);

  static ThemeData themeData(ColorScheme colorScheme) {
    // final onBg = colorScheme.onBackground;
    return ThemeData(
      // useMaterial3: true,
      colorScheme: colorScheme,
      fontFamily: primaryFont,
      primaryColor: colorScheme.primary,
      scaffoldBackgroundColor: colorScheme.scaffold,
      actionIconTheme: ActionIconThemeData(
        backButtonIconBuilder: (context) => const Icon(Icons.chevron_left, size: 35),
      ),
      appBarTheme: AppBarTheme(
        titleSpacing: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        // toolbarHeight: 45,
        // color: colorScheme.appBar,
        foregroundColor: Colors.white,
        backgroundColor: colorScheme.appBar,
        titleTextStyle: _textTheme.headlineMedium!.copyWith(fontFamily: primaryFont, fontWeight: fontSemiBold),
        // elevation: 0,
      ),
      navigationBarTheme: NavigationBarThemeData(
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? TextStyle(color: colorScheme.navigationBarSelected)
              : TextStyle(color: colorScheme.navigationBarUnSelected),
        ),
        iconTheme: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? IconThemeData(color: colorScheme.navigationBarSelected, size: 30)
              : IconThemeData(color: colorScheme.navigationBarUnSelected),
        ),
      ),
      navigationRailTheme: NavigationRailThemeData(
        selectedIconTheme: IconThemeData(color: colorScheme.navigationRailSelected),
        selectedLabelTextStyle: TextStyle(color: colorScheme.navigationRailSelected),
        unselectedIconTheme: IconThemeData(color: colorScheme.navigationRailUnSelected),
        unselectedLabelTextStyle: TextStyle(color: colorScheme.navigationRailUnSelected),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryLight,
          foregroundColor: secondaryLight,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          textStyle: _textTheme.bodyMedium,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        alignLabelWithHint: true,
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        // labelStyle: tsBodyM(),
        // hintStyle: tsBodyM(),
        prefixIconColor: colorScheme.colorIcon,
        suffixIconColor: colorScheme.colorIcon,
        // TEXT COLOR
        border: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.inputBorder),
          borderRadius: BorderRadius.circular(6),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.inputDisabledBorder),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.inputFocusedBorder),
          borderRadius: BorderRadius.circular(6),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.inputEnabledBorder),
          borderRadius: BorderRadius.circular(6),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.inputErrorBorder),
          borderRadius: BorderRadius.circular(6),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.inputFocusedErrorBorder),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      textTheme: TextTheme(
        // titleLarge: _textTheme.titleLarge!.copyWith(color: colorScheme.textTitle),
        // titleMedium: _textTheme.titleMedium!.copyWith(color: colorScheme.textTitle),
        // titleSmall: _textTheme.titleSmall!.copyWith(color: colorScheme.textTitle),
        // bodyLarge: _textTheme.bodyLarge!.copyWith(color: colorScheme.textBody),
        // bodyMedium: _textTheme.bodyMedium!.copyWith(color: colorScheme.textBody),
        bodySmall: _textTheme.bodySmall!.copyWith(color: colorScheme.textBody),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          // titleTextStyle: _textTheme.headlineSmall!.copyWith(
          //   fontFamily: primaryFont,
          //   fontWeight: _semiBold,
          // ),
          textStyle: WidgetStatePropertyAll(_textTheme.titleLarge?.copyWith(fontFamily: primaryFont, fontSize: 18)),
        ),
      ),
      iconButtonTheme: const IconButtonThemeData(style: ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.zero))),
      progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.grey, linearMinHeight: 10),
      // textTheme: TextTheme(
      //   displayLarge: TextStyle(fontWeight: _bold, fontSize: 48, color: onBg),
      //   displayMedium: TextStyle(fontWeight: _bold, fontSize: 38, color: onBg),
      //   displaySmall:
      //       TextStyle(fontWeight: _semiBold, fontSize: 32, color: onBg),
      //   headlineMedium:
      //       TextStyle(fontWeight: _semiBold, fontSize: 24, color: onBg),
      //   headlineSmall:
      //       TextStyle(fontWeight: _medium, fontSize: 20, color: onBg),
      //   titleLarge: TextStyle(fontWeight: _regular, fontSize: 18, color: onBg),
      //   //
      //   bodyLarge: const TextStyle(
      //       fontWeight: _regular, fontSize: 16, color: Colors.white),
      //   bodyMedium: const TextStyle(fontWeight: _bold, fontSize: 16),
      //   //
      //   bodySmall: const TextStyle(fontWeight: _semiBold, fontSize: 16),
      //   labelLarge: const TextStyle(fontWeight: _bold, fontSize: 18),
      //   //
      // ),
    );
  }

  static const fontRegular = FontWeight.w400;
  static const fontMedium = FontWeight.w500;
  static const fontSemiBold = FontWeight.w600;
  static const fontBold = FontWeight.w700;

  static const fsDisplayL = 72.0;
  static const fsDisplayM = 48.0;
  static const fsDisplayS = 32.0;
  static const fsHeadlineL = 24.0;
  static const fsHeadlineM = 24.0;
  static const fsHeadlineS = 18.0;
  static const fsTitleL = 18.0;
  static const fsTitleM = 18.0;
  static const fsTitleS = 16.0;
  static const fsBodyL = 20.0;
  static const fsBodyM = 16.0;
  static const fsBodyS = 14.0;
  static const fsLabelL = 18.0;
  static const fsLabelM = 16.0;
  static const fsLabelS = 14.0;

  static const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(fontWeight: fontBold, fontSize: fsDisplayL),
    displayMedium: TextStyle(fontWeight: fontBold, fontSize: fsDisplayM),
    displaySmall: TextStyle(fontWeight: fontSemiBold, fontSize: fsDisplayS),
    //
    headlineLarge: TextStyle(fontWeight: fontRegular, fontSize: fsHeadlineL),
    headlineMedium: TextStyle(fontWeight: fontSemiBold, fontSize: fsHeadlineM),
    headlineSmall: TextStyle(fontWeight: fontMedium, fontSize: fsHeadlineS),
    //
    titleLarge: TextStyle(fontWeight: fontRegular, fontSize: fsTitleL),
    titleMedium: TextStyle(fontWeight: fontMedium, fontSize: fsTitleM),
    titleSmall: TextStyle(fontWeight: fontMedium, fontSize: fsTitleS),
    //
    bodyLarge: TextStyle(fontWeight: fontRegular, fontSize: fsBodyL),
    bodyMedium: TextStyle(fontWeight: fontRegular, fontSize: fsBodyM),
    bodySmall: TextStyle(fontWeight: fontSemiBold, fontSize: fsBodyS),
    //
    labelLarge: TextStyle(fontWeight: fontSemiBold, fontSize: fsLabelL),
    labelMedium: TextStyle(fontWeight: fontSemiBold, fontSize: fsLabelM),
    labelSmall: TextStyle(fontWeight: fontSemiBold, fontSize: fsLabelS),
  );
}

import 'package:flutter/material.dart';

const Color primaryLight = Color(0xFF05629B);
const Color primaryDark = Color(0xFF05629B);

const Color secondaryLight = oWhite;
const Color secondaryDark = oWhite;

const Color linkColorLight = Color(0xFF3AA13D);
const Color linkColorDark = Color(0xFF3AA13D);

// Color References
// ================
const Color oWhite = Color(0xFFFFFFFF);
const Color oWhite30 = Color(0xBAFFFFFF);
const Color oWhite50 = Color(0x8AFFFFFF);
const Color oWhite70 = Color(0x70FFFFFF);
const Color oBlack = Color(0xFF000000);
const Color oBlack30 = Color(0xBC000000);
const Color oBlack50 = Color(0x85000000);
const Color oRed = Color(0xFFFF0000);
const Color oRed50 = Color(0xFFFA4444);
const Color oRed70 = Color.fromARGB(182, 248, 104, 104);
const Color oGrey = Color(0xFFBCBABE);
const Color oGrey70 = Color(0xFF747374);
const Color oGreen = Colors.green;

const Color oBlue = Colors.blue;
const Color oBlue70 = Color(0xFFDFE9FF);

const Color oOvercast = Color(0xFFF1F1F2);

const Color oBasilGreen = Color(0xFF3F6C45);
// Qubah
const Color oDarkGreen = Color(0xFF30684d);
// Tembok & Menara
const Color oLightBrown = Color(0xFFe8d2ad);
const Color oDarkBrown = Color(0xFFbd9066);

// Font ka'bah
const Color oGold = Color(0xFFF3CD05); // font
const Color oGold50 = Color(0xFFF49F05); // font alt1
const Color oGold100 = Color(0xFFFFBB00); // font alt2
const Color oGold200 = Color(0xFFE3B212); // font alt3

// ka'bah
const Color oDarkBlue = Color(0xFF162844); // font

extension ColorContext on BuildContext {
  Color get colorBg => Theme.of(this).colorScheme.brightness == Brightness.light
      ? const Color.fromARGB(255, 254, 255, 245)
      : const Color(0xFF272727);

  Color get colorText => Theme.of(this).colorScheme.brightness == Brightness.light ? oBlack50 : oWhite;
}

extension CustomColorScheme on ColorScheme {
  Color get scaffold =>
      brightness == Brightness.light ? const Color.fromARGB(255, 255, 255, 255) : const Color(0xFF0C0C0C);

  // Color get scaffoldBg => brightness == Brightness.light
  //     ? const Color.fromARGB(255, 255, 255, 255)
  //     : const Color(0xFF1B1B1B);

  Color get infoText => brightness == Brightness.light ? const Color(0xff9EA05B) : const Color(0xFFF3F3F3);

  Color get appBar => brightness == Brightness.light ? primaryLight : primaryDark;

  Color get inputBorder => brightness == Brightness.light ? oGrey : oWhite70;

  Color get inputDisabledBorder => brightness == Brightness.light ? oGrey70 : oWhite70;

  Color get inputFocusedBorder => brightness == Brightness.light ? oGold50 : oGold50;

  Color get inputEnabledBorder => brightness == Brightness.light ? oBlack50 : oWhite70;

  Color get inputErrorBorder => brightness == Brightness.light ? oBlack50 : oWhite70;

  Color get inputFocusedErrorBorder => brightness == Brightness.light ? oBlack50 : oWhite70;

  Color get colorIcon => brightness == Brightness.light ? oBlack50 : oWhite70;

  Color get textTitle => brightness == Brightness.light ? oBlack : oWhite;
  Color get textBody => brightness == Brightness.light ? oBlack : oWhite;

  Color get navigationBarSelected => brightness == Brightness.light ? primaryLight : oWhite30;
  Color get navigationBarUnSelected => brightness == Brightness.light ? oBlack50 : oWhite70;
  Color get navigationRailSelected => brightness == Brightness.light ? primaryLight : oWhite30;
  Color get navigationRailUnSelected => brightness == Brightness.light ? oBlack50 : oWhite70;

  Color get pageNumber => brightness == Brightness.light ? const Color(0x7B000000) : const Color(0x92FFFFFF);

  Color get div =>
      brightness == Brightness.light ? const Color.fromARGB(47, 0, 0, 0) : const Color.fromARGB(55, 255, 255, 255);

  Color get juzCardText => brightness == Brightness.light ? const Color(0xFF353608) : const Color(0xFFECECEC);

  Color get surahNumber => brightness == Brightness.light ? const Color(0xFF94BEFD) : const Color(0xff2877EE);
}

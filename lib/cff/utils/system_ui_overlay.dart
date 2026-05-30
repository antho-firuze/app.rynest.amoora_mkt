import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemUIOverlay {
  static get setSolidUIOverlay {
    // This is for showing after transparent
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.black54,
      ),
    );
  }

  static get setTransUIOverlay {
    // This is for transparent status bar
    // ==================================
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
  }

  static get showUIOverlay {
    // This is for showing after hiding it
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );

    // Method #2
    // SystemChrome.setEnabledSystemUIMode(
    //   SystemUiMode.manual,
    //   overlays: [
    //     SystemUiOverlay.top,
    //     SystemUiOverlay.bottom,
    //   ],
    // );
  }

  static get hideUIOverlay {
    // This is for hiding status bar
    // =============================
    // Method #1
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // Method #2
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.bottom,
      ],
    );
  }

  static get defaultColorOverlay =>
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  static SystemUiOverlayStyle get transparentOverlay => const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      );

  static SystemUiOverlayStyle get lightColorOverlay => const SystemUiOverlayStyle(statusBarColor: Colors.transparent);

  static SystemUiOverlayStyle get darkColorOverlay => const SystemUiOverlayStyle(statusBarColor: Colors.black54);

  static get mapsColorOverlay {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  void lockScreenPortrait() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void lockScreenLandscape() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  void unlockScreenOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}

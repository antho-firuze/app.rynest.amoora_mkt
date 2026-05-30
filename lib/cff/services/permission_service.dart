import 'dart:io';

import 'package:amoora_mkt/cff/utils/log_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

final permissionServiceProvider = Provider(PermissionService.new);

class PermissionService {
  final Ref ref;
  PermissionService(this.ref);

  final _kLogName = 'PERMISSION-SVC';

  /// Used for open App Setting, and granted permission manually
  Future<bool> openAppSettingz() async => await openAppSettings();

  /// Used for open GPS/Location Setting
  Future<bool> openLocationSettings() async => await Geolocator.openLocationSettings();

  Future<bool> checkGpsPermission() async {
    bool result = await Permission.location.isGranted;
    logX('checkGpsPermission | $result', name: _kLogName);
    return result;
  }

  Future<bool> checkGpsEnabled() async {
    bool result = await Geolocator.isLocationServiceEnabled();
    logX('checkGpsEnabled | $result', name: _kLogName);
    return result;
  }

  Future<bool?> requestGpsPermission() async {
    if (await Permission.location.isPermanentlyDenied) {
      await openAppSettings();
      return null;
    }

    final result = await Permission.location.request();
    logX('requestGpsPermission | ${result == PermissionStatus.granted}', name: _kLogName);
    return result == PermissionStatus.granted;
  }

  // Future<bool> checkIsBatteryOptimizationDisabled() async {
  //   if (Platform.isAndroid) {
  //     return await DisableBatteryOptimization.isBatteryOptimizationDisabled ?? false;
  //   } else {
  //     return true;
  //   }
  // }

  // Future<bool> checkIsAutoStartEnabled() async {
  //   if (Platform.isAndroid) {
  //     return await DisableBatteryOptimization.isAutoStartEnabled ?? false;
  //   } else {
  //     return true;
  //   }
  // }

  // Future<void> showBatterySetting() async {
  //   if (Platform.isAndroid) {
  //     await DisableBatteryOptimization.showDisableBatteryOptimizationSettings();
  //   }
  // }

  // Future<void> showAutoStart() async {
  //   if (Platform.isAndroid) {
  //     await DisableBatteryOptimization.showEnableAutoStartSettings(
  //         'Enable Auto Start', 'Follow the steps and enable the auto start of this app');
  //   }
  // }

  Future<bool> checkMicrophonePermission() async {
    var result = await Permission.microphone.isGranted;
    logX('checkMicrophonePermission | $result', name: _kLogName);
    return result;
  }

  Future<bool> requestMicrophonePermission() async {
    if (await Permission.microphone.isPermanentlyDenied) {
      await openAppSettings();
      return false;
    }

    final result = await Permission.microphone.request();
    logX('requestMicrophonePermission | ${result == PermissionStatus.granted}', name: _kLogName);
    return result == PermissionStatus.granted;
  }

  Future<bool> checkNotificationPermission() async {
    var result = await Permission.notification.isGranted;
    logX('checkNotificationPermission | $result', name: _kLogName);
    return result;
  }

  Future<bool> requestNotificationPermission() async {
    if (await Permission.notification.isPermanentlyDenied) {
      await openAppSettings();
      return false;
    }
    final result = await Permission.notification.request();
    logX('requestNotificationPermission | ${result == PermissionStatus.granted}', name: _kLogName);
    return result == PermissionStatus.granted;
  }

  Future<bool> requestCameraAndMediaPermission() async {
    if (Platform.isAndroid) {
      if (await Permission.camera.isPermanentlyDenied && await Permission.manageExternalStorage.isPermanentlyDenied) {
        await openAppSettings();
        return false;
      }

      Map<Permission, PermissionStatus> statuses = await [
        Permission.camera,
        Permission.manageExternalStorage,
      ].request();

      logX(
        'requestCameraAndMediaPermission | ${statuses[Permission.camera]!.isGranted} | ${statuses[Permission.manageExternalStorage]!.isGranted}',
        name: _kLogName,
      );

      return statuses[Permission.camera]!.isGranted && statuses[Permission.manageExternalStorage]!.isGranted;
    } else {
      if (await Permission.camera.isPermanentlyDenied &&
          await Permission.photos.isPermanentlyDenied &&
          await Permission.storage.isPermanentlyDenied) {
        await openAppSettings();
        return false;
      }

      Map<Permission, PermissionStatus> statuses = await [
        Permission.camera,
        Permission.photos,
        Permission.storage,
      ].request();

      logX(
        'requestCameraAndMediaPermission | ${statuses[Permission.camera]!.isGranted} | ${statuses[Permission.photos]!.isGranted} | ${statuses[Permission.storage]!.isGranted}',
        name: _kLogName,
      );

      return statuses[Permission.camera]!.isGranted &&
          statuses[Permission.photos]!.isGranted &&
          statuses[Permission.storage]!.isGranted;
    }
  }

  Future<bool> checkCameraAndMediaPermission() async => Platform.isAndroid
      ? await Permission.camera.isGranted && await Permission.manageExternalStorage.isGranted
      : await Permission.camera.isGranted && await Permission.photos.isGranted && await Permission.storage.isGranted;
}

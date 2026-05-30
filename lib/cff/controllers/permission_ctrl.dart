import 'package:amoora_mkt/cff/services/permission_service.dart';
import 'package:amoora_mkt/cff/utils/log_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final permissionCtrlProvider = Provider(PermissionCtrl.new);

class PermissionCtrl {
  Ref ref;
  PermissionCtrl(this.ref);

  final _kLogName = 'PERMISSION-CTRL';

  bool isGpsEnable = false;
  bool allowGps = false;
  bool allowCameraAndMedia = false;
  bool allowMicrophone = false;
  bool allowNotification = false;
  bool isBatteryOptzDisabled = false;
  bool isAutoStartEnabled = false;

  void initialize() async {
    logI('Initialized', name: _kLogName);

    allowNotification = await ref.read(permissionServiceProvider).checkNotificationPermission();
    ref.notifyListeners();
  }

  Future<void> checkGpsEnable() async {
    isGpsEnable = await ref.read(permissionServiceProvider).checkGpsEnabled();
    ref.notifyListeners();
  }

  Future<void> requestGpsPermission() async {
    allowGps = await ref.read(permissionServiceProvider).requestGpsPermission() ?? false;
    ref.notifyListeners();
  }

  Future<void> requestCameraAndMediaPermission() async {
    allowCameraAndMedia = await ref.read(permissionServiceProvider).requestCameraAndMediaPermission();
    ref.notifyListeners();
  }

  Future<void> requestMicrophonePermission() async {
    allowMicrophone = await ref.read(permissionServiceProvider).requestMicrophonePermission();
    ref.notifyListeners();
  }

  Future<void> requestNotificationPermission() async {
    allowNotification = await ref.read(permissionServiceProvider).requestNotificationPermission();
    ref.notifyListeners();
  }
}

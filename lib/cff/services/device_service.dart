import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:uuid/uuid.dart';

final deviceIdProvider = StateProvider<String>((ref) => '');
final deviceNameProvider = StateProvider<String>((ref) => '');

class DeviceService {
  final Ref ref;
  DeviceService(this.ref);

  Future<Map<String, dynamic>> getDeviceInfo() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    Map<String, dynamic> result = {};

    try {
      if (kIsWeb) {
        var data = await deviceInfoPlugin.webBrowserInfo;
        // log(jsonEncode(_readWebBrowserInfo(data)));
        result = {
          'id': const Uuid().v4(),
          'name': data.userAgent,
        };
        ref.read(deviceIdProvider.notifier).state = result['id'];
        ref.read(deviceNameProvider.notifier).state = result['name'];
        return result;
      } else {
        switch (defaultTargetPlatform) {
          case TargetPlatform.android:
            var data = await deviceInfoPlugin.androidInfo;
            // log(jsonEncode(_readAndroidBuildData(data)));
            result = {
              'id': '${data.device}:${data.id}',
              'name': '${data.manufacturer.toUpperCase()} ${data.model}',
            };
            ref.read(deviceIdProvider.notifier).state = result['id'];
            ref.read(deviceNameProvider.notifier).state = result['name'];
            return result;
          case TargetPlatform.iOS:
            var data = await deviceInfoPlugin.iosInfo;
            // log(jsonEncode(_readIosDeviceInfo(data)));
            result = {
              'id': '${data.name}:${data.identifierForVendor}',
              'name': data.model,
            };
            ref.read(deviceIdProvider.notifier).state = result['id'];
            ref.read(deviceNameProvider.notifier).state = result['name'];
            return result;
          case TargetPlatform.fuchsia:
          case TargetPlatform.linux:
          case TargetPlatform.macOS:
          case TargetPlatform.windows:
            // log(jsonEncode({'id': const Uuid().v4(), 'name': 'Unknown'}));
            result = {
              'id': const Uuid().v4(),
              'name': 'Unknown',
            };
            ref.read(deviceIdProvider.notifier).state = result['id'];
            ref.read(deviceNameProvider.notifier).state = result['name'];
            return result;
        }
      }
    } catch (e) {
      // log(jsonEncode({'Error': 'Failed to get platform version.'}));
      return {'Error': 'Failed to get platform version.'};
    }
  }

  // Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
  //   return <String, dynamic>{
  //     'version.securityPatch': build.version.securityPatch,
  //     'version.sdkInt': build.version.sdkInt,
  //     'version.release': build.version.release,
  //     'version.previewSdkInt': build.version.previewSdkInt,
  //     'version.incremental': build.version.incremental,
  //     'version.codename': build.version.codename,
  //     'version.baseOS': build.version.baseOS,
  //     'board': build.board,
  //     'bootloader': build.bootloader,
  //     'brand': build.brand,
  //     'device': build.device,
  //     'display': build.display,
  //     'fingerprint': build.fingerprint,
  //     'hardware': build.hardware,
  //     'host': build.host,
  //     'id': build.id,
  //     'manufacturer': build.manufacturer,
  //     'model': build.model,
  //     'product': build.product,
  //     'supported32BitAbis': build.supported32BitAbis,
  //     'supported64BitAbis': build.supported64BitAbis,
  //     'supportedAbis': build.supportedAbis,
  //     'tags': build.tags,
  //     'type': build.type,
  //     'isPhysicalDevice': build.isPhysicalDevice,
  //     'systemFeatures': build.systemFeatures,
  //     'displaySizeInches':
  //         ((build.displayMetrics.sizeInches * 10).roundToDouble() / 10),
  //     'displayWidthPixels': build.displayMetrics.widthPx,
  //     'displayWidthInches': build.displayMetrics.widthInches,
  //     'displayHeightPixels': build.displayMetrics.heightPx,
  //     'displayHeightInches': build.displayMetrics.heightInches,
  //     'displayXDpi': build.displayMetrics.xDpi,
  //     'displayYDpi': build.displayMetrics.yDpi,
  //     'serialNumber': build.serialNumber,
  //   };
  // }

  // Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
  //   return <String, dynamic>{
  //     'name': data.name,
  //     'systemName': data.systemName,
  //     'systemVersion': data.systemVersion,
  //     'model': data.model,
  //     'localizedModel': data.localizedModel,
  //     'identifierForVendor': data.identifierForVendor,
  //     'isPhysicalDevice': data.isPhysicalDevice,
  //     'utsname.sysname:': data.utsname.sysname,
  //     'utsname.nodename:': data.utsname.nodename,
  //     'utsname.release:': data.utsname.release,
  //     'utsname.version:': data.utsname.version,
  //     'utsname.machine:': data.utsname.machine,
  //   };
  // }

  // Map<String, dynamic> _readWebBrowserInfo(WebBrowserInfo data) {
  //   return <String, dynamic>{
  //     'browserName': describeEnum(data.browserName),
  //     'appCodeName': data.appCodeName,
  //     'appName': data.appName,
  //     'appVersion': data.appVersion,
  //     'deviceMemory': data.deviceMemory,
  //     'language': data.language,
  //     'languages': data.languages,
  //     'platform': data.platform,
  //     'product': data.product,
  //     'productSub': data.productSub,
  //     'userAgent': data.userAgent,
  //     'vendor': data.vendor,
  //     'vendorSub': data.vendorSub,
  //     'hardwareConcurrency': data.hardwareConcurrency,
  //     'maxTouchPoints': data.maxTouchPoints,
  //   };
  // }

  Future<String> getPlatformVersion() async {
    if (Platform.isAndroid) {
      var androidInfo = await DeviceInfoPlugin().androidInfo;
      var sdkInt = androidInfo.version.sdkInt;
      return 'Android-$sdkInt';
    }

    if (Platform.isIOS) {
      var iosInfo = await DeviceInfoPlugin().iosInfo;
      var systemName = iosInfo.systemName;
      var version = iosInfo.systemVersion;
      return '$systemName-$version';
    }

    return 'unknow';
  }
}

final deviceServiceProvider = Provider(DeviceService.new);

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

final fetchVersionProvider = FutureProvider<String>((ref) async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.version;
});

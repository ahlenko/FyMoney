import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_udid/flutter_udid.dart';

abstract class DeviceUtil {
  static Future<bool> isRunningOniPad() async {
    if (Platform.isAndroid) {
      return false;
    }
    final deviceInfo = DeviceInfoPlugin();
    final iosInfo = await deviceInfo.iosInfo;

    return iosInfo.model.toLowerCase().contains('ipad');
  }

  static Future<String> getAppVersion() async {
    final pi = await PackageInfo.fromPlatform();
    return '${pi.version}(${pi.buildNumber})';
  }

  static Future<String> getDeviceId() async {
    return await FlutterUdid.consistentUdid;
  }

  static Future<bool> isPhysicalDevice() async {
    if (Platform.isIOS) {
      final deviceInfo = DeviceInfoPlugin();
      final iosInfo = await deviceInfo.iosInfo;
      return iosInfo.isPhysicalDevice;
    } else {
      return true;
    }
  }
}

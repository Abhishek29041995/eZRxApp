import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

class DeviceInfo {
  Future<bool> checkIfDeviceIsAndroidWithSDK33() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      final plugin = DeviceInfoPlugin();
      final androidDeviceInfo = await plugin.androidInfo;

      return androidDeviceInfo.version.sdkInt >= 33;
    }

    return false;
  }
}

import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoService {
  late PackageInfo _packageInfo;

  Future<void> init() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  Future<String> getString() async {
    final packageNameArray = _packageInfo.packageName.split('.');

    return '${packageNameArray.length > 3 ? packageNameArray[3] : ""}${_packageInfo.version}(${_packageInfo.buildNumber})';
  }

  Future<String> getPackageName() async {
    return _packageInfo.packageName;
  }

  Future<String> getVersion() async {
    return _packageInfo.version;
  }

  Future<String> getBuildNumber() async {
    return _packageInfo.buildNumber;
  }
}

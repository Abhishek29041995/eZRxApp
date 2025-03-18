import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingStorage {
  static const _boxName = 'ezrx_setting_box';
  static const _biometricKey = 'biometricEnable';

  late Box _settingBox;

  SettingStorage();

  int get settingBoxSize => _settingBox.length;

  Future<void> init() async {
    try {
      await Hive.initFlutter();
      _settingBox = await Hive.openBox(
        _boxName,
      );
    } catch (e) {
      await Hive.deleteBoxFromDisk(_boxName);
      await init();
    }
  }

  bool? isBiometricEnabled() {
    try {
      return _settingBox.get(_biometricKey) as bool?;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future<void> putBiometricStatus({required bool isBiometricEnabled}) async {
    try {
      await _settingBox.put(_biometricKey, isBiometricEnabled);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future<void> deleteBiometricStatus() async {
    try {
      await _settingBox.delete(_biometricKey);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future<void> clear() async {
    try {
      await _settingBox.flush();
      await _settingBox.clear();
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}

import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:hive_flutter/hive_flutter.dart';

enum StorageType {
  order,
  payment,
  returns,
}

class BannerStorage {
  static const _boxName = 'banner_storage_box';
  static const _idOrder = 'last_closed_time_order';
  static const _idPayment = 'last_closed_time_payment';
  static const _idReturn = 'last_closed_time_return';

  late Box _box;

  BannerStorage();

  Future<void> init() async {
    try {
      await Hive.initFlutter();
      _box = await Hive.openBox(
        _boxName,
      );
    } catch (e) {
      await Hive.deleteBoxFromDisk(_boxName);
      await init();
    }
  }

  Future<void> setClosedTime({
    required StorageType storageType,
    required String dateTime,
  }) async {
    try {
      switch (storageType) {
        case StorageType.order:
          await _box.put(_idOrder, dateTime);
          break;
        case StorageType.payment:
          await _box.put(_idPayment, dateTime);
          break;
        case StorageType.returns:
          await _box.put(_idReturn, dateTime);
          break;
      }
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  String getClosedTimeOrder() {
    try {
      return _box.get(
        _idOrder,
        defaultValue: '',
      );
    } catch (e) {
      throw (CacheException(message: e.toString()));
    }
  }

  String getClosedTimePayment() {
    try {
      return _box.get(
        _idPayment,
        defaultValue: '',
      );
    } catch (e) {
      throw (CacheException(message: e.toString()));
    }
  }

  String getClosedTimeReturns() {
    try {
      return _box.get(
        _idReturn,
        defaultValue: '',
      );
    } catch (e) {
      throw (CacheException(message: e.toString()));
    }
  }

  void clearClosedTime() {
    try {
      _box.deleteAll(
        [_idOrder, _idPayment, _idReturn],
      );
    } catch (e) {
      throw (CacheException(message: e.toString()));
    }
  }
}

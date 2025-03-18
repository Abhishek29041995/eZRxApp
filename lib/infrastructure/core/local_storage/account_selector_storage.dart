import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/account_selector_storage_dto.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AccountSelectorStorage {
  static const _boxName = 'account_selector_box';
  static const _credKey = 'account_selector_cred';

  late Box box;
  late HiveInterface hive;

  AccountSelectorStorage({required this.hive});

  Future<void> init() async {
    await hive.initFlutter();
    Hive.registerAdapter(AccountSelectorStorageDtoAdapter());
    box = await hive.openBox(
      _boxName,
    );
  }

  Future<void> set({
    required AccountSelectorStorageDto accountSelectorStorageDto,
  }) async {
    try {
      await box.put(_credKey, accountSelectorStorageDto);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future<AccountSelectorStorageDto> get() async {
    try {
      return await box.get(
        _credKey,
        defaultValue: AccountSelectorStorageDto.empty(),
      );
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future<void> delete() async {
    try {
      await box.delete(
        _credKey,
      );
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}

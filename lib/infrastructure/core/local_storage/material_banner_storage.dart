import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/banner/dtos/ez_reach_banner_dto.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MaterialBannerStorage {
  static const _boxName = 'material_banner_box';

  late Box box;
  late HiveInterface hive;

  MaterialBannerStorage({required this.hive});

  Future<void> init() async {
    await hive.initFlutter();
    Hive.registerAdapter(EZReachBannerDtoImplAdapter());
    box = await hive.openBox(
      _boxName,
    );
  }

  // Save normal material as materialNumber
  // Save material inside a bundle as bundleNumber_materialNumber to differentiate it from normal material
  Future<void> set({
    required List<String> materialNumbers,
    required EZReachBanner banner,
  }) async {
    if (materialNumbers.isEmpty) return;
    try {
      await box.putAll({
        for (final item in materialNumbers)
          item: EZReachBannerDto.fromDomain(
            banner,
          ),
      });
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future<EZReachBannerDto> get({
    required String materialNumber,
  }) async {
    try {
      return await box.get(
        materialNumber,
        defaultValue: EZReachBannerDto.fromDomain(
          EZReachBanner.empty(),
        ),
      );
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future<void> delete({
    required List<String> materialNumbers,
  }) async {
    if (materialNumbers.isEmpty) return;
    try {
      await box.deleteAll(
        materialNumbers,
      );
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  Future<void> clear() async {
    try {
      await box.clear();
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}

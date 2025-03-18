import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/entities/mp_remote_config.dart';
import 'package:ezrxmobile/domain/core/entities/promotion_remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/crashlytics.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/mp_remote_config_dto.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/promotion_remote_config_dto.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config_constants.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

class RemoteConfigService {
  final _remoteConfig = FirebaseRemoteConfig.instance;

  final Config config;
  final FirebaseCrashlyticsService firebaseCrashlyticsService;

  RemoteConfigService({
    required this.config,
    required this.firebaseCrashlyticsService,
  });

  Future<void> init() async {
    try {
      await _setConfig();
      await _setInAppDefaultValues();
      await _remoteConfig.fetchAndActivate();
    } catch (exception, stacktrace) {
      await firebaseCrashlyticsService.crashlytics.recordError(
        exception,
        stacktrace,
      );
    } finally {
      await _updateConfigs(RemoteConfigUpdate({}));
    }
  }

  List<String> get enableMarketPlaceMarkets {
    final configAsJson = jsonDecode(
      _remoteConfig
          .getValue(RemoteConfigConstants.enableMarketPlace)
          .asString(),
    );

    //JSON sample: {"marketplaceConfig":{"whitelist":["HK"]}}
    return MPRemoteConfigDto.fromJson(configAsJson).toDomain.whiteList;
  }

  List<String> get enablePromotionBlacklist {
    final configAsJson = jsonDecode(
      _remoteConfig.getValue(RemoteConfigConstants.enablePromotion).asString(),
    );

    //JSON sample: {"blacklist":["ID"]}
    return PromotionRemoteConfigDto.fromJson(configAsJson).toDomain.blackList;
  }

  bool get passUserId =>
      _remoteConfig.getBool(RemoteConfigConstants.passUserId);

  bool get enableOrderType =>
      _remoteConfig.getBool(RemoteConfigConstants.enableOrderTypeConfig);

  bool get enableProductTypeFilter =>
      _remoteConfig.getBool(RemoteConfigConstants.enableProductTypesFilter);

  bool get enableReferenceLength =>
      _remoteConfig.getBool(RemoteConfigConstants.enableReferenceLength);

  /// Setting in-app default parameter values to make app behave as intended
  /// before it connects or if no values are set in the Remote Config backend
  Future<void> _setInAppDefaultValues() async {
    await _remoteConfig.setDefaults(
      {
        RemoteConfigConstants.enableMarketPlace: jsonEncode(
          MPRemoteConfigDto.fromDomain(MPRemoteConfig.empty()).toJson(),
        ),
        RemoteConfigConstants.enablePromotion: jsonEncode(
          PromotionRemoteConfigDto.fromDomain(PromotionRemoteConfig.empty())
              .toJson(),
        ),
        RemoteConfigConstants.passUserId: false,
        RemoteConfigConstants.enableProductTypesFilter: false,
        RemoteConfigConstants.enableOrderTypeConfig: false,
        RemoteConfigConstants.enableReferenceLength: false,
      },
    );
  }

  /// Setting minimum fetch interval to allow for frequent refreshes
  Future<void> _setConfig() async {
    if (!kIsWeb) {
      _remoteConfig.onConfigUpdated.listen(_updateConfigs, onError: (_) {});
    }
    if (kDebugMode) {
      await _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(
            minutes: 1,
          ),
          minimumFetchInterval: const Duration(
            minutes: 10,
          ),
        ),
      );
    }
  }

  Future<void> _updateConfigs(RemoteConfigUpdate remoteConfigUpdate) =>
      _remoteConfig.activate();
}

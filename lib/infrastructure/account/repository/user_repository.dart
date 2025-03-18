import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/setting_tc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/repository/i_user_repository.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/entities/update_language_response.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/language_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/language_remote.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_remote.dart';
import 'package:ezrxmobile/infrastructure/core/clevertap/clevertap_service.dart';
import 'package:ezrxmobile/infrastructure/core/datadog/datadog_service.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/analytics.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/crashlytics.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:flutter/foundation.dart';

class UserRepository implements IUserRepository {
  final Config config;
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final FirebaseAnalyticsService firebaseAnalyticsService;
  final FirebaseCrashlyticsService firebaseCrashlyticsService;
  final TokenStorage tokenStorage;
  final MixpanelService mixpanelService;
  final ClevertapService clevertapService;
  final DatadogService datadogService;
  final LanguageLocalDataSource languageLocalDataSource;
  final LanguageRemoteDataSource languageRemoteDataSource;
  final DeviceStorage deviceStorage;

  UserRepository({
    required this.config,
    required this.remoteDataSource,
    required this.localDataSource,
    required this.firebaseAnalyticsService,
    required this.firebaseCrashlyticsService,
    required this.tokenStorage,
    required this.mixpanelService,
    required this.clevertapService,
    required this.datadogService,
    required this.languageLocalDataSource,
    required this.languageRemoteDataSource,
    required this.deviceStorage,
  });

  @override
  Future<Either<ApiFailure, User>> getUser() async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final user = await localDataSource.getUser();

        return Right(user);
      } on MockException catch (e) {
        return Left(ApiFailure.other(e.message));
      }
    }
    try {
      final token = await tokenStorage.get();
      final user = await remoteDataSource.getUser(
        userId: token.toDomain().userId,
        market: deviceStorage.currentMarket(),
      );
      await firebaseAnalyticsService.analytics.setUserId(id: user.id);
      // await firebaseAnalyticsService.analytics.setUserProperty(
      //   name: user.username.getOrCrash(),
      //   value: user.email.getOrCrash(),
      // );

      mixpanelService.setUser(
        firstName: user.fullName.firstName,
        lastName: user.fullName.lastName,
        username: user.username.getOrDefaultValue(''),
        email: user.email.getOrDefaultValue(''),
        role: user.role.name,
      );

      datadogService.setUserInfo(user);

      if (!kIsWeb) {
        await firebaseCrashlyticsService.crashlytics.setUserIdentifier(user.id);
        await clevertapService.setUser(
          name: user.fullName.displayFullName,
          username: user.username.getOrDefaultValue(''),
          email: user.email.getOrDefaultValue(''),
          role: user.role.name,
          market: deviceStorage.currentMarket().toUpperCase(),
          phone: user.phoneWithCountryCode,
        );
      }

      return Right(user);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, SettingTc>> updateUserTc() async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final settingTc = await localDataSource.updateUserTC();

        return Right(settingTc);
      } on MockException catch (e) {
        return Left(ApiFailure.other(e.message));
      }
    }
    try {
      final settingTc = await remoteDataSource.updateUserTC();

      return Right(settingTc);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, UpdateLanguageResponse>> updateLanguage({
    required Language language,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final updateLanguageResponse =
            await languageLocalDataSource.getCustomerLicense();

        if (updateLanguageResponse.success) {
          return Right(updateLanguageResponse);
        }

        return const Left(ApiFailure.languageChangeFail());
      } catch (e) {
        return Left(FailureHandler.handleFailure(e));
      }
    }
    try {
      final updateLanguageResponse =
          await languageRemoteDataSource.changeLanguage(language.languageCode);

      if (updateLanguageResponse.success) {
        return Right(updateLanguageResponse);
      }

      return const Left(ApiFailure.languageChangeFail());
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, Unit>> updateUserMarketPlaceTc(
    MarketPlaceTnCAcceptance value,
  ) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        await localDataSource.updateUserTC();

        return const Right(unit);
      } on MockException catch (e) {
        return Left(ApiFailure.other(e.message));
      }
    }
    try {
      final result = await remoteDataSource.updateUserMarketPlaceTC(
        value.apiValue,
      );

      if (!result.acceptTC) {
        return const Left(ApiFailure.marketplaceTnCAcceptanceError());
      }

      return const Right(unit);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, bool>> updatePrivacyControl({
    required bool automatedPersonalisation,
    required bool viaEmails,
    required bool viaPushNotification,
    required bool viaSMS,
  }) async {
    if (config.appFlavor == Flavor.mock) {
      try {
        final result = await localDataSource.updatePrivacyControl();

        return Right(result);
      } on MockException catch (e) {
        return Left(ApiFailure.other(e.message));
      }
    }
    try {
      final result = await remoteDataSource.updatePrivacyControl(
        automatedPersonalisation: automatedPersonalisation,
        viaEmails: viaEmails,
        viaPushNotification: viaPushNotification,
        viaSMS: viaSMS,
      );

      await clevertapService.updateUserProfile(
        updatedProfile: {
          'MSG-email': viaEmails,
          'MSG-push': viaPushNotification,
          'MSG-sms': viaSMS,
        },
      );

      return Right(result);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }

  @override
  Future<Either<ApiFailure, DocumentType>> updateSelectedOrderType(
    DocumentType value,
  ) async {
    try {
      if (config.appFlavor == Flavor.mock) {
        final result = await localDataSource.updateSelectedOrderType();

        return Right(result);
      }

      final result = await remoteDataSource.updateSelectedOrderType(
        value: value.getOrDefaultValue(''),
      );

      return Right(result);
    } catch (e) {
      return Left(FailureHandler.handleFailure(e));
    }
  }
}

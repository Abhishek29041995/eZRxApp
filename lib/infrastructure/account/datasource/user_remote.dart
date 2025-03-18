import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/setting_tc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/error/user_exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/user_dto.dart';
import 'package:ezrxmobile/infrastructure/aup_tc/dtos/setting_tc_dto.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

class UserRemoteDataSource {
  HttpService httpService;
  UserQueryMutation userQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  RemoteConfigService remoteConfigService;

  UserRemoteDataSource({
    required this.httpService,
    required this.userQueryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
    required this.remoteConfigService,
  });

  Future<User> getUser({
    required String userId,
    required String market,
  }) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': userQueryMutation.getUserQuery(
            remoteConfigService.enableMarketPlaceMarkets.contains(market),
            remoteConfigService.passUserId,
          ),
          'variables': {
            if (remoteConfigService.passUserId) 'id': userId,
          },
        }),
      );
      dataSourceExceptionHandler.handleExceptionChecker(
        res: res,
        onCustomExceptionHandler: _userExceptionChecker,
      );

      return UserDto.fromJson(res.data['data']['user']).toDomain();
    });
  }

  void _userExceptionChecker(Response<dynamic> res) {
    if (res.statusCode == 404) {
      throw const UserException.userNotFound();
    }
  }

  Future<SettingTc> updateUserTC() async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': userQueryMutation.updatePrivacyPolicy(),
          'variables': {
            'isAcceptTC': true,
          },
        }),
      );
      dataSourceExceptionHandler.handleExceptionChecker(
        res: res,
        onCustomExceptionHandler: _userExceptionChecker,
      );

      return SettingTcDto.fromJson(res.data['data']).toDomain();
    });
  }

  Future<SettingTc> updateUserMarketPlaceTC(int value) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': userQueryMutation.updateMarketPlaceTnCAcceptance(),
          'variables': {'isAcceptMPTC': value},
        }),
      );
      dataSourceExceptionHandler.handleExceptionChecker(
        res: res,
        onCustomExceptionHandler: _userExceptionChecker,
      );

      return SettingTcDto.fromJson(res.data['data']).toDomain();
    });
  }

  Future<bool> updatePrivacyControl({
    required bool automatedPersonalisation,
    required bool viaEmails,
    required bool viaPushNotification,
    required bool viaSMS,
  }) async {
    return await dataSourceExceptionHandler.handle(
      () async {
        final data = {
          'input': {
            'privacyControls': {
              'automatedPersonalisation': automatedPersonalisation,
              'viaEmails': viaEmails,
              'viaPushNotification': viaPushNotification,
              'viaSMS': viaSMS,
            },
          },
        };

        final res = await httpService.request(
          method: 'POST',
          url: '${config.urlConstants}license',
          data: jsonEncode(
            {
              'query': userQueryMutation.updatePrivacyControl(),
              'variables': data,
            },
          ),
        );
        dataSourceExceptionHandler.handleExceptionChecker(res: res);

        return true;
      },
    );
  }

  Future<DocumentType> updateSelectedOrderType({required String value}) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}license',
        data: jsonEncode({
          'query': userQueryMutation.updateSelectedOrderType(),
          'variables': {'orderType': value},
        }),
      );
      dataSourceExceptionHandler.handleExceptionChecker(
        res: res,
        onCustomExceptionHandler: _userExceptionChecker,
      );

      return DocumentType(
        (res.data['data']['updateSelectedOrderType'] as String?) ?? '',
      );
    });
  }
}

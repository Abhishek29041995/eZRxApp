import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_remote.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/mock_other.dart';

void main() {
  late BannerRemoteDataSource remoteDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  final variables = {
    'getLiveCampaignInput': {
      'country': 'mockCountry',
      'Salesorg': '2601',
      'role': 'client',
      'targetProduct': 'EZRX+',
      'bannerPlacement': 'banner_carousel',
      'sortField': 'banner_slot',
      'sort': 'asc',
      'branchCode': 'branchCode',
      'targetCustomerType': 'targetCustomerType',
    },
  };

  final service = HTTPServiceMock();

  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    remoteDataSource = BannerRemoteDataSource(
      config: Config()..appFlavor = Flavor.uat,
      httpService: service,
      bannerQueryMutation: BannerQueryMutation(),
      dataSourceExceptionHandler: DataSourceExceptionHandler(),
    );
  });

  group('Banner Remote Test', () {
    test('Get Banners', () async {
      final res = json.decode(
        await rootBundle.loadString(
          'assets/json/get_EZ_reach_banner/getEZReachBannerResponse.json',
        ),
      );

      when(
        () => service.request(
          method: 'POST',
          url: '/api/campaign',
          data: jsonEncode({
            'query':
                remoteDataSource.bannerQueryMutation.getEZReachBannerQuery(),
            'variables': variables,
          }),
        ),
      ).thenAnswer(
        (invocation) async => Response(
          data: res,
          statusCode: 200,
          requestOptions: RequestOptions(
            path: '/api/campaign',
          ),
        ),
      );

      final result = await remoteDataSource.getEZReachBanners(
        salesOrg: '2601',
        country: 'mockCountry',
        role: 'client',
        bannerType: 'banner_carousel',
        branchCode: 'branchCode',
        targetCustomerType: 'targetCustomerType',
      );

      expect(
        result.length,
        List.from(res['data']['getLiveCampaigns']['data']).length,
      );
    });

    test('Exception Checker with status code not equal to 200', () async {
      when(
        () => service.request(
          method: 'POST',
          url: '/api/campaign',
          data: jsonEncode({
            'query':
                remoteDataSource.bannerQueryMutation.getEZReachBannerQuery(),
            'variables': variables,
          }),
        ),
      ).thenAnswer(
        (invocation) async => Response(
          data: [],
          statusCode: 204,
          requestOptions: RequestOptions(
            path: '/api/campaign',
          ),
        ),
      );

      await remoteDataSource
          .getEZReachBanners(
        salesOrg: '2601',
        country: 'mockCountry',
        role: 'client',
        bannerType: 'banner_carousel',
        branchCode: 'branchCode',
        targetCustomerType: 'targetCustomerType',
      )
          .onError((error, stackTrace) {
        expect(
          error,
          isA<ServerException>(),
        );
        expect(
          (error as ServerException).code,
          204,
        );
        return Future.value(<EZReachBanner>[]);
      });
    });
  });
}

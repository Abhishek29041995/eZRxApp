import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_customer_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_local.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_remote.dart';
import 'package:ezrxmobile/infrastructure/banner/dtos/ez_reach_banner_dto.dart';
import 'package:ezrxmobile/infrastructure/banner/repository/banner_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class BannerRemoteDataSourceMock extends Mock
    implements BannerRemoteDataSource {}

class BannerLocalDataSourceMock extends Mock implements BannerLocalDataSource {}

class ConfigMock extends Mock implements Config {}

void main() {
  late BannerRemoteDataSource remoteDataSourceMock;
  late Config configMock;
  late BannerLocalDataSource localDataSourceMock;
  late List<EZReachBanner> eZReachBannerListMock;
  final salesOrg2601 = SalesOrg('2601');
  final mockSalesOrganisation = SalesOrganisation(
    salesOrg: salesOrg2601,
    customerInfos: <SalesOrgCustomerInfo>[
      SalesOrgCustomerInfo.empty()
          .copyWith(shipToInfos: [SalesOrgShipToInfo.empty()]),
    ],
  );
  const fakeBranchCode = 'fake-branch-code';
  const fakeTargetCustomerType = 'fake-target-customer-type';

  setUpAll(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      configMock = Config()..appFlavor = Flavor.mock;
      localDataSourceMock = BannerLocalDataSourceMock();

      when(
        () => localDataSourceMock.getEZReachBanners(
          bannerType: 'banner_carousel',
        ),
      ).thenAnswer((invocation) async {
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/get_EZ_reach_banner/getEZReachBannerResponse.json'),
        );

        return List.from(res['data']['getLiveCampaigns']['data'])
            .map((e) => EZReachBannerDto.fromJson(e).toDomain())
            .toList();
      });

      eZReachBannerListMock = await localDataSourceMock.getEZReachBanners(
        bannerType: 'banner_carousel',
      );

      remoteDataSourceMock = BannerRemoteDataSourceMock();
    },
  );

  group('Banner Repository', () {
    test('Get banner from remote success', () async {
      final repository = BannerRepository(
        remoteDataSource: remoteDataSourceMock,
        config: configMock..appFlavor = Flavor.uat,
        localDataSource: localDataSourceMock,
      );
      when(
        () => remoteDataSourceMock.getEZReachBanners(
          country: 'mockCountry',
          bannerType: 'banner_carousel',
          role: 'client',
          salesOrg: mockSalesOrganisation.salesOrg.getOrCrash(),
          branchCode: fakeBranchCode,
          targetCustomerType: fakeTargetCustomerType,
        ),
      ).thenAnswer(
        (invocation) async => eZReachBannerListMock,
      );

      final result = await repository.getEZReachBanner(
        country: 'mockCountry',
        bannerType: 'banner_carousel',
        role: 'client',
        salesOrganisation: mockSalesOrganisation,
        branchCode: fakeBranchCode,
        targetCustomerType: fakeTargetCustomerType,
      );
      expect(result.isRight(), true);

      verify(
        () => repository.getEZReachBanner(
          country: 'mockCountry',
          bannerType: 'banner_carousel',
          role: 'client',
          salesOrganisation: mockSalesOrganisation,
          branchCode: fakeBranchCode,
          targetCustomerType: fakeTargetCustomerType,
        ),
      ).called(1);
    });
    test('Get banner from remote failed', () async {
      final repository = BannerRepository(
        remoteDataSource: remoteDataSourceMock,
        config: configMock..appFlavor = Flavor.uat,
        localDataSource: localDataSourceMock,
      );
      when(
        () => remoteDataSourceMock.getEZReachBanners(
          country: 'mockCountry',
          bannerType: 'banner_carousel',
          role: 'client',
          salesOrg: mockSalesOrganisation.salesOrg.getOrCrash(),
          branchCode: fakeBranchCode,
          targetCustomerType: fakeTargetCustomerType,
        ),
      ).thenThrow(
        (invocation) async => Exception('fake-error'),
      );

      final result = await repository.getEZReachBanner(
        country: 'mockCountry',
        bannerType: 'banner_carousel',
        role: 'client',
        salesOrganisation: mockSalesOrganisation,
        branchCode: fakeBranchCode,
        targetCustomerType: fakeTargetCustomerType,
      );
      expect(result.isLeft(), true);

      verify(
        () => repository.getEZReachBanner(
          country: 'mockCountry',
          bannerType: 'banner_carousel',
          role: 'client',
          salesOrganisation: mockSalesOrganisation,
          branchCode: fakeBranchCode,
          targetCustomerType: fakeTargetCustomerType,
        ),
      ).called(1);
    });

    test('Get banner from local success', () async {
      final repository = BannerRepository(
        remoteDataSource: remoteDataSourceMock,
        config: configMock..appFlavor = Flavor.mock,
        localDataSource: localDataSourceMock,
      );

      final result = await repository.getEZReachBanner(
        country: 'mockCountry',
        bannerType: 'banner_carousel',
        role: 'client',
        salesOrganisation: mockSalesOrganisation,
        branchCode: fakeBranchCode,
        targetCustomerType: fakeTargetCustomerType,
      );
      expect(result.isRight(), true);
    });

    test('Get banner from local failed', () async {
      final repository = BannerRepository(
        remoteDataSource: remoteDataSourceMock,
        config: configMock..appFlavor = Flavor.mock,
        localDataSource: localDataSourceMock,
      );
      when(
        () => localDataSourceMock.getEZReachBanners(
          bannerType: 'banner_carousel',
        ),
      ).thenThrow(
        () => Exception('fake-error'),
      );

      final result = await repository.getEZReachBanner(
        country: 'mockCountry',
        bannerType: 'banner_carousel',
        role: 'client',
        salesOrganisation: mockSalesOrganisation,
        branchCode: fakeBranchCode,
        targetCustomerType: fakeTargetCustomerType,
      );
      expect(result.isLeft(), true);
    });
  });
}

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/about_us/entities/about_us.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/about_us/datasource/about_us_local.dart';
import 'package:ezrxmobile/infrastructure/about_us/datasource/about_us_remote.dart';
import 'package:ezrxmobile/infrastructure/about_us/repository/about_us_repository.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/sales_organsiation_mock.dart';

class MockConfig extends Mock implements Config {}

class AboutUsLocalDataSourceMock extends Mock
    implements AboutUsLocalDataSource {}

class AboutUsRemoteDataSourceMock extends Mock
    implements AboutUsRemoteDataSource {}

void main() {
  late AboutUsRepository aboutUsRepository;
  late Config mockConfig;
  late AboutUsLocalDataSource aboutUsLocalDataSource;
  late AboutUsRemoteDataSource aboutUsRemoteDataSource;
  final fakeUser = User.empty();

  setUpAll(
    () {
      mockConfig = Config()..appFlavor = Flavor.mock;
      aboutUsLocalDataSource = AboutUsLocalDataSourceMock();
      aboutUsRemoteDataSource = AboutUsRemoteDataSourceMock();
      aboutUsRepository = AboutUsRepository(
        config: mockConfig,
        localDataSource: aboutUsLocalDataSource,
        remoteDataSource: aboutUsRemoteDataSource,
      );
    },
  );

  group('AboutUsRepository tests', () {
    test('get AboutUs Info successfully local', () async {
      when(
        () => aboutUsLocalDataSource
            .getAboutUsStaticInfo(fakeSalesOrg.aboutUsMockFile),
      ).thenAnswer((invocation) async => AboutUs.empty());

      final result = await aboutUsRepository.getAboutUsInfo(
        salesOrg: fakeSalesOrg,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get AboutUs Info fail local', () async {
      when(
        () => aboutUsLocalDataSource
            .getAboutUsStaticInfo(fakeSalesOrg.aboutUsMockFile),
      ).thenThrow(MockException());

      final result = await aboutUsRepository.getAboutUsInfo(
        salesOrg: fakeSalesOrg,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test(
      'get AboutUs Info successfully remote ',
      () async {
        mockConfig.appFlavor = Flavor.uat;
        when(
          () => aboutUsRemoteDataSource.getAboutUsInfo(
            aboutUsUrlPath: mockConfig.announcementApiUrlPath,
            itemId: fakeSalesOrg.aboutUsVariablePath,
            lang: fakeSalesOrg.languageCodeForHelpAndSupport,
          ),
        ).thenAnswer((_) async => AboutUs.empty());
        final result = await aboutUsRepository.getAboutUsInfo(
          salesOrg: fakeSalesOrg,
        );
        expect(
          result.isRight(),
          true,
        );
      },
    );

    test('get About Us Static Info successfully', () async {
      when(
        () => aboutUsLocalDataSource
            .getAboutUsStaticInfo(fakeSalesOrg.aboutUsMockFile),
      ).thenAnswer((invocation) async => AboutUs.empty());

      final result = await aboutUsRepository.getAboutUsStaticInfo(
        salesOrg: fakeSalesOrg,
      );
      expect(
        result.isRight(),
        true,
      );
      expect(
        result,
        Right(AboutUs.empty()),
      );
    });

    test(
      'get About Us Static Info fail',
      () async {
        when(
          () => aboutUsLocalDataSource.getAboutUsStaticInfo(
            fakeSalesOrg.aboutUsMockFile,
          ),
        ).thenThrow(MockException());
        final result = await aboutUsRepository.getAboutUsStaticInfo(
          salesOrg: fakeSalesOrg,
        );
        expect(
          result.isLeft(),
          true,
        );
        expect(
          result,
          Left<ApiFailure, AboutUs>(
            FailureHandler.handleFailure(MockException()),
          ),
        );
      },
    );

    test(
      'get AboutUs Info fail remote ',
      () async {
        mockConfig.appFlavor = Flavor.uat;
        when(
          () => aboutUsRemoteDataSource.getAboutUsInfo(
            aboutUsUrlPath: mockConfig.announcementApiUrlPath,
            itemId: fakeSalesOrg.aboutUsVariablePath,
            lang: fakeUser.preferredLanguage.locale.languageCode,
          ),
        ).thenThrow(MockException());
        final result = await aboutUsRepository.getAboutUsInfo(
          salesOrg: fakeSalesOrg,
        );
        expect(
          result.isLeft(),
          true,
        );
      },
    );
  });
}

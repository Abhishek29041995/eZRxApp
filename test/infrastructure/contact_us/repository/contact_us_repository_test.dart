import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/contact_us/entities/contact_us_details.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/contact_us/datasource/contact_us_local.dart';
import 'package:ezrxmobile/infrastructure/contact_us/datasource/contact_us_remote.dart';
import 'package:ezrxmobile/infrastructure/contact_us/repository/contact_us_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class ContactUsDetailsLocalDataSourceMock extends Mock
    implements ContactUsDetailsLocalDataSource {}

class ContactUsDetailsRemoteDataSourceMock extends Mock
    implements ContactUsDetailsRemoteDataSource {}

void main() {
  late Config mockConfig;

  late ContactUsDetailsRemoteDataSource remoteDataSource;
  late ContactUsDetailsLocalDataSource localDataSource;
  late ContactUsDetailsRepository repository;
  late ContactUsDetails contactUsDetails;

  final fakeUser = User.empty();
  const email = 'fake-email';
  final error = Exception('fake-error');
  const announcementApiUrlPath = '/api/announcement';
  const token = 'fake-token';

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    mockConfig = ConfigMock();
    localDataSource = ContactUsDetailsLocalDataSourceMock();
    remoteDataSource = ContactUsDetailsRemoteDataSourceMock();
    when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

    repository = ContactUsDetailsRepository(
      config: mockConfig,
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
    );

    contactUsDetails = await ContactUsDetailsLocalDataSource()
        .getContactUsDetails(fakeMYSalesOrg.appMarket.country);
  });

  group('Contact Us Details Repository - ', () {
    test('get Contact Us Details successfully locally ', () async {
      when(
        () => localDataSource
            .getContactUsDetails(fakeMYSalesOrg.appMarket.country),
      ).thenAnswer((invocation) async => contactUsDetails);

      final result = await repository.getContactUsDetails(
        market: fakeMYSalesOrg.appMarket,
      );
      expect(
        result.isRight(),
        true,
      );
      expect(result, Right(contactUsDetails));
    });
    test('get Contact Us Details fail locally ', () async {
      when(
        () => localDataSource
            .getContactUsDetails(fakeMYSalesOrg.appMarket.country),
      ).thenThrow(error);

      final result = await repository.getContactUsDetails(
        market: fakeMYSalesOrg.appMarket,
      );
      expect(
        result.isLeft(),
        true,
      );
      expect(
        result,
        Left(FailureHandler.handleFailure(error)),
      );
    });
    test('get Contact Us Details successfully Remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(() => mockConfig.xGQLToken).thenReturn(token);
      when(() => mockConfig.announcementApiUrlPath)
          .thenReturn(announcementApiUrlPath);
      when(
        () => remoteDataSource.getContactUsDetails(
          announcementUrlPath: announcementApiUrlPath,
          lang: fakeUser.preferredLanguage.locale.languageCode,
          contactUsId: fakeMYSalesOrg.appMarket.contactUsItemId,
          token: token,
        ),
      ).thenAnswer((invocation) async => contactUsDetails);
      final result = await repository.getContactUsDetails(
        market: fakeMYSalesOrg.appMarket,
      );
      expect(
        result.isRight(),
        true,
      );
      expect(result, Right(contactUsDetails));
    });
    test('get Contact Us Details fail Remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(() => mockConfig.xGQLToken).thenReturn(token);
      when(() => mockConfig.announcementApiUrlPath)
          .thenReturn(announcementApiUrlPath);
      when(
        () => remoteDataSource.getContactUsDetails(
          announcementUrlPath: announcementApiUrlPath,
          lang: fakeMYSalesOrg.appMarket.announcementLocale.languageCode,
          contactUsId: fakeMYSalesOrg.appMarket.contactUsItemId,
          token: token,
        ),
      ).thenThrow(error);

      when(
        () => localDataSource
            .getContactUsDetails(fakeMYSalesOrg.appMarket.country),
      ).thenThrow(error);

      final result = await repository.getContactUsDetails(
        market: fakeMYSalesOrg.appMarket,
      );
      expect(
        result.isLeft(),
        true,
      );
      expect(
        result,
        Left(FailureHandler.handleFailure(error)),
      );
    });

    test('get Contact Us Static Info Success', () async {
      when(
        () => localDataSource
            .getContactUsDetails(fakeMYSalesOrg.appMarket.country),
      ).thenAnswer(
        (_) async => contactUsDetails,
      );
      when(
        () => mockConfig.getContactUsStaticEmail(
          fakeMYSalesOrg.appMarket.country,
        ),
      ).thenReturn(email);
      final result = await repository.getContactUsStaticInfo(
        market: fakeMYSalesOrg.appMarket,
      );
      expect(
        result.isRight(),
        true,
      );
      expect(
        result,
        Right(
          contactUsDetails.copyWith(
            postloginSendToEmail: email,
            preloginSendToEmail: email,
          ),
        ),
      );
    });
  });
}

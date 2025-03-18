import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/faq/entity/faq_info.dart';
import 'package:ezrxmobile/domain/faq/entity/faq_item.dart';
import 'package:ezrxmobile/infrastructure/faq/datasource/faq_local.dart';
import 'package:ezrxmobile/infrastructure/faq/datasource/faq_remote.dart';
import 'package:ezrxmobile/infrastructure/faq/repository/faq_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class FAQInfoLocalDataSourceMock extends Mock
    implements FAQInfoLocalDataSource {}

class FAQInfoRemoteDataSourceMock extends Mock
    implements FAQInfoRemoteDataSource {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late Config mockConfig;
  late SalesOrg mockSalesOrg;

  late FAQInfoRemoteDataSource remoteDataSource;
  late FAQInfoLocalDataSource localDataSource;
  late FAQInfoRepository repository;
  late FAQInfo faqMockList;
  late List<FAQItem> updatedFaqList;

  const pageSize = 10;
  final error = Exception('fake-error');
  const template = 'fake-template';
  const path = 'fake-path';
  const after = 'fake-after';
  const baseUrl = 'fake-base-url';

  setUpAll(() async {
    mockConfig = ConfigMock();
    mockSalesOrg = fakeMYSalesOrg;
    localDataSource = FAQInfoLocalDataSourceMock();
    remoteDataSource = FAQInfoRemoteDataSourceMock();

    repository = FAQInfoRepository(
      config: mockConfig,
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
    );
    faqMockList =
        await FAQInfoLocalDataSource().getFAQInfo(mockSalesOrg.country);

    when(() => mockConfig.faqTemplate).thenReturn(template);
    when(() => mockConfig.announcementApiUrlPath).thenReturn(path);

    updatedFaqList = faqMockList.faqList
        .map(
          (e) => e.answer.contains('baseURL')
              ? e.copyWith(
                  answer: e.answer.replaceAll(
                    'baseURL',
                    baseUrl,
                  ),
                )
              : e,
        )
        .toList();
  });
  group('FAQRepository should - ', () {
    test(' get faqInfo successfully locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(
        () => localDataSource.getFAQInfo(mockSalesOrg.country),
      ).thenAnswer((invocation) async => faqMockList);

      final result = await repository.getFAQList(
        salesOrg: mockSalesOrg,
        pageSize: pageSize,
        after: after,
      );
      expect(result, Right(faqMockList));
    });
    test(' get FaqInfo fail locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      when(
        () => localDataSource.getFAQInfo(mockSalesOrg.country),
      ).thenThrow(
        error,
      );

      final result = await repository.getFAQList(
        salesOrg: mockSalesOrg,
        pageSize: pageSize,
        after: after,
      );
      expect(result, Left(FailureHandler.handleFailure(error)));
    });
    test(' get FaqInfo successfully Remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(
        () => remoteDataSource.getFAQInfo(
          announcementUrlPath: path,
          variablePath: mockSalesOrg.faqVariablePath,
          template: template,
          pageSize: pageSize,
          after: after,
          lang: mockSalesOrg.languageCodeForHelpAndSupport,
        ),
      ).thenAnswer((invocation) async => faqMockList);
      final result = await repository.getFAQList(
        salesOrg: mockSalesOrg,
        pageSize: pageSize,
        after: after,
      );
      expect(result, Right(faqMockList));
    });
    test(' get FaqInfo fail Remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(
        () => remoteDataSource.getFAQInfo(
          announcementUrlPath: path,
          variablePath: mockSalesOrg.faqVariablePath,
          template: template,
          pageSize: pageSize,
          after: after,
          lang: mockSalesOrg.languageCodeForHelpAndSupport,
        ),
      ).thenThrow(error);
      when(
        () => localDataSource.getFAQInfo(
          mockSalesOrg.country,
        ),
      ).thenThrow(error);
      final result = await repository.getFAQList(
        salesOrg: mockSalesOrg,
        pageSize: pageSize,
        after: after,
      );
      expect(result, Left(FailureHandler.handleFailure(error)));
    });

    test(' get FaqInfo success but get empty data Remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(
        () => remoteDataSource.getFAQInfo(
          announcementUrlPath: path,
          variablePath: mockSalesOrg.faqVariablePath,
          template: template,
          pageSize: pageSize,
          after: after,
          lang: mockSalesOrg.languageCodeForHelpAndSupport,
        ),
      ).thenAnswer(
        (invocation) async => FAQInfo.empty().copyWith(faqList: <FAQItem>[]),
      );
      when(
        () => localDataSource.getFAQInfo(
          mockSalesOrg.country,
        ),
      ).thenThrow(error);
      final result = await repository.getFAQList(
        salesOrg: mockSalesOrg,
        pageSize: pageSize,
        after: after,
      );
      expect(result, Left(FailureHandler.handleFailure(error)));
    });

    test(' get FAQ Static List Success', () async {
      when(
        () => localDataSource.getFAQInfo(
          mockSalesOrg.country,
        ),
      ).thenAnswer((_) async => faqMockList);
      when(
        () => mockConfig.baseUrl(
          marketDomain: mockSalesOrg.country.toLowerCase(),
        ),
      ).thenReturn(baseUrl);

      final result = await repository.getFAQStaticList(
        salesOrg: mockSalesOrg,
      );
      expect(result, Right(faqMockList.copyWith(faqList: updatedFaqList)));
    });
  });
}

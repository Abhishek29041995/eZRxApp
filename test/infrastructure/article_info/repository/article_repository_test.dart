import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';
import 'package:ezrxmobile/infrastructure/article_info/datasource/article_info_local.dart';
import 'package:ezrxmobile/infrastructure/article_info/datasource/article_info_remote.dart';
import 'package:ezrxmobile/infrastructure/article_info/repository/article_info_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/sales_organsiation_mock.dart';

class MockConfig extends Mock implements Config {}

class MockSalesOrg extends Mock implements SalesOrg {}

class ArticleInfoLocalDataSourceMock extends Mock
    implements ArticleInfoLocalDataSource {}

class ArticleInfoRemoteDataSourceMock extends Mock
    implements ArticleInfoRemoteDataSource {}

void main() {
  late Config mockConfig;
  late SalesOrg mockSalesOrg;

  late ArticleInfoRemoteDataSource remoteDataSource;
  late ArticleInfoLocalDataSource localDataSource;
  late ArticleInfoRepository repository;
  late AnnouncementArticleInfo fakeAnnouncementArticleInfo;

  final fakeUser = User.empty();

  setUpAll(() async {
    mockConfig = Config()..appFlavor = Flavor.mock;
    WidgetsFlutterBinding.ensureInitialized();
    mockSalesOrg = MockSalesOrg();
    localDataSource = ArticleInfoLocalDataSourceMock();
    remoteDataSource = ArticleInfoRemoteDataSourceMock();
    fakeAnnouncementArticleInfo =
        await ArticleInfoLocalDataSource().getArticles();

    repository = ArticleInfoRepository(
      config: mockConfig,
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
    );
  });
  group('Article Info Repository should - ', () {
    test(' get article Info successfully locally ', () async {
      mockConfig.appFlavor = Flavor.mock;

      when(
        () => localDataSource.getArticles(),
      ).thenAnswer((invocation) async => AnnouncementArticleInfo.empty());

      final result = await repository.getArticles(
        user: fakeUser,
        salesOrg: mockSalesOrg,
        pageSize: mockConfig.pageSize,
        after: '',
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test(' get article Info fail locally ', () async {
      mockConfig.appFlavor = Flavor.mock;

      when(
        () => localDataSource.getArticles(),
      ).thenThrow(
        (invocation) async => Exception('fake-error'),
      );

      final result = await repository.getArticles(
        user: fakeUser,
        salesOrg: mockSalesOrg,
        pageSize: mockConfig.pageSize,
        after: '',
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test(' get article Info successfully Remote ', () async {
      mockConfig.appFlavor = Flavor.uat;
      when(() => mockSalesOrg.articleVariablePath)
          .thenReturn(('51B88D33-B26E-475D-90FC-BEFD9FF0A348'));
      when(() => mockSalesOrg.languageCodeForHelpAndSupport)
          .thenReturn(('zh-TW'));
      when(() => mockSalesOrg.isID).thenReturn((false));

      when(
        () => remoteDataSource.getArticleInfo(
          announcementUrlPath: mockConfig.announcementApiUrlPath,
          template: mockConfig.articleTemplate,
          variablePath: '51B88D33-B26E-475D-90FC-BEFD9FF0A348',
          pageSize: mockConfig.pageSize,
          after: '',
          lang: 'zh-TW',
        ),
      ).thenAnswer((invocation) async => AnnouncementArticleInfo.empty());
      final result = await repository.getArticles(
        user: fakeUser,
        salesOrg: mockSalesOrg,
        pageSize: mockConfig.pageSize,
        after: '',
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test(' get article Info successfully Remote for ID market', () async {
      mockConfig.appFlavor = Flavor.uat;

      when(
        () => remoteDataSource.getArticleInfoIdMarket(
          announcementUrlPath: mockConfig.announcementApiUrlPath,
          template1: mockConfig.idMarketArticleTemplate1,
          template2: mockConfig.idMarketArticleTemplate2,
          pageSize: mockConfig.pageSize,
          variablePath: fakeIDSalesOrg.articleVariablePath,
          after: '',
          lang: fakeIDSalesOrg.languageCodeForHelpAndSupport,
        ),
      ).thenAnswer((invocation) async => fakeAnnouncementArticleInfo);
      final result = await repository.getArticles(
        user: fakeUser,
        salesOrg: fakeIDSalesOrg,
        pageSize: mockConfig.pageSize,
        after: '',
      );
      expect(
        result.isRight(),
        true,
      );
      expect(
        result.getOrElse(() => AnnouncementArticleInfo.empty()),
        fakeAnnouncementArticleInfo,
      );
    });
    test(' get article Info fail Remote ', () async {
      mockConfig.appFlavor = Flavor.uat;

      when(
        () => remoteDataSource.getArticleInfo(
          announcementUrlPath: mockConfig.announcementApiUrlPath,
          variablePath: '51B88D33-B26E-475D-90FC-BEFD9FF0A348',
          template: mockConfig.articleTemplate,
          pageSize: mockConfig.pageSize,
          after: '',
          lang: fakeUser.preferredLanguage.languageCode,
        ),
      ).thenThrow(
        (invocation) async => Exception('fake-error'),
      );
      final result = await repository.getArticles(
        user: fakeUser,
        salesOrg: fakeMYSalesOrg,
        pageSize: mockConfig.pageSize,
        after: '',
      );
      expect(
        result.isLeft(),
        true,
      );
    });
  });
}

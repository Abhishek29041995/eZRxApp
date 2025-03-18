import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_article_tag_local.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_article_tag_remote.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/repository/announcement_article_tag_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/sales_organsiation_mock.dart';

class MockConfig extends Mock implements Config {}

class AnnouncementArticleTagLocalDataSourceMock extends Mock
    implements AnnouncementArticleTagLocalDataSource {}

class AnnouncementArticlTagRemoteDataSourceMock extends Mock
    implements AnnouncementArticlTagRemoteDataSource {}

void main() {
  late Config mockConfig;

  late AnnouncementArticleTagLocalDataSource localDataSource;
  late AnnouncementArticlTagRemoteDataSource remoteDataSource;
  late AnnouncementArticleTagRepository repository;
  late List<String> tags;
  const error = ApiFailure.other('fake-error');
  const path = 'fake-path';

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    mockConfig = Config()..appFlavor = Flavor.mock;

    localDataSource = AnnouncementArticleTagLocalDataSourceMock();
    remoteDataSource = AnnouncementArticlTagRemoteDataSourceMock();
    tags = await AnnouncementArticleTagLocalDataSource()
        .getAnnouncementArticleTags();
    repository = AnnouncementArticleTagRepository(
      config: mockConfig,
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
    );
  });
  group('Announcement Article Tag Repository test - ', () {
    test(' get Announcement Article Tag successfully locally ', () async {
      mockConfig.appFlavor = Flavor.mock;

      when(
        () => localDataSource.getAnnouncementArticleTags(),
      ).thenAnswer((invocation) async => tags);

      final result = await repository.getAnnouncementArticleTag(
        salesOrg: fakeMYSalesOrg,
        variablePath: path,
      );

      expect(
        result,
        Right(tags),
      );
    });

    test(' get Announcement Article Tag failure locally ', () async {
      mockConfig.appFlavor = Flavor.mock;

      when(
        () => localDataSource.getAnnouncementArticleTags(),
      ).thenThrow(error);

      final result = await repository.getAnnouncementArticleTag(
        salesOrg: fakeMYSalesOrg,
        variablePath: path,
      );

      expect(
        result,
        Left(
          FailureHandler.handleFailure((error)),
        ),
      );
    });

    test(' get Announcement Article Tag successfully remote ', () async {
      mockConfig.appFlavor = Flavor.uat;

      when(
        () => remoteDataSource.getAnnouncementArticleTags(
          announcementArticleUrlPath: mockConfig.announcementApiUrlPath,
          template: mockConfig.announcementArticleTagTemplate,
          variablePath: path,
          lang: fakeMYSalesOrg.languageCodeForHelpAndSupport,
        ),
      ).thenAnswer((invocation) async => tags);

      final result = await repository.getAnnouncementArticleTag(
        salesOrg: fakeMYSalesOrg,
        variablePath: path,
      );

      expect(
        result,
        Right(tags),
      );
    });

    test(' get Announcement Article Tag failure remote ', () async {
      mockConfig.appFlavor = Flavor.uat;

      when(
        () => remoteDataSource.getAnnouncementArticleTags(
          announcementArticleUrlPath: mockConfig.announcementApiUrlPath,
          template: mockConfig.announcementArticleTagTemplate,
          variablePath: path,
          lang: fakeMYSalesOrg.languageCodeForHelpAndSupport,
        ),
      ).thenThrow(error);

      final result = await repository.getAnnouncementArticleTag(
        salesOrg: fakeMYSalesOrg,
        variablePath: path,
      );

      expect(
        result,
        Left(
          FailureHandler.handleFailure((error)),
        ),
      );
    });
  });
}

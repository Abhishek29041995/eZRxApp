import 'dart:ui';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_info_details.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_info_local.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_info_remote.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/repository/announcement_info_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/sales_organsiation_mock.dart';

class MockConfig extends Mock implements Config {}

class MockSalesOrg extends Mock implements SalesOrg {}

class MockAnnouncementArticleInfo extends Mock
    implements AnnouncementArticleInfo {}

class AnnouncementInfoLocalDataSourceMock extends Mock
    implements AnnouncementInfoLocalDataSource {}

class AnnouncementInfoRemoteDataSourceMock extends Mock
    implements AnnouncementInfoRemoteDataSource {}

void main() {
  late Config mockConfig;
  late SalesOrg mockSalesOrg;
  late AnnouncementArticleInfo mockAnnouncementArticleInfo;

  late AnnouncementInfoRemoteDataSource remoteDataSource;
  late AnnouncementInfoLocalDataSource localDataSource;
  late AnnouncementInfoRepository repository;

  final fakeUser = User.empty();

  setUpAll(() {
    mockConfig = Config()..appFlavor = Flavor.mock;
    mockSalesOrg = MockSalesOrg();
    mockAnnouncementArticleInfo = MockAnnouncementArticleInfo();
    localDataSource = AnnouncementInfoLocalDataSourceMock();
    remoteDataSource = AnnouncementInfoRemoteDataSourceMock();

    repository = AnnouncementInfoRepository(
      config: mockConfig,
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
    );
  });
  group('Announcement Info Repository should - ', () {
    test(' get announcement Info successfully locally ', () async {
      mockConfig.appFlavor = Flavor.mock;

      when(
        () => localDataSource.getAnnouncementInfo(),
      ).thenAnswer((invocation) async => AnnouncementArticleInfo.empty());

      final result = await repository.getAnnouncement(
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
    test(' get announcement Info fail locally ', () async {
      mockConfig.appFlavor = Flavor.mock;
      when(
        () => localDataSource.getAnnouncementInfo(),
      ).thenThrow(
        (invocation) async => Exception('fake-error'),
      );

      final result = await repository.getAnnouncement(
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
    test(' get announcement Info successfully Remote ', () async {
      mockConfig.appFlavor = Flavor.uat;

      when(() => mockSalesOrg.announcementVariablePath)
          .thenReturn(('51B88D33-B26E-475D-90FC-BEFD9FF0A348'));
      when(() => mockSalesOrg.languageCodeForHelpAndSupport)
          .thenReturn(('zh-TW'));

      when(
        () => remoteDataSource.getAnnouncementInfo(
          announcementUrlPath: mockConfig.announcementApiUrlPath,
          template: mockConfig.announcementTemplate,
          vnTemplate: mockConfig.announcementVnTemplate,
          pageSize: mockConfig.pageSize,
          variablePath: '51B88D33-B26E-475D-90FC-BEFD9FF0A348',
          after: '',
          lang: 'zh-TW',
        ),
      ).thenAnswer((invocation) async => AnnouncementArticleInfo.empty());
      final result = await repository.getAnnouncement(
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
    test(' get announcement Info fail Remote ', () async {
      mockConfig.appFlavor = Flavor.uat;
      when(() => mockSalesOrg.announcementVariablePath)
          .thenReturn(('51B88D33-B26E-475D-90FC-BEFD9FF0A348'));
      when(() => mockSalesOrg.languageCodeForHelpAndSupport)
          .thenReturn(('zh-TW'));
      when(
        () => remoteDataSource.getAnnouncementInfo(
          announcementUrlPath: mockConfig.announcementApiUrlPath,
          template: mockConfig.announcementTemplate,
          vnTemplate: mockConfig.announcementVnTemplate,
          pageSize: mockConfig.pageSize,
          variablePath: '51B88D33-B26E-475D-90FC-BEFD9FF0A348',
          after: '',
          lang: 'zh-TW',
        ),
      ).thenThrow(
        (invocation) async => Exception('fake-error'),
      );
      final result = await repository.getAnnouncement(
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
  });

  group('Announcement Info Details Repository should - ', () {
    test(' get announcement Info details successfully locally ', () async {
      mockConfig.appFlavor = Flavor.mock;
      when(
        () => localDataSource.getAnnouncementInfoDetails(),
      ).thenAnswer((invocation) async => AnnouncementInfoDetails.empty());

      final result = await repository.getAnnouncementDetails(
        salesOrg: mockSalesOrg,
        announcementId: 'fake_id',
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test(' get announcement Info details fail locally ', () async {
      mockConfig.appFlavor = Flavor.mock;

      when(
        () => localDataSource.getAnnouncementInfoDetails(),
      ).thenThrow(
        (invocation) async => Exception('fake-error'),
      );

      final result = await repository.getAnnouncementDetails(
        salesOrg: mockSalesOrg,
        announcementId: 'fake_id',
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test(' get announcement Info details successfully Remote ', () async {
      mockConfig.appFlavor = Flavor.uat;
      when(() => mockSalesOrg.announcementVariablePath)
          .thenReturn(('51B88D33-B26E-475D-90FC-BEFD9FF0A348'));
      when(() => mockSalesOrg.announcementLocale)
          .thenReturn((const Locale('EN')));
      when(() => mockAnnouncementArticleInfo.announcementList).thenReturn(
        ([AnnouncementArticleItem.empty().copyWith(id: 'fake_id')]),
      );

      when(
        () => remoteDataSource.getAnnouncementInfoDetails(
          announcementUrlPath: mockConfig.announcementApiUrlPath,
          lang: fakeMYSalesOrg.announcementLocale.languageCode,
          announcementId: 'fake_id',
        ),
      ).thenAnswer((invocation) async => AnnouncementInfoDetails.empty());
      final result = await repository.getAnnouncementDetails(
        salesOrg: fakeMYSalesOrg,
        announcementId: mockAnnouncementArticleInfo.announcementList.first.id,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test(' get announcement Info details fail Remote ', () async {
      mockConfig.appFlavor = Flavor.uat;
      when(
        () => remoteDataSource.getAnnouncementInfoDetails(
          announcementUrlPath: mockConfig.announcementApiUrlPath,
          lang: 'EN',
          announcementId: 'fake_id',
        ),
      ).thenThrow(
        (invocation) async => Exception('fake-error'),
      );
      final result = await repository.getAnnouncementDetails(
        salesOrg: mockSalesOrg,
        announcementId: mockAnnouncementArticleInfo.announcementList.first.id,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
  });
}

import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/announcement/entities/announcement.dart';
import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_local.dart';
import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_remote.dart';
import 'package:ezrxmobile/infrastructure/announcement/dtos/announcement_dto.dart';
import 'package:ezrxmobile/infrastructure/announcement/repository/announcement_repository.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/banner_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AnnouncementRemoteDataSourceMock extends Mock
    implements AnnouncementRemoteDataSource {}

class AnnouncementLocalDataSourceMock extends Mock
    implements AnnouncementLocalDataSource {}

class ConfigMock extends Mock implements Config {}

class MockDateTimeStorageStorage extends Mock implements BannerStorage {}

void main() {
  late AnnouncementRepository repository;
  late AnnouncementRemoteDataSource remoteDataSourceMock;
  late MockDateTimeStorageStorage dateTimeStorage;
  late Config configMock;
  late AnnouncementLocalDataSource localDataSourceMock;
  late Announcement announcementMock;

  setUpAll(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      configMock = Config()..appFlavor = Flavor.uat;
      localDataSourceMock = AnnouncementLocalDataSourceMock();
      dateTimeStorage = MockDateTimeStorageStorage();
      when(() => localDataSourceMock.getAnnouncements())
          .thenAnswer((invocation) async {
        final res = json.decode(
          await rootBundle
              .loadString('assets/json/get_announcements/getAnnouncementsResponse.json'),
        );

        return AnnouncementDto.fromJson(res['data']['getAnnouncements'][0])
            .toDomain;
      });

      remoteDataSourceMock = AnnouncementRemoteDataSourceMock();

      repository = AnnouncementRepository(
        remoteDataSource: remoteDataSourceMock,
        config: configMock,
        localDataSource: localDataSourceMock,
        dateTimeStorage: dateTimeStorage,
      );
    },
  );
  group('Announcement Repository', () {
    test('Get announcement from remote success', () async {
      announcementMock = await localDataSourceMock.getAnnouncements();

      when(() => remoteDataSourceMock.getAnnouncements())
          .thenAnswer((invocation) async => announcementMock);

      final result = await repository.getAnnouncements();
      expect(result.isRight(), true);

      verify(
        () => repository.getAnnouncements(),
      ).called(1);
    });

    test('Get announcement from remote failed', () async {
      when(() => remoteDataSourceMock.getAnnouncements())
          .thenThrow((invocation) async => Exception('fake-error'));

      final result = await repository.getAnnouncements();
      expect(result.isLeft(), true);

      verify(
        () => repository.getAnnouncements(),
      ).called(1);
    });

    test('Get announcement from local success', () async {
      final repository = AnnouncementRepository(
        remoteDataSource: remoteDataSourceMock,
        config: configMock..appFlavor = Flavor.mock,
        localDataSource: localDataSourceMock,
        dateTimeStorage: dateTimeStorage,
      );

      final result = await repository.getAnnouncements();
      expect(result.isRight(), true);
    });

    test('Get announcement from local failed', () async {
      final repository = AnnouncementRepository(
        remoteDataSource: remoteDataSourceMock,
        config: configMock..appFlavor = Flavor.mock,
        localDataSource: localDataSourceMock,
        dateTimeStorage: dateTimeStorage,
      );
      when(() => localDataSourceMock.getAnnouncements())
          .thenThrow(() => Exception('fake-error'));

      final result = await repository.getAnnouncements();
      expect(result.isLeft(), true);
    });
  });
}

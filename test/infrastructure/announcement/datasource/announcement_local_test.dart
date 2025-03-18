import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/announcement/entities/announcement.dart';
import 'package:ezrxmobile/infrastructure/announcement/datasource/announcement_local.dart';
import 'package:ezrxmobile/infrastructure/announcement/dtos/announcement_dto.dart';
import 'package:ezrxmobile/infrastructure/announcement/dtos/maintenance_item_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AnnouncementMock extends Mock implements Announcement {}

void main() {
  late AnnouncementLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = AnnouncementLocalDataSource();
    },
  );
  group(
    'Announcement local',
    () {
      test(
        'Get announcement success',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/get_announcements/getAnnouncementsResponse.json'),
          );

          final result = await localDataSource.getAnnouncements();

          expect(
            result,
            AnnouncementDto.fromJson(res['data']['getAnnouncements'][0])
                .toDomain,
          );
        },
      );

      test(
        'Get Maintenance Banners success',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/get_maintenance/getMaintenanceBannersResponse.json'),
          );

          final result = await localDataSource.getMaintenanceBanners();

          expect(
            result,
            MaintenanceItemDto.fromJson(res['data']['item']).toDomain,
          );
        },
      );
    },
  );
}

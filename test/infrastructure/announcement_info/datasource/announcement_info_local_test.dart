import 'dart:convert';

import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_info_local.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/dtos/announcement_article_info_dto.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/dtos/announcement_info_details_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AnnouncementInfoLocalDataSource localDataSource;

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = AnnouncementInfoLocalDataSource();
    },
  );
  group(
    'Announcement info local',
    () {
      test(
        'Get Announcement Info success',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/get_announcement_info/getAnnouncementInfoResponse.json'),
          );

          final result = await localDataSource.getAnnouncementInfo();

          expect(
            result,
            AnnouncementArticleInfoDto.fromJson(res['data']['search']).toDomain,
          );
        },
      );

      test(
        'Get Announcement Info Details success',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/get_announcement_info_details/getAnnouncementInfoDetailsResponse.json',
            ),
          );

          final result = await localDataSource.getAnnouncementInfoDetails();

          expect(
            result,
            AnnouncementInfoDetailsDto.fromJson(
              res['data']['item'],
            ).toDomain,
          );
        },
      );
    },
  );
}

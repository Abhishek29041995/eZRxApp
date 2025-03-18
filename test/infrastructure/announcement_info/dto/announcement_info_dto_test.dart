import 'dart:convert';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/dtos/announcement_article_info_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group(
    'Test Announcement Info DTO',
    () {
      setUp(
        () async {
          data = json.decode(
            await rootBundle
                .loadString('assets/json/get_announcement_info/getAnnouncementInfoResponse.json'),
          );
        },
      );
      test(
        '=> data mapping',
        () {
          String getValue(Map json, String key) =>
              json[key] != null ? json[key]['value'] ?? '' : '';

          String getSrcValue(Map json, String key) =>
              json[key] != null ? json[key]['src'] ?? '' : '';

          String getDateValue(Map json, String key) =>
              json[key] != null ? json[key]['isoValue'] ?? '' : '';

          final announcementInfo =
              AnnouncementArticleInfoDto.fromJson(data['data']['search'])
                  .toDomain;
          expect(announcementInfo.announcementList.isNotEmpty, true);

          final itemData = data['data']['search']['results'][0];
          final announcementItem =
              AnnouncementArticleItemDto.fromJson(itemData).toDomain;
          expect(announcementItem.id, itemData['id']);
          expect(
            announcementItem.publishedDate,
            DateTimeStringValue(getDateValue(itemData, 'publishedDate')),
          );
          expect(announcementItem.summary, getValue(itemData, 'summary'));
          expect(
            announcementItem.thumbnail,
            getSrcValue(itemData, 'thumbnail'),
          );
          expect(announcementItem.title, getValue(itemData, 'title'));
        },
      );

      test('Test toJson', () {
        final announcementArticleInfoMap =
            AnnouncementArticleInfoDto.fromJson(data['data']['search'])
                .toJson();

        expect(announcementArticleInfoMap['total'], 37);
      });
    },
  );

  group(
    'Test Branch And Ic4 Info Dto',
    () {
      setUp(
        () async {
          data = {
            'id': 'fake-id',
            'name': 'fake-name',
            'displayName': 'fake-display-name',
          };
        },
      );
      test(
        '=> data mapping',
        () {
          final branchAndIc4Info = BranchAndIc4InfoDto.fromJson(data).toDomain;
          expect(branchAndIc4Info.id, 'fake-id');
          expect(branchAndIc4Info.name, 'fake-name');
          expect(branchAndIc4Info.displayName, 'fake-display-name');
        },
      );
    },
  );
}

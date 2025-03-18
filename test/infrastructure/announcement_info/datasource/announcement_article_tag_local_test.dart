import 'dart:convert';

import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_article_tag_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AnnouncementArticleTagLocalDataSource localDataSource;

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = AnnouncementArticleTagLocalDataSource();
    },
  );
  group(
    'Announcement Article Tag local',
    () {
      test(
        'Get Announcement Article Tags success',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/announcement_article_tag/announcementArticleTag.json'),
          );

          final result = await localDataSource.getAnnouncementArticleTags();

          final List<String> tagList = res['data']['search']['results']
              .map<String>(
                (e) => e['displayName'] as String,
              )
              .toList();
          tagList.removeWhere((element) => element.isEmpty);

          expect(
            result,
            tagList,
          );
        },
      );
    },
  );
}

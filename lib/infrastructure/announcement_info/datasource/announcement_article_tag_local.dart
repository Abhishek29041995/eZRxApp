import 'dart:convert';

import 'package:flutter/services.dart';

class AnnouncementArticleTagLocalDataSource {
  Future<List<String>> getAnnouncementArticleTags() async {
    final res = json.decode(
      await rootBundle.loadString('assets/json/announcement_article_tag/announcementArticleTag.json'),
    );

    final List<String> tagList = res['data']['search']['results']
        .map<String>(
          (e) => e['displayName'] as String,
        )
        .toList();
    tagList.removeWhere((element) => element.isEmpty);

    return tagList;
  }
}

import 'dart:convert';

import 'package:ezrxmobile/infrastructure/announcement_info/dtos/announcement_article_info_dto.dart';
import 'package:flutter/services.dart';

import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';

class ArticleInfoLocalDataSource {
  Future<AnnouncementArticleInfo> getArticles() async {
    final res = json.decode(
      await rootBundle.loadString('assets/json/get_article_info/getArticleInfoResponse.json'),
    );

    return AnnouncementArticleInfoDto.fromJson(res['data']['search']).toDomain;
  }
}

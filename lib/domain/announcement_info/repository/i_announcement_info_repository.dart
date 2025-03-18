import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_info_details.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

abstract class IAnnouncementInfoRepository {
  Future<Either<ApiFailure, AnnouncementArticleInfo>> getAnnouncement({
    required User user,
    required SalesOrg salesOrg,
    required int pageSize,
    required String after,
  });

  Future<Either<ApiFailure, AnnouncementInfoDetails>> getAnnouncementDetails({
    required String announcementId,
    required SalesOrg salesOrg,
  });
}

import 'dart:convert';

import 'package:ezrxmobile/domain/announcement/entities/announcement.dart';
import 'package:ezrxmobile/domain/announcement/entities/maintenance_item.dart';
import 'package:ezrxmobile/infrastructure/announcement/dtos/announcement_dto.dart';
import 'package:ezrxmobile/infrastructure/announcement/dtos/maintenance_item_dto.dart';
import 'package:flutter/services.dart';

class AnnouncementLocalDataSource {
  Future<Announcement> getAnnouncements() async {
    final res = json.decode(
      await rootBundle.loadString(
        'assets/json/get_announcements/getAnnouncementsResponse.json',
      ),
    );

    return AnnouncementDto.fromJson(res['data']['getAnnouncements'][0])
        .toDomain;
  }

  Future<MaintenanceItem> getMaintenanceBanners() async {
    final res = json.decode(
      await rootBundle.loadString(
        'assets/json/get_maintenance/getMaintenanceBannersResponse.json',
      ),
    );

    return MaintenanceItemDto.fromJson(res['data']['item']).toDomain;
  }
}

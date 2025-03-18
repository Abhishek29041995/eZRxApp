import 'package:ezrxmobile/domain/announcement/entities/maintenance_item.dart';
import 'package:ezrxmobile/domain/announcement/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Maintenance Item -', () {
    test('verify the length of listNotificationData with multiple login types',
        () {
      final customMaintenanceBanners = [
        MaintenanceBanner.empty().copyWith(
          loginType: AnnouncementDislayTime('Pre'),
        ),
        MaintenanceBanner.empty().copyWith(
          loginType: AnnouncementDislayTime('Post'),
        ),
        MaintenanceBanner.empty().copyWith(
          loginType: AnnouncementDislayTime('Pre and Post'),
        ),
        MaintenanceBanner.empty().copyWith(
          loginType: AnnouncementDislayTime('Pre Login'),
        ),
        MaintenanceBanner.empty().copyWith(
          loginType: AnnouncementDislayTime('Post Login'),
        ),
        MaintenanceBanner.empty().copyWith(
          loginType: AnnouncementDislayTime('Pre and Post Login'),
        ),
      ];

      final customMaintenanceItem = MaintenanceItem.empty().copyWith(
        banners: customMaintenanceBanners,
      );

      expect(
        customMaintenanceItem.listNotificationData.length,
        customMaintenanceBanners.length,
      );
    });
  });
}

import 'package:ezrxmobile/domain/announcement/value/value_objects.dart';
import 'package:ezrxmobile/domain/banner/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/notification/entities/notification_data.dart';
import 'package:ezrxmobile/domain/notification/value/value_object.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/banner_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'maintenance_item.freezed.dart';

@freezed
class MaintenanceItem with _$MaintenanceItem {
  const MaintenanceItem._();

  const factory MaintenanceItem({
    required String id,
    required String displayName,
    required int maxNumberOfItem,
    required List<MaintenanceBanner> banners,
  }) = _MaintenanceItem;

  factory MaintenanceItem.empty() => const MaintenanceItem(
        id: '',
        displayName: '',
        maxNumberOfItem: 0,
        banners: [],
      );

  List<MaintenanceBanner> getListByType(StorageType storageType) {
    switch (storageType) {
      case StorageType.order:
        return orderList;
      case StorageType.payment:
        return paymentList;
      case StorageType.returns:
        return returnList;
    }
  }

  List<MaintenanceBanner> get preLoginList {
    return banners
        .where(
          (element) => element.loginType.isPreLog,
        )
        .take(3)
        .toList();
  }

  List<MaintenanceBanner> get returnList {
    return banners
        .where(
          (element) => element.loginType.isLogged && element.hasReturn,
        )
        .take(3)
        .toList();
  }

  List<MaintenanceBanner> get paymentList {
    return banners
        .where(
          (element) => element.loginType.isLogged && element.hasPayment,
        )
        .take(3)
        .toList();
  }

  List<MaintenanceBanner> get orderList {
    return banners
        .where(
          (element) => element.loginType.isLogged && element.hasOrder,
        )
        .take(3)
        .toList();
  }

  List<NotificationData> get listNotificationData =>
      banners.map((e) => e.toNotificationData).toList();
}

@freezed
class MaintenanceBanner with _$MaintenanceBanner {
  const MaintenanceBanner._();

  const factory MaintenanceBanner({
    required String id,
    required String displayName,
    required String content,
    required EZReachBannerLink hyperlink,
    required String isoDateValue,
    required String formattedDateValue,
    required String type,
    required List<ApplicableModules> applicableModules,
    required bool enableCrossButton,
    required AnnouncementDislayTime loginType,
  }) = _MaintenanceBanner;

  factory MaintenanceBanner.empty() => MaintenanceBanner(
        id: '',
        displayName: '',
        content: '',
        hyperlink: EZReachBannerLink(''),
        isoDateValue: '',
        formattedDateValue: '',
        type: '',
        applicableModules: [],
        enableCrossButton: false,
        loginType: AnnouncementDislayTime(''),
      );

  bool get hasOrder => applicableModules.any((element) => element.name.isOrder);

  bool get hasPayment =>
      applicableModules.any((element) => element.name.isPayment);

  bool get hasReturn =>
      applicableModules.any((element) => element.name.isReturn);

  String contentHtml(String more) {
    if (!hyperlink.isExternalLink &&
        !hyperlink.isInternalLink &&
        hyperlink.getValue().isNotEmpty) {
      return content;
    }

    final htmlTag =
        '<a href="${hyperlink.value.getOrElse(() => '')}" style="color:black;text-decoration:none"><b> $more<b></a>';

    return '$content $htmlTag';
  }

  NotificationData get toNotificationData {
    return NotificationData.empty().copyWith(
      type: NotificationType('AnnouncementBanner'),
      title: NotificationTitle('Alert'),
      description: content,
      createdAt: DateTimeStringValue(formattedDateValue),
      hyperLink: hyperlink,
    );
  }
}

@freezed
class ApplicableModules with _$ApplicableModules {
  const ApplicableModules._();

  const factory ApplicableModules({
    required String id,
    required AnnouncementDislayModule name,
    required AnnouncementDislayModule displayName,
  }) = _ApplicableModules;

  factory ApplicableModules.empty() => ApplicableModules(
        id: '',
        name: AnnouncementDislayModule(''),
        displayName: AnnouncementDislayModule(''),
      );
}

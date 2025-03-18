part of 'announcement_bloc.dart';

@freezed
class AnnouncementEvent with _$AnnouncementEvent {
  const factory AnnouncementEvent.getAnnouncement() = _GetAnnouncement;

  const factory AnnouncementEvent.close() = _Close;

  const factory AnnouncementEvent.clearBannerId() = _ClearBannerId;

  const factory AnnouncementEvent.clearClosedTime() = _ClearClosedTime;

  const factory AnnouncementEvent.show() = _Show;

  const factory AnnouncementEvent.setClosedTime({
    required DateTimeStringValue dateTime,
    required StorageType storageType,
  }) = _SetDontShowDateTime;

  const factory AnnouncementEvent.getClosedTime() = _GetDontShowDateTime;

  const factory AnnouncementEvent.getMaintenanceBanners({
    required SalesOrg salesOrg,
  }) = _GetMaintenanceBanners;

  const factory AnnouncementEvent.changePreferLanguage({
    required bool preferSalesOrgLanguage,
  }) = _ChangePreferLanguage;

  const factory AnnouncementEvent.closedBannerId({
    required String id,
  }) = _ClosedBannerId;
}

part of 'announcement_bloc.dart';

@freezed
class AnnouncementState with _$AnnouncementState {
  const AnnouncementState._();

  const factory AnnouncementState({
    required Announcement announcement,
    required MaintenanceItem maintenanceItem,
    required List<String> listBannersIdClosed,
    required DateTimeStringValue lastClosedTimeOrder,
    required DateTimeStringValue lastClosedTimePayment,
    required DateTimeStringValue lastClosedTimeReturns,
    required bool preferSalesOrgLanguage,
    required bool isLoading,
    required bool isClosed,
  }) = _AnnouncementState;

  factory AnnouncementState.initial() => AnnouncementState(
        isClosed: true,
        isLoading: false,
        preferSalesOrgLanguage: true,
        listBannersIdClosed: <String>[],
        announcement: Announcement.empty(),
        maintenanceItem: MaintenanceItem.empty(),
        lastClosedTimeOrder: DateTimeStringValue(''),
        lastClosedTimePayment: DateTimeStringValue(''),
        lastClosedTimeReturns: DateTimeStringValue(''),
      );

  bool get isClosedTimeOrder {
    if (lastClosedTimeOrder.isEmpty || !lastClosedTimeOrder.isValid()) {
      return true;
    }

    return lastClosedTimeOrder.dateTime
        .copyWith(hour: 0, minute: 0, second: 0)
        .isBefore(DateTime.now());
  }

  bool get isClosedTimePayment {
    if (lastClosedTimePayment.isEmpty || !lastClosedTimePayment.isValid()) {
      return true;
    }

    return lastClosedTimePayment.dateTime
        .copyWith(hour: 0, minute: 0, second: 0)
        .isBefore(DateTime.now());
  }

  bool get isClosedTimeReturns {
    if (lastClosedTimeReturns.isEmpty || !lastClosedTimeReturns.isValid()) {
      return true;
    }

    return lastClosedTimeReturns.dateTime
        .copyWith(hour: 0, minute: 0, second: 0)
        .isBefore(DateTime.now());
  }

  bool get canShowSheetHome {
    if (maintenanceItem == MaintenanceItem.empty() ||
        maintenanceItem.orderList.isEmpty ||
        !isClosedTimeOrder) {
      return false;
    }

    return true;
  }

  bool get canShowSheetPayment {
    if (maintenanceItem == MaintenanceItem.empty() ||
        maintenanceItem.paymentList.isEmpty ||
        !isClosedTimePayment) {
      return false;
    }

    return true;
  }

  bool get canShowSheetReturn {
    if (maintenanceItem == MaintenanceItem.empty() ||
        maintenanceItem.returnList.isEmpty ||
        !isClosedTimeReturns) {
      return false;
    }

    return true;
  }
}

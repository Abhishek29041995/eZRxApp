import 'package:ezrxmobile/domain/announcement/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement.freezed.dart';

@freezed
class Announcement with _$Announcement {
  const Announcement._();

  const factory Announcement({
    required bool active,
    required List<AnnouncementMessage> descriptionList,
    required DateTimeStringValue startTime,
    required DateTimeStringValue endTime,
    required AnnouncementType type,
    required String day,
    required String functionLabel,
    required String id,
    required bool isModuleSpecific,
    required List<AnnouncementDislayModule> moduleName,
    required AnnouncementDislayTime loginType,
    required bool isCrossButton,
  }) = _Announcement;

  factory Announcement.empty() => Announcement(
        active: false,
        descriptionList: [],
        startTime: DateTimeStringValue(''),
        endTime: DateTimeStringValue(''),
        type: AnnouncementType(''),
        day: '',
        functionLabel: '',
        id: '',
        isModuleSpecific: false,
        moduleName: [],
        loginType: AnnouncementDislayTime(''),
        isCrossButton: false,
      );

  bool isValidModuleToDisplay({
    required String currentPath,
  }) {
    if (!isModuleSpecific) {
      return true;
    }

    return moduleName.any((moduleName) {
      if (moduleName.isReturn) {
        return currentPath.startsWith(AppModule.returns.name);
      }
      if (moduleName.isPayment) {
        return currentPath.startsWith(AppModule.payments.name);
      }
      if (moduleName.isOrder) {
        return currentPath.startsWith(AppModule.orders.name);
      }

      return false;
    });
  }

  String descriptionDisplay({
    required String languageCode,
  }) =>
      _isCustomAnnouncement
          ? descriptionList
              .firstWhere(
                (message) => message.languageCode == languageCode,
                orElse: () => AnnouncementMessage.empty(),
              )
              .announcement
          : descriptionList.first.announcement
              .replaceAll('\${startTime}', startTime.getValue())
              .replaceAll('\${endTime}', endTime.getValue())
              .replaceAll('\${day}', _dayDisplay)
              .replaceAll('\${functionLabel}', functionLabel);

  bool get _isCustomAnnouncement => descriptionList.length != 1;

  String get _dayDisplay =>
      !startTime.isValid() ? '' : startTime.getOrCrash().split(' ').first;

  bool get hasValidAnnouncement =>
      this != Announcement.empty() && active && !_isExpired;

  bool get _isExpired {
    if (startTime.isValid() && endTime.isValid()) {
      return DateTime.now().isAfter(endTime.dateTime) ||
          DateTime.now().isBefore(startTime.dateTime);
    }

    return true;
  }
}

@freezed
class AnnouncementMessage with _$AnnouncementMessage {
  const AnnouncementMessage._();

  const factory AnnouncementMessage({
    required String languageCode,
    required String language,
    required String announcement,
  }) = _AnnouncementMessage;

  factory AnnouncementMessage.empty() => const AnnouncementMessage(
        languageCode: '',
        language: '',
        announcement: '',
      );
}

enum AppModule {
  orders,
  returns,
  payments,
}

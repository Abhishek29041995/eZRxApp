import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/announcement/entities/announcement.dart';
import 'package:ezrxmobile/domain/announcement/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  String convertToString(DateTime dateTime) => DateFormat.yMd().add_jm().format(
        dateTime,
      );
  group('Announcement -', () {
    test('Display text when isn\'t custom type', () {
      const startTime = 'start-time';
      const endTime = 'end-time';
      const functionLabel = 'Test';

      final customAnnouncement = Announcement.empty().copyWith(
        startTime: DateTimeStringValue(startTime),
        endTime: DateTimeStringValue(endTime),
        functionLabel: functionLabel,
        descriptionList: [
          AnnouncementMessage.empty().copyWith(
            announcement:
                'eZRx and \${functionLabel} will be unavailable from \${startTime} to \${endTime} on \${day}',
          ),
        ],
      );

      expect(
        customAnnouncement.descriptionDisplay(languageCode: 'en  '),
        'eZRx and $functionLabel will be unavailable from $startTime to $endTime on ',
      );
    });

    test('Display text when is custom type', () {
      final customAnnouncement = Announcement.empty().copyWith(
        descriptionList: [
          AnnouncementMessage.empty()
              .copyWith(announcement: 'England', languageCode: 'en'),
          AnnouncementMessage.empty()
              .copyWith(announcement: 'Vietnam', languageCode: 'vi'),
        ],
      );

      expect(
        customAnnouncement.descriptionDisplay(languageCode: 'vi'),
        'Vietnam',
      );
    });

    test(
        'Display empty text when is custom type and can not find matching language code',
        () {
      final customAnnouncement = Announcement.empty().copyWith(
        descriptionList: [
          AnnouncementMessage.empty()
              .copyWith(announcement: 'England', languageCode: 'en'),
          AnnouncementMessage.empty()
              .copyWith(announcement: 'Vietnam', languageCode: 'vi'),
        ],
      );

      expect(
        customAnnouncement.descriptionDisplay(languageCode: 'fake-code'),
        '',
      );
    });

    test('Is invalid when Announcement.empty()', () {
      final customAnnouncement = Announcement.empty();

      expect(customAnnouncement.hasValidAnnouncement, false);
    });

    test('Is invalid when inactive', () {
      final customAnnouncement = Announcement.empty().copyWith(
        active: false,
        id: 'fake-id',
      );

      expect(customAnnouncement.hasValidAnnouncement, false);
    });

    test('Is invalid when now is before start date', () {
      final startTime = convertToString(
        DateTime.now().add(
          const Duration(days: 10),
        ),
      );

      final endTime = convertToString(
        DateTime.now().add(
          const Duration(days: 10),
        ),
      );

      final customAnnouncement = Announcement.empty().copyWith(
        startTime: DateTimeStringValue(startTime),
        endTime: DateTimeStringValue(endTime),
        active: true,
      );

      expect(customAnnouncement.hasValidAnnouncement, false);
    });

    test('Is invalid when now is after end date', () {
      final startTime = convertToString(
        DateTime.now().subtract(
          const Duration(days: 10),
        ),
      );
      final endTime = convertToString(
        DateTime.now().subtract(
          const Duration(days: 10),
        ),
      );

      final customAnnouncement = Announcement.empty().copyWith(
        startTime: DateTimeStringValue(startTime),
        endTime: DateTimeStringValue(endTime),
        active: true,
      );

      expect(customAnnouncement.hasValidAnnouncement, false);
    });

    test('Is invalid when can not parse date time', () {
      final customAnnouncement = Announcement.empty()
          .copyWith(startTime: DateTimeStringValue('error-time'), active: true);

      expect(customAnnouncement.hasValidAnnouncement, false);
    });

    test('Always display when module specific is true', () {
      final customAnnouncement =
          Announcement.empty().copyWith(isModuleSpecific: false);

      expect(
        customAnnouncement.isValidModuleToDisplay(currentPath: 'fake'),
        true,
      );
    });

    test('Display when module specific is return', () {
      final customAnnouncement = Announcement.empty().copyWith(
        isModuleSpecific: true,
        moduleName: [AnnouncementDislayModule('Returns')],
      );

      expect(
        customAnnouncement.isValidModuleToDisplay(
          currentPath: 'returns/fake-page',
        ),
        true,
      );
    });

    test('Display when module specific is order', () {
      final customAnnouncement = Announcement.empty().copyWith(
        isModuleSpecific: true,
        moduleName: [
          AnnouncementDislayModule('Returns'),
          AnnouncementDislayModule('Orders'),
        ],
      );

      expect(
        customAnnouncement.isValidModuleToDisplay(
          currentPath: 'orders/fake-page',
        ),
        true,
      );
    });

    test('Display when module specific is payment', () {
      final customAnnouncement = Announcement.empty().copyWith(
        isModuleSpecific: true,
        moduleName: [
          AnnouncementDislayModule('Payments'),
        ],
      );

      expect(
        customAnnouncement.isValidModuleToDisplay(
          currentPath: 'payments/fake-page',
        ),
        true,
      );
    });

    test('Not display when path does not contain any module name', () {
      final customAnnouncement = Announcement.empty().copyWith(
        isModuleSpecific: true,
        moduleName: [
          AnnouncementDislayModule('Returns'),
          AnnouncementDislayModule('Orders'),
        ],
      );

      expect(
        customAnnouncement.isValidModuleToDisplay(currentPath: 'fake-page'),
        false,
      );
    });
  });
}

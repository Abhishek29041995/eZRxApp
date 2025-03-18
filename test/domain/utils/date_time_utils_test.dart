import 'package:ezrxmobile/domain/utils/date_time_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final monday = DateTime(2023, 12, 25);
  group('Date time utils test', () {
    test('getNearestWorkingDate test for monday', () {
      expect(
        DateTimeUtils.getNearestWorkingDate(monday).weekday,
        DateTime.tuesday,
      );
    });

    test('getNearestWorkingDate test for tuesday', () {
      expect(
        DateTimeUtils.getNearestWorkingDate(
          monday.add(
            const Duration(days: 1),
          ),
        ).weekday,
        DateTime.wednesday,
      );
    });
    test('getNearestWorkingDate test for wednesday', () {
      expect(
        DateTimeUtils.getNearestWorkingDate(
          monday.add(
            const Duration(days: 2),
          ),
        ).weekday,
        DateTime.thursday,
      );
    });
    test('getNearestWorkingDate test for thursday', () {
      expect(
        DateTimeUtils.getNearestWorkingDate(
          monday.add(
            const Duration(days: 3),
          ),
        ).weekday,
        DateTime.friday,
      );
    });

    test('getNearestWorkingDate test for friday', () {
      expect(
        DateTimeUtils.getNearestWorkingDate(
          monday.add(
            const Duration(days: 4),
          ),
        ).weekday,
        DateTime.monday,
      );
    });

    test('getNearestWorkingDate test for saturday', () {
      expect(
        DateTimeUtils.getNearestWorkingDate(
          monday.add(
            const Duration(days: 5),
          ),
        ).weekday,
        DateTime.monday,
      );
    });

    test('getNearestWorkingDate test for sunday', () {
      expect(
        DateTimeUtils.getNearestWorkingDate(
          monday.add(
            const Duration(days: 6),
          ),
        ).weekday,
        DateTime.monday,
      );
    });

    test('addWorkingDay test', () {
      expect(
        DateTimeUtils.addWorkingDay(
          monday,
          6,
        ),
        DateTime(2024, 1, 2),
      );
    });
  });
}

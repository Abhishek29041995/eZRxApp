import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final fakeValidDate = DateTime.now();
  const fakeInvalidDate = 'fake';
  final fakeStatusType = StatusType('fake');

  group('ViewByOrderFilter entity -', () {
    test('date range getter', () {
      final fromDate = fakeValidDate.subtract(const Duration(days: 10));
      final toDate = fakeValidDate;
      final entity = ViewByOrdersFilter.empty().copyWith(
        orderDateFrom: DateTimeStringValue(fromDate.toIso8601String()),
        orderDateTo: DateTimeStringValue(toDate.toIso8601String()),
      );

      expect(
        entity.getOrderDateFilterDateRange,
        DateTimeRange(start: fromDate, end: toDate),
      );
    });

    test('filter count getter', () {
      final invalidDate = DateTimeStringValue(fakeInvalidDate);
      final validDate = DateTimeStringValue(fakeValidDate.toIso8601String());

      expect(ViewByOrdersFilter.empty().appliedFilterCount, 0);
      expect(
        ViewByOrdersFilter.empty()
            .copyWith(orderDateFrom: validDate, orderDateTo: invalidDate)
            .appliedFilterCount,
        0,
      );
      expect(
        ViewByOrdersFilter.empty()
            .copyWith(orderDateFrom: validDate, orderDateTo: validDate)
            .appliedFilterCount,
        1,
      );
      expect(
        ViewByOrdersFilter.empty()
            .copyWith(orderStatusList: [fakeStatusType]).appliedFilterCount,
        1,
      );
      expect(
        ViewByOrdersFilter.empty().copyWith(
          orderStatusList: [fakeStatusType],
          orderDateFrom: validDate,
          orderDateTo: validDate,
        ).appliedFilterCount,
        2,
      );
    });
  });
}

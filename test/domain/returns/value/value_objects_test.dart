import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const displayDate = '11 Oct 2022';

  group('DateTimeStringValue value object', () {
    test(
      '=> should return human readable date',
      () async {
        const input = '20221011';
        final simpleDate = DateTimeStringValue(input);
        final result = simpleDate.dateString;
        expect(result, displayDate);
      },
    );
  });

  group('InvoiceDate value object', () {
    test(
      'should return DateTimeStringValue',
      () async {
        final input = getDateStringByDateTime(DateTime.now());
        final simpleInvoiceDate = DateTimeStringValue(input);
        final validDateTime = simpleInvoiceDate.apiDateTimeString;
        expect(validDateTime, input);
      },
    );

    test(
      'should return Formated Date String (yyyyMMdd)',
      () async {
        final input = DateTime.now();
        final simpleInvoiceDate =
            DateTimeStringValue(getDateStringByDateTime(input));
        final apiParameterValueOrEmpty = simpleInvoiceDate.apiDateTimeString;
        expect(
          apiParameterValueOrEmpty,
          DateFormat(DateTimeFormatString.apiDateFormat).format(input),
        );
      },
    );
  });

  group('Test OverrideRole Value Object', () {
    test(
      'should return true when role is user',
      () async {
        const input = 'USEROVR';
        final overrideRole = OverrideRole(input);
        final result = overrideRole.isUser;
        expect(result, true);
      },
    );

    test(
      'should return false when role is empty Approver',
      () async {
        const input = 'Approver';
        final overrideRole = OverrideRole(input);
        final result = overrideRole.isUser;
        expect(result, false);
      },
    );

    test(
      'should return false when role is empty string',
      () async {
        const input = '';
        final overrideRole = OverrideRole(input);
        final result = overrideRole.isUser;
        expect(result, false);
      },
    );

    test(
      'should return true when role is Approver',
      () async {
        const input = 'Approver';
        final overrideRole = OverrideRole(input);
        final result = overrideRole.isApprover;
        expect(result, true);
      },
    );

    test(
      'should return false when role is user',
      () async {
        const input = 'USEROVR';
        final overrideRole = OverrideRole(input);
        final result = overrideRole.isApprover;
        expect(result, false);
      },
    );

    test(
      'should return false when role is empty string',
      () async {
        const input = '';
        final overrideRole = OverrideRole(input);
        final result = overrideRole.isApprover;
        expect(result, false);
      },
    );

    test(
      'should return `Updated at EZA` when StatusReason empty',
      () async {
        const input = '';
        final statusReason = StatusReason(input);
        final result = statusReason.getOrDefault;
        expect(result, 'Updated at EZA');
      },
    );
  });
}

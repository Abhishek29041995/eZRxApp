import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/available_credit_filter_dto.dart';

void main() {
  group('AvailableCreditFilter dto ', () {
    test('AvailableCreditFilter toMapList', () {
      final availableCreditFilter = AvailableCreditFilter(
        amountValueFrom: RangeValue('4'),
        amountValueTo: RangeValue('100'),
        documentDateFrom: DateTimeStringValue('20221011'),
        documentDateTo: DateTimeStringValue('20231011'),
        filterOption: FilterOption.documentDate(),
      );
      final availableCreditFilterDto =
          AvailableCreditFilterDto.fromDomain(availableCreditFilter);
      final toMapList = [
        {'field': 'documentDate', 'value': '2022-10-11', 'type': 'ge'},
        {'field': 'documentDate', 'value': '2023-10-11', 'type': 'le'},
        {'field': 'openAmountInTransCrcy', 'value': '-100.0', 'type': 'ge'},
        {'field': 'openAmountInTransCrcy', 'value': '-4.0', 'type': 'le'},
      ];
      expect(availableCreditFilterDto.toMapList, toMapList);
    });
  });
}

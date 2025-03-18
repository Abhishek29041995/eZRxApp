import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/outstanding_invoice_filter_dto.dart';

void main() {
  group('OutstandingInvoiceFilterDto dto ', () {
    test('OutstandingInvoiceFilterDto toMapList', () {
      final outstandingInvoiceFilter = OutstandingInvoiceFilter(
        amountValueFrom: RangeValue('0'),
        amountValueTo: RangeValue('100'),
        documentDateFrom: DateTimeStringValue('20221011'),
        documentDateTo: DateTimeStringValue('20231011'),
        dueDateFrom: DateTimeStringValue('20221011'),
        dueDateTo: DateTimeStringValue('20231011'),
        outstandingInvoiceStatus: StatusType('Pending'),
        filterOption: FilterOption.documentDate(),
      );
      final outstandingInvoiceFilterDto =
          OutstandingInvoiceFilterDto.fromDomain(outstandingInvoiceFilter);
      final toMapList = [
        {'field': 'netDueDate', 'value': '2022-10-11', 'type': 'ge'},
        {'field': 'netDueDate', 'value': '2023-10-11', 'type': 'le'},
        {'field': 'postingDate', 'value': '2022-10-11', 'type': 'ge'},
        {'field': 'postingDate', 'value': '2023-10-11', 'type': 'le'},
        {'field': 'openAmountInTransCrcy', 'value': '0.0', 'type': 'ge'},
        {'field': 'openAmountInTransCrcy', 'value': '100.0', 'type': 'le'},
        {'field': 'status', 'value': 'Pending'},
      ];
      expect(outstandingInvoiceFilterDto.toMapList, toMapList);
    });
  });
}

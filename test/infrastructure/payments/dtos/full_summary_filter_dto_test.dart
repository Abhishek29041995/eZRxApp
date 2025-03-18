import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/full_summary_filter.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/full_summary_filter_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final fakeDueDateFrom = DateTimeStringValue('2023-12-10');
  final fakeDueDateTo = DateTimeStringValue('2023-12-18');
  final fakeDocumentDateFrom = DateTimeStringValue('2023-12-10');
  final fakeDocumentDateTo = DateTimeStringValue('2023-12-18');
  const fakeFilterStatuses = [
    'fake-first-filter-status',
    'fake--second-filter-status',
  ];

  const fakeSearchKey = 'fake-search-key';

  group('=> All Credits And Invoices dto ', () {
    test('=> FullSummaryFilterDto fromDomain', () {
      final fullSummaryFilterDto = FullSummaryFilterDto.fromDomain(
        FullSummaryFilter(
          dueDateFrom: fakeDueDateFrom,
          dueDateTo: fakeDueDateTo,
          documentDateFrom: fakeDocumentDateFrom,
          documentDateTo: fakeDocumentDateTo,
          filterStatuses: fakeFilterStatuses,
          searchKey: SearchKey.search(fakeSearchKey),
          filterOption: FilterOption(''),
        ),
      );

      expect(
        fullSummaryFilterDto.searchKey,
        fakeSearchKey,
      );
      expect(
        fullSummaryFilterDto.dueDateFrom,
        fakeDueDateFrom.apiDateWithDashString,
      );
      expect(
        fullSummaryFilterDto.dueDateTo,
        fakeDueDateTo.apiDateWithDashString,
      );
      expect(
        fullSummaryFilterDto.documentDateFrom,
        fakeDocumentDateFrom.apiDateWithDashString,
      );
      expect(
        fullSummaryFilterDto.documentDateTo,
        fakeDocumentDateTo.apiDateWithDashString,
      );
      expect(
        fullSummaryFilterDto.filterStatuses,
        fakeFilterStatuses.join(','),
      );
    });

    test('=> FullSummaryFilterDto toMapList', () {
      final fullSummaryFilterDto = FullSummaryFilterDto.fromDomain(
        FullSummaryFilter(
          dueDateFrom: fakeDueDateFrom,
          dueDateTo: fakeDueDateTo,
          documentDateFrom: fakeDocumentDateFrom,
          documentDateTo: fakeDocumentDateTo,
          filterStatuses: fakeFilterStatuses,
          searchKey: SearchKey.search(fakeSearchKey),
          filterOption: FilterOption(''),
        ),
      );

      final expectMapList = [
        {
          'field': 'documentDate',
          'value': fullSummaryFilterDto.documentDateFrom,
          'type': 'ge',
        },
        {
          'field': 'documentDate',
          'value': fullSummaryFilterDto.documentDateTo,
          'type': 'le',
        },
        {
          'field': 'netDueDate',
          'value': fullSummaryFilterDto.dueDateFrom,
          'type': 'ge',
        },
        {
          'field': 'netDueDate',
          'value': fullSummaryFilterDto.dueDateTo,
          'type': 'le',
        },
        {
          'field': 'invoiceProcessingStatus',
          'value': fullSummaryFilterDto.filterStatuses,
        },
        {
          'field': 'accountingDocument',
          'value': fullSummaryFilterDto.searchKey,
        },
      ];

      expect(
        fullSummaryFilterDto.toMapList,
        expectMapList,
      );
    });
  });
}

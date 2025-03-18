import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/full_summary_filter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Full Summary Filter', () {
    final dueDateFrom = DateTimeStringValue('fake-due-date-from');
    final dueDateTo = DateTimeStringValue('fake-due-date-to');
    final documentDateFrom = DateTimeStringValue('fake-document-date-from');
    final documentDateTo = DateTimeStringValue('fake-document-date-to');
    final filterStatuses = ['fake-filter-status'];
    final searchKey = SearchKey.search('fake-search-key');
    final fullSummaryFilter = FullSummaryFilter.defaultFilter().copyWith(
      dueDateFrom: dueDateFrom,
      dueDateTo: dueDateTo,
      documentDateFrom: documentDateFrom,
      documentDateTo: documentDateTo,
      filterStatuses: filterStatuses,
      searchKey: searchKey,
    );

    expect(
      fullSummaryFilter.dueDateFrom,
      dueDateFrom,
    );
    expect(
      fullSummaryFilter.dueDateTo,
      dueDateTo,
    );
    expect(
      fullSummaryFilter.documentDateFrom,
      documentDateFrom,
    );
    expect(
      fullSummaryFilter.documentDateTo,
      documentDateTo,
    );
    expect(
      fullSummaryFilter.filterStatuses,
      filterStatuses,
    );
    expect(
      fullSummaryFilter.searchKey,
      searchKey,
    );
  });
}

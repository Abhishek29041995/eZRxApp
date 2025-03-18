import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_invoices_filter.freezed.dart';

@freezed
class AllInvoicesFilter with _$AllInvoicesFilter {
  const AllInvoicesFilter._();
  factory AllInvoicesFilter({
    required DateTimeStringValue dueDateFrom,
    required DateTimeStringValue dueDateTo,
    required DateTimeStringValue documentDateFrom,
    required DateTimeStringValue documentDateTo,
    required RangeValue amountValueFrom,
    required RangeValue amountValueTo,
    required List<String> filterStatuses,
    required SearchKey searchKey,
    required FilterOption filterOption,
  }) = _AllInvoicesFilter;

  factory AllInvoicesFilter.empty() => AllInvoicesFilter(
        dueDateFrom: DateTimeStringValue(''),
        dueDateTo: DateTimeStringValue(''),
        documentDateFrom: DateTimeStringValue(
        '',
        ),
        documentDateTo: DateTimeStringValue(
         '',
        ),
        amountValueFrom: RangeValue(''),
        amountValueTo: RangeValue(''),
        filterStatuses: <String>[],
        searchKey: SearchKey.empty(),
        filterOption: FilterOption(''),
      );

  factory AllInvoicesFilter.defaultFilter() => AllInvoicesFilter(
        dueDateFrom: DateTimeStringValue(''),
        dueDateTo: DateTimeStringValue(''),
        documentDateFrom: DateTimeStringValue(
          getDateStringByDateTime(
            DateTime.now().subtract(
              const Duration(days: 90),
            ),
          ),
        ),
        documentDateTo: DateTimeStringValue(
          getDateStringByDateTime(DateTime.now()),
        ),
        amountValueFrom: RangeValue(''),
        amountValueTo: RangeValue(''),
        filterStatuses: <String>[],
        searchKey: SearchKey.empty(),
        filterOption: FilterOption.documentDate(),
      );

  AllInvoicesFilter get excludeSearch => copyWith(
        searchKey: SearchKey.empty(),
      );

  DateTimeRange get getDueDateFilterDateRange => DateTimeRange(
        start: dueDateFrom.dateTime,
        end: dueDateTo.dateTime,
      );

  DateTimeRange get getDocumentDateFilterDateRange => DateTimeRange(
        start: documentDateFrom.dateTime,
        end: documentDateTo.dateTime,
      );

  int get appliedFilterCount {
    var count = 0;
    if (filterStatuses.isNotEmpty) {
      count += 1;
    }
    if (dueDateFrom.isValid() || dueDateTo.isValid()) {
      count += 1;
    }
    if (documentDateFrom.isValid() || documentDateTo.isValid()) {
      count += 1;
    }
    if (amountValueFrom.isValid() || amountValueTo.isValid()) {
      count += 1;
    }

    return count;
  }

  bool get isValid => anyFilterApplied && isAmountValueRangeValid;

  bool get isAmountValueRangeValid =>
      !RangeValue.checkIfAnyIsEmpty(amountValueFrom, amountValueTo) &&
      RangeValue.checkIfRangeIsValid(amountValueFrom, amountValueTo);

  bool get anyFilterApplied => appliedFilterCount > 0;
}

import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_summary_filter.freezed.dart';

@freezed
class PaymentSummaryFilter with _$PaymentSummaryFilter {
  const PaymentSummaryFilter._();
  factory PaymentSummaryFilter({
    required DateTimeStringValue createdDateFrom,
    required DateTimeStringValue createdDateTo,
    required RangeValue amountValueFrom,
    required RangeValue amountValueTo,
    required List<FilterStatus> filterStatuses,
    required SearchKey searchKey,
    required FilterOption filterOption,
  }) = _PaymentSummaryFilter;

  factory PaymentSummaryFilter.empty() => PaymentSummaryFilter(
        createdDateFrom: DateTimeStringValue(
          '',
        ),
        createdDateTo: DateTimeStringValue(
          '',
        ),
        amountValueFrom: RangeValue(''),
        amountValueTo: RangeValue(''),
        filterStatuses: <FilterStatus>[],
        searchKey: SearchKey.empty(),
        filterOption: FilterOption(''),
      );

  factory PaymentSummaryFilter.defaultFilter() => PaymentSummaryFilter(
        createdDateFrom: DateTimeStringValue(
          getDateStringByDateTime(
            DateTime.now().subtract(
              const Duration(days: 90),
            ),
          ),
        ),
        createdDateTo: DateTimeStringValue(
          getDateStringByDateTime(DateTime.now()),
        ),
        amountValueFrom: RangeValue(''),
        amountValueTo: RangeValue(''),
        filterStatuses: <FilterStatus>[],
        searchKey: SearchKey.empty(),
        filterOption: FilterOption.documentDate(),
      );

  PaymentSummaryFilter get excludeSearch => copyWith(
        searchKey: SearchKey.empty(),
      );

  DateTimeRange get getCreatedDateFilterDateRange => DateTimeRange(
        start: createdDateFrom.dateTime,
        end: createdDateTo.dateTime,
      );

  int get appliedFilterCount {
    var count = 0;
    if (filterStatuses.isNotEmpty) {
      count += 1;
    }
    if (createdDateFrom.isValid() || createdDateTo.isValid()) {
      count += 1;
    }
    if (amountValueFrom.isValid() || amountValueTo.isValid()) {
      count += 1;
    }

    return count;
  }

  bool get isValid => isAmountValueRangeValid;

  bool get isAmountValueRangeValid =>
      !RangeValue.checkIfAnyIsEmpty(amountValueFrom, amountValueTo) &&
      RangeValue.checkIfRangeIsValid(amountValueFrom, amountValueTo);

  bool get anyFilterApplied => appliedFilterCount > 0;
}

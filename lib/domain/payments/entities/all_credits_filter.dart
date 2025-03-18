import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_credits_filter.freezed.dart';

@freezed
class AllCreditsFilter with _$AllCreditsFilter {
  const AllCreditsFilter._();
  factory AllCreditsFilter({
    required DateTimeStringValue documentDateFrom,
    required DateTimeStringValue documentDateTo,
    required RangeValue amountValueFrom,
    required RangeValue amountValueTo,
    required List<String> filterStatuses,
    required SearchKey searchKey,
    required FilterOption filterOption,
  }) = _AllCreditsFilter;

  factory AllCreditsFilter.empty() => AllCreditsFilter(
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

  factory AllCreditsFilter.defaultFilter() => AllCreditsFilter(
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

  DateTimeRange get getDocumentDateFilterDateRange => DateTimeRange(
        start: documentDateFrom.dateTime,
        end: documentDateTo.dateTime,
      );

  int get appliedFilterCount {
    var count = 0;
    if (filterStatuses.isNotEmpty) {
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

  AllCreditsFilter get excludeSearch => copyWith(
        searchKey: SearchKey.empty(),
      );
}

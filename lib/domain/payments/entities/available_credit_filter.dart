import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';

part 'available_credit_filter.freezed.dart';

@freezed
class AvailableCreditFilter with _$AvailableCreditFilter {
  const AvailableCreditFilter._();
  factory AvailableCreditFilter({
    required DateTimeStringValue documentDateFrom,
    required DateTimeStringValue documentDateTo,
    required RangeValue amountValueFrom,
    required RangeValue amountValueTo,
        required FilterOption filterOption,

  }) = _AvailableCreditFilter;

   factory AvailableCreditFilter.empty() => AvailableCreditFilter(
        documentDateFrom: DateTimeStringValue(
         '',
        ),
        documentDateTo: DateTimeStringValue(
          '',
        ),
        amountValueFrom: RangeValue(''),
        amountValueTo: RangeValue(''),
        filterOption: FilterOption(''),
      );

  factory AvailableCreditFilter.defaultFilter() => AvailableCreditFilter(
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
        filterOption: FilterOption.documentDate(),
      );

  DateTimeRange get getDocumentDateFilterDateRange => DateTimeRange(
        start: documentDateFrom.dateTime,
        end: documentDateTo.dateTime,
      );

  bool get isAvailableCreditAmountValueRangeValid =>
      !RangeValue.checkIfAnyIsEmpty(amountValueFrom, amountValueTo) &&
      RangeValue.checkIfRangeIsValid(amountValueFrom, amountValueTo);

  int get appliedFilterCount {
    var count = 0;
    if (documentDateFrom.isValid() || documentDateTo.isValid()) {
      count += 1;
    }
    if (amountValueFrom != RangeValue('') && amountValueTo != RangeValue('')) {
      count += 1;
    }

    return count;
  }

  List<String> get trackingInfo => [
        if (documentDateFrom.isValid() && documentDateTo.isValid())
          'Document date from ${documentDateFrom.dateOrNaString} to ${documentDateTo.dateOrNaString}',
        if (amountValueFrom.isValid() && amountValueTo.isValid())
          'Amount range from ${amountValueFrom.apiParameterValue} to ${amountValueTo.apiParameterValue}',
      ];
}

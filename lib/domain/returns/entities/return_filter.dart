import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';

part 'return_filter.freezed.dart';

@freezed
class ReturnFilter with _$ReturnFilter {
  const ReturnFilter._();
  factory ReturnFilter({
    required DateTimeStringValue returnDateFrom,
    required DateTimeStringValue returnDateTo,
    required RangeValue amountValueFrom,
    required RangeValue amountValueTo,
    required List<StatusType> returnStatusList,
    required MaterialOriginFilter materialOriginFilter,
  }) = _ReturnFilter;

  factory ReturnFilter.empty() => ReturnFilter(
        returnDateFrom: DateTimeStringValue(''),
        returnDateTo: DateTimeStringValue(''),
        amountValueFrom: RangeValue(''),
        amountValueTo: RangeValue(''),
        returnStatusList: <StatusType>[],
        materialOriginFilter: MaterialOriginFilter.all(),
      );

  DateTimeRange get getReturnDateFilterDateRange => DateTimeRange(
        start: returnDateFrom.dateTime,
        end: returnDateTo.dateTime,
      );

  bool get isReturnAmountValueRangeValid =>
      !RangeValue.checkIfAnyIsEmpty(amountValueFrom, amountValueTo) &&
      RangeValue.checkIfRangeIsValid(amountValueFrom, amountValueTo);

  int get appliedFilterCount {
    var count = 0;
    if (returnDateFrom.isValid() && returnDateTo.isValid()) {
      count += 1;
    }
    if (returnStatusList.isNotEmpty) {
      count += 1;
    }
    if (amountValueFrom != RangeValue('') && amountValueTo != RangeValue('')) {
      count += 1;
    }

    return count;
  }

  List<String> get trackingInfo => [
        if (returnDateFrom.isValid() && returnDateTo.isValid())
          'Request date from ${returnDateFrom.dateOrNaString} to ${returnDateTo.dateOrNaString}',
        if (amountValueFrom.isValid() && amountValueTo.isValid())
          'Request amount from ${amountValueFrom.apiParameterValue} to ${amountValueTo.apiParameterValue}',
        ...returnStatusList.map((e) => e.getOrDefaultValue('')),
      ];
}

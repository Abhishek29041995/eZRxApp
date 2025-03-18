import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'soa_filter.freezed.dart';

@freezed
class SoaFilter with _$SoaFilter {
  const SoaFilter._();
  factory SoaFilter({
    required DateTimeStringValue toDate,
    required DateTimeStringValue fromDate,
  }) = _SoaFilter;

  factory SoaFilter.empty() => SoaFilter(
        fromDate: DateTimeStringValue(''),
        toDate: DateTimeStringValue(''),
      );

  bool get isAppliedFilterMonthRangeValid =>
      toDate.dateTime.isAfter(fromDate.dateTime) ||
      DateUtils.isSameMonth(toDate.dateTime, fromDate.dateTime);

  bool get isAppliedFilterValid => toDate.isValid() && fromDate.isValid();

  int get appliedFilterCount => isAppliedFilterValid ? 1 : 0;
}

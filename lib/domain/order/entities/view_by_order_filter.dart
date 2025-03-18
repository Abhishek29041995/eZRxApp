import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_by_order_filter.freezed.dart';

@freezed
class ViewByOrdersFilter with _$ViewByOrdersFilter {
  const ViewByOrdersFilter._();
  factory ViewByOrdersFilter({
    required DateTimeStringValue orderDateFrom,
    required DateTimeStringValue orderDateTo,
    required List<StatusType> orderStatusList,
    required MaterialOriginFilter orderHistoryType,
  }) = _ViewByOrderHistoryFilter;

  factory ViewByOrdersFilter.empty() => ViewByOrdersFilter(
        orderDateFrom: DateTimeStringValue(''),
        orderDateTo: DateTimeStringValue(''),
        orderStatusList: <StatusType>[],
        orderHistoryType: MaterialOriginFilter.all(),
      );

  DateTimeRange get getOrderDateFilterDateRange => DateTimeRange(
        start: orderDateFrom.dateTime,
        end: orderDateTo.dateTime,
      );

  int get appliedFilterCount {
    var filterCount = 0;
    if (orderDateFrom.isValid() && orderDateTo.isValid()) filterCount++;
    if (orderStatusList.isNotEmpty) filterCount++;

    return filterCount;
  }
}

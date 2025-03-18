import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'full_summary_filter.freezed.dart';

@freezed
class FullSummaryFilter with _$FullSummaryFilter {
  const FullSummaryFilter._();
  factory FullSummaryFilter({
    required DateTimeStringValue dueDateFrom,
    required DateTimeStringValue dueDateTo,
    required DateTimeStringValue documentDateFrom,
    required DateTimeStringValue documentDateTo,
    required List<String> filterStatuses,
    required SearchKey searchKey,
    required FilterOption filterOption,
  }) = _FullSummaryFilter;

  factory FullSummaryFilter.empty() => FullSummaryFilter(
        dueDateFrom: DateTimeStringValue(''),
        dueDateTo: DateTimeStringValue(''),
        documentDateFrom: DateTimeStringValue(
          '',
        ),
        documentDateTo: DateTimeStringValue(
          '',
        ),
        filterStatuses: <String>[],
        searchKey: SearchKey.empty(),
        filterOption: FilterOption(''),
      );

  factory FullSummaryFilter.defaultFilter() => FullSummaryFilter(
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
        filterStatuses: <String>[],
        searchKey: SearchKey.empty(),
        filterOption: FilterOption.documentDate(),
      );

  FullSummaryFilter get excludeSearch => copyWith(
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

    return count;
  }

  bool get isValid => appliedFilterCount > 0;

  bool get isEmpty => !isValid && searchKey.isValueEmpty;
}

import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/payments/full_summary/filter/full_summary_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/full_summary_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const fakeStatus = 'fake-status';
  final fakeFullSummaryFilter = FullSummaryFilter.defaultFilter();
  final fakeDateRange = DateTimeRange(
    start: DateTime.now().subtract(const Duration(days: 7)),
    end: DateTime.now(),
  );
  group(
    'Full Summary Filter Bloc Test',
    () {
      blocTest(
        'Initialize',
        build: () => FullSummaryFilterBloc(),
        act: (FullSummaryFilterBloc bloc) => bloc.add(
          const FullSummaryFilterEvent.initialized(),
        ),
        expect: () => [
          FullSummaryFilterState.initial(),
        ],
      );

      blocTest(
        'Open Bottom Sheet',
        build: () => FullSummaryFilterBloc(),
        act: (FullSummaryFilterBloc bloc) => bloc.add(
          FullSummaryFilterEvent.openFilterBottomSheet(
            appliedFilter: fakeFullSummaryFilter,
          ),
        ),
        expect: () => [
          FullSummaryFilterState.initial().copyWith(
            showErrorMessages: false,
            filter: fakeFullSummaryFilter,
          ),
        ],
      );

      blocTest(
        'Validate Filter',
        build: () => FullSummaryFilterBloc(),
        act: (FullSummaryFilterBloc bloc) => bloc.add(
          const FullSummaryFilterEvent.validateFilters(),
        ),
        expect: () => [
          FullSummaryFilterState.initial().copyWith(
            showErrorMessages: false,
          ),
        ],
      );

      blocTest(
        'Status Changed',
        build: () => FullSummaryFilterBloc(),
        act: (FullSummaryFilterBloc bloc) => bloc.add(
          const FullSummaryFilterEvent.statusChanged(fakeStatus, true),
        ),
        expect: () => [
          FullSummaryFilterState.initial().copyWith(
            filter: FullSummaryFilter.empty().copyWith(
              filterStatuses: [fakeStatus],
              filterOption: FilterOption.status(),
            ),
          ),
        ],
      );

      blocTest(
        'Set Due Date',
        build: () => FullSummaryFilterBloc(),
        act: (FullSummaryFilterBloc bloc) => bloc.add(
          FullSummaryFilterEvent.setDueDate(fakeDateRange),
        ),
        seed: () => FullSummaryFilterState.initial().copyWith(
          filter: fakeFullSummaryFilter,
        ),
        expect: () => [
          FullSummaryFilterState.initial().copyWith(
            filter: FullSummaryFilter.empty().copyWith(
              filterOption: FilterOption.dueDate(),
              dueDateFrom: DateTimeStringValue(
                getDateStringByDateTime(fakeDateRange.start),
              ),
              dueDateTo: DateTimeStringValue(
                getDateStringByDateTime(fakeDateRange.end),
              ),
            ),
            showErrorMessages: false,
          ),
        ],
      );

      blocTest(
        'Set Document Date',
        build: () => FullSummaryFilterBloc(),
        act: (FullSummaryFilterBloc bloc) => bloc.add(
          FullSummaryFilterEvent.setDocumentDate(fakeDateRange),
        ),
        seed: () => FullSummaryFilterState.initial().copyWith(
          filter: fakeFullSummaryFilter,
        ),
        expect: () => [
          FullSummaryFilterState.initial().copyWith(
            filter: FullSummaryFilter.empty().copyWith(
              filterOption: FilterOption.documentDate(),
              documentDateFrom: DateTimeStringValue(
                getDateStringByDateTime(fakeDateRange.start),
              ),
              documentDateTo: DateTimeStringValue(
                getDateStringByDateTime(fakeDateRange.end),
              ),
            ),
            showErrorMessages: false,
          ),
        ],
      );
    },
  );
}

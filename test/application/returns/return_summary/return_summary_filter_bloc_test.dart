import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/returns/return_summary_filter/return_summary_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  late ReturnSummaryFilter returnSummaryFilter;
  final fakeToDate = DateTime.parse(
    DateFormat('yyyyMMdd').format(
      DateTime.now(),
    ),
  );

  final fakeFromDate = DateTime.parse(
    DateFormat('yyyyMMdd').format(
      DateTime.now().subtract(
        const Duration(days: 28),
      ),
    ),
  );
  final dateTimeRange = DateTimeRange(
    start: fakeFromDate,
    end: fakeToDate,
  );
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    returnSummaryFilter = ReturnSummaryFilter.empty().copyWith(
      dateFrom: DateTimeStringValue(
        getDateStringByDateTime(fakeFromDate),
      ),
      dateTo: DateTimeStringValue(
        getDateStringByDateTime(fakeToDate),
      ),
      sortBy: StatusType('Active'),
      requestId: SearchKey.search('mock_id'),
      refundTotalTo: RangeValue('100'),
      refundTotalFrom: RangeValue('1000'),
    );
  });

  group(
    'Return Summary Filter Bloc',
    () {
      blocTest(
        'Initialize',
        build: () => ReturnSummaryFilterBloc(),
        act: (ReturnSummaryFilterBloc bloc) =>
            bloc.add(const ReturnSummaryFilterEvent.initialized()),
        expect: () => [
          isA<ReturnSummaryFilterState>(),
        ],
      );

      blocTest(
        'FilterReturnSummary success',
        build: () => ReturnSummaryFilterBloc(),
        seed: () => ReturnSummaryFilterState.initial().copyWith(
          returnSummaryFilter: ReturnSummaryFilter.empty().copyWith(
            dateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
            dateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            sortBy: StatusType('Active'),
            requestId: SearchKey.search('mock_id'),
          ),
        ),
        act: (ReturnSummaryFilterBloc bloc) =>
            bloc.add(const ReturnSummaryFilterEvent.applyFilters()),
        expect: () => [
          ReturnSummaryFilterState.initial().copyWith(
            returnSummaryFilter: ReturnSummaryFilter.empty().copyWith(
              dateFrom: DateTimeStringValue(
                getDateStringByDateTime(fakeFromDate),
              ),
              dateTo: DateTimeStringValue(
                getDateStringByDateTime(fakeToDate),
              ),
              sortBy: StatusType('Active'),
              requestId: SearchKey.search('mock_id'),
            ),
            isSubmitting: true,
          ),
        ],
      );

      blocTest(
        'FilterReturnSummary failure',
        build: () => ReturnSummaryFilterBloc(),
        seed: () => ReturnSummaryFilterState.initial().copyWith(
          returnSummaryFilter: returnSummaryFilter,
        ),
        act: (ReturnSummaryFilterBloc bloc) =>
            bloc.add(const ReturnSummaryFilterEvent.applyFilters()),
        expect: () => [
          ReturnSummaryFilterState.initial().copyWith(
            returnSummaryFilter: returnSummaryFilter,
            isSubmitting: false,
            showErrorMessages: true,
          ),
        ],
      );

      blocTest(
        'ReturnIdChanged',
        build: () => ReturnSummaryFilterBloc(),
        seed: () => ReturnSummaryFilterState.initial().copyWith(
          returnSummaryFilter: returnSummaryFilter,
        ),
        act: (ReturnSummaryFilterBloc bloc) => bloc.add(
          const ReturnSummaryFilterEvent.returnIdChanged('mock_returnId'),
        ),
        expect: () => [
          ReturnSummaryFilterState.initial().copyWith(
            returnSummaryFilter: returnSummaryFilter.copyWith(
              requestId: SearchKey.search('mock_returnId'),
            ),
            showErrorMessages: false,
          ),
        ],
      );

      blocTest(
        'RefundTotalToChanged',
        build: () => ReturnSummaryFilterBloc(),
        seed: () => ReturnSummaryFilterState.initial().copyWith(
          returnSummaryFilter: returnSummaryFilter,
        ),
        act: (ReturnSummaryFilterBloc bloc) => bloc
            .add(const ReturnSummaryFilterEvent.refundTotalToChanged('1000')),
        expect: () => [
          ReturnSummaryFilterState.initial().copyWith(
            returnSummaryFilter: returnSummaryFilter.copyWith(
              refundTotalTo: RangeValue('1000'),
            ),
            showErrorMessages: false,
          ),
        ],
      );

      blocTest(
        'RefundTotalFromChanged',
        build: () => ReturnSummaryFilterBloc(),
        seed: () => ReturnSummaryFilterState.initial().copyWith(
          returnSummaryFilter: returnSummaryFilter,
        ),
        act: (ReturnSummaryFilterBloc bloc) => bloc
            .add(const ReturnSummaryFilterEvent.refundTotalFromChanged('100')),
        expect: () => [
          ReturnSummaryFilterState.initial().copyWith(
            returnSummaryFilter: returnSummaryFilter.copyWith(
              refundTotalFrom: RangeValue('100'),
            ),
            showErrorMessages: false,
          ),
        ],
      );

      blocTest(
        'CheckedStatusFilter',
        build: () => ReturnSummaryFilterBloc(),
        seed: () => ReturnSummaryFilterState.initial().copyWith(
          returnSummaryFilter: returnSummaryFilter,
        ),
        act: (ReturnSummaryFilterBloc bloc) => bloc.add(
          ReturnSummaryFilterEvent.sortByChanged(sortBy: StatusType('All')),
        ),
        expect: () => [
          ReturnSummaryFilterState.initial().copyWith(
            returnSummaryFilter: returnSummaryFilter.copyWith(
              sortBy: StatusType('All'),
            ),
          ),
        ],
      );

      blocTest(
        'SetSubmittedDate',
        build: () => ReturnSummaryFilterBloc(),
        act: (ReturnSummaryFilterBloc bloc) {
          bloc.add(
            ReturnSummaryFilterEvent.setSubmittedDate(
              submittedDateRange: dateTimeRange,
            ),
          );
        },
        expect: () => [
          ReturnSummaryFilterState.initial().copyWith(
            returnSummaryFilter: ReturnSummaryFilter.empty().copyWith(
              dateFrom: DateTimeStringValue(
                getDateStringByDateTime(fakeFromDate),
              ),
              dateTo: DateTimeStringValue(
                getDateStringByDateTime(fakeToDate),
              ),
            ),
            showErrorMessages: false,
          ),
        ],
      );
    },
  );
}

import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/returns/new_request/return_items/filter/return_items_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/returns/entities/return_items_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final fakeFromDate = DateTimeStringValue(
    getDateStringByDateTime(
      DateTime.now().subtract(const Duration(days: 365)),
    ),
  );
  final fakeToDate =
      DateTimeStringValue(getDateStringByDateTime(DateTime.now()));
  final fakeDateTimeRange = DateTimeRange(
    start: DateTime.now().subtract(const Duration(days: 65)),
    end: DateTime.now(),
  );

  final fakeReturnItemsFilter = ReturnItemsFilter.empty()
      .copyWith(invoiceDateFrom: fakeFromDate, invoiceDateTo: fakeToDate);

  group('Return Items Filter Bloc', () {
    blocTest(
      'Initialize',
      build: () => ReturnItemsFilterBloc(),
      act: (ReturnItemsFilterBloc bloc) => bloc.add(
        const ReturnItemsFilterEvent.initialized(),
      ),
      expect: () => [
        ReturnItemsFilterState.initial(),
      ],
    );

    blocTest(
      'Set Invoice Date Event',
      build: () => ReturnItemsFilterBloc(),
      act: (ReturnItemsFilterBloc bloc) => bloc.add(
        ReturnItemsFilterEvent.setInvoiceDate(fakeDateTimeRange),
      ),
      expect: () => [
        ReturnItemsFilterState.initial().copyWith(
          filter: fakeReturnItemsFilter.copyWith(
            invoiceDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeDateTimeRange.start),
            ),
            invoiceDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeDateTimeRange.end),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'Open Filter BottomSheet Event',
      build: () => ReturnItemsFilterBloc(),
      seed: () => ReturnItemsFilterState.initial().copyWith(
        filter: fakeReturnItemsFilter.copyWith(
          invoiceDateFrom: DateTimeStringValue(
            getDateStringByDateTime(
              DateTime.now().subtract(const Duration(days: 65)),
            ),
          ),
        ),
      ),
      act: (ReturnItemsFilterBloc bloc) => bloc.add(
        ReturnItemsFilterEvent.openFilterBottomSheet(
          appliedFilter: fakeReturnItemsFilter,
        ),
      ),
      expect: () => [
        ReturnItemsFilterState.initial().copyWith(
          filter: fakeReturnItemsFilter,
        ),
      ],
    );
  });
}

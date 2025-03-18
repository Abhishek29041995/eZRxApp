import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/returns/new_request/return_items/filter/return_items_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/returns/entities/return_items_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ReturnItemsFilterState initState;
  late ReturnItemsFilter fakeReturnItemsFilter;
  late DateTimeRange fakeDateTimeRange;

  setUpAll(() {
    initState = ReturnItemsFilterState.initial();
    fakeReturnItemsFilter = ReturnItemsFilter.init();
    fakeDateTimeRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(const Duration(days: 1)),
    );
  });

  group('Return Items Filter Bloc Testing =>', () {
    blocTest<ReturnItemsFilterBloc, ReturnItemsFilterState>(
      'For initialized event',
      build: () => ReturnItemsFilterBloc(),
      act: (ReturnItemsFilterBloc bloc) => bloc.add(
        const ReturnItemsFilterEvent.initialized(),
      ),
      expect: () => [
        initState,
      ],
    );

    blocTest<ReturnItemsFilterBloc, ReturnItemsFilterState>(
      'For open filter bottom sheet event',
      build: () => ReturnItemsFilterBloc(),
      act: (ReturnItemsFilterBloc bloc) => bloc.add(
        ReturnItemsFilterEvent.openFilterBottomSheet(
          appliedFilter: fakeReturnItemsFilter,
        ),
      ),
      expect: () => [
        initState.copyWith(
          filter: fakeReturnItemsFilter,
        ),
      ],
    );

    blocTest<ReturnItemsFilterBloc, ReturnItemsFilterState>(
      'For set invoice date event',
      build: () => ReturnItemsFilterBloc(),
      act: (ReturnItemsFilterBloc bloc) => bloc.add(
        ReturnItemsFilterEvent.setInvoiceDate(
          fakeDateTimeRange,
        ),
      ),
      expect: () => [
        initState.copyWith(
          filter: initState.filter.copyWith(
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
  });
}

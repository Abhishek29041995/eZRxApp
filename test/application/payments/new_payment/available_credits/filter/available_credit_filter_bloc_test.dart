import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/filter/available_credit_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final availableCreditFilterState = AvailableCreditFilterState.initial();

  group(
    'Available_Credit_Filter_Bloc Test => ',
    () {
      blocTest<AvailableCreditFilterBloc, AvailableCreditFilterState>(
        'For "initialize" Event',
        build: () => AvailableCreditFilterBloc(),
        act: (bloc) => bloc.add(const AvailableCreditFilterEvent.initialize()),
        expect: () => [availableCreditFilterState],
      );

      blocTest<AvailableCreditFilterBloc, AvailableCreditFilterState>(
        'For "setDocumentDate" Event',
        build: () => AvailableCreditFilterBloc(),
        act: (bloc) => bloc.add(
          AvailableCreditFilterEvent.setDocumentDate(
            documentDateRange: DateTimeRange(
              start: DateTime.now().subtract(
                const Duration(days: 7),
              ),
              end: DateTime.now(),
            ),
          ),
        ),
        expect: () => [
          availableCreditFilterState.copyWith(
            filter: availableCreditFilterState.filter.copyWith(
              documentDateFrom: DateTimeStringValue(
                getDateStringByDateTime(
                  DateTime.now().subtract(
                    const Duration(days: 7),
                  ),
                ),
              ),
              documentDateTo: DateTimeStringValue(
                getDateStringByDateTime(
                  DateTime.now(),
                ),
              ),
            ),
          ),
        ],
      );

      blocTest<AvailableCreditFilterBloc, AvailableCreditFilterState>(
        'For "setAmountFrom" Event',
        build: () => AvailableCreditFilterBloc(),
        act: (bloc) => bloc.add(
          const AvailableCreditFilterEvent.setAmountFrom(amountFrom: '10'),
        ),
        expect: () => [
          availableCreditFilterState.copyWith(
            filter: AvailableCreditFilter.empty().copyWith(
              amountValueFrom: RangeValue('10'),
              amountValueTo: availableCreditFilterState.filter.amountValueTo,
              filterOption: FilterOption.amountRange(),
            ),
          ),
        ],
      );

      blocTest<AvailableCreditFilterBloc, AvailableCreditFilterState>(
        'For "setAmountTo" Event',
        build: () => AvailableCreditFilterBloc(),
        act: (bloc) => bloc
            .add(const AvailableCreditFilterEvent.setAmountTo(amountTo: '100')),
        expect: () => [
          availableCreditFilterState.copyWith(
            filter: AvailableCreditFilter.empty().copyWith(
              amountValueTo: RangeValue('100'),
              amountValueFrom:
                  availableCreditFilterState.filter.amountValueFrom,
              filterOption: FilterOption.amountRange(),
            ),
          ),
        ],
      );

      blocTest<AvailableCreditFilterBloc, AvailableCreditFilterState>(
        'For "setValidationFailure" Event with Failure',
        build: () => AvailableCreditFilterBloc(),
        seed: () => availableCreditFilterState.copyWith(
          filter: AvailableCreditFilter.defaultFilter().copyWith(
            amountValueFrom: RangeValue('100'),
            amountValueTo: RangeValue('10'),
          ),
        ),
        act: (bloc) =>
            bloc.add(const AvailableCreditFilterEvent.setValidationFailure()),
        expect: () => [
          availableCreditFilterState.copyWith(
            filter: AvailableCreditFilter.defaultFilter().copyWith(
              amountValueFrom: RangeValue('100'),
              amountValueTo: RangeValue('10'),
            ),
            showErrorMessage: true,
          ),
        ],
      );

      blocTest<AvailableCreditFilterBloc, AvailableCreditFilterState>(
        'For "resetFilters" Event',
        build: () => AvailableCreditFilterBloc(),
        act: (bloc) =>
            bloc.add(const AvailableCreditFilterEvent.resetFilters()),
        expect: () => [
          availableCreditFilterState,
        ],
      );

      blocTest<AvailableCreditFilterBloc, AvailableCreditFilterState>(
        'For "updateFilterToLastApplied" Event',
        build: () => AvailableCreditFilterBloc(),
        act: (bloc) => bloc.add(
          AvailableCreditFilterEvent.updateFilterToLastApplied(
            lastAppliedFilter: AvailableCreditFilter.defaultFilter().copyWith(
              amountValueFrom: RangeValue('100'),
              amountValueTo: RangeValue('10'),
            ),
          ),
        ),
        expect: () => [
          availableCreditFilterState.copyWith(
            filter: AvailableCreditFilter.defaultFilter().copyWith(
              amountValueFrom: RangeValue('100'),
              amountValueTo: RangeValue('10'),
            ),
          ),
        ],
      );
    },
  );
}

import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';

part 'available_credit_filter_event.dart';
part 'available_credit_filter_state.dart';
part 'available_credit_filter_bloc.freezed.dart';

class AvailableCreditFilterBloc
    extends Bloc<AvailableCreditFilterEvent, AvailableCreditFilterState> {
  AvailableCreditFilterBloc() : super(AvailableCreditFilterState.initial()) {
    on<AvailableCreditFilterEvent>(_onEvent);
  }

  void _onEvent(
    AvailableCreditFilterEvent event,
    Emitter<AvailableCreditFilterState> emit,
  ) {
    event.map(
      initialize: (e) => emit(
        AvailableCreditFilterState.initial(),
      ),
      setDocumentDate: (e) => emit(
        state.copyWith(
          filter: AvailableCreditFilter.empty().copyWith(
            filterOption: FilterOption.documentDate(),
            documentDateFrom: DateTimeStringValue(
              getDateStringByDateTime(e.documentDateRange.start),
            ),
            documentDateTo: DateTimeStringValue(
              getDateStringByDateTime(e.documentDateRange.end),
            ),
          ),
        ),
      ),
      setAmountFrom: (e) => emit(
        state.copyWith(
          filter: AvailableCreditFilter.empty().copyWith(
            filterOption: FilterOption.amountRange(),
            amountValueFrom: RangeValue(e.amountFrom),
            amountValueTo: state.filter.amountValueTo,
          ),
          showErrorMessage: false,
        ),
      ),
      setAmountTo: (e) => emit(
        state.copyWith(
          filter: AvailableCreditFilter.empty().copyWith(
            filterOption: FilterOption.amountRange(),
            amountValueTo: RangeValue(e.amountTo),
            amountValueFrom: state.filter.amountValueFrom,
          ),
          showErrorMessage: false,
        ),
      ),
      setValidationFailure: (_) => emit(
        state.copyWith(
          showErrorMessage:
              !state.filter.isAvailableCreditAmountValueRangeValid,
        ),
      ),
      resetFilters: (e) => emit(
        AvailableCreditFilterState.initial().copyWith(
          filter: AvailableCreditFilter.defaultFilter(),
        ),
      ),
      updateFilterToLastApplied: (e) => emit(
        state.copyWith(
          filter: e.lastAppliedFilter,
          showErrorMessage: false,
        ),
      ),
    );
  }
}

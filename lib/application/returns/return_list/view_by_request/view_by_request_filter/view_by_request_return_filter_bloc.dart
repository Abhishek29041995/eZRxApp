import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';

part 'view_by_request_return_filter_event.dart';
part 'view_by_request_return_filter_state.dart';
part 'view_by_request_return_filter_bloc.freezed.dart';

class ViewByRequestReturnFilterBloc extends Bloc<ViewByRequestReturnFilterEvent,
    ViewByRequestReturnFilterState> {
  ViewByRequestReturnFilterBloc()
      : super(ViewByRequestReturnFilterState.initial()) {
    on<ViewByRequestReturnFilterEvent>(_onEvent);
  }

  void _onEvent(
    ViewByRequestReturnFilterEvent event,
    Emitter<ViewByRequestReturnFilterState> emit,
  ) {
    event.map(
      initialize: (e) async => emit(
        ViewByRequestReturnFilterState.initial(),
      ),
      setReturnDate: (e) => emit(
        state.copyWith(
          filter: state.filter.copyWith(
            returnDateFrom: DateTimeStringValue(
              getDateStringByDateTime(e.returnDateRange.start),
            ),
            returnDateTo: DateTimeStringValue(
              getDateStringByDateTime(e.returnDateRange.end),
            ),
          ),
        ),
      ),
      setAmountFrom: (e) => emit(
        state.copyWith(
          filter: state.filter.copyWith(
            amountValueFrom: RangeValue(e.amountFrom),
          ),
        ),
      ),
      setAmountTo: (e) => emit(
        state.copyWith(
          filter: state.filter.copyWith(
            amountValueTo: RangeValue(e.amountTo),
          ),
        ),
      ),
      setReturnType: (e) => emit(
        state.copyWith.filter(materialOriginFilter: e.type),
      ),
      setReturnStatus: (e) {
        final selectedStatusList = List<StatusType>.from(
          state.filter.returnStatusList,
        );
        final modifiedStatusList = e.value
            ? (selectedStatusList..add(e.status))
            : (selectedStatusList..remove(e.status));
        emit(
          state.copyWith(
            filter: state.filter.copyWith(returnStatusList: modifiedStatusList),
          ),
        );
      },
      updateFilterToLastApplied: (e) => emit(
        state.copyWith(
          filter: e.lastAppliedFilter,
          showErrorMessage: false,
        ),
      ),
      setValidationFailure: (_) => emit(
        state.copyWith(
          showErrorMessage: !state.filter.isReturnAmountValueRangeValid,
        ),
      ),
      resetFilters: (e) => emit(
        ViewByRequestReturnFilterState.initial().copyWith(
          filter: ReturnFilter.empty(),
        ),
      ),
    );
  }
}

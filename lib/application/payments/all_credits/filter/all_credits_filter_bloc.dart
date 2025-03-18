import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_credits_filter_event.dart';
part 'all_credits_filter_state.dart';
part 'all_credits_filter_bloc.freezed.dart';

class AllCreditsFilterBloc
    extends Bloc<AllCreditsFilterEvent, AllCreditsFilterState> {
  AllCreditsFilterBloc() : super(AllCreditsFilterState.initial()) {
    on<AllCreditsFilterEvent>(_onEvent);
  }

  void _onEvent(
    AllCreditsFilterEvent event,
    Emitter<AllCreditsFilterState> emit,
  ) {
    event.map(
      initialized: (_Initialized e) => emit(
        AllCreditsFilterState.initial(),
      ),
      openFilterBottomSheet: (_OpenFilterBottomSheet value) {
        if (state.showErrorMessages || state.filter != value.appliedFilter) {
          emit(
            state.copyWith(
              filter: value.appliedFilter,
              showErrorMessages: false,
            ),
          );
        }
      },
      validateFilters: (_ValidateFilters value) {
        emit(
          state.copyWith(
            showErrorMessages: !state.filter.isValid,
          ),
        );
      },
      statusChanged: (_StatusChanged e) {
        emit(
          state.copyWith(
            filter: AllCreditsFilter.empty().copyWith(
              filterOption: FilterOption.status(),
              filterStatuses: e.selected ? [e.filterStatus] : [],
            ),
          ),
        );
      },
      setDocumentDate: (_SetDocumentDate e) => emit(
        state.copyWith(
          filter: AllCreditsFilter.empty().copyWith(
            filterOption: FilterOption.documentDate(),
            documentDateFrom: DateTimeStringValue(
              getDateStringByDateTime(e.dateRange.start),
            ),
            documentDateTo: DateTimeStringValue(
              getDateStringByDateTime(e.dateRange.end),
            ),
          ),
          showErrorMessages: false,
        ),
      ),
      amountValueFromChanged: (_AmountValueFromChanged e) => emit(
        state.copyWith(
          filter: AllCreditsFilter.empty().copyWith(
            filterOption: FilterOption.amountRange(),
            amountValueFrom: RangeValue(e.amountValueFrom),
            amountValueTo: state.filter.amountValueTo,
          ),
          showErrorMessages: false,
        ),
      ),
      amountValueToChanged: (_AmountValueToChanged e) => emit(
        state.copyWith(
          filter: AllCreditsFilter.empty().copyWith(
            filterOption: FilterOption.amountRange(),
            amountValueFrom: state.filter.amountValueFrom,
            amountValueTo: RangeValue(e.amountValueTo),
          ),
          showErrorMessages: false,
        ),
      ),
    );
  }
}

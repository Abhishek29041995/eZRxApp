import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/full_summary_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'full_summary_filter_event.dart';
part 'full_summary_filter_state.dart';
part 'full_summary_filter_bloc.freezed.dart';

class FullSummaryFilterBloc
    extends Bloc<FullSummaryFilterEvent, FullSummaryFilterState> {
  FullSummaryFilterBloc() : super(FullSummaryFilterState.initial()) {
    on<FullSummaryFilterEvent>(_onEvent);
  }

  void _onEvent(
    FullSummaryFilterEvent event,
    Emitter<FullSummaryFilterState> emit,
  ) {
    event.map(
      initialized: (_Initialized e) => emit(
        FullSummaryFilterState.initial(),
      ),
      openFilterBottomSheet: (_OpenFilterBottomSheet value) {
        emit(
          state.copyWith(
            filter: value.appliedFilter,
            showErrorMessages: false,
          ),
        );
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
            filter: FullSummaryFilter.empty().copyWith(
              filterOption: FilterOption.status(),
              filterStatuses: e.selected ? [e.filterStatus] : [],
            ),
          ),
        );
      },
      setDueDate: (_SetDueDate e) => emit(
        state.copyWith(
          filter: FullSummaryFilter.empty().copyWith(
            filterOption: FilterOption.dueDate(),
            dueDateFrom: DateTimeStringValue(
              getDateStringByDateTime(e.dateRange.start),
            ),
            dueDateTo: DateTimeStringValue(
              getDateStringByDateTime(e.dateRange.end),
            ),
          ),
          showErrorMessages: false,
        ),
      ),
      setDocumentDate: (_SetDocumentDate e) => emit(
        state.copyWith(
          filter: FullSummaryFilter.empty().copyWith(
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
    );
  }
}

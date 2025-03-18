import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_summary_filter_event.dart';
part 'return_summary_filter_state.dart';
part 'return_summary_filter_bloc.freezed.dart';

class ReturnSummaryFilterBloc
    extends Bloc<ReturnSummaryFilterEvent, ReturnSummaryFilterState> {
  ReturnSummaryFilterBloc() : super(ReturnSummaryFilterState.initial()) {
    on<ReturnSummaryFilterEvent>(_onEvent);
  }

  void _onEvent(
    ReturnSummaryFilterEvent event,
    Emitter<ReturnSummaryFilterState> emit,
  ) {
    event.map(
      initialized: (_) => emit(ReturnSummaryFilterState.initial()),
      applyFilters: (_) {
        emit(
          state.copyWith(
            isSubmitting: false,
          ),
        );
        if (state.returnSummaryFilter.areFiltersValid) {
          emit(
            state.copyWith(
              isSubmitting: true,
            ),
          );
        } else {
          emit(
            state.copyWith(
              showErrorMessages: true,
            ),
          );
        }
      },
      returnIdChanged: (e) => emit(
        state.copyWith(
          returnSummaryFilter: state.returnSummaryFilter.copyWith(
            requestId: SearchKey.search(e.returnId),
          ),
          showErrorMessages: false,
        ),
      ),
      refundTotalToChanged: (e) => emit(
        state.copyWith(
          returnSummaryFilter: state.returnSummaryFilter.copyWith(
            refundTotalTo: RangeValue(e.refundTotalTo),
          ),
          showErrorMessages: false,
        ),
      ),
      refundTotalFromChanged: (e) => emit(
        state.copyWith(
          returnSummaryFilter: state.returnSummaryFilter.copyWith(
            refundTotalFrom: RangeValue(e.refundTotalFrom),
          ),
          showErrorMessages: false,
        ),
      ),
      sortByChanged: (e) {
        emit(
          state.copyWith(
            returnSummaryFilter: state.returnSummaryFilter.copyWith(
              sortBy: e.sortBy,
            ),
          ),
        );
      },
      setSubmittedDate: (e) => emit(
        state.copyWith(
          returnSummaryFilter: state.returnSummaryFilter.copyWith(
            dateFrom: DateTimeStringValue(
              getDateStringByDateTime(e.submittedDateRange.start),
            ),
            dateTo: DateTimeStringValue(
              getDateStringByDateTime(e.submittedDateRange.end),
            ),
          ),
          showErrorMessages: false,
        ),
      ),
    );
  }
}

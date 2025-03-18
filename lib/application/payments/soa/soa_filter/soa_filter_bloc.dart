import 'dart:async';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/soa_filter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'soa_filter_event.dart';
part 'soa_filter_state.dart';
part 'soa_filter_bloc.freezed.dart';

class SoaFilterBloc extends Bloc<SoaFilterEvent, SoaFilterState> {
  SoaFilterBloc() : super(SoaFilterState.initial()) {
    on<SoaFilterEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(SoaFilterEvent event, Emitter<SoaFilterState> emit) {
    event.map(
      initialized: (_) => emit(SoaFilterState.initial()),
      setFilter: (_SetFilter e) {
        if (state.filter == e.soaFilter) return;
        emit(
          state.copyWith(filter: e.soaFilter),
        );
      },
      changeToDate: (_ChangeToDate e) => emit(
        state.copyWith(
          filter: state.filter.copyWith(
            toDate: e.toDate,
            fromDate: state.filter.fromDate.isNotEmpty
                ? state.filter.fromDate
                : e.toDate,
          ),
        ),
      ),
      changeFormDate: (_changeFormDate e) => emit(
        state.copyWith(
          filter: state.filter.copyWith(
            fromDate: e.formDate,
            toDate: state.filter.toDate.isNotEmpty
                ? state.filter.toDate
                : e.formDate,
          ),
        ),
      ),
    );
  }
}

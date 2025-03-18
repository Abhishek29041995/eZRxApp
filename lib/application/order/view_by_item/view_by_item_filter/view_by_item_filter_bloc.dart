import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_filter.dart';

part 'view_by_item_filter_bloc.freezed.dart';
part 'view_by_item_filter_event.dart';
part 'view_by_item_filter_state.dart';

class ViewByItemFilterBloc
    extends Bloc<ViewByItemFilterEvent, ViewByItemFilterState> {
  ViewByItemFilterBloc() : super(ViewByItemFilterState.initial()) {
    on<ViewByItemFilterEvent>(_onEvent);
  }

  void _onEvent(
    ViewByItemFilterEvent event,
    Emitter<ViewByItemFilterState> emit,
  ) {
    event.map(
      initialize: (e) => emit(
        ViewByItemFilterState.initial(),
      ),
      setOrderDate: (e) => emit(
        state.copyWith(
          filter: state.filter.copyWith(
            orderDateFrom: DateTimeStringValue(
              getDateStringByDateTime(e.dateRange.start),
            ),
            orderDateTo: DateTimeStringValue(
              getDateStringByDateTime(e.dateRange.end),
            ),
          ),
        ),
      ),
      setOrderStatus: (e) {
        final selectedStatusList = List<StatusType>.from(
          state.filter.orderStatusList,
        );
        final modifiedStatusList = e.value
            ? (selectedStatusList..add(e.status))
            : (selectedStatusList..remove(e.status));
        emit(
          state.copyWith(
            filter: state.filter.copyWith(orderStatusList: modifiedStatusList),
          ),
        );
      },
      setOrderHistoryType: (e) => emit(
        state.copyWith.filter(orderHistoryType: e.type),
      ),
      resetFiltersToLastApplied: (e) => emit(
        state.copyWith(
          filter: e.lastAppliedFilter,
        ),
      ),
      resetFilter: (e) => emit(
        ViewByItemFilterState.initial().copyWith(
          filter: ViewByItemFilter.empty(),
        ),
      ),
    );
  }
}

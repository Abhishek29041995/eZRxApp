import 'dart:async';

import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_by_order_filter_event.dart';
part 'view_by_order_filter_state.dart';
part 'view_by_order_filter_bloc.freezed.dart';

class ViewByOrderFilterBloc
    extends Bloc<ViewByOrderFilterEvent, ViewByOrderFilterState> {
  ViewByOrderFilterBloc() : super(ViewByOrderFilterState.initial()) {
    on<ViewByOrderFilterEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
    ViewByOrderFilterEvent event,
    Emitter<ViewByOrderFilterState> emit,
  ) {
    event.map(
      initialized: (e) => emit(
        ViewByOrderFilterState.initial().copyWith(
          salesOrganisation: e.salesOrganisation,
        ),
      ),
      updateCurrentFilter: (e) => emit(state.copyWith(filter: e.currentFilter)),
      setDateRange: (e) async => emit(
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
    );
  }
}

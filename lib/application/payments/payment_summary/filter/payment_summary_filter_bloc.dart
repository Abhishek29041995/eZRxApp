import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_filter.dart';
import 'package:ezrxmobile/domain/payments/repository/i_payment_summary_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_summary_filter_event.dart';
part 'payment_summary_filter_state.dart';
part 'payment_summary_filter_bloc.freezed.dart';

class PaymentSummaryFilterBloc
    extends Bloc<PaymentSummaryFilterEvent, PaymentSummaryFilterState> {
  final IPaymentSummaryRepository paymentSummaryRepository;

  PaymentSummaryFilterBloc({
    required this.paymentSummaryRepository,
  }) : super(PaymentSummaryFilterState.initial()) {
    on<PaymentSummaryFilterEvent>(_onEvent);
  }

  void _onEvent(
    PaymentSummaryFilterEvent event,
    Emitter<PaymentSummaryFilterState> emit,
  ) {
    event.map(
      initialized: (_Initialized e) => emit(
        PaymentSummaryFilterState.initial().copyWith(
          salesOrg: e.salesOrg,
        ),
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
            filter: PaymentSummaryFilter.empty().copyWith(
              filterOption: FilterOption.status(),
              filterStatuses: <FilterStatus>[
                e.filterStatus,
              ],
            ),
          ),
        );
      },
      setCreatedDate: (_SetCreatedDate e) => emit(
        state.copyWith(
          filter: PaymentSummaryFilter.empty().copyWith(
            filterOption: FilterOption.documentDate(),
            createdDateFrom: DateTimeStringValue(
              getDateStringByDateTime(e.dateRange.start),
            ),
            createdDateTo: DateTimeStringValue(
              getDateStringByDateTime(e.dateRange.end),
            ),
          ),
          showErrorMessages: false,
        ),
      ),
      amountValueFromChanged: (_AmountValueFromChanged e) => emit(
        state.copyWith(
          filter: PaymentSummaryFilter.empty().copyWith(
            filterOption: FilterOption.amountRange(),
            amountValueFrom: RangeValue(e.amountValueFrom),
            amountValueTo: state.filter.amountValueTo,
          ),
          showErrorMessages: false,
        ),
      ),
      amountValueToChanged: (_AmountValueToChanged e) => emit(
        state.copyWith(
          filter: PaymentSummaryFilter.empty().copyWith(
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

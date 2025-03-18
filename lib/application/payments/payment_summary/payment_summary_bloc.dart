import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_filter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/payments/repository/i_payment_summary_repository.dart';

part 'payment_summary_event.dart';
part 'payment_summary_state.dart';
part 'payment_summary_bloc.freezed.dart';

class ZPPaymentSummaryBloc extends PaymentSummaryBloc {
  ZPPaymentSummaryBloc({
    required super.paymentSummaryRepository,
    required super.config,
  });

  @override
  bool get isMarketplace => false;
}

class MPPaymentSummaryBloc extends PaymentSummaryBloc {
  MPPaymentSummaryBloc({
    required super.paymentSummaryRepository,
    required super.config,
  });

  @override
  bool get isMarketplace => true;
}

abstract class PaymentSummaryBloc
    extends Bloc<PaymentSummaryEvent, PaymentSummaryState> {
  abstract final bool isMarketplace;
  final IPaymentSummaryRepository paymentSummaryRepository;
  final Config config;

  PaymentSummaryBloc({
    required this.paymentSummaryRepository,
    required this.config,
  }) : super(PaymentSummaryState.initial()) {
    on<PaymentSummaryEvent>(_onEvent);
  }

  Future<void> _onEvent(
    PaymentSummaryEvent event,
    Emitter<PaymentSummaryState> emit,
  ) async {
    await event.map(
      initialized: (e) {
        emit(
          PaymentSummaryState.initial().copyWith(
            customerCodeInfo: e.customerCodeInfo,
            salesOrganization: e.salesOrganization,
          ),
        );
      },
      fetch: (e) async {
        if (!e.appliedFilter.searchKey.isValid()) return;

        if (e.appliedFilter == state.appliedFilter &&
            e.appliedFilter.searchKey.validateNotEmpty) {
          return;
        }

        emit(
          state.copyWith(
            isFetching: true,
            canLoadMore: true,
            details: <PaymentSummaryDetails>[],
            failureOrSuccessOption: none(),
            appliedFilter: e.appliedFilter,
          ),
        );

        final failureOrSuccess =
            await paymentSummaryRepository.fetchPaymentSummaryList(
          customerCodeInfo: state.customerCodeInfo,
          salesOrganization: state.salesOrganization,
          offset: state.details.length,
          pageSize: config.pageSize,
          filter: e.appliedFilter,
          isMarketPlace: isMarketplace,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (paymentSummary) => emit(
            state.copyWith(
              details: paymentSummary,
              isFetching: false,
              canLoadMore: paymentSummary.length >= config.pageSize,
              failureOrSuccessOption: none(),
            ),
          ),
        );
      },
      loadMore: (e) async {
        if (state.isFetching || !state.canLoadMore) return;

        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await paymentSummaryRepository.fetchPaymentSummaryList(
          customerCodeInfo: state.customerCodeInfo,
          salesOrganization: state.salesOrganization,
          filter: state.appliedFilter,
          offset: state.details.length,
          pageSize: config.pageSize,
          isMarketPlace: isMarketplace,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (paymentSummaryDetails) {
            emit(
              state.copyWith(
                details: <PaymentSummaryDetails>[
                  ...state.details,
                  ...paymentSummaryDetails,
                ],
                isFetching: false,
                canLoadMore: paymentSummaryDetails.length >= config.pageSize,
                failureOrSuccessOption: none(),
              ),
            );
          },
        );
      },
    );
  }
}

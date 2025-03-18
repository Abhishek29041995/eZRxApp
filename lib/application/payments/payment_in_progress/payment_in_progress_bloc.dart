import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/repository/i_payment_in_progress_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_in_progress_event.dart';
part 'payment_in_progress_state.dart';
part 'payment_in_progress_bloc.freezed.dart';

class ZPPaymentInProgressBloc extends PaymentInProgressBloc {
  ZPPaymentInProgressBloc({required super.repository});

  @override
  bool get isMarketplace => false;
}

class MPPaymentInProgressBloc extends PaymentInProgressBloc {
  MPPaymentInProgressBloc({required super.repository});

  @override
  bool get isMarketplace => true;
}

abstract class PaymentInProgressBloc
    extends Bloc<PaymentInProgressEvent, PaymentInProgressState> {
  abstract final bool isMarketplace;
  final IPaymentInProgressRepository repository;
  PaymentInProgressBloc({
    required this.repository,
  }) : super(PaymentInProgressState.initial()) {
    on<PaymentInProgressEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
    PaymentInProgressEvent event,
    Emitter<PaymentInProgressState> emit,
  ) async {
    await event.map(
      initialized: (_) {
        emit(PaymentInProgressState.initial());
      },
      fetch: (_Fetch e) async {
        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await repository.getPaymentInProgress(
          customerCodeInfo: e.customerCodeInfo,
          salesOrganization: e.salesOrganization,
          isMarketPlace: isMarketplace,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              isFetching: false,
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (amount) => emit(
            state.copyWith(
              isFetching: false,
              amount: amount,
            ),
          ),
        );
      },
    );
  }
}

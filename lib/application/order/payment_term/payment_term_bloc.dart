import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/sales_representative_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/payment_customer_information.dart';
import 'package:ezrxmobile/domain/order/entities/payment_term.dart';
import 'package:ezrxmobile/domain/order/repository/i_payment_term_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_term_bloc.freezed.dart';
part 'payment_term_event.dart';
part 'payment_term_state.dart';

class PaymentTermBloc extends Bloc<PaymentTermEvent, PaymentTermState> {
  final IPaymentTermsRepository paymentTermRepository;
  PaymentTermBloc({
    required this.paymentTermRepository,
  }) : super(PaymentTermState.initial()) {
    on<PaymentTermEvent>(_onEvent);
  }

  Future<void> _onEvent(
    PaymentTermEvent event,
    Emitter<PaymentTermState> emit,
  ) async {
    await event.map(
      initialized: (e) {
        emit(PaymentTermState.initial());
      },
      fetch: (e) async {
        final failureOrSuccess = await paymentTermRepository.getPaymentTerms(
          salesOrganisation: e.salesOrganisation,
          customerCodeInfo: e.customeCodeInfo,
          paymentCustomerInfo: e.paymentCustomerInformation,
          salesOrgConfig: e.salesOrganisationConfigs,
          salesRepInfo: e.salesRepresentativeInfo,
          preferredLanguage: e.user.preferredLanguage,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (faliure) => emit(
            state.copyWith(
              paymentTermsFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (paymentTerms) {
            emit(
              state.copyWith(
                paymentTermsFailureOrSuccessOption: none(),
                paymentTerms: paymentTerms,
              ),
            );
          },
        );
      },
    );
  }

  @override
  void onChange(Change<PaymentTermState> change) {
    super.onChange(change);
  }
}

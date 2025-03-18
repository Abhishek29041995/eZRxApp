import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/license_info.dart';
import 'package:ezrxmobile/domain/order/entities/payment_customer_information.dart';
import 'package:ezrxmobile/domain/order/repository/i_payment_customer_information_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_customer_information_bloc.freezed.dart';
part 'payment_customer_information_event.dart';
part 'payment_customer_information_state.dart';

class PaymentCustomerInformationBloc extends Bloc<
    PaymentCustomerInformationEvent, PaymentCustomerInformationState> {
  final IPaymentCustomerInformationRepository
      paymentCustomerInformationRepository;
  PaymentCustomerInformationBloc({
    required this.paymentCustomerInformationRepository,
  }) : super(PaymentCustomerInformationState.initial()) {
    on<PaymentCustomerInformationEvent>(_onEvent);
  }

  Future<void> _onEvent(
    PaymentCustomerInformationEvent event,
    Emitter<PaymentCustomerInformationState> emit,
  ) async {
    await event.map(
      initialized: (e) {
        emit(PaymentCustomerInformationState.initial());
      },
      fetch: (e) async {
        final failureOrSuccess = await paymentCustomerInformationRepository
            .getPaymentCustomerInformation(
          salesOrganisation: e.salesOrganisation,
          customerCodeInfo: e.customeCodeInfo,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                paymentCustomerInformationFailureOrSuccessOption:
                    optionOf(failureOrSuccess),
              ),
            );
          },
          (paymentCustomerInformation) {
            final licencenseList =
                paymentCustomerInformation.shipToInfoList.where(
              (shipToInfo) =>
                  shipToInfo.shipToCustomerCode == e.selectedShipToCode,
            );
            final finalLicencenseList = licencenseList.isEmpty
                ? <LicenseInfo>[]
                : licencenseList.first.licenses;
            emit(
              state.copyWith(
                paymentCustomerInformation: paymentCustomerInformation,
                licenses: finalLicencenseList,
                paymentCustomerInformationFailureOrSuccessOption: none(),
              ),
            );
          },
        );
      },
    );
  }
}

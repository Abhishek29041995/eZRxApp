import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/device/repository/i_device_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/create_virtual_account.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_status.dart';
import 'package:ezrxmobile/domain/payments/entities/principal_cutoffs.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_info.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:ezrxmobile/domain/payments/entities/new_payment_method.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_method_option.dart';
import 'package:ezrxmobile/domain/payments/repository/i_new_payment_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_payment_bloc.freezed.dart';

part 'new_payment_event.dart';

part 'new_payment_state.dart';

class NewPaymentBloc extends Bloc<NewPaymentEvent, NewPaymentState> {
  final INewPaymentRepository newPaymentRepository;
  final IDeviceRepository deviceRepository;

  NewPaymentBloc({
    required this.newPaymentRepository,
    required this.deviceRepository,
  }) : super(NewPaymentState.initial()) {
    on(_onEvent);
  }

  Future<void> _onEvent(
    NewPaymentEvent event,
    Emitter<NewPaymentState> emit,
  ) async {
    await event.map(
      initialized: (_initialized e) async {
        emit(
          NewPaymentState.initial().copyWith(
            user: e.user,
            customerCodeInfo: e.customerCodeInfo,
            salesOrganisation: e.salesOrganisation,
            isFetchingPaymentMethod: false,
            shipToInfo: e.shipToInfo,
            createVirtualAccountFailed: false,
            isMarketPlace: e.isMarketPlace,
          ),
        );
      },
      fetchAvailablePaymentMethods: (e) async {
        emit(
          state.copyWith(
            isFetchingPaymentMethod: true,
            failureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess = await newPaymentRepository.fetchPaymentMethods(
          salesOrganisation: state.salesOrganisation,
          isMarketPlace: state.isMarketPlace,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetchingPaymentMethod: false,
              ),
            );
          },
          (paymentMethods) {
            emit(
              state.copyWith(
                paymentMethods: paymentMethods,
                isFetchingPaymentMethod: false,
                selectedPaymentMethod:
                    (paymentMethods.firstOrNull ?? NewPaymentMethod.empty())
                        .copyWith(options: []),
              ),
            );
          },
        );
      },
      updateAllInvoices: (_SelectAllInvoices e) {
        emit(
          state.copyWith(
            selectedInvoices: e.items,
          ),
        );
      },
      toggleInvoice: (_ToggleInvoice e) {
        if (e.selected) {
          emit(
            state.copyWith(
              selectedInvoices:
                  List<CustomerOpenItem>.from(state.selectedInvoices)
                    ..add(e.item),
            ),
          );
        } else {
          emit(
            state.copyWith(
              selectedInvoices:
                  List<CustomerOpenItem>.from(state.selectedInvoices)
                    ..remove(e.item),
            ),
          );
        }
      },
      updateAllCredits: (_SelectAllCredits e) {
        emit(
          state.copyWith(
            selectedCredits: e.items,
          ),
        );
      },
      toggleCredit: (_ToggleCredit e) {
        if (e.selected) {
          emit(
            state.copyWith(
              selectedCredits:
                  List<CustomerOpenItem>.from(state.selectedCredits)
                    ..add(e.item),
            ),
          );
        } else {
          emit(
            state.copyWith(
              selectedCredits:
                  List<CustomerOpenItem>.from(state.selectedCredits)
                    ..remove(e.item),
            ),
          );
        }
      },
      pay: (_Pay e) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            isLoading: true,
          ),
        );

        final failureOrSuccess = await newPaymentRepository.pay(
          salesOrganisation: state.salesOrganisation,
          customerCodeInfo: state.customerCodeInfo,
          paymentMethod: state.selectedPaymentMethod.paymentMethod.getValue(),
          customerOpenItems: [
            ...state.selectedInvoices,
            ...state.selectedCredits,
          ],
          user: state.user,
          shipToInfo: state.shipToInfo,
          isMarketPlace: state.isMarketPlace,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isLoading: false,
              ),
            );
          },
          (paymentInfo) {
            emit(
              state.copyWith(
                paymentInfo: paymentInfo,
                failureOrSuccessOption: none(),
                isLoading: false,
              ),
            );
          },
        );
      },
      updatePaymentGateway: (_UpdatePaymentGateway e) async {
        if (state.salesOrganisation.salesOrg.needUpdatePaymentGateway) {
          emit(state.copyWith(isUpdatePaymentGateway: true));

          await newPaymentRepository.updatePaymentGateway(
            salesOrganisation: state.salesOrganisation,
            customerCodeInfo: state.customerCodeInfo,
            isMarketPlace: state.isMarketPlace,
            paymentStatus: e.paymentStatus,
          );

          if (isClosed) return;
          emit(state.copyWith(isUpdatePaymentGateway: false));
        }
      },
      fetchInvoiceInfoPdf: (_FetchInvoiceInfoPdf e) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            isFetchingInvoiceInfoPdf: true,
          ),
        );
        final failureOrSuccess =
            await newPaymentRepository.getPaymentInvoiceInfoPdf(
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisation: state.salesOrganisation,
          user: state.user,
          paymentInfo: state.paymentInfo,
          isMarketPlace: state.isMarketPlace,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetchingInvoiceInfoPdf: false,
              ),
            );
          },
          (invoiceInfoPdf) {
            emit(
              state.copyWith(
                paymentInvoiceInfoPdf: invoiceInfoPdf,
                isFetchingInvoiceInfoPdf: false,
              ),
            );
          },
        );
      },
      saveInvoicePdf: (_SaveInvoicePdf e) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            isSavingInvoicePdf: true,
          ),
        );
        final failureOrSuccessPermission =
            await deviceRepository.getSavePermission();
        await failureOrSuccessPermission.fold(
          (failure) {
            if (isClosed) return;
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccessPermission),
                isSavingInvoicePdf: false,
              ),
            );
          },
          (success) async {
            final failureOrSuccessSave = await newPaymentRepository.saveFile(
              pdfData: e.dataInvoicePdf,
            );

            failureOrSuccessSave.fold(
              (failure) {
                emit(
                  state.copyWith(
                    failureOrSuccessOption: optionOf(failureOrSuccessSave),
                    isSavingInvoicePdf: false,
                  ),
                );
              },
              (success) {
                emit(
                  state.copyWith(
                    failureOrSuccessOption: none(),
                    isSavingInvoicePdf: false,
                  ),
                );
              },
            );
          },
        );
      },
      updatePaymentMethodSelected: (_UpdatePaymentMethodSelected e) {
        emit(
          state.copyWith(
            selectedPaymentMethod: e.paymentMethodSelected.copyWith(
              options: <PaymentMethodOption>[],
            ),
          ),
        );
      },
      updatePaymentMethodOptionSelected:
          (_UpdatePaymentMethodOptionSelected e) {
        emit(
          state.copyWith(
            selectedPaymentMethod: state.selectedPaymentMethod.copyWith(
              options: [e.paymentMethodOptionSelected],
            ),
          ),
        );
      },
      createVirtualAccount: (_CreateVirtualAccount e) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            isCreatingVirtualAccount: true,
            createVirtualAccountFailed: false,
          ),
        );

        final failureOrSuccess =
            await newPaymentRepository.createVirtualAccount(
          salesOrganisation: state.salesOrganisation,
          customerCodeInfo: state.customerCodeInfo,
          paymentMethodOption: state.selectedPaymentMethod.firstSelectedOption,
          invoices: state.selectedInvoices,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isCreatingVirtualAccount: false,
                createVirtualAccountFailed: true,
              ),
            );
          },
          (createVirtualAccount) {
            emit(
              state.copyWith(
                failureOrSuccessOption: none(),
                isCreatingVirtualAccount: false,
                createVirtualAccount: createVirtualAccount,
                createVirtualAccountFailed: false,
              ),
            );
          },
        );
      },
      getPrincipalCutoffs: (_GetPrincipalCutoffs e) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            isFetchingPrincipalCutoffs: true,
          ),
        );

        if (state.salesOrganisation.salesOrg.isID) {
          final failureOrSuccess =
              await newPaymentRepository.getPrincipalCutoffs(
            shipToInfo: state.shipToInfo,
          );
          if (isClosed) return;
          failureOrSuccess.fold(
            (failure) {
              emit(
                state.copyWith(
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                  isFetchingPrincipalCutoffs: false,
                ),
              );
            },
            (principalCutoffs) {
              emit(
                state.copyWith(
                  failureOrSuccessOption: none(),
                  isFetchingPrincipalCutoffs: false,
                  principalCutoffs: principalCutoffs,
                ),
              );
            },
          );
        } else {
          if (isClosed) return;
          emit(
            state.copyWith(
              failureOrSuccessOption: none(),
              isFetchingPrincipalCutoffs: false,
            ),
          );
        }
      },
    );
  }
}

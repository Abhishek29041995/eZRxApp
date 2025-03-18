import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/core/device/repository/i_device_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/tr_object.dart';
import 'package:ezrxmobile/domain/payments/entities/bank_instruction.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_info.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/payments/repository/i_bank_instruction_repository.dart';
import 'package:ezrxmobile/domain/payments/repository/i_new_payment_repository.dart';
import 'package:ezrxmobile/domain/payments/repository/i_payment_summary_details_repository.dart';
import 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/create_payment_invoice_pdf.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_summary_details_bloc.freezed.dart';

part 'payment_summary_details_event.dart';

part 'payment_summary_details_state.dart';

class PaymentSummaryDetailsBloc
    extends Bloc<PaymentSummaryDetailsEvent, PaymentSummaryDetailsState> {
  final IPaymentSummaryDetailsRepository paymentItemRepository;
  final INewPaymentRepository newPaymentRepository;
  final IDeviceRepository deviceRepository;
  final IBankInstructionRepository bankInstructionRepository;
  final CreatePaymentInvoicePdf createPaymentInvoicePdf;

  PaymentSummaryDetailsBloc({
    required this.paymentItemRepository,
    required this.newPaymentRepository,
    required this.deviceRepository,
    required this.bankInstructionRepository,
    required this.createPaymentInvoicePdf,
  }) : super(PaymentSummaryDetailsState.initial()) {
    on<PaymentSummaryDetailsEvent>(_onEvent);
  }

  Future<void> _onEvent(
    PaymentSummaryDetailsEvent event,
    Emitter<PaymentSummaryDetailsState> emit,
  ) async {
    await event.map(
      initialized: (event) {
        emit(
          PaymentSummaryDetailsState.initial().copyWith(
            customerCodeInfo: event.customerCodeInfo,
            salesOrganization: event.salesOrganization,
            user: event.user,
            shipToInfo: event.shipToInfo,
          ),
        );
      },
      fetchPaymentSummaryDetailsInfo: (event) async {
        if (!event.details.allIdentifierInfoValid) {
          emit(
            state.copyWith(
              isDetailFetching: true,
              failureOrSuccessOption: none(),
              savedAdvice: AttachmentFileBuffer.empty(),
            ),
          );
          final failureOrSuccess =
              await paymentItemRepository.fetchPaymentSummaryDetailsInfo(
            customerCodeInfo: state.customerCodeInfo,
            salesOrganization: state.salesOrganization,
            details: event.details,
            isMarketPlace: event.isMarketPlace,
          );
          if (isClosed) return;
          failureOrSuccess.fold(
            (failure) {
              emit(
                state.copyWith(
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                  isDetailFetching: false,
                ),
              );
            },
            (details) {
              emit(
                state.copyWith(
                  details: details,
                  isDetailFetching: false,
                ),
              );

              if (!state.salesOrganization.salesOrg.isID) {
                add(
                  PaymentSummaryDetailsEvent.fetchPaymentSummaryList(
                    isMarketPlace: event.isMarketPlace,
                  ),
                );
              } else {
                add(
                  const PaymentSummaryDetailsEvent.fetchBankInstruction(),
                );
              }
            },
          );
        } else {
          if (isClosed) return;
          emit(
            state.copyWith(
              details: event.details,
              savedAdvice: AttachmentFileBuffer.empty(),
            ),
          );
          if (!state.salesOrganization.salesOrg.isID) {
            add(
              PaymentSummaryDetailsEvent.fetchPaymentSummaryList(
                isMarketPlace: event.isMarketPlace,
              ),
            );
          } else {
            add(
              const PaymentSummaryDetailsEvent.fetchBankInstruction(),
            );
          }
        }
      },
      fetchPaymentSummaryList: (event) async {
        emit(state.copyWith(isListLoading: true));
        final failureOrSuccess = await paymentItemRepository.fetchPaymentList(
          customerCodeInfo: state.customerCodeInfo,
          salesOrganization: state.salesOrganization,
          details: state.details,
          isMarketPlace: event.isMarketPlace,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isListLoading: false,
              ),
            );
          },
          (paymentItemList) {
            add(
              PaymentSummaryDetailsEvent.fetchAdvice(
                isMarketPlace: event.isMarketPlace,
              ),
            );
            emit(
              state.copyWith(
                details: state.details.copyWith(
                  paymentItems: paymentItemList,
                ),
                failureOrSuccessOption: none(),
                isListLoading: false,
              ),
            );
          },
        );
      },
      fetchBankInstruction: (event) async {
        emit(
          state.copyWith(
            isDetailFetching: true,
          ),
        );
        final failureOrSuccess =
            await bankInstructionRepository.getBankInstruction(
          bankIdentification: state.details.bankIdentification,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isDetailFetching: false,
              ),
            );
          },
          (bankInstruction) {
            emit(
              state.copyWith(
                bankInstruction: bankInstruction,
                failureOrSuccessOption: none(),
                isDetailFetching: false,
              ),
            );
          },
        );
      },
      saveAdvice: (e) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            isSavingAdvice: true,
          ),
        );
        final failureOrSuccessPermission =
            await deviceRepository.getSavePermission();
        await failureOrSuccessPermission.fold(
          (failure) async {
            if (isClosed) return;
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccessPermission),
                isSavingAdvice: false,
              ),
            );
          },
          (success) async {
            final failureOrSuccessSave = await newPaymentRepository.saveFile(
              pdfData: await createPaymentInvoicePdf.createInvoicePdf(
                paymentInvoiceInfoPdf: state.paymentInvoiceInfoPdf,
                shipToInfo: state.shipToInfo,
                salesOrganisation: state.salesOrganization,
                createdDate: state.details.createdDate,
                adviceExpiry: state.details.adviceExpiry,
              ),
            );
            if (isClosed) return;
            failureOrSuccessSave.fold(
              (failure) {
                emit(
                  state.copyWith(
                    failureOrSuccessOption: optionOf(failureOrSuccessSave),
                    isSavingAdvice: false,
                  ),
                );
              },
              (attachmentBuffer) {
                emit(
                  state.copyWith(
                    failureOrSuccessOption: none(),
                    savedAdvice: attachmentBuffer,
                    isSavingAdvice: false,
                  ),
                );
              },
            );
          },
        );
      },
      fetchAdvice: (event) async {
        emit(state.copyWith(isFetchingAdvice: true));
        final paymentInfo = PaymentInfo.empty().copyWith(
          paymentBatchAdditionalInfo:
              state.details.paymentBatchAdditionalInfo.getOrDefaultValue(''),
          paymentID: state.details.paymentID.getOrDefaultValue(''),
          zzAdvice: state.details.zzAdvice.getOrDefaultValue(''),
          accountingDocExternalReference:
              state.details.accountingDocExternalReference,
        );
        final failureOrSuccess =
            await newPaymentRepository.getPaymentInvoiceInfoPdf(
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisation: state.salesOrganization,
          user: state.user,
          paymentInfo: paymentInfo,
          isMarketPlace: event.isMarketPlace,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              isFetchingAdvice: false,
            ),
          ),
          (invoiceInfoPdf) => emit(
            state.copyWith(
              paymentInvoiceInfoPdf: invoiceInfoPdf,
              isFetchingAdvice: false,
            ),
          ),
        );
      },
      deleteAdvice: (e) async {
        emit(
          state.copyWith(
            isDeletingPayment: true,
          ),
        );

        final failureOrSuccess =
            await paymentItemRepository.deletePaymentAdvice(
          salesOrganization: state.salesOrganization,
          customerCodeInfo: state.customerCodeInfo,
          shipToInfo: state.shipToInfo,
          paymentSummaryDetails: state.details,
          isMarketPlace: e.isMarketPlace,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              isDeletingPayment: false,
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (deleteResponse) => emit(
            state.copyWith(
              isDeletingPayment: false,
              failureOrSuccessOption: none(),
            ),
          ),
        );
      },
      cancelAdvice: (_) async {
        emit(
          state.copyWith(
            isCancelingAdvice: true,
          ),
        );

        final failureOrSuccess =
            await paymentItemRepository.cancelPaymentAdvice(
          salesOrganization: state.salesOrganization,
          customerCodeInfo: state.customerCodeInfo,
          referenceId: state.details.paymentID.getValue(),
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              isCancelingAdvice: false,
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (deleteResponse) => emit(
            state.copyWith(
              isCancelingAdvice: false,
              failureOrSuccessOption: none(),
            ),
          ),
        );
      },
      viewSavedAdvice: (e) async {
        final failureOrSuccessOption = await newPaymentRepository
            .viewSavedAdvice(savedAdvice: state.savedAdvice);
        if (isClosed) return;
        emit(
          state.copyWith(
            failureOrSuccessOption: optionOf(failureOrSuccessOption),
            savedAdvice: AttachmentFileBuffer.empty(),
          ),
        );
      },
    );
  }
}

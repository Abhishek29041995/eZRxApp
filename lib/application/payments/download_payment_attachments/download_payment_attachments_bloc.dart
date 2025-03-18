import 'package:ezrxmobile/domain/payments/entities/full_summary_filter.dart';

import 'package:ezrxmobile/domain/payments/entities/payment_summary_filter.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';

import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';

import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';

import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';

import 'package:ezrxmobile/domain/payments/repository/i_download_payment_attachment_repository.dart';

part 'download_payment_attachments_event.dart';
part 'download_payment_attachments_state.dart';
part 'download_payment_attachments_bloc.freezed.dart';

class DownloadPaymentAttachmentsBloc extends Bloc<
    DownloadPaymentAttachmentEvent, DownloadPaymentAttachmentsState> {
  final IDownloadPaymentAttachmentRepository paymentAttachmentRepository;

  DownloadPaymentAttachmentsBloc({required this.paymentAttachmentRepository})
      : super(DownloadPaymentAttachmentsState.initial()) {
    on<_Initialized>(
      (event, emit) {
        emit(
          DownloadPaymentAttachmentsState.initial().copyWith(
            customerCodeInfo: event.customerCodeInfo,
            salesOrganization: event.salesOrganization,
          ),
        );
      },
    );
    on<_FetchAllInvoiceUrl>(
      (event, emit) async {
        emit(
          state.copyWith(
            isDownloadInProgress: true,
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess =
            await paymentAttachmentRepository.fetchAllInvoiceUrl(
          customerCodeInfo: state.customerCodeInfo,
          salesOrganization: state.salesOrganization,
          queryObject: event.queryObject,
          isMarketPlace: event.isMarketPlace,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isDownloadInProgress: false,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (paymentSummaryUrl) => add(
            DownloadPaymentAttachmentEvent.downloadPaymentAttachment(
              files: paymentSummaryUrl,
            ),
          ),
        );
      },
    );
    on<_FetchAllCreditUrl>(
      (event, emit) async {
        emit(
          state.copyWith(
            isDownloadInProgress: true,
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess =
            await paymentAttachmentRepository.fetchAllCreditUrl(
          queryObject: event.queryObject,
          customerCodeInfo: state.customerCodeInfo,
          salesOrganization: state.salesOrganization,
          isMarketPlace: event.isMarketPlace,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isDownloadInProgress: false,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (paymentSummaryUrl) => add(
            DownloadPaymentAttachmentEvent.downloadPaymentAttachment(
              files: paymentSummaryUrl,
            ),
          ),
        );
      },
    );
    on<_FetchFullSummaryUrl>(
      (event, emit) async {
        emit(
          state.copyWith(
            isDownloadInProgress: true,
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess =
            await paymentAttachmentRepository.fetchFullSummaryUrl(
          queryObject: event.queryObject,
          customerCodeInfo: state.customerCodeInfo,
          salesOrganization: state.salesOrganization,
          isMarketPlace: event.isMarketPlace,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isDownloadInProgress: false,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (paymentSummaryUrl) => add(
            DownloadPaymentAttachmentEvent.downloadPaymentAttachment(
              files: paymentSummaryUrl,
            ),
          ),
        );
      },
    );
    on<_FetchPaymentSummaryUrl>(
      (event, emit) async {
        emit(
          state.copyWith(
            isDownloadInProgress: true,
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess =
            await paymentAttachmentRepository.fetchPaymentSummaryUrl(
          customerCodeInfo: state.customerCodeInfo,
          salesOrganization: state.salesOrganization,
          paymentSummaryFilter: event.paymentSummaryFilter,
          isMarketPlace: event.isMarketPlace,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isDownloadInProgress: false,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (paymentSummaryUrl) => add(
            DownloadPaymentAttachmentEvent.downloadPaymentAttachment(
              files: paymentSummaryUrl,
            ),
          ),
        );
      },
    );
    on<_DownloadPaymentAttachment>(
      (event, emit) async {
        final failureOrSuccessPermission =
            await paymentAttachmentRepository.downloadPermission();

        await failureOrSuccessPermission.fold(
          (failure) {
            if (isClosed) return;
            emit(
              state.copyWith(
                isDownloadInProgress: false,
                failureOrSuccessOption: optionOf(failureOrSuccessPermission),
              ),
            );
          },
          (_) async {
            final failureOrSuccess =
                await paymentAttachmentRepository.downloadFiles(
              files: event.files,
            );
            if (isClosed) return;
            failureOrSuccess.fold(
              (failure) => emit(
                state.copyWith(
                  isDownloadInProgress: false,
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                ),
              ),
              (_) => emit(
                state.copyWith(
                  isDownloadInProgress: false,
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                ),
              ),
            );
          },
        );
      },
    );
    on<_DownloadSOA>((event, emit) async {
      emit(
        state.copyWith(
          isDownloadInProgress: true,
          failureOrSuccessOption: none(),
          fileUrl: DownloadPaymentAttachment(
            url: event.soaData.getOrDefaultValue(''),
          ),
        ),
      );
      final failureOrSuccessPermission =
          await paymentAttachmentRepository.downloadPermission();

      await failureOrSuccessPermission.fold(
        (failure) {
          if (isClosed) return;
          emit(
            state.copyWith(
              isDownloadInProgress: false,
              failureOrSuccessOption: optionOf(failureOrSuccessPermission),
            ),
          );
        },
        (_) async {
          final failureOrSuccess =
              await paymentAttachmentRepository.soaDownload(
            soaData: event.soaData,
          );
          if (isClosed) return;
          failureOrSuccess.fold(
            (failure) => emit(
              state.copyWith(
                isDownloadInProgress: false,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            ),
            (_) => emit(
              state.copyWith(
                isDownloadInProgress: false,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            ),
          );
        },
      );
    });
  }
}

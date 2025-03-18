import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/payments/repository/i_download_payment_attachment_repository.dart';

part 'download_e_credit_event.dart';
part 'download_e_credit_state.dart';
part 'download_e_credit_bloc.freezed.dart';

class DownloadECreditBloc
    extends Bloc<DownloadECreditEvent, DownloadECreditState> {
  final IDownloadPaymentAttachmentRepository repository;
  DownloadECreditBloc({required this.repository})
      : super(DownloadECreditState.initial()) {
    on<DownloadECreditEvent>(_onEvent);
  }

  Future<void> _onEvent(
    DownloadECreditEvent event,
    Emitter<DownloadECreditState> emit,
  ) async {
    await event.map(
      downloadECredit: (e) async {
        emit(
          state.copyWith(isDownloading: true),
        );
        final failureOrSuccessPermission =
            await repository.downloadPermission();

        await failureOrSuccessPermission.fold(
          (failure) {
            if (isClosed) return;
            emit(
              state.copyWith(
                isDownloading: false,
                failureOrSuccessOption: optionOf(failureOrSuccessPermission),
              ),
            );
          },
          (_) async {
            final downloadFailureOrSuccess =
                await repository.eCreditInvoiceDownload(
              eCreditInvoiceUrl: state.fileUrl,
            );
            if (isClosed) return;
            downloadFailureOrSuccess.fold(
              (failure) => emit(
                state.copyWith(
                  isDownloading: false,
                  failureOrSuccessOption: optionOf(downloadFailureOrSuccess),
                ),
              ),
              (_) => emit(
                state.copyWith(
                  isDownloading: false,
                  failureOrSuccessOption: optionOf(downloadFailureOrSuccess),
                ),
              ),
            );
          },
        );
      },
      fetchECreditDownloadUrl: (e) async {
        emit(
          DownloadECreditState.initial(),
        );

        final failureOrSuccess = await repository.getECreditDownloadUrl(
          eCreditNumber: e.eCredit,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (eCreditUrl) => emit(
            state.copyWith(fileUrl: eCreditUrl),
          ),
        );
      },
    );
  }
}

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';
import 'package:ezrxmobile/domain/payments/repository/i_download_payment_attachment_repository.dart';
import 'package:ezrxmobile/domain/payments/repository/i_e_invoice_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_e_invoice_event.dart';
part 'download_e_invoice_state.dart';
part 'download_e_invoice_bloc.freezed.dart';

class DownloadEInvoiceBloc
    extends Bloc<DownloadEInvoiceEvent, DownloadEInvoiceState> {
  final IEInvoiceRepository eInvoiceRepository;
  final IDownloadPaymentAttachmentRepository
      downloadPaymentAttachmentRepository;
  DownloadEInvoiceBloc({
    required this.eInvoiceRepository,
    required this.downloadPaymentAttachmentRepository,
  }) : super(DownloadEInvoiceState.initial()) {
    on<DownloadEInvoiceEvent>(_onEvent);
  }

  Future<void> _onEvent(
    DownloadEInvoiceEvent event,
    Emitter<DownloadEInvoiceState> emit,
  ) async {
    await event.map(
      initialized: (_) {
        emit(DownloadEInvoiceState.initial());
      },
      fetchUrl: (e) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await eInvoiceRepository.getEInvoice(
          customerCodeInfo: e.customerCodeInfo,
          salesOrg: e.salesOrg,
          invoiceNumber: e.invoiceNumber,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (_) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (eInvoice) => emit(state.copyWith(eInvoiceUrl: eInvoice)),
        );
      },
      download: (e) async {
        emit(
          state.copyWith(
            isDownloading: true,
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccessPermission =
            await downloadPaymentAttachmentRepository.downloadPermission();

        await failureOrSuccessPermission.fold(
          (_) {
            if (isClosed) return;
            emit(
              state.copyWith(
                isDownloading: false,
                failureOrSuccessOption: optionOf(failureOrSuccessPermission),
              ),
            );
          },
          (_) async {
            final failureOrSuccess = await downloadPaymentAttachmentRepository
                .eCreditInvoiceDownload(
              eCreditInvoiceUrl: state.eInvoiceUrl,
            );
            if (isClosed) return;
            failureOrSuccess.fold(
              (_) => emit(
                state.copyWith(
                  isDownloading: false,
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                ),
              ),
              (eInvoice) => emit(
                state.copyWith(
                  isDownloading: false,
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                  eInvoice: eInvoice,
                ),
              ),
            );
          },
        );
      },
      openFile: (_) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess = await downloadPaymentAttachmentRepository
            .viewSavedFile(savedFile: state.eInvoice);
        if (isClosed) return;
        failureOrSuccess.fold(
          (_) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (_) {},
        );
      },
    );
  }
}

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:ezrxmobile/domain/order/repository/i_po_attachment_repository.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_summary_details_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_request_repository.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information_header.dart';

part 'return_details_by_request_event.dart';
part 'return_details_by_request_state.dart';
part 'return_details_by_request_bloc.freezed.dart';

class ReturnDetailsByRequestBloc
    extends Bloc<ReturnDetailsByRequestEvent, ReturnDetailsByRequestState> {
  final IReturnSummaryDetailsRepository returnRequestInformationRepository;
  final IReturnRequestRepository returnRequestRepository;
  final IpoAttachmentRepository poAttachmentRepository;

  ReturnDetailsByRequestBloc({
    required this.returnRequestInformationRepository,
    required this.returnRequestRepository,
    required this.poAttachmentRepository,
  }) : super(ReturnDetailsByRequestState.initial()) {
    on<ReturnDetailsByRequestEvent>(_onEvent);
  }
  Future<void> _onEvent(
    ReturnDetailsByRequestEvent event,
    Emitter<ReturnDetailsByRequestState> emit,
  ) async {
    await event.map(
      initialized: (_Initialized e) {
        emit(ReturnDetailsByRequestState.initial());
      },
      fetch: (_Fetch e) async {
        emit(
          state.copyWith(
            isLoading: true,
            failureOrSuccessOption: none(),
          ),
        );

        final returnInformationFailureOrSuccess =
            await returnRequestInformationRepository.getReturnRequestById(
          returnRequestId: ReturnRequestsId(requestId: e.returnId),
        );
        if (isClosed) return;
        returnInformationFailureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              isLoading: false,
              failureOrSuccessOption:
                  optionOf(returnInformationFailureOrSuccess),
            ),
          ),
          (returnSummaryDetailsByRequest) {
            emit(
              state.copyWith(
                requestInformation:
                    returnSummaryDetailsByRequest.returnRequestInformationList,
                requestInformationHeader:
                    returnSummaryDetailsByRequest.requestInformationHeader,
                failureOrSuccessOption: none(),
                isLoading: false,
              ),
            );
          },
        );
      },
      downloadFile: (_DownloadFile e) async {
        emit(
          state.copyWith(
            downloadFailureOrSuccessOption: none(),
            downloadedAttachment: PoDocuments.empty(),
            downloadingAttachments: [...state.downloadingAttachments, e.file],
          ),
        );
        final failureOrSuccessPermission =
            await poAttachmentRepository.downloadPermission();
        await failureOrSuccessPermission.fold(
          (_) async {
            if (isClosed) return;
            emit(
              state.copyWith(
                downloadedAttachment: e.file,
                downloadingAttachments: [...state.downloadingAttachments]
                  ..remove(e.file),
                downloadFailureOrSuccessOption:
                    optionOf(failureOrSuccessPermission),
              ),
            );
          },
          (success) async {
            final failureOrSuccess = await poAttachmentRepository.downloadFiles(
              files: [e.file],
            );
            if (isClosed) return;
            emit(
              state.copyWith(
                downloadedAttachment: e.file,
                downloadingAttachments: [...state.downloadingAttachments]
                  ..remove(e.file),
                downloadFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
        );
      },
    );
  }
}

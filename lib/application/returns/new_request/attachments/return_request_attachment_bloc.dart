import 'dart:async';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/order/repository/i_po_attachment_repository.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_request_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_request_attachment_event.dart';
part 'return_request_attachment_state.dart';
part 'return_request_attachment_bloc.freezed.dart';

class ReturnRequestAttachmentBloc
    extends Bloc<ReturnRequestAttachmentEvent, ReturnRequestAttachmentState> {
  final IReturnRequestRepository returnRequestRepository;
  final IpoAttachmentRepository poAttachmentRepository;

  ReturnRequestAttachmentBloc({
    required this.returnRequestRepository,
    required this.poAttachmentRepository,
  }) : super(ReturnRequestAttachmentState.initial()) {
    on<ReturnRequestAttachmentEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
    ReturnRequestAttachmentEvent event,
    Emitter<ReturnRequestAttachmentState> emit,
  ) async {
    await event.map(
      initialized: (e) {
        emit(ReturnRequestAttachmentState.initial());
      },
      uploadFile: (_UpLoadFile e) async {
        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
            returnUuid: e.returnUuid,
            uploadedFiles: <PoDocuments>[],
            fileOperationMode: FileOperationMode.upload,
          ),
        );
        final failureOrSuccessPermission =
            await returnRequestRepository.getPermission(
          uploadOptionType: e.uploadOptionType,
        );
        await failureOrSuccessPermission.fold(
          (failure) async {
            if (isClosed) return;
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccessPermission),
                isFetching: false,
              ),
            );
          },
          (success) async {
            final pickFilesFailureOrSuccess =
                await returnRequestRepository.pickFiles(
              uploadOptionType: e.uploadOptionType,
            );
            await pickFilesFailureOrSuccess.fold(
              (failure) async {
                if (isClosed) return;
                emit(
                  state.copyWith(
                    failureOrSuccessOption: optionOf(pickFilesFailureOrSuccess),
                    isFetching: false,
                  ),
                );
              },
              (files) async {
                if (isClosed) return;
                if (files.isEmpty) {
                  emit(
                    state.copyWith(
                      isFetching: false,
                    ),
                  );

                  return;
                }
                final uploadFilesFailureOrSuccess =
                    await poAttachmentRepository.uploadFiles(
                  files: files,
                  user: e.user,
                );
                if (isClosed) return;
                uploadFilesFailureOrSuccess.fold(
                  (failure) => emit(
                    state.copyWith(
                      failureOrSuccessOption:
                          optionOf(uploadFilesFailureOrSuccess),
                      isFetching: false,
                      uploadedFiles: <PoDocuments>[],
                      fileOperationMode: FileOperationMode.none,
                    ),
                  ),
                  (uploadedFiles) => emit(
                    state.copyWith(
                      failureOrSuccessOption:
                          optionOf(uploadFilesFailureOrSuccess),
                      uploadedFiles: uploadedFiles,
                      isFetching: false,
                      fileOperationMode: FileOperationMode.none,
                    ),
                  ),
                );
              },
            );
          },
        );
      },
      deleteFile: (_DeleteFile e) async {
        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
            fileOperationMode: FileOperationMode.delete,
          ),
        );
        final deleteFilesFailureOrSuccess =
            await poAttachmentRepository.deleteFile(
          filePath: e.file.name,
        );
        if (isClosed) return;
        emit(
          state.copyWith(
            failureOrSuccessOption: optionOf(deleteFilesFailureOrSuccess),
            fileOperationMode: FileOperationMode.none,
            isFetching: false,
          ),
        );
      },
      downloadFile: (_DownloadFile e) async {
        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
            fileOperationMode: FileOperationMode.download,
          ),
        );
        final failureOrSuccessPermission =
            await poAttachmentRepository.downloadPermission();
        await failureOrSuccessPermission.fold(
          (failure) async {
            if (isClosed) return;
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccessPermission),
                isFetching: false,
              ),
            );
          },
          (success) async {
            await poAttachmentRepository.downloadFiles(
              files: [e.file],
            );
            if (isClosed) return;
            emit(
              state.copyWith(
                failureOrSuccessOption: none(),
                fileOperationMode: FileOperationMode.none,
                isFetching: false,
              ),
            );
          },
        );
      },
    );
  }
}

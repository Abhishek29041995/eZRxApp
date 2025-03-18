import 'dart:async';
import 'dart:math';
import 'package:ezrxmobile/application/core/upload_option_type.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/order/repository/i_po_attachment_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/core/entities/po_documents.dart';

part 'po_attachment_event.dart';
part 'po_attachment_state.dart';
part 'po_attachment_bloc.freezed.dart';

class PoAttachmentBloc extends Bloc<PoAttachmentEvent, PoAttachmentState> {
  final IpoAttachmentRepository poAttachmentRepository;
  PoAttachmentBloc({
    required this.poAttachmentRepository,
  }) : super(PoAttachmentState.initial()) {
    on<PoAttachmentEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
    PoAttachmentEvent event,
    Emitter<PoAttachmentState> emit,
  ) async {
    await event.map(
      initialized: (e) {
        emit(PoAttachmentState.initial());
      },
      downloadFile: (_DownloadFile e) async {
        emit(
          state.copyWith(
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
              ),
            );
          },
          (_) async {
            final failureOrSuccess = await poAttachmentRepository.downloadFiles(
              files: e.files,
            );
            if (isClosed) return;
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
        );
      },
      openFile: (_OpenFile e) async {
        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
            fileUrl: [],
            fileOperationMode: FileOperationMode.view,
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
          (_) async {
            final failureOrSuccess = await poAttachmentRepository.openFile(
              files: e.files,
            );
            if (isClosed) return;
            failureOrSuccess.fold(
              (failure) => emit(
                state.copyWith(
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                  isFetching: false,
                ),
              ),
              (_) => emit(
                state.copyWith(
                  failureOrSuccessOption: none(),
                  isFetching: false,
                ),
              ),
            );
          },
        );
      },
      pickFile: (_PickFile e) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            fileOperationMode: FileOperationMode.none,
          ),
        );
        final failureOrSuccessPermission =
            await poAttachmentRepository.getPermission(
          uploadOptionType: e.uploadOptionType,
        );
        await failureOrSuccessPermission.fold(
          (failure) async {
            if (isClosed) return;
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccessPermission),
              ),
            );
          },
          (_) async {
            final pickFilesFailureOrSuccess =
                await poAttachmentRepository.pickFiles(
              uploadOptionType: e.uploadOptionType,
              submitTicketFileExtension: e.submitTicketFileExtension,
            );
            await pickFilesFailureOrSuccess.fold(
              (failure) async {
                if (isClosed) return;
                emit(
                  state.copyWith(
                    failureOrSuccessOption: optionOf(pickFilesFailureOrSuccess),
                  ),
                );
              },
              (files) {
                if (files.isNotEmpty) {
                  emit(
                    state.copyWith(
                      failureOrSuccessOption:
                          optionOf(pickFilesFailureOrSuccess),
                      localFiles: [...state.localFiles, ...files],
                    ),
                  );
                }
              },
            );
          },
        );
      },
      uploadFile: (_UpLoadFile e) async {
        if (state.localFiles.isEmpty) return;
        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
            fileOperationMode: FileOperationMode.none,
          ),
        );
        final uploadFilesFailureOrSuccess =
            await poAttachmentRepository.uploadFiles(
          files: state.localFiles,
          user: e.user,
        );
        if (isClosed) return;
        uploadFilesFailureOrSuccess.fold(
          (l) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(uploadFilesFailureOrSuccess),
              localFiles: <PlatformFile>[],
              isFetching: false,
            ),
          ),
          (r) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(uploadFilesFailureOrSuccess),
              fileUrl: [...r, ...state.fileUrl],
              localFiles: <PlatformFile>[],
              isFetching: false,
              fileOperationMode: FileOperationMode.upload,
            ),
          ),
        );
      },
      deleteFile: (_DeleteFile e) async {
        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
            fileOperationMode: FileOperationMode.none,
          ),
        );
        final deleteFilesFailureOrSuccess =
            await poAttachmentRepository.deleteFile(
          filePath: e.file.url,
        );
        if (isClosed) return;

        final newFileList = List<PoDocuments>.of(state.fileUrl);

        newFileList.removeWhere(
          (element) => element.url == e.file.url,
        );

        deleteFilesFailureOrSuccess.fold(
          (l) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(deleteFilesFailureOrSuccess),
              isFetching: false,
              fileUrl: [],
            ),
          ),
          (r) => emit(
            state.copyWith(
              failureOrSuccessOption: none(),
              fileUrl: newFileList,
              isFetching: false,
              fileOperationMode: FileOperationMode.delete,
            ),
          ),
        );
      },
      deleteLocalFile: (_DeleteLocalFile e) {
        final newFileList = List<PlatformFile>.of(state.localFiles)
          ..removeWhere(
            (element) => element == e.file,
          );

        emit(
          state.copyWith(
            localFiles: newFileList,
            fileOperationMode: FileOperationMode.delete,
          ),
        );
      },
    );
  }
}

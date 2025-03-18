import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/announcement_info/repository/i_announcement_attachment_repository.dart';
import 'package:ezrxmobile/domain/announcement_info/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement_attachment_event.dart';
part 'announcement_attachment_state.dart';
part 'announcement_attachment_bloc.freezed.dart';

class AnnouncementAttachmentBloc
    extends Bloc<AnnouncementAttachmentEvent, AnnouncementAttachmentState> {
  final IAnnouncementAttachmentRepository announcementAttachmentRepository;
  AnnouncementAttachmentBloc({
    required this.announcementAttachmentRepository,
  }) : super(AnnouncementAttachmentState.initial()) {
    on<AnnouncementAttachmentEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
    AnnouncementAttachmentEvent event,
    Emitter<AnnouncementAttachmentState> emit,
  ) async {
    await event.map(
      initialized: (e) {
        emit(AnnouncementAttachmentState.initial());
      },
      downloadFile: (_DownloadFile e) async {
        emit(
          state.copyWith(
            isDownloading: true,
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccessPermission =
            await announcementAttachmentRepository.downloadPermission();
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
            final failureOrSuccess =
                await announcementAttachmentRepository.downloadFiles(
              url: e.url,
            );
            if (isClosed) return;
            emit(
              state.copyWith(
                isDownloading: false,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
        );
      },
    );
  }
}

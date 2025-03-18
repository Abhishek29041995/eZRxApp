part of 'announcement_attachment_bloc.dart';

@freezed
class AnnouncementAttachmentState with _$AnnouncementAttachmentState {
  const AnnouncementAttachmentState._();
  const factory AnnouncementAttachmentState({
    required bool isDownloading,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
  }) = _AnnouncementAttachmentState;
  factory AnnouncementAttachmentState.initial() =>
      const AnnouncementAttachmentState(
        isDownloading: false,
        failureOrSuccessOption: None(),
      );
}

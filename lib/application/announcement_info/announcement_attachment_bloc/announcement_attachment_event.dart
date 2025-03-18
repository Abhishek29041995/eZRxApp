part of 'announcement_attachment_bloc.dart';

@freezed
class AnnouncementAttachmentEvent with _$AnnouncementAttachmentEvent {
  const factory AnnouncementAttachmentEvent.initialized() = _Initialized;
  const factory AnnouncementAttachmentEvent.downloadFile({
    required Attachment url,
  }) = _DownloadFile;
}

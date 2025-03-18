import 'package:ezrxmobile/domain/announcement_info/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement_info_details.freezed.dart';

@freezed
class AnnouncementInfoDetails with _$AnnouncementInfoDetails {
  const AnnouncementInfoDetails._();

  const factory AnnouncementInfoDetails({
    required String id,
    required String title,
    required HtmlContent content,
    required String summary,
    required String thumbnail,
    required DateTimeStringValue publishedDate,
    required String manufacturer,
    required String source,
    required String tag,
    required DateTimeStringValue releaseDate,
    required List<Attachment> documents,
  }) = _AnnouncementInfoDetails;

  factory AnnouncementInfoDetails.empty() => AnnouncementInfoDetails(
        id: '',
        title: '',
        content: HtmlContent(''),
        summary: '',
        thumbnail: '',
        publishedDate: DateTimeStringValue(''),
        manufacturer: '',
        source: '',
        tag: '',
        releaseDate: DateTimeStringValue(''),
        documents: <Attachment>[],
      );
}

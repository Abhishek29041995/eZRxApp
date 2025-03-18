import 'package:ezrxmobile/domain/announcement_info/entities/announcement_info_details.dart';
import 'package:ezrxmobile/domain/announcement_info/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_readvalue_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement_info_details_dto.freezed.dart';
part 'announcement_info_details_dto.g.dart';

@freezed
class AnnouncementInfoDetailsDto with _$AnnouncementInfoDetailsDto {
  const AnnouncementInfoDetailsDto._();

  const factory AnnouncementInfoDetailsDto({
    @JsonKey(name: 'id', defaultValue: '') required String id,
    @JsonKey(
      name: 'title',
      readValue: JsonReadValueHelper.readValueString,
      defaultValue: '',
    )
    required String title,
    @JsonKey(
      name: 'content',
      readValue: JsonReadValueHelper.readValueString,
      defaultValue: '',
    )
    required String content,
    @JsonKey(name: 'summary', defaultValue: '') required String summary,
    @JsonKey(
      name: 'thumbnail',
      readValue: JsonReadValueHelper.readSrcValue,
      defaultValue: '',
    )
    required String thumbnail,
    @JsonKey(
      name: 'publishedDate',
      readValue: JsonReadValueHelper.readValueDateISO,
      defaultValue: '',
    )
    required String publishedDate,
    @JsonKey(
      name: 'releaseDate',
      readValue: JsonReadValueHelper.readValueDateISO,
    )
    required String releaseDate,
    @JsonKey(
      name: 'manufacturer',
      readValue: JsonReadValueHelper.readValueString,
      defaultValue: '',
    )
    required String manufacturer,
    @JsonKey(
      name: 'source',
      readValue: JsonReadValueHelper.readValueString,
      defaultValue: '',
    )
    required String source,
    @JsonKey(name: 'tag', readValue: JsonReadValueHelper.readTagName)
    required String tag,
    @JsonKey(
      name: 'documents',
      readValue: JsonReadValueHelper.readDocumentsList,
    )
    required List<String> documentsList,
  }) = _AnnouncementInfoDetailsDto;

  AnnouncementInfoDetails get toDomain => AnnouncementInfoDetails(
        id: id,
        title: title,
        content: HtmlContent(content),
        summary: summary,
        thumbnail: thumbnail,
        publishedDate: DateTimeStringValue(publishedDate),
        manufacturer: manufacturer,
        source: source,
        tag: tag,
        releaseDate: DateTimeStringValue(releaseDate),
        documents: documentsList.map((e) => Attachment(e)).toList(),
      );

  factory AnnouncementInfoDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementInfoDetailsDtoFromJson(json);
}

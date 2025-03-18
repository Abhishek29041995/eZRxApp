import 'package:ezrxmobile/domain/announcement_info/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_readvalue_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';

part 'announcement_article_info_dto.freezed.dart';
part 'announcement_article_info_dto.g.dart';

@freezed
class AnnouncementArticleInfoDto with _$AnnouncementArticleInfoDto {
  const AnnouncementArticleInfoDto._();

  const factory AnnouncementArticleInfoDto({
    @JsonKey(
      name: 'pageInfo',
      defaultValue: '',
      readValue: JsonReadValueHelper.readEndCursorValue,
    )
    required String endCursor,
    @JsonKey(name: 'total', defaultValue: 0) required int total,
    @JsonKey(name: 'results', defaultValue: <AnnouncementArticleItemDto>[])
    required List<AnnouncementArticleItemDto> announcementList,
  }) = _AnnouncementArticleInfoDto;

  AnnouncementArticleInfo get toDomain => AnnouncementArticleInfo(
        total: total,
        endCursor: endCursor,
        announcementList: announcementList.map((e) => e.toDomain).toList(),
      );

  factory AnnouncementArticleInfoDto.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementArticleInfoDtoFromJson(json);
}

@freezed
class AnnouncementArticleItemDto with _$AnnouncementArticleItemDto {
  const AnnouncementArticleItemDto._();

  const factory AnnouncementArticleItemDto({
    @JsonKey(name: 'id', defaultValue: '') required String id,
    @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueString)
    required String title,
    @JsonKey(name: 'summary', readValue: JsonReadValueHelper.readValueString)
    required String summary,
    @JsonKey(name: 'thumbnail', readValue: JsonReadValueHelper.readSrcValue)
    required String thumbnail,
    @JsonKey(name: 'content', readValue: JsonReadValueHelper.readValueString)
    required String content,
    @JsonKey(
      name: 'publishedDate',
      readValue: JsonReadValueHelper.readValueDateISO,
    )
    required String publishedDate,
    @JsonKey(
      name: 'releaseDate',
      readValue: JsonReadValueHelper.readValueDateISO,
    )
    required String releaseDate,
    @JsonKey(name: 'branch', readValue: JsonReadValueHelper.readValueList)
    required List<BranchAndIc4InfoDto> branchInfo,
    @JsonKey(name: 'iC4', readValue: JsonReadValueHelper.readValueList)
    required List<BranchAndIc4InfoDto> iC4Info,
    @JsonKey(name: 'tag', readValue: JsonReadValueHelper.readTag)
    required String tag,
    @JsonKey(
      name: 'manufacturer',
      readValue: JsonReadValueHelper.readValueString,
    )
    required String manufacturer,
    @JsonKey(
      name: 'documents',
      readValue: JsonReadValueHelper.readDocumentsList,
    )
    required List<String> documentsList,
    @JsonKey(name: 'pinToTop', readValue: JsonReadValueHelper.readPinToTop)
    required bool pinToTop,
  }) = _AnnouncementArticleItemDto;

  factory AnnouncementArticleItemDto.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementArticleItemDtoFromJson(json);

  AnnouncementArticleItem get toDomain => AnnouncementArticleItem(
        id: id,
        title: title,
        content: HtmlContent(content),
        summary: summary,
        thumbnail: thumbnail,
        publishedDate: DateTimeStringValue(publishedDate),
        branchInfo: branchInfo.map((e) => e.toDomain).toList(),
        iC4Info: iC4Info.map((e) => e.toDomain).toList(),
        tag: tag,
        manufacturer: manufacturer,
        documents: documentsList,
        pinToTop: pinToTop,
        releaseDate: DateTimeStringValue(releaseDate),
      );
}

@freezed
class BranchAndIc4InfoDto with _$BranchAndIc4InfoDto {
  const BranchAndIc4InfoDto._();

  const factory BranchAndIc4InfoDto({
    @JsonKey(name: 'id', defaultValue: '') required String id,
    @JsonKey(name: 'name', defaultValue: '') required String name,
    @JsonKey(name: 'displayName', defaultValue: '') required String displayName,
  }) = _BranchAndIc4Dto;

  factory BranchAndIc4InfoDto.fromJson(Map<String, dynamic> json) =>
      _$BranchAndIc4InfoDtoFromJson(json);

  BranchAndIc4Info get toDomain => BranchAndIc4Info(
        id: id,
        displayName: displayName,
        name: name,
      );
}

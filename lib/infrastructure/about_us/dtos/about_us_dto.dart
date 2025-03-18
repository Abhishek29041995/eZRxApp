import 'package:ezrxmobile/domain/about_us/entities/about_us.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_readvalue_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_us_dto.freezed.dart';
part 'about_us_dto.g.dart';

@freezed
class AboutUsDto with _$AboutUsDto {
  const AboutUsDto._();

  const factory AboutUsDto({
    @JsonKey(readValue: bannerReadValue) required BannerTemplateDto banner,
    @JsonKey(readValue: certificationReadValue)
    required SliderTemplateDto certifications,
    @JsonKey(readValue: whoWeAreReadValue)
    required HorizontalListTemplateDto whoWeAre,
    @JsonKey(readValue: ourPartnerReadValue)
    required MediaListTemplateDto ourPartners,
    @JsonKey(readValue: contentSplitReadValue)
    required List<ContentSplitTemplateDto> contentSplit,
  }) = _AboutUsDto;

  AboutUs toDomain() {
    return AboutUs(
      banner: banner.toDomain,
      whoWeAre: whoWeAre.toDomain,
      ourPartners: ourPartners.toDomain,
      certifications: certifications.toDomain,
      contentSplit: contentSplit.map((e) => e.toDomain).toList(),
    );
  }

  factory AboutUsDto.fromJson(Map<String, dynamic> json) =>
      _$AboutUsDtoFromJson(json);
}

@freezed
class BannerTemplateDto with _$BannerTemplateDto {
  const BannerTemplateDto._();
  factory BannerTemplateDto({
    @JsonKey(name: 'media', readValue: mediaReadValue)
    required MediaValueDto media,
    @JsonKey(
      name: 'content',
      readValue: JsonReadValueHelper.readValueMapDynamic,
    )
    required TemplateValueItemDto content,
    @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueString)
    required String title,
    @JsonKey(name: 'buttonName', readValue: JsonReadValueHelper.readValueString)
    required String buttonName,
  }) = _BannerTemplateDto;

  factory BannerTemplateDto.fromJson(Map<String, dynamic> json) =>
      _$BannerTemplateDtoFromJson(json);

  BannerTemplate get toDomain => BannerTemplate(
        media: media.toDomain,
        content: content.value,
        buttonName: buttonName,
        title: title,
      );
}

@freezed
class SliderTemplateDto with _$SliderTemplateDto {
  const SliderTemplateDto._();
  factory SliderTemplateDto({
    @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
    required TemplateValueItemDto title,
    @JsonKey(name: 'certificates', readValue: JsonReadValueHelper.readValueList)
    required List<CertificationsDto> certificates,
  }) = _SliderTemplateDto;

  factory SliderTemplateDto.fromJson(Map<String, dynamic> json) =>
      _$SliderTemplateDtoFromJson(json);

  SliderTemplate get toDomain => SliderTemplate(
        title: title.value,
        certificates: certificates.map((e) => e.toDomain).toList(),
      );
}

@freezed
class CertificationsDto with _$CertificationsDto {
  const CertificationsDto._();
  factory CertificationsDto({
    @JsonKey(
      name: 'certificationType',
      readValue: JsonReadValueHelper.readValueMapDynamic,
    )
    required TemplateValueItemDto certificationType,
    @JsonKey(
      name: 'certificationName',
      readValue: JsonReadValueHelper.readValueMapDynamic,
    )
    required TemplateValueItemDto certificationName,
    @JsonKey(
      name: 'description',
      readValue: JsonReadValueHelper.readValueMapDynamic,
    )
    required TemplateValueItemDto description,
    @JsonKey(
      name: 'certificationYear',
      readValue: JsonReadValueHelper.readValueMapDynamic,
    )
    required TemplateValueItemDto certificationYear,
  }) = _CertificationsDto;

  factory CertificationsDto.fromJson(Map<String, dynamic> json) =>
      _$CertificationsDtoFromJson(json);

  Certifications get toDomain => Certifications(
        description: description.value,
        certificationName: certificationName.value,
        certificationType: certificationType.value,
        certificationYear: certificationYear.value,
      );
}

@freezed
class HorizontalListTemplateDto with _$HorizontalListTemplateDto {
  const HorizontalListTemplateDto._();
  factory HorizontalListTemplateDto({
    @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
    required TemplateValueItemDto title,
    @JsonKey(
      name: 'description',
      readValue: JsonReadValueHelper.readValueMapDynamic,
    )
    required TemplateValueItemDto description,
    @JsonKey(
      name: 'list',
      readValue: JsonReadValueHelper.readValueList,
    )
    required List<HorizontalListTemplateItemDto> achievements,
  }) = _HorizontalListTemplateDto;

  factory HorizontalListTemplateDto.fromJson(Map<String, dynamic> json) =>
      _$HorizontalListTemplateDtoFromJson(json);

  HorizontalListTemplate get toDomain => HorizontalListTemplate(
        title: title.value,
        description: description.value,
        achievements: achievements.map((e) => e.toDomain).toList(),
      );
}

@freezed
class HorizontalListTemplateItemDto with _$HorizontalListTemplateItemDto {
  const HorizontalListTemplateItemDto._();
  factory HorizontalListTemplateItemDto({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
    required TemplateValueItemDto title,
    @JsonKey(
      name: 'subTitle',
      readValue: JsonReadValueHelper.readValueMapDynamic,
    )
    required TemplateValueItemDto subTitle,
    @JsonKey(
      name: 'description',
    )
    required TemplateValueItemDto description,
  }) = _HorizontalListTemplateItemDto;

  factory HorizontalListTemplateItemDto.fromJson(Map<String, dynamic> json) =>
      _$HorizontalListTemplateItemDtoFromJson(json);

  HorizontalListTemplateItem get toDomain => HorizontalListTemplateItem(
        title: title.value,
        subTitle: subTitle.value,
        description: description.value,
      );
}

@freezed
class ContentSplitTemplateDto with _$ContentSplitTemplateDto {
  const ContentSplitTemplateDto._();

  const factory ContentSplitTemplateDto({
    @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
    required TemplateValueItemDto title,
    @JsonKey(
      name: 'subTitle',
      readValue: JsonReadValueHelper.readValueMapDynamic,
    )
    required TemplateValueItemDto subTitle,
    @JsonKey(
      name: 'description',
      readValue: JsonReadValueHelper.readValueMapDynamic,
    )
    required TemplateValueItemDto description,
    @JsonKey(
      name: 'media',
      readValue: mediaReadValue,
    )
    required MediaValueDto media,
  }) = _ContentSplitTemplateDto;

  factory ContentSplitTemplateDto.fromJson(Map<String, dynamic> json) =>
      _$ContentSplitTemplateDtoFromJson(json);

  ContentSplitTemplate get toDomain => ContentSplitTemplate(
        title: title.value,
        media: media.toDomain,
        subTitle: subTitle.value,
        description: description.value,
      );
}

@freezed
class MediaListTemplateDto with _$MediaListTemplateDto {
  const MediaListTemplateDto._();
  const factory MediaListTemplateDto({
    @JsonKey(name: 'title', readValue: JsonReadValueHelper.readValueMapDynamic)
    required TemplateValueItemDto title,
    @JsonKey(
      name: 'description',
      readValue: JsonReadValueHelper.readValueMapDynamic,
    )
    required TemplateValueItemDto description,
    @JsonKey(
      name: 'mediaItems',
      defaultValue: <MediaItemDto>[],
      readValue: JsonReadValueHelper.readValueList,
    )
    required List<MediaItemDto> mediaItems,
  }) = _MediaListTemplateDto;

  MediaListTemplate get toDomain => MediaListTemplate(
        title: title.value,
        description: description.value,
        mediaItems: mediaItems.map((e) => e.toDomain).toList(),
      );

  factory MediaListTemplateDto.fromJson(Map<String, dynamic> json) =>
      _$MediaListTemplateDtoFromJson(json);
}

@freezed
class MediaItemDto with _$MediaItemDto {
  const MediaItemDto._();
  factory MediaItemDto({
    @JsonKey(name: 'url') required TemplateValueItemDto url,
  }) = _MediaItemDto;

  MediaItem get toDomain => MediaItem(url: url.value);

  factory MediaItemDto.fromJson(Map<String, dynamic> json) =>
      _$MediaItemDtoFromJson(json);
}

@freezed
class MediaValueDto with _$MediaValueDto {
  const MediaValueDto._();
  factory MediaValueDto({
    @JsonKey(name: 'src', defaultValue: '') required String src,
  }) = _MediaValueDto;

  MediaValue get toDomain => MediaValue(src: src);

  factory MediaValueDto.fromJson(Map<String, dynamic> json) =>
      _$MediaValueDtoFromJson(json);
}

@freezed
class TemplateValueItemDto with _$TemplateValueItemDto {
  const factory TemplateValueItemDto({
    @JsonKey(name: 'value', defaultValue: '') required String value,
  }) = _TemplateValueItemDto;

  factory TemplateValueItemDto.fromJson(Map<String, dynamic> json) =>
      _$TemplateValueItemDtoFromJson(json);
}

Map<String, dynamic> mediaReadValue(Map json, String key) =>
    json[key]?['jsonValue']?['value'] ?? <String, dynamic>{};

Map<String, dynamic> whoWeAreReadValue(Map json, String _) {
  final values = json['value'] as List;

  return values.firstWhere(
    (element) =>
        (element['template']?['name'] ?? '').contains('Horizontal List'),
    orElse: () => <String, dynamic>{},
  );
}

Map<String, dynamic> certificationReadValue(Map json, String _) {
  final values = json['value'] as List;

  return values.firstWhere(
    (element) => (element['template']?['name'] ?? '').contains('Slider'),
    orElse: () => <String, dynamic>{},
  );
}

Map<String, dynamic> bannerReadValue(Map json, String _) {
  final values = json['value'] as List;

  return values.firstWhere(
    (element) => (element['template']?['name'] ?? '').contains('Banner'),
    orElse: () => <String, dynamic>{},
  );
}

Map<String, dynamic> ourPartnerReadValue(Map json, String _) {
  final values = json['value'] as List;

  return values.firstWhere(
    (element) => (element['template']?['name'] ?? '').contains('Media List'),
    orElse: () => <String, dynamic>{},
  );
}

List<dynamic> contentSplitReadValue(Map json, String _) {
  final values = json['value'] as List;

  return values
      .where(
        (element) =>
            (element['template']?['name'] ?? '').contains('Content Split'),
      )
      .toList();
}

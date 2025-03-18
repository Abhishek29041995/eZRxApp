import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_us.freezed.dart';

@freezed
class AboutUs with _$AboutUs {
  const AboutUs._();

  const factory AboutUs({
    required BannerTemplate banner,
    required List<ContentSplitTemplate> contentSplit,
    required SliderTemplate certifications,
    required MediaListTemplate ourPartners,
    required HorizontalListTemplate whoWeAre,
  }) = _AboutUs;

  factory AboutUs.empty() => AboutUs(
        banner: BannerTemplate.empty(),
        contentSplit: <ContentSplitTemplate>[],
        ourPartners: MediaListTemplate.empty(),
        certifications: SliderTemplate.empty(),
        whoWeAre: HorizontalListTemplate.empty(),
      );
}

@freezed
class SliderTemplate with _$SliderTemplate {
  const SliderTemplate._();
  const factory SliderTemplate({
    required String title,
    required List<Certifications> certificates,
  }) = _SliderTemplate;

  factory SliderTemplate.empty() => const SliderTemplate(
        title: '',
        certificates: <Certifications>[],
      );
}

@freezed
class Certifications with _$Certifications {
  const Certifications._();
  const factory Certifications({
    required String description,
    required String certificationType,
    required String certificationName,
    required String certificationYear,
  }) = _Certifications;

  factory Certifications.empty() => const Certifications(
        description: '',
        certificationType: '',
        certificationName: '',
        certificationYear: '',
      );
}

@freezed
class HorizontalListTemplate with _$HorizontalListTemplate {
  const HorizontalListTemplate._();
  const factory HorizontalListTemplate({
    required String title,
    required String description,
    required List<HorizontalListTemplateItem> achievements,
  }) = _HorizontalListTemplate;

  factory HorizontalListTemplate.empty() => const HorizontalListTemplate(
        title: '',
        description: '',
        achievements: <HorizontalListTemplateItem>[],
      );
}

@freezed
class HorizontalListTemplateItem with _$HorizontalListTemplateItem {
  const HorizontalListTemplateItem._();
  const factory HorizontalListTemplateItem({
    required String title,
    required String subTitle,
    required String description,
  }) = _HorizontalListTemplateItem;

  factory HorizontalListTemplateItem.empty() =>
      const HorizontalListTemplateItem(
        title: '',
        subTitle: '',
        description: '',
      );
}

@freezed
class ContentSplitTemplate with _$ContentSplitTemplate {
  const ContentSplitTemplate._();
  const factory ContentSplitTemplate({
    required String title,
    required String subTitle,
    required MediaValue media,
    required String description,
  }) = _WhyUs;

  factory ContentSplitTemplate.empty() => ContentSplitTemplate(
        title: '',
        subTitle: '',
        description: '',
        media: MediaValue.empty(),
      );
}

@freezed
class MediaListTemplate with _$MediaListTemplate {
  const MediaListTemplate._();
  const factory MediaListTemplate({
    required String title,
    required String description,
    required List<MediaItem> mediaItems,
  }) = _MediaListTemplate;

  factory MediaListTemplate.empty() => const MediaListTemplate(
        title: '',
        description: '',
        mediaItems: <MediaItem>[],
      );
}

@freezed
class MediaItem with _$MediaItem {
  const MediaItem._();
  const factory MediaItem({required String url}) = _MediaItem;

  factory MediaItem.empty() => const MediaItem(url: '');
}

@freezed
class BannerTemplate with _$BannerTemplate {
  factory BannerTemplate({
    required String content,
    required MediaValue media,
    required String title,
    required String buttonName,
  }) = _BannerTemplate;

  factory BannerTemplate.empty() => BannerTemplate(
        content: '',
        buttonName: '',
        title: '',
        media: MediaValue.empty(),
      );
}

@freezed
class MediaValue with _$MediaValue {
  factory MediaValue({required String src}) = _MediaValue;

  factory MediaValue.empty() => MediaValue(src: '');
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_us_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AboutUsDtoImpl _$$AboutUsDtoImplFromJson(Map<String, dynamic> json) =>
    _$AboutUsDtoImpl(
      banner: BannerTemplateDto.fromJson(
          bannerReadValue(json, 'banner') as Map<String, dynamic>),
      certifications: SliderTemplateDto.fromJson(
          certificationReadValue(json, 'certifications')
              as Map<String, dynamic>),
      whoWeAre: HorizontalListTemplateDto.fromJson(
          whoWeAreReadValue(json, 'whoWeAre') as Map<String, dynamic>),
      ourPartners: MediaListTemplateDto.fromJson(
          ourPartnerReadValue(json, 'ourPartners') as Map<String, dynamic>),
      contentSplit:
          (contentSplitReadValue(json, 'contentSplit') as List<dynamic>)
              .map((e) =>
                  ContentSplitTemplateDto.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$AboutUsDtoImplToJson(_$AboutUsDtoImpl instance) =>
    <String, dynamic>{
      'banner': instance.banner.toJson(),
      'certifications': instance.certifications.toJson(),
      'whoWeAre': instance.whoWeAre.toJson(),
      'ourPartners': instance.ourPartners.toJson(),
      'contentSplit': instance.contentSplit.map((e) => e.toJson()).toList(),
    };

_$BannerTemplateDtoImpl _$$BannerTemplateDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$BannerTemplateDtoImpl(
      media: MediaValueDto.fromJson(
          mediaReadValue(json, 'media') as Map<String, dynamic>),
      content: TemplateValueItemDto.fromJson(
          JsonReadValueHelper.readValueMapDynamic(json, 'content')
              as Map<String, dynamic>),
      title: JsonReadValueHelper.readValueString(json, 'title') as String,
      buttonName:
          JsonReadValueHelper.readValueString(json, 'buttonName') as String,
    );

Map<String, dynamic> _$$BannerTemplateDtoImplToJson(
        _$BannerTemplateDtoImpl instance) =>
    <String, dynamic>{
      'media': instance.media.toJson(),
      'content': instance.content.toJson(),
      'title': instance.title,
      'buttonName': instance.buttonName,
    };

_$SliderTemplateDtoImpl _$$SliderTemplateDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$SliderTemplateDtoImpl(
      title: TemplateValueItemDto.fromJson(
          JsonReadValueHelper.readValueMapDynamic(json, 'title')
              as Map<String, dynamic>),
      certificates: (JsonReadValueHelper.readValueList(json, 'certificates')
              as List<dynamic>)
          .map((e) => CertificationsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SliderTemplateDtoImplToJson(
        _$SliderTemplateDtoImpl instance) =>
    <String, dynamic>{
      'title': instance.title.toJson(),
      'certificates': instance.certificates.map((e) => e.toJson()).toList(),
    };

_$CertificationsDtoImpl _$$CertificationsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CertificationsDtoImpl(
      certificationType: TemplateValueItemDto.fromJson(
          JsonReadValueHelper.readValueMapDynamic(json, 'certificationType')
              as Map<String, dynamic>),
      certificationName: TemplateValueItemDto.fromJson(
          JsonReadValueHelper.readValueMapDynamic(json, 'certificationName')
              as Map<String, dynamic>),
      description: TemplateValueItemDto.fromJson(
          JsonReadValueHelper.readValueMapDynamic(json, 'description')
              as Map<String, dynamic>),
      certificationYear: TemplateValueItemDto.fromJson(
          JsonReadValueHelper.readValueMapDynamic(json, 'certificationYear')
              as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CertificationsDtoImplToJson(
        _$CertificationsDtoImpl instance) =>
    <String, dynamic>{
      'certificationType': instance.certificationType.toJson(),
      'certificationName': instance.certificationName.toJson(),
      'description': instance.description.toJson(),
      'certificationYear': instance.certificationYear.toJson(),
    };

_$HorizontalListTemplateDtoImpl _$$HorizontalListTemplateDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$HorizontalListTemplateDtoImpl(
      title: TemplateValueItemDto.fromJson(
          JsonReadValueHelper.readValueMapDynamic(json, 'title')
              as Map<String, dynamic>),
      description: TemplateValueItemDto.fromJson(
          JsonReadValueHelper.readValueMapDynamic(json, 'description')
              as Map<String, dynamic>),
      achievements: (JsonReadValueHelper.readValueList(json, 'list')
              as List<dynamic>)
          .map((e) =>
              HorizontalListTemplateItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HorizontalListTemplateDtoImplToJson(
        _$HorizontalListTemplateDtoImpl instance) =>
    <String, dynamic>{
      'title': instance.title.toJson(),
      'description': instance.description.toJson(),
      'list': instance.achievements.map((e) => e.toJson()).toList(),
    };

_$HorizontalListTemplateItemDtoImpl
    _$$HorizontalListTemplateItemDtoImplFromJson(Map<String, dynamic> json) =>
        _$HorizontalListTemplateItemDtoImpl(
          name: json['name'] as String,
          title: TemplateValueItemDto.fromJson(
              JsonReadValueHelper.readValueMapDynamic(json, 'title')
                  as Map<String, dynamic>),
          subTitle: TemplateValueItemDto.fromJson(
              JsonReadValueHelper.readValueMapDynamic(json, 'subTitle')
                  as Map<String, dynamic>),
          description: TemplateValueItemDto.fromJson(
              json['description'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$$HorizontalListTemplateItemDtoImplToJson(
        _$HorizontalListTemplateItemDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title.toJson(),
      'subTitle': instance.subTitle.toJson(),
      'description': instance.description.toJson(),
    };

_$ContentSplitTemplateDtoImpl _$$ContentSplitTemplateDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ContentSplitTemplateDtoImpl(
      title: TemplateValueItemDto.fromJson(
          JsonReadValueHelper.readValueMapDynamic(json, 'title')
              as Map<String, dynamic>),
      subTitle: TemplateValueItemDto.fromJson(
          JsonReadValueHelper.readValueMapDynamic(json, 'subTitle')
              as Map<String, dynamic>),
      description: TemplateValueItemDto.fromJson(
          JsonReadValueHelper.readValueMapDynamic(json, 'description')
              as Map<String, dynamic>),
      media: MediaValueDto.fromJson(
          mediaReadValue(json, 'media') as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ContentSplitTemplateDtoImplToJson(
        _$ContentSplitTemplateDtoImpl instance) =>
    <String, dynamic>{
      'title': instance.title.toJson(),
      'subTitle': instance.subTitle.toJson(),
      'description': instance.description.toJson(),
      'media': instance.media.toJson(),
    };

_$MediaListTemplateDtoImpl _$$MediaListTemplateDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$MediaListTemplateDtoImpl(
      title: TemplateValueItemDto.fromJson(
          JsonReadValueHelper.readValueMapDynamic(json, 'title')
              as Map<String, dynamic>),
      description: TemplateValueItemDto.fromJson(
          JsonReadValueHelper.readValueMapDynamic(json, 'description')
              as Map<String, dynamic>),
      mediaItems: (JsonReadValueHelper.readValueList(json, 'mediaItems')
                  as List<dynamic>?)
              ?.map((e) => MediaItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$MediaListTemplateDtoImplToJson(
        _$MediaListTemplateDtoImpl instance) =>
    <String, dynamic>{
      'title': instance.title.toJson(),
      'description': instance.description.toJson(),
      'mediaItems': instance.mediaItems.map((e) => e.toJson()).toList(),
    };

_$MediaItemDtoImpl _$$MediaItemDtoImplFromJson(Map<String, dynamic> json) =>
    _$MediaItemDtoImpl(
      url: TemplateValueItemDto.fromJson(json['url'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MediaItemDtoImplToJson(_$MediaItemDtoImpl instance) =>
    <String, dynamic>{
      'url': instance.url.toJson(),
    };

_$MediaValueDtoImpl _$$MediaValueDtoImplFromJson(Map<String, dynamic> json) =>
    _$MediaValueDtoImpl(
      src: json['src'] as String? ?? '',
    );

Map<String, dynamic> _$$MediaValueDtoImplToJson(_$MediaValueDtoImpl instance) =>
    <String, dynamic>{
      'src': instance.src,
    };

_$TemplateValueItemDtoImpl _$$TemplateValueItemDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$TemplateValueItemDtoImpl(
      value: json['value'] as String? ?? '',
    );

Map<String, dynamic> _$$TemplateValueItemDtoImplToJson(
        _$TemplateValueItemDtoImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
    };

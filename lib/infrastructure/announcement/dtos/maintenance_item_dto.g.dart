// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaintenanceItemDtoImpl _$$MaintenanceItemDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$MaintenanceItemDtoImpl(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      displayName: json['displayName'] as String? ?? '',
      maxNumberOfItem:
          (JsonReadValueHelper.readMaximumOfItem(json, 'maxNumberOfItem')
                      as num?)
                  ?.toInt() ??
              0,
      banners:
          (JsonReadValueHelper.readValueList(json, 'banners') as List<dynamic>?)
                  ?.map((e) =>
                      MaintenanceBannerDto.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
    );

_$MaintenanceBannerDtoImpl _$$MaintenanceBannerDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$MaintenanceBannerDtoImpl(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      template: JsonReadValueHelper.readName(json, 'template') as String? ?? '',
      displayName: json['displayName'] as String? ?? '',
      content:
          JsonReadValueHelper.readValueString(json, 'content') as String? ?? '',
      publishedDate: PublishedDateDto.fromJson(
          json['publishedDate'] as Map<String, dynamic>),
      hyperlink:
          JsonReadValueHelper.readHyperLink(json, 'hyperlink') as String? ?? '',
      type: JsonReadValueHelper.readValueString(json, 'type') as String? ?? '',
      applicableModules:
          (JsonReadValueHelper.readValueList(json, 'applicableModules')
                      as List<dynamic>?)
                  ?.map((e) =>
                      ApplicableModulesDto.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
      enableCrossButton:
          JsonReadValueHelper.readValueBoolean(json, 'enableCrossButton')
                  as bool? ??
              false,
      loginType:
          JsonReadValueHelper.readValueString(json, 'login') as String? ?? '',
    );

Map<String, dynamic> _$$MaintenanceBannerDtoImplToJson(
        _$MaintenanceBannerDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'template': instance.template,
      'displayName': instance.displayName,
      'content': instance.content,
      'publishedDate': instance.publishedDate.toJson(),
      'hyperlink': instance.hyperlink,
      'type': instance.type,
      'applicableModules':
          instance.applicableModules.map((e) => e.toJson()).toList(),
      'enableCrossButton': instance.enableCrossButton,
      'login': instance.loginType,
    };

_$ApplicableModulesDtoImpl _$$ApplicableModulesDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ApplicableModulesDtoImpl(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      displayName: json['displayName'] as String? ?? '',
    );

Map<String, dynamic> _$$ApplicableModulesDtoImplToJson(
        _$ApplicableModulesDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'displayName': instance.displayName,
    };

_$PublishedDateDtoImpl _$$PublishedDateDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PublishedDateDtoImpl(
      isoValue: json['isoValue'] as String? ?? '',
      formattedDateValue: json['formattedDateValue'] as String? ?? '',
    );

Map<String, dynamic> _$$PublishedDateDtoImplToJson(
        _$PublishedDateDtoImpl instance) =>
    <String, dynamic>{
      'isoValue': instance.isoValue,
      'formattedDateValue': instance.formattedDateValue,
    };

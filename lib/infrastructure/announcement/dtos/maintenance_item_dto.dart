import 'package:ezrxmobile/domain/announcement/entities/maintenance_item.dart';
import 'package:ezrxmobile/domain/announcement/value/value_objects.dart';
import 'package:ezrxmobile/domain/banner/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_readvalue_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'maintenance_item_dto.freezed.dart';

part 'maintenance_item_dto.g.dart';

@Freezed(toJson: false)
class MaintenanceItemDto with _$MaintenanceItemDto {
  const MaintenanceItemDto._();

  const factory MaintenanceItemDto({
    @JsonKey(name: 'id', defaultValue: '') required String id,
    @JsonKey(name: 'name', defaultValue: '') required String name,
    @JsonKey(name: 'displayName', defaultValue: '') required String displayName,
    @JsonKey(
      name: 'maxNumberOfItem',
      defaultValue: 0,
      readValue: JsonReadValueHelper.readMaximumOfItem,
    )
    required int maxNumberOfItem,
    @JsonKey(
      name: 'banners',
      defaultValue: [],
      readValue: JsonReadValueHelper.readValueList,
    )
    required List<MaintenanceBannerDto> banners,
  }) = _MaintenanceItemDto;

  MaintenanceItem get toDomain => MaintenanceItem.empty().copyWith(
        id: id,
        displayName: displayName,
        maxNumberOfItem: maxNumberOfItem,
        banners: banners.map((e) => e.toDomain).toList(),
      );

  factory MaintenanceItemDto.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceItemDtoFromJson(json);
}

@freezed
class MaintenanceBannerDto with _$MaintenanceBannerDto {
  const MaintenanceBannerDto._();

  const factory MaintenanceBannerDto({
    @JsonKey(name: 'id', defaultValue: '') required String id,
    @JsonKey(name: 'name', defaultValue: '') required String name,
    @JsonKey(
      name: 'template',
      defaultValue: '',
      readValue: JsonReadValueHelper.readName,
    )
    required String template,
    @JsonKey(name: 'displayName', defaultValue: '') required String displayName,
    @JsonKey(
      name: 'content',
      defaultValue: '',
      readValue: JsonReadValueHelper.readValueString,
    )
    required String content,
    @JsonKey(name: 'publishedDate') required PublishedDateDto publishedDate,
    @JsonKey(
      name: 'hyperlink',
      defaultValue: '',
      readValue: JsonReadValueHelper.readHyperLink,
    )
    required String hyperlink,
    @JsonKey(
      name: 'type',
      defaultValue: '',
      readValue: JsonReadValueHelper.readValueString,
    )
    required String type,
    @JsonKey(
      name: 'applicableModules',
      defaultValue: [],
      readValue: JsonReadValueHelper.readValueList,
    )
    required List<ApplicableModulesDto> applicableModules,
    @JsonKey(
      name: 'enableCrossButton',
      defaultValue: false,
      readValue: JsonReadValueHelper.readValueBoolean,
    )
    required bool enableCrossButton,
    @JsonKey(
      name: 'login',
      defaultValue: '',
      readValue: JsonReadValueHelper.readValueString,
    )
    required String loginType,
  }) = _MaintenanceBannerDto;

  MaintenanceBanner get toDomain => MaintenanceBanner.empty().copyWith(
        id: id,
        displayName: displayName,
        hyperlink: EZReachBannerLink(hyperlink),
        content: content,
        isoDateValue: publishedDate.isoValue,
        formattedDateValue: publishedDate.formattedDateValue,
        applicableModules: applicableModules.map((e) => e.toDomain).toList(),
        type: type,
        enableCrossButton: enableCrossButton,
        loginType: AnnouncementDislayTime(loginType),
      );

  factory MaintenanceBannerDto.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceBannerDtoFromJson(json);
}

@freezed
class ApplicableModulesDto with _$ApplicableModulesDto {
  const ApplicableModulesDto._();

  const factory ApplicableModulesDto({
    @JsonKey(name: 'id', defaultValue: '') required String id,
    @JsonKey(name: 'name', defaultValue: '') required String name,
    @JsonKey(name: 'displayName', defaultValue: '') required String displayName,
  }) = _ApplicableModulesDto;

  ApplicableModules get toDomain => ApplicableModules.empty().copyWith(
        id: id,
        displayName: AnnouncementDislayModule(displayName),
        name: AnnouncementDislayModule(name),
      );

  factory ApplicableModulesDto.fromJson(Map<String, dynamic> json) =>
      _$ApplicableModulesDtoFromJson(json);
}

@freezed
class PublishedDateDto with _$PublishedDateDto {
  const PublishedDateDto._();

  const factory PublishedDateDto({
    @JsonKey(name: 'isoValue', defaultValue: '') required String isoValue,
    @JsonKey(name: 'formattedDateValue', defaultValue: '')
    required String formattedDateValue,
  }) = _PublishedDateDto;

  factory PublishedDateDto.fromJson(Map<String, dynamic> json) =>
      _$PublishedDateDtoFromJson(json);
}

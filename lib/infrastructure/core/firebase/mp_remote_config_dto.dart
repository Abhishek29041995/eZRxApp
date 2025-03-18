import 'package:ezrxmobile/domain/core/entities/mp_remote_config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mp_remote_config_dto.freezed.dart';
part 'mp_remote_config_dto.g.dart';

@freezed
class MPRemoteConfigDto with _$MPRemoteConfigDto {
  const MPRemoteConfigDto._();

  const factory MPRemoteConfigDto({
    @JsonKey(name: 'marketplaceConfig')
        required MPRemoteConfigValueDto marketplaceConfig,
  }) = _MPRemoteConfigDto;

  factory MPRemoteConfigDto.fromJson(Map<String, dynamic> json) =>
      _$MPRemoteConfigDtoFromJson(json);

  factory MPRemoteConfigDto.fromDomain(MPRemoteConfig entity) =>
      MPRemoteConfigDto(
        marketplaceConfig: MPRemoteConfigValueDto(whiteList: entity.whiteList),
      );

  MPRemoteConfig get toDomain => MPRemoteConfig(
        //Need convert to lowercase because value in AppMarket is lowercase
        whiteList:
            marketplaceConfig.whiteList.map((e) => e.toLowerCase()).toList(),
      );
}

@freezed
class MPRemoteConfigValueDto with _$MPRemoteConfigValueDto {
  const MPRemoteConfigValueDto._();

  const factory MPRemoteConfigValueDto({
    @JsonKey(name: 'whitelist') required List<String> whiteList,
  }) = _MPRemoteConfigValueDto;

  factory MPRemoteConfigValueDto.fromJson(Map<String, dynamic> json) =>
      _$MPRemoteConfigValueDtoFromJson(json);
}

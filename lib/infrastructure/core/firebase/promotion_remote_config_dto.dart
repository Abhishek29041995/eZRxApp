import 'package:ezrxmobile/domain/core/entities/promotion_remote_config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'promotion_remote_config_dto.freezed.dart';
part 'promotion_remote_config_dto.g.dart';

@freezed
class PromotionRemoteConfigDto with _$PromotionRemoteConfigDto {
  const PromotionRemoteConfigDto._();

  const factory PromotionRemoteConfigDto({
    @JsonKey(name: 'blacklist') required List<String> blacklist,
  }) = _PromotionRemoteConfigDto;

  PromotionRemoteConfig get toDomain => PromotionRemoteConfig(
        blackList: blacklist.map((e) => e).toList(),
      );

  factory PromotionRemoteConfigDto.fromDomain(PromotionRemoteConfig entity) =>
      PromotionRemoteConfigDto(
        blacklist: entity.blackList,
      );

  factory PromotionRemoteConfigDto.fromJson(Map<String, dynamic> json) =>
      _$PromotionRemoteConfigDtoFromJson(json);
}

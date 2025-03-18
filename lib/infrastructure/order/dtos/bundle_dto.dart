import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_readvalue_helper.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/bundle_info_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bundle_dto.freezed.dart';
part 'bundle_dto.g.dart';

@freezed
class BundleDto with _$BundleDto {
  const BundleDto._();

  const factory BundleDto({
    @JsonKey(name: 'bundleName', defaultValue: '') required String bundleName,
    @JsonKey(name: 'bundleCode', defaultValue: '') required String bundleCode,
    @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
    required List<BundleInfoDto> bundleInformation,
    @JsonKey(
      name: 'materials',
      readValue: JsonReadValueHelper.handleEmptyMaterialList,
    )
    required List<MaterialDto> materials,
    @JsonKey(name: 'conditions', defaultValue: '') required String conditions,
    @JsonKey(name: 'bonusEligible', defaultValue: false)
    required bool bonusEligible,
  }) = _BundleDto;

  Bundle toDomain() {
    return Bundle(
      materials: materials.map((e) => e.toDomain()).toList(),
      bundleName: BundleName(bundleName),
      bundleCode: bundleCode,
      bundleInformation: bundleInformation.map((e) => e.toDomain()).toList(),
      conditions: conditions,
      bonusEligible: bonusEligible,
    );
  }

  factory BundleDto.fromJson(Map<String, dynamic> json) =>
      _$BundleDtoFromJson(json);
}

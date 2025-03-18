import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_override.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/submit_material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_readvalue_helper.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_item_override_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_material_item_bonus_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_tender_contract_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_material_info_dto.freezed.dart';

part 'submit_material_info_dto.g.dart';

@freezed
class SubmitMaterialInfoDto with _$SubmitMaterialInfoDto {
  const SubmitMaterialInfoDto._();

  const factory SubmitMaterialInfoDto({
    @JsonKey(name: 'materialNumber', defaultValue: '')
    required String materialNumber,
    @JsonKey(name: 'qty', defaultValue: 0) required int qty,
    @JsonKey(name: 'bonuses', defaultValue: <SubmitMaterialItemBonusDto>[])
    required List<SubmitMaterialItemBonusDto> bonuses,
    @JsonKey(name: 'Comment', defaultValue: '') required String comment,
    @JsonKey(name: 'ParentID', defaultValue: '') required String parentId,
    @JsonKey(
      name: 'override',
      toJson: overrideTojson,
      readValue: JsonReadValueHelper.readValueMapDynamic,
      includeIfNull: false,
    )
    required MaterialItemOverrideDto materialItemOverride,
    @JsonKey(name: 'ProductType', defaultValue: '') required String productType,
    @JsonKey(name: 'price', defaultValue: 0) required double price,
    @JsonKey(name: 'tax', defaultValue: 0) required double tax,
    @JsonKey(name: 'Mrp', defaultValue: 0) required double mrp,
    @JsonKey(name: 'PromoStatus', defaultValue: false)
    required bool promoStatus,
    @JsonKey(name: 'PromoType', defaultValue: '') required String promoType,
    @JsonKey(name: 'PrincipalCode', defaultValue: '')
    required String principalCode,
    @JsonKey(name: 'PrincipalName', defaultValue: '')
    required String principalName,
    @JsonKey(name: 'salesDistrict', defaultValue: '')
    required String salesDistrict,

    ///Todo: consider to delete it
    @JsonKey(
      name: 'batch',
      defaultValue: '',
      toJson: overrideBatchJson,
      includeIfNull: false,
    )
    required String batch,
    @JsonKey(name: 'isCounterOffer', defaultValue: false)
    required bool isCounterOffer,
    @JsonKey(
      name: 'contract',
      readValue: JsonReadValueHelper.readValueMapDynamic,
      toJson: overridecontractJson,
      includeIfNull: false,
    )
    required SubmitTenderContractDto contract,
  }) = _SubmitMaterialInfoDto;

  SubmitMaterialInfo toDomain() {
    return SubmitMaterialInfo(
      materialNumber: MaterialNumber(materialNumber),
      quantity: qty,
      bonuses: bonuses.map((e) => e.toDomain()).toList(),
      comment: comment,
      batch: StringValue(batch),
      materialItemOverride: MaterialItemOverride.empty(),
      parentID: parentId,
      productType: '',
      price: price,
      tax: tax,
      mrp: mrp,
      promoStatus: promoStatus,
      promoType: promoType,
      principalData: PrincipalData.empty().copyWith(
        principalName: PrincipalName(principalName),
        principalCode: PrincipalCode(principalCode),
      ),
      isCounterOffer: isCounterOffer,
      contract: contract.toDomain(),
      salesDistrict: salesDistrict,
    );
  }

  factory SubmitMaterialInfoDto.fromDomain(
    SubmitMaterialInfo submitMaterialInfo,
  ) {
    return SubmitMaterialInfoDto(
      materialNumber: submitMaterialInfo.materialNumber.getOrCrash(),
      qty: submitMaterialInfo.quantity,
      bonuses: submitMaterialInfo.bonuses
          .map(
            (e) => SubmitMaterialItemBonusDto.fromDomain(e),
          )
          .toList(),
      comment: submitMaterialInfo.comment,
      batch: submitMaterialInfo.batch.getOrDefaultValue(''),
      materialItemOverride: MaterialItemOverrideDto.fromDomain(
        submitMaterialInfo.materialItemOverride,
      ),
      parentId: submitMaterialInfo.parentID,
      productType: submitMaterialInfo.productType,
      price: submitMaterialInfo.price,
      tax: submitMaterialInfo.tax,
      mrp: submitMaterialInfo.mrp,
      promoStatus: submitMaterialInfo.promoStatus,
      promoType: submitMaterialInfo.promoType,
      principalCode:
          submitMaterialInfo.principalData.principalCode.getOrDefaultValue(''),
      principalName:
          submitMaterialInfo.principalData.principalName.getOrDefaultValue(''),
      isCounterOffer: submitMaterialInfo.isCounterOffer,
      contract: SubmitTenderContractDto.fromDomain(submitMaterialInfo.contract),
      salesDistrict: submitMaterialInfo.salesDistrict,
    );
  }

  factory SubmitMaterialInfoDto.fromJson(Map<String, dynamic> json) =>
      _$SubmitMaterialInfoDtoFromJson(json);
}

dynamic overrideTojson(MaterialItemOverrideDto value) {
  if (value.percentageOverride.isEmpty &&
      value.valueOverride.isEmpty &&
      value.reference.isEmpty) {
    return null;
  }

  return value.toJson();
}

String? overrideBatchJson(String batch) {
  if (batch.isEmpty) {
    return null;
  }

  return batch;
}

SubmitTenderContractDto? overridecontractJson(
  SubmitTenderContractDto contract,
) {
  if (contract == SubmitTenderContractDto.empty) {
    return null;
  }

  return contract;
}

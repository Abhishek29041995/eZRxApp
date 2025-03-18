import 'package:ezrxmobile/domain/order/entities/combo_material_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_readvalue_helper.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_combo_deal_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'combo_material_item_dto.freezed.dart';
part 'combo_material_item_dto.g.dart';

@freezed
class ComboMaterialItemDto with _$ComboMaterialItemDto {
  const ComboMaterialItemDto._();

  const factory ComboMaterialItemDto({
    @JsonKey(name: 'productID', defaultValue: '') required String productId,
    @JsonKey(name: 'parentID', defaultValue: '') required String parentId,
    @JsonKey(name: 'setNo', defaultValue: '') required String setNo,
    @JsonKey(name: 'quantity', defaultValue: 0) required int quantity,
    @JsonKey(name: 'ttemSource', defaultValue: 'EZRX')
    required String itemSource,
    @JsonKey(name: 'rate', defaultValue: 0) required double rate,
    @JsonKey(name: 'conditionNumber', defaultValue: '')
    required String conditionNumber,
    @JsonKey(name: 'mandatory', defaultValue: false) required bool mandatory,
    @JsonKey(name: 'suffix', defaultValue: '') required String suffix,
    @JsonKey(name: 'materialDescription', defaultValue: '')
    required String materialDescription,
    @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
    required String defaultMaterialDescription,
    @JsonKey(name: 'principalName', defaultValue: '')
    required String principalName,
    @JsonKey(name: 'listPrice', defaultValue: 0.0) required double listPrice,
    @JsonKey(name: 'ttemCheck', defaultValue: false) required bool itemCheck,
    @JsonKey(name: 'principalCode', defaultValue: '')
    required String principalCode,
    @JsonKey(name: 'valid', defaultValue: false) required bool valid,
    @JsonKey(name: 'type', defaultValue: '') required String type,
    @JsonKey(name: 'comboDealType', defaultValue: '')
    required String comboDealType,
    @JsonKey(name: 'isComboEligible', defaultValue: false)
    required bool isComboEligible,
    @JsonKey(name: 'finalIndividualPrice', defaultValue: 0.0)
    required double finalIndividualPrice,
    @JsonKey(name: 'materialNumber', defaultValue: 'EN')
    required String materialNumber,
    @JsonKey(name: 'taxM1', defaultValue: '') required String taxM1,
    @JsonKey(name: 'taxes', readValue: JsonReadValueHelper.handleTax)
    required double tax,
    @JsonKey(name: 'isFOCMaterial', defaultValue: false)
    required bool isFOCMaterial,
    @JsonKey(name: 'hidePrice', defaultValue: false) required bool hidePrice,
    @JsonKey(name: 'taxClassification', defaultValue: '')
    required String taxClassification,
  }) = _ComboMaterialItemDto;

  MaterialInfo get toMaterialInfo {
    return MaterialInfo.empty().copyWith(
      materialDescription: defaultMaterialDescription,
      materialNumber: MaterialNumber(productId),
      parentID: parentId,
      taxClassification: MaterialTaxClassification(taxClassification),
      isFOCMaterial: isFOCMaterial,
      tax: tax,
      hidePrice: hidePrice,
      principalData: PrincipalData.empty().copyWith(
        principalName: PrincipalName(principalName),
        principalCode: PrincipalCode(principalCode),
      ),
      type: MaterialInfoType(type),
    );
  }

  ComboMaterialItem toDomain(
    PriceComboDealDto comboDeal,
  ) {
    return ComboMaterialItem.empty().copyWith(
      comboDeals: comboDeal.toDomain,
      isComboEligible: isComboEligible,
      valid: valid,
      quantity: quantity,
      listPrice: listPrice,
      finalIndividualPrice: finalIndividualPrice,
      productId: MaterialNumber(productId),
      principalData: PrincipalData(
        principalName: PrincipalName(principalName),
        principalCode: PrincipalCode(principalCode),
      ),
      materialDescription: defaultMaterialDescription,
      minQty: 0,
      conditionNumber: conditionNumber,
      mandatory: mandatory,
      rate: rate,
      suffix: suffix,
      setNo: setNo,
      comboDealType: comboDealType,
      parentId: parentId,
      materialInfo: toMaterialInfo,
    );
  }

  factory ComboMaterialItemDto.fromJson(Map<String, dynamic> json) =>
      _$ComboMaterialItemDtoFromJson(json);
}

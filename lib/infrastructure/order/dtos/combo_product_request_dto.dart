import 'package:ezrxmobile/domain/order/entities/combo_material_item.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_combo_deal_request_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'combo_product_request_dto.freezed.dart';
part 'combo_product_request_dto.g.dart';

@freezed
class ComboProductRequestDto with _$ComboProductRequestDto {
  const ComboProductRequestDto._();

  const factory ComboProductRequestDto({
    @JsonKey(name: 'ProductID', defaultValue: '') required String productId,
    @JsonKey(name: 'ParentID', defaultValue: '') required String parentId,
    @JsonKey(name: 'SetNo', defaultValue: '') required String setNo,
    @JsonKey(name: 'Quantity', defaultValue: 0) required int quantity,
    @JsonKey(name: 'ItemSource', defaultValue: 'EZRX')
        required String itemSource,
    @JsonKey(name: 'CustomerCode', defaultValue: '')
        required String customerCode,
    @JsonKey(name: 'ShipToID', defaultValue: '') required String shipToId,
    @JsonKey(name: 'SalesOrg', defaultValue: '') required String salesOrg,
    @JsonKey(name: 'MinQty', defaultValue: 0) required int minQty,
    @JsonKey(name: 'Rate', defaultValue: 0) required double rate,
    @JsonKey(name: 'ConditionNumber', defaultValue: '')
        required String conditionNumber,
    @JsonKey(name: 'Mandatory', defaultValue: false) required bool mandatory,
    @JsonKey(name: 'Suffix', defaultValue: '') required String suffix,
    @JsonKey(name: 'MaterialDescription', defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'PrincipleName', defaultValue: '')
        required String principleName,
    @JsonKey(name: 'ListPrice', defaultValue: 0.0) required double listPrice,
    @JsonKey(name: 'ItemCheck', defaultValue: false) required bool itemCheck,
    @JsonKey(name: 'PrincipalCode', defaultValue: '')
        required String principalCode,
    @JsonKey(name: 'Valid', defaultValue: false) required bool valid,
    @JsonKey(name: 'Type', defaultValue: '') required String type,
    @JsonKey(name: 'ComboDealType', defaultValue: '')
        required String comboDealType,
    @JsonKey(name: 'IsComboEligible', defaultValue: false)
        required bool isComboEligible,
    @Default(PriceComboDealRequestDto.empty)
    @JsonKey(name: 'ComboDeals')
        PriceComboDealRequestDto comboDeal,
    @JsonKey(name: 'FinalIndividualPrice', defaultValue: 0.0)
        required double finalIndividualPrice,
  }) = _ComboProductRequestDto;

  factory ComboProductRequestDto.fromDomain({
    required ComboMaterialItem comboProductRequest,
    required String salesOrg,
    required String customerCode,
    required String shipToId,
  }) {
    return ComboProductRequestDto(
      salesOrg: salesOrg,
      customerCode: customerCode,
      shipToId: shipToId,
      isComboEligible: comboProductRequest.isComboEligible,
      valid: comboProductRequest.valid,
      quantity: comboProductRequest.quantity,
      listPrice: comboProductRequest.listPrice,
      finalIndividualPrice: comboProductRequest.finalIndividualPrice,
      productId: comboProductRequest.productId.getOrDefaultValue(''),
      principleName: comboProductRequest.principalData.principalName.name,
      principalCode:
          comboProductRequest.principalData.principalCode.getOrDefaultValue(''),
      materialDescription: comboProductRequest.materialDescription,
      minQty: comboProductRequest.minQty,
      conditionNumber: comboProductRequest.conditionNumber,
      mandatory: comboProductRequest.mandatory,
      rate: comboProductRequest.rate,
      suffix: comboProductRequest.suffix,
      setNo: comboProductRequest.setNo,
      comboDealType: comboProductRequest.comboDealType,
      parentId: comboProductRequest.parentId,
      type: 'combo',
      itemSource: 'EZRX',
      itemCheck: true,
      comboDeal:
          PriceComboDealRequestDto.fromDomain(comboProductRequest.comboDeals),
    );
  }

  factory ComboProductRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ComboProductRequestDtoFromJson(json);

  Map<String, dynamic> toMap() => toJson()
    ..removeWhere(
      (key, value) =>
          (key != 'ParentID' && key != 'ItemId') &&
          ((value is String && (value.isEmpty || value == 'NA')) ||
              (value is double && value == 0.0)),
    );
}

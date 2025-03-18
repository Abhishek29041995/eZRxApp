import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_query_info.freezed.dart';

@freezed
class MaterialQueryInfo with _$MaterialQueryInfo {
  const MaterialQueryInfo._();
  const factory MaterialQueryInfo({
    required MaterialNumber value,
    required MaterialGroup materialGroup2,
    required MaterialGroup materialGroup4,
    required String description,
    required String principalName,
    required MaterialQty qty,
    @Default(0) double priceOverride,
    @Default(0) double zdp8Override,
    @Default(false) bool isComboDealMaterial,
    required TenderContract tenderContract,
  }) = _MaterialQueryInfo;

  // factory MaterialQueryInfo.fromFavorite({
  //   required Favourite material,
  // }) =>
  //     MaterialQueryInfo(
  //       qty: MaterialQty(1),
  //       value: material.materialNumber,
  //       materialGroup2: MaterialGroup.two(''),
  //       materialGroup4:
  //           material.isFOC ? MaterialGroup.four('6A1') : MaterialGroup.four(''),
  //       description: material.materialDescription,
  //       principalName: 'NA',
  //       tenderContract: TenderContract.empty(),
  //     );

  factory MaterialQueryInfo.fromBundles({
    required MaterialInfo materialInfo,
  }) =>
      MaterialQueryInfo(
        qty: materialInfo.quantity,
        value: materialInfo.materialNumber,
        materialGroup2: materialInfo.materialGroup2,
        materialGroup4: materialInfo.materialGroup4,
        description: materialInfo.displayDescription,
        principalName:
            materialInfo.principalData.principalName.getOrDefaultValue(''),
        tenderContract: TenderContract.empty(),
      );

  factory MaterialQueryInfo.fromOrderHistory({
    required OrderHistoryItem orderHistoryItem,
  }) =>
      MaterialQueryInfo(
        value: orderHistoryItem.materialNumber,
        materialGroup2: MaterialGroup(''),
        materialGroup4: MaterialGroup(''),
        qty: MaterialQty(
          orderHistoryItem.qty,
        ),
        description: orderHistoryItem.materialDescription,
        principalName: 'NA',
        tenderContract: TenderContract.empty(),
      );

  factory MaterialQueryInfo.empty() => MaterialQueryInfo(
        value: MaterialNumber(''),
        qty: MaterialQty(0),
        materialGroup2: MaterialGroup(''),
        materialGroup4: MaterialGroup(''),
        description: 'NA',
        principalName: 'NA',
        tenderContract: TenderContract.empty(),
      );

  factory MaterialQueryInfo.fromOrderHistoryDetails({
    required OrderHistoryDetailsOrderItem orderHistoryDetailsOrderItem,
  }) =>
      MaterialQueryInfo(
        value: orderHistoryDetailsOrderItem.materialNumber,
        materialGroup2: MaterialGroup(''),
        materialGroup4: MaterialGroup(''),
        qty: MaterialQty(
          orderHistoryDetailsOrderItem.qty,
        ),
        description: orderHistoryDetailsOrderItem.materialDescription,
        principalName: 'NA',
        tenderContract: TenderContract.fromOrderHistory(
          orderHistoryDetailsOrderItem.tenderContractDetails,
        ),
      );

  factory MaterialQueryInfo.fromComboDealMaterial({
    required MaterialNumber materialNumber,
  }) =>
      MaterialQueryInfo.empty().copyWith(
        value: materialNumber,
        isComboDealMaterial: true,
      );

  Map<String, dynamic> get priceQuery {
    final data = <String, dynamic>{
      'MaterialNumber': value.getOrCrash(),
    };

    if (priceOverride != 0) {
      data['ZPO1'] = priceOverride;
    }
    if (zdp8Override != 0) {
      data['ZDP8'] = zdp8Override;
    }

    return data;
  }

  bool isMaterialQtyZDP5RuleApplicable(int zdp5Value) =>
      qty.intValue >= zdp5Value;
}

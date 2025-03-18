import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_override.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/submit_material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/submit_tender_contract_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_material_info.freezed.dart';

@freezed
class SubmitMaterialInfo with _$SubmitMaterialInfo {
  const SubmitMaterialInfo._();
  const factory SubmitMaterialInfo({
    required MaterialNumber materialNumber,
    required int quantity,
    required List<SubmitMaterialItemBonus> bonuses,
    required String productType,
    required String parentID,
    required String comment,
    required MaterialItemOverride materialItemOverride,
    required double price,
    required double tax,
    required double mrp,
    required String promoType,
    required bool promoStatus,
    required PrincipalData principalData,
    required bool isCounterOffer,
    required SubmitTenderContract contract,
    required String salesDistrict,

    ///Todo: consider to delete it
    required StringValue batch,
  }) = _SubmitMaterialInfo;

  factory SubmitMaterialInfo.empty() => SubmitMaterialInfo(
        materialNumber: MaterialNumber(''),
        quantity: 0,
        bonuses: <SubmitMaterialItemBonus>[],
        comment: '',
        productType: '',
        parentID: '',
        batch: StringValue(''),
        materialItemOverride: MaterialItemOverride.empty(),
        price: 0,
        tax: 0,
        mrp: 0,
        promoStatus: false,
        promoType: '',
        principalData: PrincipalData.empty(),
        isCounterOffer: false,
        contract: SubmitTenderContract.empty(),
        salesDistrict: '',
      );
}

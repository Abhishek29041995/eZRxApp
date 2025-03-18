import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_override.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/submit_material_info.dart';
import 'package:ezrxmobile/domain/order/entities/submit_tender_contract_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/num_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'combo_material_item.freezed.dart';

@freezed
class ComboMaterialItem with _$ComboMaterialItem {
  const ComboMaterialItem._();

  const factory ComboMaterialItem({
    required MaterialNumber productId,
    required String parentId,
    required String setNo,
    required int quantity,
    required int minQty,
    required double rate,
    required String conditionNumber,
    required bool mandatory,
    required String suffix,
    required String materialDescription,
    required PrincipalData principalData,
    required double listPrice,
    required bool valid,
    required String comboDealType,
    required bool isComboEligible,
    required PriceComboDeal comboDeals,
    required double finalIndividualPrice,
    required SalesOrganisationConfigs salesOrgConfig,
    required MaterialInfo materialInfo,
  }) = _ComboMaterialItem;

  factory ComboMaterialItem.empty() => ComboMaterialItem(
        quantity: 0,
        productId: MaterialNumber(''),
        parentId: '',
        setNo: '',
        minQty: 0,
        rate: 0,
        conditionNumber: '',
        mandatory: false,
        suffix: '',
        materialDescription: '',
        listPrice: 0,
        valid: false,
        comboDealType: '',
        isComboEligible: false,
        comboDeals: PriceComboDeal.empty(),
        finalIndividualPrice: 0,
        salesOrgConfig: SalesOrganisationConfigs.empty(),
        materialInfo: MaterialInfo.empty(),
        principalData: PrincipalData.empty(),
      );

  bool get showTaxBreakDown =>
      salesOrgConfig.displayItemTaxBreakdown && !materialInfo.hidePrice;

  double get itemTaxPercent {
    if (materialInfo.taxClassification.isNoTax) {
      return 0.0;
    }
    final salesOrg = salesOrgConfig.salesOrg;

    if (salesOrg.isVN) {
      return materialInfo.tax;
    }

    return salesOrgConfig.vatValue.toDouble();
  }

  String get itemTaxPercentPadded =>
      itemTaxPercent.toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '');

  double get itemTax => (discountedSubTotal * itemTaxPercent) / 100;

  double get originalItemTax => (originalSubTotal * itemTaxPercent) / 100;

  String get originalPriceDisplay =>
      NumUtils.roundToPlaces(listPrice).toString();

  double get originalSubTotal => NumUtils.roundToPlaces(listPrice * quantity);

  double get originalTotalWithTax => originalSubTotal + originalItemTax;

  String get discountedPriceDisplay =>
      NumUtils.roundToPlaces(finalIndividualPrice).toString();

  double get discountedSubTotal =>
      NumUtils.roundToPlaces(finalIndividualPrice * quantity);

  double get discountedSubTotalWithTax => discountedSubTotal + itemTax;

  ComboDealScheme getScheme(List<ComboMaterialItem> comboMaterials) {
    switch (comboDealType) {
      case 'K1':
        return ComboDealScheme.k1;
      case 'K2':
        final haveMandatoryMaterial =
            comboMaterials.any((comboMaterial) => comboMaterial.mandatory);

        return haveMandatoryMaterial
            ? ComboDealScheme.k21
            : ComboDealScheme.k22;
      case 'K3':
        return ComboDealScheme.k3;
      case 'K4':
        return ComboDealScheme.k4;
      case 'K4.2':
        return ComboDealScheme.k42;
      case 'K5':
        return ComboDealScheme.k5;
      default:
        return ComboDealScheme.k1;
    }
  }

  String get comboRateDisplay {
    final comboRate = rate.abs();
    if (comboRate == comboRate.toInt()) {
      return comboRate.toInt().toString();
    }

    return comboRate.toString();
  }

  SubmitMaterialInfo toSubmitMaterialInfo() {
    return SubmitMaterialInfo(
      batch: StringValue(''),
      bonuses: [],
      comment: materialInfo.remarks,
      materialNumber: materialInfo.materialNumber,
      quantity: quantity,
      materialItemOverride: MaterialItemOverride.empty(),
      price: finalIndividualPrice,
      productType: MaterialInfoType.material().getValue().toUpperCase(),
      parentID: materialInfo.parentID,
      mrp: listPrice + itemTax,
      tax: itemTax,
      promoStatus: false,
      promoType: materialInfo.promoType,
      principalData: materialInfo.principalData,
      isCounterOffer: false,
      contract: SubmitTenderContract.empty(),
      salesDistrict: '',
    );
  }
}

extension PriceAggregateExtension on List<ComboMaterialItem> {
  List<ComboMaterialItem> get getOutOfStockComboMaterialList =>
      where((element) => !element.materialInfo.inStock).toList();
}

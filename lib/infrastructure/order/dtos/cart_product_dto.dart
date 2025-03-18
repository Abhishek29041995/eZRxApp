import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/bundle_details.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_readvalue_helper.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/bundle_info_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_material_item_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_combo_deal_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/infrastructure/order/dtos/bonus_sample_item_dto.dart';

part 'cart_product_dto.freezed.dart';
part 'cart_product_dto.g.dart';

@freezed
class CartProductDto with _$CartProductDto {
  const CartProductDto._();
  const factory CartProductDto({
    @JsonKey(name: 'productID', defaultValue: '') required String productID,
    @JsonKey(name: 'parentID', defaultValue: '') required String parentID,
    @JsonKey(name: 'type', defaultValue: '') required String type,
    @JsonKey(name: 'quantity', defaultValue: 0) required int quantity,
    @JsonKey(name: 'materialNumber', defaultValue: '')
    required String materialNumber,
    @JsonKey(name: 'materialDescription', defaultValue: '')
    required String materialDescription,
    @JsonKey(name: 'therapeuticClass', defaultValue: '')
    required String therapeuticClass,
    @JsonKey(name: 'taxClassification', defaultValue: '')
    required String taxClassification,
    @JsonKey(name: 'isFOCMaterial', defaultValue: false)
    required bool isFOCMaterial,
    @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
    required String itemRegistrationNumber,
    @JsonKey(name: 'genericMaterialName', defaultValue: '')
    required String genericMaterialName,
    @JsonKey(name: 'principalName', defaultValue: '')
    required String principalName,
    @JsonKey(name: 'principalCode', defaultValue: '')
    required String principalCode,
    @JsonKey(name: 'counterOfferPrice', defaultValue: 0)
    required double counterOfferPrice,
    @JsonKey(name: 'discountOverridePercentage', defaultValue: 0)
    required double counterOfferDiscount,
    @JsonKey(name: 'counterOfferCurrency', defaultValue: '')
    required String counterOfferCurrency,
    @JsonKey(name: 'comment', defaultValue: '') required String remarks,
    @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
    required String governmentMaterialCode,
    @Default(BundleDetailsDto.empty)
    @JsonKey(name: 'bundleDetails')
    BundleDetailsDto bundleDetails,
    @JsonKey(name: 'bundleMaterials', defaultValue: <MaterialDto>[])
    required List<MaterialDto> bundleMaterials,
    @JsonKey(name: 'bonusMaterials', defaultValue: <BonusSampleItemDto>[])
    required List<BonusSampleItemDto> bonusMaterials,
    @JsonKey(name: 'taxes', readValue: JsonReadValueHelper.handleTax)
    required double tax,
    @JsonKey(name: 'hidePrice', defaultValue: false) required bool hidePrice,
    @JsonKey(name: 'suspensionStatus', defaultValue: false)
    required bool isSuspended,
    @JsonKey(name: 'principalCutoffStatus', defaultValue: false)
    required bool isPrincipalSuspended,
    @Default(PriceComboDealDto.empty)
    @JsonKey(name: 'comboDeals')
    PriceComboDealDto comboDeal,
    @JsonKey(name: 'comboMaterials', defaultValue: [])
    required List<ComboMaterialItemDto> comboMaterials,
    //maximumQty auto set to maximum limit if we get null from response
    @JsonKey(name: 'maximumQty', defaultValue: 99999) required int maximumQty,
    @JsonKey(
      defaultValue: false,
      readValue: JsonReadValueHelper.mappingIsMarketPlace,
    )
    required bool isMarketPlace,
    @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
    required String defaultMaterialDescription,
    @JsonKey(name: 'materialGroup4', defaultValue: '')
    required String materialGroup4,
    @JsonKey(name: 'materialGroup2', defaultValue: '')
    required String materialGroup2,
    @JsonKey(name: 'is26SeriesMaterial', defaultValue: false)
    required bool is26SeriesMaterial,
    @JsonKey(name: 'isGimmick', defaultValue: false) required bool isGimmick,
    @JsonKey(name: 'isPoison', defaultValue: false) required bool isPoison,
    @JsonKey(name: 'isSample', defaultValue: false) required bool isSample,
    @JsonKey(name: 'tenderContractNumber', defaultValue: '')
    required String tenderContractNumber,
    @JsonKey(name: 'tenderOrderReason', defaultValue: '')
    required String tenderOrderReason,
    @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
    required bool hasValidTenderContract,
    @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
    required bool hasMandatoryTenderContract,
    @JsonKey(name: 'isCovid', defaultValue: false) required bool isCovid,
    @JsonKey(name: 'isTenderExpired', defaultValue: false)
    required bool isTenderExpired,
  }) = _CartProductDto;

  MaterialInfo get toMaterialInfo {
    return MaterialInfo.empty().copyWith(
      genericMaterialName: genericMaterialName,
      itemRegistrationNumber: ItemRegistrationNumber(itemRegistrationNumber),
      materialDescription: materialDescription,
      materialNumber: MaterialNumber(productID),
      parentID: parentID,
      quantity: MaterialQty(quantity),
      taxClassification: MaterialTaxClassification(taxClassification),
      isFOCMaterial: isFOCMaterial,
      tax: tax,
      hidePrice: hidePrice,
      therapeuticClass: therapeuticClass,
      principalData: PrincipalData.empty().copyWith(
        principalName: PrincipalName(principalName),
        principalCode: PrincipalCode(principalCode),
      ),
      data: <MaterialData>[
        MaterialData.empty().copyWith(
          materialNumber: MaterialNumber(productID),
          governmentMaterialCode: StringValue(governmentMaterialCode),
          defaultMaterialDescription: defaultMaterialDescription,
        ),
      ],
      counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
        comment: StringValue(remarks),
        counterOfferCurrency: Currency(counterOfferCurrency),
        counterOfferPrice: CounterOfferValue(counterOfferPrice.toString()),
        discountOverridePercentage:
            CounterOfferDiscountValue(counterOfferDiscount.toString()),
      ),
      type: MaterialInfoType(type),
      remarks: remarks,
      isSuspended: isSuspended,
      isPrincipalSuspended: isPrincipalSuspended,
      isMarketPlace: isMarketPlace,
      materialGroup2: MaterialGroup(materialGroup2),
      materialGroup4: MaterialGroup(materialGroup4),
      hasMandatoryTenderContract: hasMandatoryTenderContract,
      hasValidTenderContract: hasValidTenderContract,
      isGimmick: isGimmick,
      isPoison: isPoison,
      isSampleMaterial: isSample,
    );
  }

  PriceAggregate get toDomain {
    return PriceAggregate.empty().copyWith(
      materialInfo: toMaterialInfo,
      bundle: Bundle.empty().copyWith(
        bundleCode: bundleDetails.bundleCode,
        bundleName: BundleName(bundleDetails.bundleName),
        bundleInformation:
            bundleDetails.bundleInfo.map((e) => e.toDomain()).toList(),
        //Override with value from materialInfo to display batch & exp correctly
        //(for now BE return isMarketPlace as null)
        materials: bundleMaterials
            .map(
              (e) => e
                  .toDomain()
                  .copyWith(isMarketPlace: toMaterialInfo.isMarketPlace),
            )
            .toList(),
      ),
      quantity: quantity,
      bonusSampleItems: bonusMaterials.map((e) => e.toDomain()).toList(),
      comboMaterials: comboMaterials.map((e) => e.toDomain(comboDeal)).toList(),
      maximumQty: maximumQty,
      is26SeriesMaterial: is26SeriesMaterial,
      tenderContract: TenderContract.empty().copyWith(
        tenderOrderReason: TenderContractReason(tenderOrderReason),
        contractNumber: TenderContractNumber(tenderContractNumber),
        isTenderExpired: isTenderExpired,
      ),
      isCovid: isCovid,
    );
  }

  factory CartProductDto.fromJson(Map<String, dynamic> json) =>
      _$CartProductDtoFromJson(json);
}

@freezed
class BundleDetailsDto with _$BundleDetailsDto {
  const BundleDetailsDto._();
  const factory BundleDetailsDto({
    @JsonKey(name: 'bundleName', defaultValue: '') required String bundleName,
    @JsonKey(name: 'bundleCode', defaultValue: '') required String bundleCode,
    @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
    required List<BundleInfoDto> bundleInfo,
  }) = _BundleDetailsDto;
  factory BundleDetailsDto.fromDomain(
    BundleDetails bundleDetails,
  ) {
    return BundleDetailsDto(
      bundleName: bundleDetails.bundleName,
      bundleCode: bundleDetails.bundleCode,
      bundleInfo: bundleDetails.bundleInformation
          .map((e) => BundleInfoDto.fromDomain(e))
          .toList(),
    );
  }

  static const BundleDetailsDto empty = BundleDetailsDto(
    bundleName: '',
    bundleCode: '',
    bundleInfo: <BundleInfoDto>[],
  );

  BundleDetails get toDomain {
    return BundleDetails.empty().copyWith(
      bundleName: bundleName,
      bundleCode: bundleCode,
      bundleInformation: bundleInfo.map((e) => e.toDomain()).toList(),
    );
  }

  factory BundleDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$BundleDetailsDtoFromJson(json);
}

import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/country_data.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_info.freezed.dart';

@freezed
class MaterialInfo with _$MaterialInfo {
  const MaterialInfo._();

  const factory MaterialInfo({
    required String name,
    required PrincipalData principalData,
    required MaterialNumber materialNumber,
    required String materialDescription,
    required String manufactured,
    required bool isFavourite,
    required MaterialInfoType type,
    required bool hidePrice,
    required List<MaterialData> data,
    required int dataTotalCount,
    required DataTotalHidden dataTotalHidden,
    required bool isGimmick,
    required List<StockInfo> stockInfos,
    required Bundle bundle,
    required ProductImages productImages,
    required CountryData countryData,
    required MaterialQty quantity,
    required String defaultMaterialDescription,
    required StringValue governmentMaterialCode,
    required StringValue unitOfMeasurement,
    required String parentID,
    required String therapeuticClass,
    required MaterialTaxClassification taxClassification,
    required ItemRegistrationNumber itemRegistrationNumber,
    required String genericMaterialName,
    required String remarks,
    required bool promoStatus,
    required String promoType,
    required bool isSuspended,
    required bool isPrincipalSuspended,
    required bool isMarketPlace,
    //TODO: remove field from v2
    required String itemBrand,
    required MaterialGroup materialGroup2,
    required MaterialGroup materialGroup4,
    required bool isSampleMaterial,
    required bool isPoison,
    required bool hasValidTenderContract,
    required bool hasMandatoryTenderContract,
    required double tax,
    required List<Bundle> bundles,
    required bool isFOCMaterial,
    required String ean,
    required RequestCounterOfferDetails counterOfferDetails,
    required String sampleBonusItemId,
  }) = _MaterialInfo;

  factory MaterialInfo.empty() => MaterialInfo(
        materialNumber: MaterialNumber(''),
        materialDescription: '',
        governmentMaterialCode: StringValue(''),
        therapeuticClass: '',
        itemBrand: '',
        principalData: PrincipalData(
          principalName: PrincipalName(''),
          principalCode: PrincipalCode(''),
        ),
        taxClassification: MaterialTaxClassification(''),
        itemRegistrationNumber: ItemRegistrationNumber(''),
        unitOfMeasurement: StringValue(''),
        materialGroup2: MaterialGroup(''),
        materialGroup4: MaterialGroup(''),
        isSampleMaterial: false,
        hidePrice: false,
        hasValidTenderContract: false,
        hasMandatoryTenderContract: false,
        tax: 0,
        defaultMaterialDescription: '',
        bundles: [],
        isFOCMaterial: false,
        quantity: MaterialQty(0),
        remarks: '',
        genericMaterialName: '',
        ean: '',
        data: <MaterialData>[],
        dataTotalCount: 0,
        dataTotalHidden: DataTotalHidden(0),
        isFavourite: false,
        isGimmick: false,
        manufactured: '',
        name: '',
        type: MaterialInfoType(''),
        stockInfos: <StockInfo>[],
        bundle: Bundle.empty(),
        productImages: ProductImages.empty(),
        countryData: CountryData.empty(),
        parentID: '',
        counterOfferDetails: RequestCounterOfferDetails.empty(),
        promoStatus: false,
        promoType: '',
        sampleBonusItemId: '',
        isSuspended: false,
        isPrincipalSuspended: false,
        isMarketPlace: false,
        isPoison: false,
      );

  MaterialQueryInfo get queryInfo => MaterialQueryInfo.fromBundles(
        materialInfo: this,
      );

  String getTaxClassification(
    bool enableTaxDisplay,
    bool enableTaxClassification,
  ) {
    return enableTaxDisplay && enableTaxClassification
        ? taxClassification.getOrCrash()
        : '';
  }

  String getTotalTax(bool enableTaxDisplay) {
    return enableTaxDisplay ? '${'Total Tax: '.tr()}$tax%' : '';
  }

  String get displayDescription => defaultMaterialDescription.isNotEmpty
      ? defaultMaterialDescription
      : data.isNotEmpty
          ? data.first.defaultMaterialDescription
          : '';

  bool get isSpecialOrderTypeMaterial => isSampleMaterial || isFOCMaterial;

  bool get inStock =>
      stockInfos.any((element) => element.inStock.isMaterialInStock);

  StockInfo get productStockInfo => stockInfos.firstWhere(
        (element) => element.materialNumber.isValid(),
        orElse: () => StockInfo.empty(),
      );

  MaterialInfo copyWithStock({
    required List<StockInfo> stockInfos,
  }) =>
      copyWith(stockInfos: stockInfos);

  bool get listingDataNotAvailable =>
      type.typeBundle && dataTotalHidden.isDataHidden;

  bool get isMaterialHiddenOnListing => data.length > 5;

  int get listingHiddenMaterialCount => data.length - 5;

  List<MaterialData> get listingVisibleMaterial => data.take(5).toList();

  String get getManufactured => manufactured.isNotEmpty
      ? manufactured
      : principalData.principalName.getOrDefaultValue('');

  String get manufacturerPrefix => isMarketPlace ? 'Sold by' : '';

  List<String> get images => type.typeBundle
      ? bundle.materials.map((e) => e.productImages.thumbNail).toList()
      : productImages.image;

  bool get isPnGPrinciple => principalData.principalCode.isPnG;

  bool materialQtyConfirmZDP5Rule(
    int zdp5MaxQuota,
    int zdp5RemaningQuota,
  ) =>
      quantity.intValue > zdp5MaxQuota || quantity.intValue > zdp5RemaningQuota;

  StringValue get getGMC =>
      data.isNotEmpty && data.first.governmentMaterialCode.isNotEmpty
          ? data.first.governmentMaterialCode
          : governmentMaterialCode;

  String combinationCode({
    required bool showGMCPart,
    required bool showIRNPart,
  }) =>
      <String>[
        materialNumber.displayMatNo,
        if (showGMCPart && getGMC.isNotEmpty) getGMC.getValue(),
        if (showIRNPart && getIRN.isValidIRN) getIRN.getValue(),
      ].join(' | ');

  StockInfo get bundleStockInfoValid => stockInfos.firstWhere(
        (element) => element.expiryDate.isValid() || element.batch.isValid(),
        orElse: () => StockInfo.empty(),
      );

  bool displayOOSPreorderTag(bool hideStockDisplay) {
    return !hideStockDisplay && !inStock && stockInfos.isNotEmpty;
  }

  bool get isValidMaterial => type.typeMaterial && materialNumber.isValid();

  ItemRegistrationNumber get getIRN =>
      data.isNotEmpty && data.first.itemRegistrationNumber.isNotEmpty
          ? data.first.itemRegistrationNumber
          : itemRegistrationNumber;

  String get tag {
    if (!inStock && stockInfos.isNotEmpty) {
      return 'Preorder';
    }
    if (type.typeDealBonus) {
      return 'Offer';
    }

    return '';
  }
}

@freezed
class MaterialData with _$MaterialData {
  const MaterialData._();
  factory MaterialData({
    required MaterialNumber materialNumber,
    required String manufactured,
    required StringValue materialDescription,
    required String defaultMaterialDescription,
    required String genericMaterialName,
    required StringValue governmentMaterialCode,
    required ItemRegistrationNumber itemRegistrationNumber,
    required bool isMarketPlace,
  }) = _MaterialData;

  factory MaterialData.empty() => MaterialData(
        materialNumber: MaterialNumber(''),
        manufactured: '',
        materialDescription: StringValue(''),
        defaultMaterialDescription: '',
        genericMaterialName: '',
        governmentMaterialCode: StringValue(''),
        itemRegistrationNumber: ItemRegistrationNumber(''),
        isMarketPlace: false,
      );

  MaterialInfo get toMaterialInfo => MaterialInfo.empty().copyWith(
        materialNumber: materialNumber,
        materialDescription: materialDescription.getOrDefaultValue(''),
        defaultMaterialDescription: defaultMaterialDescription,
        genericMaterialName: genericMaterialName,
        productImages: ProductImages.empty(),
        governmentMaterialCode: governmentMaterialCode,
        itemRegistrationNumber: itemRegistrationNumber,
        isMarketPlace: isMarketPlace,
      );
}

@freezed
class MaterialResponse with _$MaterialResponse {
  const MaterialResponse._();
  factory MaterialResponse({
    required int count,
    required List<MaterialInfo> products,
  }) = _MaterialResponse;
}

extension PriceAggregateExtension on List<MaterialInfo> {
  List<MaterialInfo> get getOutOfStockMaterialList =>
      where((element) => !element.inStock).toList();
}

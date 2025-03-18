import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/country_data.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_readvalue_helper.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/bundle_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_dto.freezed.dart';

part 'material_dto.g.dart';

@freezed
class MaterialDto with _$MaterialDto {
  const MaterialDto._();

  const factory MaterialDto({
    @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
    required String governmentMaterialCode,
    @JsonKey(name: 'therapeuticClass', defaultValue: '')
    required String therapeuticClass,
    @JsonKey(name: 'itemBrand', defaultValue: '') required String itemBrand,
    @JsonKey(name: 'principalName', defaultValue: '')
    required String principalName,
    @JsonKey(name: 'taxClassification', defaultValue: '')
    required String taxClassification,
    @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
    required String itemRegistrationNumber,
    @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
    required String unitOfMeasurement,
    @JsonKey(name: 'materialGroup2', defaultValue: '')
    required String materialGroup2,
    @JsonKey(name: 'materialGroup4', defaultValue: '')
    required String materialGroup4,
    @JsonKey(name: 'isSampleMaterial', defaultValue: false)
    required bool isSampleMaterial,
    @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
    required bool hasValidTenderContract,
    @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
    required bool hasMandatoryTenderContract,
    @JsonKey(name: 'taxes', readValue: JsonReadValueHelper.handleTax)
    required double taxes,
    @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
    required String defaultMaterialDescription,
    @JsonKey(name: 'isFOCMaterial', defaultValue: false)
    required bool isFOCMaterial,
    @JsonKey(
      name: 'quantity',
      defaultValue: 0,
      readValue: JsonReadValueHelper.handlevalidateQuantity,
    )
    required int quantity,
    @JsonKey(name: 'remarks', defaultValue: '') required String remarks,
    @JsonKey(name: 'genericMaterialName', defaultValue: '')
    required String genericMaterialName,
    @JsonKey(name: 'ean', defaultValue: '') required String ean,
    @JsonKey(
      name: 'bundleInformation',
      readValue: JsonReadValueHelper.readValueMapDynamic,
    )
    required BundleDto bundle,

    // new field from v3
    @JsonKey(name: 'code', defaultValue: '') required String code,
    @JsonKey(name: 'name', defaultValue: '') required String name,
    @JsonKey(
      name: 'principalCode',
      defaultValue: '',
    )
    required String principalCode,
    @JsonKey(
      name: 'materialNumber',
      defaultValue: '',
    )
    required String materialNumber,
    @JsonKey(name: 'materialDescription', defaultValue: '')
    required String materialDescription,
    @JsonKey(name: 'manufactured', defaultValue: '')
    required String manufactured,
    @JsonKey(name: 'isFavourite', defaultValue: false)
    required bool isFavourite,
    // TODO: The default on type is assigned temporarily as material
    // will update this once issue is resolved from BE side
    // https://zuelligpharma.atlassian.net/browse/EZRX-16463
    @JsonKey(name: 'type', defaultValue: 'material') required String type,
    @JsonKey(
      name: 'hidePrice',
      defaultValue: false,
    )
    required bool hidePrice,
    @JsonKey(name: 'dataTotalCount', defaultValue: 0)
    required int dataTotalCount,
    @JsonKey(name: 'dataTotalHidden', defaultValue: 0)
    required int dataTotalHidden,
    @JsonKey(name: 'isGimmick', defaultValue: false) required bool isGimmick,
    @JsonKey(name: 'isPoison', defaultValue: false) required bool isPoison,
    @JsonKey(name: 'data', defaultValue: <MaterialDataDto>[])
    required List<MaterialDataDto> data,
    @JsonKey(name: 'bundles', defaultValue: <BundleDto>[])
    required List<BundleDto> bundles,
    @JsonKey(name: 'suspensionStatus', defaultValue: false)
    required bool isSuspended,
    @JsonKey(
      defaultValue: false,
      readValue: JsonReadValueHelper.mappingIsMarketPlace,
    )
    required bool isMarketPlace,
  }) = _MaterialDto;

  MaterialInfo toDomain() {
    return MaterialInfo(
      materialNumber: _getMaterialNumber,
      materialDescription: materialDescription,
      governmentMaterialCode: StringValue(governmentMaterialCode),
      therapeuticClass: therapeuticClass,
      itemBrand: itemBrand,
      principalData: PrincipalData(
        principalName: PrincipalName(principalName),
        principalCode: PrincipalCode(principalCode),
      ),
      taxClassification: MaterialTaxClassification(taxClassification),
      itemRegistrationNumber: ItemRegistrationNumber(itemRegistrationNumber),
      unitOfMeasurement: StringValue(unitOfMeasurement),
      materialGroup2: MaterialGroup(materialGroup2),
      materialGroup4: MaterialGroup(materialGroup4),

      hidePrice: hidePrice,
      hasValidTenderContract: hasValidTenderContract,
      hasMandatoryTenderContract: hasMandatoryTenderContract,
      tax: taxes,
      bundles: bundles.map((e) => e.toDomain()).toList(),
      defaultMaterialDescription: defaultMaterialDescription,
      isFOCMaterial: isFOCMaterial,
      quantity: MaterialQty(quantity),
      remarks: remarks,
      genericMaterialName: genericMaterialName,
      ean: ean,
      //Override with value from materialInfo to display batch & exp correctly
      //(for now BE return isMarketPlace as null)
      data: data
          .map((e) => e.toDomain().copyWith(isMarketPlace: isMarketPlace))
          .toList(),
      dataTotalCount: dataTotalCount,
      dataTotalHidden: DataTotalHidden(dataTotalHidden),
      isFavourite: isFavourite,
      isGimmick: isGimmick,
      isSampleMaterial: isSampleMaterial,
      isPoison: isPoison,
      manufactured: manufactured,
      name: name,
      type: MaterialInfoType(type),
      stockInfos: [],
      bundle: bundle.toDomain(),
      productImages:
          data.isNotEmpty ? data.first.toProductImage() : ProductImages.empty(),
      countryData: CountryData.empty(),
      parentID: '',
      counterOfferDetails: RequestCounterOfferDetails.empty(),
      promoStatus: false,
      promoType: '',
      sampleBonusItemId: '',
      isSuspended: isSuspended,
      isPrincipalSuspended: false,
      isMarketPlace: isMarketPlace,
    );
  }

  MaterialNumber get _getMaterialNumber => materialNumber.isEmpty
      ? MaterialNumber(code)
      : MaterialNumber(materialNumber);

  factory MaterialDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialDtoFromJson(json);
}

@freezed
class MaterialDataDto with _$MaterialDataDto {
  const MaterialDataDto._();

  factory MaterialDataDto({
    @JsonKey(
      name: 'code',
      defaultValue: '',
      readValue: JsonReadValueHelper.readMaterialNumberValue,
    )
    required String code,
    @JsonKey(name: 'manufactured', defaultValue: '')
    required String manufactured,
    @JsonKey(name: 'materialDescription', defaultValue: '')
    required String materialDescription,
    @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
    required String defaultMaterialDescription,
    @JsonKey(name: 'genericMaterialName', defaultValue: '')
    required String genericMaterialName,
    @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
    required String governmentMaterialCode,
    @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
    required String itemRegistrationNumber,
    @JsonKey(
      defaultValue: false,
      readValue: JsonReadValueHelper.mappingIsMarketPlace,
    )
    required bool isMarketPlace,
  }) = _MaterialDataDto;

  factory MaterialDataDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialDataDtoFromJson(json);

  MaterialData toDomain() => MaterialData(
        materialNumber: MaterialNumber(code),
        manufactured: manufactured,
        materialDescription: StringValue(materialDescription),
        defaultMaterialDescription: defaultMaterialDescription,
        genericMaterialName: genericMaterialName,
        governmentMaterialCode: StringValue(governmentMaterialCode),
        itemRegistrationNumber: ItemRegistrationNumber(itemRegistrationNumber),
        isMarketPlace: isMarketPlace,
      );

  factory MaterialDataDto.fromDomain(MaterialData materialData) =>
      MaterialDataDto(
        code: materialData.materialNumber.getOrCrash(),
        manufactured: materialData.manufactured,
        materialDescription:
            materialData.materialDescription.getOrDefaultValue(''),
        defaultMaterialDescription: materialData.defaultMaterialDescription,
        genericMaterialName: materialData.genericMaterialName,
        governmentMaterialCode:
            materialData.governmentMaterialCode.getOrDefaultValue(''),
        itemRegistrationNumber:
            materialData.itemRegistrationNumber.getOrDefaultValue(''),
        isMarketPlace: materialData.isMarketPlace,
      );

  ProductImages toProductImage() => ProductImages.empty();
}

@freezed
class MaterialResponseDto with _$MaterialResponseDto {
  const MaterialResponseDto._();
  factory MaterialResponseDto({
    @JsonKey(name: 'count', defaultValue: 0) required int count,
    @JsonKey(name: 'products', defaultValue: <MaterialDto>[])
    required List<MaterialDto> products,
  }) = _MaterialResponseDto;

  factory MaterialResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialResponseDtoFromJson(json);

  MaterialResponse toDomain() => MaterialResponse(
        count: count,
        products: products.map((e) => e.toDomain()).toList(),
      );
}

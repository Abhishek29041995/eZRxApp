import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/country_data.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_readvalue_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail_dto.freezed.dart';
part 'product_detail_dto.g.dart';

@freezed
class ProductDetailDto with _$ProductDetailDto {
  const ProductDetailDto._();
  factory ProductDetailDto({
    @JsonKey(name: 'materialNumber', defaultValue: '')
    required String materialNumber,
    @JsonKey(name: 'materialDescription', defaultValue: '')
    required String materialDescription,
    @JsonKey(name: 'principalCode', defaultValue: '')
    required String principalCode,
    @JsonKey(name: 'principalName', defaultValue: '')
    required String principalName,
    @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
    required String unitOfMeasurement,
    @JsonKey(name: 'therapeuticClass', defaultValue: '')
    required String therapeuticClass,
    @JsonKey(name: 'genericMaterialName', defaultValue: '')
    required String genericMaterialName,
    @JsonKey(name: 'itemBrand', defaultValue: '') required String itemBrand,
    @JsonKey(name: 'materialBrand', defaultValue: '')
    required String materialBrand,
    @JsonKey(name: 'isFavourite', defaultValue: false)
    required bool isFavourite,
    @JsonKey(name: 'isFOCMaterial', defaultValue: false)
    required bool isFOCMaterial,
    @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
    required String defaultMaterialDescription,
    @JsonKey(name: 'country', defaultValue: '') required String country,
    @JsonKey(name: 'countryName', defaultValue: '') required String countryName,
    @JsonKey(name: 'hidePrice', defaultValue: false) required bool hidePrice,
    @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
    required String governmentMaterialCode,
    @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
    required String itemRegistrationNumber,
    @JsonKey(name: 'promoType', defaultValue: '') required String promoType,
    @JsonKey(name: 'promoStatus', defaultValue: false)
    required bool promoStatus,
    @JsonKey(name: 'suspensionStatus', defaultValue: false)
    required bool isSuspended,
    @JsonKey(
      defaultValue: false,
      readValue: JsonReadValueHelper.mappingIsMarketPlace,
    )
    required bool isMarketPlace,
    @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
    required bool hasMandatoryTenderContract,
    @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
    required bool hasValidTenderContract,
    @JsonKey(name: 'isGimmick', defaultValue: false) required bool isGimmick,
    @JsonKey(name: 'isSampleMaterial', defaultValue: false)
    required bool isSampleMaterial,
    @JsonKey(name: 'isPoison', defaultValue: false) required bool isPoison,
  }) = _ProductDetailDto;

  MaterialInfo toDomain() => MaterialInfo(
        defaultMaterialDescription: defaultMaterialDescription,
        genericMaterialName: genericMaterialName,
        governmentMaterialCode: StringValue(governmentMaterialCode),
        hidePrice: hidePrice,
        isFavourite: isFavourite,
        itemBrand: itemBrand,
        itemRegistrationNumber: ItemRegistrationNumber(itemRegistrationNumber),
        materialDescription: materialDescription,
        materialNumber: MaterialNumber(materialNumber),
        principalData: PrincipalData(
          principalName: PrincipalName(principalName),
          principalCode: PrincipalCode(principalCode),
        ),
        therapeuticClass: therapeuticClass,
        unitOfMeasurement: StringValue(unitOfMeasurement),
        countryData: CountryData(
          country: country,
          countryName: StringValue(countryName),
        ),
        ean: '',
        materialGroup2: MaterialGroup(''),
        materialGroup4: MaterialGroup(''),
        isSampleMaterial: isSampleMaterial,
        isGimmick: isGimmick,
        isPoison: isPoison,
        hasValidTenderContract: hasValidTenderContract,
        hasMandatoryTenderContract: hasMandatoryTenderContract,
        taxClassification: MaterialTaxClassification(''),
        bundles: [],
        isFOCMaterial: isFOCMaterial,
        quantity: MaterialQty(0),
        remarks: '',
        data: <MaterialData>[],
        dataTotalCount: 0,
        dataTotalHidden: DataTotalHidden(0),
        manufactured: '',
        name: '',
        type: MaterialInfoType(''),
        stockInfos: <StockInfo>[],
        bundle: Bundle.empty(),
        productImages: ProductImages.empty(),
        tax: 0.0,
        parentID: '',
        counterOfferDetails: RequestCounterOfferDetails.empty(),
        promoStatus: promoStatus,
        promoType: promoType,
        sampleBonusItemId: '',
        isSuspended: isSuspended,
        isPrincipalSuspended: false,
        isMarketPlace: isMarketPlace,
      );

  factory ProductDetailDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailDtoFromJson(json);
}

import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_product_request.freezed.dart';

@freezed
class CartProductRequest with _$CartProductRequest {
  const CartProductRequest._();

  const factory CartProductRequest({
    required SalesOrg salesOrg,
    required String customerCode,
    required String shipToId,
    required String productNumber,
    required int quantity,
    required String language,
    required String parentID,
    required double counterOfferPrice,
    required double discountOverridePercentage,
    required String comment,
    required String counterOfferCurrency,
    required String type,
    required String itemId,
    required String tenderContractNumber,
  }) = _CartProductRequest;

  factory CartProductRequest.empty() => CartProductRequest(
        salesOrg: SalesOrg(''),
        customerCode: '',
        shipToId: '',
        productNumber: '',
        quantity: 0,
        language: '',
        parentID: '',
        counterOfferPrice: 0.0,
        discountOverridePercentage: 0.0,
        comment: '',
        counterOfferCurrency: '',
        type: '',
        itemId: '',
        tenderContractNumber: '',
      );

  factory CartProductRequest.toMaterialRequest({
    required SalesOrg salesOrg,
    required String customerCode,
    required String shipToCustomerCode,
    required String language,
    required MaterialInfo materialInfo,
    required int quantity,
    required String itemId,
    required RequestCounterOfferDetails counterOfferDetails,
    required String tenderContractNumber,
  }) =>
      CartProductRequest(
        salesOrg: salesOrg,
        customerCode: customerCode,
        shipToId: shipToCustomerCode,
        productNumber: materialInfo.materialNumber.getOrDefaultValue(''),
        quantity: quantity,
        language: language,
        parentID: materialInfo.parentID,
        counterOfferPrice: counterOfferDetails.counterOfferPrice.doubleValue,
        discountOverridePercentage:
            counterOfferDetails.discountOverridePercentage.doubleValue,
        counterOfferCurrency: counterOfferDetails.counterOfferCurrency.code,
        comment: counterOfferDetails.comment.getOrDefaultValue(''),
        type: materialInfo.type.getOrDefaultValue(''),
        itemId: itemId,
        tenderContractNumber: tenderContractNumber,
      );

  factory CartProductRequest.toBundlesRequest({
    required SalesOrg salesOrg,
    required String customerCode,
    required String shipToCustomerCode,
    required Language language,
    required MaterialInfo materialInfo,
    required String bundleCode,
  }) =>
      CartProductRequest.empty().copyWith(
        salesOrg: salesOrg,
        customerCode: customerCode,
        shipToId: shipToCustomerCode,
        productNumber: materialInfo.materialNumber.getOrCrash(),
        quantity: materialInfo.quantity.getOrCrash(),
        language: language.languageCode,
        parentID: bundleCode,
        type: 'bundle',
      );
}

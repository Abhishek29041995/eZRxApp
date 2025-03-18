import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/cart_product_request.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_product_request_dto.freezed.dart';
part 'cart_product_request_dto.g.dart';

@freezed
class CartProductRequestDto with _$CartProductRequestDto {
  const CartProductRequestDto._();

  const factory CartProductRequestDto({
    @JsonKey(name: 'SalesOrg', defaultValue: '') required String salesOrg,
    @JsonKey(name: 'CustomerCode', defaultValue: '')
    required String customerCode,
    @JsonKey(name: 'ShipToID', defaultValue: '') required String shipTo,
    @JsonKey(name: 'ProductID', defaultValue: '') required String productNumber,
    @JsonKey(name: 'Quantity', defaultValue: 0) required int quantity,
    @JsonKey(name: 'ItemSource', defaultValue: 'EZRX')
    required String itemSource,
    @JsonKey(name: 'Language', defaultValue: 'EN') required String language,
    @JsonKey(name: 'ParentID', defaultValue: '') required String parentID,
    @JsonKey(name: 'CounterOfferPrice', defaultValue: 0.0)
    required double counterOfferPrice,
    @JsonKey(name: 'DiscountOverridePercentage', defaultValue: 0.0)
    required double counterOfferDiscount,
    @JsonKey(name: 'Comment', defaultValue: '') required String comment,
    @JsonKey(name: 'CounterOfferCurrency', defaultValue: '')
    required String counterOfferCurrency,
    @JsonKey(name: 'Type', defaultValue: '') required String type,
    @JsonKey(name: 'ItemId', defaultValue: '') required String itemId,
    @JsonKey(name: 'TenderContractNumber', defaultValue: '')
    required String tenderContractNumber,
  }) = _CartProductRequestDto;

  factory CartProductRequestDto.fromDomain(
    CartProductRequest cartProductRequest,
  ) {
    return CartProductRequestDto(
      salesOrg: cartProductRequest.salesOrg.getOrDefaultValue(''),
      customerCode: cartProductRequest.customerCode,
      shipTo: cartProductRequest.shipToId,
      productNumber: cartProductRequest.productNumber,
      quantity: cartProductRequest.quantity,
      itemSource: 'EZRX',
      language: cartProductRequest.language,
      parentID: cartProductRequest.parentID,
      counterOfferPrice: cartProductRequest.counterOfferPrice,
      counterOfferDiscount: cartProductRequest.discountOverridePercentage,
      comment: cartProductRequest.comment,
      counterOfferCurrency: cartProductRequest.counterOfferCurrency,
      type: cartProductRequest.type,
      itemId: cartProductRequest.itemId,
      tenderContractNumber: cartProductRequest.tenderContractNumber,
    );
  }

  CartProductRequest toDomain() {
    return CartProductRequest(
      salesOrg: SalesOrg(salesOrg),
      customerCode: customerCode,
      shipToId: shipTo,
      productNumber: productNumber,
      quantity: quantity,
      language: language,
      parentID: parentID,
      counterOfferPrice: counterOfferPrice,
      discountOverridePercentage: counterOfferDiscount,
      comment: comment,
      counterOfferCurrency: counterOfferCurrency,
      type: type,
      itemId: itemId,
      tenderContractNumber: tenderContractNumber,
    );
  }

  factory CartProductRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CartProductRequestDtoFromJson(json);

  Map<String, dynamic> toMap() => toJson()
    ..removeWhere(
      (key, value) =>
          (key != 'ParentID' &&
              key != 'ItemId' &&
              key != 'CounterOfferPrice' &&
              key != 'DiscountOverridePercentage') &&
          ((value is String && (value.isEmpty || value == 'NA')) ||
              (value is double && value == 0.0)),
    );
}

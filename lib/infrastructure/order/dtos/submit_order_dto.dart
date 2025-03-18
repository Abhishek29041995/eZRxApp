import 'package:ezrxmobile/domain/account/entities/sales_rep_authorized_details.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_po_documents_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_material_info_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/submit_order_customer_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_order_dto.freezed.dart';
part 'submit_order_dto.g.dart';

@freezed
class SubmitOrderDto with _$SubmitOrderDto {
  const SubmitOrderDto._();
  const factory SubmitOrderDto({
    @JsonKey(name: 'username', defaultValue: '') required String userName,
    @JsonKey(name: 'companyName', defaultValue: '') required String companyName,
    @JsonKey(name: 'customer') required SubmitOrderCustomerDto customer,
    @JsonKey(name: 'POReference', defaultValue: '') required String poReference,
    @JsonKey(name: 'materials', defaultValue: <SubmitMaterialInfoDto>[])
    required List<SubmitMaterialInfoDto> materials,
    @JsonKey(name: 'PODate', defaultValue: '') required String poDate,
    @JsonKey(name: 'RequestedDeliveryDate', defaultValue: '')
    required String requestedDeliveryDate,
    @JsonKey(name: 'SpecialInstructions', defaultValue: '')
    required String specialInstructions,
    @JsonKey(name: 'orderValue', defaultValue: 0) required double orderValue,
    @JsonKey(name: 'totalTax', defaultValue: 0) required double totalTax,
    @JsonKey(name: 'Telephone', defaultValue: '') required String telephone,
    @JsonKey(name: 'referenceNotes', defaultValue: '')
    required String referenceNotes,
    @JsonKey(name: 'paymentTerms', defaultValue: '')
    required String paymentTerms,
    @JsonKey(name: 'CollectiveNumber', defaultValue: '')
    required String collectiveNumber,
    @JsonKey(name: 'blockOrder', defaultValue: false) required bool blockOrder,
    @JsonKey(name: 'language', defaultValue: 'EN') required String language,
    @JsonKey(name: 'paymentMethod', defaultValue: 'Bank Transfer')
    required String paymentMethod,
    @JsonKey(name: 'PurchaseOrderType', defaultValue: '')
    required String purchaseOrderType,
    @JsonKey(name: 'poDocuments', defaultValue: <PoDocumentsDto>[])
    required List<PoDocumentsDto> poDocuments,
    @JsonKey(name: 'movDetails', includeIfNull: false)
    SmallOrderFeeDetailDto? smallOrderFeeDetail,
    @JsonKey(name: 'orderReason', defaultValue: '') required String orderReason,
  }) = _SubmitOrderDto;

  SubmitOrder toDomain() {
    return SubmitOrder(
      userName: userName,
      companyName: CompanyName(companyName),
      customer: customer.toDomain(),
      poReference: poReference,
      products: materials.map((e) => e.toDomain()).toList(),
      poDate: poDate,
      requestedDeliveryDate: requestedDeliveryDate,
      specialInstructions: specialInstructions,
      orderValue: orderValue,
      totalTax: totalTax,
      orderType: '',
      telephone: telephone,
      referenceNotes: referenceNotes,
      paymentTerms: paymentTerms,
      collectiveNumber: collectiveNumber,
      blockOrder: blockOrder,
      poDocuments: poDocuments.map((e) => e.toDomain()).toList(),
      language: language,
      paymentMethod: paymentMethod,
      purchaseOrderType: purchaseOrderType,
      smallOrderFeeDetail:
          smallOrderFeeDetail?.toDomain ?? SmallOrderFeeDetail.empty(),
      orderReason: orderReason,
      salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
    );
  }

  factory SubmitOrderDto.fromDomain(
    SubmitOrder submitOrder,
  ) {
    return SubmitOrderDto(
      userName: submitOrder.userName,
      companyName: submitOrder.companyName.getOrDefaultValue(''),
      customer: SubmitOrderCustomerDto.fromDomain(submitOrder.customer),
      poReference: submitOrder.poReference,
      materials: submitOrder.products
          .map((e) => SubmitMaterialInfoDto.fromDomain(e))
          .toList(),
      poDate: submitOrder.poDate,
      requestedDeliveryDate: submitOrder.requestedDeliveryDate,
      specialInstructions: submitOrder.specialInstructions,
      orderValue: submitOrder.orderValue,
      totalTax: submitOrder.totalTax,
      telephone: submitOrder.telephone,
      referenceNotes: submitOrder.referenceNotes,
      paymentTerms: submitOrder.paymentTerms,
      collectiveNumber: submitOrder.collectiveNumber,
      blockOrder: submitOrder.blockOrder,
      poDocuments: submitOrder.poDocuments
          .map(
            (e) => PoDocumentsDto.fromDomain(e),
          )
          .toList(),
      language: submitOrder.language,
      paymentMethod: submitOrder.paymentMethod,
      purchaseOrderType: submitOrder.purchaseOrderType,
      smallOrderFeeDetail: submitOrder.smallOrderFeeDetail.isValid
          ? SmallOrderFeeDetailDto.fromDomain(submitOrder.smallOrderFeeDetail)
          : null,
      orderReason: submitOrder.orderReason,
    );
  }

  factory SubmitOrderDto.fromJson(Map<String, dynamic> json) =>
      _$SubmitOrderDtoFromJson(json);
}

@freezed
class SmallOrderFeeDetailDto with _$SmallOrderFeeDetailDto {
  const SmallOrderFeeDetailDto._();

  const factory SmallOrderFeeDetailDto({
    @JsonKey(name: 'smallOrderFee', defaultValue: '')
    required String smallOrderFee,
    @JsonKey(name: 'mpSmallOrderFee', defaultValue: '', includeIfNull: false)
    String? mpSmallOrderFee,
    @JsonKey(name: 'currency', defaultValue: '') required String currency,
  }) = _SmallOrderFeeDetailDto;

  factory SmallOrderFeeDetailDto.fromJson(Map<String, dynamic> json) =>
      _$SmallOrderFeeDetailDtoFromJson(json);

  factory SmallOrderFeeDetailDto.fromDomain(SmallOrderFeeDetail entity) =>
      SmallOrderFeeDetailDto(
        currency: entity.currency.code,
        mpSmallOrderFee: entity.mpSmallOrderFee == 0
            ? null
            : entity.mpSmallOrderFee.toString(),
        smallOrderFee: entity.zpSmallOrderFee.toString(),
      );

  SmallOrderFeeDetail get toDomain => SmallOrderFeeDetail(
        zpSmallOrderFee: double.tryParse(smallOrderFee) ?? 0,
        mpSmallOrderFee: double.tryParse(mpSmallOrderFee ?? '') ?? 0,
        currency: Currency(currency),
      );
}

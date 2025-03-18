import 'package:ezrxmobile/domain/account/entities/sales_rep_authorized_details.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:ezrxmobile/domain/order/entities/submit_material_info.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_customer.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_order.freezed.dart';

@freezed
class SubmitOrder with _$SubmitOrder {
  const SubmitOrder._();
  const factory SubmitOrder({
    required String userName,
    required CompanyName companyName,
    required SubmitOrderCustomer customer,
    required String poReference,
    required List<SubmitMaterialInfo> products,
    required String poDate,
    required String requestedDeliveryDate,
    required String specialInstructions,
    required double orderValue,
    required double totalTax,
    required String telephone,
    required String referenceNotes,
    required String paymentTerms,
    required String collectiveNumber,
    required String orderType,
    required bool blockOrder,
    required List<PoDocuments> poDocuments,
    required String language,
    required String paymentMethod,
    required String purchaseOrderType,
    required String orderReason,
    required SmallOrderFeeDetail smallOrderFeeDetail,
    required SalesRepAuthorizedDetails salesRepAuthorizedDetails,
  }) = _SubmitOrderCustomer;

  factory SubmitOrder.empty() => SubmitOrder(
        userName: '',
        companyName: CompanyName(''),
        customer: SubmitOrderCustomer.empty(),
        poReference: '',
        products: <SubmitMaterialInfo>[],
        poDate: '',
        requestedDeliveryDate: '',
        specialInstructions: '',
        telephone: '',
        referenceNotes: '',
        paymentTerms: '',
        collectiveNumber: '',
        blockOrder: false,
        poDocuments: [],
        language: '',
        orderType: '',
        paymentMethod: '',
        orderValue: 0,
        totalTax: 0,
        purchaseOrderType: '',
        orderReason: '',
        smallOrderFeeDetail: SmallOrderFeeDetail.empty(),
        salesRepAuthorizedDetails: SalesRepAuthorizedDetails.empty(),
      );
}

@freezed
class SmallOrderFeeDetail with _$SmallOrderFeeDetail {
  const SmallOrderFeeDetail._();

  const factory SmallOrderFeeDetail({
    required double zpSmallOrderFee,
    required double mpSmallOrderFee,
    required Currency currency,
  }) = _SmallOrderFeeDetail;

  factory SmallOrderFeeDetail.empty() => SmallOrderFeeDetail(
        zpSmallOrderFee: 0.0,
        mpSmallOrderFee: 0.0,
        currency: Currency(''),
      );

  bool get isValid => zpSmallOrderFee > 0 || mpSmallOrderFee > 0;
}

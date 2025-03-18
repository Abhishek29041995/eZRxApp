import 'package:ezrxmobile/domain/core/value/value_objects.dart';

import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history_details_tender_contract.freezed.dart';

@freezed
class OrderHistoryDetailsTenderContract
    with _$OrderHistoryDetailsTenderContract {
  const OrderHistoryDetailsTenderContract._();
  factory OrderHistoryDetailsTenderContract({
    required TenderContractNumber contractNumber,
    required TenderContractReason orderReason,
    required double price,
    required int priceUnit,
    required int contractQuantity,
    required int remainingQuantity,
    required DateTimeStringValue expiryDate,
    required String contractReference,
    required String visaNumber,
    required String salesDistrict,
    required String announcementLetterNumber,
    required bool isTenderExpired,
  }) = _OrderHistoryDetailsTenderContract;

  factory OrderHistoryDetailsTenderContract.empty() =>
      OrderHistoryDetailsTenderContract(
        contractNumber: TenderContractNumber(''),
        orderReason: TenderContractReason(''),
        price: 0.0,
        priceUnit: 0,
        contractQuantity: 0,
        remainingQuantity: 0,
        expiryDate: DateTimeStringValue(''),
        contractReference: '',
        visaNumber: '',
        salesDistrict: '',
        announcementLetterNumber: '',
        isTenderExpired: false,
      );
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history_details_order_items_details.freezed.dart';

@freezed
class OrderHistoryDetailsOrderItemDetails
    with _$OrderHistoryDetailsOrderItemDetails {
  const OrderHistoryDetailsOrderItemDetails._();
  factory OrderHistoryDetailsOrderItemDetails({
    required String discountCode,
    required String discountDescription,
    required String rate,
  }) = _OrderHistoryDetailsOrderItemDetails;

  factory OrderHistoryDetailsOrderItemDetails.empty() =>
      OrderHistoryDetailsOrderItemDetails(
        discountCode: '',
        discountDescription: '',
        rate: '',
      );
}

// extension OrderHistoryDetailsOrderItemDetailsExtension
//     on List<OrderHistoryDetailsOrderItemDetails> {
//   String get discountRate {
//     final rateList = map((e) => e.rate).toList();

//     return rateList.isEmpty ? '' : rateList.first;
//   }
// }

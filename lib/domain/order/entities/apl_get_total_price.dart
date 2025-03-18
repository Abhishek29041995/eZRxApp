import 'package:freezed_annotation/freezed_annotation.dart';
part 'apl_get_total_price.freezed.dart';

@freezed
class AplGetTotalPrice with _$AplGetTotalPrice {
  const AplGetTotalPrice._();

  const factory AplGetTotalPrice({
    required int smallOrderFee,
    required int totalTax,
    required int grandTotal,
  }) = _AplGetTotalPrice;

  factory AplGetTotalPrice.empty() => const AplGetTotalPrice(
        smallOrderFee: 0,
        grandTotal: 0,
        totalTax: 0,
      );

  double get subtotalPriceInclTax => (grandTotal - smallOrderFee).toDouble();
}

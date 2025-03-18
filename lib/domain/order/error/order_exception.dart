import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_exception.freezed.dart';

@freezed
class OrderException with _$OrderException {
  const factory OrderException.submitOrderDataIsEmpty() =
      _SubmitOrderDataIsEmpty;
  const factory OrderException.draftOrdersDataIsEmpty() =
      _DraftOrdersDataIsEmpty;
  const factory OrderException.draftOrdersInCreateDraftOrderDataIsEmpty() =
      _DraftOrdersInCreateDraftOrderDataIsEmpty;
}

class StockInfoException implements Exception {
  StockInfoException();
}

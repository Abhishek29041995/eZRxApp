import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_suggestion_history.freezed.dart';

@freezed
class ProductSuggestionHistory with _$ProductSuggestionHistory {
  const ProductSuggestionHistory._();
  factory ProductSuggestionHistory({
    required List<SearchKey> searchKeyList,
  }) = _ProductSuggestionHistory;

  factory ProductSuggestionHistory.empty() => ProductSuggestionHistory(
        searchKeyList: <SearchKey>[],
      );
}

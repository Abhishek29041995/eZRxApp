import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import 'package:ezrxmobile/domain/order/entities/product_suggestion_history.dart';

part 'product_suggestion_history_dto.freezed.dart';
part 'product_suggestion_history_dto.g.dart';

@freezed
class ProductSuggestionHistoryDto with _$ProductSuggestionHistoryDto {
  const ProductSuggestionHistoryDto._();
  @HiveType(typeId: 38, adapterName: 'ProductSuggestionHistoryDtoAdapter')
  factory ProductSuggestionHistoryDto({
    @JsonKey(name: 'searchKeyList')
    @HiveField(0, defaultValue: <String>[])
        required List<String> searchKeyList,
  }) = _ProductSuggestionHistoryDto;

  factory ProductSuggestionHistoryDto.fromDomain(
    ProductSuggestionHistory domain,
  ) {
    return ProductSuggestionHistoryDto(
      searchKeyList: domain.searchKeyList.map((e) => e.getOrCrash()).toList(),
    );
  }

  factory ProductSuggestionHistoryDto.fromJson(Map<String, dynamic> json) =>
      _$ProductSuggestionHistoryDtoFromJson(json);

  ProductSuggestionHistory toDomain() => ProductSuggestionHistory(
        searchKeyList: searchKeyList.map((e) => SearchKey.search(e)).toList(),
      );

  List<String> getModifiedList(SearchKey searchKey) {
    final searchKeyStr = searchKey.getOrCrash();

    if (searchKeyList.contains(searchKeyStr)) {
      final index = searchKeyList.indexOf(searchKeyStr);

      return List.from(searchKeyList)
        ..removeAt(index)
        ..insert(searchKeyList.length - 1, searchKeyStr);
    }

    if (searchKeyList.length == 5) {
      return List.from(searchKeyList)
        ..removeAt(0)
        ..insert(4, searchKeyStr);
    }

    return List.from(searchKeyList)..add(searchKeyStr);
  }
}

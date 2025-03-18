import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:ezrxmobile/infrastructure/order/dtos/product_suggestion_history_dto.dart';

class ProductSuggestionHistoryStorage {
  static const _boxName = 'ezrx_search_history_box';
  static const _id = 'product_Suggestions';

  late Box _searchHistoryBox;

  ProductSuggestionHistoryStorage();

  Future<void> init() async {
    try {
      await Hive.initFlutter();
      Hive.registerAdapter(ProductSuggestionHistoryDtoAdapter());
      _searchHistoryBox = await Hive.openBox(
        _boxName,
      );
    } catch (e) {
      await Hive.deleteBoxFromDisk(_boxName);
      await init();
    }
  }

  Future<void> putSearchKey({
    required ProductSuggestionHistoryDto searchKeyList,
  }) async {
    try {
      await _searchHistoryBox.put(_id, searchKeyList);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  ProductSuggestionHistoryDto getAllSearchKey() {
    try {
      return _searchHistoryBox.get(
        _id,
        defaultValue: ProductSuggestionHistoryDto(searchKeyList: <String>[]),
      );
    } catch (e) {
      throw (CacheException(message: e.toString()));
    }
  }

  Future<void> clear() async {
    try {
      await _searchHistoryBox.flush();
      await _searchHistoryBox.clear();
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}

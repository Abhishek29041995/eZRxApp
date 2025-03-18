import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_info.freezed.dart';

@freezed
class MaterialStockInfo with _$MaterialStockInfo {
  const MaterialStockInfo._();

  const factory MaterialStockInfo({
    required MaterialNumber materialNumber,
    required List<StockInfo> stockInfos,
  }) = _MaterialStockInfo;

  factory MaterialStockInfo.empty() => MaterialStockInfo(
        materialNumber: MaterialNumber(''),
        stockInfos: <StockInfo>[],
      );
}

@freezed
class StockInfo with _$StockInfo {
  const StockInfo._();

  const factory StockInfo({
    required MaterialNumber materialNumber,
    required DateTimeStringValue expiryDate,
    required StringValue batch,
    required MaterialInStock inStock,
    required String salesDistrict,
    required int stockQuantity,
  }) = _StockInfo;

  factory StockInfo.empty() => StockInfo(
        materialNumber: MaterialNumber(''),
        expiryDate: DateTimeStringValue(''),
        batch: StringValue(''),
        inStock: MaterialInStock(''),
        salesDistrict: '',
        stockQuantity: 0,
      );

  // If product is marketplace, batch number always be NA
  String displayBatchNumber({required bool isMarketPlace}) =>
      (isMarketPlace ? StringValue('') : batch).displayNAIfEmpty;

  String displayExpiryDate({
    required bool isMarketPlace,
    required bool isPhMdi,
    required bool isAbbotPrincipalCode,
  }) {
    /// If the sales organization is  PH MDI (2501) and
    /// the product is not an Abbot material, the expiry date is not available,
    /// and an empty DateTimeStringValue is returned.
    /// Otherwise, the expiry date from the product's stock information is returned.
    if (isPhMdi && !isAbbotPrincipalCode) {
      return DateTimeStringValue('').dateOrNaString;
    }

    // If product is marketplace, expiry date always be NA
    return (isMarketPlace ? DateTimeStringValue('') : expiryDate)
        .dateOrNaString;
  }

  bool get isEmpty => this == StockInfo.empty();

  bool get displayPreOrderLabel => !isEmpty && !inStock.isMaterialInStock;

  bool get isExpireSoon => expiryDate.withinAYearFromNow;
}

extension StockInfoListExtension on List<StockInfo> {
  bool get inStock => any((e) => e.inStock.isMaterialInStock);
}

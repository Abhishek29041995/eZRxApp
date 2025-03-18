import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_info_dto.freezed.dart';
part 'stock_info_dto.g.dart';

@freezed
class MaterialStockInfoDto with _$MaterialStockInfoDto {
  const MaterialStockInfoDto._();

  factory MaterialStockInfoDto({
    @JsonKey(name: 'MaterialNumber', defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'StockInformation', defaultValue: [])
        required List<StockInfoDto> stockInformation,
  }) = _MaterialStockInfoDto;

  factory MaterialStockInfoDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialStockInfoDtoFromJson(json);

  /// If `stockInformation` is empty, we assign '[StockInfo.empty()]' to prevent
  /// materials from being treated as 'inStock' in the presentation layer.
  MaterialStockInfo toDomain() => MaterialStockInfo(
        materialNumber: MaterialNumber(materialNumber),
        stockInfos: stockInformation.isNotEmpty
            ? stockInformation.map((e) => e.toDomain()).toList()
            : [StockInfo.empty()],
      );
}

@freezed
class StockInfoDto with _$StockInfoDto {
  const StockInfoDto._();

  const factory StockInfoDto({
    @JsonKey(name: 'MaterialNumber', defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'ExpiryDate', defaultValue: '') required String expiryDate,
    @JsonKey(name: 'Batch', defaultValue: '') required String batch,
    @JsonKey(name: 'InStock', defaultValue: '') required String inStock,
    @JsonKey(name: 'StockQuantity', defaultValue: 0) required int stockQuantity,
    @JsonKey(name: 'SalesDistrict', defaultValue: '')
        required String salesDistrict,
  }) = _StockInfoDto;

  factory StockInfoDto.fromDomain(StockInfo stockInfo) {
    return StockInfoDto(
      materialNumber: stockInfo.materialNumber.getOrDefaultValue(''),
      expiryDate: stockInfo.expiryDate.getOrDefaultValue(''),
      batch: stockInfo.batch.getOrDefaultValue(''),
      inStock: stockInfo.inStock.getOrDefaultValue(''),
      salesDistrict: stockInfo.salesDistrict,
      stockQuantity: stockInfo.stockQuantity,
    );
  }

  StockInfo toDomain() {
    return StockInfo(
      materialNumber: MaterialNumber(materialNumber),
      batch: StringValue(batch),
      expiryDate: DateTimeStringValue(expiryDate),
      inStock: MaterialInStock(inStock),
      salesDistrict: salesDistrict,
      stockQuantity: stockQuantity,
    );
  }

  factory StockInfoDto.fromJson(Map<String, dynamic> json) =>
      _$StockInfoDtoFromJson(json);
}

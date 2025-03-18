part of 'product_detail_bloc.dart';

@freezed
class ProductDetailEvent with _$ProductDetailEvent {
  factory ProductDetailEvent.fetch({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required User user,
    required MaterialInfo materialInfo,
  }) = _Fetch;
  factory ProductDetailEvent.fetchSimilarProduct() = _FetchSimilarProduct;
  factory ProductDetailEvent.fetchMetaData() = _FetchMetaData;
  factory ProductDetailEvent.fetchStock({
    required MaterialNumber materialNumber,
  }) = _FetchStock;
  factory ProductDetailEvent.fetchStockForBundle({
    required List<MaterialInfo> materials,
  }) = _FetchStockForBundle;
  factory ProductDetailEvent.changeImage(int index) = _ChangeImage;
  factory ProductDetailEvent.addFavourite({
    required bool isForSimilarProduct,
    required MaterialNumber materialNumber,
  }) = _AddFavourite;
  factory ProductDetailEvent.deleteFavourite({
    required bool isForSimilarProduct,
    required MaterialNumber materialNumber,
  }) = _DeleteFavourite;
  factory ProductDetailEvent.updateQty({required int qty}) = _UpdateQty;
  const factory ProductDetailEvent.fetchItemQuantityForZdp5Discount({
    required int quantity,
  }) = _FetchItemQuantityForZdp5Discount;
  const factory ProductDetailEvent.setExceedQty({
    required bool exceedQty,
  }) = _SetExceedQty;
}

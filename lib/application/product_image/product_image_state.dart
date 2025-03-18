part of 'product_image_bloc.dart';

@freezed
class ProductImageState with _$ProductImageState {
  const ProductImageState._();

  const factory ProductImageState({
    required Map<MaterialNumber, ProductImages> productImageMap,
    required bool isFetching,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  }) = _ProductImageState;

  factory ProductImageState.initial() => ProductImageState(
        productImageMap: <MaterialNumber, ProductImages>{},
        isFetching: false,
        salesOrganisation: SalesOrganisation.empty(),
        customerCodeInfo: CustomerCodeInfo.empty(),
      );

  ProductImages getMaterialImage(MaterialNumber materialNumber) =>
      productImageMap[materialNumber] ?? ProductImages.empty();
}

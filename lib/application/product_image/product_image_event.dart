part of 'product_image_bloc.dart';

@freezed
class ProductImageEvent with _$ProductImageEvent {
  const factory ProductImageEvent.initialized({
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  }) = _Initialized;
  const factory ProductImageEvent.fetch({
    required List list,
  }) = _Fetch;
  const factory ProductImageEvent.set({
    required Map<MaterialNumber, ProductImages> productImageMap,
  }) = _Set;
}

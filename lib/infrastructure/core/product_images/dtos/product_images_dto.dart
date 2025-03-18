import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_images_dto.freezed.dart';
part 'product_images_dto.g.dart';

@freezed
class ProductImagesDto with _$ProductImagesDto {
  const ProductImagesDto._();
  const factory ProductImagesDto({
    @JsonKey(
      name: 'materialID',
      defaultValue: '',
    )
        required String materialNumber,
    @JsonKey(
      name: 'name',
      defaultValue: '',
    )
        required String name,
    @JsonKey(
      name: 'description',
      defaultValue: '',
    )
        required String description,
    @JsonKey(
      name: 'thumbNail',
      defaultValue: '',
    )
        required String thumbNail,
    @JsonKey(
      name: 'image',
      defaultValue: <String>[],
    )
        required List<String> image,
  }) = _ProductImagesDto;
  factory ProductImagesDto.fromDomain(
    ProductImages productImages,
  ) {
    return ProductImagesDto(
      materialNumber: productImages.materialNumber.displayMatNo,
      name: productImages.name,
      description: productImages.description.getOrDefaultValue(''),
      thumbNail: productImages.thumbNail,
      image: productImages.image,
    );
  }
  ProductImages toDomain() {
    return ProductImages(
      materialNumber: MaterialNumber(materialNumber),
      name: name,
      description: StringValue(description),
      thumbNail: thumbNail,
      image: image,
    );
  }

  factory ProductImagesDto.fromJson(Map<String, dynamic> json) =>
      _$ProductImagesDtoFromJson(json);
}

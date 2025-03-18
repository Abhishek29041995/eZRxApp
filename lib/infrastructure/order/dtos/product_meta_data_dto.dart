import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/product_images/dtos/product_images_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_meta_data_dto.freezed.dart';
part 'product_meta_data_dto.g.dart';

@freezed
class ProductMetaDataDto with _$ProductMetaDataDto {
  const ProductMetaDataDto._();
  factory ProductMetaDataDto({
    @JsonKey(
      name: 'orderCloudProduct',
      defaultValue: <ProductImagesDto>[],
    )
        required List<ProductImagesDto> productImages,
    @JsonKey(
      name: 'Items',
      defaultValue: <ProductItemDto>[],
    )
        required List<ProductItemDto> items,
  }) = _ProductMetaDataDto;

  ProductMetaData get toDomain => ProductMetaData(
        productImages: productImages.map((e) => e.toDomain()).toList(),
        items: items.map((e) => e.toDomain).toList(),
      );
  factory ProductMetaDataDto.fromDomain(ProductMetaData productMetaData) =>
      ProductMetaDataDto(
        productImages: productMetaData.productImages
            .map((e) => ProductImagesDto.fromDomain(e))
            .toList(),
        items: productMetaData.items
            .map((e) => ProductItemDto.fromDomain(e))
            .toList(),
      );

  factory ProductMetaDataDto.fromJson(Map<String, dynamic> json) =>
      _$ProductMetaDataDtoFromJson(json);
}

@freezed
class ProductItemDto with _$ProductItemDto {
  const ProductItemDto._();
  const factory ProductItemDto({
    @JsonKey(
      name: 'PromotionMaterial',
      defaultValue: '',
    )
        required String promotionMaterial,
    @JsonKey(name: 'ID', defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'XP')
        required ProductItemXpDto xp,
  }) = _ProductItemDto;

  ProductItem get toDomain => ProductItem(
        promotionMaterial: StringValue(promotionMaterial),
        productItemXp: xp.toDomain,
        materialNumber: MaterialNumber(materialNumber),
      );

  factory ProductItemDto.fromDomain(ProductItem productItem) => ProductItemDto(
        promotionMaterial: productItem.promotionMaterial.getOrDefaultValue(''),
        xp: ProductItemXpDto.fromDomain(productItem.productItemXp),
        materialNumber: productItem.materialNumber.getOrDefaultValue(''),
      );

  factory ProductItemDto.fromJson(Map<String, dynamic> json) =>
      _$ProductItemDtoFromJson(json);
}

@freezed
class ProductItemXpDto with _$ProductItemXpDto {
  const ProductItemXpDto._();

  const factory ProductItemXpDto({
    @JsonKey(
      name: 'Dosage',
      defaultValue: '',
    )
        required String dosage,
    @JsonKey(
      name: 'HowToUse',
      defaultValue: '',
    )
        required String howToUse,
    @JsonKey(
      name: 'Composition',
      defaultValue: '',
    )
        required String composition,
    @JsonKey(
      name: 'DeliveryInstructions',
      defaultValue: '',
    )
        required String deliveryInstructions,
  }) = _ProductItemXpDto;

  ProductItemXp get toDomain => ProductItemXp(
        dosage: StringValue(dosage),
        howToUse: StringValue(howToUse),
        composition: StringValue(composition),
        deliveryInstructions: StringValue(deliveryInstructions),
      );

  factory ProductItemXpDto.fromDomain(ProductItemXp productItemXp) =>
      ProductItemXpDto(
        composition: productItemXp.composition.getOrDefaultValue(''),
        deliveryInstructions:
            productItemXp.deliveryInstructions.getOrDefaultValue(''),
        dosage: productItemXp.dosage.getOrDefaultValue(''),
        howToUse: productItemXp.howToUse.getOrDefaultValue(''),
      );

  factory ProductItemXpDto.fromJson(Map<String, dynamic> json) =>
      _$ProductItemXpDtoFromJson(json);
}

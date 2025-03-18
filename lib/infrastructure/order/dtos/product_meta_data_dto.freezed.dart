// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_meta_data_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductMetaDataDto _$ProductMetaDataDtoFromJson(Map<String, dynamic> json) {
  return _ProductMetaDataDto.fromJson(json);
}

/// @nodoc
mixin _$ProductMetaDataDto {
  @JsonKey(name: 'orderCloudProduct', defaultValue: <ProductImagesDto>[])
  List<ProductImagesDto> get productImages =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Items', defaultValue: <ProductItemDto>[])
  List<ProductItemDto> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductMetaDataDtoCopyWith<ProductMetaDataDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductMetaDataDtoCopyWith<$Res> {
  factory $ProductMetaDataDtoCopyWith(
          ProductMetaDataDto value, $Res Function(ProductMetaDataDto) then) =
      _$ProductMetaDataDtoCopyWithImpl<$Res, ProductMetaDataDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'orderCloudProduct', defaultValue: <ProductImagesDto>[])
      List<ProductImagesDto> productImages,
      @JsonKey(name: 'Items', defaultValue: <ProductItemDto>[])
      List<ProductItemDto> items});
}

/// @nodoc
class _$ProductMetaDataDtoCopyWithImpl<$Res, $Val extends ProductMetaDataDto>
    implements $ProductMetaDataDtoCopyWith<$Res> {
  _$ProductMetaDataDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productImages = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      productImages: null == productImages
          ? _value.productImages
          : productImages // ignore: cast_nullable_to_non_nullable
              as List<ProductImagesDto>,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ProductItemDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductMetaDataDtoImplCopyWith<$Res>
    implements $ProductMetaDataDtoCopyWith<$Res> {
  factory _$$ProductMetaDataDtoImplCopyWith(_$ProductMetaDataDtoImpl value,
          $Res Function(_$ProductMetaDataDtoImpl) then) =
      __$$ProductMetaDataDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'orderCloudProduct', defaultValue: <ProductImagesDto>[])
      List<ProductImagesDto> productImages,
      @JsonKey(name: 'Items', defaultValue: <ProductItemDto>[])
      List<ProductItemDto> items});
}

/// @nodoc
class __$$ProductMetaDataDtoImplCopyWithImpl<$Res>
    extends _$ProductMetaDataDtoCopyWithImpl<$Res, _$ProductMetaDataDtoImpl>
    implements _$$ProductMetaDataDtoImplCopyWith<$Res> {
  __$$ProductMetaDataDtoImplCopyWithImpl(_$ProductMetaDataDtoImpl _value,
      $Res Function(_$ProductMetaDataDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productImages = null,
    Object? items = null,
  }) {
    return _then(_$ProductMetaDataDtoImpl(
      productImages: null == productImages
          ? _value._productImages
          : productImages // ignore: cast_nullable_to_non_nullable
              as List<ProductImagesDto>,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ProductItemDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductMetaDataDtoImpl extends _ProductMetaDataDto {
  _$ProductMetaDataDtoImpl(
      {@JsonKey(name: 'orderCloudProduct', defaultValue: <ProductImagesDto>[])
      required final List<ProductImagesDto> productImages,
      @JsonKey(name: 'Items', defaultValue: <ProductItemDto>[])
      required final List<ProductItemDto> items})
      : _productImages = productImages,
        _items = items,
        super._();

  factory _$ProductMetaDataDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductMetaDataDtoImplFromJson(json);

  final List<ProductImagesDto> _productImages;
  @override
  @JsonKey(name: 'orderCloudProduct', defaultValue: <ProductImagesDto>[])
  List<ProductImagesDto> get productImages {
    if (_productImages is EqualUnmodifiableListView) return _productImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productImages);
  }

  final List<ProductItemDto> _items;
  @override
  @JsonKey(name: 'Items', defaultValue: <ProductItemDto>[])
  List<ProductItemDto> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ProductMetaDataDto(productImages: $productImages, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductMetaDataDtoImpl &&
            const DeepCollectionEquality()
                .equals(other._productImages, _productImages) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_productImages),
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductMetaDataDtoImplCopyWith<_$ProductMetaDataDtoImpl> get copyWith =>
      __$$ProductMetaDataDtoImplCopyWithImpl<_$ProductMetaDataDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductMetaDataDtoImplToJson(
      this,
    );
  }
}

abstract class _ProductMetaDataDto extends ProductMetaDataDto {
  factory _ProductMetaDataDto(
      {@JsonKey(name: 'orderCloudProduct', defaultValue: <ProductImagesDto>[])
      required final List<ProductImagesDto> productImages,
      @JsonKey(name: 'Items', defaultValue: <ProductItemDto>[])
      required final List<ProductItemDto> items}) = _$ProductMetaDataDtoImpl;
  _ProductMetaDataDto._() : super._();

  factory _ProductMetaDataDto.fromJson(Map<String, dynamic> json) =
      _$ProductMetaDataDtoImpl.fromJson;

  @override
  @JsonKey(name: 'orderCloudProduct', defaultValue: <ProductImagesDto>[])
  List<ProductImagesDto> get productImages;
  @override
  @JsonKey(name: 'Items', defaultValue: <ProductItemDto>[])
  List<ProductItemDto> get items;
  @override
  @JsonKey(ignore: true)
  _$$ProductMetaDataDtoImplCopyWith<_$ProductMetaDataDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductItemDto _$ProductItemDtoFromJson(Map<String, dynamic> json) {
  return _ProductItemDto.fromJson(json);
}

/// @nodoc
mixin _$ProductItemDto {
  @JsonKey(name: 'PromotionMaterial', defaultValue: '')
  String get promotionMaterial => throw _privateConstructorUsedError;
  @JsonKey(name: 'ID', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'XP')
  ProductItemXpDto get xp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductItemDtoCopyWith<ProductItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductItemDtoCopyWith<$Res> {
  factory $ProductItemDtoCopyWith(
          ProductItemDto value, $Res Function(ProductItemDto) then) =
      _$ProductItemDtoCopyWithImpl<$Res, ProductItemDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'PromotionMaterial', defaultValue: '')
      String promotionMaterial,
      @JsonKey(name: 'ID', defaultValue: '') String materialNumber,
      @JsonKey(name: 'XP') ProductItemXpDto xp});

  $ProductItemXpDtoCopyWith<$Res> get xp;
}

/// @nodoc
class _$ProductItemDtoCopyWithImpl<$Res, $Val extends ProductItemDto>
    implements $ProductItemDtoCopyWith<$Res> {
  _$ProductItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotionMaterial = null,
    Object? materialNumber = null,
    Object? xp = null,
  }) {
    return _then(_value.copyWith(
      promotionMaterial: null == promotionMaterial
          ? _value.promotionMaterial
          : promotionMaterial // ignore: cast_nullable_to_non_nullable
              as String,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      xp: null == xp
          ? _value.xp
          : xp // ignore: cast_nullable_to_non_nullable
              as ProductItemXpDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductItemXpDtoCopyWith<$Res> get xp {
    return $ProductItemXpDtoCopyWith<$Res>(_value.xp, (value) {
      return _then(_value.copyWith(xp: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductItemDtoImplCopyWith<$Res>
    implements $ProductItemDtoCopyWith<$Res> {
  factory _$$ProductItemDtoImplCopyWith(_$ProductItemDtoImpl value,
          $Res Function(_$ProductItemDtoImpl) then) =
      __$$ProductItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'PromotionMaterial', defaultValue: '')
      String promotionMaterial,
      @JsonKey(name: 'ID', defaultValue: '') String materialNumber,
      @JsonKey(name: 'XP') ProductItemXpDto xp});

  @override
  $ProductItemXpDtoCopyWith<$Res> get xp;
}

/// @nodoc
class __$$ProductItemDtoImplCopyWithImpl<$Res>
    extends _$ProductItemDtoCopyWithImpl<$Res, _$ProductItemDtoImpl>
    implements _$$ProductItemDtoImplCopyWith<$Res> {
  __$$ProductItemDtoImplCopyWithImpl(
      _$ProductItemDtoImpl _value, $Res Function(_$ProductItemDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotionMaterial = null,
    Object? materialNumber = null,
    Object? xp = null,
  }) {
    return _then(_$ProductItemDtoImpl(
      promotionMaterial: null == promotionMaterial
          ? _value.promotionMaterial
          : promotionMaterial // ignore: cast_nullable_to_non_nullable
              as String,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      xp: null == xp
          ? _value.xp
          : xp // ignore: cast_nullable_to_non_nullable
              as ProductItemXpDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductItemDtoImpl extends _ProductItemDto {
  const _$ProductItemDtoImpl(
      {@JsonKey(name: 'PromotionMaterial', defaultValue: '')
      required this.promotionMaterial,
      @JsonKey(name: 'ID', defaultValue: '') required this.materialNumber,
      @JsonKey(name: 'XP') required this.xp})
      : super._();

  factory _$ProductItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductItemDtoImplFromJson(json);

  @override
  @JsonKey(name: 'PromotionMaterial', defaultValue: '')
  final String promotionMaterial;
  @override
  @JsonKey(name: 'ID', defaultValue: '')
  final String materialNumber;
  @override
  @JsonKey(name: 'XP')
  final ProductItemXpDto xp;

  @override
  String toString() {
    return 'ProductItemDto(promotionMaterial: $promotionMaterial, materialNumber: $materialNumber, xp: $xp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductItemDtoImpl &&
            (identical(other.promotionMaterial, promotionMaterial) ||
                other.promotionMaterial == promotionMaterial) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.xp, xp) || other.xp == xp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, promotionMaterial, materialNumber, xp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductItemDtoImplCopyWith<_$ProductItemDtoImpl> get copyWith =>
      __$$ProductItemDtoImplCopyWithImpl<_$ProductItemDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductItemDtoImplToJson(
      this,
    );
  }
}

abstract class _ProductItemDto extends ProductItemDto {
  const factory _ProductItemDto(
          {@JsonKey(name: 'PromotionMaterial', defaultValue: '')
          required final String promotionMaterial,
          @JsonKey(name: 'ID', defaultValue: '')
          required final String materialNumber,
          @JsonKey(name: 'XP') required final ProductItemXpDto xp}) =
      _$ProductItemDtoImpl;
  const _ProductItemDto._() : super._();

  factory _ProductItemDto.fromJson(Map<String, dynamic> json) =
      _$ProductItemDtoImpl.fromJson;

  @override
  @JsonKey(name: 'PromotionMaterial', defaultValue: '')
  String get promotionMaterial;
  @override
  @JsonKey(name: 'ID', defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'XP')
  ProductItemXpDto get xp;
  @override
  @JsonKey(ignore: true)
  _$$ProductItemDtoImplCopyWith<_$ProductItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductItemXpDto _$ProductItemXpDtoFromJson(Map<String, dynamic> json) {
  return _ProductItemXpDto.fromJson(json);
}

/// @nodoc
mixin _$ProductItemXpDto {
  @JsonKey(name: 'Dosage', defaultValue: '')
  String get dosage => throw _privateConstructorUsedError;
  @JsonKey(name: 'HowToUse', defaultValue: '')
  String get howToUse => throw _privateConstructorUsedError;
  @JsonKey(name: 'Composition', defaultValue: '')
  String get composition => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeliveryInstructions', defaultValue: '')
  String get deliveryInstructions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductItemXpDtoCopyWith<ProductItemXpDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductItemXpDtoCopyWith<$Res> {
  factory $ProductItemXpDtoCopyWith(
          ProductItemXpDto value, $Res Function(ProductItemXpDto) then) =
      _$ProductItemXpDtoCopyWithImpl<$Res, ProductItemXpDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Dosage', defaultValue: '') String dosage,
      @JsonKey(name: 'HowToUse', defaultValue: '') String howToUse,
      @JsonKey(name: 'Composition', defaultValue: '') String composition,
      @JsonKey(name: 'DeliveryInstructions', defaultValue: '')
      String deliveryInstructions});
}

/// @nodoc
class _$ProductItemXpDtoCopyWithImpl<$Res, $Val extends ProductItemXpDto>
    implements $ProductItemXpDtoCopyWith<$Res> {
  _$ProductItemXpDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dosage = null,
    Object? howToUse = null,
    Object? composition = null,
    Object? deliveryInstructions = null,
  }) {
    return _then(_value.copyWith(
      dosage: null == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as String,
      howToUse: null == howToUse
          ? _value.howToUse
          : howToUse // ignore: cast_nullable_to_non_nullable
              as String,
      composition: null == composition
          ? _value.composition
          : composition // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryInstructions: null == deliveryInstructions
          ? _value.deliveryInstructions
          : deliveryInstructions // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductItemXpDtoImplCopyWith<$Res>
    implements $ProductItemXpDtoCopyWith<$Res> {
  factory _$$ProductItemXpDtoImplCopyWith(_$ProductItemXpDtoImpl value,
          $Res Function(_$ProductItemXpDtoImpl) then) =
      __$$ProductItemXpDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Dosage', defaultValue: '') String dosage,
      @JsonKey(name: 'HowToUse', defaultValue: '') String howToUse,
      @JsonKey(name: 'Composition', defaultValue: '') String composition,
      @JsonKey(name: 'DeliveryInstructions', defaultValue: '')
      String deliveryInstructions});
}

/// @nodoc
class __$$ProductItemXpDtoImplCopyWithImpl<$Res>
    extends _$ProductItemXpDtoCopyWithImpl<$Res, _$ProductItemXpDtoImpl>
    implements _$$ProductItemXpDtoImplCopyWith<$Res> {
  __$$ProductItemXpDtoImplCopyWithImpl(_$ProductItemXpDtoImpl _value,
      $Res Function(_$ProductItemXpDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dosage = null,
    Object? howToUse = null,
    Object? composition = null,
    Object? deliveryInstructions = null,
  }) {
    return _then(_$ProductItemXpDtoImpl(
      dosage: null == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as String,
      howToUse: null == howToUse
          ? _value.howToUse
          : howToUse // ignore: cast_nullable_to_non_nullable
              as String,
      composition: null == composition
          ? _value.composition
          : composition // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryInstructions: null == deliveryInstructions
          ? _value.deliveryInstructions
          : deliveryInstructions // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductItemXpDtoImpl extends _ProductItemXpDto {
  const _$ProductItemXpDtoImpl(
      {@JsonKey(name: 'Dosage', defaultValue: '') required this.dosage,
      @JsonKey(name: 'HowToUse', defaultValue: '') required this.howToUse,
      @JsonKey(name: 'Composition', defaultValue: '') required this.composition,
      @JsonKey(name: 'DeliveryInstructions', defaultValue: '')
      required this.deliveryInstructions})
      : super._();

  factory _$ProductItemXpDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductItemXpDtoImplFromJson(json);

  @override
  @JsonKey(name: 'Dosage', defaultValue: '')
  final String dosage;
  @override
  @JsonKey(name: 'HowToUse', defaultValue: '')
  final String howToUse;
  @override
  @JsonKey(name: 'Composition', defaultValue: '')
  final String composition;
  @override
  @JsonKey(name: 'DeliveryInstructions', defaultValue: '')
  final String deliveryInstructions;

  @override
  String toString() {
    return 'ProductItemXpDto(dosage: $dosage, howToUse: $howToUse, composition: $composition, deliveryInstructions: $deliveryInstructions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductItemXpDtoImpl &&
            (identical(other.dosage, dosage) || other.dosage == dosage) &&
            (identical(other.howToUse, howToUse) ||
                other.howToUse == howToUse) &&
            (identical(other.composition, composition) ||
                other.composition == composition) &&
            (identical(other.deliveryInstructions, deliveryInstructions) ||
                other.deliveryInstructions == deliveryInstructions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, dosage, howToUse, composition, deliveryInstructions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductItemXpDtoImplCopyWith<_$ProductItemXpDtoImpl> get copyWith =>
      __$$ProductItemXpDtoImplCopyWithImpl<_$ProductItemXpDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductItemXpDtoImplToJson(
      this,
    );
  }
}

abstract class _ProductItemXpDto extends ProductItemXpDto {
  const factory _ProductItemXpDto(
      {@JsonKey(name: 'Dosage', defaultValue: '') required final String dosage,
      @JsonKey(name: 'HowToUse', defaultValue: '')
      required final String howToUse,
      @JsonKey(name: 'Composition', defaultValue: '')
      required final String composition,
      @JsonKey(name: 'DeliveryInstructions', defaultValue: '')
      required final String deliveryInstructions}) = _$ProductItemXpDtoImpl;
  const _ProductItemXpDto._() : super._();

  factory _ProductItemXpDto.fromJson(Map<String, dynamic> json) =
      _$ProductItemXpDtoImpl.fromJson;

  @override
  @JsonKey(name: 'Dosage', defaultValue: '')
  String get dosage;
  @override
  @JsonKey(name: 'HowToUse', defaultValue: '')
  String get howToUse;
  @override
  @JsonKey(name: 'Composition', defaultValue: '')
  String get composition;
  @override
  @JsonKey(name: 'DeliveryInstructions', defaultValue: '')
  String get deliveryInstructions;
  @override
  @JsonKey(ignore: true)
  _$$ProductItemXpDtoImplCopyWith<_$ProductItemXpDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

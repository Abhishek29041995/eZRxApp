// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_meta_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductMetaData {
  List<ProductImages> get productImages => throw _privateConstructorUsedError;
  List<ProductItem> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductMetaDataCopyWith<ProductMetaData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductMetaDataCopyWith<$Res> {
  factory $ProductMetaDataCopyWith(
          ProductMetaData value, $Res Function(ProductMetaData) then) =
      _$ProductMetaDataCopyWithImpl<$Res, ProductMetaData>;
  @useResult
  $Res call({List<ProductImages> productImages, List<ProductItem> items});
}

/// @nodoc
class _$ProductMetaDataCopyWithImpl<$Res, $Val extends ProductMetaData>
    implements $ProductMetaDataCopyWith<$Res> {
  _$ProductMetaDataCopyWithImpl(this._value, this._then);

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
              as List<ProductImages>,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ProductItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductMetaDataImplCopyWith<$Res>
    implements $ProductMetaDataCopyWith<$Res> {
  factory _$$ProductMetaDataImplCopyWith(_$ProductMetaDataImpl value,
          $Res Function(_$ProductMetaDataImpl) then) =
      __$$ProductMetaDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProductImages> productImages, List<ProductItem> items});
}

/// @nodoc
class __$$ProductMetaDataImplCopyWithImpl<$Res>
    extends _$ProductMetaDataCopyWithImpl<$Res, _$ProductMetaDataImpl>
    implements _$$ProductMetaDataImplCopyWith<$Res> {
  __$$ProductMetaDataImplCopyWithImpl(
      _$ProductMetaDataImpl _value, $Res Function(_$ProductMetaDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productImages = null,
    Object? items = null,
  }) {
    return _then(_$ProductMetaDataImpl(
      productImages: null == productImages
          ? _value._productImages
          : productImages // ignore: cast_nullable_to_non_nullable
              as List<ProductImages>,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ProductItem>,
    ));
  }
}

/// @nodoc

class _$ProductMetaDataImpl extends _ProductMetaData {
  _$ProductMetaDataImpl(
      {required final List<ProductImages> productImages,
      required final List<ProductItem> items})
      : _productImages = productImages,
        _items = items,
        super._();

  final List<ProductImages> _productImages;
  @override
  List<ProductImages> get productImages {
    if (_productImages is EqualUnmodifiableListView) return _productImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productImages);
  }

  final List<ProductItem> _items;
  @override
  List<ProductItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ProductMetaData(productImages: $productImages, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductMetaDataImpl &&
            const DeepCollectionEquality()
                .equals(other._productImages, _productImages) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_productImages),
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductMetaDataImplCopyWith<_$ProductMetaDataImpl> get copyWith =>
      __$$ProductMetaDataImplCopyWithImpl<_$ProductMetaDataImpl>(
          this, _$identity);
}

abstract class _ProductMetaData extends ProductMetaData {
  factory _ProductMetaData(
      {required final List<ProductImages> productImages,
      required final List<ProductItem> items}) = _$ProductMetaDataImpl;
  _ProductMetaData._() : super._();

  @override
  List<ProductImages> get productImages;
  @override
  List<ProductItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$ProductMetaDataImplCopyWith<_$ProductMetaDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductItem {
  StringValue get promotionMaterial => throw _privateConstructorUsedError;
  ProductItemXp get productItemXp => throw _privateConstructorUsedError;
  MaterialNumber get materialNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductItemCopyWith<ProductItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductItemCopyWith<$Res> {
  factory $ProductItemCopyWith(
          ProductItem value, $Res Function(ProductItem) then) =
      _$ProductItemCopyWithImpl<$Res, ProductItem>;
  @useResult
  $Res call(
      {StringValue promotionMaterial,
      ProductItemXp productItemXp,
      MaterialNumber materialNumber});

  $ProductItemXpCopyWith<$Res> get productItemXp;
}

/// @nodoc
class _$ProductItemCopyWithImpl<$Res, $Val extends ProductItem>
    implements $ProductItemCopyWith<$Res> {
  _$ProductItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotionMaterial = null,
    Object? productItemXp = null,
    Object? materialNumber = null,
  }) {
    return _then(_value.copyWith(
      promotionMaterial: null == promotionMaterial
          ? _value.promotionMaterial
          : promotionMaterial // ignore: cast_nullable_to_non_nullable
              as StringValue,
      productItemXp: null == productItemXp
          ? _value.productItemXp
          : productItemXp // ignore: cast_nullable_to_non_nullable
              as ProductItemXp,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductItemXpCopyWith<$Res> get productItemXp {
    return $ProductItemXpCopyWith<$Res>(_value.productItemXp, (value) {
      return _then(_value.copyWith(productItemXp: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductItemImplCopyWith<$Res>
    implements $ProductItemCopyWith<$Res> {
  factory _$$ProductItemImplCopyWith(
          _$ProductItemImpl value, $Res Function(_$ProductItemImpl) then) =
      __$$ProductItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StringValue promotionMaterial,
      ProductItemXp productItemXp,
      MaterialNumber materialNumber});

  @override
  $ProductItemXpCopyWith<$Res> get productItemXp;
}

/// @nodoc
class __$$ProductItemImplCopyWithImpl<$Res>
    extends _$ProductItemCopyWithImpl<$Res, _$ProductItemImpl>
    implements _$$ProductItemImplCopyWith<$Res> {
  __$$ProductItemImplCopyWithImpl(
      _$ProductItemImpl _value, $Res Function(_$ProductItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotionMaterial = null,
    Object? productItemXp = null,
    Object? materialNumber = null,
  }) {
    return _then(_$ProductItemImpl(
      promotionMaterial: null == promotionMaterial
          ? _value.promotionMaterial
          : promotionMaterial // ignore: cast_nullable_to_non_nullable
              as StringValue,
      productItemXp: null == productItemXp
          ? _value.productItemXp
          : productItemXp // ignore: cast_nullable_to_non_nullable
              as ProductItemXp,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
    ));
  }
}

/// @nodoc

class _$ProductItemImpl extends _ProductItem {
  _$ProductItemImpl(
      {required this.promotionMaterial,
      required this.productItemXp,
      required this.materialNumber})
      : super._();

  @override
  final StringValue promotionMaterial;
  @override
  final ProductItemXp productItemXp;
  @override
  final MaterialNumber materialNumber;

  @override
  String toString() {
    return 'ProductItem(promotionMaterial: $promotionMaterial, productItemXp: $productItemXp, materialNumber: $materialNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductItemImpl &&
            (identical(other.promotionMaterial, promotionMaterial) ||
                other.promotionMaterial == promotionMaterial) &&
            (identical(other.productItemXp, productItemXp) ||
                other.productItemXp == productItemXp) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, promotionMaterial, productItemXp, materialNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductItemImplCopyWith<_$ProductItemImpl> get copyWith =>
      __$$ProductItemImplCopyWithImpl<_$ProductItemImpl>(this, _$identity);
}

abstract class _ProductItem extends ProductItem {
  factory _ProductItem(
      {required final StringValue promotionMaterial,
      required final ProductItemXp productItemXp,
      required final MaterialNumber materialNumber}) = _$ProductItemImpl;
  _ProductItem._() : super._();

  @override
  StringValue get promotionMaterial;
  @override
  ProductItemXp get productItemXp;
  @override
  MaterialNumber get materialNumber;
  @override
  @JsonKey(ignore: true)
  _$$ProductItemImplCopyWith<_$ProductItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductItemXp {
  StringValue get dosage => throw _privateConstructorUsedError;
  StringValue get howToUse => throw _privateConstructorUsedError;
  StringValue get composition => throw _privateConstructorUsedError;
  StringValue get deliveryInstructions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductItemXpCopyWith<ProductItemXp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductItemXpCopyWith<$Res> {
  factory $ProductItemXpCopyWith(
          ProductItemXp value, $Res Function(ProductItemXp) then) =
      _$ProductItemXpCopyWithImpl<$Res, ProductItemXp>;
  @useResult
  $Res call(
      {StringValue dosage,
      StringValue howToUse,
      StringValue composition,
      StringValue deliveryInstructions});
}

/// @nodoc
class _$ProductItemXpCopyWithImpl<$Res, $Val extends ProductItemXp>
    implements $ProductItemXpCopyWith<$Res> {
  _$ProductItemXpCopyWithImpl(this._value, this._then);

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
              as StringValue,
      howToUse: null == howToUse
          ? _value.howToUse
          : howToUse // ignore: cast_nullable_to_non_nullable
              as StringValue,
      composition: null == composition
          ? _value.composition
          : composition // ignore: cast_nullable_to_non_nullable
              as StringValue,
      deliveryInstructions: null == deliveryInstructions
          ? _value.deliveryInstructions
          : deliveryInstructions // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductItemXpImplCopyWith<$Res>
    implements $ProductItemXpCopyWith<$Res> {
  factory _$$ProductItemXpImplCopyWith(
          _$ProductItemXpImpl value, $Res Function(_$ProductItemXpImpl) then) =
      __$$ProductItemXpImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StringValue dosage,
      StringValue howToUse,
      StringValue composition,
      StringValue deliveryInstructions});
}

/// @nodoc
class __$$ProductItemXpImplCopyWithImpl<$Res>
    extends _$ProductItemXpCopyWithImpl<$Res, _$ProductItemXpImpl>
    implements _$$ProductItemXpImplCopyWith<$Res> {
  __$$ProductItemXpImplCopyWithImpl(
      _$ProductItemXpImpl _value, $Res Function(_$ProductItemXpImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dosage = null,
    Object? howToUse = null,
    Object? composition = null,
    Object? deliveryInstructions = null,
  }) {
    return _then(_$ProductItemXpImpl(
      dosage: null == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as StringValue,
      howToUse: null == howToUse
          ? _value.howToUse
          : howToUse // ignore: cast_nullable_to_non_nullable
              as StringValue,
      composition: null == composition
          ? _value.composition
          : composition // ignore: cast_nullable_to_non_nullable
              as StringValue,
      deliveryInstructions: null == deliveryInstructions
          ? _value.deliveryInstructions
          : deliveryInstructions // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ));
  }
}

/// @nodoc

class _$ProductItemXpImpl extends _ProductItemXp {
  _$ProductItemXpImpl(
      {required this.dosage,
      required this.howToUse,
      required this.composition,
      required this.deliveryInstructions})
      : super._();

  @override
  final StringValue dosage;
  @override
  final StringValue howToUse;
  @override
  final StringValue composition;
  @override
  final StringValue deliveryInstructions;

  @override
  String toString() {
    return 'ProductItemXp(dosage: $dosage, howToUse: $howToUse, composition: $composition, deliveryInstructions: $deliveryInstructions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductItemXpImpl &&
            (identical(other.dosage, dosage) || other.dosage == dosage) &&
            (identical(other.howToUse, howToUse) ||
                other.howToUse == howToUse) &&
            (identical(other.composition, composition) ||
                other.composition == composition) &&
            (identical(other.deliveryInstructions, deliveryInstructions) ||
                other.deliveryInstructions == deliveryInstructions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, dosage, howToUse, composition, deliveryInstructions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductItemXpImplCopyWith<_$ProductItemXpImpl> get copyWith =>
      __$$ProductItemXpImplCopyWithImpl<_$ProductItemXpImpl>(this, _$identity);
}

abstract class _ProductItemXp extends ProductItemXp {
  factory _ProductItemXp(
      {required final StringValue dosage,
      required final StringValue howToUse,
      required final StringValue composition,
      required final StringValue deliveryInstructions}) = _$ProductItemXpImpl;
  _ProductItemXp._() : super._();

  @override
  StringValue get dosage;
  @override
  StringValue get howToUse;
  @override
  StringValue get composition;
  @override
  StringValue get deliveryInstructions;
  @override
  @JsonKey(ignore: true)
  _$$ProductItemXpImplCopyWith<_$ProductItemXpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

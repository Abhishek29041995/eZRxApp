// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MaterialStockInfo {
  MaterialNumber get materialNumber => throw _privateConstructorUsedError;
  List<StockInfo> get stockInfos => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaterialStockInfoCopyWith<MaterialStockInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialStockInfoCopyWith<$Res> {
  factory $MaterialStockInfoCopyWith(
          MaterialStockInfo value, $Res Function(MaterialStockInfo) then) =
      _$MaterialStockInfoCopyWithImpl<$Res, MaterialStockInfo>;
  @useResult
  $Res call({MaterialNumber materialNumber, List<StockInfo> stockInfos});
}

/// @nodoc
class _$MaterialStockInfoCopyWithImpl<$Res, $Val extends MaterialStockInfo>
    implements $MaterialStockInfoCopyWith<$Res> {
  _$MaterialStockInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? stockInfos = null,
  }) {
    return _then(_value.copyWith(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      stockInfos: null == stockInfos
          ? _value.stockInfos
          : stockInfos // ignore: cast_nullable_to_non_nullable
              as List<StockInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialStockInfoImplCopyWith<$Res>
    implements $MaterialStockInfoCopyWith<$Res> {
  factory _$$MaterialStockInfoImplCopyWith(_$MaterialStockInfoImpl value,
          $Res Function(_$MaterialStockInfoImpl) then) =
      __$$MaterialStockInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MaterialNumber materialNumber, List<StockInfo> stockInfos});
}

/// @nodoc
class __$$MaterialStockInfoImplCopyWithImpl<$Res>
    extends _$MaterialStockInfoCopyWithImpl<$Res, _$MaterialStockInfoImpl>
    implements _$$MaterialStockInfoImplCopyWith<$Res> {
  __$$MaterialStockInfoImplCopyWithImpl(_$MaterialStockInfoImpl _value,
      $Res Function(_$MaterialStockInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? stockInfos = null,
  }) {
    return _then(_$MaterialStockInfoImpl(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      stockInfos: null == stockInfos
          ? _value._stockInfos
          : stockInfos // ignore: cast_nullable_to_non_nullable
              as List<StockInfo>,
    ));
  }
}

/// @nodoc

class _$MaterialStockInfoImpl extends _MaterialStockInfo {
  const _$MaterialStockInfoImpl(
      {required this.materialNumber, required final List<StockInfo> stockInfos})
      : _stockInfos = stockInfos,
        super._();

  @override
  final MaterialNumber materialNumber;
  final List<StockInfo> _stockInfos;
  @override
  List<StockInfo> get stockInfos {
    if (_stockInfos is EqualUnmodifiableListView) return _stockInfos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stockInfos);
  }

  @override
  String toString() {
    return 'MaterialStockInfo(materialNumber: $materialNumber, stockInfos: $stockInfos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialStockInfoImpl &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            const DeepCollectionEquality()
                .equals(other._stockInfos, _stockInfos));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialNumber,
      const DeepCollectionEquality().hash(_stockInfos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialStockInfoImplCopyWith<_$MaterialStockInfoImpl> get copyWith =>
      __$$MaterialStockInfoImplCopyWithImpl<_$MaterialStockInfoImpl>(
          this, _$identity);
}

abstract class _MaterialStockInfo extends MaterialStockInfo {
  const factory _MaterialStockInfo(
      {required final MaterialNumber materialNumber,
      required final List<StockInfo> stockInfos}) = _$MaterialStockInfoImpl;
  const _MaterialStockInfo._() : super._();

  @override
  MaterialNumber get materialNumber;
  @override
  List<StockInfo> get stockInfos;
  @override
  @JsonKey(ignore: true)
  _$$MaterialStockInfoImplCopyWith<_$MaterialStockInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StockInfo {
  MaterialNumber get materialNumber => throw _privateConstructorUsedError;
  DateTimeStringValue get expiryDate => throw _privateConstructorUsedError;
  StringValue get batch => throw _privateConstructorUsedError;
  MaterialInStock get inStock => throw _privateConstructorUsedError;
  String get salesDistrict => throw _privateConstructorUsedError;
  int get stockQuantity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StockInfoCopyWith<StockInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockInfoCopyWith<$Res> {
  factory $StockInfoCopyWith(StockInfo value, $Res Function(StockInfo) then) =
      _$StockInfoCopyWithImpl<$Res, StockInfo>;
  @useResult
  $Res call(
      {MaterialNumber materialNumber,
      DateTimeStringValue expiryDate,
      StringValue batch,
      MaterialInStock inStock,
      String salesDistrict,
      int stockQuantity});
}

/// @nodoc
class _$StockInfoCopyWithImpl<$Res, $Val extends StockInfo>
    implements $StockInfoCopyWith<$Res> {
  _$StockInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? expiryDate = null,
    Object? batch = null,
    Object? inStock = null,
    Object? salesDistrict = null,
    Object? stockQuantity = null,
  }) {
    return _then(_value.copyWith(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as StringValue,
      inStock: null == inStock
          ? _value.inStock
          : inStock // ignore: cast_nullable_to_non_nullable
              as MaterialInStock,
      salesDistrict: null == salesDistrict
          ? _value.salesDistrict
          : salesDistrict // ignore: cast_nullable_to_non_nullable
              as String,
      stockQuantity: null == stockQuantity
          ? _value.stockQuantity
          : stockQuantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockInfoImplCopyWith<$Res>
    implements $StockInfoCopyWith<$Res> {
  factory _$$StockInfoImplCopyWith(
          _$StockInfoImpl value, $Res Function(_$StockInfoImpl) then) =
      __$$StockInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MaterialNumber materialNumber,
      DateTimeStringValue expiryDate,
      StringValue batch,
      MaterialInStock inStock,
      String salesDistrict,
      int stockQuantity});
}

/// @nodoc
class __$$StockInfoImplCopyWithImpl<$Res>
    extends _$StockInfoCopyWithImpl<$Res, _$StockInfoImpl>
    implements _$$StockInfoImplCopyWith<$Res> {
  __$$StockInfoImplCopyWithImpl(
      _$StockInfoImpl _value, $Res Function(_$StockInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? expiryDate = null,
    Object? batch = null,
    Object? inStock = null,
    Object? salesDistrict = null,
    Object? stockQuantity = null,
  }) {
    return _then(_$StockInfoImpl(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as StringValue,
      inStock: null == inStock
          ? _value.inStock
          : inStock // ignore: cast_nullable_to_non_nullable
              as MaterialInStock,
      salesDistrict: null == salesDistrict
          ? _value.salesDistrict
          : salesDistrict // ignore: cast_nullable_to_non_nullable
              as String,
      stockQuantity: null == stockQuantity
          ? _value.stockQuantity
          : stockQuantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$StockInfoImpl extends _StockInfo {
  const _$StockInfoImpl(
      {required this.materialNumber,
      required this.expiryDate,
      required this.batch,
      required this.inStock,
      required this.salesDistrict,
      required this.stockQuantity})
      : super._();

  @override
  final MaterialNumber materialNumber;
  @override
  final DateTimeStringValue expiryDate;
  @override
  final StringValue batch;
  @override
  final MaterialInStock inStock;
  @override
  final String salesDistrict;
  @override
  final int stockQuantity;

  @override
  String toString() {
    return 'StockInfo(materialNumber: $materialNumber, expiryDate: $expiryDate, batch: $batch, inStock: $inStock, salesDistrict: $salesDistrict, stockQuantity: $stockQuantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockInfoImpl &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.inStock, inStock) || other.inStock == inStock) &&
            (identical(other.salesDistrict, salesDistrict) ||
                other.salesDistrict == salesDistrict) &&
            (identical(other.stockQuantity, stockQuantity) ||
                other.stockQuantity == stockQuantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialNumber, expiryDate,
      batch, inStock, salesDistrict, stockQuantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StockInfoImplCopyWith<_$StockInfoImpl> get copyWith =>
      __$$StockInfoImplCopyWithImpl<_$StockInfoImpl>(this, _$identity);
}

abstract class _StockInfo extends StockInfo {
  const factory _StockInfo(
      {required final MaterialNumber materialNumber,
      required final DateTimeStringValue expiryDate,
      required final StringValue batch,
      required final MaterialInStock inStock,
      required final String salesDistrict,
      required final int stockQuantity}) = _$StockInfoImpl;
  const _StockInfo._() : super._();

  @override
  MaterialNumber get materialNumber;
  @override
  DateTimeStringValue get expiryDate;
  @override
  StringValue get batch;
  @override
  MaterialInStock get inStock;
  @override
  String get salesDistrict;
  @override
  int get stockQuantity;
  @override
  @JsonKey(ignore: true)
  _$$StockInfoImplCopyWith<_$StockInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

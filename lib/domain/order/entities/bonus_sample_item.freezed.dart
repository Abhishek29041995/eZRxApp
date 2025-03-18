// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bonus_sample_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BonusSampleItem {
  MaterialQty get qty => throw _privateConstructorUsedError;
  MaterialNumber get materialNumber => throw _privateConstructorUsedError;
  StringValue get itemId => throw _privateConstructorUsedError;
  String get materialDescription => throw _privateConstructorUsedError;
  PrincipalData get principalData => throw _privateConstructorUsedError;
  MaterialInfoType get type => throw _privateConstructorUsedError;
  StockInfo get stockInfo => throw _privateConstructorUsedError;
  ItemRegistrationNumber get itemRegistrationNumber =>
      throw _privateConstructorUsedError;
  bool get bonusOverrideFlag => throw _privateConstructorUsedError;
  bool get isGimmick => throw _privateConstructorUsedError;
  bool get isPoison => throw _privateConstructorUsedError;
  bool get isSampleMaterial => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BonusSampleItemCopyWith<BonusSampleItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BonusSampleItemCopyWith<$Res> {
  factory $BonusSampleItemCopyWith(
          BonusSampleItem value, $Res Function(BonusSampleItem) then) =
      _$BonusSampleItemCopyWithImpl<$Res, BonusSampleItem>;
  @useResult
  $Res call(
      {MaterialQty qty,
      MaterialNumber materialNumber,
      StringValue itemId,
      String materialDescription,
      PrincipalData principalData,
      MaterialInfoType type,
      StockInfo stockInfo,
      ItemRegistrationNumber itemRegistrationNumber,
      bool bonusOverrideFlag,
      bool isGimmick,
      bool isPoison,
      bool isSampleMaterial});

  $PrincipalDataCopyWith<$Res> get principalData;
  $StockInfoCopyWith<$Res> get stockInfo;
}

/// @nodoc
class _$BonusSampleItemCopyWithImpl<$Res, $Val extends BonusSampleItem>
    implements $BonusSampleItemCopyWith<$Res> {
  _$BonusSampleItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qty = null,
    Object? materialNumber = null,
    Object? itemId = null,
    Object? materialDescription = null,
    Object? principalData = null,
    Object? type = null,
    Object? stockInfo = null,
    Object? itemRegistrationNumber = null,
    Object? bonusOverrideFlag = null,
    Object? isGimmick = null,
    Object? isPoison = null,
    Object? isSampleMaterial = null,
  }) {
    return _then(_value.copyWith(
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as MaterialQty,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as StringValue,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      principalData: null == principalData
          ? _value.principalData
          : principalData // ignore: cast_nullable_to_non_nullable
              as PrincipalData,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MaterialInfoType,
      stockInfo: null == stockInfo
          ? _value.stockInfo
          : stockInfo // ignore: cast_nullable_to_non_nullable
              as StockInfo,
      itemRegistrationNumber: null == itemRegistrationNumber
          ? _value.itemRegistrationNumber
          : itemRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as ItemRegistrationNumber,
      bonusOverrideFlag: null == bonusOverrideFlag
          ? _value.bonusOverrideFlag
          : bonusOverrideFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      isGimmick: null == isGimmick
          ? _value.isGimmick
          : isGimmick // ignore: cast_nullable_to_non_nullable
              as bool,
      isPoison: null == isPoison
          ? _value.isPoison
          : isPoison // ignore: cast_nullable_to_non_nullable
              as bool,
      isSampleMaterial: null == isSampleMaterial
          ? _value.isSampleMaterial
          : isSampleMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PrincipalDataCopyWith<$Res> get principalData {
    return $PrincipalDataCopyWith<$Res>(_value.principalData, (value) {
      return _then(_value.copyWith(principalData: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StockInfoCopyWith<$Res> get stockInfo {
    return $StockInfoCopyWith<$Res>(_value.stockInfo, (value) {
      return _then(_value.copyWith(stockInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BonusSampleItemImplCopyWith<$Res>
    implements $BonusSampleItemCopyWith<$Res> {
  factory _$$BonusSampleItemImplCopyWith(_$BonusSampleItemImpl value,
          $Res Function(_$BonusSampleItemImpl) then) =
      __$$BonusSampleItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MaterialQty qty,
      MaterialNumber materialNumber,
      StringValue itemId,
      String materialDescription,
      PrincipalData principalData,
      MaterialInfoType type,
      StockInfo stockInfo,
      ItemRegistrationNumber itemRegistrationNumber,
      bool bonusOverrideFlag,
      bool isGimmick,
      bool isPoison,
      bool isSampleMaterial});

  @override
  $PrincipalDataCopyWith<$Res> get principalData;
  @override
  $StockInfoCopyWith<$Res> get stockInfo;
}

/// @nodoc
class __$$BonusSampleItemImplCopyWithImpl<$Res>
    extends _$BonusSampleItemCopyWithImpl<$Res, _$BonusSampleItemImpl>
    implements _$$BonusSampleItemImplCopyWith<$Res> {
  __$$BonusSampleItemImplCopyWithImpl(
      _$BonusSampleItemImpl _value, $Res Function(_$BonusSampleItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qty = null,
    Object? materialNumber = null,
    Object? itemId = null,
    Object? materialDescription = null,
    Object? principalData = null,
    Object? type = null,
    Object? stockInfo = null,
    Object? itemRegistrationNumber = null,
    Object? bonusOverrideFlag = null,
    Object? isGimmick = null,
    Object? isPoison = null,
    Object? isSampleMaterial = null,
  }) {
    return _then(_$BonusSampleItemImpl(
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as MaterialQty,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as StringValue,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      principalData: null == principalData
          ? _value.principalData
          : principalData // ignore: cast_nullable_to_non_nullable
              as PrincipalData,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MaterialInfoType,
      stockInfo: null == stockInfo
          ? _value.stockInfo
          : stockInfo // ignore: cast_nullable_to_non_nullable
              as StockInfo,
      itemRegistrationNumber: null == itemRegistrationNumber
          ? _value.itemRegistrationNumber
          : itemRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as ItemRegistrationNumber,
      bonusOverrideFlag: null == bonusOverrideFlag
          ? _value.bonusOverrideFlag
          : bonusOverrideFlag // ignore: cast_nullable_to_non_nullable
              as bool,
      isGimmick: null == isGimmick
          ? _value.isGimmick
          : isGimmick // ignore: cast_nullable_to_non_nullable
              as bool,
      isPoison: null == isPoison
          ? _value.isPoison
          : isPoison // ignore: cast_nullable_to_non_nullable
              as bool,
      isSampleMaterial: null == isSampleMaterial
          ? _value.isSampleMaterial
          : isSampleMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BonusSampleItemImpl extends _BonusSampleItem {
  const _$BonusSampleItemImpl(
      {required this.qty,
      required this.materialNumber,
      required this.itemId,
      required this.materialDescription,
      required this.principalData,
      required this.type,
      required this.stockInfo,
      required this.itemRegistrationNumber,
      required this.bonusOverrideFlag,
      required this.isGimmick,
      required this.isPoison,
      required this.isSampleMaterial})
      : super._();

  @override
  final MaterialQty qty;
  @override
  final MaterialNumber materialNumber;
  @override
  final StringValue itemId;
  @override
  final String materialDescription;
  @override
  final PrincipalData principalData;
  @override
  final MaterialInfoType type;
  @override
  final StockInfo stockInfo;
  @override
  final ItemRegistrationNumber itemRegistrationNumber;
  @override
  final bool bonusOverrideFlag;
  @override
  final bool isGimmick;
  @override
  final bool isPoison;
  @override
  final bool isSampleMaterial;

  @override
  String toString() {
    return 'BonusSampleItem(qty: $qty, materialNumber: $materialNumber, itemId: $itemId, materialDescription: $materialDescription, principalData: $principalData, type: $type, stockInfo: $stockInfo, itemRegistrationNumber: $itemRegistrationNumber, bonusOverrideFlag: $bonusOverrideFlag, isGimmick: $isGimmick, isPoison: $isPoison, isSampleMaterial: $isSampleMaterial)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BonusSampleItemImpl &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.materialDescription, materialDescription) ||
                other.materialDescription == materialDescription) &&
            (identical(other.principalData, principalData) ||
                other.principalData == principalData) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.stockInfo, stockInfo) ||
                other.stockInfo == stockInfo) &&
            (identical(other.itemRegistrationNumber, itemRegistrationNumber) ||
                other.itemRegistrationNumber == itemRegistrationNumber) &&
            (identical(other.bonusOverrideFlag, bonusOverrideFlag) ||
                other.bonusOverrideFlag == bonusOverrideFlag) &&
            (identical(other.isGimmick, isGimmick) ||
                other.isGimmick == isGimmick) &&
            (identical(other.isPoison, isPoison) ||
                other.isPoison == isPoison) &&
            (identical(other.isSampleMaterial, isSampleMaterial) ||
                other.isSampleMaterial == isSampleMaterial));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      qty,
      materialNumber,
      itemId,
      materialDescription,
      principalData,
      type,
      stockInfo,
      itemRegistrationNumber,
      bonusOverrideFlag,
      isGimmick,
      isPoison,
      isSampleMaterial);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BonusSampleItemImplCopyWith<_$BonusSampleItemImpl> get copyWith =>
      __$$BonusSampleItemImplCopyWithImpl<_$BonusSampleItemImpl>(
          this, _$identity);
}

abstract class _BonusSampleItem extends BonusSampleItem {
  const factory _BonusSampleItem(
      {required final MaterialQty qty,
      required final MaterialNumber materialNumber,
      required final StringValue itemId,
      required final String materialDescription,
      required final PrincipalData principalData,
      required final MaterialInfoType type,
      required final StockInfo stockInfo,
      required final ItemRegistrationNumber itemRegistrationNumber,
      required final bool bonusOverrideFlag,
      required final bool isGimmick,
      required final bool isPoison,
      required final bool isSampleMaterial}) = _$BonusSampleItemImpl;
  const _BonusSampleItem._() : super._();

  @override
  MaterialQty get qty;
  @override
  MaterialNumber get materialNumber;
  @override
  StringValue get itemId;
  @override
  String get materialDescription;
  @override
  PrincipalData get principalData;
  @override
  MaterialInfoType get type;
  @override
  StockInfo get stockInfo;
  @override
  ItemRegistrationNumber get itemRegistrationNumber;
  @override
  bool get bonusOverrideFlag;
  @override
  bool get isGimmick;
  @override
  bool get isPoison;
  @override
  bool get isSampleMaterial;
  @override
  @JsonKey(ignore: true)
  _$$BonusSampleItemImplCopyWith<_$BonusSampleItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

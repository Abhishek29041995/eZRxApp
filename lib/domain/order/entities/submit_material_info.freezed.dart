// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_material_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubmitMaterialInfo {
  MaterialNumber get materialNumber => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  List<SubmitMaterialItemBonus> get bonuses =>
      throw _privateConstructorUsedError;
  String get productType => throw _privateConstructorUsedError;
  String get parentID => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  MaterialItemOverride get materialItemOverride =>
      throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get tax => throw _privateConstructorUsedError;
  double get mrp => throw _privateConstructorUsedError;
  String get promoType => throw _privateConstructorUsedError;
  bool get promoStatus => throw _privateConstructorUsedError;
  PrincipalData get principalData => throw _privateConstructorUsedError;
  bool get isCounterOffer => throw _privateConstructorUsedError;
  SubmitTenderContract get contract => throw _privateConstructorUsedError;
  String get salesDistrict => throw _privateConstructorUsedError;

  ///Todo: consider to delete it
  StringValue get batch => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubmitMaterialInfoCopyWith<SubmitMaterialInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitMaterialInfoCopyWith<$Res> {
  factory $SubmitMaterialInfoCopyWith(
          SubmitMaterialInfo value, $Res Function(SubmitMaterialInfo) then) =
      _$SubmitMaterialInfoCopyWithImpl<$Res, SubmitMaterialInfo>;
  @useResult
  $Res call(
      {MaterialNumber materialNumber,
      int quantity,
      List<SubmitMaterialItemBonus> bonuses,
      String productType,
      String parentID,
      String comment,
      MaterialItemOverride materialItemOverride,
      double price,
      double tax,
      double mrp,
      String promoType,
      bool promoStatus,
      PrincipalData principalData,
      bool isCounterOffer,
      SubmitTenderContract contract,
      String salesDistrict,
      StringValue batch});

  $MaterialItemOverrideCopyWith<$Res> get materialItemOverride;
  $PrincipalDataCopyWith<$Res> get principalData;
  $SubmitTenderContractCopyWith<$Res> get contract;
}

/// @nodoc
class _$SubmitMaterialInfoCopyWithImpl<$Res, $Val extends SubmitMaterialInfo>
    implements $SubmitMaterialInfoCopyWith<$Res> {
  _$SubmitMaterialInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? quantity = null,
    Object? bonuses = null,
    Object? productType = null,
    Object? parentID = null,
    Object? comment = null,
    Object? materialItemOverride = null,
    Object? price = null,
    Object? tax = null,
    Object? mrp = null,
    Object? promoType = null,
    Object? promoStatus = null,
    Object? principalData = null,
    Object? isCounterOffer = null,
    Object? contract = null,
    Object? salesDistrict = null,
    Object? batch = null,
  }) {
    return _then(_value.copyWith(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      bonuses: null == bonuses
          ? _value.bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<SubmitMaterialItemBonus>,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      parentID: null == parentID
          ? _value.parentID
          : parentID // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      materialItemOverride: null == materialItemOverride
          ? _value.materialItemOverride
          : materialItemOverride // ignore: cast_nullable_to_non_nullable
              as MaterialItemOverride,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      mrp: null == mrp
          ? _value.mrp
          : mrp // ignore: cast_nullable_to_non_nullable
              as double,
      promoType: null == promoType
          ? _value.promoType
          : promoType // ignore: cast_nullable_to_non_nullable
              as String,
      promoStatus: null == promoStatus
          ? _value.promoStatus
          : promoStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      principalData: null == principalData
          ? _value.principalData
          : principalData // ignore: cast_nullable_to_non_nullable
              as PrincipalData,
      isCounterOffer: null == isCounterOffer
          ? _value.isCounterOffer
          : isCounterOffer // ignore: cast_nullable_to_non_nullable
              as bool,
      contract: null == contract
          ? _value.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as SubmitTenderContract,
      salesDistrict: null == salesDistrict
          ? _value.salesDistrict
          : salesDistrict // ignore: cast_nullable_to_non_nullable
              as String,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialItemOverrideCopyWith<$Res> get materialItemOverride {
    return $MaterialItemOverrideCopyWith<$Res>(_value.materialItemOverride,
        (value) {
      return _then(_value.copyWith(materialItemOverride: value) as $Val);
    });
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
  $SubmitTenderContractCopyWith<$Res> get contract {
    return $SubmitTenderContractCopyWith<$Res>(_value.contract, (value) {
      return _then(_value.copyWith(contract: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SubmitMaterialInfoImplCopyWith<$Res>
    implements $SubmitMaterialInfoCopyWith<$Res> {
  factory _$$SubmitMaterialInfoImplCopyWith(_$SubmitMaterialInfoImpl value,
          $Res Function(_$SubmitMaterialInfoImpl) then) =
      __$$SubmitMaterialInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MaterialNumber materialNumber,
      int quantity,
      List<SubmitMaterialItemBonus> bonuses,
      String productType,
      String parentID,
      String comment,
      MaterialItemOverride materialItemOverride,
      double price,
      double tax,
      double mrp,
      String promoType,
      bool promoStatus,
      PrincipalData principalData,
      bool isCounterOffer,
      SubmitTenderContract contract,
      String salesDistrict,
      StringValue batch});

  @override
  $MaterialItemOverrideCopyWith<$Res> get materialItemOverride;
  @override
  $PrincipalDataCopyWith<$Res> get principalData;
  @override
  $SubmitTenderContractCopyWith<$Res> get contract;
}

/// @nodoc
class __$$SubmitMaterialInfoImplCopyWithImpl<$Res>
    extends _$SubmitMaterialInfoCopyWithImpl<$Res, _$SubmitMaterialInfoImpl>
    implements _$$SubmitMaterialInfoImplCopyWith<$Res> {
  __$$SubmitMaterialInfoImplCopyWithImpl(_$SubmitMaterialInfoImpl _value,
      $Res Function(_$SubmitMaterialInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? quantity = null,
    Object? bonuses = null,
    Object? productType = null,
    Object? parentID = null,
    Object? comment = null,
    Object? materialItemOverride = null,
    Object? price = null,
    Object? tax = null,
    Object? mrp = null,
    Object? promoType = null,
    Object? promoStatus = null,
    Object? principalData = null,
    Object? isCounterOffer = null,
    Object? contract = null,
    Object? salesDistrict = null,
    Object? batch = null,
  }) {
    return _then(_$SubmitMaterialInfoImpl(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      bonuses: null == bonuses
          ? _value._bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<SubmitMaterialItemBonus>,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      parentID: null == parentID
          ? _value.parentID
          : parentID // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      materialItemOverride: null == materialItemOverride
          ? _value.materialItemOverride
          : materialItemOverride // ignore: cast_nullable_to_non_nullable
              as MaterialItemOverride,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      mrp: null == mrp
          ? _value.mrp
          : mrp // ignore: cast_nullable_to_non_nullable
              as double,
      promoType: null == promoType
          ? _value.promoType
          : promoType // ignore: cast_nullable_to_non_nullable
              as String,
      promoStatus: null == promoStatus
          ? _value.promoStatus
          : promoStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      principalData: null == principalData
          ? _value.principalData
          : principalData // ignore: cast_nullable_to_non_nullable
              as PrincipalData,
      isCounterOffer: null == isCounterOffer
          ? _value.isCounterOffer
          : isCounterOffer // ignore: cast_nullable_to_non_nullable
              as bool,
      contract: null == contract
          ? _value.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as SubmitTenderContract,
      salesDistrict: null == salesDistrict
          ? _value.salesDistrict
          : salesDistrict // ignore: cast_nullable_to_non_nullable
              as String,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ));
  }
}

/// @nodoc

class _$SubmitMaterialInfoImpl extends _SubmitMaterialInfo {
  const _$SubmitMaterialInfoImpl(
      {required this.materialNumber,
      required this.quantity,
      required final List<SubmitMaterialItemBonus> bonuses,
      required this.productType,
      required this.parentID,
      required this.comment,
      required this.materialItemOverride,
      required this.price,
      required this.tax,
      required this.mrp,
      required this.promoType,
      required this.promoStatus,
      required this.principalData,
      required this.isCounterOffer,
      required this.contract,
      required this.salesDistrict,
      required this.batch})
      : _bonuses = bonuses,
        super._();

  @override
  final MaterialNumber materialNumber;
  @override
  final int quantity;
  final List<SubmitMaterialItemBonus> _bonuses;
  @override
  List<SubmitMaterialItemBonus> get bonuses {
    if (_bonuses is EqualUnmodifiableListView) return _bonuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonuses);
  }

  @override
  final String productType;
  @override
  final String parentID;
  @override
  final String comment;
  @override
  final MaterialItemOverride materialItemOverride;
  @override
  final double price;
  @override
  final double tax;
  @override
  final double mrp;
  @override
  final String promoType;
  @override
  final bool promoStatus;
  @override
  final PrincipalData principalData;
  @override
  final bool isCounterOffer;
  @override
  final SubmitTenderContract contract;
  @override
  final String salesDistrict;

  ///Todo: consider to delete it
  @override
  final StringValue batch;

  @override
  String toString() {
    return 'SubmitMaterialInfo(materialNumber: $materialNumber, quantity: $quantity, bonuses: $bonuses, productType: $productType, parentID: $parentID, comment: $comment, materialItemOverride: $materialItemOverride, price: $price, tax: $tax, mrp: $mrp, promoType: $promoType, promoStatus: $promoStatus, principalData: $principalData, isCounterOffer: $isCounterOffer, contract: $contract, salesDistrict: $salesDistrict, batch: $batch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitMaterialInfoImpl &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            const DeepCollectionEquality().equals(other._bonuses, _bonuses) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(other.parentID, parentID) ||
                other.parentID == parentID) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.materialItemOverride, materialItemOverride) ||
                other.materialItemOverride == materialItemOverride) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.mrp, mrp) || other.mrp == mrp) &&
            (identical(other.promoType, promoType) ||
                other.promoType == promoType) &&
            (identical(other.promoStatus, promoStatus) ||
                other.promoStatus == promoStatus) &&
            (identical(other.principalData, principalData) ||
                other.principalData == principalData) &&
            (identical(other.isCounterOffer, isCounterOffer) ||
                other.isCounterOffer == isCounterOffer) &&
            (identical(other.contract, contract) ||
                other.contract == contract) &&
            (identical(other.salesDistrict, salesDistrict) ||
                other.salesDistrict == salesDistrict) &&
            (identical(other.batch, batch) || other.batch == batch));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      materialNumber,
      quantity,
      const DeepCollectionEquality().hash(_bonuses),
      productType,
      parentID,
      comment,
      materialItemOverride,
      price,
      tax,
      mrp,
      promoType,
      promoStatus,
      principalData,
      isCounterOffer,
      contract,
      salesDistrict,
      batch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitMaterialInfoImplCopyWith<_$SubmitMaterialInfoImpl> get copyWith =>
      __$$SubmitMaterialInfoImplCopyWithImpl<_$SubmitMaterialInfoImpl>(
          this, _$identity);
}

abstract class _SubmitMaterialInfo extends SubmitMaterialInfo {
  const factory _SubmitMaterialInfo(
      {required final MaterialNumber materialNumber,
      required final int quantity,
      required final List<SubmitMaterialItemBonus> bonuses,
      required final String productType,
      required final String parentID,
      required final String comment,
      required final MaterialItemOverride materialItemOverride,
      required final double price,
      required final double tax,
      required final double mrp,
      required final String promoType,
      required final bool promoStatus,
      required final PrincipalData principalData,
      required final bool isCounterOffer,
      required final SubmitTenderContract contract,
      required final String salesDistrict,
      required final StringValue batch}) = _$SubmitMaterialInfoImpl;
  const _SubmitMaterialInfo._() : super._();

  @override
  MaterialNumber get materialNumber;
  @override
  int get quantity;
  @override
  List<SubmitMaterialItemBonus> get bonuses;
  @override
  String get productType;
  @override
  String get parentID;
  @override
  String get comment;
  @override
  MaterialItemOverride get materialItemOverride;
  @override
  double get price;
  @override
  double get tax;
  @override
  double get mrp;
  @override
  String get promoType;
  @override
  bool get promoStatus;
  @override
  PrincipalData get principalData;
  @override
  bool get isCounterOffer;
  @override
  SubmitTenderContract get contract;
  @override
  String get salesDistrict;
  @override

  ///Todo: consider to delete it
  StringValue get batch;
  @override
  @JsonKey(ignore: true)
  _$$SubmitMaterialInfoImplCopyWith<_$SubmitMaterialInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_details_order_items_tender_contract_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderHistoryDetailsTenderContractDto
    _$OrderHistoryDetailsTenderContractDtoFromJson(Map<String, dynamic> json) {
  return _OrderHistoryDetailsTenderContractDto.fromJson(json);
}

/// @nodoc
mixin _$OrderHistoryDetailsTenderContractDto {
  @JsonKey(name: 'contractNumber', defaultValue: '')
  String get contractNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'contractReference', defaultValue: '')
  String get contractReference => throw _privateConstructorUsedError;
  @StringToDoubleConverter()
  @JsonKey(name: 'price', defaultValue: 0.0)
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'priceUnit', defaultValue: 0)
  int get priceUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'contractQuantity', defaultValue: 0)
  int get contractQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'remainingQuantity', defaultValue: 0)
  int get remainingQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'isTenderExpire', defaultValue: false)
  bool get isTenderExpired => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiryDate', defaultValue: '')
  String get expiryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderReason', defaultValue: '')
  String get orderReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'visaNumber', defaultValue: '')
  String get visaNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'announcementLetterNumber', defaultValue: '')
  String get announcementLetterNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderHistoryDetailsTenderContractDtoCopyWith<
          OrderHistoryDetailsTenderContractDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDetailsTenderContractDtoCopyWith<$Res> {
  factory $OrderHistoryDetailsTenderContractDtoCopyWith(
          OrderHistoryDetailsTenderContractDto value,
          $Res Function(OrderHistoryDetailsTenderContractDto) then) =
      _$OrderHistoryDetailsTenderContractDtoCopyWithImpl<$Res,
          OrderHistoryDetailsTenderContractDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'contractNumber', defaultValue: '') String contractNumber,
      @JsonKey(name: 'contractReference', defaultValue: '')
      String contractReference,
      @StringToDoubleConverter()
      @JsonKey(name: 'price', defaultValue: 0.0)
      double price,
      @JsonKey(name: 'priceUnit', defaultValue: 0) int priceUnit,
      @JsonKey(name: 'contractQuantity', defaultValue: 0) int contractQuantity,
      @JsonKey(name: 'remainingQuantity', defaultValue: 0)
      int remainingQuantity,
      @JsonKey(name: 'isTenderExpire', defaultValue: false)
      bool isTenderExpired,
      @JsonKey(name: 'expiryDate', defaultValue: '') String expiryDate,
      @JsonKey(name: 'orderReason', defaultValue: '') String orderReason,
      @JsonKey(name: 'visaNumber', defaultValue: '') String visaNumber,
      @JsonKey(name: 'announcementLetterNumber', defaultValue: '')
      String announcementLetterNumber});
}

/// @nodoc
class _$OrderHistoryDetailsTenderContractDtoCopyWithImpl<$Res,
        $Val extends OrderHistoryDetailsTenderContractDto>
    implements $OrderHistoryDetailsTenderContractDtoCopyWith<$Res> {
  _$OrderHistoryDetailsTenderContractDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contractNumber = null,
    Object? contractReference = null,
    Object? price = null,
    Object? priceUnit = null,
    Object? contractQuantity = null,
    Object? remainingQuantity = null,
    Object? isTenderExpired = null,
    Object? expiryDate = null,
    Object? orderReason = null,
    Object? visaNumber = null,
    Object? announcementLetterNumber = null,
  }) {
    return _then(_value.copyWith(
      contractNumber: null == contractNumber
          ? _value.contractNumber
          : contractNumber // ignore: cast_nullable_to_non_nullable
              as String,
      contractReference: null == contractReference
          ? _value.contractReference
          : contractReference // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      priceUnit: null == priceUnit
          ? _value.priceUnit
          : priceUnit // ignore: cast_nullable_to_non_nullable
              as int,
      contractQuantity: null == contractQuantity
          ? _value.contractQuantity
          : contractQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      remainingQuantity: null == remainingQuantity
          ? _value.remainingQuantity
          : remainingQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      isTenderExpired: null == isTenderExpired
          ? _value.isTenderExpired
          : isTenderExpired // ignore: cast_nullable_to_non_nullable
              as bool,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      orderReason: null == orderReason
          ? _value.orderReason
          : orderReason // ignore: cast_nullable_to_non_nullable
              as String,
      visaNumber: null == visaNumber
          ? _value.visaNumber
          : visaNumber // ignore: cast_nullable_to_non_nullable
              as String,
      announcementLetterNumber: null == announcementLetterNumber
          ? _value.announcementLetterNumber
          : announcementLetterNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderHistoryDetailsTenderContractDtoImplCopyWith<$Res>
    implements $OrderHistoryDetailsTenderContractDtoCopyWith<$Res> {
  factory _$$OrderHistoryDetailsTenderContractDtoImplCopyWith(
          _$OrderHistoryDetailsTenderContractDtoImpl value,
          $Res Function(_$OrderHistoryDetailsTenderContractDtoImpl) then) =
      __$$OrderHistoryDetailsTenderContractDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'contractNumber', defaultValue: '') String contractNumber,
      @JsonKey(name: 'contractReference', defaultValue: '')
      String contractReference,
      @StringToDoubleConverter()
      @JsonKey(name: 'price', defaultValue: 0.0)
      double price,
      @JsonKey(name: 'priceUnit', defaultValue: 0) int priceUnit,
      @JsonKey(name: 'contractQuantity', defaultValue: 0) int contractQuantity,
      @JsonKey(name: 'remainingQuantity', defaultValue: 0)
      int remainingQuantity,
      @JsonKey(name: 'isTenderExpire', defaultValue: false)
      bool isTenderExpired,
      @JsonKey(name: 'expiryDate', defaultValue: '') String expiryDate,
      @JsonKey(name: 'orderReason', defaultValue: '') String orderReason,
      @JsonKey(name: 'visaNumber', defaultValue: '') String visaNumber,
      @JsonKey(name: 'announcementLetterNumber', defaultValue: '')
      String announcementLetterNumber});
}

/// @nodoc
class __$$OrderHistoryDetailsTenderContractDtoImplCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsTenderContractDtoCopyWithImpl<$Res,
        _$OrderHistoryDetailsTenderContractDtoImpl>
    implements _$$OrderHistoryDetailsTenderContractDtoImplCopyWith<$Res> {
  __$$OrderHistoryDetailsTenderContractDtoImplCopyWithImpl(
      _$OrderHistoryDetailsTenderContractDtoImpl _value,
      $Res Function(_$OrderHistoryDetailsTenderContractDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contractNumber = null,
    Object? contractReference = null,
    Object? price = null,
    Object? priceUnit = null,
    Object? contractQuantity = null,
    Object? remainingQuantity = null,
    Object? isTenderExpired = null,
    Object? expiryDate = null,
    Object? orderReason = null,
    Object? visaNumber = null,
    Object? announcementLetterNumber = null,
  }) {
    return _then(_$OrderHistoryDetailsTenderContractDtoImpl(
      contractNumber: null == contractNumber
          ? _value.contractNumber
          : contractNumber // ignore: cast_nullable_to_non_nullable
              as String,
      contractReference: null == contractReference
          ? _value.contractReference
          : contractReference // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      priceUnit: null == priceUnit
          ? _value.priceUnit
          : priceUnit // ignore: cast_nullable_to_non_nullable
              as int,
      contractQuantity: null == contractQuantity
          ? _value.contractQuantity
          : contractQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      remainingQuantity: null == remainingQuantity
          ? _value.remainingQuantity
          : remainingQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      isTenderExpired: null == isTenderExpired
          ? _value.isTenderExpired
          : isTenderExpired // ignore: cast_nullable_to_non_nullable
              as bool,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      orderReason: null == orderReason
          ? _value.orderReason
          : orderReason // ignore: cast_nullable_to_non_nullable
              as String,
      visaNumber: null == visaNumber
          ? _value.visaNumber
          : visaNumber // ignore: cast_nullable_to_non_nullable
              as String,
      announcementLetterNumber: null == announcementLetterNumber
          ? _value.announcementLetterNumber
          : announcementLetterNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderHistoryDetailsTenderContractDtoImpl
    extends _OrderHistoryDetailsTenderContractDto {
  const _$OrderHistoryDetailsTenderContractDtoImpl(
      {@JsonKey(name: 'contractNumber', defaultValue: '')
      required this.contractNumber,
      @JsonKey(name: 'contractReference', defaultValue: '')
      required this.contractReference,
      @StringToDoubleConverter()
      @JsonKey(name: 'price', defaultValue: 0.0)
      required this.price,
      @JsonKey(name: 'priceUnit', defaultValue: 0) required this.priceUnit,
      @JsonKey(name: 'contractQuantity', defaultValue: 0)
      required this.contractQuantity,
      @JsonKey(name: 'remainingQuantity', defaultValue: 0)
      required this.remainingQuantity,
      @JsonKey(name: 'isTenderExpire', defaultValue: false)
      required this.isTenderExpired,
      @JsonKey(name: 'expiryDate', defaultValue: '') required this.expiryDate,
      @JsonKey(name: 'orderReason', defaultValue: '') required this.orderReason,
      @JsonKey(name: 'visaNumber', defaultValue: '') required this.visaNumber,
      @JsonKey(name: 'announcementLetterNumber', defaultValue: '')
      required this.announcementLetterNumber})
      : super._();

  factory _$OrderHistoryDetailsTenderContractDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$OrderHistoryDetailsTenderContractDtoImplFromJson(json);

  @override
  @JsonKey(name: 'contractNumber', defaultValue: '')
  final String contractNumber;
  @override
  @JsonKey(name: 'contractReference', defaultValue: '')
  final String contractReference;
  @override
  @StringToDoubleConverter()
  @JsonKey(name: 'price', defaultValue: 0.0)
  final double price;
  @override
  @JsonKey(name: 'priceUnit', defaultValue: 0)
  final int priceUnit;
  @override
  @JsonKey(name: 'contractQuantity', defaultValue: 0)
  final int contractQuantity;
  @override
  @JsonKey(name: 'remainingQuantity', defaultValue: 0)
  final int remainingQuantity;
  @override
  @JsonKey(name: 'isTenderExpire', defaultValue: false)
  final bool isTenderExpired;
  @override
  @JsonKey(name: 'expiryDate', defaultValue: '')
  final String expiryDate;
  @override
  @JsonKey(name: 'orderReason', defaultValue: '')
  final String orderReason;
  @override
  @JsonKey(name: 'visaNumber', defaultValue: '')
  final String visaNumber;
  @override
  @JsonKey(name: 'announcementLetterNumber', defaultValue: '')
  final String announcementLetterNumber;

  @override
  String toString() {
    return 'OrderHistoryDetailsTenderContractDto(contractNumber: $contractNumber, contractReference: $contractReference, price: $price, priceUnit: $priceUnit, contractQuantity: $contractQuantity, remainingQuantity: $remainingQuantity, isTenderExpired: $isTenderExpired, expiryDate: $expiryDate, orderReason: $orderReason, visaNumber: $visaNumber, announcementLetterNumber: $announcementLetterNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderHistoryDetailsTenderContractDtoImpl &&
            (identical(other.contractNumber, contractNumber) ||
                other.contractNumber == contractNumber) &&
            (identical(other.contractReference, contractReference) ||
                other.contractReference == contractReference) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.priceUnit, priceUnit) ||
                other.priceUnit == priceUnit) &&
            (identical(other.contractQuantity, contractQuantity) ||
                other.contractQuantity == contractQuantity) &&
            (identical(other.remainingQuantity, remainingQuantity) ||
                other.remainingQuantity == remainingQuantity) &&
            (identical(other.isTenderExpired, isTenderExpired) ||
                other.isTenderExpired == isTenderExpired) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.orderReason, orderReason) ||
                other.orderReason == orderReason) &&
            (identical(other.visaNumber, visaNumber) ||
                other.visaNumber == visaNumber) &&
            (identical(
                    other.announcementLetterNumber, announcementLetterNumber) ||
                other.announcementLetterNumber == announcementLetterNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      contractNumber,
      contractReference,
      price,
      priceUnit,
      contractQuantity,
      remainingQuantity,
      isTenderExpired,
      expiryDate,
      orderReason,
      visaNumber,
      announcementLetterNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderHistoryDetailsTenderContractDtoImplCopyWith<
          _$OrderHistoryDetailsTenderContractDtoImpl>
      get copyWith => __$$OrderHistoryDetailsTenderContractDtoImplCopyWithImpl<
          _$OrderHistoryDetailsTenderContractDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderHistoryDetailsTenderContractDtoImplToJson(
      this,
    );
  }
}

abstract class _OrderHistoryDetailsTenderContractDto
    extends OrderHistoryDetailsTenderContractDto {
  const factory _OrderHistoryDetailsTenderContractDto(
      {@JsonKey(name: 'contractNumber', defaultValue: '')
      required final String contractNumber,
      @JsonKey(name: 'contractReference', defaultValue: '')
      required final String contractReference,
      @StringToDoubleConverter()
      @JsonKey(name: 'price', defaultValue: 0.0)
      required final double price,
      @JsonKey(name: 'priceUnit', defaultValue: 0) required final int priceUnit,
      @JsonKey(name: 'contractQuantity', defaultValue: 0)
      required final int contractQuantity,
      @JsonKey(name: 'remainingQuantity', defaultValue: 0)
      required final int remainingQuantity,
      @JsonKey(name: 'isTenderExpire', defaultValue: false)
      required final bool isTenderExpired,
      @JsonKey(name: 'expiryDate', defaultValue: '')
      required final String expiryDate,
      @JsonKey(name: 'orderReason', defaultValue: '')
      required final String orderReason,
      @JsonKey(name: 'visaNumber', defaultValue: '')
      required final String visaNumber,
      @JsonKey(name: 'announcementLetterNumber', defaultValue: '')
      required final String
          announcementLetterNumber}) = _$OrderHistoryDetailsTenderContractDtoImpl;
  const _OrderHistoryDetailsTenderContractDto._() : super._();

  factory _OrderHistoryDetailsTenderContractDto.fromJson(
          Map<String, dynamic> json) =
      _$OrderHistoryDetailsTenderContractDtoImpl.fromJson;

  @override
  @JsonKey(name: 'contractNumber', defaultValue: '')
  String get contractNumber;
  @override
  @JsonKey(name: 'contractReference', defaultValue: '')
  String get contractReference;
  @override
  @StringToDoubleConverter()
  @JsonKey(name: 'price', defaultValue: 0.0)
  double get price;
  @override
  @JsonKey(name: 'priceUnit', defaultValue: 0)
  int get priceUnit;
  @override
  @JsonKey(name: 'contractQuantity', defaultValue: 0)
  int get contractQuantity;
  @override
  @JsonKey(name: 'remainingQuantity', defaultValue: 0)
  int get remainingQuantity;
  @override
  @JsonKey(name: 'isTenderExpire', defaultValue: false)
  bool get isTenderExpired;
  @override
  @JsonKey(name: 'expiryDate', defaultValue: '')
  String get expiryDate;
  @override
  @JsonKey(name: 'orderReason', defaultValue: '')
  String get orderReason;
  @override
  @JsonKey(name: 'visaNumber', defaultValue: '')
  String get visaNumber;
  @override
  @JsonKey(name: 'announcementLetterNumber', defaultValue: '')
  String get announcementLetterNumber;
  @override
  @JsonKey(ignore: true)
  _$$OrderHistoryDetailsTenderContractDtoImplCopyWith<
          _$OrderHistoryDetailsTenderContractDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tender_contract_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TenderContractDto _$TenderContractDtoFromJson(Map<String, dynamic> json) {
  return _TenderContractDto.fromJson(json);
}

/// @nodoc
mixin _$TenderContractDto {
  @JsonKey(name: 'contractNumber')
  String get contractNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'contractItemNumber')
  String get contractItemNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'contractReference')
  String get contractReference => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenderOrderReason')
  String get tenderOrderReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenderVisaNumber')
  String get tenderVisaNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'salesDistrict')
  String get salesDistrict => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenderPackageDescription')
  String get tenderPackageDescription => throw _privateConstructorUsedError;
  @StringToDoubleConverter()
  @JsonKey(name: 'tenderPrice', defaultValue: 0.0)
  double get tenderPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'pricingUnit')
  int get pricingUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'remainingTenderQuantity')
  int get remainingTenderQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'contractQuantity')
  int get contractQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'contractExpiryDate')
  String get contractExpiryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'announcementLetterNumber')
  String get announcementLetterNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'isNearToExpire')
  bool get isNearToExpire => throw _privateConstructorUsedError;
  @JsonKey(name: 'contractPaymentTerm')
  String get contractPaymentTerm => throw _privateConstructorUsedError;
  @StringToDoubleConverter()
  @JsonKey(name: 'tenderUnitPrice', defaultValue: 0.0)
  double get tenderUnitPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TenderContractDtoCopyWith<TenderContractDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TenderContractDtoCopyWith<$Res> {
  factory $TenderContractDtoCopyWith(
          TenderContractDto value, $Res Function(TenderContractDto) then) =
      _$TenderContractDtoCopyWithImpl<$Res, TenderContractDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'contractNumber') String contractNumber,
      @JsonKey(name: 'contractItemNumber') String contractItemNumber,
      @JsonKey(name: 'contractReference') String contractReference,
      @JsonKey(name: 'tenderOrderReason') String tenderOrderReason,
      @JsonKey(name: 'tenderVisaNumber') String tenderVisaNumber,
      @JsonKey(name: 'salesDistrict') String salesDistrict,
      @JsonKey(name: 'tenderPackageDescription')
      String tenderPackageDescription,
      @StringToDoubleConverter()
      @JsonKey(name: 'tenderPrice', defaultValue: 0.0)
      double tenderPrice,
      @JsonKey(name: 'pricingUnit') int pricingUnit,
      @JsonKey(name: 'remainingTenderQuantity') int remainingTenderQuantity,
      @JsonKey(name: 'contractQuantity') int contractQuantity,
      @JsonKey(name: 'contractExpiryDate') String contractExpiryDate,
      @JsonKey(name: 'announcementLetterNumber')
      String announcementLetterNumber,
      @JsonKey(name: 'isNearToExpire') bool isNearToExpire,
      @JsonKey(name: 'contractPaymentTerm') String contractPaymentTerm,
      @StringToDoubleConverter()
      @JsonKey(name: 'tenderUnitPrice', defaultValue: 0.0)
      double tenderUnitPrice});
}

/// @nodoc
class _$TenderContractDtoCopyWithImpl<$Res, $Val extends TenderContractDto>
    implements $TenderContractDtoCopyWith<$Res> {
  _$TenderContractDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contractNumber = null,
    Object? contractItemNumber = null,
    Object? contractReference = null,
    Object? tenderOrderReason = null,
    Object? tenderVisaNumber = null,
    Object? salesDistrict = null,
    Object? tenderPackageDescription = null,
    Object? tenderPrice = null,
    Object? pricingUnit = null,
    Object? remainingTenderQuantity = null,
    Object? contractQuantity = null,
    Object? contractExpiryDate = null,
    Object? announcementLetterNumber = null,
    Object? isNearToExpire = null,
    Object? contractPaymentTerm = null,
    Object? tenderUnitPrice = null,
  }) {
    return _then(_value.copyWith(
      contractNumber: null == contractNumber
          ? _value.contractNumber
          : contractNumber // ignore: cast_nullable_to_non_nullable
              as String,
      contractItemNumber: null == contractItemNumber
          ? _value.contractItemNumber
          : contractItemNumber // ignore: cast_nullable_to_non_nullable
              as String,
      contractReference: null == contractReference
          ? _value.contractReference
          : contractReference // ignore: cast_nullable_to_non_nullable
              as String,
      tenderOrderReason: null == tenderOrderReason
          ? _value.tenderOrderReason
          : tenderOrderReason // ignore: cast_nullable_to_non_nullable
              as String,
      tenderVisaNumber: null == tenderVisaNumber
          ? _value.tenderVisaNumber
          : tenderVisaNumber // ignore: cast_nullable_to_non_nullable
              as String,
      salesDistrict: null == salesDistrict
          ? _value.salesDistrict
          : salesDistrict // ignore: cast_nullable_to_non_nullable
              as String,
      tenderPackageDescription: null == tenderPackageDescription
          ? _value.tenderPackageDescription
          : tenderPackageDescription // ignore: cast_nullable_to_non_nullable
              as String,
      tenderPrice: null == tenderPrice
          ? _value.tenderPrice
          : tenderPrice // ignore: cast_nullable_to_non_nullable
              as double,
      pricingUnit: null == pricingUnit
          ? _value.pricingUnit
          : pricingUnit // ignore: cast_nullable_to_non_nullable
              as int,
      remainingTenderQuantity: null == remainingTenderQuantity
          ? _value.remainingTenderQuantity
          : remainingTenderQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      contractQuantity: null == contractQuantity
          ? _value.contractQuantity
          : contractQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      contractExpiryDate: null == contractExpiryDate
          ? _value.contractExpiryDate
          : contractExpiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      announcementLetterNumber: null == announcementLetterNumber
          ? _value.announcementLetterNumber
          : announcementLetterNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isNearToExpire: null == isNearToExpire
          ? _value.isNearToExpire
          : isNearToExpire // ignore: cast_nullable_to_non_nullable
              as bool,
      contractPaymentTerm: null == contractPaymentTerm
          ? _value.contractPaymentTerm
          : contractPaymentTerm // ignore: cast_nullable_to_non_nullable
              as String,
      tenderUnitPrice: null == tenderUnitPrice
          ? _value.tenderUnitPrice
          : tenderUnitPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TenderContractDtoImplCopyWith<$Res>
    implements $TenderContractDtoCopyWith<$Res> {
  factory _$$TenderContractDtoImplCopyWith(_$TenderContractDtoImpl value,
          $Res Function(_$TenderContractDtoImpl) then) =
      __$$TenderContractDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'contractNumber') String contractNumber,
      @JsonKey(name: 'contractItemNumber') String contractItemNumber,
      @JsonKey(name: 'contractReference') String contractReference,
      @JsonKey(name: 'tenderOrderReason') String tenderOrderReason,
      @JsonKey(name: 'tenderVisaNumber') String tenderVisaNumber,
      @JsonKey(name: 'salesDistrict') String salesDistrict,
      @JsonKey(name: 'tenderPackageDescription')
      String tenderPackageDescription,
      @StringToDoubleConverter()
      @JsonKey(name: 'tenderPrice', defaultValue: 0.0)
      double tenderPrice,
      @JsonKey(name: 'pricingUnit') int pricingUnit,
      @JsonKey(name: 'remainingTenderQuantity') int remainingTenderQuantity,
      @JsonKey(name: 'contractQuantity') int contractQuantity,
      @JsonKey(name: 'contractExpiryDate') String contractExpiryDate,
      @JsonKey(name: 'announcementLetterNumber')
      String announcementLetterNumber,
      @JsonKey(name: 'isNearToExpire') bool isNearToExpire,
      @JsonKey(name: 'contractPaymentTerm') String contractPaymentTerm,
      @StringToDoubleConverter()
      @JsonKey(name: 'tenderUnitPrice', defaultValue: 0.0)
      double tenderUnitPrice});
}

/// @nodoc
class __$$TenderContractDtoImplCopyWithImpl<$Res>
    extends _$TenderContractDtoCopyWithImpl<$Res, _$TenderContractDtoImpl>
    implements _$$TenderContractDtoImplCopyWith<$Res> {
  __$$TenderContractDtoImplCopyWithImpl(_$TenderContractDtoImpl _value,
      $Res Function(_$TenderContractDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contractNumber = null,
    Object? contractItemNumber = null,
    Object? contractReference = null,
    Object? tenderOrderReason = null,
    Object? tenderVisaNumber = null,
    Object? salesDistrict = null,
    Object? tenderPackageDescription = null,
    Object? tenderPrice = null,
    Object? pricingUnit = null,
    Object? remainingTenderQuantity = null,
    Object? contractQuantity = null,
    Object? contractExpiryDate = null,
    Object? announcementLetterNumber = null,
    Object? isNearToExpire = null,
    Object? contractPaymentTerm = null,
    Object? tenderUnitPrice = null,
  }) {
    return _then(_$TenderContractDtoImpl(
      contractNumber: null == contractNumber
          ? _value.contractNumber
          : contractNumber // ignore: cast_nullable_to_non_nullable
              as String,
      contractItemNumber: null == contractItemNumber
          ? _value.contractItemNumber
          : contractItemNumber // ignore: cast_nullable_to_non_nullable
              as String,
      contractReference: null == contractReference
          ? _value.contractReference
          : contractReference // ignore: cast_nullable_to_non_nullable
              as String,
      tenderOrderReason: null == tenderOrderReason
          ? _value.tenderOrderReason
          : tenderOrderReason // ignore: cast_nullable_to_non_nullable
              as String,
      tenderVisaNumber: null == tenderVisaNumber
          ? _value.tenderVisaNumber
          : tenderVisaNumber // ignore: cast_nullable_to_non_nullable
              as String,
      salesDistrict: null == salesDistrict
          ? _value.salesDistrict
          : salesDistrict // ignore: cast_nullable_to_non_nullable
              as String,
      tenderPackageDescription: null == tenderPackageDescription
          ? _value.tenderPackageDescription
          : tenderPackageDescription // ignore: cast_nullable_to_non_nullable
              as String,
      tenderPrice: null == tenderPrice
          ? _value.tenderPrice
          : tenderPrice // ignore: cast_nullable_to_non_nullable
              as double,
      pricingUnit: null == pricingUnit
          ? _value.pricingUnit
          : pricingUnit // ignore: cast_nullable_to_non_nullable
              as int,
      remainingTenderQuantity: null == remainingTenderQuantity
          ? _value.remainingTenderQuantity
          : remainingTenderQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      contractQuantity: null == contractQuantity
          ? _value.contractQuantity
          : contractQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      contractExpiryDate: null == contractExpiryDate
          ? _value.contractExpiryDate
          : contractExpiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      announcementLetterNumber: null == announcementLetterNumber
          ? _value.announcementLetterNumber
          : announcementLetterNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isNearToExpire: null == isNearToExpire
          ? _value.isNearToExpire
          : isNearToExpire // ignore: cast_nullable_to_non_nullable
              as bool,
      contractPaymentTerm: null == contractPaymentTerm
          ? _value.contractPaymentTerm
          : contractPaymentTerm // ignore: cast_nullable_to_non_nullable
              as String,
      tenderUnitPrice: null == tenderUnitPrice
          ? _value.tenderUnitPrice
          : tenderUnitPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TenderContractDtoImpl extends _TenderContractDto {
  const _$TenderContractDtoImpl(
      {@JsonKey(name: 'contractNumber') required this.contractNumber,
      @JsonKey(name: 'contractItemNumber') required this.contractItemNumber,
      @JsonKey(name: 'contractReference') required this.contractReference,
      @JsonKey(name: 'tenderOrderReason') required this.tenderOrderReason,
      @JsonKey(name: 'tenderVisaNumber') required this.tenderVisaNumber,
      @JsonKey(name: 'salesDistrict') required this.salesDistrict,
      @JsonKey(name: 'tenderPackageDescription')
      required this.tenderPackageDescription,
      @StringToDoubleConverter()
      @JsonKey(name: 'tenderPrice', defaultValue: 0.0)
      required this.tenderPrice,
      @JsonKey(name: 'pricingUnit') required this.pricingUnit,
      @JsonKey(name: 'remainingTenderQuantity')
      required this.remainingTenderQuantity,
      @JsonKey(name: 'contractQuantity') required this.contractQuantity,
      @JsonKey(name: 'contractExpiryDate') required this.contractExpiryDate,
      @JsonKey(name: 'announcementLetterNumber')
      required this.announcementLetterNumber,
      @JsonKey(name: 'isNearToExpire') required this.isNearToExpire,
      @JsonKey(name: 'contractPaymentTerm') required this.contractPaymentTerm,
      @StringToDoubleConverter()
      @JsonKey(name: 'tenderUnitPrice', defaultValue: 0.0)
      required this.tenderUnitPrice})
      : super._();

  factory _$TenderContractDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TenderContractDtoImplFromJson(json);

  @override
  @JsonKey(name: 'contractNumber')
  final String contractNumber;
  @override
  @JsonKey(name: 'contractItemNumber')
  final String contractItemNumber;
  @override
  @JsonKey(name: 'contractReference')
  final String contractReference;
  @override
  @JsonKey(name: 'tenderOrderReason')
  final String tenderOrderReason;
  @override
  @JsonKey(name: 'tenderVisaNumber')
  final String tenderVisaNumber;
  @override
  @JsonKey(name: 'salesDistrict')
  final String salesDistrict;
  @override
  @JsonKey(name: 'tenderPackageDescription')
  final String tenderPackageDescription;
  @override
  @StringToDoubleConverter()
  @JsonKey(name: 'tenderPrice', defaultValue: 0.0)
  final double tenderPrice;
  @override
  @JsonKey(name: 'pricingUnit')
  final int pricingUnit;
  @override
  @JsonKey(name: 'remainingTenderQuantity')
  final int remainingTenderQuantity;
  @override
  @JsonKey(name: 'contractQuantity')
  final int contractQuantity;
  @override
  @JsonKey(name: 'contractExpiryDate')
  final String contractExpiryDate;
  @override
  @JsonKey(name: 'announcementLetterNumber')
  final String announcementLetterNumber;
  @override
  @JsonKey(name: 'isNearToExpire')
  final bool isNearToExpire;
  @override
  @JsonKey(name: 'contractPaymentTerm')
  final String contractPaymentTerm;
  @override
  @StringToDoubleConverter()
  @JsonKey(name: 'tenderUnitPrice', defaultValue: 0.0)
  final double tenderUnitPrice;

  @override
  String toString() {
    return 'TenderContractDto(contractNumber: $contractNumber, contractItemNumber: $contractItemNumber, contractReference: $contractReference, tenderOrderReason: $tenderOrderReason, tenderVisaNumber: $tenderVisaNumber, salesDistrict: $salesDistrict, tenderPackageDescription: $tenderPackageDescription, tenderPrice: $tenderPrice, pricingUnit: $pricingUnit, remainingTenderQuantity: $remainingTenderQuantity, contractQuantity: $contractQuantity, contractExpiryDate: $contractExpiryDate, announcementLetterNumber: $announcementLetterNumber, isNearToExpire: $isNearToExpire, contractPaymentTerm: $contractPaymentTerm, tenderUnitPrice: $tenderUnitPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TenderContractDtoImpl &&
            (identical(other.contractNumber, contractNumber) ||
                other.contractNumber == contractNumber) &&
            (identical(other.contractItemNumber, contractItemNumber) ||
                other.contractItemNumber == contractItemNumber) &&
            (identical(other.contractReference, contractReference) ||
                other.contractReference == contractReference) &&
            (identical(other.tenderOrderReason, tenderOrderReason) ||
                other.tenderOrderReason == tenderOrderReason) &&
            (identical(other.tenderVisaNumber, tenderVisaNumber) ||
                other.tenderVisaNumber == tenderVisaNumber) &&
            (identical(other.salesDistrict, salesDistrict) ||
                other.salesDistrict == salesDistrict) &&
            (identical(
                    other.tenderPackageDescription, tenderPackageDescription) ||
                other.tenderPackageDescription == tenderPackageDescription) &&
            (identical(other.tenderPrice, tenderPrice) ||
                other.tenderPrice == tenderPrice) &&
            (identical(other.pricingUnit, pricingUnit) ||
                other.pricingUnit == pricingUnit) &&
            (identical(
                    other.remainingTenderQuantity, remainingTenderQuantity) ||
                other.remainingTenderQuantity == remainingTenderQuantity) &&
            (identical(other.contractQuantity, contractQuantity) ||
                other.contractQuantity == contractQuantity) &&
            (identical(other.contractExpiryDate, contractExpiryDate) ||
                other.contractExpiryDate == contractExpiryDate) &&
            (identical(
                    other.announcementLetterNumber, announcementLetterNumber) ||
                other.announcementLetterNumber == announcementLetterNumber) &&
            (identical(other.isNearToExpire, isNearToExpire) ||
                other.isNearToExpire == isNearToExpire) &&
            (identical(other.contractPaymentTerm, contractPaymentTerm) ||
                other.contractPaymentTerm == contractPaymentTerm) &&
            (identical(other.tenderUnitPrice, tenderUnitPrice) ||
                other.tenderUnitPrice == tenderUnitPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      contractNumber,
      contractItemNumber,
      contractReference,
      tenderOrderReason,
      tenderVisaNumber,
      salesDistrict,
      tenderPackageDescription,
      tenderPrice,
      pricingUnit,
      remainingTenderQuantity,
      contractQuantity,
      contractExpiryDate,
      announcementLetterNumber,
      isNearToExpire,
      contractPaymentTerm,
      tenderUnitPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TenderContractDtoImplCopyWith<_$TenderContractDtoImpl> get copyWith =>
      __$$TenderContractDtoImplCopyWithImpl<_$TenderContractDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TenderContractDtoImplToJson(
      this,
    );
  }
}

abstract class _TenderContractDto extends TenderContractDto {
  const factory _TenderContractDto(
      {@JsonKey(name: 'contractNumber') required final String contractNumber,
      @JsonKey(name: 'contractItemNumber')
      required final String contractItemNumber,
      @JsonKey(name: 'contractReference')
      required final String contractReference,
      @JsonKey(name: 'tenderOrderReason')
      required final String tenderOrderReason,
      @JsonKey(name: 'tenderVisaNumber') required final String tenderVisaNumber,
      @JsonKey(name: 'salesDistrict') required final String salesDistrict,
      @JsonKey(name: 'tenderPackageDescription')
      required final String tenderPackageDescription,
      @StringToDoubleConverter()
      @JsonKey(name: 'tenderPrice', defaultValue: 0.0)
      required final double tenderPrice,
      @JsonKey(name: 'pricingUnit') required final int pricingUnit,
      @JsonKey(name: 'remainingTenderQuantity')
      required final int remainingTenderQuantity,
      @JsonKey(name: 'contractQuantity') required final int contractQuantity,
      @JsonKey(name: 'contractExpiryDate')
      required final String contractExpiryDate,
      @JsonKey(name: 'announcementLetterNumber')
      required final String announcementLetterNumber,
      @JsonKey(name: 'isNearToExpire') required final bool isNearToExpire,
      @JsonKey(name: 'contractPaymentTerm')
      required final String contractPaymentTerm,
      @StringToDoubleConverter()
      @JsonKey(name: 'tenderUnitPrice', defaultValue: 0.0)
      required final double tenderUnitPrice}) = _$TenderContractDtoImpl;
  const _TenderContractDto._() : super._();

  factory _TenderContractDto.fromJson(Map<String, dynamic> json) =
      _$TenderContractDtoImpl.fromJson;

  @override
  @JsonKey(name: 'contractNumber')
  String get contractNumber;
  @override
  @JsonKey(name: 'contractItemNumber')
  String get contractItemNumber;
  @override
  @JsonKey(name: 'contractReference')
  String get contractReference;
  @override
  @JsonKey(name: 'tenderOrderReason')
  String get tenderOrderReason;
  @override
  @JsonKey(name: 'tenderVisaNumber')
  String get tenderVisaNumber;
  @override
  @JsonKey(name: 'salesDistrict')
  String get salesDistrict;
  @override
  @JsonKey(name: 'tenderPackageDescription')
  String get tenderPackageDescription;
  @override
  @StringToDoubleConverter()
  @JsonKey(name: 'tenderPrice', defaultValue: 0.0)
  double get tenderPrice;
  @override
  @JsonKey(name: 'pricingUnit')
  int get pricingUnit;
  @override
  @JsonKey(name: 'remainingTenderQuantity')
  int get remainingTenderQuantity;
  @override
  @JsonKey(name: 'contractQuantity')
  int get contractQuantity;
  @override
  @JsonKey(name: 'contractExpiryDate')
  String get contractExpiryDate;
  @override
  @JsonKey(name: 'announcementLetterNumber')
  String get announcementLetterNumber;
  @override
  @JsonKey(name: 'isNearToExpire')
  bool get isNearToExpire;
  @override
  @JsonKey(name: 'contractPaymentTerm')
  String get contractPaymentTerm;
  @override
  @StringToDoubleConverter()
  @JsonKey(name: 'tenderUnitPrice', defaultValue: 0.0)
  double get tenderUnitPrice;
  @override
  @JsonKey(ignore: true)
  _$$TenderContractDtoImplCopyWith<_$TenderContractDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

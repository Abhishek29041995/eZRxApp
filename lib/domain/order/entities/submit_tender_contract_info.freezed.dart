// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_tender_contract_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubmitTenderContract {
  TenderContractNumber get contractNumber => throw _privateConstructorUsedError;
  String get contractLineItemNumber => throw _privateConstructorUsedError;
  double get contractPrice => throw _privateConstructorUsedError;
  int get contractUnitOfMeasurement => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get contractPONumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubmitTenderContractCopyWith<SubmitTenderContract> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitTenderContractCopyWith<$Res> {
  factory $SubmitTenderContractCopyWith(SubmitTenderContract value,
          $Res Function(SubmitTenderContract) then) =
      _$SubmitTenderContractCopyWithImpl<$Res, SubmitTenderContract>;
  @useResult
  $Res call(
      {TenderContractNumber contractNumber,
      String contractLineItemNumber,
      double contractPrice,
      int contractUnitOfMeasurement,
      String currency,
      String contractPONumber});
}

/// @nodoc
class _$SubmitTenderContractCopyWithImpl<$Res,
        $Val extends SubmitTenderContract>
    implements $SubmitTenderContractCopyWith<$Res> {
  _$SubmitTenderContractCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contractNumber = null,
    Object? contractLineItemNumber = null,
    Object? contractPrice = null,
    Object? contractUnitOfMeasurement = null,
    Object? currency = null,
    Object? contractPONumber = null,
  }) {
    return _then(_value.copyWith(
      contractNumber: null == contractNumber
          ? _value.contractNumber
          : contractNumber // ignore: cast_nullable_to_non_nullable
              as TenderContractNumber,
      contractLineItemNumber: null == contractLineItemNumber
          ? _value.contractLineItemNumber
          : contractLineItemNumber // ignore: cast_nullable_to_non_nullable
              as String,
      contractPrice: null == contractPrice
          ? _value.contractPrice
          : contractPrice // ignore: cast_nullable_to_non_nullable
              as double,
      contractUnitOfMeasurement: null == contractUnitOfMeasurement
          ? _value.contractUnitOfMeasurement
          : contractUnitOfMeasurement // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      contractPONumber: null == contractPONumber
          ? _value.contractPONumber
          : contractPONumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubmitTenderContractImplCopyWith<$Res>
    implements $SubmitTenderContractCopyWith<$Res> {
  factory _$$SubmitTenderContractImplCopyWith(_$SubmitTenderContractImpl value,
          $Res Function(_$SubmitTenderContractImpl) then) =
      __$$SubmitTenderContractImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TenderContractNumber contractNumber,
      String contractLineItemNumber,
      double contractPrice,
      int contractUnitOfMeasurement,
      String currency,
      String contractPONumber});
}

/// @nodoc
class __$$SubmitTenderContractImplCopyWithImpl<$Res>
    extends _$SubmitTenderContractCopyWithImpl<$Res, _$SubmitTenderContractImpl>
    implements _$$SubmitTenderContractImplCopyWith<$Res> {
  __$$SubmitTenderContractImplCopyWithImpl(_$SubmitTenderContractImpl _value,
      $Res Function(_$SubmitTenderContractImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contractNumber = null,
    Object? contractLineItemNumber = null,
    Object? contractPrice = null,
    Object? contractUnitOfMeasurement = null,
    Object? currency = null,
    Object? contractPONumber = null,
  }) {
    return _then(_$SubmitTenderContractImpl(
      contractNumber: null == contractNumber
          ? _value.contractNumber
          : contractNumber // ignore: cast_nullable_to_non_nullable
              as TenderContractNumber,
      contractLineItemNumber: null == contractLineItemNumber
          ? _value.contractLineItemNumber
          : contractLineItemNumber // ignore: cast_nullable_to_non_nullable
              as String,
      contractPrice: null == contractPrice
          ? _value.contractPrice
          : contractPrice // ignore: cast_nullable_to_non_nullable
              as double,
      contractUnitOfMeasurement: null == contractUnitOfMeasurement
          ? _value.contractUnitOfMeasurement
          : contractUnitOfMeasurement // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      contractPONumber: null == contractPONumber
          ? _value.contractPONumber
          : contractPONumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SubmitTenderContractImpl extends _SubmitTenderContract {
  const _$SubmitTenderContractImpl(
      {required this.contractNumber,
      required this.contractLineItemNumber,
      required this.contractPrice,
      required this.contractUnitOfMeasurement,
      required this.currency,
      required this.contractPONumber})
      : super._();

  @override
  final TenderContractNumber contractNumber;
  @override
  final String contractLineItemNumber;
  @override
  final double contractPrice;
  @override
  final int contractUnitOfMeasurement;
  @override
  final String currency;
  @override
  final String contractPONumber;

  @override
  String toString() {
    return 'SubmitTenderContract(contractNumber: $contractNumber, contractLineItemNumber: $contractLineItemNumber, contractPrice: $contractPrice, contractUnitOfMeasurement: $contractUnitOfMeasurement, currency: $currency, contractPONumber: $contractPONumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitTenderContractImpl &&
            (identical(other.contractNumber, contractNumber) ||
                other.contractNumber == contractNumber) &&
            (identical(other.contractLineItemNumber, contractLineItemNumber) ||
                other.contractLineItemNumber == contractLineItemNumber) &&
            (identical(other.contractPrice, contractPrice) ||
                other.contractPrice == contractPrice) &&
            (identical(other.contractUnitOfMeasurement,
                    contractUnitOfMeasurement) ||
                other.contractUnitOfMeasurement == contractUnitOfMeasurement) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.contractPONumber, contractPONumber) ||
                other.contractPONumber == contractPONumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      contractNumber,
      contractLineItemNumber,
      contractPrice,
      contractUnitOfMeasurement,
      currency,
      contractPONumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitTenderContractImplCopyWith<_$SubmitTenderContractImpl>
      get copyWith =>
          __$$SubmitTenderContractImplCopyWithImpl<_$SubmitTenderContractImpl>(
              this, _$identity);
}

abstract class _SubmitTenderContract extends SubmitTenderContract {
  const factory _SubmitTenderContract(
      {required final TenderContractNumber contractNumber,
      required final String contractLineItemNumber,
      required final double contractPrice,
      required final int contractUnitOfMeasurement,
      required final String currency,
      required final String contractPONumber}) = _$SubmitTenderContractImpl;
  const _SubmitTenderContract._() : super._();

  @override
  TenderContractNumber get contractNumber;
  @override
  String get contractLineItemNumber;
  @override
  double get contractPrice;
  @override
  int get contractUnitOfMeasurement;
  @override
  String get currency;
  @override
  String get contractPONumber;
  @override
  @JsonKey(ignore: true)
  _$$SubmitTenderContractImplCopyWith<_$SubmitTenderContractImpl>
      get copyWith => throw _privateConstructorUsedError;
}

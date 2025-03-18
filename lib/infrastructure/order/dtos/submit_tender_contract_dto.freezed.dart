// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_tender_contract_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubmitTenderContractDto _$SubmitTenderContractDtoFromJson(
    Map<String, dynamic> json) {
  return _SubmitTenderContractDto.fromJson(json);
}

/// @nodoc
mixin _$SubmitTenderContractDto {
  @JsonKey(name: 'contractNumber', defaultValue: '')
  String get contractNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'contractLineItemNumber', defaultValue: '')
  String get contractLineItemNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'contractPrice', defaultValue: 0.0)
  double get contractPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'contractUnitOfMeasurement', defaultValue: 0)
  int get contractUnitOfMeasurement => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency', defaultValue: '')
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'contractPONumber', defaultValue: '')
  String get contractPONumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubmitTenderContractDtoCopyWith<SubmitTenderContractDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitTenderContractDtoCopyWith<$Res> {
  factory $SubmitTenderContractDtoCopyWith(SubmitTenderContractDto value,
          $Res Function(SubmitTenderContractDto) then) =
      _$SubmitTenderContractDtoCopyWithImpl<$Res, SubmitTenderContractDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'contractNumber', defaultValue: '') String contractNumber,
      @JsonKey(name: 'contractLineItemNumber', defaultValue: '')
      String contractLineItemNumber,
      @JsonKey(name: 'contractPrice', defaultValue: 0.0) double contractPrice,
      @JsonKey(name: 'contractUnitOfMeasurement', defaultValue: 0)
      int contractUnitOfMeasurement,
      @JsonKey(name: 'currency', defaultValue: '') String currency,
      @JsonKey(name: 'contractPONumber', defaultValue: '')
      String contractPONumber});
}

/// @nodoc
class _$SubmitTenderContractDtoCopyWithImpl<$Res,
        $Val extends SubmitTenderContractDto>
    implements $SubmitTenderContractDtoCopyWith<$Res> {
  _$SubmitTenderContractDtoCopyWithImpl(this._value, this._then);

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
              as String,
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
abstract class _$$SubmitTenderContractDtoImplCopyWith<$Res>
    implements $SubmitTenderContractDtoCopyWith<$Res> {
  factory _$$SubmitTenderContractDtoImplCopyWith(
          _$SubmitTenderContractDtoImpl value,
          $Res Function(_$SubmitTenderContractDtoImpl) then) =
      __$$SubmitTenderContractDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'contractNumber', defaultValue: '') String contractNumber,
      @JsonKey(name: 'contractLineItemNumber', defaultValue: '')
      String contractLineItemNumber,
      @JsonKey(name: 'contractPrice', defaultValue: 0.0) double contractPrice,
      @JsonKey(name: 'contractUnitOfMeasurement', defaultValue: 0)
      int contractUnitOfMeasurement,
      @JsonKey(name: 'currency', defaultValue: '') String currency,
      @JsonKey(name: 'contractPONumber', defaultValue: '')
      String contractPONumber});
}

/// @nodoc
class __$$SubmitTenderContractDtoImplCopyWithImpl<$Res>
    extends _$SubmitTenderContractDtoCopyWithImpl<$Res,
        _$SubmitTenderContractDtoImpl>
    implements _$$SubmitTenderContractDtoImplCopyWith<$Res> {
  __$$SubmitTenderContractDtoImplCopyWithImpl(
      _$SubmitTenderContractDtoImpl _value,
      $Res Function(_$SubmitTenderContractDtoImpl) _then)
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
    return _then(_$SubmitTenderContractDtoImpl(
      contractNumber: null == contractNumber
          ? _value.contractNumber
          : contractNumber // ignore: cast_nullable_to_non_nullable
              as String,
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
@JsonSerializable()
class _$SubmitTenderContractDtoImpl extends _SubmitTenderContractDto {
  const _$SubmitTenderContractDtoImpl(
      {@JsonKey(name: 'contractNumber', defaultValue: '')
      required this.contractNumber,
      @JsonKey(name: 'contractLineItemNumber', defaultValue: '')
      required this.contractLineItemNumber,
      @JsonKey(name: 'contractPrice', defaultValue: 0.0)
      required this.contractPrice,
      @JsonKey(name: 'contractUnitOfMeasurement', defaultValue: 0)
      required this.contractUnitOfMeasurement,
      @JsonKey(name: 'currency', defaultValue: '') required this.currency,
      @JsonKey(name: 'contractPONumber', defaultValue: '')
      required this.contractPONumber})
      : super._();

  factory _$SubmitTenderContractDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubmitTenderContractDtoImplFromJson(json);

  @override
  @JsonKey(name: 'contractNumber', defaultValue: '')
  final String contractNumber;
  @override
  @JsonKey(name: 'contractLineItemNumber', defaultValue: '')
  final String contractLineItemNumber;
  @override
  @JsonKey(name: 'contractPrice', defaultValue: 0.0)
  final double contractPrice;
  @override
  @JsonKey(name: 'contractUnitOfMeasurement', defaultValue: 0)
  final int contractUnitOfMeasurement;
  @override
  @JsonKey(name: 'currency', defaultValue: '')
  final String currency;
  @override
  @JsonKey(name: 'contractPONumber', defaultValue: '')
  final String contractPONumber;

  @override
  String toString() {
    return 'SubmitTenderContractDto(contractNumber: $contractNumber, contractLineItemNumber: $contractLineItemNumber, contractPrice: $contractPrice, contractUnitOfMeasurement: $contractUnitOfMeasurement, currency: $currency, contractPONumber: $contractPONumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitTenderContractDtoImpl &&
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

  @JsonKey(ignore: true)
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
  _$$SubmitTenderContractDtoImplCopyWith<_$SubmitTenderContractDtoImpl>
      get copyWith => __$$SubmitTenderContractDtoImplCopyWithImpl<
          _$SubmitTenderContractDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubmitTenderContractDtoImplToJson(
      this,
    );
  }
}

abstract class _SubmitTenderContractDto extends SubmitTenderContractDto {
  const factory _SubmitTenderContractDto(
      {@JsonKey(name: 'contractNumber', defaultValue: '')
      required final String contractNumber,
      @JsonKey(name: 'contractLineItemNumber', defaultValue: '')
      required final String contractLineItemNumber,
      @JsonKey(name: 'contractPrice', defaultValue: 0.0)
      required final double contractPrice,
      @JsonKey(name: 'contractUnitOfMeasurement', defaultValue: 0)
      required final int contractUnitOfMeasurement,
      @JsonKey(name: 'currency', defaultValue: '')
      required final String currency,
      @JsonKey(name: 'contractPONumber', defaultValue: '')
      required final String contractPONumber}) = _$SubmitTenderContractDtoImpl;
  const _SubmitTenderContractDto._() : super._();

  factory _SubmitTenderContractDto.fromJson(Map<String, dynamic> json) =
      _$SubmitTenderContractDtoImpl.fromJson;

  @override
  @JsonKey(name: 'contractNumber', defaultValue: '')
  String get contractNumber;
  @override
  @JsonKey(name: 'contractLineItemNumber', defaultValue: '')
  String get contractLineItemNumber;
  @override
  @JsonKey(name: 'contractPrice', defaultValue: 0.0)
  double get contractPrice;
  @override
  @JsonKey(name: 'contractUnitOfMeasurement', defaultValue: 0)
  int get contractUnitOfMeasurement;
  @override
  @JsonKey(name: 'currency', defaultValue: '')
  String get currency;
  @override
  @JsonKey(name: 'contractPONumber', defaultValue: '')
  String get contractPONumber;
  @override
  @JsonKey(ignore: true)
  _$$SubmitTenderContractDtoImplCopyWith<_$SubmitTenderContractDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

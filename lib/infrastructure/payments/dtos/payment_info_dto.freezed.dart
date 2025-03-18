// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentInfoDto _$PaymentInfoDtoFromJson(Map<String, dynamic> json) {
  return _PaymentInfoDto.fromJson(json);
}

/// @nodoc
mixin _$PaymentInfoDto {
  @JsonKey(name: 'paymentID', defaultValue: '')
  String get paymentID => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
  String get paymentBatchAdditionalInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'valueDate', defaultValue: '')
  String get valueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'transactionCurrency', defaultValue: '')
  String get transactionCurrency => throw _privateConstructorUsedError;
  @JsonKey(name: 'accountingDocExternalReference', defaultValue: '')
  String get accountingDocExternalReference =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'zCcpPaymentQRCode', defaultValue: '')
  String get zCcpPaymentQRCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'zzAdvice', defaultValue: '')
  String get zzAdvice => throw _privateConstructorUsedError;
  @JsonKey(name: 'zzHtmcs', defaultValue: '')
  String get zzHtmcs => throw _privateConstructorUsedError;
  @JsonKey(name: 'adviceExpiry', defaultValue: '')
  String get adviceExpiry => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentInfoDtoCopyWith<PaymentInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentInfoDtoCopyWith<$Res> {
  factory $PaymentInfoDtoCopyWith(
          PaymentInfoDto value, $Res Function(PaymentInfoDto) then) =
      _$PaymentInfoDtoCopyWithImpl<$Res, PaymentInfoDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'paymentID', defaultValue: '') String paymentID,
      @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
      String paymentBatchAdditionalInfo,
      @JsonKey(name: 'valueDate', defaultValue: '') String valueDate,
      @JsonKey(name: 'transactionCurrency', defaultValue: '')
      String transactionCurrency,
      @JsonKey(name: 'accountingDocExternalReference', defaultValue: '')
      String accountingDocExternalReference,
      @JsonKey(name: 'zCcpPaymentQRCode', defaultValue: '')
      String zCcpPaymentQRCode,
      @JsonKey(name: 'zzAdvice', defaultValue: '') String zzAdvice,
      @JsonKey(name: 'zzHtmcs', defaultValue: '') String zzHtmcs,
      @JsonKey(name: 'adviceExpiry', defaultValue: '') String adviceExpiry});
}

/// @nodoc
class _$PaymentInfoDtoCopyWithImpl<$Res, $Val extends PaymentInfoDto>
    implements $PaymentInfoDtoCopyWith<$Res> {
  _$PaymentInfoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentID = null,
    Object? paymentBatchAdditionalInfo = null,
    Object? valueDate = null,
    Object? transactionCurrency = null,
    Object? accountingDocExternalReference = null,
    Object? zCcpPaymentQRCode = null,
    Object? zzAdvice = null,
    Object? zzHtmcs = null,
    Object? adviceExpiry = null,
  }) {
    return _then(_value.copyWith(
      paymentID: null == paymentID
          ? _value.paymentID
          : paymentID // ignore: cast_nullable_to_non_nullable
              as String,
      paymentBatchAdditionalInfo: null == paymentBatchAdditionalInfo
          ? _value.paymentBatchAdditionalInfo
          : paymentBatchAdditionalInfo // ignore: cast_nullable_to_non_nullable
              as String,
      valueDate: null == valueDate
          ? _value.valueDate
          : valueDate // ignore: cast_nullable_to_non_nullable
              as String,
      transactionCurrency: null == transactionCurrency
          ? _value.transactionCurrency
          : transactionCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      accountingDocExternalReference: null == accountingDocExternalReference
          ? _value.accountingDocExternalReference
          : accountingDocExternalReference // ignore: cast_nullable_to_non_nullable
              as String,
      zCcpPaymentQRCode: null == zCcpPaymentQRCode
          ? _value.zCcpPaymentQRCode
          : zCcpPaymentQRCode // ignore: cast_nullable_to_non_nullable
              as String,
      zzAdvice: null == zzAdvice
          ? _value.zzAdvice
          : zzAdvice // ignore: cast_nullable_to_non_nullable
              as String,
      zzHtmcs: null == zzHtmcs
          ? _value.zzHtmcs
          : zzHtmcs // ignore: cast_nullable_to_non_nullable
              as String,
      adviceExpiry: null == adviceExpiry
          ? _value.adviceExpiry
          : adviceExpiry // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentInfoDtoImplCopyWith<$Res>
    implements $PaymentInfoDtoCopyWith<$Res> {
  factory _$$PaymentInfoDtoImplCopyWith(_$PaymentInfoDtoImpl value,
          $Res Function(_$PaymentInfoDtoImpl) then) =
      __$$PaymentInfoDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'paymentID', defaultValue: '') String paymentID,
      @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
      String paymentBatchAdditionalInfo,
      @JsonKey(name: 'valueDate', defaultValue: '') String valueDate,
      @JsonKey(name: 'transactionCurrency', defaultValue: '')
      String transactionCurrency,
      @JsonKey(name: 'accountingDocExternalReference', defaultValue: '')
      String accountingDocExternalReference,
      @JsonKey(name: 'zCcpPaymentQRCode', defaultValue: '')
      String zCcpPaymentQRCode,
      @JsonKey(name: 'zzAdvice', defaultValue: '') String zzAdvice,
      @JsonKey(name: 'zzHtmcs', defaultValue: '') String zzHtmcs,
      @JsonKey(name: 'adviceExpiry', defaultValue: '') String adviceExpiry});
}

/// @nodoc
class __$$PaymentInfoDtoImplCopyWithImpl<$Res>
    extends _$PaymentInfoDtoCopyWithImpl<$Res, _$PaymentInfoDtoImpl>
    implements _$$PaymentInfoDtoImplCopyWith<$Res> {
  __$$PaymentInfoDtoImplCopyWithImpl(
      _$PaymentInfoDtoImpl _value, $Res Function(_$PaymentInfoDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentID = null,
    Object? paymentBatchAdditionalInfo = null,
    Object? valueDate = null,
    Object? transactionCurrency = null,
    Object? accountingDocExternalReference = null,
    Object? zCcpPaymentQRCode = null,
    Object? zzAdvice = null,
    Object? zzHtmcs = null,
    Object? adviceExpiry = null,
  }) {
    return _then(_$PaymentInfoDtoImpl(
      paymentID: null == paymentID
          ? _value.paymentID
          : paymentID // ignore: cast_nullable_to_non_nullable
              as String,
      paymentBatchAdditionalInfo: null == paymentBatchAdditionalInfo
          ? _value.paymentBatchAdditionalInfo
          : paymentBatchAdditionalInfo // ignore: cast_nullable_to_non_nullable
              as String,
      valueDate: null == valueDate
          ? _value.valueDate
          : valueDate // ignore: cast_nullable_to_non_nullable
              as String,
      transactionCurrency: null == transactionCurrency
          ? _value.transactionCurrency
          : transactionCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      accountingDocExternalReference: null == accountingDocExternalReference
          ? _value.accountingDocExternalReference
          : accountingDocExternalReference // ignore: cast_nullable_to_non_nullable
              as String,
      zCcpPaymentQRCode: null == zCcpPaymentQRCode
          ? _value.zCcpPaymentQRCode
          : zCcpPaymentQRCode // ignore: cast_nullable_to_non_nullable
              as String,
      zzAdvice: null == zzAdvice
          ? _value.zzAdvice
          : zzAdvice // ignore: cast_nullable_to_non_nullable
              as String,
      zzHtmcs: null == zzHtmcs
          ? _value.zzHtmcs
          : zzHtmcs // ignore: cast_nullable_to_non_nullable
              as String,
      adviceExpiry: null == adviceExpiry
          ? _value.adviceExpiry
          : adviceExpiry // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentInfoDtoImpl extends _PaymentInfoDto {
  const _$PaymentInfoDtoImpl(
      {@JsonKey(name: 'paymentID', defaultValue: '') required this.paymentID,
      @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
      required this.paymentBatchAdditionalInfo,
      @JsonKey(name: 'valueDate', defaultValue: '') required this.valueDate,
      @JsonKey(name: 'transactionCurrency', defaultValue: '')
      required this.transactionCurrency,
      @JsonKey(name: 'accountingDocExternalReference', defaultValue: '')
      required this.accountingDocExternalReference,
      @JsonKey(name: 'zCcpPaymentQRCode', defaultValue: '')
      required this.zCcpPaymentQRCode,
      @JsonKey(name: 'zzAdvice', defaultValue: '') required this.zzAdvice,
      @JsonKey(name: 'zzHtmcs', defaultValue: '') required this.zzHtmcs,
      @JsonKey(name: 'adviceExpiry', defaultValue: '')
      required this.adviceExpiry})
      : super._();

  factory _$PaymentInfoDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentInfoDtoImplFromJson(json);

  @override
  @JsonKey(name: 'paymentID', defaultValue: '')
  final String paymentID;
  @override
  @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
  final String paymentBatchAdditionalInfo;
  @override
  @JsonKey(name: 'valueDate', defaultValue: '')
  final String valueDate;
  @override
  @JsonKey(name: 'transactionCurrency', defaultValue: '')
  final String transactionCurrency;
  @override
  @JsonKey(name: 'accountingDocExternalReference', defaultValue: '')
  final String accountingDocExternalReference;
  @override
  @JsonKey(name: 'zCcpPaymentQRCode', defaultValue: '')
  final String zCcpPaymentQRCode;
  @override
  @JsonKey(name: 'zzAdvice', defaultValue: '')
  final String zzAdvice;
  @override
  @JsonKey(name: 'zzHtmcs', defaultValue: '')
  final String zzHtmcs;
  @override
  @JsonKey(name: 'adviceExpiry', defaultValue: '')
  final String adviceExpiry;

  @override
  String toString() {
    return 'PaymentInfoDto(paymentID: $paymentID, paymentBatchAdditionalInfo: $paymentBatchAdditionalInfo, valueDate: $valueDate, transactionCurrency: $transactionCurrency, accountingDocExternalReference: $accountingDocExternalReference, zCcpPaymentQRCode: $zCcpPaymentQRCode, zzAdvice: $zzAdvice, zzHtmcs: $zzHtmcs, adviceExpiry: $adviceExpiry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentInfoDtoImpl &&
            (identical(other.paymentID, paymentID) ||
                other.paymentID == paymentID) &&
            (identical(other.paymentBatchAdditionalInfo,
                    paymentBatchAdditionalInfo) ||
                other.paymentBatchAdditionalInfo ==
                    paymentBatchAdditionalInfo) &&
            (identical(other.valueDate, valueDate) ||
                other.valueDate == valueDate) &&
            (identical(other.transactionCurrency, transactionCurrency) ||
                other.transactionCurrency == transactionCurrency) &&
            (identical(other.accountingDocExternalReference,
                    accountingDocExternalReference) ||
                other.accountingDocExternalReference ==
                    accountingDocExternalReference) &&
            (identical(other.zCcpPaymentQRCode, zCcpPaymentQRCode) ||
                other.zCcpPaymentQRCode == zCcpPaymentQRCode) &&
            (identical(other.zzAdvice, zzAdvice) ||
                other.zzAdvice == zzAdvice) &&
            (identical(other.zzHtmcs, zzHtmcs) || other.zzHtmcs == zzHtmcs) &&
            (identical(other.adviceExpiry, adviceExpiry) ||
                other.adviceExpiry == adviceExpiry));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      paymentID,
      paymentBatchAdditionalInfo,
      valueDate,
      transactionCurrency,
      accountingDocExternalReference,
      zCcpPaymentQRCode,
      zzAdvice,
      zzHtmcs,
      adviceExpiry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentInfoDtoImplCopyWith<_$PaymentInfoDtoImpl> get copyWith =>
      __$$PaymentInfoDtoImplCopyWithImpl<_$PaymentInfoDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentInfoDtoImplToJson(
      this,
    );
  }
}

abstract class _PaymentInfoDto extends PaymentInfoDto {
  const factory _PaymentInfoDto(
      {@JsonKey(name: 'paymentID', defaultValue: '')
      required final String paymentID,
      @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
      required final String paymentBatchAdditionalInfo,
      @JsonKey(name: 'valueDate', defaultValue: '')
      required final String valueDate,
      @JsonKey(name: 'transactionCurrency', defaultValue: '')
      required final String transactionCurrency,
      @JsonKey(name: 'accountingDocExternalReference', defaultValue: '')
      required final String accountingDocExternalReference,
      @JsonKey(name: 'zCcpPaymentQRCode', defaultValue: '')
      required final String zCcpPaymentQRCode,
      @JsonKey(name: 'zzAdvice', defaultValue: '')
      required final String zzAdvice,
      @JsonKey(name: 'zzHtmcs', defaultValue: '') required final String zzHtmcs,
      @JsonKey(name: 'adviceExpiry', defaultValue: '')
      required final String adviceExpiry}) = _$PaymentInfoDtoImpl;
  const _PaymentInfoDto._() : super._();

  factory _PaymentInfoDto.fromJson(Map<String, dynamic> json) =
      _$PaymentInfoDtoImpl.fromJson;

  @override
  @JsonKey(name: 'paymentID', defaultValue: '')
  String get paymentID;
  @override
  @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
  String get paymentBatchAdditionalInfo;
  @override
  @JsonKey(name: 'valueDate', defaultValue: '')
  String get valueDate;
  @override
  @JsonKey(name: 'transactionCurrency', defaultValue: '')
  String get transactionCurrency;
  @override
  @JsonKey(name: 'accountingDocExternalReference', defaultValue: '')
  String get accountingDocExternalReference;
  @override
  @JsonKey(name: 'zCcpPaymentQRCode', defaultValue: '')
  String get zCcpPaymentQRCode;
  @override
  @JsonKey(name: 'zzAdvice', defaultValue: '')
  String get zzAdvice;
  @override
  @JsonKey(name: 'zzHtmcs', defaultValue: '')
  String get zzHtmcs;
  @override
  @JsonKey(name: 'adviceExpiry', defaultValue: '')
  String get adviceExpiry;
  @override
  @JsonKey(ignore: true)
  _$$PaymentInfoDtoImplCopyWith<_$PaymentInfoDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

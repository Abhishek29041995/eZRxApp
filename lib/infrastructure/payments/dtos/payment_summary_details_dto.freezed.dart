// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_summary_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentSummaryDetailsDto _$PaymentSummaryDetailsDtoFromJson(
    Map<String, dynamic> json) {
  return _PaymentSummaryDetailsDto.fromJson(json);
}

/// @nodoc
mixin _$PaymentSummaryDetailsDto {
  @JsonKey(name: 'paymentID', defaultValue: '')
  String get paymentID => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'valueDate',
      defaultValue: '',
      readValue: JsonReadValueHelper.createdAtDate)
  String get valueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentAmount', defaultValue: 0.0)
  double get paymentAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'transactionCurrency', defaultValue: '')
  String get transactionCurrency => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentDocument', defaultValue: '')
  String get paymentDocument => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', defaultValue: '')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentMethod', defaultValue: '')
  String get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'iban', defaultValue: '')
  String get iban => throw _privateConstructorUsedError;
  @JsonKey(name: 'bankKey', defaultValue: '')
  String get bankKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'bankCountryKey', defaultValue: '')
  String get bankCountryKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'bankAccountNumber', defaultValue: '')
  String get bankAccountNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'bankName', defaultValue: '')
  String get bankName => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentCardID', defaultValue: '')
  String get paymentCardID => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentCardNumber', defaultValue: '')
  String get paymentCardNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentCardHolderName', defaultValue: '')
  String get paymentCardHolderName => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentCardMaskedNumber', defaultValue: '')
  String get paymentCardMaskedNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentCardTypeName', defaultValue: '')
  String get paymentCardTypeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'customId', defaultValue: '')
  String get customId => throw _privateConstructorUsedError;
  @JsonKey(name: 'bankIdentification', defaultValue: '')
  String get bankIdentification => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'createdDate',
      defaultValue: '',
      readValue: JsonReadValueHelper.createdAtDate)
  String get createdDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'zzAdvice', defaultValue: '')
  String get zzAdvice => throw _privateConstructorUsedError;
  @JsonKey(name: 'adviceExpiry', defaultValue: '')
  String get adviceExpiry => throw _privateConstructorUsedError;
  @JsonKey(name: 'accountingDocExternalReference', defaultValue: '')
  String get accountingDocExternalReference =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
  String get paymentBatchAdditionalInfo => throw _privateConstructorUsedError;
  Map<String, dynamic> get filterBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentSummaryDetailsDtoCopyWith<PaymentSummaryDetailsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentSummaryDetailsDtoCopyWith<$Res> {
  factory $PaymentSummaryDetailsDtoCopyWith(PaymentSummaryDetailsDto value,
          $Res Function(PaymentSummaryDetailsDto) then) =
      _$PaymentSummaryDetailsDtoCopyWithImpl<$Res, PaymentSummaryDetailsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'paymentID', defaultValue: '') String paymentID,
      @JsonKey(
          name: 'valueDate',
          defaultValue: '',
          readValue: JsonReadValueHelper.createdAtDate)
      String valueDate,
      @JsonKey(name: 'paymentAmount', defaultValue: 0.0) double paymentAmount,
      @JsonKey(name: 'transactionCurrency', defaultValue: '')
      String transactionCurrency,
      @JsonKey(name: 'paymentDocument', defaultValue: '')
      String paymentDocument,
      @JsonKey(name: 'status', defaultValue: '') String status,
      @JsonKey(name: 'paymentMethod', defaultValue: '') String paymentMethod,
      @JsonKey(name: 'iban', defaultValue: '') String iban,
      @JsonKey(name: 'bankKey', defaultValue: '') String bankKey,
      @JsonKey(name: 'bankCountryKey', defaultValue: '') String bankCountryKey,
      @JsonKey(name: 'bankAccountNumber', defaultValue: '')
      String bankAccountNumber,
      @JsonKey(name: 'bankName', defaultValue: '') String bankName,
      @JsonKey(name: 'paymentCardID', defaultValue: '') String paymentCardID,
      @JsonKey(name: 'paymentCardNumber', defaultValue: '')
      String paymentCardNumber,
      @JsonKey(name: 'paymentCardHolderName', defaultValue: '')
      String paymentCardHolderName,
      @JsonKey(name: 'paymentCardMaskedNumber', defaultValue: '')
      String paymentCardMaskedNumber,
      @JsonKey(name: 'paymentCardTypeName', defaultValue: '')
      String paymentCardTypeName,
      @JsonKey(name: 'customId', defaultValue: '') String customId,
      @JsonKey(name: 'bankIdentification', defaultValue: '')
      String bankIdentification,
      @JsonKey(
          name: 'createdDate',
          defaultValue: '',
          readValue: JsonReadValueHelper.createdAtDate)
      String createdDate,
      @JsonKey(name: 'zzAdvice', defaultValue: '') String zzAdvice,
      @JsonKey(name: 'adviceExpiry', defaultValue: '') String adviceExpiry,
      @JsonKey(name: 'accountingDocExternalReference', defaultValue: '')
      String accountingDocExternalReference,
      @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
      String paymentBatchAdditionalInfo,
      Map<String, dynamic> filterBy});
}

/// @nodoc
class _$PaymentSummaryDetailsDtoCopyWithImpl<$Res,
        $Val extends PaymentSummaryDetailsDto>
    implements $PaymentSummaryDetailsDtoCopyWith<$Res> {
  _$PaymentSummaryDetailsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentID = null,
    Object? valueDate = null,
    Object? paymentAmount = null,
    Object? transactionCurrency = null,
    Object? paymentDocument = null,
    Object? status = null,
    Object? paymentMethod = null,
    Object? iban = null,
    Object? bankKey = null,
    Object? bankCountryKey = null,
    Object? bankAccountNumber = null,
    Object? bankName = null,
    Object? paymentCardID = null,
    Object? paymentCardNumber = null,
    Object? paymentCardHolderName = null,
    Object? paymentCardMaskedNumber = null,
    Object? paymentCardTypeName = null,
    Object? customId = null,
    Object? bankIdentification = null,
    Object? createdDate = null,
    Object? zzAdvice = null,
    Object? adviceExpiry = null,
    Object? accountingDocExternalReference = null,
    Object? paymentBatchAdditionalInfo = null,
    Object? filterBy = null,
  }) {
    return _then(_value.copyWith(
      paymentID: null == paymentID
          ? _value.paymentID
          : paymentID // ignore: cast_nullable_to_non_nullable
              as String,
      valueDate: null == valueDate
          ? _value.valueDate
          : valueDate // ignore: cast_nullable_to_non_nullable
              as String,
      paymentAmount: null == paymentAmount
          ? _value.paymentAmount
          : paymentAmount // ignore: cast_nullable_to_non_nullable
              as double,
      transactionCurrency: null == transactionCurrency
          ? _value.transactionCurrency
          : transactionCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      paymentDocument: null == paymentDocument
          ? _value.paymentDocument
          : paymentDocument // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      iban: null == iban
          ? _value.iban
          : iban // ignore: cast_nullable_to_non_nullable
              as String,
      bankKey: null == bankKey
          ? _value.bankKey
          : bankKey // ignore: cast_nullable_to_non_nullable
              as String,
      bankCountryKey: null == bankCountryKey
          ? _value.bankCountryKey
          : bankCountryKey // ignore: cast_nullable_to_non_nullable
              as String,
      bankAccountNumber: null == bankAccountNumber
          ? _value.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      paymentCardID: null == paymentCardID
          ? _value.paymentCardID
          : paymentCardID // ignore: cast_nullable_to_non_nullable
              as String,
      paymentCardNumber: null == paymentCardNumber
          ? _value.paymentCardNumber
          : paymentCardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      paymentCardHolderName: null == paymentCardHolderName
          ? _value.paymentCardHolderName
          : paymentCardHolderName // ignore: cast_nullable_to_non_nullable
              as String,
      paymentCardMaskedNumber: null == paymentCardMaskedNumber
          ? _value.paymentCardMaskedNumber
          : paymentCardMaskedNumber // ignore: cast_nullable_to_non_nullable
              as String,
      paymentCardTypeName: null == paymentCardTypeName
          ? _value.paymentCardTypeName
          : paymentCardTypeName // ignore: cast_nullable_to_non_nullable
              as String,
      customId: null == customId
          ? _value.customId
          : customId // ignore: cast_nullable_to_non_nullable
              as String,
      bankIdentification: null == bankIdentification
          ? _value.bankIdentification
          : bankIdentification // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      zzAdvice: null == zzAdvice
          ? _value.zzAdvice
          : zzAdvice // ignore: cast_nullable_to_non_nullable
              as String,
      adviceExpiry: null == adviceExpiry
          ? _value.adviceExpiry
          : adviceExpiry // ignore: cast_nullable_to_non_nullable
              as String,
      accountingDocExternalReference: null == accountingDocExternalReference
          ? _value.accountingDocExternalReference
          : accountingDocExternalReference // ignore: cast_nullable_to_non_nullable
              as String,
      paymentBatchAdditionalInfo: null == paymentBatchAdditionalInfo
          ? _value.paymentBatchAdditionalInfo
          : paymentBatchAdditionalInfo // ignore: cast_nullable_to_non_nullable
              as String,
      filterBy: null == filterBy
          ? _value.filterBy
          : filterBy // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentSummaryDetailsDtoImplCopyWith<$Res>
    implements $PaymentSummaryDetailsDtoCopyWith<$Res> {
  factory _$$PaymentSummaryDetailsDtoImplCopyWith(
          _$PaymentSummaryDetailsDtoImpl value,
          $Res Function(_$PaymentSummaryDetailsDtoImpl) then) =
      __$$PaymentSummaryDetailsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'paymentID', defaultValue: '') String paymentID,
      @JsonKey(
          name: 'valueDate',
          defaultValue: '',
          readValue: JsonReadValueHelper.createdAtDate)
      String valueDate,
      @JsonKey(name: 'paymentAmount', defaultValue: 0.0) double paymentAmount,
      @JsonKey(name: 'transactionCurrency', defaultValue: '')
      String transactionCurrency,
      @JsonKey(name: 'paymentDocument', defaultValue: '')
      String paymentDocument,
      @JsonKey(name: 'status', defaultValue: '') String status,
      @JsonKey(name: 'paymentMethod', defaultValue: '') String paymentMethod,
      @JsonKey(name: 'iban', defaultValue: '') String iban,
      @JsonKey(name: 'bankKey', defaultValue: '') String bankKey,
      @JsonKey(name: 'bankCountryKey', defaultValue: '') String bankCountryKey,
      @JsonKey(name: 'bankAccountNumber', defaultValue: '')
      String bankAccountNumber,
      @JsonKey(name: 'bankName', defaultValue: '') String bankName,
      @JsonKey(name: 'paymentCardID', defaultValue: '') String paymentCardID,
      @JsonKey(name: 'paymentCardNumber', defaultValue: '')
      String paymentCardNumber,
      @JsonKey(name: 'paymentCardHolderName', defaultValue: '')
      String paymentCardHolderName,
      @JsonKey(name: 'paymentCardMaskedNumber', defaultValue: '')
      String paymentCardMaskedNumber,
      @JsonKey(name: 'paymentCardTypeName', defaultValue: '')
      String paymentCardTypeName,
      @JsonKey(name: 'customId', defaultValue: '') String customId,
      @JsonKey(name: 'bankIdentification', defaultValue: '')
      String bankIdentification,
      @JsonKey(
          name: 'createdDate',
          defaultValue: '',
          readValue: JsonReadValueHelper.createdAtDate)
      String createdDate,
      @JsonKey(name: 'zzAdvice', defaultValue: '') String zzAdvice,
      @JsonKey(name: 'adviceExpiry', defaultValue: '') String adviceExpiry,
      @JsonKey(name: 'accountingDocExternalReference', defaultValue: '')
      String accountingDocExternalReference,
      @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
      String paymentBatchAdditionalInfo,
      Map<String, dynamic> filterBy});
}

/// @nodoc
class __$$PaymentSummaryDetailsDtoImplCopyWithImpl<$Res>
    extends _$PaymentSummaryDetailsDtoCopyWithImpl<$Res,
        _$PaymentSummaryDetailsDtoImpl>
    implements _$$PaymentSummaryDetailsDtoImplCopyWith<$Res> {
  __$$PaymentSummaryDetailsDtoImplCopyWithImpl(
      _$PaymentSummaryDetailsDtoImpl _value,
      $Res Function(_$PaymentSummaryDetailsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentID = null,
    Object? valueDate = null,
    Object? paymentAmount = null,
    Object? transactionCurrency = null,
    Object? paymentDocument = null,
    Object? status = null,
    Object? paymentMethod = null,
    Object? iban = null,
    Object? bankKey = null,
    Object? bankCountryKey = null,
    Object? bankAccountNumber = null,
    Object? bankName = null,
    Object? paymentCardID = null,
    Object? paymentCardNumber = null,
    Object? paymentCardHolderName = null,
    Object? paymentCardMaskedNumber = null,
    Object? paymentCardTypeName = null,
    Object? customId = null,
    Object? bankIdentification = null,
    Object? createdDate = null,
    Object? zzAdvice = null,
    Object? adviceExpiry = null,
    Object? accountingDocExternalReference = null,
    Object? paymentBatchAdditionalInfo = null,
    Object? filterBy = null,
  }) {
    return _then(_$PaymentSummaryDetailsDtoImpl(
      paymentID: null == paymentID
          ? _value.paymentID
          : paymentID // ignore: cast_nullable_to_non_nullable
              as String,
      valueDate: null == valueDate
          ? _value.valueDate
          : valueDate // ignore: cast_nullable_to_non_nullable
              as String,
      paymentAmount: null == paymentAmount
          ? _value.paymentAmount
          : paymentAmount // ignore: cast_nullable_to_non_nullable
              as double,
      transactionCurrency: null == transactionCurrency
          ? _value.transactionCurrency
          : transactionCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      paymentDocument: null == paymentDocument
          ? _value.paymentDocument
          : paymentDocument // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      iban: null == iban
          ? _value.iban
          : iban // ignore: cast_nullable_to_non_nullable
              as String,
      bankKey: null == bankKey
          ? _value.bankKey
          : bankKey // ignore: cast_nullable_to_non_nullable
              as String,
      bankCountryKey: null == bankCountryKey
          ? _value.bankCountryKey
          : bankCountryKey // ignore: cast_nullable_to_non_nullable
              as String,
      bankAccountNumber: null == bankAccountNumber
          ? _value.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      paymentCardID: null == paymentCardID
          ? _value.paymentCardID
          : paymentCardID // ignore: cast_nullable_to_non_nullable
              as String,
      paymentCardNumber: null == paymentCardNumber
          ? _value.paymentCardNumber
          : paymentCardNumber // ignore: cast_nullable_to_non_nullable
              as String,
      paymentCardHolderName: null == paymentCardHolderName
          ? _value.paymentCardHolderName
          : paymentCardHolderName // ignore: cast_nullable_to_non_nullable
              as String,
      paymentCardMaskedNumber: null == paymentCardMaskedNumber
          ? _value.paymentCardMaskedNumber
          : paymentCardMaskedNumber // ignore: cast_nullable_to_non_nullable
              as String,
      paymentCardTypeName: null == paymentCardTypeName
          ? _value.paymentCardTypeName
          : paymentCardTypeName // ignore: cast_nullable_to_non_nullable
              as String,
      customId: null == customId
          ? _value.customId
          : customId // ignore: cast_nullable_to_non_nullable
              as String,
      bankIdentification: null == bankIdentification
          ? _value.bankIdentification
          : bankIdentification // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      zzAdvice: null == zzAdvice
          ? _value.zzAdvice
          : zzAdvice // ignore: cast_nullable_to_non_nullable
              as String,
      adviceExpiry: null == adviceExpiry
          ? _value.adviceExpiry
          : adviceExpiry // ignore: cast_nullable_to_non_nullable
              as String,
      accountingDocExternalReference: null == accountingDocExternalReference
          ? _value.accountingDocExternalReference
          : accountingDocExternalReference // ignore: cast_nullable_to_non_nullable
              as String,
      paymentBatchAdditionalInfo: null == paymentBatchAdditionalInfo
          ? _value.paymentBatchAdditionalInfo
          : paymentBatchAdditionalInfo // ignore: cast_nullable_to_non_nullable
              as String,
      filterBy: null == filterBy
          ? _value._filterBy
          : filterBy // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentSummaryDetailsDtoImpl extends _PaymentSummaryDetailsDto {
  const _$PaymentSummaryDetailsDtoImpl(
      {@JsonKey(name: 'paymentID', defaultValue: '') required this.paymentID,
      @JsonKey(
          name: 'valueDate',
          defaultValue: '',
          readValue: JsonReadValueHelper.createdAtDate)
      required this.valueDate,
      @JsonKey(name: 'paymentAmount', defaultValue: 0.0)
      required this.paymentAmount,
      @JsonKey(name: 'transactionCurrency', defaultValue: '')
      required this.transactionCurrency,
      @JsonKey(name: 'paymentDocument', defaultValue: '')
      required this.paymentDocument,
      @JsonKey(name: 'status', defaultValue: '') required this.status,
      @JsonKey(name: 'paymentMethod', defaultValue: '')
      required this.paymentMethod,
      @JsonKey(name: 'iban', defaultValue: '') required this.iban,
      @JsonKey(name: 'bankKey', defaultValue: '') required this.bankKey,
      @JsonKey(name: 'bankCountryKey', defaultValue: '')
      required this.bankCountryKey,
      @JsonKey(name: 'bankAccountNumber', defaultValue: '')
      required this.bankAccountNumber,
      @JsonKey(name: 'bankName', defaultValue: '') required this.bankName,
      @JsonKey(name: 'paymentCardID', defaultValue: '')
      required this.paymentCardID,
      @JsonKey(name: 'paymentCardNumber', defaultValue: '')
      required this.paymentCardNumber,
      @JsonKey(name: 'paymentCardHolderName', defaultValue: '')
      required this.paymentCardHolderName,
      @JsonKey(name: 'paymentCardMaskedNumber', defaultValue: '')
      required this.paymentCardMaskedNumber,
      @JsonKey(name: 'paymentCardTypeName', defaultValue: '')
      required this.paymentCardTypeName,
      @JsonKey(name: 'customId', defaultValue: '') required this.customId,
      @JsonKey(name: 'bankIdentification', defaultValue: '')
      required this.bankIdentification,
      @JsonKey(
          name: 'createdDate',
          defaultValue: '',
          readValue: JsonReadValueHelper.createdAtDate)
      required this.createdDate,
      @JsonKey(name: 'zzAdvice', defaultValue: '') required this.zzAdvice,
      @JsonKey(name: 'adviceExpiry', defaultValue: '')
      required this.adviceExpiry,
      @JsonKey(name: 'accountingDocExternalReference', defaultValue: '')
      required this.accountingDocExternalReference,
      @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
      required this.paymentBatchAdditionalInfo,
      final Map<String, dynamic> filterBy = const <String, dynamic>{}})
      : _filterBy = filterBy,
        super._();

  factory _$PaymentSummaryDetailsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentSummaryDetailsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'paymentID', defaultValue: '')
  final String paymentID;
  @override
  @JsonKey(
      name: 'valueDate',
      defaultValue: '',
      readValue: JsonReadValueHelper.createdAtDate)
  final String valueDate;
  @override
  @JsonKey(name: 'paymentAmount', defaultValue: 0.0)
  final double paymentAmount;
  @override
  @JsonKey(name: 'transactionCurrency', defaultValue: '')
  final String transactionCurrency;
  @override
  @JsonKey(name: 'paymentDocument', defaultValue: '')
  final String paymentDocument;
  @override
  @JsonKey(name: 'status', defaultValue: '')
  final String status;
  @override
  @JsonKey(name: 'paymentMethod', defaultValue: '')
  final String paymentMethod;
  @override
  @JsonKey(name: 'iban', defaultValue: '')
  final String iban;
  @override
  @JsonKey(name: 'bankKey', defaultValue: '')
  final String bankKey;
  @override
  @JsonKey(name: 'bankCountryKey', defaultValue: '')
  final String bankCountryKey;
  @override
  @JsonKey(name: 'bankAccountNumber', defaultValue: '')
  final String bankAccountNumber;
  @override
  @JsonKey(name: 'bankName', defaultValue: '')
  final String bankName;
  @override
  @JsonKey(name: 'paymentCardID', defaultValue: '')
  final String paymentCardID;
  @override
  @JsonKey(name: 'paymentCardNumber', defaultValue: '')
  final String paymentCardNumber;
  @override
  @JsonKey(name: 'paymentCardHolderName', defaultValue: '')
  final String paymentCardHolderName;
  @override
  @JsonKey(name: 'paymentCardMaskedNumber', defaultValue: '')
  final String paymentCardMaskedNumber;
  @override
  @JsonKey(name: 'paymentCardTypeName', defaultValue: '')
  final String paymentCardTypeName;
  @override
  @JsonKey(name: 'customId', defaultValue: '')
  final String customId;
  @override
  @JsonKey(name: 'bankIdentification', defaultValue: '')
  final String bankIdentification;
  @override
  @JsonKey(
      name: 'createdDate',
      defaultValue: '',
      readValue: JsonReadValueHelper.createdAtDate)
  final String createdDate;
  @override
  @JsonKey(name: 'zzAdvice', defaultValue: '')
  final String zzAdvice;
  @override
  @JsonKey(name: 'adviceExpiry', defaultValue: '')
  final String adviceExpiry;
  @override
  @JsonKey(name: 'accountingDocExternalReference', defaultValue: '')
  final String accountingDocExternalReference;
  @override
  @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
  final String paymentBatchAdditionalInfo;
  final Map<String, dynamic> _filterBy;
  @override
  @JsonKey()
  Map<String, dynamic> get filterBy {
    if (_filterBy is EqualUnmodifiableMapView) return _filterBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_filterBy);
  }

  @override
  String toString() {
    return 'PaymentSummaryDetailsDto(paymentID: $paymentID, valueDate: $valueDate, paymentAmount: $paymentAmount, transactionCurrency: $transactionCurrency, paymentDocument: $paymentDocument, status: $status, paymentMethod: $paymentMethod, iban: $iban, bankKey: $bankKey, bankCountryKey: $bankCountryKey, bankAccountNumber: $bankAccountNumber, bankName: $bankName, paymentCardID: $paymentCardID, paymentCardNumber: $paymentCardNumber, paymentCardHolderName: $paymentCardHolderName, paymentCardMaskedNumber: $paymentCardMaskedNumber, paymentCardTypeName: $paymentCardTypeName, customId: $customId, bankIdentification: $bankIdentification, createdDate: $createdDate, zzAdvice: $zzAdvice, adviceExpiry: $adviceExpiry, accountingDocExternalReference: $accountingDocExternalReference, paymentBatchAdditionalInfo: $paymentBatchAdditionalInfo, filterBy: $filterBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentSummaryDetailsDtoImpl &&
            (identical(other.paymentID, paymentID) ||
                other.paymentID == paymentID) &&
            (identical(other.valueDate, valueDate) ||
                other.valueDate == valueDate) &&
            (identical(other.paymentAmount, paymentAmount) ||
                other.paymentAmount == paymentAmount) &&
            (identical(other.transactionCurrency, transactionCurrency) ||
                other.transactionCurrency == transactionCurrency) &&
            (identical(other.paymentDocument, paymentDocument) ||
                other.paymentDocument == paymentDocument) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.iban, iban) || other.iban == iban) &&
            (identical(other.bankKey, bankKey) || other.bankKey == bankKey) &&
            (identical(other.bankCountryKey, bankCountryKey) ||
                other.bankCountryKey == bankCountryKey) &&
            (identical(other.bankAccountNumber, bankAccountNumber) ||
                other.bankAccountNumber == bankAccountNumber) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.paymentCardID, paymentCardID) ||
                other.paymentCardID == paymentCardID) &&
            (identical(other.paymentCardNumber, paymentCardNumber) ||
                other.paymentCardNumber == paymentCardNumber) &&
            (identical(other.paymentCardHolderName, paymentCardHolderName) ||
                other.paymentCardHolderName == paymentCardHolderName) &&
            (identical(
                    other.paymentCardMaskedNumber, paymentCardMaskedNumber) ||
                other.paymentCardMaskedNumber == paymentCardMaskedNumber) &&
            (identical(other.paymentCardTypeName, paymentCardTypeName) ||
                other.paymentCardTypeName == paymentCardTypeName) &&
            (identical(other.customId, customId) ||
                other.customId == customId) &&
            (identical(other.bankIdentification, bankIdentification) ||
                other.bankIdentification == bankIdentification) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.zzAdvice, zzAdvice) ||
                other.zzAdvice == zzAdvice) &&
            (identical(other.adviceExpiry, adviceExpiry) ||
                other.adviceExpiry == adviceExpiry) &&
            (identical(other.accountingDocExternalReference,
                    accountingDocExternalReference) ||
                other.accountingDocExternalReference ==
                    accountingDocExternalReference) &&
            (identical(other.paymentBatchAdditionalInfo,
                    paymentBatchAdditionalInfo) ||
                other.paymentBatchAdditionalInfo ==
                    paymentBatchAdditionalInfo) &&
            const DeepCollectionEquality().equals(other._filterBy, _filterBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        paymentID,
        valueDate,
        paymentAmount,
        transactionCurrency,
        paymentDocument,
        status,
        paymentMethod,
        iban,
        bankKey,
        bankCountryKey,
        bankAccountNumber,
        bankName,
        paymentCardID,
        paymentCardNumber,
        paymentCardHolderName,
        paymentCardMaskedNumber,
        paymentCardTypeName,
        customId,
        bankIdentification,
        createdDate,
        zzAdvice,
        adviceExpiry,
        accountingDocExternalReference,
        paymentBatchAdditionalInfo,
        const DeepCollectionEquality().hash(_filterBy)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentSummaryDetailsDtoImplCopyWith<_$PaymentSummaryDetailsDtoImpl>
      get copyWith => __$$PaymentSummaryDetailsDtoImplCopyWithImpl<
          _$PaymentSummaryDetailsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentSummaryDetailsDtoImplToJson(
      this,
    );
  }
}

abstract class _PaymentSummaryDetailsDto extends PaymentSummaryDetailsDto {
  const factory _PaymentSummaryDetailsDto(
      {@JsonKey(name: 'paymentID', defaultValue: '')
      required final String paymentID,
      @JsonKey(
          name: 'valueDate',
          defaultValue: '',
          readValue: JsonReadValueHelper.createdAtDate)
      required final String valueDate,
      @JsonKey(name: 'paymentAmount', defaultValue: 0.0)
      required final double paymentAmount,
      @JsonKey(name: 'transactionCurrency', defaultValue: '')
      required final String transactionCurrency,
      @JsonKey(name: 'paymentDocument', defaultValue: '')
      required final String paymentDocument,
      @JsonKey(name: 'status', defaultValue: '') required final String status,
      @JsonKey(name: 'paymentMethod', defaultValue: '')
      required final String paymentMethod,
      @JsonKey(name: 'iban', defaultValue: '') required final String iban,
      @JsonKey(name: 'bankKey', defaultValue: '') required final String bankKey,
      @JsonKey(name: 'bankCountryKey', defaultValue: '')
      required final String bankCountryKey,
      @JsonKey(name: 'bankAccountNumber', defaultValue: '')
      required final String bankAccountNumber,
      @JsonKey(name: 'bankName', defaultValue: '')
      required final String bankName,
      @JsonKey(name: 'paymentCardID', defaultValue: '')
      required final String paymentCardID,
      @JsonKey(name: 'paymentCardNumber', defaultValue: '')
      required final String paymentCardNumber,
      @JsonKey(name: 'paymentCardHolderName', defaultValue: '')
      required final String paymentCardHolderName,
      @JsonKey(name: 'paymentCardMaskedNumber', defaultValue: '')
      required final String paymentCardMaskedNumber,
      @JsonKey(name: 'paymentCardTypeName', defaultValue: '')
      required final String paymentCardTypeName,
      @JsonKey(name: 'customId', defaultValue: '')
      required final String customId,
      @JsonKey(name: 'bankIdentification', defaultValue: '')
      required final String bankIdentification,
      @JsonKey(
          name: 'createdDate',
          defaultValue: '',
          readValue: JsonReadValueHelper.createdAtDate)
      required final String createdDate,
      @JsonKey(name: 'zzAdvice', defaultValue: '')
      required final String zzAdvice,
      @JsonKey(name: 'adviceExpiry', defaultValue: '')
      required final String adviceExpiry,
      @JsonKey(name: 'accountingDocExternalReference', defaultValue: '')
      required final String accountingDocExternalReference,
      @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
      required final String paymentBatchAdditionalInfo,
      final Map<String, dynamic> filterBy}) = _$PaymentSummaryDetailsDtoImpl;
  const _PaymentSummaryDetailsDto._() : super._();

  factory _PaymentSummaryDetailsDto.fromJson(Map<String, dynamic> json) =
      _$PaymentSummaryDetailsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'paymentID', defaultValue: '')
  String get paymentID;
  @override
  @JsonKey(
      name: 'valueDate',
      defaultValue: '',
      readValue: JsonReadValueHelper.createdAtDate)
  String get valueDate;
  @override
  @JsonKey(name: 'paymentAmount', defaultValue: 0.0)
  double get paymentAmount;
  @override
  @JsonKey(name: 'transactionCurrency', defaultValue: '')
  String get transactionCurrency;
  @override
  @JsonKey(name: 'paymentDocument', defaultValue: '')
  String get paymentDocument;
  @override
  @JsonKey(name: 'status', defaultValue: '')
  String get status;
  @override
  @JsonKey(name: 'paymentMethod', defaultValue: '')
  String get paymentMethod;
  @override
  @JsonKey(name: 'iban', defaultValue: '')
  String get iban;
  @override
  @JsonKey(name: 'bankKey', defaultValue: '')
  String get bankKey;
  @override
  @JsonKey(name: 'bankCountryKey', defaultValue: '')
  String get bankCountryKey;
  @override
  @JsonKey(name: 'bankAccountNumber', defaultValue: '')
  String get bankAccountNumber;
  @override
  @JsonKey(name: 'bankName', defaultValue: '')
  String get bankName;
  @override
  @JsonKey(name: 'paymentCardID', defaultValue: '')
  String get paymentCardID;
  @override
  @JsonKey(name: 'paymentCardNumber', defaultValue: '')
  String get paymentCardNumber;
  @override
  @JsonKey(name: 'paymentCardHolderName', defaultValue: '')
  String get paymentCardHolderName;
  @override
  @JsonKey(name: 'paymentCardMaskedNumber', defaultValue: '')
  String get paymentCardMaskedNumber;
  @override
  @JsonKey(name: 'paymentCardTypeName', defaultValue: '')
  String get paymentCardTypeName;
  @override
  @JsonKey(name: 'customId', defaultValue: '')
  String get customId;
  @override
  @JsonKey(name: 'bankIdentification', defaultValue: '')
  String get bankIdentification;
  @override
  @JsonKey(
      name: 'createdDate',
      defaultValue: '',
      readValue: JsonReadValueHelper.createdAtDate)
  String get createdDate;
  @override
  @JsonKey(name: 'zzAdvice', defaultValue: '')
  String get zzAdvice;
  @override
  @JsonKey(name: 'adviceExpiry', defaultValue: '')
  String get adviceExpiry;
  @override
  @JsonKey(name: 'accountingDocExternalReference', defaultValue: '')
  String get accountingDocExternalReference;
  @override
  @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
  String get paymentBatchAdditionalInfo;
  @override
  Map<String, dynamic> get filterBy;
  @override
  @JsonKey(ignore: true)
  _$$PaymentSummaryDetailsDtoImplCopyWith<_$PaymentSummaryDetailsDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

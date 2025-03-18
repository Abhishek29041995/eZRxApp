// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_invoice_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerInvoiceDto _$CustomerInvoiceDtoFromJson(Map<String, dynamic> json) {
  return _CustomerInvoiceDto.fromJson(json);
}

/// @nodoc
mixin _$CustomerInvoiceDto {
  @JsonKey(name: 'accountingDocExternalReference', defaultValue: '')
  String get accountingDocExternalReference =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'accountingDocument', defaultValue: '')
  String get accountingDocument => throw _privateConstructorUsedError;
  @JsonKey(name: 'bpCustomerNumber')
  String get bpCustomerNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'debitCreditFlag', defaultValue: '')
  String get debitCreditFlag => throw _privateConstructorUsedError;
  @JsonKey(name: 'discountAmount', defaultValue: '')
  String get discountAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'discountDate', defaultValue: '')
  String get discountDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'displayAmount', defaultValue: '')
  String get displayAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'displayCurrency', defaultValue: '')
  String get displayCurrency => throw _privateConstructorUsedError;
  @JsonKey(name: 'displayOpenAmount', defaultValue: '')
  String get displayOpenAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'dueDate', defaultValue: '')
  String get dueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'fiscalYear', defaultValue: '')
  String get fiscalYear => throw _privateConstructorUsedError;
  @JsonKey(name: 'isDisputed', defaultValue: '')
  String get isDisputed => throw _privateConstructorUsedError;
  @JsonKey(name: 'lineItemNumber', defaultValue: '')
  String get lineItemNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'lineNumber', defaultValue: '')
  String get lineNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'partialPaymentHistoryDesc', defaultValue: '')
  String get partialPaymentHistoryDesc => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentAmount', defaultValue: '')
  String get paymentAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'salesOrg', defaultValue: '')
  String get salesOrg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerInvoiceDtoCopyWith<CustomerInvoiceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerInvoiceDtoCopyWith<$Res> {
  factory $CustomerInvoiceDtoCopyWith(
          CustomerInvoiceDto value, $Res Function(CustomerInvoiceDto) then) =
      _$CustomerInvoiceDtoCopyWithImpl<$Res, CustomerInvoiceDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'accountingDocExternalReference', defaultValue: '')
      String accountingDocExternalReference,
      @JsonKey(name: 'accountingDocument', defaultValue: '')
      String accountingDocument,
      @JsonKey(name: 'bpCustomerNumber') String bpCustomerNumber,
      @JsonKey(name: 'debitCreditFlag', defaultValue: '')
      String debitCreditFlag,
      @JsonKey(name: 'discountAmount', defaultValue: '') String discountAmount,
      @JsonKey(name: 'discountDate', defaultValue: '') String discountDate,
      @JsonKey(name: 'displayAmount', defaultValue: '') String displayAmount,
      @JsonKey(name: 'displayCurrency', defaultValue: '')
      String displayCurrency,
      @JsonKey(name: 'displayOpenAmount', defaultValue: '')
      String displayOpenAmount,
      @JsonKey(name: 'dueDate', defaultValue: '') String dueDate,
      @JsonKey(name: 'fiscalYear', defaultValue: '') String fiscalYear,
      @JsonKey(name: 'isDisputed', defaultValue: '') String isDisputed,
      @JsonKey(name: 'lineItemNumber', defaultValue: '') String lineItemNumber,
      @JsonKey(name: 'lineNumber', defaultValue: '') String lineNumber,
      @JsonKey(name: 'partialPaymentHistoryDesc', defaultValue: '')
      String partialPaymentHistoryDesc,
      @JsonKey(name: 'paymentAmount', defaultValue: '') String paymentAmount,
      @JsonKey(name: 'salesOrg', defaultValue: '') String salesOrg});
}

/// @nodoc
class _$CustomerInvoiceDtoCopyWithImpl<$Res, $Val extends CustomerInvoiceDto>
    implements $CustomerInvoiceDtoCopyWith<$Res> {
  _$CustomerInvoiceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountingDocExternalReference = null,
    Object? accountingDocument = null,
    Object? bpCustomerNumber = null,
    Object? debitCreditFlag = null,
    Object? discountAmount = null,
    Object? discountDate = null,
    Object? displayAmount = null,
    Object? displayCurrency = null,
    Object? displayOpenAmount = null,
    Object? dueDate = null,
    Object? fiscalYear = null,
    Object? isDisputed = null,
    Object? lineItemNumber = null,
    Object? lineNumber = null,
    Object? partialPaymentHistoryDesc = null,
    Object? paymentAmount = null,
    Object? salesOrg = null,
  }) {
    return _then(_value.copyWith(
      accountingDocExternalReference: null == accountingDocExternalReference
          ? _value.accountingDocExternalReference
          : accountingDocExternalReference // ignore: cast_nullable_to_non_nullable
              as String,
      accountingDocument: null == accountingDocument
          ? _value.accountingDocument
          : accountingDocument // ignore: cast_nullable_to_non_nullable
              as String,
      bpCustomerNumber: null == bpCustomerNumber
          ? _value.bpCustomerNumber
          : bpCustomerNumber // ignore: cast_nullable_to_non_nullable
              as String,
      debitCreditFlag: null == debitCreditFlag
          ? _value.debitCreditFlag
          : debitCreditFlag // ignore: cast_nullable_to_non_nullable
              as String,
      discountAmount: null == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as String,
      discountDate: null == discountDate
          ? _value.discountDate
          : discountDate // ignore: cast_nullable_to_non_nullable
              as String,
      displayAmount: null == displayAmount
          ? _value.displayAmount
          : displayAmount // ignore: cast_nullable_to_non_nullable
              as String,
      displayCurrency: null == displayCurrency
          ? _value.displayCurrency
          : displayCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      displayOpenAmount: null == displayOpenAmount
          ? _value.displayOpenAmount
          : displayOpenAmount // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String,
      fiscalYear: null == fiscalYear
          ? _value.fiscalYear
          : fiscalYear // ignore: cast_nullable_to_non_nullable
              as String,
      isDisputed: null == isDisputed
          ? _value.isDisputed
          : isDisputed // ignore: cast_nullable_to_non_nullable
              as String,
      lineItemNumber: null == lineItemNumber
          ? _value.lineItemNumber
          : lineItemNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lineNumber: null == lineNumber
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as String,
      partialPaymentHistoryDesc: null == partialPaymentHistoryDesc
          ? _value.partialPaymentHistoryDesc
          : partialPaymentHistoryDesc // ignore: cast_nullable_to_non_nullable
              as String,
      paymentAmount: null == paymentAmount
          ? _value.paymentAmount
          : paymentAmount // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerInvoiceDtoImplCopyWith<$Res>
    implements $CustomerInvoiceDtoCopyWith<$Res> {
  factory _$$CustomerInvoiceDtoImplCopyWith(_$CustomerInvoiceDtoImpl value,
          $Res Function(_$CustomerInvoiceDtoImpl) then) =
      __$$CustomerInvoiceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'accountingDocExternalReference', defaultValue: '')
      String accountingDocExternalReference,
      @JsonKey(name: 'accountingDocument', defaultValue: '')
      String accountingDocument,
      @JsonKey(name: 'bpCustomerNumber') String bpCustomerNumber,
      @JsonKey(name: 'debitCreditFlag', defaultValue: '')
      String debitCreditFlag,
      @JsonKey(name: 'discountAmount', defaultValue: '') String discountAmount,
      @JsonKey(name: 'discountDate', defaultValue: '') String discountDate,
      @JsonKey(name: 'displayAmount', defaultValue: '') String displayAmount,
      @JsonKey(name: 'displayCurrency', defaultValue: '')
      String displayCurrency,
      @JsonKey(name: 'displayOpenAmount', defaultValue: '')
      String displayOpenAmount,
      @JsonKey(name: 'dueDate', defaultValue: '') String dueDate,
      @JsonKey(name: 'fiscalYear', defaultValue: '') String fiscalYear,
      @JsonKey(name: 'isDisputed', defaultValue: '') String isDisputed,
      @JsonKey(name: 'lineItemNumber', defaultValue: '') String lineItemNumber,
      @JsonKey(name: 'lineNumber', defaultValue: '') String lineNumber,
      @JsonKey(name: 'partialPaymentHistoryDesc', defaultValue: '')
      String partialPaymentHistoryDesc,
      @JsonKey(name: 'paymentAmount', defaultValue: '') String paymentAmount,
      @JsonKey(name: 'salesOrg', defaultValue: '') String salesOrg});
}

/// @nodoc
class __$$CustomerInvoiceDtoImplCopyWithImpl<$Res>
    extends _$CustomerInvoiceDtoCopyWithImpl<$Res, _$CustomerInvoiceDtoImpl>
    implements _$$CustomerInvoiceDtoImplCopyWith<$Res> {
  __$$CustomerInvoiceDtoImplCopyWithImpl(_$CustomerInvoiceDtoImpl _value,
      $Res Function(_$CustomerInvoiceDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountingDocExternalReference = null,
    Object? accountingDocument = null,
    Object? bpCustomerNumber = null,
    Object? debitCreditFlag = null,
    Object? discountAmount = null,
    Object? discountDate = null,
    Object? displayAmount = null,
    Object? displayCurrency = null,
    Object? displayOpenAmount = null,
    Object? dueDate = null,
    Object? fiscalYear = null,
    Object? isDisputed = null,
    Object? lineItemNumber = null,
    Object? lineNumber = null,
    Object? partialPaymentHistoryDesc = null,
    Object? paymentAmount = null,
    Object? salesOrg = null,
  }) {
    return _then(_$CustomerInvoiceDtoImpl(
      accountingDocExternalReference: null == accountingDocExternalReference
          ? _value.accountingDocExternalReference
          : accountingDocExternalReference // ignore: cast_nullable_to_non_nullable
              as String,
      accountingDocument: null == accountingDocument
          ? _value.accountingDocument
          : accountingDocument // ignore: cast_nullable_to_non_nullable
              as String,
      bpCustomerNumber: null == bpCustomerNumber
          ? _value.bpCustomerNumber
          : bpCustomerNumber // ignore: cast_nullable_to_non_nullable
              as String,
      debitCreditFlag: null == debitCreditFlag
          ? _value.debitCreditFlag
          : debitCreditFlag // ignore: cast_nullable_to_non_nullable
              as String,
      discountAmount: null == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as String,
      discountDate: null == discountDate
          ? _value.discountDate
          : discountDate // ignore: cast_nullable_to_non_nullable
              as String,
      displayAmount: null == displayAmount
          ? _value.displayAmount
          : displayAmount // ignore: cast_nullable_to_non_nullable
              as String,
      displayCurrency: null == displayCurrency
          ? _value.displayCurrency
          : displayCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      displayOpenAmount: null == displayOpenAmount
          ? _value.displayOpenAmount
          : displayOpenAmount // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String,
      fiscalYear: null == fiscalYear
          ? _value.fiscalYear
          : fiscalYear // ignore: cast_nullable_to_non_nullable
              as String,
      isDisputed: null == isDisputed
          ? _value.isDisputed
          : isDisputed // ignore: cast_nullable_to_non_nullable
              as String,
      lineItemNumber: null == lineItemNumber
          ? _value.lineItemNumber
          : lineItemNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lineNumber: null == lineNumber
          ? _value.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as String,
      partialPaymentHistoryDesc: null == partialPaymentHistoryDesc
          ? _value.partialPaymentHistoryDesc
          : partialPaymentHistoryDesc // ignore: cast_nullable_to_non_nullable
              as String,
      paymentAmount: null == paymentAmount
          ? _value.paymentAmount
          : paymentAmount // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerInvoiceDtoImpl extends _CustomerInvoiceDto {
  const _$CustomerInvoiceDtoImpl(
      {@JsonKey(name: 'accountingDocExternalReference', defaultValue: '')
      required this.accountingDocExternalReference,
      @JsonKey(name: 'accountingDocument', defaultValue: '')
      required this.accountingDocument,
      @JsonKey(name: 'bpCustomerNumber') required this.bpCustomerNumber,
      @JsonKey(name: 'debitCreditFlag', defaultValue: '')
      required this.debitCreditFlag,
      @JsonKey(name: 'discountAmount', defaultValue: '')
      required this.discountAmount,
      @JsonKey(name: 'discountDate', defaultValue: '')
      required this.discountDate,
      @JsonKey(name: 'displayAmount', defaultValue: '')
      required this.displayAmount,
      @JsonKey(name: 'displayCurrency', defaultValue: '')
      required this.displayCurrency,
      @JsonKey(name: 'displayOpenAmount', defaultValue: '')
      required this.displayOpenAmount,
      @JsonKey(name: 'dueDate', defaultValue: '') required this.dueDate,
      @JsonKey(name: 'fiscalYear', defaultValue: '') required this.fiscalYear,
      @JsonKey(name: 'isDisputed', defaultValue: '') required this.isDisputed,
      @JsonKey(name: 'lineItemNumber', defaultValue: '')
      required this.lineItemNumber,
      @JsonKey(name: 'lineNumber', defaultValue: '') required this.lineNumber,
      @JsonKey(name: 'partialPaymentHistoryDesc', defaultValue: '')
      required this.partialPaymentHistoryDesc,
      @JsonKey(name: 'paymentAmount', defaultValue: '')
      required this.paymentAmount,
      @JsonKey(name: 'salesOrg', defaultValue: '') required this.salesOrg})
      : super._();

  factory _$CustomerInvoiceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerInvoiceDtoImplFromJson(json);

  @override
  @JsonKey(name: 'accountingDocExternalReference', defaultValue: '')
  final String accountingDocExternalReference;
  @override
  @JsonKey(name: 'accountingDocument', defaultValue: '')
  final String accountingDocument;
  @override
  @JsonKey(name: 'bpCustomerNumber')
  final String bpCustomerNumber;
  @override
  @JsonKey(name: 'debitCreditFlag', defaultValue: '')
  final String debitCreditFlag;
  @override
  @JsonKey(name: 'discountAmount', defaultValue: '')
  final String discountAmount;
  @override
  @JsonKey(name: 'discountDate', defaultValue: '')
  final String discountDate;
  @override
  @JsonKey(name: 'displayAmount', defaultValue: '')
  final String displayAmount;
  @override
  @JsonKey(name: 'displayCurrency', defaultValue: '')
  final String displayCurrency;
  @override
  @JsonKey(name: 'displayOpenAmount', defaultValue: '')
  final String displayOpenAmount;
  @override
  @JsonKey(name: 'dueDate', defaultValue: '')
  final String dueDate;
  @override
  @JsonKey(name: 'fiscalYear', defaultValue: '')
  final String fiscalYear;
  @override
  @JsonKey(name: 'isDisputed', defaultValue: '')
  final String isDisputed;
  @override
  @JsonKey(name: 'lineItemNumber', defaultValue: '')
  final String lineItemNumber;
  @override
  @JsonKey(name: 'lineNumber', defaultValue: '')
  final String lineNumber;
  @override
  @JsonKey(name: 'partialPaymentHistoryDesc', defaultValue: '')
  final String partialPaymentHistoryDesc;
  @override
  @JsonKey(name: 'paymentAmount', defaultValue: '')
  final String paymentAmount;
  @override
  @JsonKey(name: 'salesOrg', defaultValue: '')
  final String salesOrg;

  @override
  String toString() {
    return 'CustomerInvoiceDto(accountingDocExternalReference: $accountingDocExternalReference, accountingDocument: $accountingDocument, bpCustomerNumber: $bpCustomerNumber, debitCreditFlag: $debitCreditFlag, discountAmount: $discountAmount, discountDate: $discountDate, displayAmount: $displayAmount, displayCurrency: $displayCurrency, displayOpenAmount: $displayOpenAmount, dueDate: $dueDate, fiscalYear: $fiscalYear, isDisputed: $isDisputed, lineItemNumber: $lineItemNumber, lineNumber: $lineNumber, partialPaymentHistoryDesc: $partialPaymentHistoryDesc, paymentAmount: $paymentAmount, salesOrg: $salesOrg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerInvoiceDtoImpl &&
            (identical(other.accountingDocExternalReference,
                    accountingDocExternalReference) ||
                other.accountingDocExternalReference ==
                    accountingDocExternalReference) &&
            (identical(other.accountingDocument, accountingDocument) ||
                other.accountingDocument == accountingDocument) &&
            (identical(other.bpCustomerNumber, bpCustomerNumber) ||
                other.bpCustomerNumber == bpCustomerNumber) &&
            (identical(other.debitCreditFlag, debitCreditFlag) ||
                other.debitCreditFlag == debitCreditFlag) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.discountDate, discountDate) ||
                other.discountDate == discountDate) &&
            (identical(other.displayAmount, displayAmount) ||
                other.displayAmount == displayAmount) &&
            (identical(other.displayCurrency, displayCurrency) ||
                other.displayCurrency == displayCurrency) &&
            (identical(other.displayOpenAmount, displayOpenAmount) ||
                other.displayOpenAmount == displayOpenAmount) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.fiscalYear, fiscalYear) ||
                other.fiscalYear == fiscalYear) &&
            (identical(other.isDisputed, isDisputed) ||
                other.isDisputed == isDisputed) &&
            (identical(other.lineItemNumber, lineItemNumber) ||
                other.lineItemNumber == lineItemNumber) &&
            (identical(other.lineNumber, lineNumber) ||
                other.lineNumber == lineNumber) &&
            (identical(other.partialPaymentHistoryDesc,
                    partialPaymentHistoryDesc) ||
                other.partialPaymentHistoryDesc == partialPaymentHistoryDesc) &&
            (identical(other.paymentAmount, paymentAmount) ||
                other.paymentAmount == paymentAmount) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      accountingDocExternalReference,
      accountingDocument,
      bpCustomerNumber,
      debitCreditFlag,
      discountAmount,
      discountDate,
      displayAmount,
      displayCurrency,
      displayOpenAmount,
      dueDate,
      fiscalYear,
      isDisputed,
      lineItemNumber,
      lineNumber,
      partialPaymentHistoryDesc,
      paymentAmount,
      salesOrg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerInvoiceDtoImplCopyWith<_$CustomerInvoiceDtoImpl> get copyWith =>
      __$$CustomerInvoiceDtoImplCopyWithImpl<_$CustomerInvoiceDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerInvoiceDtoImplToJson(
      this,
    );
  }
}

abstract class _CustomerInvoiceDto extends CustomerInvoiceDto {
  const factory _CustomerInvoiceDto(
      {@JsonKey(name: 'accountingDocExternalReference', defaultValue: '')
      required final String accountingDocExternalReference,
      @JsonKey(name: 'accountingDocument', defaultValue: '')
      required final String accountingDocument,
      @JsonKey(name: 'bpCustomerNumber') required final String bpCustomerNumber,
      @JsonKey(name: 'debitCreditFlag', defaultValue: '')
      required final String debitCreditFlag,
      @JsonKey(name: 'discountAmount', defaultValue: '')
      required final String discountAmount,
      @JsonKey(name: 'discountDate', defaultValue: '')
      required final String discountDate,
      @JsonKey(name: 'displayAmount', defaultValue: '')
      required final String displayAmount,
      @JsonKey(name: 'displayCurrency', defaultValue: '')
      required final String displayCurrency,
      @JsonKey(name: 'displayOpenAmount', defaultValue: '')
      required final String displayOpenAmount,
      @JsonKey(name: 'dueDate', defaultValue: '') required final String dueDate,
      @JsonKey(name: 'fiscalYear', defaultValue: '')
      required final String fiscalYear,
      @JsonKey(name: 'isDisputed', defaultValue: '')
      required final String isDisputed,
      @JsonKey(name: 'lineItemNumber', defaultValue: '')
      required final String lineItemNumber,
      @JsonKey(name: 'lineNumber', defaultValue: '')
      required final String lineNumber,
      @JsonKey(name: 'partialPaymentHistoryDesc', defaultValue: '')
      required final String partialPaymentHistoryDesc,
      @JsonKey(name: 'paymentAmount', defaultValue: '')
      required final String paymentAmount,
      @JsonKey(name: 'salesOrg', defaultValue: '')
      required final String salesOrg}) = _$CustomerInvoiceDtoImpl;
  const _CustomerInvoiceDto._() : super._();

  factory _CustomerInvoiceDto.fromJson(Map<String, dynamic> json) =
      _$CustomerInvoiceDtoImpl.fromJson;

  @override
  @JsonKey(name: 'accountingDocExternalReference', defaultValue: '')
  String get accountingDocExternalReference;
  @override
  @JsonKey(name: 'accountingDocument', defaultValue: '')
  String get accountingDocument;
  @override
  @JsonKey(name: 'bpCustomerNumber')
  String get bpCustomerNumber;
  @override
  @JsonKey(name: 'debitCreditFlag', defaultValue: '')
  String get debitCreditFlag;
  @override
  @JsonKey(name: 'discountAmount', defaultValue: '')
  String get discountAmount;
  @override
  @JsonKey(name: 'discountDate', defaultValue: '')
  String get discountDate;
  @override
  @JsonKey(name: 'displayAmount', defaultValue: '')
  String get displayAmount;
  @override
  @JsonKey(name: 'displayCurrency', defaultValue: '')
  String get displayCurrency;
  @override
  @JsonKey(name: 'displayOpenAmount', defaultValue: '')
  String get displayOpenAmount;
  @override
  @JsonKey(name: 'dueDate', defaultValue: '')
  String get dueDate;
  @override
  @JsonKey(name: 'fiscalYear', defaultValue: '')
  String get fiscalYear;
  @override
  @JsonKey(name: 'isDisputed', defaultValue: '')
  String get isDisputed;
  @override
  @JsonKey(name: 'lineItemNumber', defaultValue: '')
  String get lineItemNumber;
  @override
  @JsonKey(name: 'lineNumber', defaultValue: '')
  String get lineNumber;
  @override
  @JsonKey(name: 'partialPaymentHistoryDesc', defaultValue: '')
  String get partialPaymentHistoryDesc;
  @override
  @JsonKey(name: 'paymentAmount', defaultValue: '')
  String get paymentAmount;
  @override
  @JsonKey(name: 'salesOrg', defaultValue: '')
  String get salesOrg;
  @override
  @JsonKey(ignore: true)
  _$$CustomerInvoiceDtoImplCopyWith<_$CustomerInvoiceDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

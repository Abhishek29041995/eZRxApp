// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_invoice_info_pdf_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentInvoiceInfoPdfDto _$PaymentInvoiceInfoPdfDtoFromJson(
    Map<String, dynamic> json) {
  return _PaymentInvoiceInfoPdfDto.fromJson(json);
}

/// @nodoc
mixin _$PaymentInvoiceInfoPdfDto {
  @JsonKey(name: 'valueDate', defaultValue: '')
  String get valueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentID', defaultValue: '')
  String get paymentID => throw _privateConstructorUsedError;
  @JsonKey(name: 'zzAdvice', defaultValue: '')
  String get zzAdvice => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentDue', defaultValue: '')
  String get paymentDue => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentMethod', defaultValue: '')
  String get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'customerName', defaultValue: '')
  String get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'payer', defaultValue: '')
  String get payer => throw _privateConstructorUsedError;
  @JsonKey(name: 'bankBeneficiary', defaultValue: <PaymentItemDto>[])
  List<BankBeneficiaryInvoiceDto> get bankBeneficiary =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'qrCode', defaultValue: '')
  String get qrCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
  String get paymentBatchAdditionalInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentItems', defaultValue: <PaymentItemDto>[])
  List<PaymentItemDto> get paymentItems => throw _privateConstructorUsedError;
  @JsonKey(name: 'salesDistrict', defaultValue: '')
  String get salesDistrict => throw _privateConstructorUsedError;
  @JsonKey(name: 'footer', defaultValue: '')
  String get footer => throw _privateConstructorUsedError;
  @JsonKey(name: 'headerLogoPath', defaultValue: '')
  String get headerLogoPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'pleaseNote', defaultValue: '')
  String get pleaseNote => throw _privateConstructorUsedError;
  @JsonKey(name: 'header', defaultValue: '')
  String get header => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentInvoiceInfoPdfDtoCopyWith<PaymentInvoiceInfoPdfDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentInvoiceInfoPdfDtoCopyWith<$Res> {
  factory $PaymentInvoiceInfoPdfDtoCopyWith(PaymentInvoiceInfoPdfDto value,
          $Res Function(PaymentInvoiceInfoPdfDto) then) =
      _$PaymentInvoiceInfoPdfDtoCopyWithImpl<$Res, PaymentInvoiceInfoPdfDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'valueDate', defaultValue: '') String valueDate,
      @JsonKey(name: 'paymentID', defaultValue: '') String paymentID,
      @JsonKey(name: 'zzAdvice', defaultValue: '') String zzAdvice,
      @JsonKey(name: 'paymentDue', defaultValue: '') String paymentDue,
      @JsonKey(name: 'paymentMethod', defaultValue: '') String paymentMethod,
      @JsonKey(name: 'customerName', defaultValue: '') String customerName,
      @JsonKey(name: 'payer', defaultValue: '') String payer,
      @JsonKey(name: 'bankBeneficiary', defaultValue: <PaymentItemDto>[])
      List<BankBeneficiaryInvoiceDto> bankBeneficiary,
      @JsonKey(name: 'qrCode', defaultValue: '') String qrCode,
      @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
      String paymentBatchAdditionalInfo,
      @JsonKey(name: 'paymentItems', defaultValue: <PaymentItemDto>[])
      List<PaymentItemDto> paymentItems,
      @JsonKey(name: 'salesDistrict', defaultValue: '') String salesDistrict,
      @JsonKey(name: 'footer', defaultValue: '') String footer,
      @JsonKey(name: 'headerLogoPath', defaultValue: '') String headerLogoPath,
      @JsonKey(name: 'pleaseNote', defaultValue: '') String pleaseNote,
      @JsonKey(name: 'header', defaultValue: '') String header});
}

/// @nodoc
class _$PaymentInvoiceInfoPdfDtoCopyWithImpl<$Res,
        $Val extends PaymentInvoiceInfoPdfDto>
    implements $PaymentInvoiceInfoPdfDtoCopyWith<$Res> {
  _$PaymentInvoiceInfoPdfDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valueDate = null,
    Object? paymentID = null,
    Object? zzAdvice = null,
    Object? paymentDue = null,
    Object? paymentMethod = null,
    Object? customerName = null,
    Object? payer = null,
    Object? bankBeneficiary = null,
    Object? qrCode = null,
    Object? paymentBatchAdditionalInfo = null,
    Object? paymentItems = null,
    Object? salesDistrict = null,
    Object? footer = null,
    Object? headerLogoPath = null,
    Object? pleaseNote = null,
    Object? header = null,
  }) {
    return _then(_value.copyWith(
      valueDate: null == valueDate
          ? _value.valueDate
          : valueDate // ignore: cast_nullable_to_non_nullable
              as String,
      paymentID: null == paymentID
          ? _value.paymentID
          : paymentID // ignore: cast_nullable_to_non_nullable
              as String,
      zzAdvice: null == zzAdvice
          ? _value.zzAdvice
          : zzAdvice // ignore: cast_nullable_to_non_nullable
              as String,
      paymentDue: null == paymentDue
          ? _value.paymentDue
          : paymentDue // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      payer: null == payer
          ? _value.payer
          : payer // ignore: cast_nullable_to_non_nullable
              as String,
      bankBeneficiary: null == bankBeneficiary
          ? _value.bankBeneficiary
          : bankBeneficiary // ignore: cast_nullable_to_non_nullable
              as List<BankBeneficiaryInvoiceDto>,
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
      paymentBatchAdditionalInfo: null == paymentBatchAdditionalInfo
          ? _value.paymentBatchAdditionalInfo
          : paymentBatchAdditionalInfo // ignore: cast_nullable_to_non_nullable
              as String,
      paymentItems: null == paymentItems
          ? _value.paymentItems
          : paymentItems // ignore: cast_nullable_to_non_nullable
              as List<PaymentItemDto>,
      salesDistrict: null == salesDistrict
          ? _value.salesDistrict
          : salesDistrict // ignore: cast_nullable_to_non_nullable
              as String,
      footer: null == footer
          ? _value.footer
          : footer // ignore: cast_nullable_to_non_nullable
              as String,
      headerLogoPath: null == headerLogoPath
          ? _value.headerLogoPath
          : headerLogoPath // ignore: cast_nullable_to_non_nullable
              as String,
      pleaseNote: null == pleaseNote
          ? _value.pleaseNote
          : pleaseNote // ignore: cast_nullable_to_non_nullable
              as String,
      header: null == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentInvoiceInfoPdfDtoImplCopyWith<$Res>
    implements $PaymentInvoiceInfoPdfDtoCopyWith<$Res> {
  factory _$$PaymentInvoiceInfoPdfDtoImplCopyWith(
          _$PaymentInvoiceInfoPdfDtoImpl value,
          $Res Function(_$PaymentInvoiceInfoPdfDtoImpl) then) =
      __$$PaymentInvoiceInfoPdfDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'valueDate', defaultValue: '') String valueDate,
      @JsonKey(name: 'paymentID', defaultValue: '') String paymentID,
      @JsonKey(name: 'zzAdvice', defaultValue: '') String zzAdvice,
      @JsonKey(name: 'paymentDue', defaultValue: '') String paymentDue,
      @JsonKey(name: 'paymentMethod', defaultValue: '') String paymentMethod,
      @JsonKey(name: 'customerName', defaultValue: '') String customerName,
      @JsonKey(name: 'payer', defaultValue: '') String payer,
      @JsonKey(name: 'bankBeneficiary', defaultValue: <PaymentItemDto>[])
      List<BankBeneficiaryInvoiceDto> bankBeneficiary,
      @JsonKey(name: 'qrCode', defaultValue: '') String qrCode,
      @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
      String paymentBatchAdditionalInfo,
      @JsonKey(name: 'paymentItems', defaultValue: <PaymentItemDto>[])
      List<PaymentItemDto> paymentItems,
      @JsonKey(name: 'salesDistrict', defaultValue: '') String salesDistrict,
      @JsonKey(name: 'footer', defaultValue: '') String footer,
      @JsonKey(name: 'headerLogoPath', defaultValue: '') String headerLogoPath,
      @JsonKey(name: 'pleaseNote', defaultValue: '') String pleaseNote,
      @JsonKey(name: 'header', defaultValue: '') String header});
}

/// @nodoc
class __$$PaymentInvoiceInfoPdfDtoImplCopyWithImpl<$Res>
    extends _$PaymentInvoiceInfoPdfDtoCopyWithImpl<$Res,
        _$PaymentInvoiceInfoPdfDtoImpl>
    implements _$$PaymentInvoiceInfoPdfDtoImplCopyWith<$Res> {
  __$$PaymentInvoiceInfoPdfDtoImplCopyWithImpl(
      _$PaymentInvoiceInfoPdfDtoImpl _value,
      $Res Function(_$PaymentInvoiceInfoPdfDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? valueDate = null,
    Object? paymentID = null,
    Object? zzAdvice = null,
    Object? paymentDue = null,
    Object? paymentMethod = null,
    Object? customerName = null,
    Object? payer = null,
    Object? bankBeneficiary = null,
    Object? qrCode = null,
    Object? paymentBatchAdditionalInfo = null,
    Object? paymentItems = null,
    Object? salesDistrict = null,
    Object? footer = null,
    Object? headerLogoPath = null,
    Object? pleaseNote = null,
    Object? header = null,
  }) {
    return _then(_$PaymentInvoiceInfoPdfDtoImpl(
      valueDate: null == valueDate
          ? _value.valueDate
          : valueDate // ignore: cast_nullable_to_non_nullable
              as String,
      paymentID: null == paymentID
          ? _value.paymentID
          : paymentID // ignore: cast_nullable_to_non_nullable
              as String,
      zzAdvice: null == zzAdvice
          ? _value.zzAdvice
          : zzAdvice // ignore: cast_nullable_to_non_nullable
              as String,
      paymentDue: null == paymentDue
          ? _value.paymentDue
          : paymentDue // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      payer: null == payer
          ? _value.payer
          : payer // ignore: cast_nullable_to_non_nullable
              as String,
      bankBeneficiary: null == bankBeneficiary
          ? _value._bankBeneficiary
          : bankBeneficiary // ignore: cast_nullable_to_non_nullable
              as List<BankBeneficiaryInvoiceDto>,
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
      paymentBatchAdditionalInfo: null == paymentBatchAdditionalInfo
          ? _value.paymentBatchAdditionalInfo
          : paymentBatchAdditionalInfo // ignore: cast_nullable_to_non_nullable
              as String,
      paymentItems: null == paymentItems
          ? _value._paymentItems
          : paymentItems // ignore: cast_nullable_to_non_nullable
              as List<PaymentItemDto>,
      salesDistrict: null == salesDistrict
          ? _value.salesDistrict
          : salesDistrict // ignore: cast_nullable_to_non_nullable
              as String,
      footer: null == footer
          ? _value.footer
          : footer // ignore: cast_nullable_to_non_nullable
              as String,
      headerLogoPath: null == headerLogoPath
          ? _value.headerLogoPath
          : headerLogoPath // ignore: cast_nullable_to_non_nullable
              as String,
      pleaseNote: null == pleaseNote
          ? _value.pleaseNote
          : pleaseNote // ignore: cast_nullable_to_non_nullable
              as String,
      header: null == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentInvoiceInfoPdfDtoImpl extends _PaymentInvoiceInfoPdfDto {
  const _$PaymentInvoiceInfoPdfDtoImpl(
      {@JsonKey(name: 'valueDate', defaultValue: '') required this.valueDate,
      @JsonKey(name: 'paymentID', defaultValue: '') required this.paymentID,
      @JsonKey(name: 'zzAdvice', defaultValue: '') required this.zzAdvice,
      @JsonKey(name: 'paymentDue', defaultValue: '') required this.paymentDue,
      @JsonKey(name: 'paymentMethod', defaultValue: '')
      required this.paymentMethod,
      @JsonKey(name: 'customerName', defaultValue: '')
      required this.customerName,
      @JsonKey(name: 'payer', defaultValue: '') required this.payer,
      @JsonKey(name: 'bankBeneficiary', defaultValue: <PaymentItemDto>[])
      required final List<BankBeneficiaryInvoiceDto> bankBeneficiary,
      @JsonKey(name: 'qrCode', defaultValue: '') required this.qrCode,
      @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
      required this.paymentBatchAdditionalInfo,
      @JsonKey(name: 'paymentItems', defaultValue: <PaymentItemDto>[])
      required final List<PaymentItemDto> paymentItems,
      @JsonKey(name: 'salesDistrict', defaultValue: '')
      required this.salesDistrict,
      @JsonKey(name: 'footer', defaultValue: '') required this.footer,
      @JsonKey(name: 'headerLogoPath', defaultValue: '')
      required this.headerLogoPath,
      @JsonKey(name: 'pleaseNote', defaultValue: '') required this.pleaseNote,
      @JsonKey(name: 'header', defaultValue: '') required this.header})
      : _bankBeneficiary = bankBeneficiary,
        _paymentItems = paymentItems,
        super._();

  factory _$PaymentInvoiceInfoPdfDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentInvoiceInfoPdfDtoImplFromJson(json);

  @override
  @JsonKey(name: 'valueDate', defaultValue: '')
  final String valueDate;
  @override
  @JsonKey(name: 'paymentID', defaultValue: '')
  final String paymentID;
  @override
  @JsonKey(name: 'zzAdvice', defaultValue: '')
  final String zzAdvice;
  @override
  @JsonKey(name: 'paymentDue', defaultValue: '')
  final String paymentDue;
  @override
  @JsonKey(name: 'paymentMethod', defaultValue: '')
  final String paymentMethod;
  @override
  @JsonKey(name: 'customerName', defaultValue: '')
  final String customerName;
  @override
  @JsonKey(name: 'payer', defaultValue: '')
  final String payer;
  final List<BankBeneficiaryInvoiceDto> _bankBeneficiary;
  @override
  @JsonKey(name: 'bankBeneficiary', defaultValue: <PaymentItemDto>[])
  List<BankBeneficiaryInvoiceDto> get bankBeneficiary {
    if (_bankBeneficiary is EqualUnmodifiableListView) return _bankBeneficiary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bankBeneficiary);
  }

  @override
  @JsonKey(name: 'qrCode', defaultValue: '')
  final String qrCode;
  @override
  @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
  final String paymentBatchAdditionalInfo;
  final List<PaymentItemDto> _paymentItems;
  @override
  @JsonKey(name: 'paymentItems', defaultValue: <PaymentItemDto>[])
  List<PaymentItemDto> get paymentItems {
    if (_paymentItems is EqualUnmodifiableListView) return _paymentItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentItems);
  }

  @override
  @JsonKey(name: 'salesDistrict', defaultValue: '')
  final String salesDistrict;
  @override
  @JsonKey(name: 'footer', defaultValue: '')
  final String footer;
  @override
  @JsonKey(name: 'headerLogoPath', defaultValue: '')
  final String headerLogoPath;
  @override
  @JsonKey(name: 'pleaseNote', defaultValue: '')
  final String pleaseNote;
  @override
  @JsonKey(name: 'header', defaultValue: '')
  final String header;

  @override
  String toString() {
    return 'PaymentInvoiceInfoPdfDto(valueDate: $valueDate, paymentID: $paymentID, zzAdvice: $zzAdvice, paymentDue: $paymentDue, paymentMethod: $paymentMethod, customerName: $customerName, payer: $payer, bankBeneficiary: $bankBeneficiary, qrCode: $qrCode, paymentBatchAdditionalInfo: $paymentBatchAdditionalInfo, paymentItems: $paymentItems, salesDistrict: $salesDistrict, footer: $footer, headerLogoPath: $headerLogoPath, pleaseNote: $pleaseNote, header: $header)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentInvoiceInfoPdfDtoImpl &&
            (identical(other.valueDate, valueDate) ||
                other.valueDate == valueDate) &&
            (identical(other.paymentID, paymentID) ||
                other.paymentID == paymentID) &&
            (identical(other.zzAdvice, zzAdvice) ||
                other.zzAdvice == zzAdvice) &&
            (identical(other.paymentDue, paymentDue) ||
                other.paymentDue == paymentDue) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.payer, payer) || other.payer == payer) &&
            const DeepCollectionEquality()
                .equals(other._bankBeneficiary, _bankBeneficiary) &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode) &&
            (identical(other.paymentBatchAdditionalInfo,
                    paymentBatchAdditionalInfo) ||
                other.paymentBatchAdditionalInfo ==
                    paymentBatchAdditionalInfo) &&
            const DeepCollectionEquality()
                .equals(other._paymentItems, _paymentItems) &&
            (identical(other.salesDistrict, salesDistrict) ||
                other.salesDistrict == salesDistrict) &&
            (identical(other.footer, footer) || other.footer == footer) &&
            (identical(other.headerLogoPath, headerLogoPath) ||
                other.headerLogoPath == headerLogoPath) &&
            (identical(other.pleaseNote, pleaseNote) ||
                other.pleaseNote == pleaseNote) &&
            (identical(other.header, header) || other.header == header));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      valueDate,
      paymentID,
      zzAdvice,
      paymentDue,
      paymentMethod,
      customerName,
      payer,
      const DeepCollectionEquality().hash(_bankBeneficiary),
      qrCode,
      paymentBatchAdditionalInfo,
      const DeepCollectionEquality().hash(_paymentItems),
      salesDistrict,
      footer,
      headerLogoPath,
      pleaseNote,
      header);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentInvoiceInfoPdfDtoImplCopyWith<_$PaymentInvoiceInfoPdfDtoImpl>
      get copyWith => __$$PaymentInvoiceInfoPdfDtoImplCopyWithImpl<
          _$PaymentInvoiceInfoPdfDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentInvoiceInfoPdfDtoImplToJson(
      this,
    );
  }
}

abstract class _PaymentInvoiceInfoPdfDto extends PaymentInvoiceInfoPdfDto {
  const factory _PaymentInvoiceInfoPdfDto(
      {@JsonKey(name: 'valueDate', defaultValue: '')
      required final String valueDate,
      @JsonKey(name: 'paymentID', defaultValue: '')
      required final String paymentID,
      @JsonKey(name: 'zzAdvice', defaultValue: '')
      required final String zzAdvice,
      @JsonKey(name: 'paymentDue', defaultValue: '')
      required final String paymentDue,
      @JsonKey(name: 'paymentMethod', defaultValue: '')
      required final String paymentMethod,
      @JsonKey(name: 'customerName', defaultValue: '')
      required final String customerName,
      @JsonKey(name: 'payer', defaultValue: '') required final String payer,
      @JsonKey(name: 'bankBeneficiary', defaultValue: <PaymentItemDto>[])
      required final List<BankBeneficiaryInvoiceDto> bankBeneficiary,
      @JsonKey(name: 'qrCode', defaultValue: '') required final String qrCode,
      @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
      required final String paymentBatchAdditionalInfo,
      @JsonKey(name: 'paymentItems', defaultValue: <PaymentItemDto>[])
      required final List<PaymentItemDto> paymentItems,
      @JsonKey(name: 'salesDistrict', defaultValue: '')
      required final String salesDistrict,
      @JsonKey(name: 'footer', defaultValue: '') required final String footer,
      @JsonKey(name: 'headerLogoPath', defaultValue: '')
      required final String headerLogoPath,
      @JsonKey(name: 'pleaseNote', defaultValue: '')
      required final String pleaseNote,
      @JsonKey(name: 'header', defaultValue: '')
      required final String header}) = _$PaymentInvoiceInfoPdfDtoImpl;
  const _PaymentInvoiceInfoPdfDto._() : super._();

  factory _PaymentInvoiceInfoPdfDto.fromJson(Map<String, dynamic> json) =
      _$PaymentInvoiceInfoPdfDtoImpl.fromJson;

  @override
  @JsonKey(name: 'valueDate', defaultValue: '')
  String get valueDate;
  @override
  @JsonKey(name: 'paymentID', defaultValue: '')
  String get paymentID;
  @override
  @JsonKey(name: 'zzAdvice', defaultValue: '')
  String get zzAdvice;
  @override
  @JsonKey(name: 'paymentDue', defaultValue: '')
  String get paymentDue;
  @override
  @JsonKey(name: 'paymentMethod', defaultValue: '')
  String get paymentMethod;
  @override
  @JsonKey(name: 'customerName', defaultValue: '')
  String get customerName;
  @override
  @JsonKey(name: 'payer', defaultValue: '')
  String get payer;
  @override
  @JsonKey(name: 'bankBeneficiary', defaultValue: <PaymentItemDto>[])
  List<BankBeneficiaryInvoiceDto> get bankBeneficiary;
  @override
  @JsonKey(name: 'qrCode', defaultValue: '')
  String get qrCode;
  @override
  @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
  String get paymentBatchAdditionalInfo;
  @override
  @JsonKey(name: 'paymentItems', defaultValue: <PaymentItemDto>[])
  List<PaymentItemDto> get paymentItems;
  @override
  @JsonKey(name: 'salesDistrict', defaultValue: '')
  String get salesDistrict;
  @override
  @JsonKey(name: 'footer', defaultValue: '')
  String get footer;
  @override
  @JsonKey(name: 'headerLogoPath', defaultValue: '')
  String get headerLogoPath;
  @override
  @JsonKey(name: 'pleaseNote', defaultValue: '')
  String get pleaseNote;
  @override
  @JsonKey(name: 'header', defaultValue: '')
  String get header;
  @override
  @JsonKey(ignore: true)
  _$$PaymentInvoiceInfoPdfDtoImplCopyWith<_$PaymentInvoiceInfoPdfDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

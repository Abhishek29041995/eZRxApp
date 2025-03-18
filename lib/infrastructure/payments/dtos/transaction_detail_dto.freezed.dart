// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionDetailDto _$TransactionDetailDtoFromJson(Map<String, dynamic> json) {
  return _TransactionDetailDto.fromJson(json);
}

/// @nodoc
mixin _$TransactionDetailDto {
  @JsonKey(name: 'id', defaultValue: '')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'reference', defaultValue: '')
  String get reference => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoices', defaultValue: <TransactionInvoiceDto>[])
  List<TransactionInvoiceDto> get invoices =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'amountPayable', defaultValue: 0.0)
  double get amountPayable => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', defaultValue: '')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentDocument', defaultValue: '')
  String get paymentDocument => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentMethodDisplay', defaultValue: '')
  String get paymentMethodDisplay => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdOn', defaultValue: '')
  String get createdOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'bankId', defaultValue: '')
  String get bankId => throw _privateConstructorUsedError;
  @JsonKey(name: 'paidOn', defaultValue: '')
  String get paidOn => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'vaName',
      defaultValue: '',
      readValue: JsonReadValueHelper.readVaName)
  String get vaName => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'vaNumber',
      defaultValue: '',
      readValue: JsonReadValueHelper.readVaNumber)
  String get vaNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionDetailDtoCopyWith<TransactionDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionDetailDtoCopyWith<$Res> {
  factory $TransactionDetailDtoCopyWith(TransactionDetailDto value,
          $Res Function(TransactionDetailDto) then) =
      _$TransactionDetailDtoCopyWithImpl<$Res, TransactionDetailDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(name: 'reference', defaultValue: '') String reference,
      @JsonKey(name: 'invoices', defaultValue: <TransactionInvoiceDto>[])
      List<TransactionInvoiceDto> invoices,
      @JsonKey(name: 'amountPayable', defaultValue: 0.0) double amountPayable,
      @JsonKey(name: 'status', defaultValue: '') String status,
      @JsonKey(name: 'paymentDocument', defaultValue: '')
      String paymentDocument,
      @JsonKey(name: 'paymentMethodDisplay', defaultValue: '')
      String paymentMethodDisplay,
      @JsonKey(name: 'createdOn', defaultValue: '') String createdOn,
      @JsonKey(name: 'bankId', defaultValue: '') String bankId,
      @JsonKey(name: 'paidOn', defaultValue: '') String paidOn,
      @JsonKey(
          name: 'vaName',
          defaultValue: '',
          readValue: JsonReadValueHelper.readVaName)
      String vaName,
      @JsonKey(
          name: 'vaNumber',
          defaultValue: '',
          readValue: JsonReadValueHelper.readVaNumber)
      String vaNumber});
}

/// @nodoc
class _$TransactionDetailDtoCopyWithImpl<$Res,
        $Val extends TransactionDetailDto>
    implements $TransactionDetailDtoCopyWith<$Res> {
  _$TransactionDetailDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reference = null,
    Object? invoices = null,
    Object? amountPayable = null,
    Object? status = null,
    Object? paymentDocument = null,
    Object? paymentMethodDisplay = null,
    Object? createdOn = null,
    Object? bankId = null,
    Object? paidOn = null,
    Object? vaName = null,
    Object? vaNumber = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      invoices: null == invoices
          ? _value.invoices
          : invoices // ignore: cast_nullable_to_non_nullable
              as List<TransactionInvoiceDto>,
      amountPayable: null == amountPayable
          ? _value.amountPayable
          : amountPayable // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paymentDocument: null == paymentDocument
          ? _value.paymentDocument
          : paymentDocument // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethodDisplay: null == paymentMethodDisplay
          ? _value.paymentMethodDisplay
          : paymentMethodDisplay // ignore: cast_nullable_to_non_nullable
              as String,
      createdOn: null == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as String,
      bankId: null == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as String,
      paidOn: null == paidOn
          ? _value.paidOn
          : paidOn // ignore: cast_nullable_to_non_nullable
              as String,
      vaName: null == vaName
          ? _value.vaName
          : vaName // ignore: cast_nullable_to_non_nullable
              as String,
      vaNumber: null == vaNumber
          ? _value.vaNumber
          : vaNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionDetailDtoImplCopyWith<$Res>
    implements $TransactionDetailDtoCopyWith<$Res> {
  factory _$$TransactionDetailDtoImplCopyWith(_$TransactionDetailDtoImpl value,
          $Res Function(_$TransactionDetailDtoImpl) then) =
      __$$TransactionDetailDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(name: 'reference', defaultValue: '') String reference,
      @JsonKey(name: 'invoices', defaultValue: <TransactionInvoiceDto>[])
      List<TransactionInvoiceDto> invoices,
      @JsonKey(name: 'amountPayable', defaultValue: 0.0) double amountPayable,
      @JsonKey(name: 'status', defaultValue: '') String status,
      @JsonKey(name: 'paymentDocument', defaultValue: '')
      String paymentDocument,
      @JsonKey(name: 'paymentMethodDisplay', defaultValue: '')
      String paymentMethodDisplay,
      @JsonKey(name: 'createdOn', defaultValue: '') String createdOn,
      @JsonKey(name: 'bankId', defaultValue: '') String bankId,
      @JsonKey(name: 'paidOn', defaultValue: '') String paidOn,
      @JsonKey(
          name: 'vaName',
          defaultValue: '',
          readValue: JsonReadValueHelper.readVaName)
      String vaName,
      @JsonKey(
          name: 'vaNumber',
          defaultValue: '',
          readValue: JsonReadValueHelper.readVaNumber)
      String vaNumber});
}

/// @nodoc
class __$$TransactionDetailDtoImplCopyWithImpl<$Res>
    extends _$TransactionDetailDtoCopyWithImpl<$Res, _$TransactionDetailDtoImpl>
    implements _$$TransactionDetailDtoImplCopyWith<$Res> {
  __$$TransactionDetailDtoImplCopyWithImpl(_$TransactionDetailDtoImpl _value,
      $Res Function(_$TransactionDetailDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reference = null,
    Object? invoices = null,
    Object? amountPayable = null,
    Object? status = null,
    Object? paymentDocument = null,
    Object? paymentMethodDisplay = null,
    Object? createdOn = null,
    Object? bankId = null,
    Object? paidOn = null,
    Object? vaName = null,
    Object? vaNumber = null,
  }) {
    return _then(_$TransactionDetailDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      invoices: null == invoices
          ? _value._invoices
          : invoices // ignore: cast_nullable_to_non_nullable
              as List<TransactionInvoiceDto>,
      amountPayable: null == amountPayable
          ? _value.amountPayable
          : amountPayable // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paymentDocument: null == paymentDocument
          ? _value.paymentDocument
          : paymentDocument // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethodDisplay: null == paymentMethodDisplay
          ? _value.paymentMethodDisplay
          : paymentMethodDisplay // ignore: cast_nullable_to_non_nullable
              as String,
      createdOn: null == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as String,
      bankId: null == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as String,
      paidOn: null == paidOn
          ? _value.paidOn
          : paidOn // ignore: cast_nullable_to_non_nullable
              as String,
      vaName: null == vaName
          ? _value.vaName
          : vaName // ignore: cast_nullable_to_non_nullable
              as String,
      vaNumber: null == vaNumber
          ? _value.vaNumber
          : vaNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionDetailDtoImpl extends _TransactionDetailDto {
  const _$TransactionDetailDtoImpl(
      {@JsonKey(name: 'id', defaultValue: '') required this.id,
      @JsonKey(name: 'reference', defaultValue: '') required this.reference,
      @JsonKey(name: 'invoices', defaultValue: <TransactionInvoiceDto>[])
      required final List<TransactionInvoiceDto> invoices,
      @JsonKey(name: 'amountPayable', defaultValue: 0.0)
      required this.amountPayable,
      @JsonKey(name: 'status', defaultValue: '') required this.status,
      @JsonKey(name: 'paymentDocument', defaultValue: '')
      required this.paymentDocument,
      @JsonKey(name: 'paymentMethodDisplay', defaultValue: '')
      required this.paymentMethodDisplay,
      @JsonKey(name: 'createdOn', defaultValue: '') required this.createdOn,
      @JsonKey(name: 'bankId', defaultValue: '') required this.bankId,
      @JsonKey(name: 'paidOn', defaultValue: '') required this.paidOn,
      @JsonKey(
          name: 'vaName',
          defaultValue: '',
          readValue: JsonReadValueHelper.readVaName)
      required this.vaName,
      @JsonKey(
          name: 'vaNumber',
          defaultValue: '',
          readValue: JsonReadValueHelper.readVaNumber)
      required this.vaNumber})
      : _invoices = invoices,
        super._();

  factory _$TransactionDetailDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionDetailDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: '')
  final String id;
  @override
  @JsonKey(name: 'reference', defaultValue: '')
  final String reference;
  final List<TransactionInvoiceDto> _invoices;
  @override
  @JsonKey(name: 'invoices', defaultValue: <TransactionInvoiceDto>[])
  List<TransactionInvoiceDto> get invoices {
    if (_invoices is EqualUnmodifiableListView) return _invoices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invoices);
  }

  @override
  @JsonKey(name: 'amountPayable', defaultValue: 0.0)
  final double amountPayable;
  @override
  @JsonKey(name: 'status', defaultValue: '')
  final String status;
  @override
  @JsonKey(name: 'paymentDocument', defaultValue: '')
  final String paymentDocument;
  @override
  @JsonKey(name: 'paymentMethodDisplay', defaultValue: '')
  final String paymentMethodDisplay;
  @override
  @JsonKey(name: 'createdOn', defaultValue: '')
  final String createdOn;
  @override
  @JsonKey(name: 'bankId', defaultValue: '')
  final String bankId;
  @override
  @JsonKey(name: 'paidOn', defaultValue: '')
  final String paidOn;
  @override
  @JsonKey(
      name: 'vaName',
      defaultValue: '',
      readValue: JsonReadValueHelper.readVaName)
  final String vaName;
  @override
  @JsonKey(
      name: 'vaNumber',
      defaultValue: '',
      readValue: JsonReadValueHelper.readVaNumber)
  final String vaNumber;

  @override
  String toString() {
    return 'TransactionDetailDto(id: $id, reference: $reference, invoices: $invoices, amountPayable: $amountPayable, status: $status, paymentDocument: $paymentDocument, paymentMethodDisplay: $paymentMethodDisplay, createdOn: $createdOn, bankId: $bankId, paidOn: $paidOn, vaName: $vaName, vaNumber: $vaNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionDetailDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            const DeepCollectionEquality().equals(other._invoices, _invoices) &&
            (identical(other.amountPayable, amountPayable) ||
                other.amountPayable == amountPayable) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentDocument, paymentDocument) ||
                other.paymentDocument == paymentDocument) &&
            (identical(other.paymentMethodDisplay, paymentMethodDisplay) ||
                other.paymentMethodDisplay == paymentMethodDisplay) &&
            (identical(other.createdOn, createdOn) ||
                other.createdOn == createdOn) &&
            (identical(other.bankId, bankId) || other.bankId == bankId) &&
            (identical(other.paidOn, paidOn) || other.paidOn == paidOn) &&
            (identical(other.vaName, vaName) || other.vaName == vaName) &&
            (identical(other.vaNumber, vaNumber) ||
                other.vaNumber == vaNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      reference,
      const DeepCollectionEquality().hash(_invoices),
      amountPayable,
      status,
      paymentDocument,
      paymentMethodDisplay,
      createdOn,
      bankId,
      paidOn,
      vaName,
      vaNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionDetailDtoImplCopyWith<_$TransactionDetailDtoImpl>
      get copyWith =>
          __$$TransactionDetailDtoImplCopyWithImpl<_$TransactionDetailDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionDetailDtoImplToJson(
      this,
    );
  }
}

abstract class _TransactionDetailDto extends TransactionDetailDto {
  const factory _TransactionDetailDto(
      {@JsonKey(name: 'id', defaultValue: '') required final String id,
      @JsonKey(name: 'reference', defaultValue: '')
      required final String reference,
      @JsonKey(name: 'invoices', defaultValue: <TransactionInvoiceDto>[])
      required final List<TransactionInvoiceDto> invoices,
      @JsonKey(name: 'amountPayable', defaultValue: 0.0)
      required final double amountPayable,
      @JsonKey(name: 'status', defaultValue: '') required final String status,
      @JsonKey(name: 'paymentDocument', defaultValue: '')
      required final String paymentDocument,
      @JsonKey(name: 'paymentMethodDisplay', defaultValue: '')
      required final String paymentMethodDisplay,
      @JsonKey(name: 'createdOn', defaultValue: '')
      required final String createdOn,
      @JsonKey(name: 'bankId', defaultValue: '') required final String bankId,
      @JsonKey(name: 'paidOn', defaultValue: '') required final String paidOn,
      @JsonKey(
          name: 'vaName',
          defaultValue: '',
          readValue: JsonReadValueHelper.readVaName)
      required final String vaName,
      @JsonKey(
          name: 'vaNumber',
          defaultValue: '',
          readValue: JsonReadValueHelper.readVaNumber)
      required final String vaNumber}) = _$TransactionDetailDtoImpl;
  const _TransactionDetailDto._() : super._();

  factory _TransactionDetailDto.fromJson(Map<String, dynamic> json) =
      _$TransactionDetailDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: '')
  String get id;
  @override
  @JsonKey(name: 'reference', defaultValue: '')
  String get reference;
  @override
  @JsonKey(name: 'invoices', defaultValue: <TransactionInvoiceDto>[])
  List<TransactionInvoiceDto> get invoices;
  @override
  @JsonKey(name: 'amountPayable', defaultValue: 0.0)
  double get amountPayable;
  @override
  @JsonKey(name: 'status', defaultValue: '')
  String get status;
  @override
  @JsonKey(name: 'paymentDocument', defaultValue: '')
  String get paymentDocument;
  @override
  @JsonKey(name: 'paymentMethodDisplay', defaultValue: '')
  String get paymentMethodDisplay;
  @override
  @JsonKey(name: 'createdOn', defaultValue: '')
  String get createdOn;
  @override
  @JsonKey(name: 'bankId', defaultValue: '')
  String get bankId;
  @override
  @JsonKey(name: 'paidOn', defaultValue: '')
  String get paidOn;
  @override
  @JsonKey(
      name: 'vaName',
      defaultValue: '',
      readValue: JsonReadValueHelper.readVaName)
  String get vaName;
  @override
  @JsonKey(
      name: 'vaNumber',
      defaultValue: '',
      readValue: JsonReadValueHelper.readVaNumber)
  String get vaNumber;
  @override
  @JsonKey(ignore: true)
  _$$TransactionDetailDtoImplCopyWith<_$TransactionDetailDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_virtual_account_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateVirtualAccountDto _$CreateVirtualAccountDtoFromJson(
    Map<String, dynamic> json) {
  return _CreateVirtualAccountDto.fromJson(json);
}

/// @nodoc
mixin _$CreateVirtualAccountDto {
  @JsonKey(name: 'id', defaultValue: '')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoices', defaultValue: [])
  List<TransactionInvoiceDto> get invoices =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'amountPayable', defaultValue: 0.0)
  double get amountPayable => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', defaultValue: '')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentDetails')
  PaymentDetailsDto get paymentDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentMethodDisplay', defaultValue: '')
  String get paymentMethodDisplay => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'createdOn',
      defaultValue: '',
      readValue: JsonReadValueHelper.createdAtDate)
  String get createdOn => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'paidOn',
      defaultValue: '',
      readValue: JsonReadValueHelper.createdAtDate)
  String get paidOn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateVirtualAccountDtoCopyWith<CreateVirtualAccountDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateVirtualAccountDtoCopyWith<$Res> {
  factory $CreateVirtualAccountDtoCopyWith(CreateVirtualAccountDto value,
          $Res Function(CreateVirtualAccountDto) then) =
      _$CreateVirtualAccountDtoCopyWithImpl<$Res, CreateVirtualAccountDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(name: 'invoices', defaultValue: [])
      List<TransactionInvoiceDto> invoices,
      @JsonKey(name: 'amountPayable', defaultValue: 0.0) double amountPayable,
      @JsonKey(name: 'status', defaultValue: '') String status,
      @JsonKey(name: 'paymentDetails') PaymentDetailsDto paymentDetails,
      @JsonKey(name: 'paymentMethodDisplay', defaultValue: '')
      String paymentMethodDisplay,
      @JsonKey(
          name: 'createdOn',
          defaultValue: '',
          readValue: JsonReadValueHelper.createdAtDate)
      String createdOn,
      @JsonKey(
          name: 'paidOn',
          defaultValue: '',
          readValue: JsonReadValueHelper.createdAtDate)
      String paidOn});

  $PaymentDetailsDtoCopyWith<$Res> get paymentDetails;
}

/// @nodoc
class _$CreateVirtualAccountDtoCopyWithImpl<$Res,
        $Val extends CreateVirtualAccountDto>
    implements $CreateVirtualAccountDtoCopyWith<$Res> {
  _$CreateVirtualAccountDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? invoices = null,
    Object? amountPayable = null,
    Object? status = null,
    Object? paymentDetails = null,
    Object? paymentMethodDisplay = null,
    Object? createdOn = null,
    Object? paidOn = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      paymentDetails: null == paymentDetails
          ? _value.paymentDetails
          : paymentDetails // ignore: cast_nullable_to_non_nullable
              as PaymentDetailsDto,
      paymentMethodDisplay: null == paymentMethodDisplay
          ? _value.paymentMethodDisplay
          : paymentMethodDisplay // ignore: cast_nullable_to_non_nullable
              as String,
      createdOn: null == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as String,
      paidOn: null == paidOn
          ? _value.paidOn
          : paidOn // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentDetailsDtoCopyWith<$Res> get paymentDetails {
    return $PaymentDetailsDtoCopyWith<$Res>(_value.paymentDetails, (value) {
      return _then(_value.copyWith(paymentDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateVirtualAccountDtoImplCopyWith<$Res>
    implements $CreateVirtualAccountDtoCopyWith<$Res> {
  factory _$$CreateVirtualAccountDtoImplCopyWith(
          _$CreateVirtualAccountDtoImpl value,
          $Res Function(_$CreateVirtualAccountDtoImpl) then) =
      __$$CreateVirtualAccountDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(name: 'invoices', defaultValue: [])
      List<TransactionInvoiceDto> invoices,
      @JsonKey(name: 'amountPayable', defaultValue: 0.0) double amountPayable,
      @JsonKey(name: 'status', defaultValue: '') String status,
      @JsonKey(name: 'paymentDetails') PaymentDetailsDto paymentDetails,
      @JsonKey(name: 'paymentMethodDisplay', defaultValue: '')
      String paymentMethodDisplay,
      @JsonKey(
          name: 'createdOn',
          defaultValue: '',
          readValue: JsonReadValueHelper.createdAtDate)
      String createdOn,
      @JsonKey(
          name: 'paidOn',
          defaultValue: '',
          readValue: JsonReadValueHelper.createdAtDate)
      String paidOn});

  @override
  $PaymentDetailsDtoCopyWith<$Res> get paymentDetails;
}

/// @nodoc
class __$$CreateVirtualAccountDtoImplCopyWithImpl<$Res>
    extends _$CreateVirtualAccountDtoCopyWithImpl<$Res,
        _$CreateVirtualAccountDtoImpl>
    implements _$$CreateVirtualAccountDtoImplCopyWith<$Res> {
  __$$CreateVirtualAccountDtoImplCopyWithImpl(
      _$CreateVirtualAccountDtoImpl _value,
      $Res Function(_$CreateVirtualAccountDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? invoices = null,
    Object? amountPayable = null,
    Object? status = null,
    Object? paymentDetails = null,
    Object? paymentMethodDisplay = null,
    Object? createdOn = null,
    Object? paidOn = null,
  }) {
    return _then(_$CreateVirtualAccountDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      paymentDetails: null == paymentDetails
          ? _value.paymentDetails
          : paymentDetails // ignore: cast_nullable_to_non_nullable
              as PaymentDetailsDto,
      paymentMethodDisplay: null == paymentMethodDisplay
          ? _value.paymentMethodDisplay
          : paymentMethodDisplay // ignore: cast_nullable_to_non_nullable
              as String,
      createdOn: null == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as String,
      paidOn: null == paidOn
          ? _value.paidOn
          : paidOn // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateVirtualAccountDtoImpl extends _CreateVirtualAccountDto {
  const _$CreateVirtualAccountDtoImpl(
      {@JsonKey(name: 'id', defaultValue: '') required this.id,
      @JsonKey(name: 'invoices', defaultValue: [])
      required final List<TransactionInvoiceDto> invoices,
      @JsonKey(name: 'amountPayable', defaultValue: 0.0)
      required this.amountPayable,
      @JsonKey(name: 'status', defaultValue: '') required this.status,
      @JsonKey(name: 'paymentDetails') required this.paymentDetails,
      @JsonKey(name: 'paymentMethodDisplay', defaultValue: '')
      required this.paymentMethodDisplay,
      @JsonKey(
          name: 'createdOn',
          defaultValue: '',
          readValue: JsonReadValueHelper.createdAtDate)
      required this.createdOn,
      @JsonKey(
          name: 'paidOn',
          defaultValue: '',
          readValue: JsonReadValueHelper.createdAtDate)
      required this.paidOn})
      : _invoices = invoices,
        super._();

  factory _$CreateVirtualAccountDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateVirtualAccountDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: '')
  final String id;
  final List<TransactionInvoiceDto> _invoices;
  @override
  @JsonKey(name: 'invoices', defaultValue: [])
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
  @JsonKey(name: 'paymentDetails')
  final PaymentDetailsDto paymentDetails;
  @override
  @JsonKey(name: 'paymentMethodDisplay', defaultValue: '')
  final String paymentMethodDisplay;
  @override
  @JsonKey(
      name: 'createdOn',
      defaultValue: '',
      readValue: JsonReadValueHelper.createdAtDate)
  final String createdOn;
  @override
  @JsonKey(
      name: 'paidOn',
      defaultValue: '',
      readValue: JsonReadValueHelper.createdAtDate)
  final String paidOn;

  @override
  String toString() {
    return 'CreateVirtualAccountDto(id: $id, invoices: $invoices, amountPayable: $amountPayable, status: $status, paymentDetails: $paymentDetails, paymentMethodDisplay: $paymentMethodDisplay, createdOn: $createdOn, paidOn: $paidOn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateVirtualAccountDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._invoices, _invoices) &&
            (identical(other.amountPayable, amountPayable) ||
                other.amountPayable == amountPayable) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentDetails, paymentDetails) ||
                other.paymentDetails == paymentDetails) &&
            (identical(other.paymentMethodDisplay, paymentMethodDisplay) ||
                other.paymentMethodDisplay == paymentMethodDisplay) &&
            (identical(other.createdOn, createdOn) ||
                other.createdOn == createdOn) &&
            (identical(other.paidOn, paidOn) || other.paidOn == paidOn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_invoices),
      amountPayable,
      status,
      paymentDetails,
      paymentMethodDisplay,
      createdOn,
      paidOn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateVirtualAccountDtoImplCopyWith<_$CreateVirtualAccountDtoImpl>
      get copyWith => __$$CreateVirtualAccountDtoImplCopyWithImpl<
          _$CreateVirtualAccountDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateVirtualAccountDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateVirtualAccountDto extends CreateVirtualAccountDto {
  const factory _CreateVirtualAccountDto(
      {@JsonKey(name: 'id', defaultValue: '') required final String id,
      @JsonKey(name: 'invoices', defaultValue: [])
      required final List<TransactionInvoiceDto> invoices,
      @JsonKey(name: 'amountPayable', defaultValue: 0.0)
      required final double amountPayable,
      @JsonKey(name: 'status', defaultValue: '') required final String status,
      @JsonKey(name: 'paymentDetails')
      required final PaymentDetailsDto paymentDetails,
      @JsonKey(name: 'paymentMethodDisplay', defaultValue: '')
      required final String paymentMethodDisplay,
      @JsonKey(
          name: 'createdOn',
          defaultValue: '',
          readValue: JsonReadValueHelper.createdAtDate)
      required final String createdOn,
      @JsonKey(
          name: 'paidOn',
          defaultValue: '',
          readValue: JsonReadValueHelper.createdAtDate)
      required final String paidOn}) = _$CreateVirtualAccountDtoImpl;
  const _CreateVirtualAccountDto._() : super._();

  factory _CreateVirtualAccountDto.fromJson(Map<String, dynamic> json) =
      _$CreateVirtualAccountDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: '')
  String get id;
  @override
  @JsonKey(name: 'invoices', defaultValue: [])
  List<TransactionInvoiceDto> get invoices;
  @override
  @JsonKey(name: 'amountPayable', defaultValue: 0.0)
  double get amountPayable;
  @override
  @JsonKey(name: 'status', defaultValue: '')
  String get status;
  @override
  @JsonKey(name: 'paymentDetails')
  PaymentDetailsDto get paymentDetails;
  @override
  @JsonKey(name: 'paymentMethodDisplay', defaultValue: '')
  String get paymentMethodDisplay;
  @override
  @JsonKey(
      name: 'createdOn',
      defaultValue: '',
      readValue: JsonReadValueHelper.createdAtDate)
  String get createdOn;
  @override
  @JsonKey(
      name: 'paidOn',
      defaultValue: '',
      readValue: JsonReadValueHelper.createdAtDate)
  String get paidOn;
  @override
  @JsonKey(ignore: true)
  _$$CreateVirtualAccountDtoImplCopyWith<_$CreateVirtualAccountDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

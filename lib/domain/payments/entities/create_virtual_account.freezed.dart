// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_virtual_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateVirtualAccount {
  String get id => throw _privateConstructorUsedError;
  List<PaymentItem> get invoices => throw _privateConstructorUsedError;
  double get amountPayable => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  PaymentDetails get paymentDetails => throw _privateConstructorUsedError;
  StringValue get paymentMethodDisplay => throw _privateConstructorUsedError;
  DateTimeStringValue get createdOn => throw _privateConstructorUsedError;
  DateTimeStringValue get paidOn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateVirtualAccountCopyWith<CreateVirtualAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateVirtualAccountCopyWith<$Res> {
  factory $CreateVirtualAccountCopyWith(CreateVirtualAccount value,
          $Res Function(CreateVirtualAccount) then) =
      _$CreateVirtualAccountCopyWithImpl<$Res, CreateVirtualAccount>;
  @useResult
  $Res call(
      {String id,
      List<PaymentItem> invoices,
      double amountPayable,
      String status,
      PaymentDetails paymentDetails,
      StringValue paymentMethodDisplay,
      DateTimeStringValue createdOn,
      DateTimeStringValue paidOn});

  $PaymentDetailsCopyWith<$Res> get paymentDetails;
}

/// @nodoc
class _$CreateVirtualAccountCopyWithImpl<$Res,
        $Val extends CreateVirtualAccount>
    implements $CreateVirtualAccountCopyWith<$Res> {
  _$CreateVirtualAccountCopyWithImpl(this._value, this._then);

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
              as List<PaymentItem>,
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
              as PaymentDetails,
      paymentMethodDisplay: null == paymentMethodDisplay
          ? _value.paymentMethodDisplay
          : paymentMethodDisplay // ignore: cast_nullable_to_non_nullable
              as StringValue,
      createdOn: null == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      paidOn: null == paidOn
          ? _value.paidOn
          : paidOn // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentDetailsCopyWith<$Res> get paymentDetails {
    return $PaymentDetailsCopyWith<$Res>(_value.paymentDetails, (value) {
      return _then(_value.copyWith(paymentDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateVirtualAccountImplCopyWith<$Res>
    implements $CreateVirtualAccountCopyWith<$Res> {
  factory _$$CreateVirtualAccountImplCopyWith(_$CreateVirtualAccountImpl value,
          $Res Function(_$CreateVirtualAccountImpl) then) =
      __$$CreateVirtualAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      List<PaymentItem> invoices,
      double amountPayable,
      String status,
      PaymentDetails paymentDetails,
      StringValue paymentMethodDisplay,
      DateTimeStringValue createdOn,
      DateTimeStringValue paidOn});

  @override
  $PaymentDetailsCopyWith<$Res> get paymentDetails;
}

/// @nodoc
class __$$CreateVirtualAccountImplCopyWithImpl<$Res>
    extends _$CreateVirtualAccountCopyWithImpl<$Res, _$CreateVirtualAccountImpl>
    implements _$$CreateVirtualAccountImplCopyWith<$Res> {
  __$$CreateVirtualAccountImplCopyWithImpl(_$CreateVirtualAccountImpl _value,
      $Res Function(_$CreateVirtualAccountImpl) _then)
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
    return _then(_$CreateVirtualAccountImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      invoices: null == invoices
          ? _value._invoices
          : invoices // ignore: cast_nullable_to_non_nullable
              as List<PaymentItem>,
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
              as PaymentDetails,
      paymentMethodDisplay: null == paymentMethodDisplay
          ? _value.paymentMethodDisplay
          : paymentMethodDisplay // ignore: cast_nullable_to_non_nullable
              as StringValue,
      createdOn: null == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      paidOn: null == paidOn
          ? _value.paidOn
          : paidOn // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
    ));
  }
}

/// @nodoc

class _$CreateVirtualAccountImpl extends _CreateVirtualAccount {
  const _$CreateVirtualAccountImpl(
      {required this.id,
      required final List<PaymentItem> invoices,
      required this.amountPayable,
      required this.status,
      required this.paymentDetails,
      required this.paymentMethodDisplay,
      required this.createdOn,
      required this.paidOn})
      : _invoices = invoices,
        super._();

  @override
  final String id;
  final List<PaymentItem> _invoices;
  @override
  List<PaymentItem> get invoices {
    if (_invoices is EqualUnmodifiableListView) return _invoices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invoices);
  }

  @override
  final double amountPayable;
  @override
  final String status;
  @override
  final PaymentDetails paymentDetails;
  @override
  final StringValue paymentMethodDisplay;
  @override
  final DateTimeStringValue createdOn;
  @override
  final DateTimeStringValue paidOn;

  @override
  String toString() {
    return 'CreateVirtualAccount(id: $id, invoices: $invoices, amountPayable: $amountPayable, status: $status, paymentDetails: $paymentDetails, paymentMethodDisplay: $paymentMethodDisplay, createdOn: $createdOn, paidOn: $paidOn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateVirtualAccountImpl &&
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
  _$$CreateVirtualAccountImplCopyWith<_$CreateVirtualAccountImpl>
      get copyWith =>
          __$$CreateVirtualAccountImplCopyWithImpl<_$CreateVirtualAccountImpl>(
              this, _$identity);
}

abstract class _CreateVirtualAccount extends CreateVirtualAccount {
  const factory _CreateVirtualAccount(
      {required final String id,
      required final List<PaymentItem> invoices,
      required final double amountPayable,
      required final String status,
      required final PaymentDetails paymentDetails,
      required final StringValue paymentMethodDisplay,
      required final DateTimeStringValue createdOn,
      required final DateTimeStringValue paidOn}) = _$CreateVirtualAccountImpl;
  const _CreateVirtualAccount._() : super._();

  @override
  String get id;
  @override
  List<PaymentItem> get invoices;
  @override
  double get amountPayable;
  @override
  String get status;
  @override
  PaymentDetails get paymentDetails;
  @override
  StringValue get paymentMethodDisplay;
  @override
  DateTimeStringValue get createdOn;
  @override
  DateTimeStringValue get paidOn;
  @override
  @JsonKey(ignore: true)
  _$$CreateVirtualAccountImplCopyWith<_$CreateVirtualAccountImpl>
      get copyWith => throw _privateConstructorUsedError;
}

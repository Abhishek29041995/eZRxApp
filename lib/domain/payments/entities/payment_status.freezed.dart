// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentStatus {
  String get paymentId => throw _privateConstructorUsedError;
  String get transactionReference => throw _privateConstructorUsedError;
  TransactionStatus get transactionStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentStatusCopyWith<PaymentStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentStatusCopyWith<$Res> {
  factory $PaymentStatusCopyWith(
          PaymentStatus value, $Res Function(PaymentStatus) then) =
      _$PaymentStatusCopyWithImpl<$Res, PaymentStatus>;
  @useResult
  $Res call(
      {String paymentId,
      String transactionReference,
      TransactionStatus transactionStatus});
}

/// @nodoc
class _$PaymentStatusCopyWithImpl<$Res, $Val extends PaymentStatus>
    implements $PaymentStatusCopyWith<$Res> {
  _$PaymentStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentId = null,
    Object? transactionReference = null,
    Object? transactionStatus = null,
  }) {
    return _then(_value.copyWith(
      paymentId: null == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionReference: null == transactionReference
          ? _value.transactionReference
          : transactionReference // ignore: cast_nullable_to_non_nullable
              as String,
      transactionStatus: null == transactionStatus
          ? _value.transactionStatus
          : transactionStatus // ignore: cast_nullable_to_non_nullable
              as TransactionStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentStatusImplCopyWith<$Res>
    implements $PaymentStatusCopyWith<$Res> {
  factory _$$PaymentStatusImplCopyWith(
          _$PaymentStatusImpl value, $Res Function(_$PaymentStatusImpl) then) =
      __$$PaymentStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String paymentId,
      String transactionReference,
      TransactionStatus transactionStatus});
}

/// @nodoc
class __$$PaymentStatusImplCopyWithImpl<$Res>
    extends _$PaymentStatusCopyWithImpl<$Res, _$PaymentStatusImpl>
    implements _$$PaymentStatusImplCopyWith<$Res> {
  __$$PaymentStatusImplCopyWithImpl(
      _$PaymentStatusImpl _value, $Res Function(_$PaymentStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentId = null,
    Object? transactionReference = null,
    Object? transactionStatus = null,
  }) {
    return _then(_$PaymentStatusImpl(
      paymentId: null == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionReference: null == transactionReference
          ? _value.transactionReference
          : transactionReference // ignore: cast_nullable_to_non_nullable
              as String,
      transactionStatus: null == transactionStatus
          ? _value.transactionStatus
          : transactionStatus // ignore: cast_nullable_to_non_nullable
              as TransactionStatus,
    ));
  }
}

/// @nodoc

class _$PaymentStatusImpl extends _PaymentStatus {
  const _$PaymentStatusImpl(
      {required this.paymentId,
      required this.transactionReference,
      required this.transactionStatus})
      : super._();

  @override
  final String paymentId;
  @override
  final String transactionReference;
  @override
  final TransactionStatus transactionStatus;

  @override
  String toString() {
    return 'PaymentStatus(paymentId: $paymentId, transactionReference: $transactionReference, transactionStatus: $transactionStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentStatusImpl &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.transactionReference, transactionReference) ||
                other.transactionReference == transactionReference) &&
            (identical(other.transactionStatus, transactionStatus) ||
                other.transactionStatus == transactionStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, paymentId, transactionReference, transactionStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentStatusImplCopyWith<_$PaymentStatusImpl> get copyWith =>
      __$$PaymentStatusImplCopyWithImpl<_$PaymentStatusImpl>(this, _$identity);
}

abstract class _PaymentStatus extends PaymentStatus {
  const factory _PaymentStatus(
          {required final String paymentId,
          required final String transactionReference,
          required final TransactionStatus transactionStatus}) =
      _$PaymentStatusImpl;
  const _PaymentStatus._() : super._();

  @override
  String get paymentId;
  @override
  String get transactionReference;
  @override
  TransactionStatus get transactionStatus;
  @override
  @JsonKey(ignore: true)
  _$$PaymentStatusImplCopyWith<_$PaymentStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

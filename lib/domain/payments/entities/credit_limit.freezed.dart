// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_limit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreditLimit {
  CustomerCode get customerCode => throw _privateConstructorUsedError;
  Currency get currency => throw _privateConstructorUsedError;
  StringValue get creditLimit => throw _privateConstructorUsedError;
  StringValue get creditExposure => throw _privateConstructorUsedError;
  StringValue get creditBalance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreditLimitCopyWith<CreditLimit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditLimitCopyWith<$Res> {
  factory $CreditLimitCopyWith(
          CreditLimit value, $Res Function(CreditLimit) then) =
      _$CreditLimitCopyWithImpl<$Res, CreditLimit>;
  @useResult
  $Res call(
      {CustomerCode customerCode,
      Currency currency,
      StringValue creditLimit,
      StringValue creditExposure,
      StringValue creditBalance});
}

/// @nodoc
class _$CreditLimitCopyWithImpl<$Res, $Val extends CreditLimit>
    implements $CreditLimitCopyWith<$Res> {
  _$CreditLimitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCode = null,
    Object? currency = null,
    Object? creditLimit = null,
    Object? creditExposure = null,
    Object? creditBalance = null,
  }) {
    return _then(_value.copyWith(
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as CustomerCode,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      creditLimit: null == creditLimit
          ? _value.creditLimit
          : creditLimit // ignore: cast_nullable_to_non_nullable
              as StringValue,
      creditExposure: null == creditExposure
          ? _value.creditExposure
          : creditExposure // ignore: cast_nullable_to_non_nullable
              as StringValue,
      creditBalance: null == creditBalance
          ? _value.creditBalance
          : creditBalance // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreditLimitImplCopyWith<$Res>
    implements $CreditLimitCopyWith<$Res> {
  factory _$$CreditLimitImplCopyWith(
          _$CreditLimitImpl value, $Res Function(_$CreditLimitImpl) then) =
      __$$CreditLimitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CustomerCode customerCode,
      Currency currency,
      StringValue creditLimit,
      StringValue creditExposure,
      StringValue creditBalance});
}

/// @nodoc
class __$$CreditLimitImplCopyWithImpl<$Res>
    extends _$CreditLimitCopyWithImpl<$Res, _$CreditLimitImpl>
    implements _$$CreditLimitImplCopyWith<$Res> {
  __$$CreditLimitImplCopyWithImpl(
      _$CreditLimitImpl _value, $Res Function(_$CreditLimitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCode = null,
    Object? currency = null,
    Object? creditLimit = null,
    Object? creditExposure = null,
    Object? creditBalance = null,
  }) {
    return _then(_$CreditLimitImpl(
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as CustomerCode,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      creditLimit: null == creditLimit
          ? _value.creditLimit
          : creditLimit // ignore: cast_nullable_to_non_nullable
              as StringValue,
      creditExposure: null == creditExposure
          ? _value.creditExposure
          : creditExposure // ignore: cast_nullable_to_non_nullable
              as StringValue,
      creditBalance: null == creditBalance
          ? _value.creditBalance
          : creditBalance // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ));
  }
}

/// @nodoc

class _$CreditLimitImpl extends _CreditLimit {
  const _$CreditLimitImpl(
      {required this.customerCode,
      required this.currency,
      required this.creditLimit,
      required this.creditExposure,
      required this.creditBalance})
      : super._();

  @override
  final CustomerCode customerCode;
  @override
  final Currency currency;
  @override
  final StringValue creditLimit;
  @override
  final StringValue creditExposure;
  @override
  final StringValue creditBalance;

  @override
  String toString() {
    return 'CreditLimit(customerCode: $customerCode, currency: $currency, creditLimit: $creditLimit, creditExposure: $creditExposure, creditBalance: $creditBalance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreditLimitImpl &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.creditLimit, creditLimit) ||
                other.creditLimit == creditLimit) &&
            (identical(other.creditExposure, creditExposure) ||
                other.creditExposure == creditExposure) &&
            (identical(other.creditBalance, creditBalance) ||
                other.creditBalance == creditBalance));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerCode, currency,
      creditLimit, creditExposure, creditBalance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreditLimitImplCopyWith<_$CreditLimitImpl> get copyWith =>
      __$$CreditLimitImplCopyWithImpl<_$CreditLimitImpl>(this, _$identity);
}

abstract class _CreditLimit extends CreditLimit {
  const factory _CreditLimit(
      {required final CustomerCode customerCode,
      required final Currency currency,
      required final StringValue creditLimit,
      required final StringValue creditExposure,
      required final StringValue creditBalance}) = _$CreditLimitImpl;
  const _CreditLimit._() : super._();

  @override
  CustomerCode get customerCode;
  @override
  Currency get currency;
  @override
  StringValue get creditLimit;
  @override
  StringValue get creditExposure;
  @override
  StringValue get creditBalance;
  @override
  @JsonKey(ignore: true)
  _$$CreditLimitImplCopyWith<_$CreditLimitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_details_payment_term.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderHistoryDetailsPaymentTerm {
  PaymentTermCode get paymentTermCode => throw _privateConstructorUsedError;
  PaymentTermDescription get paymentTermDescription =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderHistoryDetailsPaymentTermCopyWith<OrderHistoryDetailsPaymentTerm>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDetailsPaymentTermCopyWith<$Res> {
  factory $OrderHistoryDetailsPaymentTermCopyWith(
          OrderHistoryDetailsPaymentTerm value,
          $Res Function(OrderHistoryDetailsPaymentTerm) then) =
      _$OrderHistoryDetailsPaymentTermCopyWithImpl<$Res,
          OrderHistoryDetailsPaymentTerm>;
  @useResult
  $Res call(
      {PaymentTermCode paymentTermCode,
      PaymentTermDescription paymentTermDescription});
}

/// @nodoc
class _$OrderHistoryDetailsPaymentTermCopyWithImpl<$Res,
        $Val extends OrderHistoryDetailsPaymentTerm>
    implements $OrderHistoryDetailsPaymentTermCopyWith<$Res> {
  _$OrderHistoryDetailsPaymentTermCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentTermCode = null,
    Object? paymentTermDescription = null,
  }) {
    return _then(_value.copyWith(
      paymentTermCode: null == paymentTermCode
          ? _value.paymentTermCode
          : paymentTermCode // ignore: cast_nullable_to_non_nullable
              as PaymentTermCode,
      paymentTermDescription: null == paymentTermDescription
          ? _value.paymentTermDescription
          : paymentTermDescription // ignore: cast_nullable_to_non_nullable
              as PaymentTermDescription,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderHistoryDetailsPaymentTermImplCopyWith<$Res>
    implements $OrderHistoryDetailsPaymentTermCopyWith<$Res> {
  factory _$$OrderHistoryDetailsPaymentTermImplCopyWith(
          _$OrderHistoryDetailsPaymentTermImpl value,
          $Res Function(_$OrderHistoryDetailsPaymentTermImpl) then) =
      __$$OrderHistoryDetailsPaymentTermImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PaymentTermCode paymentTermCode,
      PaymentTermDescription paymentTermDescription});
}

/// @nodoc
class __$$OrderHistoryDetailsPaymentTermImplCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsPaymentTermCopyWithImpl<$Res,
        _$OrderHistoryDetailsPaymentTermImpl>
    implements _$$OrderHistoryDetailsPaymentTermImplCopyWith<$Res> {
  __$$OrderHistoryDetailsPaymentTermImplCopyWithImpl(
      _$OrderHistoryDetailsPaymentTermImpl _value,
      $Res Function(_$OrderHistoryDetailsPaymentTermImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentTermCode = null,
    Object? paymentTermDescription = null,
  }) {
    return _then(_$OrderHistoryDetailsPaymentTermImpl(
      paymentTermCode: null == paymentTermCode
          ? _value.paymentTermCode
          : paymentTermCode // ignore: cast_nullable_to_non_nullable
              as PaymentTermCode,
      paymentTermDescription: null == paymentTermDescription
          ? _value.paymentTermDescription
          : paymentTermDescription // ignore: cast_nullable_to_non_nullable
              as PaymentTermDescription,
    ));
  }
}

/// @nodoc

class _$OrderHistoryDetailsPaymentTermImpl
    extends _OrderHistoryDetailsPaymentTerm {
  _$OrderHistoryDetailsPaymentTermImpl(
      {required this.paymentTermCode, required this.paymentTermDescription})
      : super._();

  @override
  final PaymentTermCode paymentTermCode;
  @override
  final PaymentTermDescription paymentTermDescription;

  @override
  String toString() {
    return 'OrderHistoryDetailsPaymentTerm(paymentTermCode: $paymentTermCode, paymentTermDescription: $paymentTermDescription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderHistoryDetailsPaymentTermImpl &&
            (identical(other.paymentTermCode, paymentTermCode) ||
                other.paymentTermCode == paymentTermCode) &&
            (identical(other.paymentTermDescription, paymentTermDescription) ||
                other.paymentTermDescription == paymentTermDescription));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, paymentTermCode, paymentTermDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderHistoryDetailsPaymentTermImplCopyWith<
          _$OrderHistoryDetailsPaymentTermImpl>
      get copyWith => __$$OrderHistoryDetailsPaymentTermImplCopyWithImpl<
          _$OrderHistoryDetailsPaymentTermImpl>(this, _$identity);
}

abstract class _OrderHistoryDetailsPaymentTerm
    extends OrderHistoryDetailsPaymentTerm {
  factory _OrderHistoryDetailsPaymentTerm(
          {required final PaymentTermCode paymentTermCode,
          required final PaymentTermDescription paymentTermDescription}) =
      _$OrderHistoryDetailsPaymentTermImpl;
  _OrderHistoryDetailsPaymentTerm._() : super._();

  @override
  PaymentTermCode get paymentTermCode;
  @override
  PaymentTermDescription get paymentTermDescription;
  @override
  @JsonKey(ignore: true)
  _$$OrderHistoryDetailsPaymentTermImplCopyWith<
          _$OrderHistoryDetailsPaymentTermImpl>
      get copyWith => throw _privateConstructorUsedError;
}

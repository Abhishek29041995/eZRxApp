// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_payment_method.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewPaymentMethod {
  PaymentMethodValue get paymentMethod => throw _privateConstructorUsedError;
  List<PaymentMethodOption> get options => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewPaymentMethodCopyWith<NewPaymentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewPaymentMethodCopyWith<$Res> {
  factory $NewPaymentMethodCopyWith(
          NewPaymentMethod value, $Res Function(NewPaymentMethod) then) =
      _$NewPaymentMethodCopyWithImpl<$Res, NewPaymentMethod>;
  @useResult
  $Res call(
      {PaymentMethodValue paymentMethod, List<PaymentMethodOption> options});
}

/// @nodoc
class _$NewPaymentMethodCopyWithImpl<$Res, $Val extends NewPaymentMethod>
    implements $NewPaymentMethodCopyWith<$Res> {
  _$NewPaymentMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethod = null,
    Object? options = null,
  }) {
    return _then(_value.copyWith(
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethodValue,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethodOption>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewPaymentMethodImplCopyWith<$Res>
    implements $NewPaymentMethodCopyWith<$Res> {
  factory _$$NewPaymentMethodImplCopyWith(_$NewPaymentMethodImpl value,
          $Res Function(_$NewPaymentMethodImpl) then) =
      __$$NewPaymentMethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PaymentMethodValue paymentMethod, List<PaymentMethodOption> options});
}

/// @nodoc
class __$$NewPaymentMethodImplCopyWithImpl<$Res>
    extends _$NewPaymentMethodCopyWithImpl<$Res, _$NewPaymentMethodImpl>
    implements _$$NewPaymentMethodImplCopyWith<$Res> {
  __$$NewPaymentMethodImplCopyWithImpl(_$NewPaymentMethodImpl _value,
      $Res Function(_$NewPaymentMethodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethod = null,
    Object? options = null,
  }) {
    return _then(_$NewPaymentMethodImpl(
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethodValue,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethodOption>,
    ));
  }
}

/// @nodoc

class _$NewPaymentMethodImpl extends _NewPaymentMethod {
  const _$NewPaymentMethodImpl(
      {required this.paymentMethod,
      required final List<PaymentMethodOption> options})
      : _options = options,
        super._();

  @override
  final PaymentMethodValue paymentMethod;
  final List<PaymentMethodOption> _options;
  @override
  List<PaymentMethodOption> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  String toString() {
    return 'NewPaymentMethod(paymentMethod: $paymentMethod, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewPaymentMethodImpl &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentMethod,
      const DeepCollectionEquality().hash(_options));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewPaymentMethodImplCopyWith<_$NewPaymentMethodImpl> get copyWith =>
      __$$NewPaymentMethodImplCopyWithImpl<_$NewPaymentMethodImpl>(
          this, _$identity);
}

abstract class _NewPaymentMethod extends NewPaymentMethod {
  const factory _NewPaymentMethod(
          {required final PaymentMethodValue paymentMethod,
          required final List<PaymentMethodOption> options}) =
      _$NewPaymentMethodImpl;
  const _NewPaymentMethod._() : super._();

  @override
  PaymentMethodValue get paymentMethod;
  @override
  List<PaymentMethodOption> get options;
  @override
  @JsonKey(ignore: true)
  _$$NewPaymentMethodImplCopyWith<_$NewPaymentMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

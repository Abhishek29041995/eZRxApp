// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_advice_expiry_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentAdviceExpiryNotification {
  String get day => throw _privateConstructorUsedError;
  bool get disabled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentAdviceExpiryNotificationCopyWith<PaymentAdviceExpiryNotification>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentAdviceExpiryNotificationCopyWith<$Res> {
  factory $PaymentAdviceExpiryNotificationCopyWith(
          PaymentAdviceExpiryNotification value,
          $Res Function(PaymentAdviceExpiryNotification) then) =
      _$PaymentAdviceExpiryNotificationCopyWithImpl<$Res,
          PaymentAdviceExpiryNotification>;
  @useResult
  $Res call({String day, bool disabled});
}

/// @nodoc
class _$PaymentAdviceExpiryNotificationCopyWithImpl<$Res,
        $Val extends PaymentAdviceExpiryNotification>
    implements $PaymentAdviceExpiryNotificationCopyWith<$Res> {
  _$PaymentAdviceExpiryNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? disabled = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      disabled: null == disabled
          ? _value.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentAdviceExpiryNotificationImplCopyWith<$Res>
    implements $PaymentAdviceExpiryNotificationCopyWith<$Res> {
  factory _$$PaymentAdviceExpiryNotificationImplCopyWith(
          _$PaymentAdviceExpiryNotificationImpl value,
          $Res Function(_$PaymentAdviceExpiryNotificationImpl) then) =
      __$$PaymentAdviceExpiryNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String day, bool disabled});
}

/// @nodoc
class __$$PaymentAdviceExpiryNotificationImplCopyWithImpl<$Res>
    extends _$PaymentAdviceExpiryNotificationCopyWithImpl<$Res,
        _$PaymentAdviceExpiryNotificationImpl>
    implements _$$PaymentAdviceExpiryNotificationImplCopyWith<$Res> {
  __$$PaymentAdviceExpiryNotificationImplCopyWithImpl(
      _$PaymentAdviceExpiryNotificationImpl _value,
      $Res Function(_$PaymentAdviceExpiryNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? disabled = null,
  }) {
    return _then(_$PaymentAdviceExpiryNotificationImpl(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String,
      disabled: null == disabled
          ? _value.disabled
          : disabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PaymentAdviceExpiryNotificationImpl
    extends _PaymentAdviceExpiryNotification {
  const _$PaymentAdviceExpiryNotificationImpl(
      {required this.day, required this.disabled})
      : super._();

  @override
  final String day;
  @override
  final bool disabled;

  @override
  String toString() {
    return 'PaymentAdviceExpiryNotification(day: $day, disabled: $disabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentAdviceExpiryNotificationImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, day, disabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentAdviceExpiryNotificationImplCopyWith<
          _$PaymentAdviceExpiryNotificationImpl>
      get copyWith => __$$PaymentAdviceExpiryNotificationImplCopyWithImpl<
          _$PaymentAdviceExpiryNotificationImpl>(this, _$identity);
}

abstract class _PaymentAdviceExpiryNotification
    extends PaymentAdviceExpiryNotification {
  const factory _PaymentAdviceExpiryNotification(
      {required final String day,
      required final bool disabled}) = _$PaymentAdviceExpiryNotificationImpl;
  const _PaymentAdviceExpiryNotification._() : super._();

  @override
  String get day;
  @override
  bool get disabled;
  @override
  @JsonKey(ignore: true)
  _$$PaymentAdviceExpiryNotificationImplCopyWith<
          _$PaymentAdviceExpiryNotificationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

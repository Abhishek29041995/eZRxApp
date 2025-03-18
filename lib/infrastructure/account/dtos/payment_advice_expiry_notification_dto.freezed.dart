// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_advice_expiry_notification_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentAdviceExpiryNotificationDto _$PaymentAdviceExpiryNotificationDtoFromJson(
    Map<String, dynamic> json) {
  return _PaymentAdviceExpiryNotificationDto.fromJson(json);
}

/// @nodoc
mixin _$PaymentAdviceExpiryNotificationDto {
  @JsonKey(name: 'day')
  String get day => throw _privateConstructorUsedError;
  @JsonKey(name: 'disabled', defaultValue: false)
  bool get disabled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentAdviceExpiryNotificationDtoCopyWith<
          PaymentAdviceExpiryNotificationDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentAdviceExpiryNotificationDtoCopyWith<$Res> {
  factory $PaymentAdviceExpiryNotificationDtoCopyWith(
          PaymentAdviceExpiryNotificationDto value,
          $Res Function(PaymentAdviceExpiryNotificationDto) then) =
      _$PaymentAdviceExpiryNotificationDtoCopyWithImpl<$Res,
          PaymentAdviceExpiryNotificationDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'day') String day,
      @JsonKey(name: 'disabled', defaultValue: false) bool disabled});
}

/// @nodoc
class _$PaymentAdviceExpiryNotificationDtoCopyWithImpl<$Res,
        $Val extends PaymentAdviceExpiryNotificationDto>
    implements $PaymentAdviceExpiryNotificationDtoCopyWith<$Res> {
  _$PaymentAdviceExpiryNotificationDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$PaymentAdviceExpiryNotificationDtoImplCopyWith<$Res>
    implements $PaymentAdviceExpiryNotificationDtoCopyWith<$Res> {
  factory _$$PaymentAdviceExpiryNotificationDtoImplCopyWith(
          _$PaymentAdviceExpiryNotificationDtoImpl value,
          $Res Function(_$PaymentAdviceExpiryNotificationDtoImpl) then) =
      __$$PaymentAdviceExpiryNotificationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'day') String day,
      @JsonKey(name: 'disabled', defaultValue: false) bool disabled});
}

/// @nodoc
class __$$PaymentAdviceExpiryNotificationDtoImplCopyWithImpl<$Res>
    extends _$PaymentAdviceExpiryNotificationDtoCopyWithImpl<$Res,
        _$PaymentAdviceExpiryNotificationDtoImpl>
    implements _$$PaymentAdviceExpiryNotificationDtoImplCopyWith<$Res> {
  __$$PaymentAdviceExpiryNotificationDtoImplCopyWithImpl(
      _$PaymentAdviceExpiryNotificationDtoImpl _value,
      $Res Function(_$PaymentAdviceExpiryNotificationDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? disabled = null,
  }) {
    return _then(_$PaymentAdviceExpiryNotificationDtoImpl(
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
@JsonSerializable()
class _$PaymentAdviceExpiryNotificationDtoImpl
    extends _PaymentAdviceExpiryNotificationDto {
  const _$PaymentAdviceExpiryNotificationDtoImpl(
      {@JsonKey(name: 'day') required this.day,
      @JsonKey(name: 'disabled', defaultValue: false) required this.disabled})
      : super._();

  factory _$PaymentAdviceExpiryNotificationDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PaymentAdviceExpiryNotificationDtoImplFromJson(json);

  @override
  @JsonKey(name: 'day')
  final String day;
  @override
  @JsonKey(name: 'disabled', defaultValue: false)
  final bool disabled;

  @override
  String toString() {
    return 'PaymentAdviceExpiryNotificationDto(day: $day, disabled: $disabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentAdviceExpiryNotificationDtoImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, day, disabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentAdviceExpiryNotificationDtoImplCopyWith<
          _$PaymentAdviceExpiryNotificationDtoImpl>
      get copyWith => __$$PaymentAdviceExpiryNotificationDtoImplCopyWithImpl<
          _$PaymentAdviceExpiryNotificationDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentAdviceExpiryNotificationDtoImplToJson(
      this,
    );
  }
}

abstract class _PaymentAdviceExpiryNotificationDto
    extends PaymentAdviceExpiryNotificationDto {
  const factory _PaymentAdviceExpiryNotificationDto(
      {@JsonKey(name: 'day') required final String day,
      @JsonKey(name: 'disabled', defaultValue: false)
      required final bool disabled}) = _$PaymentAdviceExpiryNotificationDtoImpl;
  const _PaymentAdviceExpiryNotificationDto._() : super._();

  factory _PaymentAdviceExpiryNotificationDto.fromJson(
          Map<String, dynamic> json) =
      _$PaymentAdviceExpiryNotificationDtoImpl.fromJson;

  @override
  @JsonKey(name: 'day')
  String get day;
  @override
  @JsonKey(name: 'disabled', defaultValue: false)
  bool get disabled;
  @override
  @JsonKey(ignore: true)
  _$$PaymentAdviceExpiryNotificationDtoImplCopyWith<
          _$PaymentAdviceExpiryNotificationDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_settings_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationSettingsResponseDto _$NotificationSettingsResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _NotificationSettingsResponseDto.fromJson(json);
}

/// @nodoc
mixin _$NotificationSettingsResponseDto {
  @JsonKey(name: 'orderConfirmation', defaultValue: false)
  bool get orderConfirmation => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentConfirmation', defaultValue: false)
  bool get paymentConfirmation => throw _privateConstructorUsedError;
  @JsonKey(name: 'ereturnConfirmation', defaultValue: false)
  bool get ereturnConfirmation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationSettingsResponseDtoCopyWith<NotificationSettingsResponseDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationSettingsResponseDtoCopyWith<$Res> {
  factory $NotificationSettingsResponseDtoCopyWith(
          NotificationSettingsResponseDto value,
          $Res Function(NotificationSettingsResponseDto) then) =
      _$NotificationSettingsResponseDtoCopyWithImpl<$Res,
          NotificationSettingsResponseDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'orderConfirmation', defaultValue: false)
      bool orderConfirmation,
      @JsonKey(name: 'paymentConfirmation', defaultValue: false)
      bool paymentConfirmation,
      @JsonKey(name: 'ereturnConfirmation', defaultValue: false)
      bool ereturnConfirmation});
}

/// @nodoc
class _$NotificationSettingsResponseDtoCopyWithImpl<$Res,
        $Val extends NotificationSettingsResponseDto>
    implements $NotificationSettingsResponseDtoCopyWith<$Res> {
  _$NotificationSettingsResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderConfirmation = null,
    Object? paymentConfirmation = null,
    Object? ereturnConfirmation = null,
  }) {
    return _then(_value.copyWith(
      orderConfirmation: null == orderConfirmation
          ? _value.orderConfirmation
          : orderConfirmation // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentConfirmation: null == paymentConfirmation
          ? _value.paymentConfirmation
          : paymentConfirmation // ignore: cast_nullable_to_non_nullable
              as bool,
      ereturnConfirmation: null == ereturnConfirmation
          ? _value.ereturnConfirmation
          : ereturnConfirmation // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationSettingsResponseDtoImplCopyWith<$Res>
    implements $NotificationSettingsResponseDtoCopyWith<$Res> {
  factory _$$NotificationSettingsResponseDtoImplCopyWith(
          _$NotificationSettingsResponseDtoImpl value,
          $Res Function(_$NotificationSettingsResponseDtoImpl) then) =
      __$$NotificationSettingsResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'orderConfirmation', defaultValue: false)
      bool orderConfirmation,
      @JsonKey(name: 'paymentConfirmation', defaultValue: false)
      bool paymentConfirmation,
      @JsonKey(name: 'ereturnConfirmation', defaultValue: false)
      bool ereturnConfirmation});
}

/// @nodoc
class __$$NotificationSettingsResponseDtoImplCopyWithImpl<$Res>
    extends _$NotificationSettingsResponseDtoCopyWithImpl<$Res,
        _$NotificationSettingsResponseDtoImpl>
    implements _$$NotificationSettingsResponseDtoImplCopyWith<$Res> {
  __$$NotificationSettingsResponseDtoImplCopyWithImpl(
      _$NotificationSettingsResponseDtoImpl _value,
      $Res Function(_$NotificationSettingsResponseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderConfirmation = null,
    Object? paymentConfirmation = null,
    Object? ereturnConfirmation = null,
  }) {
    return _then(_$NotificationSettingsResponseDtoImpl(
      orderConfirmation: null == orderConfirmation
          ? _value.orderConfirmation
          : orderConfirmation // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentConfirmation: null == paymentConfirmation
          ? _value.paymentConfirmation
          : paymentConfirmation // ignore: cast_nullable_to_non_nullable
              as bool,
      ereturnConfirmation: null == ereturnConfirmation
          ? _value.ereturnConfirmation
          : ereturnConfirmation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationSettingsResponseDtoImpl
    extends _NotificationSettingsResponseDto {
  const _$NotificationSettingsResponseDtoImpl(
      {@JsonKey(name: 'orderConfirmation', defaultValue: false)
      required this.orderConfirmation,
      @JsonKey(name: 'paymentConfirmation', defaultValue: false)
      required this.paymentConfirmation,
      @JsonKey(name: 'ereturnConfirmation', defaultValue: false)
      required this.ereturnConfirmation})
      : super._();

  factory _$NotificationSettingsResponseDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$NotificationSettingsResponseDtoImplFromJson(json);

  @override
  @JsonKey(name: 'orderConfirmation', defaultValue: false)
  final bool orderConfirmation;
  @override
  @JsonKey(name: 'paymentConfirmation', defaultValue: false)
  final bool paymentConfirmation;
  @override
  @JsonKey(name: 'ereturnConfirmation', defaultValue: false)
  final bool ereturnConfirmation;

  @override
  String toString() {
    return 'NotificationSettingsResponseDto(orderConfirmation: $orderConfirmation, paymentConfirmation: $paymentConfirmation, ereturnConfirmation: $ereturnConfirmation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationSettingsResponseDtoImpl &&
            (identical(other.orderConfirmation, orderConfirmation) ||
                other.orderConfirmation == orderConfirmation) &&
            (identical(other.paymentConfirmation, paymentConfirmation) ||
                other.paymentConfirmation == paymentConfirmation) &&
            (identical(other.ereturnConfirmation, ereturnConfirmation) ||
                other.ereturnConfirmation == ereturnConfirmation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, orderConfirmation, paymentConfirmation, ereturnConfirmation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationSettingsResponseDtoImplCopyWith<
          _$NotificationSettingsResponseDtoImpl>
      get copyWith => __$$NotificationSettingsResponseDtoImplCopyWithImpl<
          _$NotificationSettingsResponseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationSettingsResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _NotificationSettingsResponseDto
    extends NotificationSettingsResponseDto {
  const factory _NotificationSettingsResponseDto(
          {@JsonKey(name: 'orderConfirmation', defaultValue: false)
          required final bool orderConfirmation,
          @JsonKey(name: 'paymentConfirmation', defaultValue: false)
          required final bool paymentConfirmation,
          @JsonKey(name: 'ereturnConfirmation', defaultValue: false)
          required final bool ereturnConfirmation}) =
      _$NotificationSettingsResponseDtoImpl;
  const _NotificationSettingsResponseDto._() : super._();

  factory _NotificationSettingsResponseDto.fromJson(Map<String, dynamic> json) =
      _$NotificationSettingsResponseDtoImpl.fromJson;

  @override
  @JsonKey(name: 'orderConfirmation', defaultValue: false)
  bool get orderConfirmation;
  @override
  @JsonKey(name: 'paymentConfirmation', defaultValue: false)
  bool get paymentConfirmation;
  @override
  @JsonKey(name: 'ereturnConfirmation', defaultValue: false)
  bool get ereturnConfirmation;
  @override
  @JsonKey(ignore: true)
  _$$NotificationSettingsResponseDtoImplCopyWith<
          _$NotificationSettingsResponseDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

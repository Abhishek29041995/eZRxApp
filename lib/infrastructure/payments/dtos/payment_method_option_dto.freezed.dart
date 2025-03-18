// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_method_option_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentMethodOptionDto _$PaymentMethodOptionDtoFromJson(
    Map<String, dynamic> json) {
  return _PaymentMethodOptionDto.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethodOptionDto {
  @JsonKey(name: 'id', defaultValue: '')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'type', defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'provider', defaultValue: '')
  String get provider => throw _privateConstructorUsedError;
  @JsonKey(name: 'displayName', defaultValue: '')
  String get displayName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentMethodOptionDtoCopyWith<PaymentMethodOptionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodOptionDtoCopyWith<$Res> {
  factory $PaymentMethodOptionDtoCopyWith(PaymentMethodOptionDto value,
          $Res Function(PaymentMethodOptionDto) then) =
      _$PaymentMethodOptionDtoCopyWithImpl<$Res, PaymentMethodOptionDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'provider', defaultValue: '') String provider,
      @JsonKey(name: 'displayName', defaultValue: '') String displayName});
}

/// @nodoc
class _$PaymentMethodOptionDtoCopyWithImpl<$Res,
        $Val extends PaymentMethodOptionDto>
    implements $PaymentMethodOptionDtoCopyWith<$Res> {
  _$PaymentMethodOptionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? provider = null,
    Object? displayName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentMethodOptionDtoImplCopyWith<$Res>
    implements $PaymentMethodOptionDtoCopyWith<$Res> {
  factory _$$PaymentMethodOptionDtoImplCopyWith(
          _$PaymentMethodOptionDtoImpl value,
          $Res Function(_$PaymentMethodOptionDtoImpl) then) =
      __$$PaymentMethodOptionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(name: 'type', defaultValue: '') String type,
      @JsonKey(name: 'provider', defaultValue: '') String provider,
      @JsonKey(name: 'displayName', defaultValue: '') String displayName});
}

/// @nodoc
class __$$PaymentMethodOptionDtoImplCopyWithImpl<$Res>
    extends _$PaymentMethodOptionDtoCopyWithImpl<$Res,
        _$PaymentMethodOptionDtoImpl>
    implements _$$PaymentMethodOptionDtoImplCopyWith<$Res> {
  __$$PaymentMethodOptionDtoImplCopyWithImpl(
      _$PaymentMethodOptionDtoImpl _value,
      $Res Function(_$PaymentMethodOptionDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? provider = null,
    Object? displayName = null,
  }) {
    return _then(_$PaymentMethodOptionDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMethodOptionDtoImpl extends _PaymentMethodOptionDto {
  const _$PaymentMethodOptionDtoImpl(
      {@JsonKey(name: 'id', defaultValue: '') required this.id,
      @JsonKey(name: 'type', defaultValue: '') required this.type,
      @JsonKey(name: 'provider', defaultValue: '') required this.provider,
      @JsonKey(name: 'displayName', defaultValue: '')
      required this.displayName})
      : super._();

  factory _$PaymentMethodOptionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodOptionDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: '')
  final String id;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  final String type;
  @override
  @JsonKey(name: 'provider', defaultValue: '')
  final String provider;
  @override
  @JsonKey(name: 'displayName', defaultValue: '')
  final String displayName;

  @override
  String toString() {
    return 'PaymentMethodOptionDto(id: $id, type: $type, provider: $provider, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodOptionDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, provider, displayName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodOptionDtoImplCopyWith<_$PaymentMethodOptionDtoImpl>
      get copyWith => __$$PaymentMethodOptionDtoImplCopyWithImpl<
          _$PaymentMethodOptionDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodOptionDtoImplToJson(
      this,
    );
  }
}

abstract class _PaymentMethodOptionDto extends PaymentMethodOptionDto {
  const factory _PaymentMethodOptionDto(
      {@JsonKey(name: 'id', defaultValue: '') required final String id,
      @JsonKey(name: 'type', defaultValue: '') required final String type,
      @JsonKey(name: 'provider', defaultValue: '')
      required final String provider,
      @JsonKey(name: 'displayName', defaultValue: '')
      required final String displayName}) = _$PaymentMethodOptionDtoImpl;
  const _PaymentMethodOptionDto._() : super._();

  factory _PaymentMethodOptionDto.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodOptionDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: '')
  String get id;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'provider', defaultValue: '')
  String get provider;
  @override
  @JsonKey(name: 'displayName', defaultValue: '')
  String get displayName;
  @override
  @JsonKey(ignore: true)
  _$$PaymentMethodOptionDtoImplCopyWith<_$PaymentMethodOptionDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

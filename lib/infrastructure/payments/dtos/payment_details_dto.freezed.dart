// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentDetailsDto _$PaymentDetailsDtoFromJson(Map<String, dynamic> json) {
  return _PaymentDetailsDto.fromJson(json);
}

/// @nodoc
mixin _$PaymentDetailsDto {
  @JsonKey(name: 'vaNumber', defaultValue: '')
  String get vaNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'vaName', defaultValue: '')
  String get vaName => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'expiresAt',
      defaultValue: '',
      readValue: JsonReadValueHelper.createdAtDate)
  String get expiresAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentDetailsDtoCopyWith<PaymentDetailsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentDetailsDtoCopyWith<$Res> {
  factory $PaymentDetailsDtoCopyWith(
          PaymentDetailsDto value, $Res Function(PaymentDetailsDto) then) =
      _$PaymentDetailsDtoCopyWithImpl<$Res, PaymentDetailsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'vaNumber', defaultValue: '') String vaNumber,
      @JsonKey(name: 'vaName', defaultValue: '') String vaName,
      @JsonKey(
          name: 'expiresAt',
          defaultValue: '',
          readValue: JsonReadValueHelper.createdAtDate)
      String expiresAt});
}

/// @nodoc
class _$PaymentDetailsDtoCopyWithImpl<$Res, $Val extends PaymentDetailsDto>
    implements $PaymentDetailsDtoCopyWith<$Res> {
  _$PaymentDetailsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vaNumber = null,
    Object? vaName = null,
    Object? expiresAt = null,
  }) {
    return _then(_value.copyWith(
      vaNumber: null == vaNumber
          ? _value.vaNumber
          : vaNumber // ignore: cast_nullable_to_non_nullable
              as String,
      vaName: null == vaName
          ? _value.vaName
          : vaName // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentDetailsDtoImplCopyWith<$Res>
    implements $PaymentDetailsDtoCopyWith<$Res> {
  factory _$$PaymentDetailsDtoImplCopyWith(_$PaymentDetailsDtoImpl value,
          $Res Function(_$PaymentDetailsDtoImpl) then) =
      __$$PaymentDetailsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'vaNumber', defaultValue: '') String vaNumber,
      @JsonKey(name: 'vaName', defaultValue: '') String vaName,
      @JsonKey(
          name: 'expiresAt',
          defaultValue: '',
          readValue: JsonReadValueHelper.createdAtDate)
      String expiresAt});
}

/// @nodoc
class __$$PaymentDetailsDtoImplCopyWithImpl<$Res>
    extends _$PaymentDetailsDtoCopyWithImpl<$Res, _$PaymentDetailsDtoImpl>
    implements _$$PaymentDetailsDtoImplCopyWith<$Res> {
  __$$PaymentDetailsDtoImplCopyWithImpl(_$PaymentDetailsDtoImpl _value,
      $Res Function(_$PaymentDetailsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vaNumber = null,
    Object? vaName = null,
    Object? expiresAt = null,
  }) {
    return _then(_$PaymentDetailsDtoImpl(
      vaNumber: null == vaNumber
          ? _value.vaNumber
          : vaNumber // ignore: cast_nullable_to_non_nullable
              as String,
      vaName: null == vaName
          ? _value.vaName
          : vaName // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentDetailsDtoImpl extends _PaymentDetailsDto {
  const _$PaymentDetailsDtoImpl(
      {@JsonKey(name: 'vaNumber', defaultValue: '') required this.vaNumber,
      @JsonKey(name: 'vaName', defaultValue: '') required this.vaName,
      @JsonKey(
          name: 'expiresAt',
          defaultValue: '',
          readValue: JsonReadValueHelper.createdAtDate)
      required this.expiresAt})
      : super._();

  factory _$PaymentDetailsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentDetailsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'vaNumber', defaultValue: '')
  final String vaNumber;
  @override
  @JsonKey(name: 'vaName', defaultValue: '')
  final String vaName;
  @override
  @JsonKey(
      name: 'expiresAt',
      defaultValue: '',
      readValue: JsonReadValueHelper.createdAtDate)
  final String expiresAt;

  @override
  String toString() {
    return 'PaymentDetailsDto(vaNumber: $vaNumber, vaName: $vaName, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentDetailsDtoImpl &&
            (identical(other.vaNumber, vaNumber) ||
                other.vaNumber == vaNumber) &&
            (identical(other.vaName, vaName) || other.vaName == vaName) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, vaNumber, vaName, expiresAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentDetailsDtoImplCopyWith<_$PaymentDetailsDtoImpl> get copyWith =>
      __$$PaymentDetailsDtoImplCopyWithImpl<_$PaymentDetailsDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentDetailsDtoImplToJson(
      this,
    );
  }
}

abstract class _PaymentDetailsDto extends PaymentDetailsDto {
  const factory _PaymentDetailsDto(
      {@JsonKey(name: 'vaNumber', defaultValue: '')
      required final String vaNumber,
      @JsonKey(name: 'vaName', defaultValue: '') required final String vaName,
      @JsonKey(
          name: 'expiresAt',
          defaultValue: '',
          readValue: JsonReadValueHelper.createdAtDate)
      required final String expiresAt}) = _$PaymentDetailsDtoImpl;
  const _PaymentDetailsDto._() : super._();

  factory _PaymentDetailsDto.fromJson(Map<String, dynamic> json) =
      _$PaymentDetailsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'vaNumber', defaultValue: '')
  String get vaNumber;
  @override
  @JsonKey(name: 'vaName', defaultValue: '')
  String get vaName;
  @override
  @JsonKey(
      name: 'expiresAt',
      defaultValue: '',
      readValue: JsonReadValueHelper.createdAtDate)
  String get expiresAt;
  @override
  @JsonKey(ignore: true)
  _$$PaymentDetailsDtoImplCopyWith<_$PaymentDetailsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

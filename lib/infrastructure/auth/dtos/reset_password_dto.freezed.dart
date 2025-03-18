// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResetPasswordDto _$ResetPasswordDtoFromJson(Map<String, dynamic> json) {
  return _ResetPasswordDto.fromJson(json);
}

/// @nodoc
mixin _$ResetPasswordDto {
  @JsonKey(name: 'success')
  bool get success => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResetPasswordDtoCopyWith<ResetPasswordDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordDtoCopyWith<$Res> {
  factory $ResetPasswordDtoCopyWith(
          ResetPasswordDto value, $Res Function(ResetPasswordDto) then) =
      _$ResetPasswordDtoCopyWithImpl<$Res, ResetPasswordDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'success') bool success,
      @JsonKey(name: 'status') String status});
}

/// @nodoc
class _$ResetPasswordDtoCopyWithImpl<$Res, $Val extends ResetPasswordDto>
    implements $ResetPasswordDtoCopyWith<$Res> {
  _$ResetPasswordDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResetPasswordDtoImplCopyWith<$Res>
    implements $ResetPasswordDtoCopyWith<$Res> {
  factory _$$ResetPasswordDtoImplCopyWith(_$ResetPasswordDtoImpl value,
          $Res Function(_$ResetPasswordDtoImpl) then) =
      __$$ResetPasswordDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'success') bool success,
      @JsonKey(name: 'status') String status});
}

/// @nodoc
class __$$ResetPasswordDtoImplCopyWithImpl<$Res>
    extends _$ResetPasswordDtoCopyWithImpl<$Res, _$ResetPasswordDtoImpl>
    implements _$$ResetPasswordDtoImplCopyWith<$Res> {
  __$$ResetPasswordDtoImplCopyWithImpl(_$ResetPasswordDtoImpl _value,
      $Res Function(_$ResetPasswordDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? status = null,
  }) {
    return _then(_$ResetPasswordDtoImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResetPasswordDtoImpl extends _ResetPasswordDto {
  const _$ResetPasswordDtoImpl(
      {@JsonKey(name: 'success') required this.success,
      @JsonKey(name: 'status') required this.status})
      : super._();

  factory _$ResetPasswordDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResetPasswordDtoImplFromJson(json);

  @override
  @JsonKey(name: 'success')
  final bool success;
  @override
  @JsonKey(name: 'status')
  final String status;

  @override
  String toString() {
    return 'ResetPasswordDto(success: $success, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordDtoImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordDtoImplCopyWith<_$ResetPasswordDtoImpl> get copyWith =>
      __$$ResetPasswordDtoImplCopyWithImpl<_$ResetPasswordDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResetPasswordDtoImplToJson(
      this,
    );
  }
}

abstract class _ResetPasswordDto extends ResetPasswordDto {
  const factory _ResetPasswordDto(
          {@JsonKey(name: 'success') required final bool success,
          @JsonKey(name: 'status') required final String status}) =
      _$ResetPasswordDtoImpl;
  const _ResetPasswordDto._() : super._();

  factory _ResetPasswordDto.fromJson(Map<String, dynamic> json) =
      _$ResetPasswordDtoImpl.fromJson;

  @override
  @JsonKey(name: 'success')
  bool get success;
  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$ResetPasswordDtoImplCopyWith<_$ResetPasswordDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

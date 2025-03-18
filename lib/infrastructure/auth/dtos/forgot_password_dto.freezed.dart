// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ForgotPasswordDto _$ForgotPasswordDtoFromJson(Map<String, dynamic> json) {
  return _ForgotPasswordDto.fromJson(json);
}

/// @nodoc
mixin _$ForgotPasswordDto {
  @JsonKey(name: 'success', defaultValue: false)
  bool get success => throw _privateConstructorUsedError;
  @JsonKey(name: 'email', defaultValue: '')
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForgotPasswordDtoCopyWith<ForgotPasswordDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordDtoCopyWith<$Res> {
  factory $ForgotPasswordDtoCopyWith(
          ForgotPasswordDto value, $Res Function(ForgotPasswordDto) then) =
      _$ForgotPasswordDtoCopyWithImpl<$Res, ForgotPasswordDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'success', defaultValue: false) bool success,
      @JsonKey(name: 'email', defaultValue: '') String email});
}

/// @nodoc
class _$ForgotPasswordDtoCopyWithImpl<$Res, $Val extends ForgotPasswordDto>
    implements $ForgotPasswordDtoCopyWith<$Res> {
  _$ForgotPasswordDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForgotPasswordDtoImplCopyWith<$Res>
    implements $ForgotPasswordDtoCopyWith<$Res> {
  factory _$$ForgotPasswordDtoImplCopyWith(_$ForgotPasswordDtoImpl value,
          $Res Function(_$ForgotPasswordDtoImpl) then) =
      __$$ForgotPasswordDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'success', defaultValue: false) bool success,
      @JsonKey(name: 'email', defaultValue: '') String email});
}

/// @nodoc
class __$$ForgotPasswordDtoImplCopyWithImpl<$Res>
    extends _$ForgotPasswordDtoCopyWithImpl<$Res, _$ForgotPasswordDtoImpl>
    implements _$$ForgotPasswordDtoImplCopyWith<$Res> {
  __$$ForgotPasswordDtoImplCopyWithImpl(_$ForgotPasswordDtoImpl _value,
      $Res Function(_$ForgotPasswordDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? email = null,
  }) {
    return _then(_$ForgotPasswordDtoImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForgotPasswordDtoImpl extends _ForgotPasswordDto {
  _$ForgotPasswordDtoImpl(
      {@JsonKey(name: 'success', defaultValue: false) required this.success,
      @JsonKey(name: 'email', defaultValue: '') required this.email})
      : super._();

  factory _$ForgotPasswordDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForgotPasswordDtoImplFromJson(json);

  @override
  @JsonKey(name: 'success', defaultValue: false)
  final bool success;
  @override
  @JsonKey(name: 'email', defaultValue: '')
  final String email;

  @override
  String toString() {
    return 'ForgotPasswordDto(success: $success, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordDtoImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordDtoImplCopyWith<_$ForgotPasswordDtoImpl> get copyWith =>
      __$$ForgotPasswordDtoImplCopyWithImpl<_$ForgotPasswordDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForgotPasswordDtoImplToJson(
      this,
    );
  }
}

abstract class _ForgotPasswordDto extends ForgotPasswordDto {
  factory _ForgotPasswordDto(
      {@JsonKey(name: 'success', defaultValue: false)
      required final bool success,
      @JsonKey(name: 'email', defaultValue: '')
      required final String email}) = _$ForgotPasswordDtoImpl;
  _ForgotPasswordDto._() : super._();

  factory _ForgotPasswordDto.fromJson(Map<String, dynamic> json) =
      _$ForgotPasswordDtoImpl.fromJson;

  @override
  @JsonKey(name: 'success', defaultValue: false)
  bool get success;
  @override
  @JsonKey(name: 'email', defaultValue: '')
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$ForgotPasswordDtoImplCopyWith<_$ForgotPasswordDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

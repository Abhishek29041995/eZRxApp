// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginDto _$LoginDtoFromJson(Map<String, dynamic> json) {
  return _LoginDto.fromJson(json);
}

/// @nodoc
mixin _$LoginDto {
  @JsonKey(name: 'eZRxJWT', readValue: JsonReadValueHelper.convertAccessToken)
  String get access => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'eZRxRefreshJWT',
      readValue: JsonReadValueHelper.convertRefreshToken)
  String get refresh => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  UserDto get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginDtoCopyWith<LoginDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginDtoCopyWith<$Res> {
  factory $LoginDtoCopyWith(LoginDto value, $Res Function(LoginDto) then) =
      _$LoginDtoCopyWithImpl<$Res, LoginDto>;
  @useResult
  $Res call(
      {@JsonKey(
          name: 'eZRxJWT', readValue: JsonReadValueHelper.convertAccessToken)
      String access,
      @JsonKey(
          name: 'eZRxRefreshJWT',
          readValue: JsonReadValueHelper.convertRefreshToken)
      String refresh,
      @JsonKey(name: 'user') UserDto user});

  $UserDtoCopyWith<$Res> get user;
}

/// @nodoc
class _$LoginDtoCopyWithImpl<$Res, $Val extends LoginDto>
    implements $LoginDtoCopyWith<$Res> {
  _$LoginDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? access = null,
    Object? refresh = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      access: null == access
          ? _value.access
          : access // ignore: cast_nullable_to_non_nullable
              as String,
      refresh: null == refresh
          ? _value.refresh
          : refresh // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res> get user {
    return $UserDtoCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginDtoImplCopyWith<$Res>
    implements $LoginDtoCopyWith<$Res> {
  factory _$$LoginDtoImplCopyWith(
          _$LoginDtoImpl value, $Res Function(_$LoginDtoImpl) then) =
      __$$LoginDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: 'eZRxJWT', readValue: JsonReadValueHelper.convertAccessToken)
      String access,
      @JsonKey(
          name: 'eZRxRefreshJWT',
          readValue: JsonReadValueHelper.convertRefreshToken)
      String refresh,
      @JsonKey(name: 'user') UserDto user});

  @override
  $UserDtoCopyWith<$Res> get user;
}

/// @nodoc
class __$$LoginDtoImplCopyWithImpl<$Res>
    extends _$LoginDtoCopyWithImpl<$Res, _$LoginDtoImpl>
    implements _$$LoginDtoImplCopyWith<$Res> {
  __$$LoginDtoImplCopyWithImpl(
      _$LoginDtoImpl _value, $Res Function(_$LoginDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? access = null,
    Object? refresh = null,
    Object? user = null,
  }) {
    return _then(_$LoginDtoImpl(
      access: null == access
          ? _value.access
          : access // ignore: cast_nullable_to_non_nullable
              as String,
      refresh: null == refresh
          ? _value.refresh
          : refresh // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginDtoImpl extends _LoginDto {
  const _$LoginDtoImpl(
      {@JsonKey(
          name: 'eZRxJWT', readValue: JsonReadValueHelper.convertAccessToken)
      required this.access,
      @JsonKey(
          name: 'eZRxRefreshJWT',
          readValue: JsonReadValueHelper.convertRefreshToken)
      required this.refresh,
      @JsonKey(name: 'user') this.user = UserDto.emptyUserDto})
      : super._();

  factory _$LoginDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginDtoImplFromJson(json);

  @override
  @JsonKey(name: 'eZRxJWT', readValue: JsonReadValueHelper.convertAccessToken)
  final String access;
  @override
  @JsonKey(
      name: 'eZRxRefreshJWT',
      readValue: JsonReadValueHelper.convertRefreshToken)
  final String refresh;
  @override
  @JsonKey(name: 'user')
  final UserDto user;

  @override
  String toString() {
    return 'LoginDto(access: $access, refresh: $refresh, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginDtoImpl &&
            (identical(other.access, access) || other.access == access) &&
            (identical(other.refresh, refresh) || other.refresh == refresh) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, access, refresh, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginDtoImplCopyWith<_$LoginDtoImpl> get copyWith =>
      __$$LoginDtoImplCopyWithImpl<_$LoginDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginDtoImplToJson(
      this,
    );
  }
}

abstract class _LoginDto extends LoginDto {
  const factory _LoginDto(
      {@JsonKey(
          name: 'eZRxJWT', readValue: JsonReadValueHelper.convertAccessToken)
      required final String access,
      @JsonKey(
          name: 'eZRxRefreshJWT',
          readValue: JsonReadValueHelper.convertRefreshToken)
      required final String refresh,
      @JsonKey(name: 'user') final UserDto user}) = _$LoginDtoImpl;
  const _LoginDto._() : super._();

  factory _LoginDto.fromJson(Map<String, dynamic> json) =
      _$LoginDtoImpl.fromJson;

  @override
  @JsonKey(name: 'eZRxJWT', readValue: JsonReadValueHelper.convertAccessToken)
  String get access;
  @override
  @JsonKey(
      name: 'eZRxRefreshJWT',
      readValue: JsonReadValueHelper.convertRefreshToken)
  String get refresh;
  @override
  @JsonKey(name: 'user')
  UserDto get user;
  @override
  @JsonKey(ignore: true)
  _$$LoginDtoImplCopyWith<_$LoginDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

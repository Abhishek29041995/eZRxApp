// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ez_point_token_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EZPointTokenResponseDto _$EZPointTokenResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _EZPointTokenResponseDto.fromJson(json);
}

/// @nodoc
mixin _$EZPointTokenResponseDto {
  @JsonKey(name: 'ezPointToken', defaultValue: '')
  String get ezPointToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EZPointTokenResponseDtoCopyWith<EZPointTokenResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EZPointTokenResponseDtoCopyWith<$Res> {
  factory $EZPointTokenResponseDtoCopyWith(EZPointTokenResponseDto value,
          $Res Function(EZPointTokenResponseDto) then) =
      _$EZPointTokenResponseDtoCopyWithImpl<$Res, EZPointTokenResponseDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ezPointToken', defaultValue: '') String ezPointToken});
}

/// @nodoc
class _$EZPointTokenResponseDtoCopyWithImpl<$Res,
        $Val extends EZPointTokenResponseDto>
    implements $EZPointTokenResponseDtoCopyWith<$Res> {
  _$EZPointTokenResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ezPointToken = null,
  }) {
    return _then(_value.copyWith(
      ezPointToken: null == ezPointToken
          ? _value.ezPointToken
          : ezPointToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EZPointTokenResponseDtoImplCopyWith<$Res>
    implements $EZPointTokenResponseDtoCopyWith<$Res> {
  factory _$$EZPointTokenResponseDtoImplCopyWith(
          _$EZPointTokenResponseDtoImpl value,
          $Res Function(_$EZPointTokenResponseDtoImpl) then) =
      __$$EZPointTokenResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ezPointToken', defaultValue: '') String ezPointToken});
}

/// @nodoc
class __$$EZPointTokenResponseDtoImplCopyWithImpl<$Res>
    extends _$EZPointTokenResponseDtoCopyWithImpl<$Res,
        _$EZPointTokenResponseDtoImpl>
    implements _$$EZPointTokenResponseDtoImplCopyWith<$Res> {
  __$$EZPointTokenResponseDtoImplCopyWithImpl(
      _$EZPointTokenResponseDtoImpl _value,
      $Res Function(_$EZPointTokenResponseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ezPointToken = null,
  }) {
    return _then(_$EZPointTokenResponseDtoImpl(
      ezPointToken: null == ezPointToken
          ? _value.ezPointToken
          : ezPointToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EZPointTokenResponseDtoImpl extends _EZPointTokenResponseDto {
  const _$EZPointTokenResponseDtoImpl(
      {@JsonKey(name: 'ezPointToken', defaultValue: '')
      required this.ezPointToken})
      : super._();

  factory _$EZPointTokenResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EZPointTokenResponseDtoImplFromJson(json);

  @override
  @JsonKey(name: 'ezPointToken', defaultValue: '')
  final String ezPointToken;

  @override
  String toString() {
    return 'EZPointTokenResponseDto(ezPointToken: $ezPointToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EZPointTokenResponseDtoImpl &&
            (identical(other.ezPointToken, ezPointToken) ||
                other.ezPointToken == ezPointToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, ezPointToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EZPointTokenResponseDtoImplCopyWith<_$EZPointTokenResponseDtoImpl>
      get copyWith => __$$EZPointTokenResponseDtoImplCopyWithImpl<
          _$EZPointTokenResponseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EZPointTokenResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _EZPointTokenResponseDto extends EZPointTokenResponseDto {
  const factory _EZPointTokenResponseDto(
      {@JsonKey(name: 'ezPointToken', defaultValue: '')
      required final String ezPointToken}) = _$EZPointTokenResponseDtoImpl;
  const _EZPointTokenResponseDto._() : super._();

  factory _EZPointTokenResponseDto.fromJson(Map<String, dynamic> json) =
      _$EZPointTokenResponseDtoImpl.fromJson;

  @override
  @JsonKey(name: 'ezPointToken', defaultValue: '')
  String get ezPointToken;
  @override
  @JsonKey(ignore: true)
  _$$EZPointTokenResponseDtoImplCopyWith<_$EZPointTokenResponseDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_language_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateLanguageResponseDto _$UpdateLanguageResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _UpdateLanguageResponseDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateLanguageResponseDto {
  @JsonKey(name: 'success', defaultValue: false)
  bool get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateLanguageResponseDtoCopyWith<UpdateLanguageResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateLanguageResponseDtoCopyWith<$Res> {
  factory $UpdateLanguageResponseDtoCopyWith(UpdateLanguageResponseDto value,
          $Res Function(UpdateLanguageResponseDto) then) =
      _$UpdateLanguageResponseDtoCopyWithImpl<$Res, UpdateLanguageResponseDto>;
  @useResult
  $Res call({@JsonKey(name: 'success', defaultValue: false) bool success});
}

/// @nodoc
class _$UpdateLanguageResponseDtoCopyWithImpl<$Res,
        $Val extends UpdateLanguageResponseDto>
    implements $UpdateLanguageResponseDtoCopyWith<$Res> {
  _$UpdateLanguageResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateLanguageResponseDtoImplCopyWith<$Res>
    implements $UpdateLanguageResponseDtoCopyWith<$Res> {
  factory _$$UpdateLanguageResponseDtoImplCopyWith(
          _$UpdateLanguageResponseDtoImpl value,
          $Res Function(_$UpdateLanguageResponseDtoImpl) then) =
      __$$UpdateLanguageResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'success', defaultValue: false) bool success});
}

/// @nodoc
class __$$UpdateLanguageResponseDtoImplCopyWithImpl<$Res>
    extends _$UpdateLanguageResponseDtoCopyWithImpl<$Res,
        _$UpdateLanguageResponseDtoImpl>
    implements _$$UpdateLanguageResponseDtoImplCopyWith<$Res> {
  __$$UpdateLanguageResponseDtoImplCopyWithImpl(
      _$UpdateLanguageResponseDtoImpl _value,
      $Res Function(_$UpdateLanguageResponseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
  }) {
    return _then(_$UpdateLanguageResponseDtoImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateLanguageResponseDtoImpl extends _UpdateLanguageResponseDto {
  _$UpdateLanguageResponseDtoImpl(
      {@JsonKey(name: 'success', defaultValue: false) required this.success})
      : super._();

  factory _$UpdateLanguageResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateLanguageResponseDtoImplFromJson(json);

  @override
  @JsonKey(name: 'success', defaultValue: false)
  final bool success;

  @override
  String toString() {
    return 'UpdateLanguageResponseDto(success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateLanguageResponseDtoImpl &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateLanguageResponseDtoImplCopyWith<_$UpdateLanguageResponseDtoImpl>
      get copyWith => __$$UpdateLanguageResponseDtoImplCopyWithImpl<
          _$UpdateLanguageResponseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateLanguageResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdateLanguageResponseDto extends UpdateLanguageResponseDto {
  factory _UpdateLanguageResponseDto(
      {@JsonKey(name: 'success', defaultValue: false)
      required final bool success}) = _$UpdateLanguageResponseDtoImpl;
  _UpdateLanguageResponseDto._() : super._();

  factory _UpdateLanguageResponseDto.fromJson(Map<String, dynamic> json) =
      _$UpdateLanguageResponseDtoImpl.fromJson;

  @override
  @JsonKey(name: 'success', defaultValue: false)
  bool get success;
  @override
  @JsonKey(ignore: true)
  _$$UpdateLanguageResponseDtoImplCopyWith<_$UpdateLanguageResponseDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

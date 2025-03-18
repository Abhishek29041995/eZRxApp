// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'principal_code_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrincipalCodeDto _$PrincipalCodeDtoFromJson(Map<String, dynamic> json) {
  return _PrincipalCodeDto.fromJson(json);
}

/// @nodoc
mixin _$PrincipalCodeDto {
  @JsonKey(name: 'principalName', defaultValue: '')
  String get principalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'principalCode', defaultValue: '')
  String get principalCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrincipalCodeDtoCopyWith<PrincipalCodeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrincipalCodeDtoCopyWith<$Res> {
  factory $PrincipalCodeDtoCopyWith(
          PrincipalCodeDto value, $Res Function(PrincipalCodeDto) then) =
      _$PrincipalCodeDtoCopyWithImpl<$Res, PrincipalCodeDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'principalName', defaultValue: '') String principalName,
      @JsonKey(name: 'principalCode', defaultValue: '') String principalCode});
}

/// @nodoc
class _$PrincipalCodeDtoCopyWithImpl<$Res, $Val extends PrincipalCodeDto>
    implements $PrincipalCodeDtoCopyWith<$Res> {
  _$PrincipalCodeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? principalName = null,
    Object? principalCode = null,
  }) {
    return _then(_value.copyWith(
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrincipalCodeDtoImplCopyWith<$Res>
    implements $PrincipalCodeDtoCopyWith<$Res> {
  factory _$$PrincipalCodeDtoImplCopyWith(_$PrincipalCodeDtoImpl value,
          $Res Function(_$PrincipalCodeDtoImpl) then) =
      __$$PrincipalCodeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'principalName', defaultValue: '') String principalName,
      @JsonKey(name: 'principalCode', defaultValue: '') String principalCode});
}

/// @nodoc
class __$$PrincipalCodeDtoImplCopyWithImpl<$Res>
    extends _$PrincipalCodeDtoCopyWithImpl<$Res, _$PrincipalCodeDtoImpl>
    implements _$$PrincipalCodeDtoImplCopyWith<$Res> {
  __$$PrincipalCodeDtoImplCopyWithImpl(_$PrincipalCodeDtoImpl _value,
      $Res Function(_$PrincipalCodeDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? principalName = null,
    Object? principalCode = null,
  }) {
    return _then(_$PrincipalCodeDtoImpl(
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrincipalCodeDtoImpl extends _PrincipalCodeDto {
  _$PrincipalCodeDtoImpl(
      {@JsonKey(name: 'principalName', defaultValue: '')
      required this.principalName,
      @JsonKey(name: 'principalCode', defaultValue: '')
      required this.principalCode})
      : super._();

  factory _$PrincipalCodeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrincipalCodeDtoImplFromJson(json);

  @override
  @JsonKey(name: 'principalName', defaultValue: '')
  final String principalName;
  @override
  @JsonKey(name: 'principalCode', defaultValue: '')
  final String principalCode;

  @override
  String toString() {
    return 'PrincipalCodeDto(principalName: $principalName, principalCode: $principalCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrincipalCodeDtoImpl &&
            (identical(other.principalName, principalName) ||
                other.principalName == principalName) &&
            (identical(other.principalCode, principalCode) ||
                other.principalCode == principalCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, principalName, principalCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PrincipalCodeDtoImplCopyWith<_$PrincipalCodeDtoImpl> get copyWith =>
      __$$PrincipalCodeDtoImplCopyWithImpl<_$PrincipalCodeDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrincipalCodeDtoImplToJson(
      this,
    );
  }
}

abstract class _PrincipalCodeDto extends PrincipalCodeDto {
  factory _PrincipalCodeDto(
      {@JsonKey(name: 'principalName', defaultValue: '')
      required final String principalName,
      @JsonKey(name: 'principalCode', defaultValue: '')
      required final String principalCode}) = _$PrincipalCodeDtoImpl;
  _PrincipalCodeDto._() : super._();

  factory _PrincipalCodeDto.fromJson(Map<String, dynamic> json) =
      _$PrincipalCodeDtoImpl.fromJson;

  @override
  @JsonKey(name: 'principalName', defaultValue: '')
  String get principalName;
  @override
  @JsonKey(name: 'principalCode', defaultValue: '')
  String get principalCode;
  @override
  @JsonKey(ignore: true)
  _$$PrincipalCodeDtoImplCopyWith<_$PrincipalCodeDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'soa_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SoaDto _$SoaDtoFromJson(Map<String, dynamic> json) {
  return _SoaDto.fromJson(json);
}

/// @nodoc
mixin _$SoaDto {
  @JsonKey(name: 'name', defaultValue: '')
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SoaDtoCopyWith<SoaDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SoaDtoCopyWith<$Res> {
  factory $SoaDtoCopyWith(SoaDto value, $Res Function(SoaDto) then) =
      _$SoaDtoCopyWithImpl<$Res, SoaDto>;
  @useResult
  $Res call({@JsonKey(name: 'name', defaultValue: '') String name});
}

/// @nodoc
class _$SoaDtoCopyWithImpl<$Res, $Val extends SoaDto>
    implements $SoaDtoCopyWith<$Res> {
  _$SoaDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SoaDtoImplCopyWith<$Res> implements $SoaDtoCopyWith<$Res> {
  factory _$$SoaDtoImplCopyWith(
          _$SoaDtoImpl value, $Res Function(_$SoaDtoImpl) then) =
      __$$SoaDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'name', defaultValue: '') String name});
}

/// @nodoc
class __$$SoaDtoImplCopyWithImpl<$Res>
    extends _$SoaDtoCopyWithImpl<$Res, _$SoaDtoImpl>
    implements _$$SoaDtoImplCopyWith<$Res> {
  __$$SoaDtoImplCopyWithImpl(
      _$SoaDtoImpl _value, $Res Function(_$SoaDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$SoaDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SoaDtoImpl extends _SoaDto {
  _$SoaDtoImpl({@JsonKey(name: 'name', defaultValue: '') required this.name})
      : super._();

  factory _$SoaDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SoaDtoImplFromJson(json);

  @override
  @JsonKey(name: 'name', defaultValue: '')
  final String name;

  @override
  String toString() {
    return 'SoaDto(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SoaDtoImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SoaDtoImplCopyWith<_$SoaDtoImpl> get copyWith =>
      __$$SoaDtoImplCopyWithImpl<_$SoaDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SoaDtoImplToJson(
      this,
    );
  }
}

abstract class _SoaDto extends SoaDto {
  factory _SoaDto(
      {@JsonKey(name: 'name', defaultValue: '')
      required final String name}) = _$SoaDtoImpl;
  _SoaDto._() : super._();

  factory _SoaDto.fromJson(Map<String, dynamic> json) = _$SoaDtoImpl.fromJson;

  @override
  @JsonKey(name: 'name', defaultValue: '')
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$SoaDtoImplCopyWith<_$SoaDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'principal_cutoffs_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrincipalCutoffsDto _$PrincipalCutoffsDtoFromJson(Map<String, dynamic> json) {
  return _PrincipalCutoffsDto.fromJson(json);
}

/// @nodoc
mixin _$PrincipalCutoffsDto {
  @JsonKey(name: 'total', defaultValue: 0)
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrincipalCutoffsDtoCopyWith<PrincipalCutoffsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrincipalCutoffsDtoCopyWith<$Res> {
  factory $PrincipalCutoffsDtoCopyWith(
          PrincipalCutoffsDto value, $Res Function(PrincipalCutoffsDto) then) =
      _$PrincipalCutoffsDtoCopyWithImpl<$Res, PrincipalCutoffsDto>;
  @useResult
  $Res call({@JsonKey(name: 'total', defaultValue: 0) int total});
}

/// @nodoc
class _$PrincipalCutoffsDtoCopyWithImpl<$Res, $Val extends PrincipalCutoffsDto>
    implements $PrincipalCutoffsDtoCopyWith<$Res> {
  _$PrincipalCutoffsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrincipalCutoffsDtoImplCopyWith<$Res>
    implements $PrincipalCutoffsDtoCopyWith<$Res> {
  factory _$$PrincipalCutoffsDtoImplCopyWith(_$PrincipalCutoffsDtoImpl value,
          $Res Function(_$PrincipalCutoffsDtoImpl) then) =
      __$$PrincipalCutoffsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'total', defaultValue: 0) int total});
}

/// @nodoc
class __$$PrincipalCutoffsDtoImplCopyWithImpl<$Res>
    extends _$PrincipalCutoffsDtoCopyWithImpl<$Res, _$PrincipalCutoffsDtoImpl>
    implements _$$PrincipalCutoffsDtoImplCopyWith<$Res> {
  __$$PrincipalCutoffsDtoImplCopyWithImpl(_$PrincipalCutoffsDtoImpl _value,
      $Res Function(_$PrincipalCutoffsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
  }) {
    return _then(_$PrincipalCutoffsDtoImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrincipalCutoffsDtoImpl extends _PrincipalCutoffsDto {
  const _$PrincipalCutoffsDtoImpl(
      {@JsonKey(name: 'total', defaultValue: 0) required this.total})
      : super._();

  factory _$PrincipalCutoffsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrincipalCutoffsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'total', defaultValue: 0)
  final int total;

  @override
  String toString() {
    return 'PrincipalCutoffsDto(total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrincipalCutoffsDtoImpl &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PrincipalCutoffsDtoImplCopyWith<_$PrincipalCutoffsDtoImpl> get copyWith =>
      __$$PrincipalCutoffsDtoImplCopyWithImpl<_$PrincipalCutoffsDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrincipalCutoffsDtoImplToJson(
      this,
    );
  }
}

abstract class _PrincipalCutoffsDto extends PrincipalCutoffsDto {
  const factory _PrincipalCutoffsDto(
          {@JsonKey(name: 'total', defaultValue: 0) required final int total}) =
      _$PrincipalCutoffsDtoImpl;
  const _PrincipalCutoffsDto._() : super._();

  factory _PrincipalCutoffsDto.fromJson(Map<String, dynamic> json) =
      _$PrincipalCutoffsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'total', defaultValue: 0)
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$PrincipalCutoffsDtoImplCopyWith<_$PrincipalCutoffsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

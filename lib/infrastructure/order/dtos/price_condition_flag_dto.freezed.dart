// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_condition_flag_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PriceConditionFlagDto _$PriceConditionFlagDtoFromJson(
    Map<String, dynamic> json) {
  return _PriceConditionFlagDto.fromJson(json);
}

/// @nodoc
mixin _$PriceConditionFlagDto {
  @JsonKey(name: 'isFOC', defaultValue: false)
  bool get isFOC => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceConditionFlagDtoCopyWith<PriceConditionFlagDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceConditionFlagDtoCopyWith<$Res> {
  factory $PriceConditionFlagDtoCopyWith(PriceConditionFlagDto value,
          $Res Function(PriceConditionFlagDto) then) =
      _$PriceConditionFlagDtoCopyWithImpl<$Res, PriceConditionFlagDto>;
  @useResult
  $Res call({@JsonKey(name: 'isFOC', defaultValue: false) bool isFOC});
}

/// @nodoc
class _$PriceConditionFlagDtoCopyWithImpl<$Res,
        $Val extends PriceConditionFlagDto>
    implements $PriceConditionFlagDtoCopyWith<$Res> {
  _$PriceConditionFlagDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFOC = null,
  }) {
    return _then(_value.copyWith(
      isFOC: null == isFOC
          ? _value.isFOC
          : isFOC // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceConditionFlagDtoImplCopyWith<$Res>
    implements $PriceConditionFlagDtoCopyWith<$Res> {
  factory _$$PriceConditionFlagDtoImplCopyWith(
          _$PriceConditionFlagDtoImpl value,
          $Res Function(_$PriceConditionFlagDtoImpl) then) =
      __$$PriceConditionFlagDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'isFOC', defaultValue: false) bool isFOC});
}

/// @nodoc
class __$$PriceConditionFlagDtoImplCopyWithImpl<$Res>
    extends _$PriceConditionFlagDtoCopyWithImpl<$Res,
        _$PriceConditionFlagDtoImpl>
    implements _$$PriceConditionFlagDtoImplCopyWith<$Res> {
  __$$PriceConditionFlagDtoImplCopyWithImpl(_$PriceConditionFlagDtoImpl _value,
      $Res Function(_$PriceConditionFlagDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFOC = null,
  }) {
    return _then(_$PriceConditionFlagDtoImpl(
      isFOC: null == isFOC
          ? _value.isFOC
          : isFOC // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceConditionFlagDtoImpl extends _PriceConditionFlagDto {
  const _$PriceConditionFlagDtoImpl(
      {@JsonKey(name: 'isFOC', defaultValue: false) required this.isFOC})
      : super._();

  factory _$PriceConditionFlagDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceConditionFlagDtoImplFromJson(json);

  @override
  @JsonKey(name: 'isFOC', defaultValue: false)
  final bool isFOC;

  @override
  String toString() {
    return 'PriceConditionFlagDto(isFOC: $isFOC)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceConditionFlagDtoImpl &&
            (identical(other.isFOC, isFOC) || other.isFOC == isFOC));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isFOC);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceConditionFlagDtoImplCopyWith<_$PriceConditionFlagDtoImpl>
      get copyWith => __$$PriceConditionFlagDtoImplCopyWithImpl<
          _$PriceConditionFlagDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceConditionFlagDtoImplToJson(
      this,
    );
  }
}

abstract class _PriceConditionFlagDto extends PriceConditionFlagDto {
  const factory _PriceConditionFlagDto(
      {@JsonKey(name: 'isFOC', defaultValue: false)
      required final bool isFOC}) = _$PriceConditionFlagDtoImpl;
  const _PriceConditionFlagDto._() : super._();

  factory _PriceConditionFlagDto.fromJson(Map<String, dynamic> json) =
      _$PriceConditionFlagDtoImpl.fromJson;

  @override
  @JsonKey(name: 'isFOC', defaultValue: false)
  bool get isFOC;
  @override
  @JsonKey(ignore: true)
  _$$PriceConditionFlagDtoImplCopyWith<_$PriceConditionFlagDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

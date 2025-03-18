// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remove_favourite_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RemoveFavouriteDto _$RemoveFavouriteDtoFromJson(Map<String, dynamic> json) {
  return _RemoveFavouriteDto.fromJson(json);
}

/// @nodoc
mixin _$RemoveFavouriteDto {
  @JsonKey(name: 'removeFavouriteMaterial', defaultValue: 0)
  int get removeFavouriteMaterial => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoveFavouriteDtoCopyWith<RemoveFavouriteDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoveFavouriteDtoCopyWith<$Res> {
  factory $RemoveFavouriteDtoCopyWith(
          RemoveFavouriteDto value, $Res Function(RemoveFavouriteDto) then) =
      _$RemoveFavouriteDtoCopyWithImpl<$Res, RemoveFavouriteDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'removeFavouriteMaterial', defaultValue: 0)
      int removeFavouriteMaterial});
}

/// @nodoc
class _$RemoveFavouriteDtoCopyWithImpl<$Res, $Val extends RemoveFavouriteDto>
    implements $RemoveFavouriteDtoCopyWith<$Res> {
  _$RemoveFavouriteDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? removeFavouriteMaterial = null,
  }) {
    return _then(_value.copyWith(
      removeFavouriteMaterial: null == removeFavouriteMaterial
          ? _value.removeFavouriteMaterial
          : removeFavouriteMaterial // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemoveFavouriteDtoImplCopyWith<$Res>
    implements $RemoveFavouriteDtoCopyWith<$Res> {
  factory _$$RemoveFavouriteDtoImplCopyWith(_$RemoveFavouriteDtoImpl value,
          $Res Function(_$RemoveFavouriteDtoImpl) then) =
      __$$RemoveFavouriteDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'removeFavouriteMaterial', defaultValue: 0)
      int removeFavouriteMaterial});
}

/// @nodoc
class __$$RemoveFavouriteDtoImplCopyWithImpl<$Res>
    extends _$RemoveFavouriteDtoCopyWithImpl<$Res, _$RemoveFavouriteDtoImpl>
    implements _$$RemoveFavouriteDtoImplCopyWith<$Res> {
  __$$RemoveFavouriteDtoImplCopyWithImpl(_$RemoveFavouriteDtoImpl _value,
      $Res Function(_$RemoveFavouriteDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? removeFavouriteMaterial = null,
  }) {
    return _then(_$RemoveFavouriteDtoImpl(
      removeFavouriteMaterial: null == removeFavouriteMaterial
          ? _value.removeFavouriteMaterial
          : removeFavouriteMaterial // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RemoveFavouriteDtoImpl extends _RemoveFavouriteDto {
  const _$RemoveFavouriteDtoImpl(
      {@JsonKey(name: 'removeFavouriteMaterial', defaultValue: 0)
      required this.removeFavouriteMaterial})
      : super._();

  factory _$RemoveFavouriteDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemoveFavouriteDtoImplFromJson(json);

  @override
  @JsonKey(name: 'removeFavouriteMaterial', defaultValue: 0)
  final int removeFavouriteMaterial;

  @override
  String toString() {
    return 'RemoveFavouriteDto(removeFavouriteMaterial: $removeFavouriteMaterial)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveFavouriteDtoImpl &&
            (identical(
                    other.removeFavouriteMaterial, removeFavouriteMaterial) ||
                other.removeFavouriteMaterial == removeFavouriteMaterial));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, removeFavouriteMaterial);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveFavouriteDtoImplCopyWith<_$RemoveFavouriteDtoImpl> get copyWith =>
      __$$RemoveFavouriteDtoImplCopyWithImpl<_$RemoveFavouriteDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemoveFavouriteDtoImplToJson(
      this,
    );
  }
}

abstract class _RemoveFavouriteDto extends RemoveFavouriteDto {
  const factory _RemoveFavouriteDto(
      {@JsonKey(name: 'removeFavouriteMaterial', defaultValue: 0)
      required final int removeFavouriteMaterial}) = _$RemoveFavouriteDtoImpl;
  const _RemoveFavouriteDto._() : super._();

  factory _RemoveFavouriteDto.fromJson(Map<String, dynamic> json) =
      _$RemoveFavouriteDtoImpl.fromJson;

  @override
  @JsonKey(name: 'removeFavouriteMaterial', defaultValue: 0)
  int get removeFavouriteMaterial;
  @override
  @JsonKey(ignore: true)
  _$$RemoveFavouriteDtoImplCopyWith<_$RemoveFavouriteDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remove_favourite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RemoveFavourite {
  FavouriteResponse get removeFavouriteMaterial =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RemoveFavouriteCopyWith<RemoveFavourite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoveFavouriteCopyWith<$Res> {
  factory $RemoveFavouriteCopyWith(
          RemoveFavourite value, $Res Function(RemoveFavourite) then) =
      _$RemoveFavouriteCopyWithImpl<$Res, RemoveFavourite>;
  @useResult
  $Res call({FavouriteResponse removeFavouriteMaterial});
}

/// @nodoc
class _$RemoveFavouriteCopyWithImpl<$Res, $Val extends RemoveFavourite>
    implements $RemoveFavouriteCopyWith<$Res> {
  _$RemoveFavouriteCopyWithImpl(this._value, this._then);

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
              as FavouriteResponse,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemoveFavouriteImplCopyWith<$Res>
    implements $RemoveFavouriteCopyWith<$Res> {
  factory _$$RemoveFavouriteImplCopyWith(_$RemoveFavouriteImpl value,
          $Res Function(_$RemoveFavouriteImpl) then) =
      __$$RemoveFavouriteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FavouriteResponse removeFavouriteMaterial});
}

/// @nodoc
class __$$RemoveFavouriteImplCopyWithImpl<$Res>
    extends _$RemoveFavouriteCopyWithImpl<$Res, _$RemoveFavouriteImpl>
    implements _$$RemoveFavouriteImplCopyWith<$Res> {
  __$$RemoveFavouriteImplCopyWithImpl(
      _$RemoveFavouriteImpl _value, $Res Function(_$RemoveFavouriteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? removeFavouriteMaterial = null,
  }) {
    return _then(_$RemoveFavouriteImpl(
      removeFavouriteMaterial: null == removeFavouriteMaterial
          ? _value.removeFavouriteMaterial
          : removeFavouriteMaterial // ignore: cast_nullable_to_non_nullable
              as FavouriteResponse,
    ));
  }
}

/// @nodoc

class _$RemoveFavouriteImpl extends _RemoveFavourite {
  const _$RemoveFavouriteImpl({required this.removeFavouriteMaterial})
      : super._();

  @override
  final FavouriteResponse removeFavouriteMaterial;

  @override
  String toString() {
    return 'RemoveFavourite(removeFavouriteMaterial: $removeFavouriteMaterial)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveFavouriteImpl &&
            (identical(
                    other.removeFavouriteMaterial, removeFavouriteMaterial) ||
                other.removeFavouriteMaterial == removeFavouriteMaterial));
  }

  @override
  int get hashCode => Object.hash(runtimeType, removeFavouriteMaterial);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveFavouriteImplCopyWith<_$RemoveFavouriteImpl> get copyWith =>
      __$$RemoveFavouriteImplCopyWithImpl<_$RemoveFavouriteImpl>(
          this, _$identity);
}

abstract class _RemoveFavourite extends RemoveFavourite {
  const factory _RemoveFavourite(
          {required final FavouriteResponse removeFavouriteMaterial}) =
      _$RemoveFavouriteImpl;
  const _RemoveFavourite._() : super._();

  @override
  FavouriteResponse get removeFavouriteMaterial;
  @override
  @JsonKey(ignore: true)
  _$$RemoveFavouriteImplCopyWith<_$RemoveFavouriteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

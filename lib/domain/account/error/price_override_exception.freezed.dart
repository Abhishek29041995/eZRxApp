// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_override_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PriceException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() priceNotFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? priceNotFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? priceNotFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PriceNotFound value) priceNotFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PriceNotFound value)? priceNotFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PriceNotFound value)? priceNotFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceExceptionCopyWith<$Res> {
  factory $PriceExceptionCopyWith(
          PriceException value, $Res Function(PriceException) then) =
      _$PriceExceptionCopyWithImpl<$Res, PriceException>;
}

/// @nodoc
class _$PriceExceptionCopyWithImpl<$Res, $Val extends PriceException>
    implements $PriceExceptionCopyWith<$Res> {
  _$PriceExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PriceNotFoundImplCopyWith<$Res> {
  factory _$$PriceNotFoundImplCopyWith(
          _$PriceNotFoundImpl value, $Res Function(_$PriceNotFoundImpl) then) =
      __$$PriceNotFoundImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PriceNotFoundImplCopyWithImpl<$Res>
    extends _$PriceExceptionCopyWithImpl<$Res, _$PriceNotFoundImpl>
    implements _$$PriceNotFoundImplCopyWith<$Res> {
  __$$PriceNotFoundImplCopyWithImpl(
      _$PriceNotFoundImpl _value, $Res Function(_$PriceNotFoundImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PriceNotFoundImpl implements _PriceNotFound {
  const _$PriceNotFoundImpl();

  @override
  String toString() {
    return 'PriceException.priceNotFound()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PriceNotFoundImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() priceNotFound,
  }) {
    return priceNotFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? priceNotFound,
  }) {
    return priceNotFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? priceNotFound,
    required TResult orElse(),
  }) {
    if (priceNotFound != null) {
      return priceNotFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PriceNotFound value) priceNotFound,
  }) {
    return priceNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PriceNotFound value)? priceNotFound,
  }) {
    return priceNotFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PriceNotFound value)? priceNotFound,
    required TResult orElse(),
  }) {
    if (priceNotFound != null) {
      return priceNotFound(this);
    }
    return orElse();
  }
}

abstract class _PriceNotFound implements PriceException {
  const factory _PriceNotFound() = _$PriceNotFoundImpl;
}

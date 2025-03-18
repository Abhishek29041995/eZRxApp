// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tr_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TRObject {
  String get message => throw _privateConstructorUsedError;
  Map<String, String> get arguments => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TRObjectCopyWith<TRObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TRObjectCopyWith<$Res> {
  factory $TRObjectCopyWith(TRObject value, $Res Function(TRObject) then) =
      _$TRObjectCopyWithImpl<$Res, TRObject>;
  @useResult
  $Res call({String message, Map<String, String> arguments});
}

/// @nodoc
class _$TRObjectCopyWithImpl<$Res, $Val extends TRObject>
    implements $TRObjectCopyWith<$Res> {
  _$TRObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? arguments = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      arguments: null == arguments
          ? _value.arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TRObjectImplCopyWith<$Res>
    implements $TRObjectCopyWith<$Res> {
  factory _$$TRObjectImplCopyWith(
          _$TRObjectImpl value, $Res Function(_$TRObjectImpl) then) =
      __$$TRObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Map<String, String> arguments});
}

/// @nodoc
class __$$TRObjectImplCopyWithImpl<$Res>
    extends _$TRObjectCopyWithImpl<$Res, _$TRObjectImpl>
    implements _$$TRObjectImplCopyWith<$Res> {
  __$$TRObjectImplCopyWithImpl(
      _$TRObjectImpl _value, $Res Function(_$TRObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? arguments = null,
  }) {
    return _then(_$TRObjectImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      arguments: null == arguments
          ? _value._arguments
          : arguments // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

class _$TRObjectImpl extends _TRObject {
  const _$TRObjectImpl(this.message,
      {final Map<String, String> arguments = const <String, String>{}})
      : _arguments = arguments,
        super._();

  @override
  final String message;
  final Map<String, String> _arguments;
  @override
  @JsonKey()
  Map<String, String> get arguments {
    if (_arguments is EqualUnmodifiableMapView) return _arguments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_arguments);
  }

  @override
  String toString() {
    return 'TRObject(message: $message, arguments: $arguments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TRObjectImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._arguments, _arguments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_arguments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TRObjectImplCopyWith<_$TRObjectImpl> get copyWith =>
      __$$TRObjectImplCopyWithImpl<_$TRObjectImpl>(this, _$identity);
}

abstract class _TRObject extends TRObject {
  const factory _TRObject(final String message,
      {final Map<String, String> arguments}) = _$TRObjectImpl;
  const _TRObject._() : super._();

  @override
  String get message;
  @override
  Map<String, String> get arguments;
  @override
  @JsonKey(ignore: true)
  _$$TRObjectImplCopyWith<_$TRObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

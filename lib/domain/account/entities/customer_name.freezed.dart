// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_name.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomerName {
  String get name1 => throw _privateConstructorUsedError;
  String get name2 => throw _privateConstructorUsedError;
  String get name3 => throw _privateConstructorUsedError;
  String get name4 => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerNameCopyWith<CustomerName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerNameCopyWith<$Res> {
  factory $CustomerNameCopyWith(
          CustomerName value, $Res Function(CustomerName) then) =
      _$CustomerNameCopyWithImpl<$Res, CustomerName>;
  @useResult
  $Res call({String name1, String name2, String name3, String name4});
}

/// @nodoc
class _$CustomerNameCopyWithImpl<$Res, $Val extends CustomerName>
    implements $CustomerNameCopyWith<$Res> {
  _$CustomerNameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name1 = null,
    Object? name2 = null,
    Object? name3 = null,
    Object? name4 = null,
  }) {
    return _then(_value.copyWith(
      name1: null == name1
          ? _value.name1
          : name1 // ignore: cast_nullable_to_non_nullable
              as String,
      name2: null == name2
          ? _value.name2
          : name2 // ignore: cast_nullable_to_non_nullable
              as String,
      name3: null == name3
          ? _value.name3
          : name3 // ignore: cast_nullable_to_non_nullable
              as String,
      name4: null == name4
          ? _value.name4
          : name4 // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerNameImplCopyWith<$Res>
    implements $CustomerNameCopyWith<$Res> {
  factory _$$CustomerNameImplCopyWith(
          _$CustomerNameImpl value, $Res Function(_$CustomerNameImpl) then) =
      __$$CustomerNameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name1, String name2, String name3, String name4});
}

/// @nodoc
class __$$CustomerNameImplCopyWithImpl<$Res>
    extends _$CustomerNameCopyWithImpl<$Res, _$CustomerNameImpl>
    implements _$$CustomerNameImplCopyWith<$Res> {
  __$$CustomerNameImplCopyWithImpl(
      _$CustomerNameImpl _value, $Res Function(_$CustomerNameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name1 = null,
    Object? name2 = null,
    Object? name3 = null,
    Object? name4 = null,
  }) {
    return _then(_$CustomerNameImpl(
      name1: null == name1
          ? _value.name1
          : name1 // ignore: cast_nullable_to_non_nullable
              as String,
      name2: null == name2
          ? _value.name2
          : name2 // ignore: cast_nullable_to_non_nullable
              as String,
      name3: null == name3
          ? _value.name3
          : name3 // ignore: cast_nullable_to_non_nullable
              as String,
      name4: null == name4
          ? _value.name4
          : name4 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CustomerNameImpl extends _CustomerName {
  const _$CustomerNameImpl(
      {required this.name1,
      required this.name2,
      required this.name3,
      required this.name4})
      : super._();

  @override
  final String name1;
  @override
  final String name2;
  @override
  final String name3;
  @override
  final String name4;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerNameImpl &&
            (identical(other.name1, name1) || other.name1 == name1) &&
            (identical(other.name2, name2) || other.name2 == name2) &&
            (identical(other.name3, name3) || other.name3 == name3) &&
            (identical(other.name4, name4) || other.name4 == name4));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name1, name2, name3, name4);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerNameImplCopyWith<_$CustomerNameImpl> get copyWith =>
      __$$CustomerNameImplCopyWithImpl<_$CustomerNameImpl>(this, _$identity);
}

abstract class _CustomerName extends CustomerName {
  const factory _CustomerName(
      {required final String name1,
      required final String name2,
      required final String name3,
      required final String name4}) = _$CustomerNameImpl;
  const _CustomerName._() : super._();

  @override
  String get name1;
  @override
  String get name2;
  @override
  String get name3;
  @override
  String get name4;
  @override
  @JsonKey(ignore: true)
  _$$CustomerNameImplCopyWith<_$CustomerNameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

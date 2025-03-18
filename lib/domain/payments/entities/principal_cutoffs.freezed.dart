// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'principal_cutoffs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PrincipalCutoffs {
  int get total => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PrincipalCutoffsCopyWith<PrincipalCutoffs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrincipalCutoffsCopyWith<$Res> {
  factory $PrincipalCutoffsCopyWith(
          PrincipalCutoffs value, $Res Function(PrincipalCutoffs) then) =
      _$PrincipalCutoffsCopyWithImpl<$Res, PrincipalCutoffs>;
  @useResult
  $Res call({int total});
}

/// @nodoc
class _$PrincipalCutoffsCopyWithImpl<$Res, $Val extends PrincipalCutoffs>
    implements $PrincipalCutoffsCopyWith<$Res> {
  _$PrincipalCutoffsCopyWithImpl(this._value, this._then);

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
abstract class _$$PrincipalCutoffsImplCopyWith<$Res>
    implements $PrincipalCutoffsCopyWith<$Res> {
  factory _$$PrincipalCutoffsImplCopyWith(_$PrincipalCutoffsImpl value,
          $Res Function(_$PrincipalCutoffsImpl) then) =
      __$$PrincipalCutoffsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total});
}

/// @nodoc
class __$$PrincipalCutoffsImplCopyWithImpl<$Res>
    extends _$PrincipalCutoffsCopyWithImpl<$Res, _$PrincipalCutoffsImpl>
    implements _$$PrincipalCutoffsImplCopyWith<$Res> {
  __$$PrincipalCutoffsImplCopyWithImpl(_$PrincipalCutoffsImpl _value,
      $Res Function(_$PrincipalCutoffsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
  }) {
    return _then(_$PrincipalCutoffsImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PrincipalCutoffsImpl extends _PrincipalCutoffs {
  const _$PrincipalCutoffsImpl({required this.total}) : super._();

  @override
  final int total;

  @override
  String toString() {
    return 'PrincipalCutoffs(total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrincipalCutoffsImpl &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode => Object.hash(runtimeType, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PrincipalCutoffsImplCopyWith<_$PrincipalCutoffsImpl> get copyWith =>
      __$$PrincipalCutoffsImplCopyWithImpl<_$PrincipalCutoffsImpl>(
          this, _$identity);
}

abstract class _PrincipalCutoffs extends PrincipalCutoffs {
  const factory _PrincipalCutoffs({required final int total}) =
      _$PrincipalCutoffsImpl;
  const _PrincipalCutoffs._() : super._();

  @override
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$PrincipalCutoffsImplCopyWith<_$PrincipalCutoffsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

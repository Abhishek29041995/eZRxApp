// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'principal_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PrincipalData {
  PrincipalName get principalName => throw _privateConstructorUsedError;
  PrincipalCode get principalCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PrincipalDataCopyWith<PrincipalData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrincipalDataCopyWith<$Res> {
  factory $PrincipalDataCopyWith(
          PrincipalData value, $Res Function(PrincipalData) then) =
      _$PrincipalDataCopyWithImpl<$Res, PrincipalData>;
  @useResult
  $Res call({PrincipalName principalName, PrincipalCode principalCode});
}

/// @nodoc
class _$PrincipalDataCopyWithImpl<$Res, $Val extends PrincipalData>
    implements $PrincipalDataCopyWith<$Res> {
  _$PrincipalDataCopyWithImpl(this._value, this._then);

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
              as PrincipalName,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as PrincipalCode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrincipalDataImplCopyWith<$Res>
    implements $PrincipalDataCopyWith<$Res> {
  factory _$$PrincipalDataImplCopyWith(
          _$PrincipalDataImpl value, $Res Function(_$PrincipalDataImpl) then) =
      __$$PrincipalDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PrincipalName principalName, PrincipalCode principalCode});
}

/// @nodoc
class __$$PrincipalDataImplCopyWithImpl<$Res>
    extends _$PrincipalDataCopyWithImpl<$Res, _$PrincipalDataImpl>
    implements _$$PrincipalDataImplCopyWith<$Res> {
  __$$PrincipalDataImplCopyWithImpl(
      _$PrincipalDataImpl _value, $Res Function(_$PrincipalDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? principalName = null,
    Object? principalCode = null,
  }) {
    return _then(_$PrincipalDataImpl(
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as PrincipalName,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as PrincipalCode,
    ));
  }
}

/// @nodoc

class _$PrincipalDataImpl extends _PrincipalData {
  const _$PrincipalDataImpl(
      {required this.principalName, required this.principalCode})
      : super._();

  @override
  final PrincipalName principalName;
  @override
  final PrincipalCode principalCode;

  @override
  String toString() {
    return 'PrincipalData(principalName: $principalName, principalCode: $principalCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrincipalDataImpl &&
            (identical(other.principalName, principalName) ||
                other.principalName == principalName) &&
            (identical(other.principalCode, principalCode) ||
                other.principalCode == principalCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, principalName, principalCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PrincipalDataImplCopyWith<_$PrincipalDataImpl> get copyWith =>
      __$$PrincipalDataImplCopyWithImpl<_$PrincipalDataImpl>(this, _$identity);
}

abstract class _PrincipalData extends PrincipalData {
  const factory _PrincipalData(
      {required final PrincipalName principalName,
      required final PrincipalCode principalCode}) = _$PrincipalDataImpl;
  const _PrincipalData._() : super._();

  @override
  PrincipalName get principalName;
  @override
  PrincipalCode get principalCode;
  @override
  @JsonKey(ignore: true)
  _$$PrincipalDataImplCopyWith<_$PrincipalDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

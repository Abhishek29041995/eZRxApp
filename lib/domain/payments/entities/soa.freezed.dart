// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'soa.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Soa {
  SoaData get soaData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SoaCopyWith<Soa> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SoaCopyWith<$Res> {
  factory $SoaCopyWith(Soa value, $Res Function(Soa) then) =
      _$SoaCopyWithImpl<$Res, Soa>;
  @useResult
  $Res call({SoaData soaData});
}

/// @nodoc
class _$SoaCopyWithImpl<$Res, $Val extends Soa> implements $SoaCopyWith<$Res> {
  _$SoaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soaData = null,
  }) {
    return _then(_value.copyWith(
      soaData: null == soaData
          ? _value.soaData
          : soaData // ignore: cast_nullable_to_non_nullable
              as SoaData,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SoaImplCopyWith<$Res> implements $SoaCopyWith<$Res> {
  factory _$$SoaImplCopyWith(_$SoaImpl value, $Res Function(_$SoaImpl) then) =
      __$$SoaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SoaData soaData});
}

/// @nodoc
class __$$SoaImplCopyWithImpl<$Res> extends _$SoaCopyWithImpl<$Res, _$SoaImpl>
    implements _$$SoaImplCopyWith<$Res> {
  __$$SoaImplCopyWithImpl(_$SoaImpl _value, $Res Function(_$SoaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soaData = null,
  }) {
    return _then(_$SoaImpl(
      soaData: null == soaData
          ? _value.soaData
          : soaData // ignore: cast_nullable_to_non_nullable
              as SoaData,
    ));
  }
}

/// @nodoc

class _$SoaImpl implements _Soa {
  _$SoaImpl({required this.soaData});

  @override
  final SoaData soaData;

  @override
  String toString() {
    return 'Soa(soaData: $soaData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SoaImpl &&
            (identical(other.soaData, soaData) || other.soaData == soaData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, soaData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SoaImplCopyWith<_$SoaImpl> get copyWith =>
      __$$SoaImplCopyWithImpl<_$SoaImpl>(this, _$identity);
}

abstract class _Soa implements Soa {
  factory _Soa({required final SoaData soaData}) = _$SoaImpl;

  @override
  SoaData get soaData;
  @override
  @JsonKey(ignore: true)
  _$$SoaImplCopyWith<_$SoaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

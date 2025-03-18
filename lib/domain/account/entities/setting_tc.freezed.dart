// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_tc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingTc {
  bool get acceptTC => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingTcCopyWith<SettingTc> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingTcCopyWith<$Res> {
  factory $SettingTcCopyWith(SettingTc value, $Res Function(SettingTc) then) =
      _$SettingTcCopyWithImpl<$Res, SettingTc>;
  @useResult
  $Res call({bool acceptTC});
}

/// @nodoc
class _$SettingTcCopyWithImpl<$Res, $Val extends SettingTc>
    implements $SettingTcCopyWith<$Res> {
  _$SettingTcCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acceptTC = null,
  }) {
    return _then(_value.copyWith(
      acceptTC: null == acceptTC
          ? _value.acceptTC
          : acceptTC // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingTcImplCopyWith<$Res>
    implements $SettingTcCopyWith<$Res> {
  factory _$$SettingTcImplCopyWith(
          _$SettingTcImpl value, $Res Function(_$SettingTcImpl) then) =
      __$$SettingTcImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool acceptTC});
}

/// @nodoc
class __$$SettingTcImplCopyWithImpl<$Res>
    extends _$SettingTcCopyWithImpl<$Res, _$SettingTcImpl>
    implements _$$SettingTcImplCopyWith<$Res> {
  __$$SettingTcImplCopyWithImpl(
      _$SettingTcImpl _value, $Res Function(_$SettingTcImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acceptTC = null,
  }) {
    return _then(_$SettingTcImpl(
      acceptTC: null == acceptTC
          ? _value.acceptTC
          : acceptTC // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SettingTcImpl extends _SettingTc {
  const _$SettingTcImpl({required this.acceptTC}) : super._();

  @override
  final bool acceptTC;

  @override
  String toString() {
    return 'SettingTc(acceptTC: $acceptTC)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingTcImpl &&
            (identical(other.acceptTC, acceptTC) ||
                other.acceptTC == acceptTC));
  }

  @override
  int get hashCode => Object.hash(runtimeType, acceptTC);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingTcImplCopyWith<_$SettingTcImpl> get copyWith =>
      __$$SettingTcImplCopyWithImpl<_$SettingTcImpl>(this, _$identity);
}

abstract class _SettingTc extends SettingTc {
  const factory _SettingTc({required final bool acceptTC}) = _$SettingTcImpl;
  const _SettingTc._() : super._();

  @override
  bool get acceptTC;
  @override
  @JsonKey(ignore: true)
  _$$SettingTcImplCopyWith<_$SettingTcImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cred.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Cred {
  Username get username => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CredCopyWith<Cred> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CredCopyWith<$Res> {
  factory $CredCopyWith(Cred value, $Res Function(Cred) then) =
      _$CredCopyWithImpl<$Res, Cred>;
  @useResult
  $Res call({Username username, Password password});
}

/// @nodoc
class _$CredCopyWithImpl<$Res, $Val extends Cred>
    implements $CredCopyWith<$Res> {
  _$CredCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CredImplCopyWith<$Res> implements $CredCopyWith<$Res> {
  factory _$$CredImplCopyWith(
          _$CredImpl value, $Res Function(_$CredImpl) then) =
      __$$CredImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Username username, Password password});
}

/// @nodoc
class __$$CredImplCopyWithImpl<$Res>
    extends _$CredCopyWithImpl<$Res, _$CredImpl>
    implements _$$CredImplCopyWith<$Res> {
  __$$CredImplCopyWithImpl(_$CredImpl _value, $Res Function(_$CredImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_$CredImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
    ));
  }
}

/// @nodoc

class _$CredImpl extends _Cred {
  const _$CredImpl({required this.username, required this.password})
      : super._();

  @override
  final Username username;
  @override
  final Password password;

  @override
  String toString() {
    return 'Cred(username: $username, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CredImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CredImplCopyWith<_$CredImpl> get copyWith =>
      __$$CredImplCopyWithImpl<_$CredImpl>(this, _$identity);
}

abstract class _Cred extends Cred {
  const factory _Cred(
      {required final Username username,
      required final Password password}) = _$CredImpl;
  const _Cred._() : super._();

  @override
  Username get username;
  @override
  Password get password;
  @override
  @JsonKey(ignore: true)
  _$$CredImplCopyWith<_$CredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

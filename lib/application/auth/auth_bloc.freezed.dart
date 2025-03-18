// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() bioCheck,
    required TResult Function() authCheck,
    required TResult Function() refreshEZRXToken,
    required TResult Function() logout,
    required TResult Function() checkIfBiometricDenied,
    required TResult Function() visitedAppSettings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? bioCheck,
    TResult? Function()? authCheck,
    TResult? Function()? refreshEZRXToken,
    TResult? Function()? logout,
    TResult? Function()? checkIfBiometricDenied,
    TResult? Function()? visitedAppSettings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? bioCheck,
    TResult Function()? authCheck,
    TResult Function()? refreshEZRXToken,
    TResult Function()? logout,
    TResult Function()? checkIfBiometricDenied,
    TResult Function()? visitedAppSettings,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInit value) init,
    required TResult Function(_BioCheck value) bioCheck,
    required TResult Function(_AuthCheck value) authCheck,
    required TResult Function(_RefreshEZRXToken value) refreshEZRXToken,
    required TResult Function(_Logout value) logout,
    required TResult Function(_CheckIfBiometricDenied value)
        checkIfBiometricDenied,
    required TResult Function(_ToggleAppSettings value) visitedAppSettings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInit value)? init,
    TResult? Function(_BioCheck value)? bioCheck,
    TResult? Function(_AuthCheck value)? authCheck,
    TResult? Function(_RefreshEZRXToken value)? refreshEZRXToken,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_CheckIfBiometricDenied value)? checkIfBiometricDenied,
    TResult? Function(_ToggleAppSettings value)? visitedAppSettings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInit value)? init,
    TResult Function(_BioCheck value)? bioCheck,
    TResult Function(_AuthCheck value)? authCheck,
    TResult Function(_RefreshEZRXToken value)? refreshEZRXToken,
    TResult Function(_Logout value)? logout,
    TResult Function(_CheckIfBiometricDenied value)? checkIfBiometricDenied,
    TResult Function(_ToggleAppSettings value)? visitedAppSettings,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthInitImplCopyWith<$Res> {
  factory _$$AuthInitImplCopyWith(
          _$AuthInitImpl value, $Res Function(_$AuthInitImpl) then) =
      __$$AuthInitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthInitImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthInitImpl>
    implements _$$AuthInitImplCopyWith<$Res> {
  __$$AuthInitImplCopyWithImpl(
      _$AuthInitImpl _value, $Res Function(_$AuthInitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthInitImpl implements _AuthInit {
  const _$AuthInitImpl();

  @override
  String toString() {
    return 'AuthEvent.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthInitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() bioCheck,
    required TResult Function() authCheck,
    required TResult Function() refreshEZRXToken,
    required TResult Function() logout,
    required TResult Function() checkIfBiometricDenied,
    required TResult Function() visitedAppSettings,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? bioCheck,
    TResult? Function()? authCheck,
    TResult? Function()? refreshEZRXToken,
    TResult? Function()? logout,
    TResult? Function()? checkIfBiometricDenied,
    TResult? Function()? visitedAppSettings,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? bioCheck,
    TResult Function()? authCheck,
    TResult Function()? refreshEZRXToken,
    TResult Function()? logout,
    TResult Function()? checkIfBiometricDenied,
    TResult Function()? visitedAppSettings,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInit value) init,
    required TResult Function(_BioCheck value) bioCheck,
    required TResult Function(_AuthCheck value) authCheck,
    required TResult Function(_RefreshEZRXToken value) refreshEZRXToken,
    required TResult Function(_Logout value) logout,
    required TResult Function(_CheckIfBiometricDenied value)
        checkIfBiometricDenied,
    required TResult Function(_ToggleAppSettings value) visitedAppSettings,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInit value)? init,
    TResult? Function(_BioCheck value)? bioCheck,
    TResult? Function(_AuthCheck value)? authCheck,
    TResult? Function(_RefreshEZRXToken value)? refreshEZRXToken,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_CheckIfBiometricDenied value)? checkIfBiometricDenied,
    TResult? Function(_ToggleAppSettings value)? visitedAppSettings,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInit value)? init,
    TResult Function(_BioCheck value)? bioCheck,
    TResult Function(_AuthCheck value)? authCheck,
    TResult Function(_RefreshEZRXToken value)? refreshEZRXToken,
    TResult Function(_Logout value)? logout,
    TResult Function(_CheckIfBiometricDenied value)? checkIfBiometricDenied,
    TResult Function(_ToggleAppSettings value)? visitedAppSettings,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _AuthInit implements AuthEvent {
  const factory _AuthInit() = _$AuthInitImpl;
}

/// @nodoc
abstract class _$$BioCheckImplCopyWith<$Res> {
  factory _$$BioCheckImplCopyWith(
          _$BioCheckImpl value, $Res Function(_$BioCheckImpl) then) =
      __$$BioCheckImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BioCheckImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$BioCheckImpl>
    implements _$$BioCheckImplCopyWith<$Res> {
  __$$BioCheckImplCopyWithImpl(
      _$BioCheckImpl _value, $Res Function(_$BioCheckImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BioCheckImpl implements _BioCheck {
  const _$BioCheckImpl();

  @override
  String toString() {
    return 'AuthEvent.bioCheck()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BioCheckImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() bioCheck,
    required TResult Function() authCheck,
    required TResult Function() refreshEZRXToken,
    required TResult Function() logout,
    required TResult Function() checkIfBiometricDenied,
    required TResult Function() visitedAppSettings,
  }) {
    return bioCheck();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? bioCheck,
    TResult? Function()? authCheck,
    TResult? Function()? refreshEZRXToken,
    TResult? Function()? logout,
    TResult? Function()? checkIfBiometricDenied,
    TResult? Function()? visitedAppSettings,
  }) {
    return bioCheck?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? bioCheck,
    TResult Function()? authCheck,
    TResult Function()? refreshEZRXToken,
    TResult Function()? logout,
    TResult Function()? checkIfBiometricDenied,
    TResult Function()? visitedAppSettings,
    required TResult orElse(),
  }) {
    if (bioCheck != null) {
      return bioCheck();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInit value) init,
    required TResult Function(_BioCheck value) bioCheck,
    required TResult Function(_AuthCheck value) authCheck,
    required TResult Function(_RefreshEZRXToken value) refreshEZRXToken,
    required TResult Function(_Logout value) logout,
    required TResult Function(_CheckIfBiometricDenied value)
        checkIfBiometricDenied,
    required TResult Function(_ToggleAppSettings value) visitedAppSettings,
  }) {
    return bioCheck(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInit value)? init,
    TResult? Function(_BioCheck value)? bioCheck,
    TResult? Function(_AuthCheck value)? authCheck,
    TResult? Function(_RefreshEZRXToken value)? refreshEZRXToken,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_CheckIfBiometricDenied value)? checkIfBiometricDenied,
    TResult? Function(_ToggleAppSettings value)? visitedAppSettings,
  }) {
    return bioCheck?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInit value)? init,
    TResult Function(_BioCheck value)? bioCheck,
    TResult Function(_AuthCheck value)? authCheck,
    TResult Function(_RefreshEZRXToken value)? refreshEZRXToken,
    TResult Function(_Logout value)? logout,
    TResult Function(_CheckIfBiometricDenied value)? checkIfBiometricDenied,
    TResult Function(_ToggleAppSettings value)? visitedAppSettings,
    required TResult orElse(),
  }) {
    if (bioCheck != null) {
      return bioCheck(this);
    }
    return orElse();
  }
}

abstract class _BioCheck implements AuthEvent {
  const factory _BioCheck() = _$BioCheckImpl;
}

/// @nodoc
abstract class _$$AuthCheckImplCopyWith<$Res> {
  factory _$$AuthCheckImplCopyWith(
          _$AuthCheckImpl value, $Res Function(_$AuthCheckImpl) then) =
      __$$AuthCheckImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthCheckImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthCheckImpl>
    implements _$$AuthCheckImplCopyWith<$Res> {
  __$$AuthCheckImplCopyWithImpl(
      _$AuthCheckImpl _value, $Res Function(_$AuthCheckImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthCheckImpl implements _AuthCheck {
  const _$AuthCheckImpl();

  @override
  String toString() {
    return 'AuthEvent.authCheck()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthCheckImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() bioCheck,
    required TResult Function() authCheck,
    required TResult Function() refreshEZRXToken,
    required TResult Function() logout,
    required TResult Function() checkIfBiometricDenied,
    required TResult Function() visitedAppSettings,
  }) {
    return authCheck();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? bioCheck,
    TResult? Function()? authCheck,
    TResult? Function()? refreshEZRXToken,
    TResult? Function()? logout,
    TResult? Function()? checkIfBiometricDenied,
    TResult? Function()? visitedAppSettings,
  }) {
    return authCheck?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? bioCheck,
    TResult Function()? authCheck,
    TResult Function()? refreshEZRXToken,
    TResult Function()? logout,
    TResult Function()? checkIfBiometricDenied,
    TResult Function()? visitedAppSettings,
    required TResult orElse(),
  }) {
    if (authCheck != null) {
      return authCheck();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInit value) init,
    required TResult Function(_BioCheck value) bioCheck,
    required TResult Function(_AuthCheck value) authCheck,
    required TResult Function(_RefreshEZRXToken value) refreshEZRXToken,
    required TResult Function(_Logout value) logout,
    required TResult Function(_CheckIfBiometricDenied value)
        checkIfBiometricDenied,
    required TResult Function(_ToggleAppSettings value) visitedAppSettings,
  }) {
    return authCheck(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInit value)? init,
    TResult? Function(_BioCheck value)? bioCheck,
    TResult? Function(_AuthCheck value)? authCheck,
    TResult? Function(_RefreshEZRXToken value)? refreshEZRXToken,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_CheckIfBiometricDenied value)? checkIfBiometricDenied,
    TResult? Function(_ToggleAppSettings value)? visitedAppSettings,
  }) {
    return authCheck?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInit value)? init,
    TResult Function(_BioCheck value)? bioCheck,
    TResult Function(_AuthCheck value)? authCheck,
    TResult Function(_RefreshEZRXToken value)? refreshEZRXToken,
    TResult Function(_Logout value)? logout,
    TResult Function(_CheckIfBiometricDenied value)? checkIfBiometricDenied,
    TResult Function(_ToggleAppSettings value)? visitedAppSettings,
    required TResult orElse(),
  }) {
    if (authCheck != null) {
      return authCheck(this);
    }
    return orElse();
  }
}

abstract class _AuthCheck implements AuthEvent {
  const factory _AuthCheck() = _$AuthCheckImpl;
}

/// @nodoc
abstract class _$$RefreshEZRXTokenImplCopyWith<$Res> {
  factory _$$RefreshEZRXTokenImplCopyWith(_$RefreshEZRXTokenImpl value,
          $Res Function(_$RefreshEZRXTokenImpl) then) =
      __$$RefreshEZRXTokenImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshEZRXTokenImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$RefreshEZRXTokenImpl>
    implements _$$RefreshEZRXTokenImplCopyWith<$Res> {
  __$$RefreshEZRXTokenImplCopyWithImpl(_$RefreshEZRXTokenImpl _value,
      $Res Function(_$RefreshEZRXTokenImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RefreshEZRXTokenImpl implements _RefreshEZRXToken {
  const _$RefreshEZRXTokenImpl();

  @override
  String toString() {
    return 'AuthEvent.refreshEZRXToken()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshEZRXTokenImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() bioCheck,
    required TResult Function() authCheck,
    required TResult Function() refreshEZRXToken,
    required TResult Function() logout,
    required TResult Function() checkIfBiometricDenied,
    required TResult Function() visitedAppSettings,
  }) {
    return refreshEZRXToken();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? bioCheck,
    TResult? Function()? authCheck,
    TResult? Function()? refreshEZRXToken,
    TResult? Function()? logout,
    TResult? Function()? checkIfBiometricDenied,
    TResult? Function()? visitedAppSettings,
  }) {
    return refreshEZRXToken?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? bioCheck,
    TResult Function()? authCheck,
    TResult Function()? refreshEZRXToken,
    TResult Function()? logout,
    TResult Function()? checkIfBiometricDenied,
    TResult Function()? visitedAppSettings,
    required TResult orElse(),
  }) {
    if (refreshEZRXToken != null) {
      return refreshEZRXToken();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInit value) init,
    required TResult Function(_BioCheck value) bioCheck,
    required TResult Function(_AuthCheck value) authCheck,
    required TResult Function(_RefreshEZRXToken value) refreshEZRXToken,
    required TResult Function(_Logout value) logout,
    required TResult Function(_CheckIfBiometricDenied value)
        checkIfBiometricDenied,
    required TResult Function(_ToggleAppSettings value) visitedAppSettings,
  }) {
    return refreshEZRXToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInit value)? init,
    TResult? Function(_BioCheck value)? bioCheck,
    TResult? Function(_AuthCheck value)? authCheck,
    TResult? Function(_RefreshEZRXToken value)? refreshEZRXToken,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_CheckIfBiometricDenied value)? checkIfBiometricDenied,
    TResult? Function(_ToggleAppSettings value)? visitedAppSettings,
  }) {
    return refreshEZRXToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInit value)? init,
    TResult Function(_BioCheck value)? bioCheck,
    TResult Function(_AuthCheck value)? authCheck,
    TResult Function(_RefreshEZRXToken value)? refreshEZRXToken,
    TResult Function(_Logout value)? logout,
    TResult Function(_CheckIfBiometricDenied value)? checkIfBiometricDenied,
    TResult Function(_ToggleAppSettings value)? visitedAppSettings,
    required TResult orElse(),
  }) {
    if (refreshEZRXToken != null) {
      return refreshEZRXToken(this);
    }
    return orElse();
  }
}

abstract class _RefreshEZRXToken implements AuthEvent {
  const factory _RefreshEZRXToken() = _$RefreshEZRXTokenImpl;
}

/// @nodoc
abstract class _$$LogoutImplCopyWith<$Res> {
  factory _$$LogoutImplCopyWith(
          _$LogoutImpl value, $Res Function(_$LogoutImpl) then) =
      __$$LogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LogoutImpl>
    implements _$$LogoutImplCopyWith<$Res> {
  __$$LogoutImplCopyWithImpl(
      _$LogoutImpl _value, $Res Function(_$LogoutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogoutImpl implements _Logout {
  const _$LogoutImpl();

  @override
  String toString() {
    return 'AuthEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() bioCheck,
    required TResult Function() authCheck,
    required TResult Function() refreshEZRXToken,
    required TResult Function() logout,
    required TResult Function() checkIfBiometricDenied,
    required TResult Function() visitedAppSettings,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? bioCheck,
    TResult? Function()? authCheck,
    TResult? Function()? refreshEZRXToken,
    TResult? Function()? logout,
    TResult? Function()? checkIfBiometricDenied,
    TResult? Function()? visitedAppSettings,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? bioCheck,
    TResult Function()? authCheck,
    TResult Function()? refreshEZRXToken,
    TResult Function()? logout,
    TResult Function()? checkIfBiometricDenied,
    TResult Function()? visitedAppSettings,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInit value) init,
    required TResult Function(_BioCheck value) bioCheck,
    required TResult Function(_AuthCheck value) authCheck,
    required TResult Function(_RefreshEZRXToken value) refreshEZRXToken,
    required TResult Function(_Logout value) logout,
    required TResult Function(_CheckIfBiometricDenied value)
        checkIfBiometricDenied,
    required TResult Function(_ToggleAppSettings value) visitedAppSettings,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInit value)? init,
    TResult? Function(_BioCheck value)? bioCheck,
    TResult? Function(_AuthCheck value)? authCheck,
    TResult? Function(_RefreshEZRXToken value)? refreshEZRXToken,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_CheckIfBiometricDenied value)? checkIfBiometricDenied,
    TResult? Function(_ToggleAppSettings value)? visitedAppSettings,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInit value)? init,
    TResult Function(_BioCheck value)? bioCheck,
    TResult Function(_AuthCheck value)? authCheck,
    TResult Function(_RefreshEZRXToken value)? refreshEZRXToken,
    TResult Function(_Logout value)? logout,
    TResult Function(_CheckIfBiometricDenied value)? checkIfBiometricDenied,
    TResult Function(_ToggleAppSettings value)? visitedAppSettings,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _Logout implements AuthEvent {
  const factory _Logout() = _$LogoutImpl;
}

/// @nodoc
abstract class _$$CheckIfBiometricDeniedImplCopyWith<$Res> {
  factory _$$CheckIfBiometricDeniedImplCopyWith(
          _$CheckIfBiometricDeniedImpl value,
          $Res Function(_$CheckIfBiometricDeniedImpl) then) =
      __$$CheckIfBiometricDeniedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckIfBiometricDeniedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$CheckIfBiometricDeniedImpl>
    implements _$$CheckIfBiometricDeniedImplCopyWith<$Res> {
  __$$CheckIfBiometricDeniedImplCopyWithImpl(
      _$CheckIfBiometricDeniedImpl _value,
      $Res Function(_$CheckIfBiometricDeniedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckIfBiometricDeniedImpl implements _CheckIfBiometricDenied {
  const _$CheckIfBiometricDeniedImpl();

  @override
  String toString() {
    return 'AuthEvent.checkIfBiometricDenied()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckIfBiometricDeniedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() bioCheck,
    required TResult Function() authCheck,
    required TResult Function() refreshEZRXToken,
    required TResult Function() logout,
    required TResult Function() checkIfBiometricDenied,
    required TResult Function() visitedAppSettings,
  }) {
    return checkIfBiometricDenied();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? bioCheck,
    TResult? Function()? authCheck,
    TResult? Function()? refreshEZRXToken,
    TResult? Function()? logout,
    TResult? Function()? checkIfBiometricDenied,
    TResult? Function()? visitedAppSettings,
  }) {
    return checkIfBiometricDenied?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? bioCheck,
    TResult Function()? authCheck,
    TResult Function()? refreshEZRXToken,
    TResult Function()? logout,
    TResult Function()? checkIfBiometricDenied,
    TResult Function()? visitedAppSettings,
    required TResult orElse(),
  }) {
    if (checkIfBiometricDenied != null) {
      return checkIfBiometricDenied();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInit value) init,
    required TResult Function(_BioCheck value) bioCheck,
    required TResult Function(_AuthCheck value) authCheck,
    required TResult Function(_RefreshEZRXToken value) refreshEZRXToken,
    required TResult Function(_Logout value) logout,
    required TResult Function(_CheckIfBiometricDenied value)
        checkIfBiometricDenied,
    required TResult Function(_ToggleAppSettings value) visitedAppSettings,
  }) {
    return checkIfBiometricDenied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInit value)? init,
    TResult? Function(_BioCheck value)? bioCheck,
    TResult? Function(_AuthCheck value)? authCheck,
    TResult? Function(_RefreshEZRXToken value)? refreshEZRXToken,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_CheckIfBiometricDenied value)? checkIfBiometricDenied,
    TResult? Function(_ToggleAppSettings value)? visitedAppSettings,
  }) {
    return checkIfBiometricDenied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInit value)? init,
    TResult Function(_BioCheck value)? bioCheck,
    TResult Function(_AuthCheck value)? authCheck,
    TResult Function(_RefreshEZRXToken value)? refreshEZRXToken,
    TResult Function(_Logout value)? logout,
    TResult Function(_CheckIfBiometricDenied value)? checkIfBiometricDenied,
    TResult Function(_ToggleAppSettings value)? visitedAppSettings,
    required TResult orElse(),
  }) {
    if (checkIfBiometricDenied != null) {
      return checkIfBiometricDenied(this);
    }
    return orElse();
  }
}

abstract class _CheckIfBiometricDenied implements AuthEvent {
  const factory _CheckIfBiometricDenied() = _$CheckIfBiometricDeniedImpl;
}

/// @nodoc
abstract class _$$ToggleAppSettingsImplCopyWith<$Res> {
  factory _$$ToggleAppSettingsImplCopyWith(_$ToggleAppSettingsImpl value,
          $Res Function(_$ToggleAppSettingsImpl) then) =
      __$$ToggleAppSettingsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleAppSettingsImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ToggleAppSettingsImpl>
    implements _$$ToggleAppSettingsImplCopyWith<$Res> {
  __$$ToggleAppSettingsImplCopyWithImpl(_$ToggleAppSettingsImpl _value,
      $Res Function(_$ToggleAppSettingsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ToggleAppSettingsImpl implements _ToggleAppSettings {
  const _$ToggleAppSettingsImpl();

  @override
  String toString() {
    return 'AuthEvent.visitedAppSettings()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToggleAppSettingsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() bioCheck,
    required TResult Function() authCheck,
    required TResult Function() refreshEZRXToken,
    required TResult Function() logout,
    required TResult Function() checkIfBiometricDenied,
    required TResult Function() visitedAppSettings,
  }) {
    return visitedAppSettings();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? bioCheck,
    TResult? Function()? authCheck,
    TResult? Function()? refreshEZRXToken,
    TResult? Function()? logout,
    TResult? Function()? checkIfBiometricDenied,
    TResult? Function()? visitedAppSettings,
  }) {
    return visitedAppSettings?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? bioCheck,
    TResult Function()? authCheck,
    TResult Function()? refreshEZRXToken,
    TResult Function()? logout,
    TResult Function()? checkIfBiometricDenied,
    TResult Function()? visitedAppSettings,
    required TResult orElse(),
  }) {
    if (visitedAppSettings != null) {
      return visitedAppSettings();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInit value) init,
    required TResult Function(_BioCheck value) bioCheck,
    required TResult Function(_AuthCheck value) authCheck,
    required TResult Function(_RefreshEZRXToken value) refreshEZRXToken,
    required TResult Function(_Logout value) logout,
    required TResult Function(_CheckIfBiometricDenied value)
        checkIfBiometricDenied,
    required TResult Function(_ToggleAppSettings value) visitedAppSettings,
  }) {
    return visitedAppSettings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInit value)? init,
    TResult? Function(_BioCheck value)? bioCheck,
    TResult? Function(_AuthCheck value)? authCheck,
    TResult? Function(_RefreshEZRXToken value)? refreshEZRXToken,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_CheckIfBiometricDenied value)? checkIfBiometricDenied,
    TResult? Function(_ToggleAppSettings value)? visitedAppSettings,
  }) {
    return visitedAppSettings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInit value)? init,
    TResult Function(_BioCheck value)? bioCheck,
    TResult Function(_AuthCheck value)? authCheck,
    TResult Function(_RefreshEZRXToken value)? refreshEZRXToken,
    TResult Function(_Logout value)? logout,
    TResult Function(_CheckIfBiometricDenied value)? checkIfBiometricDenied,
    TResult Function(_ToggleAppSettings value)? visitedAppSettings,
    required TResult orElse(),
  }) {
    if (visitedAppSettings != null) {
      return visitedAppSettings(this);
    }
    return orElse();
  }
}

abstract class _ToggleAppSettings implements AuthEvent {
  const factory _ToggleAppSettings() = _$ToggleAppSettingsImpl;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() biometricDenied,
    required TResult Function() visitedAppSettings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? biometricDenied,
    TResult? Function()? visitedAppSettings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? biometricDenied,
    TResult Function()? visitedAppSettings,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_BiometricDenied value) biometricDenied,
    required TResult Function(_VisitedAppSettings value) visitedAppSettings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_BiometricDenied value)? biometricDenied,
    TResult? Function(_VisitedAppSettings value)? visitedAppSettings,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_BiometricDenied value)? biometricDenied,
    TResult Function(_VisitedAppSettings value)? visitedAppSettings,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() biometricDenied,
    required TResult Function() visitedAppSettings,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? biometricDenied,
    TResult? Function()? visitedAppSettings,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? biometricDenied,
    TResult Function()? visitedAppSettings,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_BiometricDenied value) biometricDenied,
    required TResult Function(_VisitedAppSettings value) visitedAppSettings,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_BiometricDenied value)? biometricDenied,
    TResult? Function(_VisitedAppSettings value)? visitedAppSettings,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_BiometricDenied value)? biometricDenied,
    TResult Function(_VisitedAppSettings value)? visitedAppSettings,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$AuthenticatedImplCopyWith<$Res> {
  factory _$$AuthenticatedImplCopyWith(
          _$AuthenticatedImpl value, $Res Function(_$AuthenticatedImpl) then) =
      __$$AuthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthenticatedImpl>
    implements _$$AuthenticatedImplCopyWith<$Res> {
  __$$AuthenticatedImplCopyWithImpl(
      _$AuthenticatedImpl _value, $Res Function(_$AuthenticatedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthenticatedImpl implements _Authenticated {
  const _$AuthenticatedImpl();

  @override
  String toString() {
    return 'AuthState.authenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() biometricDenied,
    required TResult Function() visitedAppSettings,
  }) {
    return authenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? biometricDenied,
    TResult? Function()? visitedAppSettings,
  }) {
    return authenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? biometricDenied,
    TResult Function()? visitedAppSettings,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_BiometricDenied value) biometricDenied,
    required TResult Function(_VisitedAppSettings value) visitedAppSettings,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_BiometricDenied value)? biometricDenied,
    TResult? Function(_VisitedAppSettings value)? visitedAppSettings,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_BiometricDenied value)? biometricDenied,
    TResult Function(_VisitedAppSettings value)? visitedAppSettings,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _Authenticated implements AuthState {
  const factory _Authenticated() = _$AuthenticatedImpl;
}

/// @nodoc
abstract class _$$UnauthenticatedImplCopyWith<$Res> {
  factory _$$UnauthenticatedImplCopyWith(_$UnauthenticatedImpl value,
          $Res Function(_$UnauthenticatedImpl) then) =
      __$$UnauthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$UnauthenticatedImpl>
    implements _$$UnauthenticatedImplCopyWith<$Res> {
  __$$UnauthenticatedImplCopyWithImpl(
      _$UnauthenticatedImpl _value, $Res Function(_$UnauthenticatedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnauthenticatedImpl implements _Unauthenticated {
  const _$UnauthenticatedImpl();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnauthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() biometricDenied,
    required TResult Function() visitedAppSettings,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? biometricDenied,
    TResult? Function()? visitedAppSettings,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? biometricDenied,
    TResult Function()? visitedAppSettings,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_BiometricDenied value) biometricDenied,
    required TResult Function(_VisitedAppSettings value) visitedAppSettings,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_BiometricDenied value)? biometricDenied,
    TResult? Function(_VisitedAppSettings value)? visitedAppSettings,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_BiometricDenied value)? biometricDenied,
    TResult Function(_VisitedAppSettings value)? visitedAppSettings,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class _Unauthenticated implements AuthState {
  const factory _Unauthenticated() = _$UnauthenticatedImpl;
}

/// @nodoc
abstract class _$$BiometricDeniedImplCopyWith<$Res> {
  factory _$$BiometricDeniedImplCopyWith(_$BiometricDeniedImpl value,
          $Res Function(_$BiometricDeniedImpl) then) =
      __$$BiometricDeniedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BiometricDeniedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$BiometricDeniedImpl>
    implements _$$BiometricDeniedImplCopyWith<$Res> {
  __$$BiometricDeniedImplCopyWithImpl(
      _$BiometricDeniedImpl _value, $Res Function(_$BiometricDeniedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BiometricDeniedImpl implements _BiometricDenied {
  const _$BiometricDeniedImpl();

  @override
  String toString() {
    return 'AuthState.biometricDenied()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BiometricDeniedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() biometricDenied,
    required TResult Function() visitedAppSettings,
  }) {
    return biometricDenied();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? biometricDenied,
    TResult? Function()? visitedAppSettings,
  }) {
    return biometricDenied?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? biometricDenied,
    TResult Function()? visitedAppSettings,
    required TResult orElse(),
  }) {
    if (biometricDenied != null) {
      return biometricDenied();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_BiometricDenied value) biometricDenied,
    required TResult Function(_VisitedAppSettings value) visitedAppSettings,
  }) {
    return biometricDenied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_BiometricDenied value)? biometricDenied,
    TResult? Function(_VisitedAppSettings value)? visitedAppSettings,
  }) {
    return biometricDenied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_BiometricDenied value)? biometricDenied,
    TResult Function(_VisitedAppSettings value)? visitedAppSettings,
    required TResult orElse(),
  }) {
    if (biometricDenied != null) {
      return biometricDenied(this);
    }
    return orElse();
  }
}

abstract class _BiometricDenied implements AuthState {
  const factory _BiometricDenied() = _$BiometricDeniedImpl;
}

/// @nodoc
abstract class _$$VisitedAppSettingsImplCopyWith<$Res> {
  factory _$$VisitedAppSettingsImplCopyWith(_$VisitedAppSettingsImpl value,
          $Res Function(_$VisitedAppSettingsImpl) then) =
      __$$VisitedAppSettingsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VisitedAppSettingsImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$VisitedAppSettingsImpl>
    implements _$$VisitedAppSettingsImplCopyWith<$Res> {
  __$$VisitedAppSettingsImplCopyWithImpl(_$VisitedAppSettingsImpl _value,
      $Res Function(_$VisitedAppSettingsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$VisitedAppSettingsImpl implements _VisitedAppSettings {
  const _$VisitedAppSettingsImpl();

  @override
  String toString() {
    return 'AuthState.visitedAppSettings()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VisitedAppSettingsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() authenticated,
    required TResult Function() unauthenticated,
    required TResult Function() biometricDenied,
    required TResult Function() visitedAppSettings,
  }) {
    return visitedAppSettings();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function()? biometricDenied,
    TResult? Function()? visitedAppSettings,
  }) {
    return visitedAppSettings?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? authenticated,
    TResult Function()? unauthenticated,
    TResult Function()? biometricDenied,
    TResult Function()? visitedAppSettings,
    required TResult orElse(),
  }) {
    if (visitedAppSettings != null) {
      return visitedAppSettings();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_Unauthenticated value) unauthenticated,
    required TResult Function(_BiometricDenied value) biometricDenied,
    required TResult Function(_VisitedAppSettings value) visitedAppSettings,
  }) {
    return visitedAppSettings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_Unauthenticated value)? unauthenticated,
    TResult? Function(_BiometricDenied value)? biometricDenied,
    TResult? Function(_VisitedAppSettings value)? visitedAppSettings,
  }) {
    return visitedAppSettings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_Unauthenticated value)? unauthenticated,
    TResult Function(_BiometricDenied value)? biometricDenied,
    TResult Function(_VisitedAppSettings value)? visitedAppSettings,
    required TResult orElse(),
  }) {
    if (visitedAppSettings != null) {
      return visitedAppSettings(this);
    }
    return orElse();
  }
}

abstract class _VisitedAppSettings implements AuthState {
  const factory _VisitedAppSettings() = _$VisitedAppSettingsImpl;
}

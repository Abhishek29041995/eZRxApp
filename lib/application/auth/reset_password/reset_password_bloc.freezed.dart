// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResetPasswordEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PasswordFieldType fieldType, bool toggleValue)
        togglePasswordVisibility,
    required TResult Function(PasswordFieldType fieldType, String newValue)
        onTextChange,
    required TResult Function() changePassword,
    required TResult Function() clear,
    required TResult Function(User user, String resetPasswordKey) initialize,
    required TResult Function() resetPassword,
    required TResult Function() changePasswordForFirstTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult? Function(PasswordFieldType fieldType, String newValue)?
        onTextChange,
    TResult? Function()? changePassword,
    TResult? Function()? clear,
    TResult? Function(User user, String resetPasswordKey)? initialize,
    TResult? Function()? resetPassword,
    TResult? Function()? changePasswordForFirstTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult Function(PasswordFieldType fieldType, String newValue)?
        onTextChange,
    TResult Function()? changePassword,
    TResult Function()? clear,
    TResult Function(User user, String resetPasswordKey)? initialize,
    TResult Function()? resetPassword,
    TResult Function()? changePasswordForFirstTime,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_PasswordTextOnChange value) onTextChange,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_Clear value) clear,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ResetPasswords value) resetPassword,
    required TResult Function(_ChangePasswordForFirstTime value)
        changePasswordForFirstTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult? Function(_PasswordTextOnChange value)? onTextChange,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ResetPasswords value)? resetPassword,
    TResult? Function(_ChangePasswordForFirstTime value)?
        changePasswordForFirstTime,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_PasswordTextOnChange value)? onTextChange,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_Clear value)? clear,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ResetPasswords value)? resetPassword,
    TResult Function(_ChangePasswordForFirstTime value)?
        changePasswordForFirstTime,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordEventCopyWith<$Res> {
  factory $ResetPasswordEventCopyWith(
          ResetPasswordEvent value, $Res Function(ResetPasswordEvent) then) =
      _$ResetPasswordEventCopyWithImpl<$Res, ResetPasswordEvent>;
}

/// @nodoc
class _$ResetPasswordEventCopyWithImpl<$Res, $Val extends ResetPasswordEvent>
    implements $ResetPasswordEventCopyWith<$Res> {
  _$ResetPasswordEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PasswordVisibilityImplCopyWith<$Res> {
  factory _$$PasswordVisibilityImplCopyWith(_$PasswordVisibilityImpl value,
          $Res Function(_$PasswordVisibilityImpl) then) =
      __$$PasswordVisibilityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PasswordFieldType fieldType, bool toggleValue});
}

/// @nodoc
class __$$PasswordVisibilityImplCopyWithImpl<$Res>
    extends _$ResetPasswordEventCopyWithImpl<$Res, _$PasswordVisibilityImpl>
    implements _$$PasswordVisibilityImplCopyWith<$Res> {
  __$$PasswordVisibilityImplCopyWithImpl(_$PasswordVisibilityImpl _value,
      $Res Function(_$PasswordVisibilityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fieldType = null,
    Object? toggleValue = null,
  }) {
    return _then(_$PasswordVisibilityImpl(
      null == fieldType
          ? _value.fieldType
          : fieldType // ignore: cast_nullable_to_non_nullable
              as PasswordFieldType,
      null == toggleValue
          ? _value.toggleValue
          : toggleValue // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PasswordVisibilityImpl implements _PasswordVisibility {
  const _$PasswordVisibilityImpl(this.fieldType, this.toggleValue);

  @override
  final PasswordFieldType fieldType;
  @override
  final bool toggleValue;

  @override
  String toString() {
    return 'ResetPasswordEvent.togglePasswordVisibility(fieldType: $fieldType, toggleValue: $toggleValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordVisibilityImpl &&
            (identical(other.fieldType, fieldType) ||
                other.fieldType == fieldType) &&
            (identical(other.toggleValue, toggleValue) ||
                other.toggleValue == toggleValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fieldType, toggleValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordVisibilityImplCopyWith<_$PasswordVisibilityImpl> get copyWith =>
      __$$PasswordVisibilityImplCopyWithImpl<_$PasswordVisibilityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PasswordFieldType fieldType, bool toggleValue)
        togglePasswordVisibility,
    required TResult Function(PasswordFieldType fieldType, String newValue)
        onTextChange,
    required TResult Function() changePassword,
    required TResult Function() clear,
    required TResult Function(User user, String resetPasswordKey) initialize,
    required TResult Function() resetPassword,
    required TResult Function() changePasswordForFirstTime,
  }) {
    return togglePasswordVisibility(fieldType, toggleValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult? Function(PasswordFieldType fieldType, String newValue)?
        onTextChange,
    TResult? Function()? changePassword,
    TResult? Function()? clear,
    TResult? Function(User user, String resetPasswordKey)? initialize,
    TResult? Function()? resetPassword,
    TResult? Function()? changePasswordForFirstTime,
  }) {
    return togglePasswordVisibility?.call(fieldType, toggleValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult Function(PasswordFieldType fieldType, String newValue)?
        onTextChange,
    TResult Function()? changePassword,
    TResult Function()? clear,
    TResult Function(User user, String resetPasswordKey)? initialize,
    TResult Function()? resetPassword,
    TResult Function()? changePasswordForFirstTime,
    required TResult orElse(),
  }) {
    if (togglePasswordVisibility != null) {
      return togglePasswordVisibility(fieldType, toggleValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_PasswordTextOnChange value) onTextChange,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_Clear value) clear,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ResetPasswords value) resetPassword,
    required TResult Function(_ChangePasswordForFirstTime value)
        changePasswordForFirstTime,
  }) {
    return togglePasswordVisibility(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult? Function(_PasswordTextOnChange value)? onTextChange,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ResetPasswords value)? resetPassword,
    TResult? Function(_ChangePasswordForFirstTime value)?
        changePasswordForFirstTime,
  }) {
    return togglePasswordVisibility?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_PasswordTextOnChange value)? onTextChange,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_Clear value)? clear,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ResetPasswords value)? resetPassword,
    TResult Function(_ChangePasswordForFirstTime value)?
        changePasswordForFirstTime,
    required TResult orElse(),
  }) {
    if (togglePasswordVisibility != null) {
      return togglePasswordVisibility(this);
    }
    return orElse();
  }
}

abstract class _PasswordVisibility implements ResetPasswordEvent {
  const factory _PasswordVisibility(
          final PasswordFieldType fieldType, final bool toggleValue) =
      _$PasswordVisibilityImpl;

  PasswordFieldType get fieldType;
  bool get toggleValue;
  @JsonKey(ignore: true)
  _$$PasswordVisibilityImplCopyWith<_$PasswordVisibilityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasswordTextOnChangeImplCopyWith<$Res> {
  factory _$$PasswordTextOnChangeImplCopyWith(_$PasswordTextOnChangeImpl value,
          $Res Function(_$PasswordTextOnChangeImpl) then) =
      __$$PasswordTextOnChangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PasswordFieldType fieldType, String newValue});
}

/// @nodoc
class __$$PasswordTextOnChangeImplCopyWithImpl<$Res>
    extends _$ResetPasswordEventCopyWithImpl<$Res, _$PasswordTextOnChangeImpl>
    implements _$$PasswordTextOnChangeImplCopyWith<$Res> {
  __$$PasswordTextOnChangeImplCopyWithImpl(_$PasswordTextOnChangeImpl _value,
      $Res Function(_$PasswordTextOnChangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fieldType = null,
    Object? newValue = null,
  }) {
    return _then(_$PasswordTextOnChangeImpl(
      null == fieldType
          ? _value.fieldType
          : fieldType // ignore: cast_nullable_to_non_nullable
              as PasswordFieldType,
      null == newValue
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PasswordTextOnChangeImpl implements _PasswordTextOnChange {
  const _$PasswordTextOnChangeImpl(this.fieldType, this.newValue);

  @override
  final PasswordFieldType fieldType;
  @override
  final String newValue;

  @override
  String toString() {
    return 'ResetPasswordEvent.onTextChange(fieldType: $fieldType, newValue: $newValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordTextOnChangeImpl &&
            (identical(other.fieldType, fieldType) ||
                other.fieldType == fieldType) &&
            (identical(other.newValue, newValue) ||
                other.newValue == newValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fieldType, newValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordTextOnChangeImplCopyWith<_$PasswordTextOnChangeImpl>
      get copyWith =>
          __$$PasswordTextOnChangeImplCopyWithImpl<_$PasswordTextOnChangeImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PasswordFieldType fieldType, bool toggleValue)
        togglePasswordVisibility,
    required TResult Function(PasswordFieldType fieldType, String newValue)
        onTextChange,
    required TResult Function() changePassword,
    required TResult Function() clear,
    required TResult Function(User user, String resetPasswordKey) initialize,
    required TResult Function() resetPassword,
    required TResult Function() changePasswordForFirstTime,
  }) {
    return onTextChange(fieldType, newValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult? Function(PasswordFieldType fieldType, String newValue)?
        onTextChange,
    TResult? Function()? changePassword,
    TResult? Function()? clear,
    TResult? Function(User user, String resetPasswordKey)? initialize,
    TResult? Function()? resetPassword,
    TResult? Function()? changePasswordForFirstTime,
  }) {
    return onTextChange?.call(fieldType, newValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult Function(PasswordFieldType fieldType, String newValue)?
        onTextChange,
    TResult Function()? changePassword,
    TResult Function()? clear,
    TResult Function(User user, String resetPasswordKey)? initialize,
    TResult Function()? resetPassword,
    TResult Function()? changePasswordForFirstTime,
    required TResult orElse(),
  }) {
    if (onTextChange != null) {
      return onTextChange(fieldType, newValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_PasswordTextOnChange value) onTextChange,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_Clear value) clear,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ResetPasswords value) resetPassword,
    required TResult Function(_ChangePasswordForFirstTime value)
        changePasswordForFirstTime,
  }) {
    return onTextChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult? Function(_PasswordTextOnChange value)? onTextChange,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ResetPasswords value)? resetPassword,
    TResult? Function(_ChangePasswordForFirstTime value)?
        changePasswordForFirstTime,
  }) {
    return onTextChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_PasswordTextOnChange value)? onTextChange,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_Clear value)? clear,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ResetPasswords value)? resetPassword,
    TResult Function(_ChangePasswordForFirstTime value)?
        changePasswordForFirstTime,
    required TResult orElse(),
  }) {
    if (onTextChange != null) {
      return onTextChange(this);
    }
    return orElse();
  }
}

abstract class _PasswordTextOnChange implements ResetPasswordEvent {
  const factory _PasswordTextOnChange(
          final PasswordFieldType fieldType, final String newValue) =
      _$PasswordTextOnChangeImpl;

  PasswordFieldType get fieldType;
  String get newValue;
  @JsonKey(ignore: true)
  _$$PasswordTextOnChangeImplCopyWith<_$PasswordTextOnChangeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangePasswordImplCopyWith<$Res> {
  factory _$$ChangePasswordImplCopyWith(_$ChangePasswordImpl value,
          $Res Function(_$ChangePasswordImpl) then) =
      __$$ChangePasswordImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChangePasswordImplCopyWithImpl<$Res>
    extends _$ResetPasswordEventCopyWithImpl<$Res, _$ChangePasswordImpl>
    implements _$$ChangePasswordImplCopyWith<$Res> {
  __$$ChangePasswordImplCopyWithImpl(
      _$ChangePasswordImpl _value, $Res Function(_$ChangePasswordImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChangePasswordImpl implements _ChangePassword {
  const _$ChangePasswordImpl();

  @override
  String toString() {
    return 'ResetPasswordEvent.changePassword()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChangePasswordImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PasswordFieldType fieldType, bool toggleValue)
        togglePasswordVisibility,
    required TResult Function(PasswordFieldType fieldType, String newValue)
        onTextChange,
    required TResult Function() changePassword,
    required TResult Function() clear,
    required TResult Function(User user, String resetPasswordKey) initialize,
    required TResult Function() resetPassword,
    required TResult Function() changePasswordForFirstTime,
  }) {
    return changePassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult? Function(PasswordFieldType fieldType, String newValue)?
        onTextChange,
    TResult? Function()? changePassword,
    TResult? Function()? clear,
    TResult? Function(User user, String resetPasswordKey)? initialize,
    TResult? Function()? resetPassword,
    TResult? Function()? changePasswordForFirstTime,
  }) {
    return changePassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult Function(PasswordFieldType fieldType, String newValue)?
        onTextChange,
    TResult Function()? changePassword,
    TResult Function()? clear,
    TResult Function(User user, String resetPasswordKey)? initialize,
    TResult Function()? resetPassword,
    TResult Function()? changePasswordForFirstTime,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_PasswordTextOnChange value) onTextChange,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_Clear value) clear,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ResetPasswords value) resetPassword,
    required TResult Function(_ChangePasswordForFirstTime value)
        changePasswordForFirstTime,
  }) {
    return changePassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult? Function(_PasswordTextOnChange value)? onTextChange,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ResetPasswords value)? resetPassword,
    TResult? Function(_ChangePasswordForFirstTime value)?
        changePasswordForFirstTime,
  }) {
    return changePassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_PasswordTextOnChange value)? onTextChange,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_Clear value)? clear,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ResetPasswords value)? resetPassword,
    TResult Function(_ChangePasswordForFirstTime value)?
        changePasswordForFirstTime,
    required TResult orElse(),
  }) {
    if (changePassword != null) {
      return changePassword(this);
    }
    return orElse();
  }
}

abstract class _ChangePassword implements ResetPasswordEvent {
  const factory _ChangePassword() = _$ChangePasswordImpl;
}

/// @nodoc
abstract class _$$ClearImplCopyWith<$Res> {
  factory _$$ClearImplCopyWith(
          _$ClearImpl value, $Res Function(_$ClearImpl) then) =
      __$$ClearImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearImplCopyWithImpl<$Res>
    extends _$ResetPasswordEventCopyWithImpl<$Res, _$ClearImpl>
    implements _$$ClearImplCopyWith<$Res> {
  __$$ClearImplCopyWithImpl(
      _$ClearImpl _value, $Res Function(_$ClearImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearImpl implements _Clear {
  const _$ClearImpl();

  @override
  String toString() {
    return 'ResetPasswordEvent.clear()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PasswordFieldType fieldType, bool toggleValue)
        togglePasswordVisibility,
    required TResult Function(PasswordFieldType fieldType, String newValue)
        onTextChange,
    required TResult Function() changePassword,
    required TResult Function() clear,
    required TResult Function(User user, String resetPasswordKey) initialize,
    required TResult Function() resetPassword,
    required TResult Function() changePasswordForFirstTime,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult? Function(PasswordFieldType fieldType, String newValue)?
        onTextChange,
    TResult? Function()? changePassword,
    TResult? Function()? clear,
    TResult? Function(User user, String resetPasswordKey)? initialize,
    TResult? Function()? resetPassword,
    TResult? Function()? changePasswordForFirstTime,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult Function(PasswordFieldType fieldType, String newValue)?
        onTextChange,
    TResult Function()? changePassword,
    TResult Function()? clear,
    TResult Function(User user, String resetPasswordKey)? initialize,
    TResult Function()? resetPassword,
    TResult Function()? changePasswordForFirstTime,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_PasswordTextOnChange value) onTextChange,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_Clear value) clear,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ResetPasswords value) resetPassword,
    required TResult Function(_ChangePasswordForFirstTime value)
        changePasswordForFirstTime,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult? Function(_PasswordTextOnChange value)? onTextChange,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ResetPasswords value)? resetPassword,
    TResult? Function(_ChangePasswordForFirstTime value)?
        changePasswordForFirstTime,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_PasswordTextOnChange value)? onTextChange,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_Clear value)? clear,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ResetPasswords value)? resetPassword,
    TResult Function(_ChangePasswordForFirstTime value)?
        changePasswordForFirstTime,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class _Clear implements ResetPasswordEvent {
  const factory _Clear() = _$ClearImpl;
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user, String resetPasswordKey});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$ResetPasswordEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? resetPasswordKey = null,
  }) {
    return _then(_$InitializeImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      resetPasswordKey: null == resetPasswordKey
          ? _value.resetPasswordKey
          : resetPasswordKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl({required this.user, required this.resetPasswordKey});

  @override
  final User user;
  @override
  final String resetPasswordKey;

  @override
  String toString() {
    return 'ResetPasswordEvent.initialize(user: $user, resetPasswordKey: $resetPasswordKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.resetPasswordKey, resetPasswordKey) ||
                other.resetPasswordKey == resetPasswordKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, resetPasswordKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PasswordFieldType fieldType, bool toggleValue)
        togglePasswordVisibility,
    required TResult Function(PasswordFieldType fieldType, String newValue)
        onTextChange,
    required TResult Function() changePassword,
    required TResult Function() clear,
    required TResult Function(User user, String resetPasswordKey) initialize,
    required TResult Function() resetPassword,
    required TResult Function() changePasswordForFirstTime,
  }) {
    return initialize(user, resetPasswordKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult? Function(PasswordFieldType fieldType, String newValue)?
        onTextChange,
    TResult? Function()? changePassword,
    TResult? Function()? clear,
    TResult? Function(User user, String resetPasswordKey)? initialize,
    TResult? Function()? resetPassword,
    TResult? Function()? changePasswordForFirstTime,
  }) {
    return initialize?.call(user, resetPasswordKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult Function(PasswordFieldType fieldType, String newValue)?
        onTextChange,
    TResult Function()? changePassword,
    TResult Function()? clear,
    TResult Function(User user, String resetPasswordKey)? initialize,
    TResult Function()? resetPassword,
    TResult Function()? changePasswordForFirstTime,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(user, resetPasswordKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_PasswordTextOnChange value) onTextChange,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_Clear value) clear,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ResetPasswords value) resetPassword,
    required TResult Function(_ChangePasswordForFirstTime value)
        changePasswordForFirstTime,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult? Function(_PasswordTextOnChange value)? onTextChange,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ResetPasswords value)? resetPassword,
    TResult? Function(_ChangePasswordForFirstTime value)?
        changePasswordForFirstTime,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_PasswordTextOnChange value)? onTextChange,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_Clear value)? clear,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ResetPasswords value)? resetPassword,
    TResult Function(_ChangePasswordForFirstTime value)?
        changePasswordForFirstTime,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements ResetPasswordEvent {
  const factory _Initialize(
      {required final User user,
      required final String resetPasswordKey}) = _$InitializeImpl;

  User get user;
  String get resetPasswordKey;
  @JsonKey(ignore: true)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetPasswordsImplCopyWith<$Res> {
  factory _$$ResetPasswordsImplCopyWith(_$ResetPasswordsImpl value,
          $Res Function(_$ResetPasswordsImpl) then) =
      __$$ResetPasswordsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetPasswordsImplCopyWithImpl<$Res>
    extends _$ResetPasswordEventCopyWithImpl<$Res, _$ResetPasswordsImpl>
    implements _$$ResetPasswordsImplCopyWith<$Res> {
  __$$ResetPasswordsImplCopyWithImpl(
      _$ResetPasswordsImpl _value, $Res Function(_$ResetPasswordsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetPasswordsImpl implements _ResetPasswords {
  const _$ResetPasswordsImpl();

  @override
  String toString() {
    return 'ResetPasswordEvent.resetPassword()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetPasswordsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PasswordFieldType fieldType, bool toggleValue)
        togglePasswordVisibility,
    required TResult Function(PasswordFieldType fieldType, String newValue)
        onTextChange,
    required TResult Function() changePassword,
    required TResult Function() clear,
    required TResult Function(User user, String resetPasswordKey) initialize,
    required TResult Function() resetPassword,
    required TResult Function() changePasswordForFirstTime,
  }) {
    return resetPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult? Function(PasswordFieldType fieldType, String newValue)?
        onTextChange,
    TResult? Function()? changePassword,
    TResult? Function()? clear,
    TResult? Function(User user, String resetPasswordKey)? initialize,
    TResult? Function()? resetPassword,
    TResult? Function()? changePasswordForFirstTime,
  }) {
    return resetPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult Function(PasswordFieldType fieldType, String newValue)?
        onTextChange,
    TResult Function()? changePassword,
    TResult Function()? clear,
    TResult Function(User user, String resetPasswordKey)? initialize,
    TResult Function()? resetPassword,
    TResult Function()? changePasswordForFirstTime,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_PasswordTextOnChange value) onTextChange,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_Clear value) clear,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ResetPasswords value) resetPassword,
    required TResult Function(_ChangePasswordForFirstTime value)
        changePasswordForFirstTime,
  }) {
    return resetPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult? Function(_PasswordTextOnChange value)? onTextChange,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ResetPasswords value)? resetPassword,
    TResult? Function(_ChangePasswordForFirstTime value)?
        changePasswordForFirstTime,
  }) {
    return resetPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_PasswordTextOnChange value)? onTextChange,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_Clear value)? clear,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ResetPasswords value)? resetPassword,
    TResult Function(_ChangePasswordForFirstTime value)?
        changePasswordForFirstTime,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(this);
    }
    return orElse();
  }
}

abstract class _ResetPasswords implements ResetPasswordEvent {
  const factory _ResetPasswords() = _$ResetPasswordsImpl;
}

/// @nodoc
abstract class _$$ChangePasswordForFirstTimeImplCopyWith<$Res> {
  factory _$$ChangePasswordForFirstTimeImplCopyWith(
          _$ChangePasswordForFirstTimeImpl value,
          $Res Function(_$ChangePasswordForFirstTimeImpl) then) =
      __$$ChangePasswordForFirstTimeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChangePasswordForFirstTimeImplCopyWithImpl<$Res>
    extends _$ResetPasswordEventCopyWithImpl<$Res,
        _$ChangePasswordForFirstTimeImpl>
    implements _$$ChangePasswordForFirstTimeImplCopyWith<$Res> {
  __$$ChangePasswordForFirstTimeImplCopyWithImpl(
      _$ChangePasswordForFirstTimeImpl _value,
      $Res Function(_$ChangePasswordForFirstTimeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ChangePasswordForFirstTimeImpl implements _ChangePasswordForFirstTime {
  const _$ChangePasswordForFirstTimeImpl();

  @override
  String toString() {
    return 'ResetPasswordEvent.changePasswordForFirstTime()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePasswordForFirstTimeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PasswordFieldType fieldType, bool toggleValue)
        togglePasswordVisibility,
    required TResult Function(PasswordFieldType fieldType, String newValue)
        onTextChange,
    required TResult Function() changePassword,
    required TResult Function() clear,
    required TResult Function(User user, String resetPasswordKey) initialize,
    required TResult Function() resetPassword,
    required TResult Function() changePasswordForFirstTime,
  }) {
    return changePasswordForFirstTime();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult? Function(PasswordFieldType fieldType, String newValue)?
        onTextChange,
    TResult? Function()? changePassword,
    TResult? Function()? clear,
    TResult? Function(User user, String resetPasswordKey)? initialize,
    TResult? Function()? resetPassword,
    TResult? Function()? changePasswordForFirstTime,
  }) {
    return changePasswordForFirstTime?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PasswordFieldType fieldType, bool toggleValue)?
        togglePasswordVisibility,
    TResult Function(PasswordFieldType fieldType, String newValue)?
        onTextChange,
    TResult Function()? changePassword,
    TResult Function()? clear,
    TResult Function(User user, String resetPasswordKey)? initialize,
    TResult Function()? resetPassword,
    TResult Function()? changePasswordForFirstTime,
    required TResult orElse(),
  }) {
    if (changePasswordForFirstTime != null) {
      return changePasswordForFirstTime();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_PasswordTextOnChange value) onTextChange,
    required TResult Function(_ChangePassword value) changePassword,
    required TResult Function(_Clear value) clear,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ResetPasswords value) resetPassword,
    required TResult Function(_ChangePasswordForFirstTime value)
        changePasswordForFirstTime,
  }) {
    return changePasswordForFirstTime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult? Function(_PasswordTextOnChange value)? onTextChange,
    TResult? Function(_ChangePassword value)? changePassword,
    TResult? Function(_Clear value)? clear,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ResetPasswords value)? resetPassword,
    TResult? Function(_ChangePasswordForFirstTime value)?
        changePasswordForFirstTime,
  }) {
    return changePasswordForFirstTime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_PasswordTextOnChange value)? onTextChange,
    TResult Function(_ChangePassword value)? changePassword,
    TResult Function(_Clear value)? clear,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ResetPasswords value)? resetPassword,
    TResult Function(_ChangePasswordForFirstTime value)?
        changePasswordForFirstTime,
    required TResult orElse(),
  }) {
    if (changePasswordForFirstTime != null) {
      return changePasswordForFirstTime(this);
    }
    return orElse();
  }
}

abstract class _ChangePasswordForFirstTime implements ResetPasswordEvent {
  const factory _ChangePasswordForFirstTime() =
      _$ChangePasswordForFirstTimeImpl;
}

/// @nodoc
mixin _$ResetPasswordState {
  User get user => throw _privateConstructorUsedError;
  bool get isOldPasswordObscure => throw _privateConstructorUsedError;
  bool get isNewPasswordObscure => throw _privateConstructorUsedError;
  bool get isConfirmPasswordObscure => throw _privateConstructorUsedError;
  Password get oldPassword => throw _privateConstructorUsedError;
  Password get newPassword => throw _privateConstructorUsedError;
  Password get confirmPassword => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, ResetPassword>>
      get passwordResetFailureOrSuccessOption =>
          throw _privateConstructorUsedError;
  String get resetPasswordKey => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResetPasswordStateCopyWith<ResetPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordStateCopyWith<$Res> {
  factory $ResetPasswordStateCopyWith(
          ResetPasswordState value, $Res Function(ResetPasswordState) then) =
      _$ResetPasswordStateCopyWithImpl<$Res, ResetPasswordState>;
  @useResult
  $Res call(
      {User user,
      bool isOldPasswordObscure,
      bool isNewPasswordObscure,
      bool isConfirmPasswordObscure,
      Password oldPassword,
      Password newPassword,
      Password confirmPassword,
      bool isSubmitting,
      Option<Either<ApiFailure, ResetPassword>>
          passwordResetFailureOrSuccessOption,
      String resetPasswordKey,
      bool showErrorMessages});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$ResetPasswordStateCopyWithImpl<$Res, $Val extends ResetPasswordState>
    implements $ResetPasswordStateCopyWith<$Res> {
  _$ResetPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? isOldPasswordObscure = null,
    Object? isNewPasswordObscure = null,
    Object? isConfirmPasswordObscure = null,
    Object? oldPassword = null,
    Object? newPassword = null,
    Object? confirmPassword = null,
    Object? isSubmitting = null,
    Object? passwordResetFailureOrSuccessOption = null,
    Object? resetPasswordKey = null,
    Object? showErrorMessages = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      isOldPasswordObscure: null == isOldPasswordObscure
          ? _value.isOldPasswordObscure
          : isOldPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      isNewPasswordObscure: null == isNewPasswordObscure
          ? _value.isNewPasswordObscure
          : isNewPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmPasswordObscure: null == isConfirmPasswordObscure
          ? _value.isConfirmPasswordObscure
          : isConfirmPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      oldPassword: null == oldPassword
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordResetFailureOrSuccessOption: null ==
              passwordResetFailureOrSuccessOption
          ? _value.passwordResetFailureOrSuccessOption
          : passwordResetFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, ResetPassword>>,
      resetPasswordKey: null == resetPasswordKey
          ? _value.resetPasswordKey
          : resetPasswordKey // ignore: cast_nullable_to_non_nullable
              as String,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResetPasswordImplCopyWith<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  factory _$$ResetPasswordImplCopyWith(
          _$ResetPasswordImpl value, $Res Function(_$ResetPasswordImpl) then) =
      __$$ResetPasswordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User user,
      bool isOldPasswordObscure,
      bool isNewPasswordObscure,
      bool isConfirmPasswordObscure,
      Password oldPassword,
      Password newPassword,
      Password confirmPassword,
      bool isSubmitting,
      Option<Either<ApiFailure, ResetPassword>>
          passwordResetFailureOrSuccessOption,
      String resetPasswordKey,
      bool showErrorMessages});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$ResetPasswordImplCopyWithImpl<$Res>
    extends _$ResetPasswordStateCopyWithImpl<$Res, _$ResetPasswordImpl>
    implements _$$ResetPasswordImplCopyWith<$Res> {
  __$$ResetPasswordImplCopyWithImpl(
      _$ResetPasswordImpl _value, $Res Function(_$ResetPasswordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? isOldPasswordObscure = null,
    Object? isNewPasswordObscure = null,
    Object? isConfirmPasswordObscure = null,
    Object? oldPassword = null,
    Object? newPassword = null,
    Object? confirmPassword = null,
    Object? isSubmitting = null,
    Object? passwordResetFailureOrSuccessOption = null,
    Object? resetPasswordKey = null,
    Object? showErrorMessages = null,
  }) {
    return _then(_$ResetPasswordImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      isOldPasswordObscure: null == isOldPasswordObscure
          ? _value.isOldPasswordObscure
          : isOldPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      isNewPasswordObscure: null == isNewPasswordObscure
          ? _value.isNewPasswordObscure
          : isNewPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmPasswordObscure: null == isConfirmPasswordObscure
          ? _value.isConfirmPasswordObscure
          : isConfirmPasswordObscure // ignore: cast_nullable_to_non_nullable
              as bool,
      oldPassword: null == oldPassword
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as Password,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordResetFailureOrSuccessOption: null ==
              passwordResetFailureOrSuccessOption
          ? _value.passwordResetFailureOrSuccessOption
          : passwordResetFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, ResetPassword>>,
      resetPasswordKey: null == resetPasswordKey
          ? _value.resetPasswordKey
          : resetPasswordKey // ignore: cast_nullable_to_non_nullable
              as String,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ResetPasswordImpl extends _ResetPassword {
  const _$ResetPasswordImpl(
      {required this.user,
      required this.isOldPasswordObscure,
      required this.isNewPasswordObscure,
      required this.isConfirmPasswordObscure,
      required this.oldPassword,
      required this.newPassword,
      required this.confirmPassword,
      required this.isSubmitting,
      required this.passwordResetFailureOrSuccessOption,
      required this.resetPasswordKey,
      required this.showErrorMessages})
      : super._();

  @override
  final User user;
  @override
  final bool isOldPasswordObscure;
  @override
  final bool isNewPasswordObscure;
  @override
  final bool isConfirmPasswordObscure;
  @override
  final Password oldPassword;
  @override
  final Password newPassword;
  @override
  final Password confirmPassword;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<ApiFailure, ResetPassword>>
      passwordResetFailureOrSuccessOption;
  @override
  final String resetPasswordKey;
  @override
  final bool showErrorMessages;

  @override
  String toString() {
    return 'ResetPasswordState(user: $user, isOldPasswordObscure: $isOldPasswordObscure, isNewPasswordObscure: $isNewPasswordObscure, isConfirmPasswordObscure: $isConfirmPasswordObscure, oldPassword: $oldPassword, newPassword: $newPassword, confirmPassword: $confirmPassword, isSubmitting: $isSubmitting, passwordResetFailureOrSuccessOption: $passwordResetFailureOrSuccessOption, resetPasswordKey: $resetPasswordKey, showErrorMessages: $showErrorMessages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isOldPasswordObscure, isOldPasswordObscure) ||
                other.isOldPasswordObscure == isOldPasswordObscure) &&
            (identical(other.isNewPasswordObscure, isNewPasswordObscure) ||
                other.isNewPasswordObscure == isNewPasswordObscure) &&
            (identical(
                    other.isConfirmPasswordObscure, isConfirmPasswordObscure) ||
                other.isConfirmPasswordObscure == isConfirmPasswordObscure) &&
            (identical(other.oldPassword, oldPassword) ||
                other.oldPassword == oldPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.passwordResetFailureOrSuccessOption,
                    passwordResetFailureOrSuccessOption) ||
                other.passwordResetFailureOrSuccessOption ==
                    passwordResetFailureOrSuccessOption) &&
            (identical(other.resetPasswordKey, resetPasswordKey) ||
                other.resetPasswordKey == resetPasswordKey) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      isOldPasswordObscure,
      isNewPasswordObscure,
      isConfirmPasswordObscure,
      oldPassword,
      newPassword,
      confirmPassword,
      isSubmitting,
      passwordResetFailureOrSuccessOption,
      resetPasswordKey,
      showErrorMessages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordImplCopyWith<_$ResetPasswordImpl> get copyWith =>
      __$$ResetPasswordImplCopyWithImpl<_$ResetPasswordImpl>(this, _$identity);
}

abstract class _ResetPassword extends ResetPasswordState {
  const factory _ResetPassword(
      {required final User user,
      required final bool isOldPasswordObscure,
      required final bool isNewPasswordObscure,
      required final bool isConfirmPasswordObscure,
      required final Password oldPassword,
      required final Password newPassword,
      required final Password confirmPassword,
      required final bool isSubmitting,
      required final Option<Either<ApiFailure, ResetPassword>>
          passwordResetFailureOrSuccessOption,
      required final String resetPasswordKey,
      required final bool showErrorMessages}) = _$ResetPasswordImpl;
  const _ResetPassword._() : super._();

  @override
  User get user;
  @override
  bool get isOldPasswordObscure;
  @override
  bool get isNewPasswordObscure;
  @override
  bool get isConfirmPasswordObscure;
  @override
  Password get oldPassword;
  @override
  Password get newPassword;
  @override
  Password get confirmPassword;
  @override
  bool get isSubmitting;
  @override
  Option<Either<ApiFailure, ResetPassword>>
      get passwordResetFailureOrSuccessOption;
  @override
  String get resetPasswordKey;
  @override
  bool get showErrorMessages;
  @override
  @JsonKey(ignore: true)
  _$$ResetPasswordImplCopyWith<_$ResetPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

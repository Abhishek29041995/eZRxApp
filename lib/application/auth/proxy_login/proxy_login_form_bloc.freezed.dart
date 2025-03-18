// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'proxy_login_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProxyLoginFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String usernameStr) usernameChanged,
    required TResult Function(User user) loginWithADButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(String usernameStr)? usernameChanged,
    TResult? Function(User user)? loginWithADButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function(User user)? loginWithADButtonPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_UsernameChanged value) usernameChanged,
    required TResult Function(_LoginWithADButtonPressed value)
        loginWithADButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_UsernameChanged value)? usernameChanged,
    TResult? Function(_LoginWithADButtonPressed value)?
        loginWithADButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_LoginWithADButtonPressed value)? loginWithADButtonPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProxyLoginFormEventCopyWith<$Res> {
  factory $ProxyLoginFormEventCopyWith(
          ProxyLoginFormEvent value, $Res Function(ProxyLoginFormEvent) then) =
      _$ProxyLoginFormEventCopyWithImpl<$Res, ProxyLoginFormEvent>;
}

/// @nodoc
class _$ProxyLoginFormEventCopyWithImpl<$Res, $Val extends ProxyLoginFormEvent>
    implements $ProxyLoginFormEventCopyWith<$Res> {
  _$ProxyLoginFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitializedImplCopyWith<$Res> {
  factory _$$InitializedImplCopyWith(
          _$InitializedImpl value, $Res Function(_$InitializedImpl) then) =
      __$$InitializedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$ProxyLoginFormEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl();

  @override
  String toString() {
    return 'ProxyLoginFormEvent.initialized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String usernameStr) usernameChanged,
    required TResult Function(User user) loginWithADButtonPressed,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(String usernameStr)? usernameChanged,
    TResult? Function(User user)? loginWithADButtonPressed,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function(User user)? loginWithADButtonPressed,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_UsernameChanged value) usernameChanged,
    required TResult Function(_LoginWithADButtonPressed value)
        loginWithADButtonPressed,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_UsernameChanged value)? usernameChanged,
    TResult? Function(_LoginWithADButtonPressed value)?
        loginWithADButtonPressed,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_LoginWithADButtonPressed value)? loginWithADButtonPressed,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements ProxyLoginFormEvent {
  const factory _Initialized() = _$InitializedImpl;
}

/// @nodoc
abstract class _$$UsernameChangedImplCopyWith<$Res> {
  factory _$$UsernameChangedImplCopyWith(_$UsernameChangedImpl value,
          $Res Function(_$UsernameChangedImpl) then) =
      __$$UsernameChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String usernameStr});
}

/// @nodoc
class __$$UsernameChangedImplCopyWithImpl<$Res>
    extends _$ProxyLoginFormEventCopyWithImpl<$Res, _$UsernameChangedImpl>
    implements _$$UsernameChangedImplCopyWith<$Res> {
  __$$UsernameChangedImplCopyWithImpl(
      _$UsernameChangedImpl _value, $Res Function(_$UsernameChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernameStr = null,
  }) {
    return _then(_$UsernameChangedImpl(
      null == usernameStr
          ? _value.usernameStr
          : usernameStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UsernameChangedImpl implements _UsernameChanged {
  const _$UsernameChangedImpl(this.usernameStr);

  @override
  final String usernameStr;

  @override
  String toString() {
    return 'ProxyLoginFormEvent.usernameChanged(usernameStr: $usernameStr)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsernameChangedImpl &&
            (identical(other.usernameStr, usernameStr) ||
                other.usernameStr == usernameStr));
  }

  @override
  int get hashCode => Object.hash(runtimeType, usernameStr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsernameChangedImplCopyWith<_$UsernameChangedImpl> get copyWith =>
      __$$UsernameChangedImplCopyWithImpl<_$UsernameChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String usernameStr) usernameChanged,
    required TResult Function(User user) loginWithADButtonPressed,
  }) {
    return usernameChanged(usernameStr);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(String usernameStr)? usernameChanged,
    TResult? Function(User user)? loginWithADButtonPressed,
  }) {
    return usernameChanged?.call(usernameStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function(User user)? loginWithADButtonPressed,
    required TResult orElse(),
  }) {
    if (usernameChanged != null) {
      return usernameChanged(usernameStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_UsernameChanged value) usernameChanged,
    required TResult Function(_LoginWithADButtonPressed value)
        loginWithADButtonPressed,
  }) {
    return usernameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_UsernameChanged value)? usernameChanged,
    TResult? Function(_LoginWithADButtonPressed value)?
        loginWithADButtonPressed,
  }) {
    return usernameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_LoginWithADButtonPressed value)? loginWithADButtonPressed,
    required TResult orElse(),
  }) {
    if (usernameChanged != null) {
      return usernameChanged(this);
    }
    return orElse();
  }
}

abstract class _UsernameChanged implements ProxyLoginFormEvent {
  const factory _UsernameChanged(final String usernameStr) =
      _$UsernameChangedImpl;

  String get usernameStr;
  @JsonKey(ignore: true)
  _$$UsernameChangedImplCopyWith<_$UsernameChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginWithADButtonPressedImplCopyWith<$Res> {
  factory _$$LoginWithADButtonPressedImplCopyWith(
          _$LoginWithADButtonPressedImpl value,
          $Res Function(_$LoginWithADButtonPressedImpl) then) =
      __$$LoginWithADButtonPressedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$LoginWithADButtonPressedImplCopyWithImpl<$Res>
    extends _$ProxyLoginFormEventCopyWithImpl<$Res,
        _$LoginWithADButtonPressedImpl>
    implements _$$LoginWithADButtonPressedImplCopyWith<$Res> {
  __$$LoginWithADButtonPressedImplCopyWithImpl(
      _$LoginWithADButtonPressedImpl _value,
      $Res Function(_$LoginWithADButtonPressedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$LoginWithADButtonPressedImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
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

class _$LoginWithADButtonPressedImpl implements _LoginWithADButtonPressed {
  const _$LoginWithADButtonPressedImpl({required this.user});

  @override
  final User user;

  @override
  String toString() {
    return 'ProxyLoginFormEvent.loginWithADButtonPressed(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginWithADButtonPressedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginWithADButtonPressedImplCopyWith<_$LoginWithADButtonPressedImpl>
      get copyWith => __$$LoginWithADButtonPressedImplCopyWithImpl<
          _$LoginWithADButtonPressedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String usernameStr) usernameChanged,
    required TResult Function(User user) loginWithADButtonPressed,
  }) {
    return loginWithADButtonPressed(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(String usernameStr)? usernameChanged,
    TResult? Function(User user)? loginWithADButtonPressed,
  }) {
    return loginWithADButtonPressed?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String usernameStr)? usernameChanged,
    TResult Function(User user)? loginWithADButtonPressed,
    required TResult orElse(),
  }) {
    if (loginWithADButtonPressed != null) {
      return loginWithADButtonPressed(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_UsernameChanged value) usernameChanged,
    required TResult Function(_LoginWithADButtonPressed value)
        loginWithADButtonPressed,
  }) {
    return loginWithADButtonPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_UsernameChanged value)? usernameChanged,
    TResult? Function(_LoginWithADButtonPressed value)?
        loginWithADButtonPressed,
  }) {
    return loginWithADButtonPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_UsernameChanged value)? usernameChanged,
    TResult Function(_LoginWithADButtonPressed value)? loginWithADButtonPressed,
    required TResult orElse(),
  }) {
    if (loginWithADButtonPressed != null) {
      return loginWithADButtonPressed(this);
    }
    return orElse();
  }
}

abstract class _LoginWithADButtonPressed implements ProxyLoginFormEvent {
  const factory _LoginWithADButtonPressed({required final User user}) =
      _$LoginWithADButtonPressedImpl;

  User get user;
  @JsonKey(ignore: true)
  _$$LoginWithADButtonPressedImplCopyWith<_$LoginWithADButtonPressedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProxyLoginFormState {
  Username get username => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProxyLoginFormStateCopyWith<ProxyLoginFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProxyLoginFormStateCopyWith<$Res> {
  factory $ProxyLoginFormStateCopyWith(
          ProxyLoginFormState value, $Res Function(ProxyLoginFormState) then) =
      _$ProxyLoginFormStateCopyWithImpl<$Res, ProxyLoginFormState>;
  @useResult
  $Res call(
      {Username username,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ApiFailure, dynamic>> authFailureOrSuccessOption});
}

/// @nodoc
class _$ProxyLoginFormStateCopyWithImpl<$Res, $Val extends ProxyLoginFormState>
    implements $ProxyLoginFormStateCopyWith<$Res> {
  _$ProxyLoginFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProxyLoginFormStateImplCopyWith<$Res>
    implements $ProxyLoginFormStateCopyWith<$Res> {
  factory _$$ProxyLoginFormStateImplCopyWith(_$ProxyLoginFormStateImpl value,
          $Res Function(_$ProxyLoginFormStateImpl) then) =
      __$$ProxyLoginFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Username username,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ApiFailure, dynamic>> authFailureOrSuccessOption});
}

/// @nodoc
class __$$ProxyLoginFormStateImplCopyWithImpl<$Res>
    extends _$ProxyLoginFormStateCopyWithImpl<$Res, _$ProxyLoginFormStateImpl>
    implements _$$ProxyLoginFormStateImplCopyWith<$Res> {
  __$$ProxyLoginFormStateImplCopyWithImpl(_$ProxyLoginFormStateImpl _value,
      $Res Function(_$ProxyLoginFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
  }) {
    return _then(_$ProxyLoginFormStateImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$ProxyLoginFormStateImpl implements _ProxyLoginFormState {
  const _$ProxyLoginFormStateImpl(
      {required this.username,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.authFailureOrSuccessOption});

  @override
  final Username username;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<ApiFailure, dynamic>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'ProxyLoginFormState(username: $username, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProxyLoginFormStateImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption) ||
                other.authFailureOrSuccessOption ==
                    authFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, showErrorMessages,
      isSubmitting, authFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProxyLoginFormStateImplCopyWith<_$ProxyLoginFormStateImpl> get copyWith =>
      __$$ProxyLoginFormStateImplCopyWithImpl<_$ProxyLoginFormStateImpl>(
          this, _$identity);
}

abstract class _ProxyLoginFormState implements ProxyLoginFormState {
  const factory _ProxyLoginFormState(
      {required final Username username,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<ApiFailure, dynamic>>
          authFailureOrSuccessOption}) = _$ProxyLoginFormStateImpl;

  @override
  Username get username;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<ApiFailure, dynamic>> get authFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$ProxyLoginFormStateImplCopyWith<_$ProxyLoginFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

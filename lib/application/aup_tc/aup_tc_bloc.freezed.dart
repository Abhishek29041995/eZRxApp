// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aup_tc_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AupTcEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) show,
    required TResult Function(bool newValue) termsOfUseConsent,
    required TResult Function(bool newValue) privacyPolicyConsent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? show,
    TResult? Function(bool newValue)? termsOfUseConsent,
    TResult? Function(bool newValue)? privacyPolicyConsent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? show,
    TResult Function(bool newValue)? termsOfUseConsent,
    TResult Function(bool newValue)? privacyPolicyConsent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Show value) show,
    required TResult Function(_TermsOfUseConsent value) termsOfUseConsent,
    required TResult Function(_PrivacyPolicyConsent value) privacyPolicyConsent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Show value)? show,
    TResult? Function(_TermsOfUseConsent value)? termsOfUseConsent,
    TResult? Function(_PrivacyPolicyConsent value)? privacyPolicyConsent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Show value)? show,
    TResult Function(_TermsOfUseConsent value)? termsOfUseConsent,
    TResult Function(_PrivacyPolicyConsent value)? privacyPolicyConsent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AupTcEventCopyWith<$Res> {
  factory $AupTcEventCopyWith(
          AupTcEvent value, $Res Function(AupTcEvent) then) =
      _$AupTcEventCopyWithImpl<$Res, AupTcEvent>;
}

/// @nodoc
class _$AupTcEventCopyWithImpl<$Res, $Val extends AupTcEvent>
    implements $AupTcEventCopyWith<$Res> {
  _$AupTcEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ShowImplCopyWith<$Res> {
  factory _$$ShowImplCopyWith(
          _$ShowImpl value, $Res Function(_$ShowImpl) then) =
      __$$ShowImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$ShowImplCopyWithImpl<$Res>
    extends _$AupTcEventCopyWithImpl<$Res, _$ShowImpl>
    implements _$$ShowImplCopyWith<$Res> {
  __$$ShowImplCopyWithImpl(_$ShowImpl _value, $Res Function(_$ShowImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$ShowImpl(
      null == user
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

class _$ShowImpl implements _Show {
  const _$ShowImpl(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'AupTcEvent.show(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowImplCopyWith<_$ShowImpl> get copyWith =>
      __$$ShowImplCopyWithImpl<_$ShowImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) show,
    required TResult Function(bool newValue) termsOfUseConsent,
    required TResult Function(bool newValue) privacyPolicyConsent,
  }) {
    return show(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? show,
    TResult? Function(bool newValue)? termsOfUseConsent,
    TResult? Function(bool newValue)? privacyPolicyConsent,
  }) {
    return show?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? show,
    TResult Function(bool newValue)? termsOfUseConsent,
    TResult Function(bool newValue)? privacyPolicyConsent,
    required TResult orElse(),
  }) {
    if (show != null) {
      return show(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Show value) show,
    required TResult Function(_TermsOfUseConsent value) termsOfUseConsent,
    required TResult Function(_PrivacyPolicyConsent value) privacyPolicyConsent,
  }) {
    return show(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Show value)? show,
    TResult? Function(_TermsOfUseConsent value)? termsOfUseConsent,
    TResult? Function(_PrivacyPolicyConsent value)? privacyPolicyConsent,
  }) {
    return show?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Show value)? show,
    TResult Function(_TermsOfUseConsent value)? termsOfUseConsent,
    TResult Function(_PrivacyPolicyConsent value)? privacyPolicyConsent,
    required TResult orElse(),
  }) {
    if (show != null) {
      return show(this);
    }
    return orElse();
  }
}

abstract class _Show implements AupTcEvent {
  const factory _Show(final User user) = _$ShowImpl;

  User get user;
  @JsonKey(ignore: true)
  _$$ShowImplCopyWith<_$ShowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TermsOfUseConsentImplCopyWith<$Res> {
  factory _$$TermsOfUseConsentImplCopyWith(_$TermsOfUseConsentImpl value,
          $Res Function(_$TermsOfUseConsentImpl) then) =
      __$$TermsOfUseConsentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool newValue});
}

/// @nodoc
class __$$TermsOfUseConsentImplCopyWithImpl<$Res>
    extends _$AupTcEventCopyWithImpl<$Res, _$TermsOfUseConsentImpl>
    implements _$$TermsOfUseConsentImplCopyWith<$Res> {
  __$$TermsOfUseConsentImplCopyWithImpl(_$TermsOfUseConsentImpl _value,
      $Res Function(_$TermsOfUseConsentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newValue = null,
  }) {
    return _then(_$TermsOfUseConsentImpl(
      newValue: null == newValue
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TermsOfUseConsentImpl implements _TermsOfUseConsent {
  const _$TermsOfUseConsentImpl({required this.newValue});

  @override
  final bool newValue;

  @override
  String toString() {
    return 'AupTcEvent.termsOfUseConsent(newValue: $newValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TermsOfUseConsentImpl &&
            (identical(other.newValue, newValue) ||
                other.newValue == newValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TermsOfUseConsentImplCopyWith<_$TermsOfUseConsentImpl> get copyWith =>
      __$$TermsOfUseConsentImplCopyWithImpl<_$TermsOfUseConsentImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) show,
    required TResult Function(bool newValue) termsOfUseConsent,
    required TResult Function(bool newValue) privacyPolicyConsent,
  }) {
    return termsOfUseConsent(newValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? show,
    TResult? Function(bool newValue)? termsOfUseConsent,
    TResult? Function(bool newValue)? privacyPolicyConsent,
  }) {
    return termsOfUseConsent?.call(newValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? show,
    TResult Function(bool newValue)? termsOfUseConsent,
    TResult Function(bool newValue)? privacyPolicyConsent,
    required TResult orElse(),
  }) {
    if (termsOfUseConsent != null) {
      return termsOfUseConsent(newValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Show value) show,
    required TResult Function(_TermsOfUseConsent value) termsOfUseConsent,
    required TResult Function(_PrivacyPolicyConsent value) privacyPolicyConsent,
  }) {
    return termsOfUseConsent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Show value)? show,
    TResult? Function(_TermsOfUseConsent value)? termsOfUseConsent,
    TResult? Function(_PrivacyPolicyConsent value)? privacyPolicyConsent,
  }) {
    return termsOfUseConsent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Show value)? show,
    TResult Function(_TermsOfUseConsent value)? termsOfUseConsent,
    TResult Function(_PrivacyPolicyConsent value)? privacyPolicyConsent,
    required TResult orElse(),
  }) {
    if (termsOfUseConsent != null) {
      return termsOfUseConsent(this);
    }
    return orElse();
  }
}

abstract class _TermsOfUseConsent implements AupTcEvent {
  const factory _TermsOfUseConsent({required final bool newValue}) =
      _$TermsOfUseConsentImpl;

  bool get newValue;
  @JsonKey(ignore: true)
  _$$TermsOfUseConsentImplCopyWith<_$TermsOfUseConsentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PrivacyPolicyConsentImplCopyWith<$Res> {
  factory _$$PrivacyPolicyConsentImplCopyWith(_$PrivacyPolicyConsentImpl value,
          $Res Function(_$PrivacyPolicyConsentImpl) then) =
      __$$PrivacyPolicyConsentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool newValue});
}

/// @nodoc
class __$$PrivacyPolicyConsentImplCopyWithImpl<$Res>
    extends _$AupTcEventCopyWithImpl<$Res, _$PrivacyPolicyConsentImpl>
    implements _$$PrivacyPolicyConsentImplCopyWith<$Res> {
  __$$PrivacyPolicyConsentImplCopyWithImpl(_$PrivacyPolicyConsentImpl _value,
      $Res Function(_$PrivacyPolicyConsentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newValue = null,
  }) {
    return _then(_$PrivacyPolicyConsentImpl(
      newValue: null == newValue
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PrivacyPolicyConsentImpl implements _PrivacyPolicyConsent {
  const _$PrivacyPolicyConsentImpl({required this.newValue});

  @override
  final bool newValue;

  @override
  String toString() {
    return 'AupTcEvent.privacyPolicyConsent(newValue: $newValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivacyPolicyConsentImpl &&
            (identical(other.newValue, newValue) ||
                other.newValue == newValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivacyPolicyConsentImplCopyWith<_$PrivacyPolicyConsentImpl>
      get copyWith =>
          __$$PrivacyPolicyConsentImplCopyWithImpl<_$PrivacyPolicyConsentImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(User user) show,
    required TResult Function(bool newValue) termsOfUseConsent,
    required TResult Function(bool newValue) privacyPolicyConsent,
  }) {
    return privacyPolicyConsent(newValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(User user)? show,
    TResult? Function(bool newValue)? termsOfUseConsent,
    TResult? Function(bool newValue)? privacyPolicyConsent,
  }) {
    return privacyPolicyConsent?.call(newValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(User user)? show,
    TResult Function(bool newValue)? termsOfUseConsent,
    TResult Function(bool newValue)? privacyPolicyConsent,
    required TResult orElse(),
  }) {
    if (privacyPolicyConsent != null) {
      return privacyPolicyConsent(newValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Show value) show,
    required TResult Function(_TermsOfUseConsent value) termsOfUseConsent,
    required TResult Function(_PrivacyPolicyConsent value) privacyPolicyConsent,
  }) {
    return privacyPolicyConsent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Show value)? show,
    TResult? Function(_TermsOfUseConsent value)? termsOfUseConsent,
    TResult? Function(_PrivacyPolicyConsent value)? privacyPolicyConsent,
  }) {
    return privacyPolicyConsent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Show value)? show,
    TResult Function(_TermsOfUseConsent value)? termsOfUseConsent,
    TResult Function(_PrivacyPolicyConsent value)? privacyPolicyConsent,
    required TResult orElse(),
  }) {
    if (privacyPolicyConsent != null) {
      return privacyPolicyConsent(this);
    }
    return orElse();
  }
}

abstract class _PrivacyPolicyConsent implements AupTcEvent {
  const factory _PrivacyPolicyConsent({required final bool newValue}) =
      _$PrivacyPolicyConsentImpl;

  bool get newValue;
  @JsonKey(ignore: true)
  _$$PrivacyPolicyConsentImplCopyWith<_$PrivacyPolicyConsentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AupTcState {
  User get user => throw _privateConstructorUsedError;
  bool get tncConsent => throw _privateConstructorUsedError;
  bool get privacyConsent => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AupTcStateCopyWith<AupTcState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AupTcStateCopyWith<$Res> {
  factory $AupTcStateCopyWith(
          AupTcState value, $Res Function(AupTcState) then) =
      _$AupTcStateCopyWithImpl<$Res, AupTcState>;
  @useResult
  $Res call({User user, bool tncConsent, bool privacyConsent});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$AupTcStateCopyWithImpl<$Res, $Val extends AupTcState>
    implements $AupTcStateCopyWith<$Res> {
  _$AupTcStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? tncConsent = null,
    Object? privacyConsent = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      tncConsent: null == tncConsent
          ? _value.tncConsent
          : tncConsent // ignore: cast_nullable_to_non_nullable
              as bool,
      privacyConsent: null == privacyConsent
          ? _value.privacyConsent
          : privacyConsent // ignore: cast_nullable_to_non_nullable
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
abstract class _$$AupTcStateImplCopyWith<$Res>
    implements $AupTcStateCopyWith<$Res> {
  factory _$$AupTcStateImplCopyWith(
          _$AupTcStateImpl value, $Res Function(_$AupTcStateImpl) then) =
      __$$AupTcStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User user, bool tncConsent, bool privacyConsent});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AupTcStateImplCopyWithImpl<$Res>
    extends _$AupTcStateCopyWithImpl<$Res, _$AupTcStateImpl>
    implements _$$AupTcStateImplCopyWith<$Res> {
  __$$AupTcStateImplCopyWithImpl(
      _$AupTcStateImpl _value, $Res Function(_$AupTcStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? tncConsent = null,
    Object? privacyConsent = null,
  }) {
    return _then(_$AupTcStateImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      tncConsent: null == tncConsent
          ? _value.tncConsent
          : tncConsent // ignore: cast_nullable_to_non_nullable
              as bool,
      privacyConsent: null == privacyConsent
          ? _value.privacyConsent
          : privacyConsent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AupTcStateImpl extends _AupTcState {
  const _$AupTcStateImpl(
      {required this.user,
      required this.tncConsent,
      required this.privacyConsent})
      : super._();

  @override
  final User user;
  @override
  final bool tncConsent;
  @override
  final bool privacyConsent;

  @override
  String toString() {
    return 'AupTcState(user: $user, tncConsent: $tncConsent, privacyConsent: $privacyConsent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AupTcStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.tncConsent, tncConsent) ||
                other.tncConsent == tncConsent) &&
            (identical(other.privacyConsent, privacyConsent) ||
                other.privacyConsent == privacyConsent));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, user, tncConsent, privacyConsent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AupTcStateImplCopyWith<_$AupTcStateImpl> get copyWith =>
      __$$AupTcStateImplCopyWithImpl<_$AupTcStateImpl>(this, _$identity);
}

abstract class _AupTcState extends AupTcState {
  const factory _AupTcState(
      {required final User user,
      required final bool tncConsent,
      required final bool privacyConsent}) = _$AupTcStateImpl;
  const _AupTcState._() : super._();

  @override
  User get user;
  @override
  bool get tncConsent;
  @override
  bool get privacyConsent;
  @override
  @JsonKey(ignore: true)
  _$$AupTcStateImplCopyWith<_$AupTcStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

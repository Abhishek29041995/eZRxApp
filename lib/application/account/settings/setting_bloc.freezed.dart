// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchBiometricFlag,
    required TResult Function(bool isBiometricEnabled) toggleBiometric,
    required TResult Function() checkIfBiometricPossible,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchBiometricFlag,
    TResult? Function(bool isBiometricEnabled)? toggleBiometric,
    TResult? Function()? checkIfBiometricPossible,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchBiometricFlag,
    TResult Function(bool isBiometricEnabled)? toggleBiometric,
    TResult Function()? checkIfBiometricPossible,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchBiometricFlag value) fetchBiometricFlag,
    required TResult Function(_PutBiometricEnabled value) toggleBiometric,
    required TResult Function(_CheckIfBiometricPossible value)
        checkIfBiometricPossible,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchBiometricFlag value)? fetchBiometricFlag,
    TResult? Function(_PutBiometricEnabled value)? toggleBiometric,
    TResult? Function(_CheckIfBiometricPossible value)?
        checkIfBiometricPossible,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchBiometricFlag value)? fetchBiometricFlag,
    TResult Function(_PutBiometricEnabled value)? toggleBiometric,
    TResult Function(_CheckIfBiometricPossible value)? checkIfBiometricPossible,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingEventCopyWith<$Res> {
  factory $SettingEventCopyWith(
          SettingEvent value, $Res Function(SettingEvent) then) =
      _$SettingEventCopyWithImpl<$Res, SettingEvent>;
}

/// @nodoc
class _$SettingEventCopyWithImpl<$Res, $Val extends SettingEvent>
    implements $SettingEventCopyWith<$Res> {
  _$SettingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchBiometricFlagImplCopyWith<$Res> {
  factory _$$FetchBiometricFlagImplCopyWith(_$FetchBiometricFlagImpl value,
          $Res Function(_$FetchBiometricFlagImpl) then) =
      __$$FetchBiometricFlagImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchBiometricFlagImplCopyWithImpl<$Res>
    extends _$SettingEventCopyWithImpl<$Res, _$FetchBiometricFlagImpl>
    implements _$$FetchBiometricFlagImplCopyWith<$Res> {
  __$$FetchBiometricFlagImplCopyWithImpl(_$FetchBiometricFlagImpl _value,
      $Res Function(_$FetchBiometricFlagImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchBiometricFlagImpl implements _FetchBiometricFlag {
  const _$FetchBiometricFlagImpl();

  @override
  String toString() {
    return 'SettingEvent.fetchBiometricFlag()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchBiometricFlagImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchBiometricFlag,
    required TResult Function(bool isBiometricEnabled) toggleBiometric,
    required TResult Function() checkIfBiometricPossible,
  }) {
    return fetchBiometricFlag();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchBiometricFlag,
    TResult? Function(bool isBiometricEnabled)? toggleBiometric,
    TResult? Function()? checkIfBiometricPossible,
  }) {
    return fetchBiometricFlag?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchBiometricFlag,
    TResult Function(bool isBiometricEnabled)? toggleBiometric,
    TResult Function()? checkIfBiometricPossible,
    required TResult orElse(),
  }) {
    if (fetchBiometricFlag != null) {
      return fetchBiometricFlag();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchBiometricFlag value) fetchBiometricFlag,
    required TResult Function(_PutBiometricEnabled value) toggleBiometric,
    required TResult Function(_CheckIfBiometricPossible value)
        checkIfBiometricPossible,
  }) {
    return fetchBiometricFlag(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchBiometricFlag value)? fetchBiometricFlag,
    TResult? Function(_PutBiometricEnabled value)? toggleBiometric,
    TResult? Function(_CheckIfBiometricPossible value)?
        checkIfBiometricPossible,
  }) {
    return fetchBiometricFlag?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchBiometricFlag value)? fetchBiometricFlag,
    TResult Function(_PutBiometricEnabled value)? toggleBiometric,
    TResult Function(_CheckIfBiometricPossible value)? checkIfBiometricPossible,
    required TResult orElse(),
  }) {
    if (fetchBiometricFlag != null) {
      return fetchBiometricFlag(this);
    }
    return orElse();
  }
}

abstract class _FetchBiometricFlag implements SettingEvent {
  const factory _FetchBiometricFlag() = _$FetchBiometricFlagImpl;
}

/// @nodoc
abstract class _$$PutBiometricEnabledImplCopyWith<$Res> {
  factory _$$PutBiometricEnabledImplCopyWith(_$PutBiometricEnabledImpl value,
          $Res Function(_$PutBiometricEnabledImpl) then) =
      __$$PutBiometricEnabledImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isBiometricEnabled});
}

/// @nodoc
class __$$PutBiometricEnabledImplCopyWithImpl<$Res>
    extends _$SettingEventCopyWithImpl<$Res, _$PutBiometricEnabledImpl>
    implements _$$PutBiometricEnabledImplCopyWith<$Res> {
  __$$PutBiometricEnabledImplCopyWithImpl(_$PutBiometricEnabledImpl _value,
      $Res Function(_$PutBiometricEnabledImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBiometricEnabled = null,
  }) {
    return _then(_$PutBiometricEnabledImpl(
      isBiometricEnabled: null == isBiometricEnabled
          ? _value.isBiometricEnabled
          : isBiometricEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PutBiometricEnabledImpl implements _PutBiometricEnabled {
  const _$PutBiometricEnabledImpl({required this.isBiometricEnabled});

  @override
  final bool isBiometricEnabled;

  @override
  String toString() {
    return 'SettingEvent.toggleBiometric(isBiometricEnabled: $isBiometricEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PutBiometricEnabledImpl &&
            (identical(other.isBiometricEnabled, isBiometricEnabled) ||
                other.isBiometricEnabled == isBiometricEnabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isBiometricEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PutBiometricEnabledImplCopyWith<_$PutBiometricEnabledImpl> get copyWith =>
      __$$PutBiometricEnabledImplCopyWithImpl<_$PutBiometricEnabledImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchBiometricFlag,
    required TResult Function(bool isBiometricEnabled) toggleBiometric,
    required TResult Function() checkIfBiometricPossible,
  }) {
    return toggleBiometric(isBiometricEnabled);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchBiometricFlag,
    TResult? Function(bool isBiometricEnabled)? toggleBiometric,
    TResult? Function()? checkIfBiometricPossible,
  }) {
    return toggleBiometric?.call(isBiometricEnabled);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchBiometricFlag,
    TResult Function(bool isBiometricEnabled)? toggleBiometric,
    TResult Function()? checkIfBiometricPossible,
    required TResult orElse(),
  }) {
    if (toggleBiometric != null) {
      return toggleBiometric(isBiometricEnabled);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchBiometricFlag value) fetchBiometricFlag,
    required TResult Function(_PutBiometricEnabled value) toggleBiometric,
    required TResult Function(_CheckIfBiometricPossible value)
        checkIfBiometricPossible,
  }) {
    return toggleBiometric(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchBiometricFlag value)? fetchBiometricFlag,
    TResult? Function(_PutBiometricEnabled value)? toggleBiometric,
    TResult? Function(_CheckIfBiometricPossible value)?
        checkIfBiometricPossible,
  }) {
    return toggleBiometric?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchBiometricFlag value)? fetchBiometricFlag,
    TResult Function(_PutBiometricEnabled value)? toggleBiometric,
    TResult Function(_CheckIfBiometricPossible value)? checkIfBiometricPossible,
    required TResult orElse(),
  }) {
    if (toggleBiometric != null) {
      return toggleBiometric(this);
    }
    return orElse();
  }
}

abstract class _PutBiometricEnabled implements SettingEvent {
  const factory _PutBiometricEnabled({required final bool isBiometricEnabled}) =
      _$PutBiometricEnabledImpl;

  bool get isBiometricEnabled;
  @JsonKey(ignore: true)
  _$$PutBiometricEnabledImplCopyWith<_$PutBiometricEnabledImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckIfBiometricPossibleImplCopyWith<$Res> {
  factory _$$CheckIfBiometricPossibleImplCopyWith(
          _$CheckIfBiometricPossibleImpl value,
          $Res Function(_$CheckIfBiometricPossibleImpl) then) =
      __$$CheckIfBiometricPossibleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckIfBiometricPossibleImplCopyWithImpl<$Res>
    extends _$SettingEventCopyWithImpl<$Res, _$CheckIfBiometricPossibleImpl>
    implements _$$CheckIfBiometricPossibleImplCopyWith<$Res> {
  __$$CheckIfBiometricPossibleImplCopyWithImpl(
      _$CheckIfBiometricPossibleImpl _value,
      $Res Function(_$CheckIfBiometricPossibleImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckIfBiometricPossibleImpl implements _CheckIfBiometricPossible {
  const _$CheckIfBiometricPossibleImpl();

  @override
  String toString() {
    return 'SettingEvent.checkIfBiometricPossible()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckIfBiometricPossibleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchBiometricFlag,
    required TResult Function(bool isBiometricEnabled) toggleBiometric,
    required TResult Function() checkIfBiometricPossible,
  }) {
    return checkIfBiometricPossible();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchBiometricFlag,
    TResult? Function(bool isBiometricEnabled)? toggleBiometric,
    TResult? Function()? checkIfBiometricPossible,
  }) {
    return checkIfBiometricPossible?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchBiometricFlag,
    TResult Function(bool isBiometricEnabled)? toggleBiometric,
    TResult Function()? checkIfBiometricPossible,
    required TResult orElse(),
  }) {
    if (checkIfBiometricPossible != null) {
      return checkIfBiometricPossible();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchBiometricFlag value) fetchBiometricFlag,
    required TResult Function(_PutBiometricEnabled value) toggleBiometric,
    required TResult Function(_CheckIfBiometricPossible value)
        checkIfBiometricPossible,
  }) {
    return checkIfBiometricPossible(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchBiometricFlag value)? fetchBiometricFlag,
    TResult? Function(_PutBiometricEnabled value)? toggleBiometric,
    TResult? Function(_CheckIfBiometricPossible value)?
        checkIfBiometricPossible,
  }) {
    return checkIfBiometricPossible?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchBiometricFlag value)? fetchBiometricFlag,
    TResult Function(_PutBiometricEnabled value)? toggleBiometric,
    TResult Function(_CheckIfBiometricPossible value)? checkIfBiometricPossible,
    required TResult orElse(),
  }) {
    if (checkIfBiometricPossible != null) {
      return checkIfBiometricPossible(this);
    }
    return orElse();
  }
}

abstract class _CheckIfBiometricPossible implements SettingEvent {
  const factory _CheckIfBiometricPossible() = _$CheckIfBiometricPossibleImpl;
}

/// @nodoc
mixin _$SettingState {
  bool get isBiometricEnable => throw _privateConstructorUsedError;
  bool get isBiometricPossible => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingStateCopyWith<SettingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingStateCopyWith<$Res> {
  factory $SettingStateCopyWith(
          SettingState value, $Res Function(SettingState) then) =
      _$SettingStateCopyWithImpl<$Res, SettingState>;
  @useResult
  $Res call(
      {bool isBiometricEnable,
      bool isBiometricPossible,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});
}

/// @nodoc
class _$SettingStateCopyWithImpl<$Res, $Val extends SettingState>
    implements $SettingStateCopyWith<$Res> {
  _$SettingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBiometricEnable = null,
    Object? isBiometricPossible = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      isBiometricEnable: null == isBiometricEnable
          ? _value.isBiometricEnable
          : isBiometricEnable // ignore: cast_nullable_to_non_nullable
              as bool,
      isBiometricPossible: null == isBiometricPossible
          ? _value.isBiometricPossible
          : isBiometricPossible // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingStateImplCopyWith<$Res>
    implements $SettingStateCopyWith<$Res> {
  factory _$$SettingStateImplCopyWith(
          _$SettingStateImpl value, $Res Function(_$SettingStateImpl) then) =
      __$$SettingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isBiometricEnable,
      bool isBiometricPossible,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});
}

/// @nodoc
class __$$SettingStateImplCopyWithImpl<$Res>
    extends _$SettingStateCopyWithImpl<$Res, _$SettingStateImpl>
    implements _$$SettingStateImplCopyWith<$Res> {
  __$$SettingStateImplCopyWithImpl(
      _$SettingStateImpl _value, $Res Function(_$SettingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBiometricEnable = null,
    Object? isBiometricPossible = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_$SettingStateImpl(
      isBiometricEnable: null == isBiometricEnable
          ? _value.isBiometricEnable
          : isBiometricEnable // ignore: cast_nullable_to_non_nullable
              as bool,
      isBiometricPossible: null == isBiometricPossible
          ? _value.isBiometricPossible
          : isBiometricPossible // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$SettingStateImpl implements _SettingState {
  const _$SettingStateImpl(
      {required this.isBiometricEnable,
      required this.isBiometricPossible,
      required this.failureOrSuccessOption});

  @override
  final bool isBiometricEnable;
  @override
  final bool isBiometricPossible;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;

  @override
  String toString() {
    return 'SettingState(isBiometricEnable: $isBiometricEnable, isBiometricPossible: $isBiometricPossible, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingStateImpl &&
            (identical(other.isBiometricEnable, isBiometricEnable) ||
                other.isBiometricEnable == isBiometricEnable) &&
            (identical(other.isBiometricPossible, isBiometricPossible) ||
                other.isBiometricPossible == isBiometricPossible) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isBiometricEnable,
      isBiometricPossible, failureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingStateImplCopyWith<_$SettingStateImpl> get copyWith =>
      __$$SettingStateImplCopyWithImpl<_$SettingStateImpl>(this, _$identity);
}

abstract class _SettingState implements SettingState {
  const factory _SettingState(
      {required final bool isBiometricEnable,
      required final bool isBiometricPossible,
      required final Option<Either<ApiFailure, dynamic>>
          failureOrSuccessOption}) = _$SettingStateImpl;

  @override
  bool get isBiometricEnable;
  @override
  bool get isBiometricPossible;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$SettingStateImplCopyWith<_$SettingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

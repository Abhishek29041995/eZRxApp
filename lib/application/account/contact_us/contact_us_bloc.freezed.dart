// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_us_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ContactUsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppMarket market) initialized,
    required TResult Function() submit,
    required TResult Function(String newValue) onUsernameChange,
    required TResult Function(String newValue) onEmailChange,
    required TResult Function(String newValue) onContactNumberChange,
    required TResult Function(String newValue) onMessageChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppMarket market)? initialized,
    TResult? Function()? submit,
    TResult? Function(String newValue)? onUsernameChange,
    TResult? Function(String newValue)? onEmailChange,
    TResult? Function(String newValue)? onContactNumberChange,
    TResult? Function(String newValue)? onMessageChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppMarket market)? initialized,
    TResult Function()? submit,
    TResult Function(String newValue)? onUsernameChange,
    TResult Function(String newValue)? onEmailChange,
    TResult Function(String newValue)? onContactNumberChange,
    TResult Function(String newValue)? onMessageChange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Submit value) submit,
    required TResult Function(_UsernameChange value) onUsernameChange,
    required TResult Function(_EmailChange value) onEmailChange,
    required TResult Function(_ContactNumberChange value) onContactNumberChange,
    required TResult Function(_MessageChange value) onMessageChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_UsernameChange value)? onUsernameChange,
    TResult? Function(_EmailChange value)? onEmailChange,
    TResult? Function(_ContactNumberChange value)? onContactNumberChange,
    TResult? Function(_MessageChange value)? onMessageChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Submit value)? submit,
    TResult Function(_UsernameChange value)? onUsernameChange,
    TResult Function(_EmailChange value)? onEmailChange,
    TResult Function(_ContactNumberChange value)? onContactNumberChange,
    TResult Function(_MessageChange value)? onMessageChange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactUsEventCopyWith<$Res> {
  factory $ContactUsEventCopyWith(
          ContactUsEvent value, $Res Function(ContactUsEvent) then) =
      _$ContactUsEventCopyWithImpl<$Res, ContactUsEvent>;
}

/// @nodoc
class _$ContactUsEventCopyWithImpl<$Res, $Val extends ContactUsEvent>
    implements $ContactUsEventCopyWith<$Res> {
  _$ContactUsEventCopyWithImpl(this._value, this._then);

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
  @useResult
  $Res call({AppMarket market});
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$ContactUsEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? market = null,
  }) {
    return _then(_$InitializedImpl(
      market: null == market
          ? _value.market
          : market // ignore: cast_nullable_to_non_nullable
              as AppMarket,
    ));
  }
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl({required this.market});

  @override
  final AppMarket market;

  @override
  String toString() {
    return 'ContactUsEvent.initialized(market: $market)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializedImpl &&
            (identical(other.market, market) || other.market == market));
  }

  @override
  int get hashCode => Object.hash(runtimeType, market);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      __$$InitializedImplCopyWithImpl<_$InitializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppMarket market) initialized,
    required TResult Function() submit,
    required TResult Function(String newValue) onUsernameChange,
    required TResult Function(String newValue) onEmailChange,
    required TResult Function(String newValue) onContactNumberChange,
    required TResult Function(String newValue) onMessageChange,
  }) {
    return initialized(market);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppMarket market)? initialized,
    TResult? Function()? submit,
    TResult? Function(String newValue)? onUsernameChange,
    TResult? Function(String newValue)? onEmailChange,
    TResult? Function(String newValue)? onContactNumberChange,
    TResult? Function(String newValue)? onMessageChange,
  }) {
    return initialized?.call(market);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppMarket market)? initialized,
    TResult Function()? submit,
    TResult Function(String newValue)? onUsernameChange,
    TResult Function(String newValue)? onEmailChange,
    TResult Function(String newValue)? onContactNumberChange,
    TResult Function(String newValue)? onMessageChange,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(market);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Submit value) submit,
    required TResult Function(_UsernameChange value) onUsernameChange,
    required TResult Function(_EmailChange value) onEmailChange,
    required TResult Function(_ContactNumberChange value) onContactNumberChange,
    required TResult Function(_MessageChange value) onMessageChange,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_UsernameChange value)? onUsernameChange,
    TResult? Function(_EmailChange value)? onEmailChange,
    TResult? Function(_ContactNumberChange value)? onContactNumberChange,
    TResult? Function(_MessageChange value)? onMessageChange,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Submit value)? submit,
    TResult Function(_UsernameChange value)? onUsernameChange,
    TResult Function(_EmailChange value)? onEmailChange,
    TResult Function(_ContactNumberChange value)? onContactNumberChange,
    TResult Function(_MessageChange value)? onMessageChange,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements ContactUsEvent {
  const factory _Initialized({required final AppMarket market}) =
      _$InitializedImpl;

  AppMarket get market;
  @JsonKey(ignore: true)
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitImplCopyWith<$Res> {
  factory _$$SubmitImplCopyWith(
          _$SubmitImpl value, $Res Function(_$SubmitImpl) then) =
      __$$SubmitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubmitImplCopyWithImpl<$Res>
    extends _$ContactUsEventCopyWithImpl<$Res, _$SubmitImpl>
    implements _$$SubmitImplCopyWith<$Res> {
  __$$SubmitImplCopyWithImpl(
      _$SubmitImpl _value, $Res Function(_$SubmitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SubmitImpl implements _Submit {
  const _$SubmitImpl();

  @override
  String toString() {
    return 'ContactUsEvent.submit()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SubmitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppMarket market) initialized,
    required TResult Function() submit,
    required TResult Function(String newValue) onUsernameChange,
    required TResult Function(String newValue) onEmailChange,
    required TResult Function(String newValue) onContactNumberChange,
    required TResult Function(String newValue) onMessageChange,
  }) {
    return submit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppMarket market)? initialized,
    TResult? Function()? submit,
    TResult? Function(String newValue)? onUsernameChange,
    TResult? Function(String newValue)? onEmailChange,
    TResult? Function(String newValue)? onContactNumberChange,
    TResult? Function(String newValue)? onMessageChange,
  }) {
    return submit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppMarket market)? initialized,
    TResult Function()? submit,
    TResult Function(String newValue)? onUsernameChange,
    TResult Function(String newValue)? onEmailChange,
    TResult Function(String newValue)? onContactNumberChange,
    TResult Function(String newValue)? onMessageChange,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Submit value) submit,
    required TResult Function(_UsernameChange value) onUsernameChange,
    required TResult Function(_EmailChange value) onEmailChange,
    required TResult Function(_ContactNumberChange value) onContactNumberChange,
    required TResult Function(_MessageChange value) onMessageChange,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_UsernameChange value)? onUsernameChange,
    TResult? Function(_EmailChange value)? onEmailChange,
    TResult? Function(_ContactNumberChange value)? onContactNumberChange,
    TResult? Function(_MessageChange value)? onMessageChange,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Submit value)? submit,
    TResult Function(_UsernameChange value)? onUsernameChange,
    TResult Function(_EmailChange value)? onEmailChange,
    TResult Function(_ContactNumberChange value)? onContactNumberChange,
    TResult Function(_MessageChange value)? onMessageChange,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class _Submit implements ContactUsEvent {
  const factory _Submit() = _$SubmitImpl;
}

/// @nodoc
abstract class _$$UsernameChangeImplCopyWith<$Res> {
  factory _$$UsernameChangeImplCopyWith(_$UsernameChangeImpl value,
          $Res Function(_$UsernameChangeImpl) then) =
      __$$UsernameChangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String newValue});
}

/// @nodoc
class __$$UsernameChangeImplCopyWithImpl<$Res>
    extends _$ContactUsEventCopyWithImpl<$Res, _$UsernameChangeImpl>
    implements _$$UsernameChangeImplCopyWith<$Res> {
  __$$UsernameChangeImplCopyWithImpl(
      _$UsernameChangeImpl _value, $Res Function(_$UsernameChangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newValue = null,
  }) {
    return _then(_$UsernameChangeImpl(
      newValue: null == newValue
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UsernameChangeImpl implements _UsernameChange {
  const _$UsernameChangeImpl({required this.newValue});

  @override
  final String newValue;

  @override
  String toString() {
    return 'ContactUsEvent.onUsernameChange(newValue: $newValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsernameChangeImpl &&
            (identical(other.newValue, newValue) ||
                other.newValue == newValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UsernameChangeImplCopyWith<_$UsernameChangeImpl> get copyWith =>
      __$$UsernameChangeImplCopyWithImpl<_$UsernameChangeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppMarket market) initialized,
    required TResult Function() submit,
    required TResult Function(String newValue) onUsernameChange,
    required TResult Function(String newValue) onEmailChange,
    required TResult Function(String newValue) onContactNumberChange,
    required TResult Function(String newValue) onMessageChange,
  }) {
    return onUsernameChange(newValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppMarket market)? initialized,
    TResult? Function()? submit,
    TResult? Function(String newValue)? onUsernameChange,
    TResult? Function(String newValue)? onEmailChange,
    TResult? Function(String newValue)? onContactNumberChange,
    TResult? Function(String newValue)? onMessageChange,
  }) {
    return onUsernameChange?.call(newValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppMarket market)? initialized,
    TResult Function()? submit,
    TResult Function(String newValue)? onUsernameChange,
    TResult Function(String newValue)? onEmailChange,
    TResult Function(String newValue)? onContactNumberChange,
    TResult Function(String newValue)? onMessageChange,
    required TResult orElse(),
  }) {
    if (onUsernameChange != null) {
      return onUsernameChange(newValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Submit value) submit,
    required TResult Function(_UsernameChange value) onUsernameChange,
    required TResult Function(_EmailChange value) onEmailChange,
    required TResult Function(_ContactNumberChange value) onContactNumberChange,
    required TResult Function(_MessageChange value) onMessageChange,
  }) {
    return onUsernameChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_UsernameChange value)? onUsernameChange,
    TResult? Function(_EmailChange value)? onEmailChange,
    TResult? Function(_ContactNumberChange value)? onContactNumberChange,
    TResult? Function(_MessageChange value)? onMessageChange,
  }) {
    return onUsernameChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Submit value)? submit,
    TResult Function(_UsernameChange value)? onUsernameChange,
    TResult Function(_EmailChange value)? onEmailChange,
    TResult Function(_ContactNumberChange value)? onContactNumberChange,
    TResult Function(_MessageChange value)? onMessageChange,
    required TResult orElse(),
  }) {
    if (onUsernameChange != null) {
      return onUsernameChange(this);
    }
    return orElse();
  }
}

abstract class _UsernameChange implements ContactUsEvent {
  const factory _UsernameChange({required final String newValue}) =
      _$UsernameChangeImpl;

  String get newValue;
  @JsonKey(ignore: true)
  _$$UsernameChangeImplCopyWith<_$UsernameChangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmailChangeImplCopyWith<$Res> {
  factory _$$EmailChangeImplCopyWith(
          _$EmailChangeImpl value, $Res Function(_$EmailChangeImpl) then) =
      __$$EmailChangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String newValue});
}

/// @nodoc
class __$$EmailChangeImplCopyWithImpl<$Res>
    extends _$ContactUsEventCopyWithImpl<$Res, _$EmailChangeImpl>
    implements _$$EmailChangeImplCopyWith<$Res> {
  __$$EmailChangeImplCopyWithImpl(
      _$EmailChangeImpl _value, $Res Function(_$EmailChangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newValue = null,
  }) {
    return _then(_$EmailChangeImpl(
      newValue: null == newValue
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailChangeImpl implements _EmailChange {
  const _$EmailChangeImpl({required this.newValue});

  @override
  final String newValue;

  @override
  String toString() {
    return 'ContactUsEvent.onEmailChange(newValue: $newValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailChangeImpl &&
            (identical(other.newValue, newValue) ||
                other.newValue == newValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailChangeImplCopyWith<_$EmailChangeImpl> get copyWith =>
      __$$EmailChangeImplCopyWithImpl<_$EmailChangeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppMarket market) initialized,
    required TResult Function() submit,
    required TResult Function(String newValue) onUsernameChange,
    required TResult Function(String newValue) onEmailChange,
    required TResult Function(String newValue) onContactNumberChange,
    required TResult Function(String newValue) onMessageChange,
  }) {
    return onEmailChange(newValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppMarket market)? initialized,
    TResult? Function()? submit,
    TResult? Function(String newValue)? onUsernameChange,
    TResult? Function(String newValue)? onEmailChange,
    TResult? Function(String newValue)? onContactNumberChange,
    TResult? Function(String newValue)? onMessageChange,
  }) {
    return onEmailChange?.call(newValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppMarket market)? initialized,
    TResult Function()? submit,
    TResult Function(String newValue)? onUsernameChange,
    TResult Function(String newValue)? onEmailChange,
    TResult Function(String newValue)? onContactNumberChange,
    TResult Function(String newValue)? onMessageChange,
    required TResult orElse(),
  }) {
    if (onEmailChange != null) {
      return onEmailChange(newValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Submit value) submit,
    required TResult Function(_UsernameChange value) onUsernameChange,
    required TResult Function(_EmailChange value) onEmailChange,
    required TResult Function(_ContactNumberChange value) onContactNumberChange,
    required TResult Function(_MessageChange value) onMessageChange,
  }) {
    return onEmailChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_UsernameChange value)? onUsernameChange,
    TResult? Function(_EmailChange value)? onEmailChange,
    TResult? Function(_ContactNumberChange value)? onContactNumberChange,
    TResult? Function(_MessageChange value)? onMessageChange,
  }) {
    return onEmailChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Submit value)? submit,
    TResult Function(_UsernameChange value)? onUsernameChange,
    TResult Function(_EmailChange value)? onEmailChange,
    TResult Function(_ContactNumberChange value)? onContactNumberChange,
    TResult Function(_MessageChange value)? onMessageChange,
    required TResult orElse(),
  }) {
    if (onEmailChange != null) {
      return onEmailChange(this);
    }
    return orElse();
  }
}

abstract class _EmailChange implements ContactUsEvent {
  const factory _EmailChange({required final String newValue}) =
      _$EmailChangeImpl;

  String get newValue;
  @JsonKey(ignore: true)
  _$$EmailChangeImplCopyWith<_$EmailChangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ContactNumberChangeImplCopyWith<$Res> {
  factory _$$ContactNumberChangeImplCopyWith(_$ContactNumberChangeImpl value,
          $Res Function(_$ContactNumberChangeImpl) then) =
      __$$ContactNumberChangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String newValue});
}

/// @nodoc
class __$$ContactNumberChangeImplCopyWithImpl<$Res>
    extends _$ContactUsEventCopyWithImpl<$Res, _$ContactNumberChangeImpl>
    implements _$$ContactNumberChangeImplCopyWith<$Res> {
  __$$ContactNumberChangeImplCopyWithImpl(_$ContactNumberChangeImpl _value,
      $Res Function(_$ContactNumberChangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newValue = null,
  }) {
    return _then(_$ContactNumberChangeImpl(
      newValue: null == newValue
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ContactNumberChangeImpl implements _ContactNumberChange {
  const _$ContactNumberChangeImpl({required this.newValue});

  @override
  final String newValue;

  @override
  String toString() {
    return 'ContactUsEvent.onContactNumberChange(newValue: $newValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactNumberChangeImpl &&
            (identical(other.newValue, newValue) ||
                other.newValue == newValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactNumberChangeImplCopyWith<_$ContactNumberChangeImpl> get copyWith =>
      __$$ContactNumberChangeImplCopyWithImpl<_$ContactNumberChangeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppMarket market) initialized,
    required TResult Function() submit,
    required TResult Function(String newValue) onUsernameChange,
    required TResult Function(String newValue) onEmailChange,
    required TResult Function(String newValue) onContactNumberChange,
    required TResult Function(String newValue) onMessageChange,
  }) {
    return onContactNumberChange(newValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppMarket market)? initialized,
    TResult? Function()? submit,
    TResult? Function(String newValue)? onUsernameChange,
    TResult? Function(String newValue)? onEmailChange,
    TResult? Function(String newValue)? onContactNumberChange,
    TResult? Function(String newValue)? onMessageChange,
  }) {
    return onContactNumberChange?.call(newValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppMarket market)? initialized,
    TResult Function()? submit,
    TResult Function(String newValue)? onUsernameChange,
    TResult Function(String newValue)? onEmailChange,
    TResult Function(String newValue)? onContactNumberChange,
    TResult Function(String newValue)? onMessageChange,
    required TResult orElse(),
  }) {
    if (onContactNumberChange != null) {
      return onContactNumberChange(newValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Submit value) submit,
    required TResult Function(_UsernameChange value) onUsernameChange,
    required TResult Function(_EmailChange value) onEmailChange,
    required TResult Function(_ContactNumberChange value) onContactNumberChange,
    required TResult Function(_MessageChange value) onMessageChange,
  }) {
    return onContactNumberChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_UsernameChange value)? onUsernameChange,
    TResult? Function(_EmailChange value)? onEmailChange,
    TResult? Function(_ContactNumberChange value)? onContactNumberChange,
    TResult? Function(_MessageChange value)? onMessageChange,
  }) {
    return onContactNumberChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Submit value)? submit,
    TResult Function(_UsernameChange value)? onUsernameChange,
    TResult Function(_EmailChange value)? onEmailChange,
    TResult Function(_ContactNumberChange value)? onContactNumberChange,
    TResult Function(_MessageChange value)? onMessageChange,
    required TResult orElse(),
  }) {
    if (onContactNumberChange != null) {
      return onContactNumberChange(this);
    }
    return orElse();
  }
}

abstract class _ContactNumberChange implements ContactUsEvent {
  const factory _ContactNumberChange({required final String newValue}) =
      _$ContactNumberChangeImpl;

  String get newValue;
  @JsonKey(ignore: true)
  _$$ContactNumberChangeImplCopyWith<_$ContactNumberChangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MessageChangeImplCopyWith<$Res> {
  factory _$$MessageChangeImplCopyWith(
          _$MessageChangeImpl value, $Res Function(_$MessageChangeImpl) then) =
      __$$MessageChangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String newValue});
}

/// @nodoc
class __$$MessageChangeImplCopyWithImpl<$Res>
    extends _$ContactUsEventCopyWithImpl<$Res, _$MessageChangeImpl>
    implements _$$MessageChangeImplCopyWith<$Res> {
  __$$MessageChangeImplCopyWithImpl(
      _$MessageChangeImpl _value, $Res Function(_$MessageChangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newValue = null,
  }) {
    return _then(_$MessageChangeImpl(
      newValue: null == newValue
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MessageChangeImpl implements _MessageChange {
  const _$MessageChangeImpl({required this.newValue});

  @override
  final String newValue;

  @override
  String toString() {
    return 'ContactUsEvent.onMessageChange(newValue: $newValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageChangeImpl &&
            (identical(other.newValue, newValue) ||
                other.newValue == newValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageChangeImplCopyWith<_$MessageChangeImpl> get copyWith =>
      __$$MessageChangeImplCopyWithImpl<_$MessageChangeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AppMarket market) initialized,
    required TResult Function() submit,
    required TResult Function(String newValue) onUsernameChange,
    required TResult Function(String newValue) onEmailChange,
    required TResult Function(String newValue) onContactNumberChange,
    required TResult Function(String newValue) onMessageChange,
  }) {
    return onMessageChange(newValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AppMarket market)? initialized,
    TResult? Function()? submit,
    TResult? Function(String newValue)? onUsernameChange,
    TResult? Function(String newValue)? onEmailChange,
    TResult? Function(String newValue)? onContactNumberChange,
    TResult? Function(String newValue)? onMessageChange,
  }) {
    return onMessageChange?.call(newValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AppMarket market)? initialized,
    TResult Function()? submit,
    TResult Function(String newValue)? onUsernameChange,
    TResult Function(String newValue)? onEmailChange,
    TResult Function(String newValue)? onContactNumberChange,
    TResult Function(String newValue)? onMessageChange,
    required TResult orElse(),
  }) {
    if (onMessageChange != null) {
      return onMessageChange(newValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Submit value) submit,
    required TResult Function(_UsernameChange value) onUsernameChange,
    required TResult Function(_EmailChange value) onEmailChange,
    required TResult Function(_ContactNumberChange value) onContactNumberChange,
    required TResult Function(_MessageChange value) onMessageChange,
  }) {
    return onMessageChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_UsernameChange value)? onUsernameChange,
    TResult? Function(_EmailChange value)? onEmailChange,
    TResult? Function(_ContactNumberChange value)? onContactNumberChange,
    TResult? Function(_MessageChange value)? onMessageChange,
  }) {
    return onMessageChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Submit value)? submit,
    TResult Function(_UsernameChange value)? onUsernameChange,
    TResult Function(_EmailChange value)? onEmailChange,
    TResult Function(_ContactNumberChange value)? onContactNumberChange,
    TResult Function(_MessageChange value)? onMessageChange,
    required TResult orElse(),
  }) {
    if (onMessageChange != null) {
      return onMessageChange(this);
    }
    return orElse();
  }
}

abstract class _MessageChange implements ContactUsEvent {
  const factory _MessageChange({required final String newValue}) =
      _$MessageChangeImpl;

  String get newValue;
  @JsonKey(ignore: true)
  _$$MessageChangeImplCopyWith<_$MessageChangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ContactUsState {
  ContactUs get contactUs => throw _privateConstructorUsedError;
  AppMarket get appMarket => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showErrorMessage => throw _privateConstructorUsedError;
  bool get responseFlag => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContactUsStateCopyWith<ContactUsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactUsStateCopyWith<$Res> {
  factory $ContactUsStateCopyWith(
          ContactUsState value, $Res Function(ContactUsState) then) =
      _$ContactUsStateCopyWithImpl<$Res, ContactUsState>;
  @useResult
  $Res call(
      {ContactUs contactUs,
      AppMarket appMarket,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool isSubmitting,
      bool showErrorMessage,
      bool responseFlag});

  $ContactUsCopyWith<$Res> get contactUs;
}

/// @nodoc
class _$ContactUsStateCopyWithImpl<$Res, $Val extends ContactUsState>
    implements $ContactUsStateCopyWith<$Res> {
  _$ContactUsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contactUs = null,
    Object? appMarket = null,
    Object? apiFailureOrSuccessOption = null,
    Object? isSubmitting = null,
    Object? showErrorMessage = null,
    Object? responseFlag = null,
  }) {
    return _then(_value.copyWith(
      contactUs: null == contactUs
          ? _value.contactUs
          : contactUs // ignore: cast_nullable_to_non_nullable
              as ContactUs,
      appMarket: null == appMarket
          ? _value.appMarket
          : appMarket // ignore: cast_nullable_to_non_nullable
              as AppMarket,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessage: null == showErrorMessage
          ? _value.showErrorMessage
          : showErrorMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      responseFlag: null == responseFlag
          ? _value.responseFlag
          : responseFlag // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContactUsCopyWith<$Res> get contactUs {
    return $ContactUsCopyWith<$Res>(_value.contactUs, (value) {
      return _then(_value.copyWith(contactUs: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContactUsStateImplCopyWith<$Res>
    implements $ContactUsStateCopyWith<$Res> {
  factory _$$ContactUsStateImplCopyWith(_$ContactUsStateImpl value,
          $Res Function(_$ContactUsStateImpl) then) =
      __$$ContactUsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ContactUs contactUs,
      AppMarket appMarket,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool isSubmitting,
      bool showErrorMessage,
      bool responseFlag});

  @override
  $ContactUsCopyWith<$Res> get contactUs;
}

/// @nodoc
class __$$ContactUsStateImplCopyWithImpl<$Res>
    extends _$ContactUsStateCopyWithImpl<$Res, _$ContactUsStateImpl>
    implements _$$ContactUsStateImplCopyWith<$Res> {
  __$$ContactUsStateImplCopyWithImpl(
      _$ContactUsStateImpl _value, $Res Function(_$ContactUsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contactUs = null,
    Object? appMarket = null,
    Object? apiFailureOrSuccessOption = null,
    Object? isSubmitting = null,
    Object? showErrorMessage = null,
    Object? responseFlag = null,
  }) {
    return _then(_$ContactUsStateImpl(
      contactUs: null == contactUs
          ? _value.contactUs
          : contactUs // ignore: cast_nullable_to_non_nullable
              as ContactUs,
      appMarket: null == appMarket
          ? _value.appMarket
          : appMarket // ignore: cast_nullable_to_non_nullable
              as AppMarket,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessage: null == showErrorMessage
          ? _value.showErrorMessage
          : showErrorMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      responseFlag: null == responseFlag
          ? _value.responseFlag
          : responseFlag // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ContactUsStateImpl extends _ContactUsState {
  const _$ContactUsStateImpl(
      {required this.contactUs,
      required this.appMarket,
      required this.apiFailureOrSuccessOption,
      required this.isSubmitting,
      required this.showErrorMessage,
      required this.responseFlag})
      : super._();

  @override
  final ContactUs contactUs;
  @override
  final AppMarket appMarket;
  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;
  @override
  final bool isSubmitting;
  @override
  final bool showErrorMessage;
  @override
  final bool responseFlag;

  @override
  String toString() {
    return 'ContactUsState(contactUs: $contactUs, appMarket: $appMarket, apiFailureOrSuccessOption: $apiFailureOrSuccessOption, isSubmitting: $isSubmitting, showErrorMessage: $showErrorMessage, responseFlag: $responseFlag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactUsStateImpl &&
            (identical(other.contactUs, contactUs) ||
                other.contactUs == contactUs) &&
            (identical(other.appMarket, appMarket) ||
                other.appMarket == appMarket) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.showErrorMessage, showErrorMessage) ||
                other.showErrorMessage == showErrorMessage) &&
            (identical(other.responseFlag, responseFlag) ||
                other.responseFlag == responseFlag));
  }

  @override
  int get hashCode => Object.hash(runtimeType, contactUs, appMarket,
      apiFailureOrSuccessOption, isSubmitting, showErrorMessage, responseFlag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactUsStateImplCopyWith<_$ContactUsStateImpl> get copyWith =>
      __$$ContactUsStateImplCopyWithImpl<_$ContactUsStateImpl>(
          this, _$identity);
}

abstract class _ContactUsState extends ContactUsState {
  const factory _ContactUsState(
      {required final ContactUs contactUs,
      required final AppMarket appMarket,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption,
      required final bool isSubmitting,
      required final bool showErrorMessage,
      required final bool responseFlag}) = _$ContactUsStateImpl;
  const _ContactUsState._() : super._();

  @override
  ContactUs get contactUs;
  @override
  AppMarket get appMarket;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  bool get isSubmitting;
  @override
  bool get showErrorMessage;
  @override
  bool get responseFlag;
  @override
  @JsonKey(ignore: true)
  _$$ContactUsStateImplCopyWith<_$ContactUsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

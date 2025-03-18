// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ez_point_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EZPointEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(CustomerCodeInfo customerCodeInfo) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(CustomerCodeInfo customerCodeInfo)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customerCodeInfo)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EZPointEventCopyWith<$Res> {
  factory $EZPointEventCopyWith(
          EZPointEvent value, $Res Function(EZPointEvent) then) =
      _$EZPointEventCopyWithImpl<$Res, EZPointEvent>;
}

/// @nodoc
class _$EZPointEventCopyWithImpl<$Res, $Val extends EZPointEvent>
    implements $EZPointEventCopyWith<$Res> {
  _$EZPointEventCopyWithImpl(this._value, this._then);

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
    extends _$EZPointEventCopyWithImpl<$Res, _$InitializedImpl>
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
    return 'EZPointEvent.initialized()';
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
    required TResult Function(CustomerCodeInfo customerCodeInfo) fetch,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(CustomerCodeInfo customerCodeInfo)? fetch,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customerCodeInfo)? fetch,
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
    required TResult Function(_Fetch value) fetch,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements EZPointEvent {
  const factory _Initialized() = _$InitializedImpl;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CustomerCodeInfo customerCodeInfo});

  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$EZPointEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeInfo = null,
  }) {
    return _then(_$FetchImpl(
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value));
    });
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl({required this.customerCodeInfo});

  @override
  final CustomerCodeInfo customerCodeInfo;

  @override
  String toString() {
    return 'EZPointEvent.fetch(customerCodeInfo: $customerCodeInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerCodeInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(CustomerCodeInfo customerCodeInfo) fetch,
  }) {
    return fetch(customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(CustomerCodeInfo customerCodeInfo)? fetch,
  }) {
    return fetch?.call(customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customerCodeInfo)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(customerCodeInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements EZPointEvent {
  const factory _Fetch({required final CustomerCodeInfo customerCodeInfo}) =
      _$FetchImpl;

  CustomerCodeInfo get customerCodeInfo;
  @JsonKey(ignore: true)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EZPointState {
  bool get isFetching => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get eZPointTokenFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  EZPointToken get ezPointToken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EZPointStateCopyWith<EZPointState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EZPointStateCopyWith<$Res> {
  factory $EZPointStateCopyWith(
          EZPointState value, $Res Function(EZPointState) then) =
      _$EZPointStateCopyWithImpl<$Res, EZPointState>;
  @useResult
  $Res call(
      {bool isFetching,
      Option<Either<ApiFailure, dynamic>> eZPointTokenFailureOrSuccessOption,
      EZPointToken ezPointToken});

  $EZPointTokenCopyWith<$Res> get ezPointToken;
}

/// @nodoc
class _$EZPointStateCopyWithImpl<$Res, $Val extends EZPointState>
    implements $EZPointStateCopyWith<$Res> {
  _$EZPointStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? eZPointTokenFailureOrSuccessOption = null,
    Object? ezPointToken = null,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      eZPointTokenFailureOrSuccessOption: null ==
              eZPointTokenFailureOrSuccessOption
          ? _value.eZPointTokenFailureOrSuccessOption
          : eZPointTokenFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      ezPointToken: null == ezPointToken
          ? _value.ezPointToken
          : ezPointToken // ignore: cast_nullable_to_non_nullable
              as EZPointToken,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EZPointTokenCopyWith<$Res> get ezPointToken {
    return $EZPointTokenCopyWith<$Res>(_value.ezPointToken, (value) {
      return _then(_value.copyWith(ezPointToken: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EZPointStateImplCopyWith<$Res>
    implements $EZPointStateCopyWith<$Res> {
  factory _$$EZPointStateImplCopyWith(
          _$EZPointStateImpl value, $Res Function(_$EZPointStateImpl) then) =
      __$$EZPointStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      Option<Either<ApiFailure, dynamic>> eZPointTokenFailureOrSuccessOption,
      EZPointToken ezPointToken});

  @override
  $EZPointTokenCopyWith<$Res> get ezPointToken;
}

/// @nodoc
class __$$EZPointStateImplCopyWithImpl<$Res>
    extends _$EZPointStateCopyWithImpl<$Res, _$EZPointStateImpl>
    implements _$$EZPointStateImplCopyWith<$Res> {
  __$$EZPointStateImplCopyWithImpl(
      _$EZPointStateImpl _value, $Res Function(_$EZPointStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? eZPointTokenFailureOrSuccessOption = null,
    Object? ezPointToken = null,
  }) {
    return _then(_$EZPointStateImpl(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      eZPointTokenFailureOrSuccessOption: null ==
              eZPointTokenFailureOrSuccessOption
          ? _value.eZPointTokenFailureOrSuccessOption
          : eZPointTokenFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      ezPointToken: null == ezPointToken
          ? _value.ezPointToken
          : ezPointToken // ignore: cast_nullable_to_non_nullable
              as EZPointToken,
    ));
  }
}

/// @nodoc

class _$EZPointStateImpl implements _EZPointState {
  const _$EZPointStateImpl(
      {required this.isFetching,
      required this.eZPointTokenFailureOrSuccessOption,
      required this.ezPointToken});

  @override
  final bool isFetching;
  @override
  final Option<Either<ApiFailure, dynamic>> eZPointTokenFailureOrSuccessOption;
  @override
  final EZPointToken ezPointToken;

  @override
  String toString() {
    return 'EZPointState(isFetching: $isFetching, eZPointTokenFailureOrSuccessOption: $eZPointTokenFailureOrSuccessOption, ezPointToken: $ezPointToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EZPointStateImpl &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.eZPointTokenFailureOrSuccessOption,
                    eZPointTokenFailureOrSuccessOption) ||
                other.eZPointTokenFailureOrSuccessOption ==
                    eZPointTokenFailureOrSuccessOption) &&
            (identical(other.ezPointToken, ezPointToken) ||
                other.ezPointToken == ezPointToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFetching,
      eZPointTokenFailureOrSuccessOption, ezPointToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EZPointStateImplCopyWith<_$EZPointStateImpl> get copyWith =>
      __$$EZPointStateImplCopyWithImpl<_$EZPointStateImpl>(this, _$identity);
}

abstract class _EZPointState implements EZPointState {
  const factory _EZPointState(
      {required final bool isFetching,
      required final Option<Either<ApiFailure, dynamic>>
          eZPointTokenFailureOrSuccessOption,
      required final EZPointToken ezPointToken}) = _$EZPointStateImpl;

  @override
  bool get isFetching;
  @override
  Option<Either<ApiFailure, dynamic>> get eZPointTokenFailureOrSuccessOption;
  @override
  EZPointToken get ezPointToken;
  @override
  @JsonKey(ignore: true)
  _$$EZPointStateImplCopyWith<_$EZPointStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

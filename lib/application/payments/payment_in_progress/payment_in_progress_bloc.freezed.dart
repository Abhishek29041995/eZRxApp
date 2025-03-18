// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_in_progress_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentInProgressEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentInProgressEventCopyWith<$Res> {
  factory $PaymentInProgressEventCopyWith(PaymentInProgressEvent value,
          $Res Function(PaymentInProgressEvent) then) =
      _$PaymentInProgressEventCopyWithImpl<$Res, PaymentInProgressEvent>;
}

/// @nodoc
class _$PaymentInProgressEventCopyWithImpl<$Res,
        $Val extends PaymentInProgressEvent>
    implements $PaymentInProgressEventCopyWith<$Res> {
  _$PaymentInProgressEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$initializedImplCopyWith<$Res> {
  factory _$$initializedImplCopyWith(
          _$initializedImpl value, $Res Function(_$initializedImpl) then) =
      __$$initializedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$initializedImplCopyWithImpl<$Res>
    extends _$PaymentInProgressEventCopyWithImpl<$Res, _$initializedImpl>
    implements _$$initializedImplCopyWith<$Res> {
  __$$initializedImplCopyWithImpl(
      _$initializedImpl _value, $Res Function(_$initializedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$initializedImpl implements _initialized {
  const _$initializedImpl();

  @override
  String toString() {
    return 'PaymentInProgressEvent.initialized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$initializedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)
        fetch,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
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
    required TResult Function(_initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _initialized implements PaymentInProgressEvent {
  const factory _initialized() = _$initializedImpl;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganization, CustomerCodeInfo customerCodeInfo});

  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$PaymentInProgressEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganization = null,
    Object? customerCodeInfo = null,
  }) {
    return _then(_$FetchImpl(
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganization {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganization, (value) {
      return _then(_value.copyWith(salesOrganization: value));
    });
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
  const _$FetchImpl(
      {required this.salesOrganization, required this.customerCodeInfo});

  @override
  final SalesOrganisation salesOrganization;
  @override
  final CustomerCodeInfo customerCodeInfo;

  @override
  String toString() {
    return 'PaymentInProgressEvent.fetch(salesOrganization: $salesOrganization, customerCodeInfo: $customerCodeInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.salesOrganization, salesOrganization) ||
                other.salesOrganization == salesOrganization) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, salesOrganization, customerCodeInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)
        fetch,
  }) {
    return fetch(salesOrganization, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
  }) {
    return fetch?.call(salesOrganization, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(salesOrganization, customerCodeInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements PaymentInProgressEvent {
  const factory _Fetch(
      {required final SalesOrganisation salesOrganization,
      required final CustomerCodeInfo customerCodeInfo}) = _$FetchImpl;

  SalesOrganisation get salesOrganization;
  CustomerCodeInfo get customerCodeInfo;
  @JsonKey(ignore: true)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PaymentInProgressState {
  StringValue get amount => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentInProgressStateCopyWith<PaymentInProgressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentInProgressStateCopyWith<$Res> {
  factory $PaymentInProgressStateCopyWith(PaymentInProgressState value,
          $Res Function(PaymentInProgressState) then) =
      _$PaymentInProgressStateCopyWithImpl<$Res, PaymentInProgressState>;
  @useResult
  $Res call(
      {StringValue amount,
      bool isFetching,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});
}

/// @nodoc
class _$PaymentInProgressStateCopyWithImpl<$Res,
        $Val extends PaymentInProgressState>
    implements $PaymentInProgressStateCopyWith<$Res> {
  _$PaymentInProgressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? isFetching = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as StringValue,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentSummaryStateImplCopyWith<$Res>
    implements $PaymentInProgressStateCopyWith<$Res> {
  factory _$$PaymentSummaryStateImplCopyWith(_$PaymentSummaryStateImpl value,
          $Res Function(_$PaymentSummaryStateImpl) then) =
      __$$PaymentSummaryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StringValue amount,
      bool isFetching,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});
}

/// @nodoc
class __$$PaymentSummaryStateImplCopyWithImpl<$Res>
    extends _$PaymentInProgressStateCopyWithImpl<$Res,
        _$PaymentSummaryStateImpl>
    implements _$$PaymentSummaryStateImplCopyWith<$Res> {
  __$$PaymentSummaryStateImplCopyWithImpl(_$PaymentSummaryStateImpl _value,
      $Res Function(_$PaymentSummaryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? isFetching = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_$PaymentSummaryStateImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as StringValue,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$PaymentSummaryStateImpl extends _PaymentSummaryState {
  const _$PaymentSummaryStateImpl(
      {required this.amount,
      required this.isFetching,
      required this.failureOrSuccessOption})
      : super._();

  @override
  final StringValue amount;
  @override
  final bool isFetching;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;

  @override
  String toString() {
    return 'PaymentInProgressState(amount: $amount, isFetching: $isFetching, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentSummaryStateImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, amount, isFetching, failureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentSummaryStateImplCopyWith<_$PaymentSummaryStateImpl> get copyWith =>
      __$$PaymentSummaryStateImplCopyWithImpl<_$PaymentSummaryStateImpl>(
          this, _$identity);
}

abstract class _PaymentSummaryState extends PaymentInProgressState {
  const factory _PaymentSummaryState(
      {required final StringValue amount,
      required final bool isFetching,
      required final Option<Either<ApiFailure, dynamic>>
          failureOrSuccessOption}) = _$PaymentSummaryStateImpl;
  const _PaymentSummaryState._() : super._();

  @override
  StringValue get amount;
  @override
  bool get isFetching;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$PaymentSummaryStateImplCopyWith<_$PaymentSummaryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

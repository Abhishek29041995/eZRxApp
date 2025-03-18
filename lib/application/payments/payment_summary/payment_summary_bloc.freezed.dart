// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_summary_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentSummaryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)
        initialized,
    required TResult Function(PaymentSummaryFilter appliedFilter) fetch,
    required TResult Function() loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult? Function(PaymentSummaryFilter appliedFilter)? fetch,
    TResult? Function()? loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult Function(PaymentSummaryFilter appliedFilter)? fetch,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentSummaryEventCopyWith<$Res> {
  factory $PaymentSummaryEventCopyWith(
          PaymentSummaryEvent value, $Res Function(PaymentSummaryEvent) then) =
      _$PaymentSummaryEventCopyWithImpl<$Res, PaymentSummaryEvent>;
}

/// @nodoc
class _$PaymentSummaryEventCopyWithImpl<$Res, $Val extends PaymentSummaryEvent>
    implements $PaymentSummaryEventCopyWith<$Res> {
  _$PaymentSummaryEventCopyWithImpl(this._value, this._then);

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
  $Res call(
      {CustomerCodeInfo customerCodeInfo, SalesOrganisation salesOrganization});

  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $SalesOrganisationCopyWith<$Res> get salesOrganization;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$PaymentSummaryEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeInfo = null,
    Object? salesOrganization = null,
  }) {
    return _then(_$InitializedImpl(
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganization {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganization, (value) {
      return _then(_value.copyWith(salesOrganization: value));
    });
  }
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl(
      {required this.customerCodeInfo, required this.salesOrganization});

  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final SalesOrganisation salesOrganization;

  @override
  String toString() {
    return 'PaymentSummaryEvent.initialized(customerCodeInfo: $customerCodeInfo, salesOrganization: $salesOrganization)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializedImpl &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.salesOrganization, salesOrganization) ||
                other.salesOrganization == salesOrganization));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, customerCodeInfo, salesOrganization);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      __$$InitializedImplCopyWithImpl<_$InitializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)
        initialized,
    required TResult Function(PaymentSummaryFilter appliedFilter) fetch,
    required TResult Function() loadMore,
  }) {
    return initialized(customerCodeInfo, salesOrganization);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult? Function(PaymentSummaryFilter appliedFilter)? fetch,
    TResult? Function()? loadMore,
  }) {
    return initialized?.call(customerCodeInfo, salesOrganization);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult Function(PaymentSummaryFilter appliedFilter)? fetch,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(customerCodeInfo, salesOrganization);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements PaymentSummaryEvent {
  const factory _Initialized(
      {required final CustomerCodeInfo customerCodeInfo,
      required final SalesOrganisation salesOrganization}) = _$InitializedImpl;

  CustomerCodeInfo get customerCodeInfo;
  SalesOrganisation get salesOrganization;
  @JsonKey(ignore: true)
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentSummaryFilter appliedFilter});

  $PaymentSummaryFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$PaymentSummaryEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appliedFilter = null,
  }) {
    return _then(_$FetchImpl(
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as PaymentSummaryFilter,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentSummaryFilterCopyWith<$Res> get appliedFilter {
    return $PaymentSummaryFilterCopyWith<$Res>(_value.appliedFilter, (value) {
      return _then(_value.copyWith(appliedFilter: value));
    });
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl({required this.appliedFilter});

  @override
  final PaymentSummaryFilter appliedFilter;

  @override
  String toString() {
    return 'PaymentSummaryEvent.fetch(appliedFilter: $appliedFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.appliedFilter, appliedFilter) ||
                other.appliedFilter == appliedFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appliedFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)
        initialized,
    required TResult Function(PaymentSummaryFilter appliedFilter) fetch,
    required TResult Function() loadMore,
  }) {
    return fetch(appliedFilter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult? Function(PaymentSummaryFilter appliedFilter)? fetch,
    TResult? Function()? loadMore,
  }) {
    return fetch?.call(appliedFilter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult Function(PaymentSummaryFilter appliedFilter)? fetch,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(appliedFilter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements PaymentSummaryEvent {
  const factory _Fetch({required final PaymentSummaryFilter appliedFilter}) =
      _$FetchImpl;

  PaymentSummaryFilter get appliedFilter;
  @JsonKey(ignore: true)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreImplCopyWith<$Res> {
  factory _$$LoadMoreImplCopyWith(
          _$LoadMoreImpl value, $Res Function(_$LoadMoreImpl) then) =
      __$$LoadMoreImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreImplCopyWithImpl<$Res>
    extends _$PaymentSummaryEventCopyWithImpl<$Res, _$LoadMoreImpl>
    implements _$$LoadMoreImplCopyWith<$Res> {
  __$$LoadMoreImplCopyWithImpl(
      _$LoadMoreImpl _value, $Res Function(_$LoadMoreImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadMoreImpl implements _LoadMore {
  const _$LoadMoreImpl();

  @override
  String toString() {
    return 'PaymentSummaryEvent.loadMore()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadMoreImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)
        initialized,
    required TResult Function(PaymentSummaryFilter appliedFilter) fetch,
    required TResult Function() loadMore,
  }) {
    return loadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult? Function(PaymentSummaryFilter appliedFilter)? fetch,
    TResult? Function()? loadMore,
  }) {
    return loadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganization)?
        initialized,
    TResult Function(PaymentSummaryFilter appliedFilter)? fetch,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements PaymentSummaryEvent {
  const factory _LoadMore() = _$LoadMoreImpl;
}

/// @nodoc
mixin _$PaymentSummaryState {
  SalesOrganisation get salesOrganization => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  List<PaymentSummaryDetails> get details => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  PaymentSummaryFilter get appliedFilter => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentSummaryStateCopyWith<PaymentSummaryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentSummaryStateCopyWith<$Res> {
  factory $PaymentSummaryStateCopyWith(
          PaymentSummaryState value, $Res Function(PaymentSummaryState) then) =
      _$PaymentSummaryStateCopyWithImpl<$Res, PaymentSummaryState>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganization,
      CustomerCodeInfo customerCodeInfo,
      List<PaymentSummaryDetails> details,
      bool isFetching,
      bool canLoadMore,
      PaymentSummaryFilter appliedFilter,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});

  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $PaymentSummaryFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class _$PaymentSummaryStateCopyWithImpl<$Res, $Val extends PaymentSummaryState>
    implements $PaymentSummaryStateCopyWith<$Res> {
  _$PaymentSummaryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganization = null,
    Object? customerCodeInfo = null,
    Object? details = null,
    Object? isFetching = null,
    Object? canLoadMore = null,
    Object? appliedFilter = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as List<PaymentSummaryDetails>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as PaymentSummaryFilter,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganization {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganization, (value) {
      return _then(_value.copyWith(salesOrganization: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentSummaryFilterCopyWith<$Res> get appliedFilter {
    return $PaymentSummaryFilterCopyWith<$Res>(_value.appliedFilter, (value) {
      return _then(_value.copyWith(appliedFilter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentSummaryStateImplCopyWith<$Res>
    implements $PaymentSummaryStateCopyWith<$Res> {
  factory _$$PaymentSummaryStateImplCopyWith(_$PaymentSummaryStateImpl value,
          $Res Function(_$PaymentSummaryStateImpl) then) =
      __$$PaymentSummaryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SalesOrganisation salesOrganization,
      CustomerCodeInfo customerCodeInfo,
      List<PaymentSummaryDetails> details,
      bool isFetching,
      bool canLoadMore,
      PaymentSummaryFilter appliedFilter,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $PaymentSummaryFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class __$$PaymentSummaryStateImplCopyWithImpl<$Res>
    extends _$PaymentSummaryStateCopyWithImpl<$Res, _$PaymentSummaryStateImpl>
    implements _$$PaymentSummaryStateImplCopyWith<$Res> {
  __$$PaymentSummaryStateImplCopyWithImpl(_$PaymentSummaryStateImpl _value,
      $Res Function(_$PaymentSummaryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganization = null,
    Object? customerCodeInfo = null,
    Object? details = null,
    Object? isFetching = null,
    Object? canLoadMore = null,
    Object? appliedFilter = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_$PaymentSummaryStateImpl(
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<PaymentSummaryDetails>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as PaymentSummaryFilter,
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
      {required this.salesOrganization,
      required this.customerCodeInfo,
      required final List<PaymentSummaryDetails> details,
      required this.isFetching,
      required this.canLoadMore,
      required this.appliedFilter,
      required this.failureOrSuccessOption})
      : _details = details,
        super._();

  @override
  final SalesOrganisation salesOrganization;
  @override
  final CustomerCodeInfo customerCodeInfo;
  final List<PaymentSummaryDetails> _details;
  @override
  List<PaymentSummaryDetails> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  final bool isFetching;
  @override
  final bool canLoadMore;
  @override
  final PaymentSummaryFilter appliedFilter;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;

  @override
  String toString() {
    return 'PaymentSummaryState(salesOrganization: $salesOrganization, customerCodeInfo: $customerCodeInfo, details: $details, isFetching: $isFetching, canLoadMore: $canLoadMore, appliedFilter: $appliedFilter, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentSummaryStateImpl &&
            (identical(other.salesOrganization, salesOrganization) ||
                other.salesOrganization == salesOrganization) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            const DeepCollectionEquality().equals(other._details, _details) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.appliedFilter, appliedFilter) ||
                other.appliedFilter == appliedFilter) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      salesOrganization,
      customerCodeInfo,
      const DeepCollectionEquality().hash(_details),
      isFetching,
      canLoadMore,
      appliedFilter,
      failureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentSummaryStateImplCopyWith<_$PaymentSummaryStateImpl> get copyWith =>
      __$$PaymentSummaryStateImplCopyWithImpl<_$PaymentSummaryStateImpl>(
          this, _$identity);
}

abstract class _PaymentSummaryState extends PaymentSummaryState {
  const factory _PaymentSummaryState(
      {required final SalesOrganisation salesOrganization,
      required final CustomerCodeInfo customerCodeInfo,
      required final List<PaymentSummaryDetails> details,
      required final bool isFetching,
      required final bool canLoadMore,
      required final PaymentSummaryFilter appliedFilter,
      required final Option<Either<ApiFailure, dynamic>>
          failureOrSuccessOption}) = _$PaymentSummaryStateImpl;
  const _PaymentSummaryState._() : super._();

  @override
  SalesOrganisation get salesOrganization;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  List<PaymentSummaryDetails> get details;
  @override
  bool get isFetching;
  @override
  bool get canLoadMore;
  @override
  PaymentSummaryFilter get appliedFilter;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$PaymentSummaryStateImplCopyWith<_$PaymentSummaryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

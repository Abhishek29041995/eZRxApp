// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'available_credits_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AvailableCreditsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function(AvailableCreditFilter appliedFilter,
            SearchKey searchKey, bool isMarketPlace)
        fetch,
    required TResult Function(bool isMarketPlace) loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(AvailableCreditFilter appliedFilter, SearchKey searchKey,
            bool isMarketPlace)?
        fetch,
    TResult? Function(bool isMarketPlace)? loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(AvailableCreditFilter appliedFilter, SearchKey searchKey,
            bool isMarketPlace)?
        fetch,
    TResult Function(bool isMarketPlace)? loadMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableCreditsEventCopyWith<$Res> {
  factory $AvailableCreditsEventCopyWith(AvailableCreditsEvent value,
          $Res Function(AvailableCreditsEvent) then) =
      _$AvailableCreditsEventCopyWithImpl<$Res, AvailableCreditsEvent>;
}

/// @nodoc
class _$AvailableCreditsEventCopyWithImpl<$Res,
        $Val extends AvailableCreditsEvent>
    implements $AvailableCreditsEventCopyWith<$Res> {
  _$AvailableCreditsEventCopyWithImpl(this._value, this._then);

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
  @useResult
  $Res call(
      {SalesOrganisation salesOrganization, CustomerCodeInfo customerCodeInfo});

  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$initializedImplCopyWithImpl<$Res>
    extends _$AvailableCreditsEventCopyWithImpl<$Res, _$initializedImpl>
    implements _$$initializedImplCopyWith<$Res> {
  __$$initializedImplCopyWithImpl(
      _$initializedImpl _value, $Res Function(_$initializedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganization = null,
    Object? customerCodeInfo = null,
  }) {
    return _then(_$initializedImpl(
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

class _$initializedImpl implements _initialized {
  const _$initializedImpl(
      {required this.salesOrganization, required this.customerCodeInfo});

  @override
  final SalesOrganisation salesOrganization;
  @override
  final CustomerCodeInfo customerCodeInfo;

  @override
  String toString() {
    return 'AvailableCreditsEvent.initialized(salesOrganization: $salesOrganization, customerCodeInfo: $customerCodeInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$initializedImpl &&
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
  _$$initializedImplCopyWith<_$initializedImpl> get copyWith =>
      __$$initializedImplCopyWithImpl<_$initializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function(AvailableCreditFilter appliedFilter,
            SearchKey searchKey, bool isMarketPlace)
        fetch,
    required TResult Function(bool isMarketPlace) loadMore,
  }) {
    return initialized(salesOrganization, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(AvailableCreditFilter appliedFilter, SearchKey searchKey,
            bool isMarketPlace)?
        fetch,
    TResult? Function(bool isMarketPlace)? loadMore,
  }) {
    return initialized?.call(salesOrganization, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(AvailableCreditFilter appliedFilter, SearchKey searchKey,
            bool isMarketPlace)?
        fetch,
    TResult Function(bool isMarketPlace)? loadMore,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(salesOrganization, customerCodeInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
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

abstract class _initialized implements AvailableCreditsEvent {
  const factory _initialized(
      {required final SalesOrganisation salesOrganization,
      required final CustomerCodeInfo customerCodeInfo}) = _$initializedImpl;

  SalesOrganisation get salesOrganization;
  CustomerCodeInfo get customerCodeInfo;
  @JsonKey(ignore: true)
  _$$initializedImplCopyWith<_$initializedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {AvailableCreditFilter appliedFilter,
      SearchKey searchKey,
      bool isMarketPlace});

  $AvailableCreditFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$AvailableCreditsEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appliedFilter = null,
    Object? searchKey = null,
    Object? isMarketPlace = null,
  }) {
    return _then(_$FetchImpl(
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as AvailableCreditFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AvailableCreditFilterCopyWith<$Res> get appliedFilter {
    return $AvailableCreditFilterCopyWith<$Res>(_value.appliedFilter, (value) {
      return _then(_value.copyWith(appliedFilter: value));
    });
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl(
      {required this.appliedFilter,
      required this.searchKey,
      required this.isMarketPlace});

  @override
  final AvailableCreditFilter appliedFilter;
  @override
  final SearchKey searchKey;
  @override
  final bool isMarketPlace;

  @override
  String toString() {
    return 'AvailableCreditsEvent.fetch(appliedFilter: $appliedFilter, searchKey: $searchKey, isMarketPlace: $isMarketPlace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.appliedFilter, appliedFilter) ||
                other.appliedFilter == appliedFilter) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            (identical(other.isMarketPlace, isMarketPlace) ||
                other.isMarketPlace == isMarketPlace));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, appliedFilter, searchKey, isMarketPlace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function(AvailableCreditFilter appliedFilter,
            SearchKey searchKey, bool isMarketPlace)
        fetch,
    required TResult Function(bool isMarketPlace) loadMore,
  }) {
    return fetch(appliedFilter, searchKey, isMarketPlace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(AvailableCreditFilter appliedFilter, SearchKey searchKey,
            bool isMarketPlace)?
        fetch,
    TResult? Function(bool isMarketPlace)? loadMore,
  }) {
    return fetch?.call(appliedFilter, searchKey, isMarketPlace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(AvailableCreditFilter appliedFilter, SearchKey searchKey,
            bool isMarketPlace)?
        fetch,
    TResult Function(bool isMarketPlace)? loadMore,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(appliedFilter, searchKey, isMarketPlace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
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

abstract class _Fetch implements AvailableCreditsEvent {
  const factory _Fetch(
      {required final AvailableCreditFilter appliedFilter,
      required final SearchKey searchKey,
      required final bool isMarketPlace}) = _$FetchImpl;

  AvailableCreditFilter get appliedFilter;
  SearchKey get searchKey;
  bool get isMarketPlace;
  @JsonKey(ignore: true)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreImplCopyWith<$Res> {
  factory _$$LoadMoreImplCopyWith(
          _$LoadMoreImpl value, $Res Function(_$LoadMoreImpl) then) =
      __$$LoadMoreImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isMarketPlace});
}

/// @nodoc
class __$$LoadMoreImplCopyWithImpl<$Res>
    extends _$AvailableCreditsEventCopyWithImpl<$Res, _$LoadMoreImpl>
    implements _$$LoadMoreImplCopyWith<$Res> {
  __$$LoadMoreImplCopyWithImpl(
      _$LoadMoreImpl _value, $Res Function(_$LoadMoreImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isMarketPlace = null,
  }) {
    return _then(_$LoadMoreImpl(
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadMoreImpl implements _LoadMore {
  const _$LoadMoreImpl({required this.isMarketPlace});

  @override
  final bool isMarketPlace;

  @override
  String toString() {
    return 'AvailableCreditsEvent.loadMore(isMarketPlace: $isMarketPlace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMoreImpl &&
            (identical(other.isMarketPlace, isMarketPlace) ||
                other.isMarketPlace == isMarketPlace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isMarketPlace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadMoreImplCopyWith<_$LoadMoreImpl> get copyWith =>
      __$$LoadMoreImplCopyWithImpl<_$LoadMoreImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function(AvailableCreditFilter appliedFilter,
            SearchKey searchKey, bool isMarketPlace)
        fetch,
    required TResult Function(bool isMarketPlace) loadMore,
  }) {
    return loadMore(isMarketPlace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(AvailableCreditFilter appliedFilter, SearchKey searchKey,
            bool isMarketPlace)?
        fetch,
    TResult? Function(bool isMarketPlace)? loadMore,
  }) {
    return loadMore?.call(isMarketPlace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(AvailableCreditFilter appliedFilter, SearchKey searchKey,
            bool isMarketPlace)?
        fetch,
    TResult Function(bool isMarketPlace)? loadMore,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(isMarketPlace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
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

abstract class _LoadMore implements AvailableCreditsEvent {
  const factory _LoadMore({required final bool isMarketPlace}) = _$LoadMoreImpl;

  bool get isMarketPlace;
  @JsonKey(ignore: true)
  _$$LoadMoreImplCopyWith<_$LoadMoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AvailableCreditsState {
  List<CustomerOpenItem> get items => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganization => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  AvailableCreditFilter get appliedFilter => throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AvailableCreditsStateCopyWith<AvailableCreditsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvailableCreditsStateCopyWith<$Res> {
  factory $AvailableCreditsStateCopyWith(AvailableCreditsState value,
          $Res Function(AvailableCreditsState) then) =
      _$AvailableCreditsStateCopyWithImpl<$Res, AvailableCreditsState>;
  @useResult
  $Res call(
      {List<CustomerOpenItem> items,
      SalesOrganisation salesOrganization,
      CustomerCodeInfo customerCodeInfo,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isLoading,
      bool canLoadMore,
      AvailableCreditFilter appliedFilter,
      SearchKey searchKey});

  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $AvailableCreditFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class _$AvailableCreditsStateCopyWithImpl<$Res,
        $Val extends AvailableCreditsState>
    implements $AvailableCreditsStateCopyWith<$Res> {
  _$AvailableCreditsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? salesOrganization = null,
    Object? customerCodeInfo = null,
    Object? failureOrSuccessOption = null,
    Object? isLoading = null,
    Object? canLoadMore = null,
    Object? appliedFilter = null,
    Object? searchKey = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CustomerOpenItem>,
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as AvailableCreditFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
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
  $AvailableCreditFilterCopyWith<$Res> get appliedFilter {
    return $AvailableCreditFilterCopyWith<$Res>(_value.appliedFilter, (value) {
      return _then(_value.copyWith(appliedFilter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AvailableCreditsStateImplCopyWith<$Res>
    implements $AvailableCreditsStateCopyWith<$Res> {
  factory _$$AvailableCreditsStateImplCopyWith(
          _$AvailableCreditsStateImpl value,
          $Res Function(_$AvailableCreditsStateImpl) then) =
      __$$AvailableCreditsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CustomerOpenItem> items,
      SalesOrganisation salesOrganization,
      CustomerCodeInfo customerCodeInfo,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isLoading,
      bool canLoadMore,
      AvailableCreditFilter appliedFilter,
      SearchKey searchKey});

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $AvailableCreditFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class __$$AvailableCreditsStateImplCopyWithImpl<$Res>
    extends _$AvailableCreditsStateCopyWithImpl<$Res,
        _$AvailableCreditsStateImpl>
    implements _$$AvailableCreditsStateImplCopyWith<$Res> {
  __$$AvailableCreditsStateImplCopyWithImpl(_$AvailableCreditsStateImpl _value,
      $Res Function(_$AvailableCreditsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? salesOrganization = null,
    Object? customerCodeInfo = null,
    Object? failureOrSuccessOption = null,
    Object? isLoading = null,
    Object? canLoadMore = null,
    Object? appliedFilter = null,
    Object? searchKey = null,
  }) {
    return _then(_$AvailableCreditsStateImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CustomerOpenItem>,
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as AvailableCreditFilter,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }
}

/// @nodoc

class _$AvailableCreditsStateImpl extends _AvailableCreditsState {
  const _$AvailableCreditsStateImpl(
      {required final List<CustomerOpenItem> items,
      required this.salesOrganization,
      required this.customerCodeInfo,
      required this.failureOrSuccessOption,
      required this.isLoading,
      required this.canLoadMore,
      required this.appliedFilter,
      required this.searchKey})
      : _items = items,
        super._();

  final List<CustomerOpenItem> _items;
  @override
  List<CustomerOpenItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final SalesOrganisation salesOrganization;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  @override
  final bool isLoading;
  @override
  final bool canLoadMore;
  @override
  final AvailableCreditFilter appliedFilter;
  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'AvailableCreditsState(items: $items, salesOrganization: $salesOrganization, customerCodeInfo: $customerCodeInfo, failureOrSuccessOption: $failureOrSuccessOption, isLoading: $isLoading, canLoadMore: $canLoadMore, appliedFilter: $appliedFilter, searchKey: $searchKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvailableCreditsStateImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.salesOrganization, salesOrganization) ||
                other.salesOrganization == salesOrganization) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.appliedFilter, appliedFilter) ||
                other.appliedFilter == appliedFilter) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      salesOrganization,
      customerCodeInfo,
      failureOrSuccessOption,
      isLoading,
      canLoadMore,
      appliedFilter,
      searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AvailableCreditsStateImplCopyWith<_$AvailableCreditsStateImpl>
      get copyWith => __$$AvailableCreditsStateImplCopyWithImpl<
          _$AvailableCreditsStateImpl>(this, _$identity);
}

abstract class _AvailableCreditsState extends AvailableCreditsState {
  const factory _AvailableCreditsState(
      {required final List<CustomerOpenItem> items,
      required final SalesOrganisation salesOrganization,
      required final CustomerCodeInfo customerCodeInfo,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final bool isLoading,
      required final bool canLoadMore,
      required final AvailableCreditFilter appliedFilter,
      required final SearchKey searchKey}) = _$AvailableCreditsStateImpl;
  const _AvailableCreditsState._() : super._();

  @override
  List<CustomerOpenItem> get items;
  @override
  SalesOrganisation get salesOrganization;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  bool get isLoading;
  @override
  bool get canLoadMore;
  @override
  AvailableCreditFilter get appliedFilter;
  @override
  SearchKey get searchKey;
  @override
  @JsonKey(ignore: true)
  _$$AvailableCreditsStateImplCopyWith<_$AvailableCreditsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

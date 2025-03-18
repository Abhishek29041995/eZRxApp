// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_code_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomerCodeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)
        initialized,
    required TResult Function(SearchKey searchValue) fetch,
    required TResult Function() loadMore,
    required TResult Function(CustomerCodeInfo customerCodeInfo)
        fetchCustomerCodeConfig,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)?
        initialized,
    TResult? Function(SearchKey searchValue)? fetch,
    TResult? Function()? loadMore,
    TResult? Function(CustomerCodeInfo customerCodeInfo)?
        fetchCustomerCodeConfig,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)?
        initialized,
    TResult Function(SearchKey searchValue)? fetch,
    TResult Function()? loadMore,
    TResult Function(CustomerCodeInfo customerCodeInfo)?
        fetchCustomerCodeConfig,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FetchCustomerCodeConfig value)
        fetchCustomerCodeConfig,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FetchCustomerCodeConfig value)? fetchCustomerCodeConfig,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FetchCustomerCodeConfig value)? fetchCustomerCodeConfig,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCodeEventCopyWith<$Res> {
  factory $CustomerCodeEventCopyWith(
          CustomerCodeEvent value, $Res Function(CustomerCodeEvent) then) =
      _$CustomerCodeEventCopyWithImpl<$Res, CustomerCodeEvent>;
}

/// @nodoc
class _$CustomerCodeEventCopyWithImpl<$Res, $Val extends CustomerCodeEvent>
    implements $CustomerCodeEventCopyWith<$Res> {
  _$CustomerCodeEventCopyWithImpl(this._value, this._then);

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
      {bool hideCustomer, User userInfo, SalesOrganisation selectedSalesOrg});

  $UserCopyWith<$Res> get userInfo;
  $SalesOrganisationCopyWith<$Res> get selectedSalesOrg;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$CustomerCodeEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hideCustomer = null,
    Object? userInfo = null,
    Object? selectedSalesOrg = null,
  }) {
    return _then(_$InitializedImpl(
      hideCustomer: null == hideCustomer
          ? _value.hideCustomer
          : hideCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as User,
      selectedSalesOrg: null == selectedSalesOrg
          ? _value.selectedSalesOrg
          : selectedSalesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get userInfo {
    return $UserCopyWith<$Res>(_value.userInfo, (value) {
      return _then(_value.copyWith(userInfo: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get selectedSalesOrg {
    return $SalesOrganisationCopyWith<$Res>(_value.selectedSalesOrg, (value) {
      return _then(_value.copyWith(selectedSalesOrg: value));
    });
  }
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl(
      {required this.hideCustomer,
      required this.userInfo,
      required this.selectedSalesOrg});

  @override
  final bool hideCustomer;
  @override
  final User userInfo;
  @override
  final SalesOrganisation selectedSalesOrg;

  @override
  String toString() {
    return 'CustomerCodeEvent.initialized(hideCustomer: $hideCustomer, userInfo: $userInfo, selectedSalesOrg: $selectedSalesOrg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializedImpl &&
            (identical(other.hideCustomer, hideCustomer) ||
                other.hideCustomer == hideCustomer) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            (identical(other.selectedSalesOrg, selectedSalesOrg) ||
                other.selectedSalesOrg == selectedSalesOrg));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, hideCustomer, userInfo, selectedSalesOrg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      __$$InitializedImplCopyWithImpl<_$InitializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)
        initialized,
    required TResult Function(SearchKey searchValue) fetch,
    required TResult Function() loadMore,
    required TResult Function(CustomerCodeInfo customerCodeInfo)
        fetchCustomerCodeConfig,
  }) {
    return initialized(hideCustomer, userInfo, selectedSalesOrg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)?
        initialized,
    TResult? Function(SearchKey searchValue)? fetch,
    TResult? Function()? loadMore,
    TResult? Function(CustomerCodeInfo customerCodeInfo)?
        fetchCustomerCodeConfig,
  }) {
    return initialized?.call(hideCustomer, userInfo, selectedSalesOrg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)?
        initialized,
    TResult Function(SearchKey searchValue)? fetch,
    TResult Function()? loadMore,
    TResult Function(CustomerCodeInfo customerCodeInfo)?
        fetchCustomerCodeConfig,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(hideCustomer, userInfo, selectedSalesOrg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FetchCustomerCodeConfig value)
        fetchCustomerCodeConfig,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FetchCustomerCodeConfig value)? fetchCustomerCodeConfig,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FetchCustomerCodeConfig value)? fetchCustomerCodeConfig,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements CustomerCodeEvent {
  const factory _Initialized(
      {required final bool hideCustomer,
      required final User userInfo,
      required final SalesOrganisation selectedSalesOrg}) = _$InitializedImpl;

  bool get hideCustomer;
  User get userInfo;
  SalesOrganisation get selectedSalesOrg;
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
  $Res call({SearchKey searchValue});
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$CustomerCodeEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchValue = null,
  }) {
    return _then(_$FetchImpl(
      searchValue: null == searchValue
          ? _value.searchValue
          : searchValue // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl({required this.searchValue});

  @override
  final SearchKey searchValue;

  @override
  String toString() {
    return 'CustomerCodeEvent.fetch(searchValue: $searchValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.searchValue, searchValue) ||
                other.searchValue == searchValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)
        initialized,
    required TResult Function(SearchKey searchValue) fetch,
    required TResult Function() loadMore,
    required TResult Function(CustomerCodeInfo customerCodeInfo)
        fetchCustomerCodeConfig,
  }) {
    return fetch(searchValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)?
        initialized,
    TResult? Function(SearchKey searchValue)? fetch,
    TResult? Function()? loadMore,
    TResult? Function(CustomerCodeInfo customerCodeInfo)?
        fetchCustomerCodeConfig,
  }) {
    return fetch?.call(searchValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)?
        initialized,
    TResult Function(SearchKey searchValue)? fetch,
    TResult Function()? loadMore,
    TResult Function(CustomerCodeInfo customerCodeInfo)?
        fetchCustomerCodeConfig,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(searchValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FetchCustomerCodeConfig value)
        fetchCustomerCodeConfig,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FetchCustomerCodeConfig value)? fetchCustomerCodeConfig,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FetchCustomerCodeConfig value)? fetchCustomerCodeConfig,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements CustomerCodeEvent {
  const factory _Fetch({required final SearchKey searchValue}) = _$FetchImpl;

  SearchKey get searchValue;
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
    extends _$CustomerCodeEventCopyWithImpl<$Res, _$LoadMoreImpl>
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
    return 'CustomerCodeEvent.loadMore()';
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
    required TResult Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)
        initialized,
    required TResult Function(SearchKey searchValue) fetch,
    required TResult Function() loadMore,
    required TResult Function(CustomerCodeInfo customerCodeInfo)
        fetchCustomerCodeConfig,
  }) {
    return loadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)?
        initialized,
    TResult? Function(SearchKey searchValue)? fetch,
    TResult? Function()? loadMore,
    TResult? Function(CustomerCodeInfo customerCodeInfo)?
        fetchCustomerCodeConfig,
  }) {
    return loadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)?
        initialized,
    TResult Function(SearchKey searchValue)? fetch,
    TResult Function()? loadMore,
    TResult Function(CustomerCodeInfo customerCodeInfo)?
        fetchCustomerCodeConfig,
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
    required TResult Function(_FetchCustomerCodeConfig value)
        fetchCustomerCodeConfig,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FetchCustomerCodeConfig value)? fetchCustomerCodeConfig,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FetchCustomerCodeConfig value)? fetchCustomerCodeConfig,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements CustomerCodeEvent {
  const factory _LoadMore() = _$LoadMoreImpl;
}

/// @nodoc
abstract class _$$FetchCustomerCodeConfigImplCopyWith<$Res> {
  factory _$$FetchCustomerCodeConfigImplCopyWith(
          _$FetchCustomerCodeConfigImpl value,
          $Res Function(_$FetchCustomerCodeConfigImpl) then) =
      __$$FetchCustomerCodeConfigImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CustomerCodeInfo customerCodeInfo});

  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$FetchCustomerCodeConfigImplCopyWithImpl<$Res>
    extends _$CustomerCodeEventCopyWithImpl<$Res, _$FetchCustomerCodeConfigImpl>
    implements _$$FetchCustomerCodeConfigImplCopyWith<$Res> {
  __$$FetchCustomerCodeConfigImplCopyWithImpl(
      _$FetchCustomerCodeConfigImpl _value,
      $Res Function(_$FetchCustomerCodeConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeInfo = null,
  }) {
    return _then(_$FetchCustomerCodeConfigImpl(
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

class _$FetchCustomerCodeConfigImpl implements _FetchCustomerCodeConfig {
  const _$FetchCustomerCodeConfigImpl({required this.customerCodeInfo});

  @override
  final CustomerCodeInfo customerCodeInfo;

  @override
  String toString() {
    return 'CustomerCodeEvent.fetchCustomerCodeConfig(customerCodeInfo: $customerCodeInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchCustomerCodeConfigImpl &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerCodeInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchCustomerCodeConfigImplCopyWith<_$FetchCustomerCodeConfigImpl>
      get copyWith => __$$FetchCustomerCodeConfigImplCopyWithImpl<
          _$FetchCustomerCodeConfigImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)
        initialized,
    required TResult Function(SearchKey searchValue) fetch,
    required TResult Function() loadMore,
    required TResult Function(CustomerCodeInfo customerCodeInfo)
        fetchCustomerCodeConfig,
  }) {
    return fetchCustomerCodeConfig(customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)?
        initialized,
    TResult? Function(SearchKey searchValue)? fetch,
    TResult? Function()? loadMore,
    TResult? Function(CustomerCodeInfo customerCodeInfo)?
        fetchCustomerCodeConfig,
  }) {
    return fetchCustomerCodeConfig?.call(customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hideCustomer, User userInfo,
            SalesOrganisation selectedSalesOrg)?
        initialized,
    TResult Function(SearchKey searchValue)? fetch,
    TResult Function()? loadMore,
    TResult Function(CustomerCodeInfo customerCodeInfo)?
        fetchCustomerCodeConfig,
    required TResult orElse(),
  }) {
    if (fetchCustomerCodeConfig != null) {
      return fetchCustomerCodeConfig(customerCodeInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FetchCustomerCodeConfig value)
        fetchCustomerCodeConfig,
  }) {
    return fetchCustomerCodeConfig(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FetchCustomerCodeConfig value)? fetchCustomerCodeConfig,
  }) {
    return fetchCustomerCodeConfig?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FetchCustomerCodeConfig value)? fetchCustomerCodeConfig,
    required TResult orElse(),
  }) {
    if (fetchCustomerCodeConfig != null) {
      return fetchCustomerCodeConfig(this);
    }
    return orElse();
  }
}

abstract class _FetchCustomerCodeConfig implements CustomerCodeEvent {
  const factory _FetchCustomerCodeConfig(
          {required final CustomerCodeInfo customerCodeInfo}) =
      _$FetchCustomerCodeConfigImpl;

  CustomerCodeInfo get customerCodeInfo;
  @JsonKey(ignore: true)
  _$$FetchCustomerCodeConfigImplCopyWith<_$FetchCustomerCodeConfigImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CustomerCodeState {
  bool get hideCustomer => throw _privateConstructorUsedError;
  User get userInfo => throw _privateConstructorUsedError;
  SalesOrganisation get selectedSalesOrg => throw _privateConstructorUsedError;
  List<CustomerCodeInfo> get customerCodeList =>
      throw _privateConstructorUsedError;
  CustomerCodeConfig get customerCodeConfig =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get configFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerCodeStateCopyWith<CustomerCodeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCodeStateCopyWith<$Res> {
  factory $CustomerCodeStateCopyWith(
          CustomerCodeState value, $Res Function(CustomerCodeState) then) =
      _$CustomerCodeStateCopyWithImpl<$Res, CustomerCodeState>;
  @useResult
  $Res call(
      {bool hideCustomer,
      User userInfo,
      SalesOrganisation selectedSalesOrg,
      List<CustomerCodeInfo> customerCodeList,
      CustomerCodeConfig customerCodeConfig,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      Option<Either<ApiFailure, dynamic>> configFailureOrSuccessOption,
      bool canLoadMore,
      bool isFetching,
      SearchKey searchKey});

  $UserCopyWith<$Res> get userInfo;
  $SalesOrganisationCopyWith<$Res> get selectedSalesOrg;
  $CustomerCodeConfigCopyWith<$Res> get customerCodeConfig;
}

/// @nodoc
class _$CustomerCodeStateCopyWithImpl<$Res, $Val extends CustomerCodeState>
    implements $CustomerCodeStateCopyWith<$Res> {
  _$CustomerCodeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hideCustomer = null,
    Object? userInfo = null,
    Object? selectedSalesOrg = null,
    Object? customerCodeList = null,
    Object? customerCodeConfig = null,
    Object? apiFailureOrSuccessOption = null,
    Object? configFailureOrSuccessOption = null,
    Object? canLoadMore = null,
    Object? isFetching = null,
    Object? searchKey = null,
  }) {
    return _then(_value.copyWith(
      hideCustomer: null == hideCustomer
          ? _value.hideCustomer
          : hideCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as User,
      selectedSalesOrg: null == selectedSalesOrg
          ? _value.selectedSalesOrg
          : selectedSalesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeList: null == customerCodeList
          ? _value.customerCodeList
          : customerCodeList // ignore: cast_nullable_to_non_nullable
              as List<CustomerCodeInfo>,
      customerCodeConfig: null == customerCodeConfig
          ? _value.customerCodeConfig
          : customerCodeConfig // ignore: cast_nullable_to_non_nullable
              as CustomerCodeConfig,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      configFailureOrSuccessOption: null == configFailureOrSuccessOption
          ? _value.configFailureOrSuccessOption
          : configFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get userInfo {
    return $UserCopyWith<$Res>(_value.userInfo, (value) {
      return _then(_value.copyWith(userInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get selectedSalesOrg {
    return $SalesOrganisationCopyWith<$Res>(_value.selectedSalesOrg, (value) {
      return _then(_value.copyWith(selectedSalesOrg: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeConfigCopyWith<$Res> get customerCodeConfig {
    return $CustomerCodeConfigCopyWith<$Res>(_value.customerCodeConfig,
        (value) {
      return _then(_value.copyWith(customerCodeConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomerCodeStateImplCopyWith<$Res>
    implements $CustomerCodeStateCopyWith<$Res> {
  factory _$$CustomerCodeStateImplCopyWith(_$CustomerCodeStateImpl value,
          $Res Function(_$CustomerCodeStateImpl) then) =
      __$$CustomerCodeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool hideCustomer,
      User userInfo,
      SalesOrganisation selectedSalesOrg,
      List<CustomerCodeInfo> customerCodeList,
      CustomerCodeConfig customerCodeConfig,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      Option<Either<ApiFailure, dynamic>> configFailureOrSuccessOption,
      bool canLoadMore,
      bool isFetching,
      SearchKey searchKey});

  @override
  $UserCopyWith<$Res> get userInfo;
  @override
  $SalesOrganisationCopyWith<$Res> get selectedSalesOrg;
  @override
  $CustomerCodeConfigCopyWith<$Res> get customerCodeConfig;
}

/// @nodoc
class __$$CustomerCodeStateImplCopyWithImpl<$Res>
    extends _$CustomerCodeStateCopyWithImpl<$Res, _$CustomerCodeStateImpl>
    implements _$$CustomerCodeStateImplCopyWith<$Res> {
  __$$CustomerCodeStateImplCopyWithImpl(_$CustomerCodeStateImpl _value,
      $Res Function(_$CustomerCodeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hideCustomer = null,
    Object? userInfo = null,
    Object? selectedSalesOrg = null,
    Object? customerCodeList = null,
    Object? customerCodeConfig = null,
    Object? apiFailureOrSuccessOption = null,
    Object? configFailureOrSuccessOption = null,
    Object? canLoadMore = null,
    Object? isFetching = null,
    Object? searchKey = null,
  }) {
    return _then(_$CustomerCodeStateImpl(
      hideCustomer: null == hideCustomer
          ? _value.hideCustomer
          : hideCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as User,
      selectedSalesOrg: null == selectedSalesOrg
          ? _value.selectedSalesOrg
          : selectedSalesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeList: null == customerCodeList
          ? _value._customerCodeList
          : customerCodeList // ignore: cast_nullable_to_non_nullable
              as List<CustomerCodeInfo>,
      customerCodeConfig: null == customerCodeConfig
          ? _value.customerCodeConfig
          : customerCodeConfig // ignore: cast_nullable_to_non_nullable
              as CustomerCodeConfig,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      configFailureOrSuccessOption: null == configFailureOrSuccessOption
          ? _value.configFailureOrSuccessOption
          : configFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }
}

/// @nodoc

class _$CustomerCodeStateImpl extends _CustomerCodeState {
  const _$CustomerCodeStateImpl(
      {required this.hideCustomer,
      required this.userInfo,
      required this.selectedSalesOrg,
      required final List<CustomerCodeInfo> customerCodeList,
      required this.customerCodeConfig,
      required this.apiFailureOrSuccessOption,
      required this.configFailureOrSuccessOption,
      required this.canLoadMore,
      required this.isFetching,
      required this.searchKey})
      : _customerCodeList = customerCodeList,
        super._();

  @override
  final bool hideCustomer;
  @override
  final User userInfo;
  @override
  final SalesOrganisation selectedSalesOrg;
  final List<CustomerCodeInfo> _customerCodeList;
  @override
  List<CustomerCodeInfo> get customerCodeList {
    if (_customerCodeList is EqualUnmodifiableListView)
      return _customerCodeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customerCodeList);
  }

  @override
  final CustomerCodeConfig customerCodeConfig;
  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;
  @override
  final Option<Either<ApiFailure, dynamic>> configFailureOrSuccessOption;
  @override
  final bool canLoadMore;
  @override
  final bool isFetching;
  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'CustomerCodeState(hideCustomer: $hideCustomer, userInfo: $userInfo, selectedSalesOrg: $selectedSalesOrg, customerCodeList: $customerCodeList, customerCodeConfig: $customerCodeConfig, apiFailureOrSuccessOption: $apiFailureOrSuccessOption, configFailureOrSuccessOption: $configFailureOrSuccessOption, canLoadMore: $canLoadMore, isFetching: $isFetching, searchKey: $searchKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerCodeStateImpl &&
            (identical(other.hideCustomer, hideCustomer) ||
                other.hideCustomer == hideCustomer) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            (identical(other.selectedSalesOrg, selectedSalesOrg) ||
                other.selectedSalesOrg == selectedSalesOrg) &&
            const DeepCollectionEquality()
                .equals(other._customerCodeList, _customerCodeList) &&
            (identical(other.customerCodeConfig, customerCodeConfig) ||
                other.customerCodeConfig == customerCodeConfig) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption) &&
            (identical(other.configFailureOrSuccessOption,
                    configFailureOrSuccessOption) ||
                other.configFailureOrSuccessOption ==
                    configFailureOrSuccessOption) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      hideCustomer,
      userInfo,
      selectedSalesOrg,
      const DeepCollectionEquality().hash(_customerCodeList),
      customerCodeConfig,
      apiFailureOrSuccessOption,
      configFailureOrSuccessOption,
      canLoadMore,
      isFetching,
      searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerCodeStateImplCopyWith<_$CustomerCodeStateImpl> get copyWith =>
      __$$CustomerCodeStateImplCopyWithImpl<_$CustomerCodeStateImpl>(
          this, _$identity);
}

abstract class _CustomerCodeState extends CustomerCodeState {
  const factory _CustomerCodeState(
      {required final bool hideCustomer,
      required final User userInfo,
      required final SalesOrganisation selectedSalesOrg,
      required final List<CustomerCodeInfo> customerCodeList,
      required final CustomerCodeConfig customerCodeConfig,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption,
      required final Option<Either<ApiFailure, dynamic>>
          configFailureOrSuccessOption,
      required final bool canLoadMore,
      required final bool isFetching,
      required final SearchKey searchKey}) = _$CustomerCodeStateImpl;
  const _CustomerCodeState._() : super._();

  @override
  bool get hideCustomer;
  @override
  User get userInfo;
  @override
  SalesOrganisation get selectedSalesOrg;
  @override
  List<CustomerCodeInfo> get customerCodeList;
  @override
  CustomerCodeConfig get customerCodeConfig;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  Option<Either<ApiFailure, dynamic>> get configFailureOrSuccessOption;
  @override
  bool get canLoadMore;
  @override
  bool get isFetching;
  @override
  SearchKey get searchKey;
  @override
  @JsonKey(ignore: true)
  _$$CustomerCodeStateImplCopyWith<_$CustomerCodeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

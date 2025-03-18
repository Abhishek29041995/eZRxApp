// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductSearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(
            SearchKey searchKey, MaterialFilter materialFilter)
        searchProduct,
    required TResult Function(SearchKey searchKey) saveSearchHistory,
    required TResult Function() loadMoreProductList,
    required TResult Function() clearSearch,
    required TResult Function() clearProductSearchSuggestionHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(SearchKey searchKey, MaterialFilter materialFilter)?
        searchProduct,
    TResult? Function(SearchKey searchKey)? saveSearchHistory,
    TResult? Function()? loadMoreProductList,
    TResult? Function()? clearSearch,
    TResult? Function()? clearProductSearchSuggestionHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(SearchKey searchKey, MaterialFilter materialFilter)?
        searchProduct,
    TResult Function(SearchKey searchKey)? saveSearchHistory,
    TResult Function()? loadMoreProductList,
    TResult Function()? clearSearch,
    TResult Function()? clearProductSearchSuggestionHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SearchProduct value) searchProduct,
    required TResult Function(_SaveSearchHistory value) saveSearchHistory,
    required TResult Function(_LoadMoreProductList value) loadMoreProductList,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ClearProductSearchSuggestionHistory value)
        clearProductSearchSuggestionHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SearchProduct value)? searchProduct,
    TResult? Function(_SaveSearchHistory value)? saveSearchHistory,
    TResult? Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SearchProduct value)? searchProduct,
    TResult Function(_SaveSearchHistory value)? saveSearchHistory,
    TResult Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductSearchEventCopyWith<$Res> {
  factory $ProductSearchEventCopyWith(
          ProductSearchEvent value, $Res Function(ProductSearchEvent) then) =
      _$ProductSearchEventCopyWithImpl<$Res, ProductSearchEvent>;
}

/// @nodoc
class _$ProductSearchEventCopyWithImpl<$Res, $Val extends ProductSearchEvent>
    implements $ProductSearchEventCopyWith<$Res> {
  _$ProductSearchEventCopyWithImpl(this._value, this._then);

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
      {SalesOrganisation salesOrganization,
      SalesOrganisationConfigs configs,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      User user});

  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  $SalesOrganisationConfigsCopyWith<$Res> get configs;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$ProductSearchEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganization = null,
    Object? configs = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? user = null,
  }) {
    return _then(_$InitializedImpl(
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      configs: null == configs
          ? _value.configs
          : configs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
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
  $SalesOrganisationConfigsCopyWith<$Res> get configs {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.configs, (value) {
      return _then(_value.copyWith(configs: value));
    });
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
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value));
    });
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

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl(
      {required this.salesOrganization,
      required this.configs,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.user});

  @override
  final SalesOrganisation salesOrganization;
  @override
  final SalesOrganisationConfigs configs;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final User user;

  @override
  String toString() {
    return 'ProductSearchEvent.initialized(salesOrganization: $salesOrganization, configs: $configs, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializedImpl &&
            (identical(other.salesOrganization, salesOrganization) ||
                other.salesOrganization == salesOrganization) &&
            (identical(other.configs, configs) || other.configs == configs) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrganization, configs,
      customerCodeInfo, shipToInfo, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      __$$InitializedImplCopyWithImpl<_$InitializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(
            SearchKey searchKey, MaterialFilter materialFilter)
        searchProduct,
    required TResult Function(SearchKey searchKey) saveSearchHistory,
    required TResult Function() loadMoreProductList,
    required TResult Function() clearSearch,
    required TResult Function() clearProductSearchSuggestionHistory,
  }) {
    return initialized(
        salesOrganization, configs, customerCodeInfo, shipToInfo, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(SearchKey searchKey, MaterialFilter materialFilter)?
        searchProduct,
    TResult? Function(SearchKey searchKey)? saveSearchHistory,
    TResult? Function()? loadMoreProductList,
    TResult? Function()? clearSearch,
    TResult? Function()? clearProductSearchSuggestionHistory,
  }) {
    return initialized?.call(
        salesOrganization, configs, customerCodeInfo, shipToInfo, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(SearchKey searchKey, MaterialFilter materialFilter)?
        searchProduct,
    TResult Function(SearchKey searchKey)? saveSearchHistory,
    TResult Function()? loadMoreProductList,
    TResult Function()? clearSearch,
    TResult Function()? clearProductSearchSuggestionHistory,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(
          salesOrganization, configs, customerCodeInfo, shipToInfo, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SearchProduct value) searchProduct,
    required TResult Function(_SaveSearchHistory value) saveSearchHistory,
    required TResult Function(_LoadMoreProductList value) loadMoreProductList,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ClearProductSearchSuggestionHistory value)
        clearProductSearchSuggestionHistory,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SearchProduct value)? searchProduct,
    TResult? Function(_SaveSearchHistory value)? saveSearchHistory,
    TResult? Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SearchProduct value)? searchProduct,
    TResult Function(_SaveSearchHistory value)? saveSearchHistory,
    TResult Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements ProductSearchEvent {
  const factory _Initialized(
      {required final SalesOrganisation salesOrganization,
      required final SalesOrganisationConfigs configs,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final User user}) = _$InitializedImpl;

  SalesOrganisation get salesOrganization;
  SalesOrganisationConfigs get configs;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  User get user;
  @JsonKey(ignore: true)
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchProductImplCopyWith<$Res> {
  factory _$$SearchProductImplCopyWith(
          _$SearchProductImpl value, $Res Function(_$SearchProductImpl) then) =
      __$$SearchProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SearchKey searchKey, MaterialFilter materialFilter});

  $MaterialFilterCopyWith<$Res> get materialFilter;
}

/// @nodoc
class __$$SearchProductImplCopyWithImpl<$Res>
    extends _$ProductSearchEventCopyWithImpl<$Res, _$SearchProductImpl>
    implements _$$SearchProductImplCopyWith<$Res> {
  __$$SearchProductImplCopyWithImpl(
      _$SearchProductImpl _value, $Res Function(_$SearchProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchKey = null,
    Object? materialFilter = null,
  }) {
    return _then(_$SearchProductImpl(
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      materialFilter: null == materialFilter
          ? _value.materialFilter
          : materialFilter // ignore: cast_nullable_to_non_nullable
              as MaterialFilter,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialFilterCopyWith<$Res> get materialFilter {
    return $MaterialFilterCopyWith<$Res>(_value.materialFilter, (value) {
      return _then(_value.copyWith(materialFilter: value));
    });
  }
}

/// @nodoc

class _$SearchProductImpl implements _SearchProduct {
  const _$SearchProductImpl(
      {required this.searchKey, required this.materialFilter});

  @override
  final SearchKey searchKey;
  @override
  final MaterialFilter materialFilter;

  @override
  String toString() {
    return 'ProductSearchEvent.searchProduct(searchKey: $searchKey, materialFilter: $materialFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchProductImpl &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            (identical(other.materialFilter, materialFilter) ||
                other.materialFilter == materialFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchKey, materialFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchProductImplCopyWith<_$SearchProductImpl> get copyWith =>
      __$$SearchProductImplCopyWithImpl<_$SearchProductImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(
            SearchKey searchKey, MaterialFilter materialFilter)
        searchProduct,
    required TResult Function(SearchKey searchKey) saveSearchHistory,
    required TResult Function() loadMoreProductList,
    required TResult Function() clearSearch,
    required TResult Function() clearProductSearchSuggestionHistory,
  }) {
    return searchProduct(searchKey, materialFilter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(SearchKey searchKey, MaterialFilter materialFilter)?
        searchProduct,
    TResult? Function(SearchKey searchKey)? saveSearchHistory,
    TResult? Function()? loadMoreProductList,
    TResult? Function()? clearSearch,
    TResult? Function()? clearProductSearchSuggestionHistory,
  }) {
    return searchProduct?.call(searchKey, materialFilter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(SearchKey searchKey, MaterialFilter materialFilter)?
        searchProduct,
    TResult Function(SearchKey searchKey)? saveSearchHistory,
    TResult Function()? loadMoreProductList,
    TResult Function()? clearSearch,
    TResult Function()? clearProductSearchSuggestionHistory,
    required TResult orElse(),
  }) {
    if (searchProduct != null) {
      return searchProduct(searchKey, materialFilter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SearchProduct value) searchProduct,
    required TResult Function(_SaveSearchHistory value) saveSearchHistory,
    required TResult Function(_LoadMoreProductList value) loadMoreProductList,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ClearProductSearchSuggestionHistory value)
        clearProductSearchSuggestionHistory,
  }) {
    return searchProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SearchProduct value)? searchProduct,
    TResult? Function(_SaveSearchHistory value)? saveSearchHistory,
    TResult? Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
  }) {
    return searchProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SearchProduct value)? searchProduct,
    TResult Function(_SaveSearchHistory value)? saveSearchHistory,
    TResult Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
    required TResult orElse(),
  }) {
    if (searchProduct != null) {
      return searchProduct(this);
    }
    return orElse();
  }
}

abstract class _SearchProduct implements ProductSearchEvent {
  const factory _SearchProduct(
      {required final SearchKey searchKey,
      required final MaterialFilter materialFilter}) = _$SearchProductImpl;

  SearchKey get searchKey;
  MaterialFilter get materialFilter;
  @JsonKey(ignore: true)
  _$$SearchProductImplCopyWith<_$SearchProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveSearchHistoryImplCopyWith<$Res> {
  factory _$$SaveSearchHistoryImplCopyWith(_$SaveSearchHistoryImpl value,
          $Res Function(_$SaveSearchHistoryImpl) then) =
      __$$SaveSearchHistoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SearchKey searchKey});
}

/// @nodoc
class __$$SaveSearchHistoryImplCopyWithImpl<$Res>
    extends _$ProductSearchEventCopyWithImpl<$Res, _$SaveSearchHistoryImpl>
    implements _$$SaveSearchHistoryImplCopyWith<$Res> {
  __$$SaveSearchHistoryImplCopyWithImpl(_$SaveSearchHistoryImpl _value,
      $Res Function(_$SaveSearchHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchKey = null,
  }) {
    return _then(_$SaveSearchHistoryImpl(
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }
}

/// @nodoc

class _$SaveSearchHistoryImpl implements _SaveSearchHistory {
  const _$SaveSearchHistoryImpl({required this.searchKey});

  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'ProductSearchEvent.saveSearchHistory(searchKey: $searchKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveSearchHistoryImpl &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveSearchHistoryImplCopyWith<_$SaveSearchHistoryImpl> get copyWith =>
      __$$SaveSearchHistoryImplCopyWithImpl<_$SaveSearchHistoryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(
            SearchKey searchKey, MaterialFilter materialFilter)
        searchProduct,
    required TResult Function(SearchKey searchKey) saveSearchHistory,
    required TResult Function() loadMoreProductList,
    required TResult Function() clearSearch,
    required TResult Function() clearProductSearchSuggestionHistory,
  }) {
    return saveSearchHistory(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(SearchKey searchKey, MaterialFilter materialFilter)?
        searchProduct,
    TResult? Function(SearchKey searchKey)? saveSearchHistory,
    TResult? Function()? loadMoreProductList,
    TResult? Function()? clearSearch,
    TResult? Function()? clearProductSearchSuggestionHistory,
  }) {
    return saveSearchHistory?.call(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(SearchKey searchKey, MaterialFilter materialFilter)?
        searchProduct,
    TResult Function(SearchKey searchKey)? saveSearchHistory,
    TResult Function()? loadMoreProductList,
    TResult Function()? clearSearch,
    TResult Function()? clearProductSearchSuggestionHistory,
    required TResult orElse(),
  }) {
    if (saveSearchHistory != null) {
      return saveSearchHistory(searchKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SearchProduct value) searchProduct,
    required TResult Function(_SaveSearchHistory value) saveSearchHistory,
    required TResult Function(_LoadMoreProductList value) loadMoreProductList,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ClearProductSearchSuggestionHistory value)
        clearProductSearchSuggestionHistory,
  }) {
    return saveSearchHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SearchProduct value)? searchProduct,
    TResult? Function(_SaveSearchHistory value)? saveSearchHistory,
    TResult? Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
  }) {
    return saveSearchHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SearchProduct value)? searchProduct,
    TResult Function(_SaveSearchHistory value)? saveSearchHistory,
    TResult Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
    required TResult orElse(),
  }) {
    if (saveSearchHistory != null) {
      return saveSearchHistory(this);
    }
    return orElse();
  }
}

abstract class _SaveSearchHistory implements ProductSearchEvent {
  const factory _SaveSearchHistory({required final SearchKey searchKey}) =
      _$SaveSearchHistoryImpl;

  SearchKey get searchKey;
  @JsonKey(ignore: true)
  _$$SaveSearchHistoryImplCopyWith<_$SaveSearchHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreProductListImplCopyWith<$Res> {
  factory _$$LoadMoreProductListImplCopyWith(_$LoadMoreProductListImpl value,
          $Res Function(_$LoadMoreProductListImpl) then) =
      __$$LoadMoreProductListImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreProductListImplCopyWithImpl<$Res>
    extends _$ProductSearchEventCopyWithImpl<$Res, _$LoadMoreProductListImpl>
    implements _$$LoadMoreProductListImplCopyWith<$Res> {
  __$$LoadMoreProductListImplCopyWithImpl(_$LoadMoreProductListImpl _value,
      $Res Function(_$LoadMoreProductListImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadMoreProductListImpl implements _LoadMoreProductList {
  const _$LoadMoreProductListImpl();

  @override
  String toString() {
    return 'ProductSearchEvent.loadMoreProductList()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMoreProductListImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(
            SearchKey searchKey, MaterialFilter materialFilter)
        searchProduct,
    required TResult Function(SearchKey searchKey) saveSearchHistory,
    required TResult Function() loadMoreProductList,
    required TResult Function() clearSearch,
    required TResult Function() clearProductSearchSuggestionHistory,
  }) {
    return loadMoreProductList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(SearchKey searchKey, MaterialFilter materialFilter)?
        searchProduct,
    TResult? Function(SearchKey searchKey)? saveSearchHistory,
    TResult? Function()? loadMoreProductList,
    TResult? Function()? clearSearch,
    TResult? Function()? clearProductSearchSuggestionHistory,
  }) {
    return loadMoreProductList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(SearchKey searchKey, MaterialFilter materialFilter)?
        searchProduct,
    TResult Function(SearchKey searchKey)? saveSearchHistory,
    TResult Function()? loadMoreProductList,
    TResult Function()? clearSearch,
    TResult Function()? clearProductSearchSuggestionHistory,
    required TResult orElse(),
  }) {
    if (loadMoreProductList != null) {
      return loadMoreProductList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SearchProduct value) searchProduct,
    required TResult Function(_SaveSearchHistory value) saveSearchHistory,
    required TResult Function(_LoadMoreProductList value) loadMoreProductList,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ClearProductSearchSuggestionHistory value)
        clearProductSearchSuggestionHistory,
  }) {
    return loadMoreProductList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SearchProduct value)? searchProduct,
    TResult? Function(_SaveSearchHistory value)? saveSearchHistory,
    TResult? Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
  }) {
    return loadMoreProductList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SearchProduct value)? searchProduct,
    TResult Function(_SaveSearchHistory value)? saveSearchHistory,
    TResult Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
    required TResult orElse(),
  }) {
    if (loadMoreProductList != null) {
      return loadMoreProductList(this);
    }
    return orElse();
  }
}

abstract class _LoadMoreProductList implements ProductSearchEvent {
  const factory _LoadMoreProductList() = _$LoadMoreProductListImpl;
}

/// @nodoc
abstract class _$$ClearSearchImplCopyWith<$Res> {
  factory _$$ClearSearchImplCopyWith(
          _$ClearSearchImpl value, $Res Function(_$ClearSearchImpl) then) =
      __$$ClearSearchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSearchImplCopyWithImpl<$Res>
    extends _$ProductSearchEventCopyWithImpl<$Res, _$ClearSearchImpl>
    implements _$$ClearSearchImplCopyWith<$Res> {
  __$$ClearSearchImplCopyWithImpl(
      _$ClearSearchImpl _value, $Res Function(_$ClearSearchImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearSearchImpl implements _ClearSearch {
  const _$ClearSearchImpl();

  @override
  String toString() {
    return 'ProductSearchEvent.clearSearch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearSearchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(
            SearchKey searchKey, MaterialFilter materialFilter)
        searchProduct,
    required TResult Function(SearchKey searchKey) saveSearchHistory,
    required TResult Function() loadMoreProductList,
    required TResult Function() clearSearch,
    required TResult Function() clearProductSearchSuggestionHistory,
  }) {
    return clearSearch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(SearchKey searchKey, MaterialFilter materialFilter)?
        searchProduct,
    TResult? Function(SearchKey searchKey)? saveSearchHistory,
    TResult? Function()? loadMoreProductList,
    TResult? Function()? clearSearch,
    TResult? Function()? clearProductSearchSuggestionHistory,
  }) {
    return clearSearch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(SearchKey searchKey, MaterialFilter materialFilter)?
        searchProduct,
    TResult Function(SearchKey searchKey)? saveSearchHistory,
    TResult Function()? loadMoreProductList,
    TResult Function()? clearSearch,
    TResult Function()? clearProductSearchSuggestionHistory,
    required TResult orElse(),
  }) {
    if (clearSearch != null) {
      return clearSearch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SearchProduct value) searchProduct,
    required TResult Function(_SaveSearchHistory value) saveSearchHistory,
    required TResult Function(_LoadMoreProductList value) loadMoreProductList,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ClearProductSearchSuggestionHistory value)
        clearProductSearchSuggestionHistory,
  }) {
    return clearSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SearchProduct value)? searchProduct,
    TResult? Function(_SaveSearchHistory value)? saveSearchHistory,
    TResult? Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
  }) {
    return clearSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SearchProduct value)? searchProduct,
    TResult Function(_SaveSearchHistory value)? saveSearchHistory,
    TResult Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
    required TResult orElse(),
  }) {
    if (clearSearch != null) {
      return clearSearch(this);
    }
    return orElse();
  }
}

abstract class _ClearSearch implements ProductSearchEvent {
  const factory _ClearSearch() = _$ClearSearchImpl;
}

/// @nodoc
abstract class _$$ClearProductSearchSuggestionHistoryImplCopyWith<$Res> {
  factory _$$ClearProductSearchSuggestionHistoryImplCopyWith(
          _$ClearProductSearchSuggestionHistoryImpl value,
          $Res Function(_$ClearProductSearchSuggestionHistoryImpl) then) =
      __$$ClearProductSearchSuggestionHistoryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearProductSearchSuggestionHistoryImplCopyWithImpl<$Res>
    extends _$ProductSearchEventCopyWithImpl<$Res,
        _$ClearProductSearchSuggestionHistoryImpl>
    implements _$$ClearProductSearchSuggestionHistoryImplCopyWith<$Res> {
  __$$ClearProductSearchSuggestionHistoryImplCopyWithImpl(
      _$ClearProductSearchSuggestionHistoryImpl _value,
      $Res Function(_$ClearProductSearchSuggestionHistoryImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearProductSearchSuggestionHistoryImpl
    implements _ClearProductSearchSuggestionHistory {
  const _$ClearProductSearchSuggestionHistoryImpl();

  @override
  String toString() {
    return 'ProductSearchEvent.clearProductSearchSuggestionHistory()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClearProductSearchSuggestionHistoryImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(
            SearchKey searchKey, MaterialFilter materialFilter)
        searchProduct,
    required TResult Function(SearchKey searchKey) saveSearchHistory,
    required TResult Function() loadMoreProductList,
    required TResult Function() clearSearch,
    required TResult Function() clearProductSearchSuggestionHistory,
  }) {
    return clearProductSearchSuggestionHistory();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(SearchKey searchKey, MaterialFilter materialFilter)?
        searchProduct,
    TResult? Function(SearchKey searchKey)? saveSearchHistory,
    TResult? Function()? loadMoreProductList,
    TResult? Function()? clearSearch,
    TResult? Function()? clearProductSearchSuggestionHistory,
  }) {
    return clearProductSearchSuggestionHistory?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(SearchKey searchKey, MaterialFilter materialFilter)?
        searchProduct,
    TResult Function(SearchKey searchKey)? saveSearchHistory,
    TResult Function()? loadMoreProductList,
    TResult Function()? clearSearch,
    TResult Function()? clearProductSearchSuggestionHistory,
    required TResult orElse(),
  }) {
    if (clearProductSearchSuggestionHistory != null) {
      return clearProductSearchSuggestionHistory();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SearchProduct value) searchProduct,
    required TResult Function(_SaveSearchHistory value) saveSearchHistory,
    required TResult Function(_LoadMoreProductList value) loadMoreProductList,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_ClearProductSearchSuggestionHistory value)
        clearProductSearchSuggestionHistory,
  }) {
    return clearProductSearchSuggestionHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SearchProduct value)? searchProduct,
    TResult? Function(_SaveSearchHistory value)? saveSearchHistory,
    TResult? Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
  }) {
    return clearProductSearchSuggestionHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SearchProduct value)? searchProduct,
    TResult Function(_SaveSearchHistory value)? saveSearchHistory,
    TResult Function(_LoadMoreProductList value)? loadMoreProductList,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_ClearProductSearchSuggestionHistory value)?
        clearProductSearchSuggestionHistory,
    required TResult orElse(),
  }) {
    if (clearProductSearchSuggestionHistory != null) {
      return clearProductSearchSuggestionHistory(this);
    }
    return orElse();
  }
}

abstract class _ClearProductSearchSuggestionHistory
    implements ProductSearchEvent {
  const factory _ClearProductSearchSuggestionHistory() =
      _$ClearProductSearchSuggestionHistoryImpl;
}

/// @nodoc
mixin _$ProductSearchState {
  bool get isSearching => throw _privateConstructorUsedError;
  List<MaterialInfo> get suggestedProductList =>
      throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  ProductSuggestionHistory get productSuggestionHistory =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganization => throw _privateConstructorUsedError;
  SalesOrganisationConfigs get configs => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  ShipToInfo get shipToInfo => throw _privateConstructorUsedError;
  MaterialFilter get materialFilter => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductSearchStateCopyWith<ProductSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductSearchStateCopyWith<$Res> {
  factory $ProductSearchStateCopyWith(
          ProductSearchState value, $Res Function(ProductSearchState) then) =
      _$ProductSearchStateCopyWithImpl<$Res, ProductSearchState>;
  @useResult
  $Res call(
      {bool isSearching,
      List<MaterialInfo> suggestedProductList,
      bool canLoadMore,
      ProductSuggestionHistory productSuggestionHistory,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      SearchKey searchKey,
      SalesOrganisation salesOrganization,
      SalesOrganisationConfigs configs,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      MaterialFilter materialFilter,
      User user});

  $ProductSuggestionHistoryCopyWith<$Res> get productSuggestionHistory;
  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  $SalesOrganisationConfigsCopyWith<$Res> get configs;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $MaterialFilterCopyWith<$Res> get materialFilter;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$ProductSearchStateCopyWithImpl<$Res, $Val extends ProductSearchState>
    implements $ProductSearchStateCopyWith<$Res> {
  _$ProductSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearching = null,
    Object? suggestedProductList = null,
    Object? canLoadMore = null,
    Object? productSuggestionHistory = null,
    Object? apiFailureOrSuccessOption = null,
    Object? searchKey = null,
    Object? salesOrganization = null,
    Object? configs = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? materialFilter = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      suggestedProductList: null == suggestedProductList
          ? _value.suggestedProductList
          : suggestedProductList // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      productSuggestionHistory: null == productSuggestionHistory
          ? _value.productSuggestionHistory
          : productSuggestionHistory // ignore: cast_nullable_to_non_nullable
              as ProductSuggestionHistory,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      configs: null == configs
          ? _value.configs
          : configs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      materialFilter: null == materialFilter
          ? _value.materialFilter
          : materialFilter // ignore: cast_nullable_to_non_nullable
              as MaterialFilter,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductSuggestionHistoryCopyWith<$Res> get productSuggestionHistory {
    return $ProductSuggestionHistoryCopyWith<$Res>(
        _value.productSuggestionHistory, (value) {
      return _then(_value.copyWith(productSuggestionHistory: value) as $Val);
    });
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
  $SalesOrganisationConfigsCopyWith<$Res> get configs {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.configs, (value) {
      return _then(_value.copyWith(configs: value) as $Val);
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
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialFilterCopyWith<$Res> get materialFilter {
    return $MaterialFilterCopyWith<$Res>(_value.materialFilter, (value) {
      return _then(_value.copyWith(materialFilter: value) as $Val);
    });
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
abstract class _$$ProductSearchStateImplCopyWith<$Res>
    implements $ProductSearchStateCopyWith<$Res> {
  factory _$$ProductSearchStateImplCopyWith(_$ProductSearchStateImpl value,
          $Res Function(_$ProductSearchStateImpl) then) =
      __$$ProductSearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSearching,
      List<MaterialInfo> suggestedProductList,
      bool canLoadMore,
      ProductSuggestionHistory productSuggestionHistory,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      SearchKey searchKey,
      SalesOrganisation salesOrganization,
      SalesOrganisationConfigs configs,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      MaterialFilter materialFilter,
      User user});

  @override
  $ProductSuggestionHistoryCopyWith<$Res> get productSuggestionHistory;
  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  @override
  $SalesOrganisationConfigsCopyWith<$Res> get configs;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  @override
  $MaterialFilterCopyWith<$Res> get materialFilter;
  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$ProductSearchStateImplCopyWithImpl<$Res>
    extends _$ProductSearchStateCopyWithImpl<$Res, _$ProductSearchStateImpl>
    implements _$$ProductSearchStateImplCopyWith<$Res> {
  __$$ProductSearchStateImplCopyWithImpl(_$ProductSearchStateImpl _value,
      $Res Function(_$ProductSearchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearching = null,
    Object? suggestedProductList = null,
    Object? canLoadMore = null,
    Object? productSuggestionHistory = null,
    Object? apiFailureOrSuccessOption = null,
    Object? searchKey = null,
    Object? salesOrganization = null,
    Object? configs = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? materialFilter = null,
    Object? user = null,
  }) {
    return _then(_$ProductSearchStateImpl(
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      suggestedProductList: null == suggestedProductList
          ? _value._suggestedProductList
          : suggestedProductList // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      productSuggestionHistory: null == productSuggestionHistory
          ? _value.productSuggestionHistory
          : productSuggestionHistory // ignore: cast_nullable_to_non_nullable
              as ProductSuggestionHistory,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      configs: null == configs
          ? _value.configs
          : configs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      materialFilter: null == materialFilter
          ? _value.materialFilter
          : materialFilter // ignore: cast_nullable_to_non_nullable
              as MaterialFilter,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$ProductSearchStateImpl implements _ProductSearchState {
  const _$ProductSearchStateImpl(
      {required this.isSearching,
      required final List<MaterialInfo> suggestedProductList,
      required this.canLoadMore,
      required this.productSuggestionHistory,
      required this.apiFailureOrSuccessOption,
      required this.searchKey,
      required this.salesOrganization,
      required this.configs,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.materialFilter,
      required this.user})
      : _suggestedProductList = suggestedProductList;

  @override
  final bool isSearching;
  final List<MaterialInfo> _suggestedProductList;
  @override
  List<MaterialInfo> get suggestedProductList {
    if (_suggestedProductList is EqualUnmodifiableListView)
      return _suggestedProductList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestedProductList);
  }

  @override
  final bool canLoadMore;
  @override
  final ProductSuggestionHistory productSuggestionHistory;
  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;
  @override
  final SearchKey searchKey;
  @override
  final SalesOrganisation salesOrganization;
  @override
  final SalesOrganisationConfigs configs;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final MaterialFilter materialFilter;
  @override
  final User user;

  @override
  String toString() {
    return 'ProductSearchState(isSearching: $isSearching, suggestedProductList: $suggestedProductList, canLoadMore: $canLoadMore, productSuggestionHistory: $productSuggestionHistory, apiFailureOrSuccessOption: $apiFailureOrSuccessOption, searchKey: $searchKey, salesOrganization: $salesOrganization, configs: $configs, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, materialFilter: $materialFilter, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductSearchStateImpl &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            const DeepCollectionEquality()
                .equals(other._suggestedProductList, _suggestedProductList) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(
                    other.productSuggestionHistory, productSuggestionHistory) ||
                other.productSuggestionHistory == productSuggestionHistory) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            (identical(other.salesOrganization, salesOrganization) ||
                other.salesOrganization == salesOrganization) &&
            (identical(other.configs, configs) || other.configs == configs) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.materialFilter, materialFilter) ||
                other.materialFilter == materialFilter) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isSearching,
      const DeepCollectionEquality().hash(_suggestedProductList),
      canLoadMore,
      productSuggestionHistory,
      apiFailureOrSuccessOption,
      searchKey,
      salesOrganization,
      configs,
      customerCodeInfo,
      shipToInfo,
      materialFilter,
      user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductSearchStateImplCopyWith<_$ProductSearchStateImpl> get copyWith =>
      __$$ProductSearchStateImplCopyWithImpl<_$ProductSearchStateImpl>(
          this, _$identity);
}

abstract class _ProductSearchState implements ProductSearchState {
  const factory _ProductSearchState(
      {required final bool isSearching,
      required final List<MaterialInfo> suggestedProductList,
      required final bool canLoadMore,
      required final ProductSuggestionHistory productSuggestionHistory,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption,
      required final SearchKey searchKey,
      required final SalesOrganisation salesOrganization,
      required final SalesOrganisationConfigs configs,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final MaterialFilter materialFilter,
      required final User user}) = _$ProductSearchStateImpl;

  @override
  bool get isSearching;
  @override
  List<MaterialInfo> get suggestedProductList;
  @override
  bool get canLoadMore;
  @override
  ProductSuggestionHistory get productSuggestionHistory;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  SearchKey get searchKey;
  @override
  SalesOrganisation get salesOrganization;
  @override
  SalesOrganisationConfigs get configs;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  ShipToInfo get shipToInfo;
  @override
  MaterialFilter get materialFilter;
  @override
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$ProductSearchStateImplCopyWith<_$ProductSearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

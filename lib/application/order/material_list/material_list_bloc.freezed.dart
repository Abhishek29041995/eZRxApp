// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MaterialListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)
        initialized,
    required TResult Function() watchFavoriteStatus,
    required TResult Function(MaterialInfo updatedMaterial)
        updateFavoriteStatus,
    required TResult Function(MaterialFilter selectedMaterialFilter) fetch,
    required TResult Function(List<MaterialInfo> materials) fetchStock,
    required TResult Function(String searchKey) updateSearchKey,
    required TResult Function() loadMore,
    required TResult Function(MaterialInfo item) addFavourite,
    required TResult Function(MaterialInfo item) deleteFavourite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult? Function()? watchFavoriteStatus,
    TResult? Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult? Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult? Function(List<MaterialInfo> materials)? fetchStock,
    TResult? Function(String searchKey)? updateSearchKey,
    TResult? Function()? loadMore,
    TResult? Function(MaterialInfo item)? addFavourite,
    TResult? Function(MaterialInfo item)? deleteFavourite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult Function()? watchFavoriteStatus,
    TResult Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult Function(List<MaterialInfo> materials)? fetchStock,
    TResult Function(String searchKey)? updateSearchKey,
    TResult Function()? loadMore,
    TResult Function(MaterialInfo item)? addFavourite,
    TResult Function(MaterialInfo item)? deleteFavourite,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_WatchFavoriteStatus value) watchFavoriteStatus,
    required TResult Function(_UpdateFavoriteStatus value) updateFavoriteStatus,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult? Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialListEventCopyWith<$Res> {
  factory $MaterialListEventCopyWith(
          MaterialListEvent value, $Res Function(MaterialListEvent) then) =
      _$MaterialListEventCopyWithImpl<$Res, MaterialListEvent>;
}

/// @nodoc
class _$MaterialListEventCopyWithImpl<$Res, $Val extends MaterialListEvent>
    implements $MaterialListEventCopyWith<$Res> {
  _$MaterialListEventCopyWithImpl(this._value, this._then);

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
      {SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs configs,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      User user,
      MaterialFilter selectedMaterialFilter});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $SalesOrganisationConfigsCopyWith<$Res> get configs;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $UserCopyWith<$Res> get user;
  $MaterialFilterCopyWith<$Res> get selectedMaterialFilter;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$MaterialListEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? configs = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? user = null,
    Object? selectedMaterialFilter = null,
  }) {
    return _then(_$InitializedImpl(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
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
      selectedMaterialFilter: null == selectedMaterialFilter
          ? _value.selectedMaterialFilter
          : selectedMaterialFilter // ignore: cast_nullable_to_non_nullable
              as MaterialFilter,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
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

  @override
  @pragma('vm:prefer-inline')
  $MaterialFilterCopyWith<$Res> get selectedMaterialFilter {
    return $MaterialFilterCopyWith<$Res>(_value.selectedMaterialFilter,
        (value) {
      return _then(_value.copyWith(selectedMaterialFilter: value));
    });
  }
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl(
      {required this.salesOrganisation,
      required this.configs,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.user,
      required this.selectedMaterialFilter});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final SalesOrganisationConfigs configs;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final User user;
  @override
  final MaterialFilter selectedMaterialFilter;

  @override
  String toString() {
    return 'MaterialListEvent.initialized(salesOrganisation: $salesOrganisation, configs: $configs, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, user: $user, selectedMaterialFilter: $selectedMaterialFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializedImpl &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.configs, configs) || other.configs == configs) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.selectedMaterialFilter, selectedMaterialFilter) ||
                other.selectedMaterialFilter == selectedMaterialFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrganisation, configs,
      customerCodeInfo, shipToInfo, user, selectedMaterialFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      __$$InitializedImplCopyWithImpl<_$InitializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)
        initialized,
    required TResult Function() watchFavoriteStatus,
    required TResult Function(MaterialInfo updatedMaterial)
        updateFavoriteStatus,
    required TResult Function(MaterialFilter selectedMaterialFilter) fetch,
    required TResult Function(List<MaterialInfo> materials) fetchStock,
    required TResult Function(String searchKey) updateSearchKey,
    required TResult Function() loadMore,
    required TResult Function(MaterialInfo item) addFavourite,
    required TResult Function(MaterialInfo item) deleteFavourite,
  }) {
    return initialized(salesOrganisation, configs, customerCodeInfo, shipToInfo,
        user, selectedMaterialFilter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult? Function()? watchFavoriteStatus,
    TResult? Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult? Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult? Function(List<MaterialInfo> materials)? fetchStock,
    TResult? Function(String searchKey)? updateSearchKey,
    TResult? Function()? loadMore,
    TResult? Function(MaterialInfo item)? addFavourite,
    TResult? Function(MaterialInfo item)? deleteFavourite,
  }) {
    return initialized?.call(salesOrganisation, configs, customerCodeInfo,
        shipToInfo, user, selectedMaterialFilter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult Function()? watchFavoriteStatus,
    TResult Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult Function(List<MaterialInfo> materials)? fetchStock,
    TResult Function(String searchKey)? updateSearchKey,
    TResult Function()? loadMore,
    TResult Function(MaterialInfo item)? addFavourite,
    TResult Function(MaterialInfo item)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(salesOrganisation, configs, customerCodeInfo,
          shipToInfo, user, selectedMaterialFilter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_WatchFavoriteStatus value) watchFavoriteStatus,
    required TResult Function(_UpdateFavoriteStatus value) updateFavoriteStatus,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult? Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements MaterialListEvent {
  const factory _Initialized(
          {required final SalesOrganisation salesOrganisation,
          required final SalesOrganisationConfigs configs,
          required final CustomerCodeInfo customerCodeInfo,
          required final ShipToInfo shipToInfo,
          required final User user,
          required final MaterialFilter selectedMaterialFilter}) =
      _$InitializedImpl;

  SalesOrganisation get salesOrganisation;
  SalesOrganisationConfigs get configs;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  User get user;
  MaterialFilter get selectedMaterialFilter;
  @JsonKey(ignore: true)
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WatchFavoriteStatusImplCopyWith<$Res> {
  factory _$$WatchFavoriteStatusImplCopyWith(_$WatchFavoriteStatusImpl value,
          $Res Function(_$WatchFavoriteStatusImpl) then) =
      __$$WatchFavoriteStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WatchFavoriteStatusImplCopyWithImpl<$Res>
    extends _$MaterialListEventCopyWithImpl<$Res, _$WatchFavoriteStatusImpl>
    implements _$$WatchFavoriteStatusImplCopyWith<$Res> {
  __$$WatchFavoriteStatusImplCopyWithImpl(_$WatchFavoriteStatusImpl _value,
      $Res Function(_$WatchFavoriteStatusImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WatchFavoriteStatusImpl implements _WatchFavoriteStatus {
  const _$WatchFavoriteStatusImpl();

  @override
  String toString() {
    return 'MaterialListEvent.watchFavoriteStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchFavoriteStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)
        initialized,
    required TResult Function() watchFavoriteStatus,
    required TResult Function(MaterialInfo updatedMaterial)
        updateFavoriteStatus,
    required TResult Function(MaterialFilter selectedMaterialFilter) fetch,
    required TResult Function(List<MaterialInfo> materials) fetchStock,
    required TResult Function(String searchKey) updateSearchKey,
    required TResult Function() loadMore,
    required TResult Function(MaterialInfo item) addFavourite,
    required TResult Function(MaterialInfo item) deleteFavourite,
  }) {
    return watchFavoriteStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult? Function()? watchFavoriteStatus,
    TResult? Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult? Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult? Function(List<MaterialInfo> materials)? fetchStock,
    TResult? Function(String searchKey)? updateSearchKey,
    TResult? Function()? loadMore,
    TResult? Function(MaterialInfo item)? addFavourite,
    TResult? Function(MaterialInfo item)? deleteFavourite,
  }) {
    return watchFavoriteStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult Function()? watchFavoriteStatus,
    TResult Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult Function(List<MaterialInfo> materials)? fetchStock,
    TResult Function(String searchKey)? updateSearchKey,
    TResult Function()? loadMore,
    TResult Function(MaterialInfo item)? addFavourite,
    TResult Function(MaterialInfo item)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (watchFavoriteStatus != null) {
      return watchFavoriteStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_WatchFavoriteStatus value) watchFavoriteStatus,
    required TResult Function(_UpdateFavoriteStatus value) updateFavoriteStatus,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) {
    return watchFavoriteStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult? Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) {
    return watchFavoriteStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (watchFavoriteStatus != null) {
      return watchFavoriteStatus(this);
    }
    return orElse();
  }
}

abstract class _WatchFavoriteStatus implements MaterialListEvent {
  const factory _WatchFavoriteStatus() = _$WatchFavoriteStatusImpl;
}

/// @nodoc
abstract class _$$UpdateFavoriteStatusImplCopyWith<$Res> {
  factory _$$UpdateFavoriteStatusImplCopyWith(_$UpdateFavoriteStatusImpl value,
          $Res Function(_$UpdateFavoriteStatusImpl) then) =
      __$$UpdateFavoriteStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialInfo updatedMaterial});

  $MaterialInfoCopyWith<$Res> get updatedMaterial;
}

/// @nodoc
class __$$UpdateFavoriteStatusImplCopyWithImpl<$Res>
    extends _$MaterialListEventCopyWithImpl<$Res, _$UpdateFavoriteStatusImpl>
    implements _$$UpdateFavoriteStatusImplCopyWith<$Res> {
  __$$UpdateFavoriteStatusImplCopyWithImpl(_$UpdateFavoriteStatusImpl _value,
      $Res Function(_$UpdateFavoriteStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updatedMaterial = null,
  }) {
    return _then(_$UpdateFavoriteStatusImpl(
      updatedMaterial: null == updatedMaterial
          ? _value.updatedMaterial
          : updatedMaterial // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialInfoCopyWith<$Res> get updatedMaterial {
    return $MaterialInfoCopyWith<$Res>(_value.updatedMaterial, (value) {
      return _then(_value.copyWith(updatedMaterial: value));
    });
  }
}

/// @nodoc

class _$UpdateFavoriteStatusImpl implements _UpdateFavoriteStatus {
  const _$UpdateFavoriteStatusImpl({required this.updatedMaterial});

  @override
  final MaterialInfo updatedMaterial;

  @override
  String toString() {
    return 'MaterialListEvent.updateFavoriteStatus(updatedMaterial: $updatedMaterial)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateFavoriteStatusImpl &&
            (identical(other.updatedMaterial, updatedMaterial) ||
                other.updatedMaterial == updatedMaterial));
  }

  @override
  int get hashCode => Object.hash(runtimeType, updatedMaterial);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateFavoriteStatusImplCopyWith<_$UpdateFavoriteStatusImpl>
      get copyWith =>
          __$$UpdateFavoriteStatusImplCopyWithImpl<_$UpdateFavoriteStatusImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)
        initialized,
    required TResult Function() watchFavoriteStatus,
    required TResult Function(MaterialInfo updatedMaterial)
        updateFavoriteStatus,
    required TResult Function(MaterialFilter selectedMaterialFilter) fetch,
    required TResult Function(List<MaterialInfo> materials) fetchStock,
    required TResult Function(String searchKey) updateSearchKey,
    required TResult Function() loadMore,
    required TResult Function(MaterialInfo item) addFavourite,
    required TResult Function(MaterialInfo item) deleteFavourite,
  }) {
    return updateFavoriteStatus(updatedMaterial);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult? Function()? watchFavoriteStatus,
    TResult? Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult? Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult? Function(List<MaterialInfo> materials)? fetchStock,
    TResult? Function(String searchKey)? updateSearchKey,
    TResult? Function()? loadMore,
    TResult? Function(MaterialInfo item)? addFavourite,
    TResult? Function(MaterialInfo item)? deleteFavourite,
  }) {
    return updateFavoriteStatus?.call(updatedMaterial);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult Function()? watchFavoriteStatus,
    TResult Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult Function(List<MaterialInfo> materials)? fetchStock,
    TResult Function(String searchKey)? updateSearchKey,
    TResult Function()? loadMore,
    TResult Function(MaterialInfo item)? addFavourite,
    TResult Function(MaterialInfo item)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (updateFavoriteStatus != null) {
      return updateFavoriteStatus(updatedMaterial);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_WatchFavoriteStatus value) watchFavoriteStatus,
    required TResult Function(_UpdateFavoriteStatus value) updateFavoriteStatus,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) {
    return updateFavoriteStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult? Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) {
    return updateFavoriteStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (updateFavoriteStatus != null) {
      return updateFavoriteStatus(this);
    }
    return orElse();
  }
}

abstract class _UpdateFavoriteStatus implements MaterialListEvent {
  const factory _UpdateFavoriteStatus(
          {required final MaterialInfo updatedMaterial}) =
      _$UpdateFavoriteStatusImpl;

  MaterialInfo get updatedMaterial;
  @JsonKey(ignore: true)
  _$$UpdateFavoriteStatusImplCopyWith<_$UpdateFavoriteStatusImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialFilter selectedMaterialFilter});

  $MaterialFilterCopyWith<$Res> get selectedMaterialFilter;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$MaterialListEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedMaterialFilter = null,
  }) {
    return _then(_$FetchImpl(
      selectedMaterialFilter: null == selectedMaterialFilter
          ? _value.selectedMaterialFilter
          : selectedMaterialFilter // ignore: cast_nullable_to_non_nullable
              as MaterialFilter,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialFilterCopyWith<$Res> get selectedMaterialFilter {
    return $MaterialFilterCopyWith<$Res>(_value.selectedMaterialFilter,
        (value) {
      return _then(_value.copyWith(selectedMaterialFilter: value));
    });
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  _$FetchImpl({required this.selectedMaterialFilter});

  @override
  final MaterialFilter selectedMaterialFilter;

  @override
  String toString() {
    return 'MaterialListEvent.fetch(selectedMaterialFilter: $selectedMaterialFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.selectedMaterialFilter, selectedMaterialFilter) ||
                other.selectedMaterialFilter == selectedMaterialFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedMaterialFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)
        initialized,
    required TResult Function() watchFavoriteStatus,
    required TResult Function(MaterialInfo updatedMaterial)
        updateFavoriteStatus,
    required TResult Function(MaterialFilter selectedMaterialFilter) fetch,
    required TResult Function(List<MaterialInfo> materials) fetchStock,
    required TResult Function(String searchKey) updateSearchKey,
    required TResult Function() loadMore,
    required TResult Function(MaterialInfo item) addFavourite,
    required TResult Function(MaterialInfo item) deleteFavourite,
  }) {
    return fetch(selectedMaterialFilter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult? Function()? watchFavoriteStatus,
    TResult? Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult? Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult? Function(List<MaterialInfo> materials)? fetchStock,
    TResult? Function(String searchKey)? updateSearchKey,
    TResult? Function()? loadMore,
    TResult? Function(MaterialInfo item)? addFavourite,
    TResult? Function(MaterialInfo item)? deleteFavourite,
  }) {
    return fetch?.call(selectedMaterialFilter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult Function()? watchFavoriteStatus,
    TResult Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult Function(List<MaterialInfo> materials)? fetchStock,
    TResult Function(String searchKey)? updateSearchKey,
    TResult Function()? loadMore,
    TResult Function(MaterialInfo item)? addFavourite,
    TResult Function(MaterialInfo item)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(selectedMaterialFilter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_WatchFavoriteStatus value) watchFavoriteStatus,
    required TResult Function(_UpdateFavoriteStatus value) updateFavoriteStatus,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult? Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements MaterialListEvent {
  factory _Fetch({required final MaterialFilter selectedMaterialFilter}) =
      _$FetchImpl;

  MaterialFilter get selectedMaterialFilter;
  @JsonKey(ignore: true)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchStockImplCopyWith<$Res> {
  factory _$$FetchStockImplCopyWith(
          _$FetchStockImpl value, $Res Function(_$FetchStockImpl) then) =
      __$$FetchStockImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MaterialInfo> materials});
}

/// @nodoc
class __$$FetchStockImplCopyWithImpl<$Res>
    extends _$MaterialListEventCopyWithImpl<$Res, _$FetchStockImpl>
    implements _$$FetchStockImplCopyWith<$Res> {
  __$$FetchStockImplCopyWithImpl(
      _$FetchStockImpl _value, $Res Function(_$FetchStockImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materials = null,
  }) {
    return _then(_$FetchStockImpl(
      materials: null == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
    ));
  }
}

/// @nodoc

class _$FetchStockImpl implements _FetchStock {
  _$FetchStockImpl({required final List<MaterialInfo> materials})
      : _materials = materials;

  final List<MaterialInfo> _materials;
  @override
  List<MaterialInfo> get materials {
    if (_materials is EqualUnmodifiableListView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materials);
  }

  @override
  String toString() {
    return 'MaterialListEvent.fetchStock(materials: $materials)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchStockImpl &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_materials));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchStockImplCopyWith<_$FetchStockImpl> get copyWith =>
      __$$FetchStockImplCopyWithImpl<_$FetchStockImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)
        initialized,
    required TResult Function() watchFavoriteStatus,
    required TResult Function(MaterialInfo updatedMaterial)
        updateFavoriteStatus,
    required TResult Function(MaterialFilter selectedMaterialFilter) fetch,
    required TResult Function(List<MaterialInfo> materials) fetchStock,
    required TResult Function(String searchKey) updateSearchKey,
    required TResult Function() loadMore,
    required TResult Function(MaterialInfo item) addFavourite,
    required TResult Function(MaterialInfo item) deleteFavourite,
  }) {
    return fetchStock(materials);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult? Function()? watchFavoriteStatus,
    TResult? Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult? Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult? Function(List<MaterialInfo> materials)? fetchStock,
    TResult? Function(String searchKey)? updateSearchKey,
    TResult? Function()? loadMore,
    TResult? Function(MaterialInfo item)? addFavourite,
    TResult? Function(MaterialInfo item)? deleteFavourite,
  }) {
    return fetchStock?.call(materials);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult Function()? watchFavoriteStatus,
    TResult Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult Function(List<MaterialInfo> materials)? fetchStock,
    TResult Function(String searchKey)? updateSearchKey,
    TResult Function()? loadMore,
    TResult Function(MaterialInfo item)? addFavourite,
    TResult Function(MaterialInfo item)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (fetchStock != null) {
      return fetchStock(materials);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_WatchFavoriteStatus value) watchFavoriteStatus,
    required TResult Function(_UpdateFavoriteStatus value) updateFavoriteStatus,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) {
    return fetchStock(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult? Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) {
    return fetchStock?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (fetchStock != null) {
      return fetchStock(this);
    }
    return orElse();
  }
}

abstract class _FetchStock implements MaterialListEvent {
  factory _FetchStock({required final List<MaterialInfo> materials}) =
      _$FetchStockImpl;

  List<MaterialInfo> get materials;
  @JsonKey(ignore: true)
  _$$FetchStockImplCopyWith<_$FetchStockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateSearchKeyImplCopyWith<$Res> {
  factory _$$UpdateSearchKeyImplCopyWith(_$UpdateSearchKeyImpl value,
          $Res Function(_$UpdateSearchKeyImpl) then) =
      __$$UpdateSearchKeyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String searchKey});
}

/// @nodoc
class __$$UpdateSearchKeyImplCopyWithImpl<$Res>
    extends _$MaterialListEventCopyWithImpl<$Res, _$UpdateSearchKeyImpl>
    implements _$$UpdateSearchKeyImplCopyWith<$Res> {
  __$$UpdateSearchKeyImplCopyWithImpl(
      _$UpdateSearchKeyImpl _value, $Res Function(_$UpdateSearchKeyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchKey = null,
  }) {
    return _then(_$UpdateSearchKeyImpl(
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateSearchKeyImpl implements _UpdateSearchKey {
  const _$UpdateSearchKeyImpl({required this.searchKey});

  @override
  final String searchKey;

  @override
  String toString() {
    return 'MaterialListEvent.updateSearchKey(searchKey: $searchKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSearchKeyImpl &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSearchKeyImplCopyWith<_$UpdateSearchKeyImpl> get copyWith =>
      __$$UpdateSearchKeyImplCopyWithImpl<_$UpdateSearchKeyImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)
        initialized,
    required TResult Function() watchFavoriteStatus,
    required TResult Function(MaterialInfo updatedMaterial)
        updateFavoriteStatus,
    required TResult Function(MaterialFilter selectedMaterialFilter) fetch,
    required TResult Function(List<MaterialInfo> materials) fetchStock,
    required TResult Function(String searchKey) updateSearchKey,
    required TResult Function() loadMore,
    required TResult Function(MaterialInfo item) addFavourite,
    required TResult Function(MaterialInfo item) deleteFavourite,
  }) {
    return updateSearchKey(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult? Function()? watchFavoriteStatus,
    TResult? Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult? Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult? Function(List<MaterialInfo> materials)? fetchStock,
    TResult? Function(String searchKey)? updateSearchKey,
    TResult? Function()? loadMore,
    TResult? Function(MaterialInfo item)? addFavourite,
    TResult? Function(MaterialInfo item)? deleteFavourite,
  }) {
    return updateSearchKey?.call(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult Function()? watchFavoriteStatus,
    TResult Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult Function(List<MaterialInfo> materials)? fetchStock,
    TResult Function(String searchKey)? updateSearchKey,
    TResult Function()? loadMore,
    TResult Function(MaterialInfo item)? addFavourite,
    TResult Function(MaterialInfo item)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (updateSearchKey != null) {
      return updateSearchKey(searchKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_WatchFavoriteStatus value) watchFavoriteStatus,
    required TResult Function(_UpdateFavoriteStatus value) updateFavoriteStatus,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) {
    return updateSearchKey(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult? Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) {
    return updateSearchKey?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (updateSearchKey != null) {
      return updateSearchKey(this);
    }
    return orElse();
  }
}

abstract class _UpdateSearchKey implements MaterialListEvent {
  const factory _UpdateSearchKey({required final String searchKey}) =
      _$UpdateSearchKeyImpl;

  String get searchKey;
  @JsonKey(ignore: true)
  _$$UpdateSearchKeyImplCopyWith<_$UpdateSearchKeyImpl> get copyWith =>
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
    extends _$MaterialListEventCopyWithImpl<$Res, _$LoadMoreImpl>
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
    return 'MaterialListEvent.loadMore()';
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
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)
        initialized,
    required TResult Function() watchFavoriteStatus,
    required TResult Function(MaterialInfo updatedMaterial)
        updateFavoriteStatus,
    required TResult Function(MaterialFilter selectedMaterialFilter) fetch,
    required TResult Function(List<MaterialInfo> materials) fetchStock,
    required TResult Function(String searchKey) updateSearchKey,
    required TResult Function() loadMore,
    required TResult Function(MaterialInfo item) addFavourite,
    required TResult Function(MaterialInfo item) deleteFavourite,
  }) {
    return loadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult? Function()? watchFavoriteStatus,
    TResult? Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult? Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult? Function(List<MaterialInfo> materials)? fetchStock,
    TResult? Function(String searchKey)? updateSearchKey,
    TResult? Function()? loadMore,
    TResult? Function(MaterialInfo item)? addFavourite,
    TResult? Function(MaterialInfo item)? deleteFavourite,
  }) {
    return loadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult Function()? watchFavoriteStatus,
    TResult Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult Function(List<MaterialInfo> materials)? fetchStock,
    TResult Function(String searchKey)? updateSearchKey,
    TResult Function()? loadMore,
    TResult Function(MaterialInfo item)? addFavourite,
    TResult Function(MaterialInfo item)? deleteFavourite,
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
    required TResult Function(_WatchFavoriteStatus value) watchFavoriteStatus,
    required TResult Function(_UpdateFavoriteStatus value) updateFavoriteStatus,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult? Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements MaterialListEvent {
  const factory _LoadMore() = _$LoadMoreImpl;
}

/// @nodoc
abstract class _$$AddFavouriteImplCopyWith<$Res> {
  factory _$$AddFavouriteImplCopyWith(
          _$AddFavouriteImpl value, $Res Function(_$AddFavouriteImpl) then) =
      __$$AddFavouriteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialInfo item});

  $MaterialInfoCopyWith<$Res> get item;
}

/// @nodoc
class __$$AddFavouriteImplCopyWithImpl<$Res>
    extends _$MaterialListEventCopyWithImpl<$Res, _$AddFavouriteImpl>
    implements _$$AddFavouriteImplCopyWith<$Res> {
  __$$AddFavouriteImplCopyWithImpl(
      _$AddFavouriteImpl _value, $Res Function(_$AddFavouriteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$AddFavouriteImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialInfoCopyWith<$Res> get item {
    return $MaterialInfoCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$AddFavouriteImpl implements _AddFavourite {
  _$AddFavouriteImpl({required this.item});

  @override
  final MaterialInfo item;

  @override
  String toString() {
    return 'MaterialListEvent.addFavourite(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddFavouriteImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddFavouriteImplCopyWith<_$AddFavouriteImpl> get copyWith =>
      __$$AddFavouriteImplCopyWithImpl<_$AddFavouriteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)
        initialized,
    required TResult Function() watchFavoriteStatus,
    required TResult Function(MaterialInfo updatedMaterial)
        updateFavoriteStatus,
    required TResult Function(MaterialFilter selectedMaterialFilter) fetch,
    required TResult Function(List<MaterialInfo> materials) fetchStock,
    required TResult Function(String searchKey) updateSearchKey,
    required TResult Function() loadMore,
    required TResult Function(MaterialInfo item) addFavourite,
    required TResult Function(MaterialInfo item) deleteFavourite,
  }) {
    return addFavourite(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult? Function()? watchFavoriteStatus,
    TResult? Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult? Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult? Function(List<MaterialInfo> materials)? fetchStock,
    TResult? Function(String searchKey)? updateSearchKey,
    TResult? Function()? loadMore,
    TResult? Function(MaterialInfo item)? addFavourite,
    TResult? Function(MaterialInfo item)? deleteFavourite,
  }) {
    return addFavourite?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult Function()? watchFavoriteStatus,
    TResult Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult Function(List<MaterialInfo> materials)? fetchStock,
    TResult Function(String searchKey)? updateSearchKey,
    TResult Function()? loadMore,
    TResult Function(MaterialInfo item)? addFavourite,
    TResult Function(MaterialInfo item)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (addFavourite != null) {
      return addFavourite(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_WatchFavoriteStatus value) watchFavoriteStatus,
    required TResult Function(_UpdateFavoriteStatus value) updateFavoriteStatus,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) {
    return addFavourite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult? Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) {
    return addFavourite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (addFavourite != null) {
      return addFavourite(this);
    }
    return orElse();
  }
}

abstract class _AddFavourite implements MaterialListEvent {
  factory _AddFavourite({required final MaterialInfo item}) =
      _$AddFavouriteImpl;

  MaterialInfo get item;
  @JsonKey(ignore: true)
  _$$AddFavouriteImplCopyWith<_$AddFavouriteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteFavouriteImplCopyWith<$Res> {
  factory _$$DeleteFavouriteImplCopyWith(_$DeleteFavouriteImpl value,
          $Res Function(_$DeleteFavouriteImpl) then) =
      __$$DeleteFavouriteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialInfo item});

  $MaterialInfoCopyWith<$Res> get item;
}

/// @nodoc
class __$$DeleteFavouriteImplCopyWithImpl<$Res>
    extends _$MaterialListEventCopyWithImpl<$Res, _$DeleteFavouriteImpl>
    implements _$$DeleteFavouriteImplCopyWith<$Res> {
  __$$DeleteFavouriteImplCopyWithImpl(
      _$DeleteFavouriteImpl _value, $Res Function(_$DeleteFavouriteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$DeleteFavouriteImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialInfoCopyWith<$Res> get item {
    return $MaterialInfoCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$DeleteFavouriteImpl implements _DeleteFavourite {
  _$DeleteFavouriteImpl({required this.item});

  @override
  final MaterialInfo item;

  @override
  String toString() {
    return 'MaterialListEvent.deleteFavourite(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteFavouriteImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteFavouriteImplCopyWith<_$DeleteFavouriteImpl> get copyWith =>
      __$$DeleteFavouriteImplCopyWithImpl<_$DeleteFavouriteImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)
        initialized,
    required TResult Function() watchFavoriteStatus,
    required TResult Function(MaterialInfo updatedMaterial)
        updateFavoriteStatus,
    required TResult Function(MaterialFilter selectedMaterialFilter) fetch,
    required TResult Function(List<MaterialInfo> materials) fetchStock,
    required TResult Function(String searchKey) updateSearchKey,
    required TResult Function() loadMore,
    required TResult Function(MaterialInfo item) addFavourite,
    required TResult Function(MaterialInfo item) deleteFavourite,
  }) {
    return deleteFavourite(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult? Function()? watchFavoriteStatus,
    TResult? Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult? Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult? Function(List<MaterialInfo> materials)? fetchStock,
    TResult? Function(String searchKey)? updateSearchKey,
    TResult? Function()? loadMore,
    TResult? Function(MaterialInfo item)? addFavourite,
    TResult? Function(MaterialInfo item)? deleteFavourite,
  }) {
    return deleteFavourite?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialFilter selectedMaterialFilter)?
        initialized,
    TResult Function()? watchFavoriteStatus,
    TResult Function(MaterialInfo updatedMaterial)? updateFavoriteStatus,
    TResult Function(MaterialFilter selectedMaterialFilter)? fetch,
    TResult Function(List<MaterialInfo> materials)? fetchStock,
    TResult Function(String searchKey)? updateSearchKey,
    TResult Function()? loadMore,
    TResult Function(MaterialInfo item)? addFavourite,
    TResult Function(MaterialInfo item)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (deleteFavourite != null) {
      return deleteFavourite(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_WatchFavoriteStatus value) watchFavoriteStatus,
    required TResult Function(_UpdateFavoriteStatus value) updateFavoriteStatus,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_UpdateSearchKey value) updateSearchKey,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
  }) {
    return deleteFavourite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult? Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_UpdateSearchKey value)? updateSearchKey,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
  }) {
    return deleteFavourite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_WatchFavoriteStatus value)? watchFavoriteStatus,
    TResult Function(_UpdateFavoriteStatus value)? updateFavoriteStatus,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_UpdateSearchKey value)? updateSearchKey,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    required TResult orElse(),
  }) {
    if (deleteFavourite != null) {
      return deleteFavourite(this);
    }
    return orElse();
  }
}

abstract class _DeleteFavourite implements MaterialListEvent {
  factory _DeleteFavourite({required final MaterialInfo item}) =
      _$DeleteFavouriteImpl;

  MaterialInfo get item;
  @JsonKey(ignore: true)
  _$$DeleteFavouriteImplCopyWith<_$DeleteFavouriteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MaterialListState {
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  SalesOrganisationConfigs get configs => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  ShipToInfo get shipToInfo => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  int get materialCount => throw _privateConstructorUsedError;
  List<MaterialInfo> get materialList => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  bool get isScanFromBarcode => throw _privateConstructorUsedError;
  int get nextPageIndex => throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;
  MaterialFilter get selectedMaterialFilter =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaterialListStateCopyWith<MaterialListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialListStateCopyWith<$Res> {
  factory $MaterialListStateCopyWith(
          MaterialListState value, $Res Function(MaterialListState) then) =
      _$MaterialListStateCopyWithImpl<$Res, MaterialListState>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs configs,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      User user,
      int materialCount,
      List<MaterialInfo> materialList,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool canLoadMore,
      bool isFetching,
      bool isScanFromBarcode,
      int nextPageIndex,
      SearchKey searchKey,
      MaterialFilter selectedMaterialFilter});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $SalesOrganisationConfigsCopyWith<$Res> get configs;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $UserCopyWith<$Res> get user;
  $MaterialFilterCopyWith<$Res> get selectedMaterialFilter;
}

/// @nodoc
class _$MaterialListStateCopyWithImpl<$Res, $Val extends MaterialListState>
    implements $MaterialListStateCopyWith<$Res> {
  _$MaterialListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? configs = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? user = null,
    Object? materialCount = null,
    Object? materialList = null,
    Object? apiFailureOrSuccessOption = null,
    Object? canLoadMore = null,
    Object? isFetching = null,
    Object? isScanFromBarcode = null,
    Object? nextPageIndex = null,
    Object? searchKey = null,
    Object? selectedMaterialFilter = null,
  }) {
    return _then(_value.copyWith(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
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
      materialCount: null == materialCount
          ? _value.materialCount
          : materialCount // ignore: cast_nullable_to_non_nullable
              as int,
      materialList: null == materialList
          ? _value.materialList
          : materialList // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isScanFromBarcode: null == isScanFromBarcode
          ? _value.isScanFromBarcode
          : isScanFromBarcode // ignore: cast_nullable_to_non_nullable
              as bool,
      nextPageIndex: null == nextPageIndex
          ? _value.nextPageIndex
          : nextPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      selectedMaterialFilter: null == selectedMaterialFilter
          ? _value.selectedMaterialFilter
          : selectedMaterialFilter // ignore: cast_nullable_to_non_nullable
              as MaterialFilter,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value) as $Val);
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
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialFilterCopyWith<$Res> get selectedMaterialFilter {
    return $MaterialFilterCopyWith<$Res>(_value.selectedMaterialFilter,
        (value) {
      return _then(_value.copyWith(selectedMaterialFilter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MaterialListStateImplCopyWith<$Res>
    implements $MaterialListStateCopyWith<$Res> {
  factory _$$MaterialListStateImplCopyWith(_$MaterialListStateImpl value,
          $Res Function(_$MaterialListStateImpl) then) =
      __$$MaterialListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs configs,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      User user,
      int materialCount,
      List<MaterialInfo> materialList,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool canLoadMore,
      bool isFetching,
      bool isScanFromBarcode,
      int nextPageIndex,
      SearchKey searchKey,
      MaterialFilter selectedMaterialFilter});

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $SalesOrganisationConfigsCopyWith<$Res> get configs;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  @override
  $UserCopyWith<$Res> get user;
  @override
  $MaterialFilterCopyWith<$Res> get selectedMaterialFilter;
}

/// @nodoc
class __$$MaterialListStateImplCopyWithImpl<$Res>
    extends _$MaterialListStateCopyWithImpl<$Res, _$MaterialListStateImpl>
    implements _$$MaterialListStateImplCopyWith<$Res> {
  __$$MaterialListStateImplCopyWithImpl(_$MaterialListStateImpl _value,
      $Res Function(_$MaterialListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? configs = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? user = null,
    Object? materialCount = null,
    Object? materialList = null,
    Object? apiFailureOrSuccessOption = null,
    Object? canLoadMore = null,
    Object? isFetching = null,
    Object? isScanFromBarcode = null,
    Object? nextPageIndex = null,
    Object? searchKey = null,
    Object? selectedMaterialFilter = null,
  }) {
    return _then(_$MaterialListStateImpl(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
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
      materialCount: null == materialCount
          ? _value.materialCount
          : materialCount // ignore: cast_nullable_to_non_nullable
              as int,
      materialList: null == materialList
          ? _value._materialList
          : materialList // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isScanFromBarcode: null == isScanFromBarcode
          ? _value.isScanFromBarcode
          : isScanFromBarcode // ignore: cast_nullable_to_non_nullable
              as bool,
      nextPageIndex: null == nextPageIndex
          ? _value.nextPageIndex
          : nextPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      selectedMaterialFilter: null == selectedMaterialFilter
          ? _value.selectedMaterialFilter
          : selectedMaterialFilter // ignore: cast_nullable_to_non_nullable
              as MaterialFilter,
    ));
  }
}

/// @nodoc

class _$MaterialListStateImpl extends _MaterialListState {
  const _$MaterialListStateImpl(
      {required this.salesOrganisation,
      required this.configs,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.user,
      required this.materialCount,
      required final List<MaterialInfo> materialList,
      required this.apiFailureOrSuccessOption,
      required this.canLoadMore,
      required this.isFetching,
      required this.isScanFromBarcode,
      required this.nextPageIndex,
      required this.searchKey,
      required this.selectedMaterialFilter})
      : _materialList = materialList,
        super._();

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final SalesOrganisationConfigs configs;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final User user;
  @override
  final int materialCount;
  final List<MaterialInfo> _materialList;
  @override
  List<MaterialInfo> get materialList {
    if (_materialList is EqualUnmodifiableListView) return _materialList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materialList);
  }

  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;
  @override
  final bool canLoadMore;
  @override
  final bool isFetching;
  @override
  final bool isScanFromBarcode;
  @override
  final int nextPageIndex;
  @override
  final SearchKey searchKey;
  @override
  final MaterialFilter selectedMaterialFilter;

  @override
  String toString() {
    return 'MaterialListState(salesOrganisation: $salesOrganisation, configs: $configs, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, user: $user, materialCount: $materialCount, materialList: $materialList, apiFailureOrSuccessOption: $apiFailureOrSuccessOption, canLoadMore: $canLoadMore, isFetching: $isFetching, isScanFromBarcode: $isScanFromBarcode, nextPageIndex: $nextPageIndex, searchKey: $searchKey, selectedMaterialFilter: $selectedMaterialFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialListStateImpl &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.configs, configs) || other.configs == configs) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.materialCount, materialCount) ||
                other.materialCount == materialCount) &&
            const DeepCollectionEquality()
                .equals(other._materialList, _materialList) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.isScanFromBarcode, isScanFromBarcode) ||
                other.isScanFromBarcode == isScanFromBarcode) &&
            (identical(other.nextPageIndex, nextPageIndex) ||
                other.nextPageIndex == nextPageIndex) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            (identical(other.selectedMaterialFilter, selectedMaterialFilter) ||
                other.selectedMaterialFilter == selectedMaterialFilter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      salesOrganisation,
      configs,
      customerCodeInfo,
      shipToInfo,
      user,
      materialCount,
      const DeepCollectionEquality().hash(_materialList),
      apiFailureOrSuccessOption,
      canLoadMore,
      isFetching,
      isScanFromBarcode,
      nextPageIndex,
      searchKey,
      selectedMaterialFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialListStateImplCopyWith<_$MaterialListStateImpl> get copyWith =>
      __$$MaterialListStateImplCopyWithImpl<_$MaterialListStateImpl>(
          this, _$identity);
}

abstract class _MaterialListState extends MaterialListState {
  const factory _MaterialListState(
          {required final SalesOrganisation salesOrganisation,
          required final SalesOrganisationConfigs configs,
          required final CustomerCodeInfo customerCodeInfo,
          required final ShipToInfo shipToInfo,
          required final User user,
          required final int materialCount,
          required final List<MaterialInfo> materialList,
          required final Option<Either<ApiFailure, dynamic>>
              apiFailureOrSuccessOption,
          required final bool canLoadMore,
          required final bool isFetching,
          required final bool isScanFromBarcode,
          required final int nextPageIndex,
          required final SearchKey searchKey,
          required final MaterialFilter selectedMaterialFilter}) =
      _$MaterialListStateImpl;
  const _MaterialListState._() : super._();

  @override
  SalesOrganisation get salesOrganisation;
  @override
  SalesOrganisationConfigs get configs;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  ShipToInfo get shipToInfo;
  @override
  User get user;
  @override
  int get materialCount;
  @override
  List<MaterialInfo> get materialList;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  bool get canLoadMore;
  @override
  bool get isFetching;
  @override
  bool get isScanFromBarcode;
  @override
  int get nextPageIndex;
  @override
  SearchKey get searchKey;
  @override
  MaterialFilter get selectedMaterialFilter;
  @override
  @JsonKey(ignore: true)
  _$$MaterialListStateImplCopyWith<_$MaterialListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

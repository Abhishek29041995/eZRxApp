// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'combo_deal_material_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ComboDealMaterialDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)
        initialize,
    required TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)
        setPriceInfo,
    required TResult Function(MaterialNumber item, int qty) updateItemQuantity,
    required TResult Function(MaterialNumber item) updateItemSelection,
    required TResult Function(
            ComboDeal comboDeal,
            MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)
        fetchComboDealDetail,
    required TResult Function(SearchKey searchKey) search,
    required TResult Function(bool contain) cartContainsCurrentCombo,
    required TResult Function() clearSearch,
    required TResult Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)
        fetchComboDealPrincipal,
    required TResult Function(ComboDeal comboDeal, List<String> principles)
        loadMoreComboDealPrincipal,
    required TResult Function() clearSelectedItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)?
        initialize,
    TResult? Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult? Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult? Function(MaterialNumber item)? updateItemSelection,
    TResult? Function(ComboDeal comboDeal, MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)?
        fetchComboDealDetail,
    TResult? Function(SearchKey searchKey)? search,
    TResult? Function(bool contain)? cartContainsCurrentCombo,
    TResult? Function()? clearSearch,
    TResult? Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealPrincipal,
    TResult? Function(ComboDeal comboDeal, List<String> principles)?
        loadMoreComboDealPrincipal,
    TResult? Function()? clearSelectedItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)?
        initialize,
    TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult Function(MaterialNumber item)? updateItemSelection,
    TResult Function(ComboDeal comboDeal, MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)?
        fetchComboDealDetail,
    TResult Function(SearchKey searchKey)? search,
    TResult Function(bool contain)? cartContainsCurrentCombo,
    TResult Function()? clearSearch,
    TResult Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealPrincipal,
    TResult Function(ComboDeal comboDeal, List<String> principles)?
        loadMoreComboDealPrincipal,
    TResult Function()? clearSelectedItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SetPriceInfo value) setPriceInfo,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_UpdateItemSelection value) updateItemSelection,
    required TResult Function(_FetchComboDealDetail value) fetchComboDealDetail,
    required TResult Function(_Search value) search,
    required TResult Function(_CartContainsCurrentCombo value)
        cartContainsCurrentCombo,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FetchComboDealPrincipal value)
        fetchComboDealPrincipal,
    required TResult Function(_LoadMoreComboDealPrincipal value)
        loadMoreComboDealPrincipal,
    required TResult Function(_ClearSelectedItem value) clearSelectedItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SetPriceInfo value)? setPriceInfo,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_UpdateItemSelection value)? updateItemSelection,
    TResult? Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult? Function(_Search value)? search,
    TResult? Function(_CartContainsCurrentCombo value)?
        cartContainsCurrentCombo,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FetchComboDealPrincipal value)? fetchComboDealPrincipal,
    TResult? Function(_LoadMoreComboDealPrincipal value)?
        loadMoreComboDealPrincipal,
    TResult? Function(_ClearSelectedItem value)? clearSelectedItem,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SetPriceInfo value)? setPriceInfo,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_UpdateItemSelection value)? updateItemSelection,
    TResult Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult Function(_Search value)? search,
    TResult Function(_CartContainsCurrentCombo value)? cartContainsCurrentCombo,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FetchComboDealPrincipal value)? fetchComboDealPrincipal,
    TResult Function(_LoadMoreComboDealPrincipal value)?
        loadMoreComboDealPrincipal,
    TResult Function(_ClearSelectedItem value)? clearSelectedItem,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComboDealMaterialDetailEventCopyWith<$Res> {
  factory $ComboDealMaterialDetailEventCopyWith(
          ComboDealMaterialDetailEvent value,
          $Res Function(ComboDealMaterialDetailEvent) then) =
      _$ComboDealMaterialDetailEventCopyWithImpl<$Res,
          ComboDealMaterialDetailEvent>;
}

/// @nodoc
class _$ComboDealMaterialDetailEventCopyWithImpl<$Res,
        $Val extends ComboDealMaterialDetailEvent>
    implements $ComboDealMaterialDetailEventCopyWith<$Res> {
  _$ComboDealMaterialDetailEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      User user,
      SalesOrganisationConfigs salesConfigs});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $UserCopyWith<$Res> get user;
  $SalesOrganisationConfigsCopyWith<$Res> get salesConfigs;
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$ComboDealMaterialDetailEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? user = null,
    Object? salesConfigs = null,
  }) {
    return _then(_$InitializeImpl(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
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
      salesConfigs: null == salesConfigs
          ? _value.salesConfigs
          : salesConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
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
  $SalesOrganisationConfigsCopyWith<$Res> get salesConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.salesConfigs,
        (value) {
      return _then(_value.copyWith(salesConfigs: value));
    });
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl(
      {required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.user,
      required this.salesConfigs});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final User user;
  @override
  final SalesOrganisationConfigs salesConfigs;

  @override
  String toString() {
    return 'ComboDealMaterialDetailEvent.initialize(salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, user: $user, salesConfigs: $salesConfigs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.salesConfigs, salesConfigs) ||
                other.salesConfigs == salesConfigs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrganisation,
      customerCodeInfo, shipToInfo, user, salesConfigs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)
        initialize,
    required TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)
        setPriceInfo,
    required TResult Function(MaterialNumber item, int qty) updateItemQuantity,
    required TResult Function(MaterialNumber item) updateItemSelection,
    required TResult Function(
            ComboDeal comboDeal,
            MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)
        fetchComboDealDetail,
    required TResult Function(SearchKey searchKey) search,
    required TResult Function(bool contain) cartContainsCurrentCombo,
    required TResult Function() clearSearch,
    required TResult Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)
        fetchComboDealPrincipal,
    required TResult Function(ComboDeal comboDeal, List<String> principles)
        loadMoreComboDealPrincipal,
    required TResult Function() clearSelectedItem,
  }) {
    return initialize(
        salesOrganisation, customerCodeInfo, shipToInfo, user, salesConfigs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)?
        initialize,
    TResult? Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult? Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult? Function(MaterialNumber item)? updateItemSelection,
    TResult? Function(ComboDeal comboDeal, MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)?
        fetchComboDealDetail,
    TResult? Function(SearchKey searchKey)? search,
    TResult? Function(bool contain)? cartContainsCurrentCombo,
    TResult? Function()? clearSearch,
    TResult? Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealPrincipal,
    TResult? Function(ComboDeal comboDeal, List<String> principles)?
        loadMoreComboDealPrincipal,
    TResult? Function()? clearSelectedItem,
  }) {
    return initialize?.call(
        salesOrganisation, customerCodeInfo, shipToInfo, user, salesConfigs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)?
        initialize,
    TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult Function(MaterialNumber item)? updateItemSelection,
    TResult Function(ComboDeal comboDeal, MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)?
        fetchComboDealDetail,
    TResult Function(SearchKey searchKey)? search,
    TResult Function(bool contain)? cartContainsCurrentCombo,
    TResult Function()? clearSearch,
    TResult Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealPrincipal,
    TResult Function(ComboDeal comboDeal, List<String> principles)?
        loadMoreComboDealPrincipal,
    TResult Function()? clearSelectedItem,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(
          salesOrganisation, customerCodeInfo, shipToInfo, user, salesConfigs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SetPriceInfo value) setPriceInfo,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_UpdateItemSelection value) updateItemSelection,
    required TResult Function(_FetchComboDealDetail value) fetchComboDealDetail,
    required TResult Function(_Search value) search,
    required TResult Function(_CartContainsCurrentCombo value)
        cartContainsCurrentCombo,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FetchComboDealPrincipal value)
        fetchComboDealPrincipal,
    required TResult Function(_LoadMoreComboDealPrincipal value)
        loadMoreComboDealPrincipal,
    required TResult Function(_ClearSelectedItem value) clearSelectedItem,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SetPriceInfo value)? setPriceInfo,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_UpdateItemSelection value)? updateItemSelection,
    TResult? Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult? Function(_Search value)? search,
    TResult? Function(_CartContainsCurrentCombo value)?
        cartContainsCurrentCombo,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FetchComboDealPrincipal value)? fetchComboDealPrincipal,
    TResult? Function(_LoadMoreComboDealPrincipal value)?
        loadMoreComboDealPrincipal,
    TResult? Function(_ClearSelectedItem value)? clearSelectedItem,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SetPriceInfo value)? setPriceInfo,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_UpdateItemSelection value)? updateItemSelection,
    TResult Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult Function(_Search value)? search,
    TResult Function(_CartContainsCurrentCombo value)? cartContainsCurrentCombo,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FetchComboDealPrincipal value)? fetchComboDealPrincipal,
    TResult Function(_LoadMoreComboDealPrincipal value)?
        loadMoreComboDealPrincipal,
    TResult Function(_ClearSelectedItem value)? clearSelectedItem,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements ComboDealMaterialDetailEvent {
  const factory _Initialize(
      {required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final User user,
      required final SalesOrganisationConfigs salesConfigs}) = _$InitializeImpl;

  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  User get user;
  SalesOrganisationConfigs get salesConfigs;
  @JsonKey(ignore: true)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetPriceInfoImplCopyWith<$Res> {
  factory _$$SetPriceInfoImplCopyWith(
          _$SetPriceInfoImpl value, $Res Function(_$SetPriceInfoImpl) then) =
      __$$SetPriceInfoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<MaterialNumber, MaterialPriceDetail> priceMap});
}

/// @nodoc
class __$$SetPriceInfoImplCopyWithImpl<$Res>
    extends _$ComboDealMaterialDetailEventCopyWithImpl<$Res, _$SetPriceInfoImpl>
    implements _$$SetPriceInfoImplCopyWith<$Res> {
  __$$SetPriceInfoImplCopyWithImpl(
      _$SetPriceInfoImpl _value, $Res Function(_$SetPriceInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceMap = null,
  }) {
    return _then(_$SetPriceInfoImpl(
      priceMap: null == priceMap
          ? _value._priceMap
          : priceMap // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, MaterialPriceDetail>,
    ));
  }
}

/// @nodoc

class _$SetPriceInfoImpl implements _SetPriceInfo {
  const _$SetPriceInfoImpl(
      {required final Map<MaterialNumber, MaterialPriceDetail> priceMap})
      : _priceMap = priceMap;

  final Map<MaterialNumber, MaterialPriceDetail> _priceMap;
  @override
  Map<MaterialNumber, MaterialPriceDetail> get priceMap {
    if (_priceMap is EqualUnmodifiableMapView) return _priceMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_priceMap);
  }

  @override
  String toString() {
    return 'ComboDealMaterialDetailEvent.setPriceInfo(priceMap: $priceMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetPriceInfoImpl &&
            const DeepCollectionEquality().equals(other._priceMap, _priceMap));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_priceMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetPriceInfoImplCopyWith<_$SetPriceInfoImpl> get copyWith =>
      __$$SetPriceInfoImplCopyWithImpl<_$SetPriceInfoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)
        initialize,
    required TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)
        setPriceInfo,
    required TResult Function(MaterialNumber item, int qty) updateItemQuantity,
    required TResult Function(MaterialNumber item) updateItemSelection,
    required TResult Function(
            ComboDeal comboDeal,
            MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)
        fetchComboDealDetail,
    required TResult Function(SearchKey searchKey) search,
    required TResult Function(bool contain) cartContainsCurrentCombo,
    required TResult Function() clearSearch,
    required TResult Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)
        fetchComboDealPrincipal,
    required TResult Function(ComboDeal comboDeal, List<String> principles)
        loadMoreComboDealPrincipal,
    required TResult Function() clearSelectedItem,
  }) {
    return setPriceInfo(priceMap);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)?
        initialize,
    TResult? Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult? Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult? Function(MaterialNumber item)? updateItemSelection,
    TResult? Function(ComboDeal comboDeal, MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)?
        fetchComboDealDetail,
    TResult? Function(SearchKey searchKey)? search,
    TResult? Function(bool contain)? cartContainsCurrentCombo,
    TResult? Function()? clearSearch,
    TResult? Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealPrincipal,
    TResult? Function(ComboDeal comboDeal, List<String> principles)?
        loadMoreComboDealPrincipal,
    TResult? Function()? clearSelectedItem,
  }) {
    return setPriceInfo?.call(priceMap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)?
        initialize,
    TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult Function(MaterialNumber item)? updateItemSelection,
    TResult Function(ComboDeal comboDeal, MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)?
        fetchComboDealDetail,
    TResult Function(SearchKey searchKey)? search,
    TResult Function(bool contain)? cartContainsCurrentCombo,
    TResult Function()? clearSearch,
    TResult Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealPrincipal,
    TResult Function(ComboDeal comboDeal, List<String> principles)?
        loadMoreComboDealPrincipal,
    TResult Function()? clearSelectedItem,
    required TResult orElse(),
  }) {
    if (setPriceInfo != null) {
      return setPriceInfo(priceMap);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SetPriceInfo value) setPriceInfo,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_UpdateItemSelection value) updateItemSelection,
    required TResult Function(_FetchComboDealDetail value) fetchComboDealDetail,
    required TResult Function(_Search value) search,
    required TResult Function(_CartContainsCurrentCombo value)
        cartContainsCurrentCombo,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FetchComboDealPrincipal value)
        fetchComboDealPrincipal,
    required TResult Function(_LoadMoreComboDealPrincipal value)
        loadMoreComboDealPrincipal,
    required TResult Function(_ClearSelectedItem value) clearSelectedItem,
  }) {
    return setPriceInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SetPriceInfo value)? setPriceInfo,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_UpdateItemSelection value)? updateItemSelection,
    TResult? Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult? Function(_Search value)? search,
    TResult? Function(_CartContainsCurrentCombo value)?
        cartContainsCurrentCombo,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FetchComboDealPrincipal value)? fetchComboDealPrincipal,
    TResult? Function(_LoadMoreComboDealPrincipal value)?
        loadMoreComboDealPrincipal,
    TResult? Function(_ClearSelectedItem value)? clearSelectedItem,
  }) {
    return setPriceInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SetPriceInfo value)? setPriceInfo,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_UpdateItemSelection value)? updateItemSelection,
    TResult Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult Function(_Search value)? search,
    TResult Function(_CartContainsCurrentCombo value)? cartContainsCurrentCombo,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FetchComboDealPrincipal value)? fetchComboDealPrincipal,
    TResult Function(_LoadMoreComboDealPrincipal value)?
        loadMoreComboDealPrincipal,
    TResult Function(_ClearSelectedItem value)? clearSelectedItem,
    required TResult orElse(),
  }) {
    if (setPriceInfo != null) {
      return setPriceInfo(this);
    }
    return orElse();
  }
}

abstract class _SetPriceInfo implements ComboDealMaterialDetailEvent {
  const factory _SetPriceInfo(
          {required final Map<MaterialNumber, MaterialPriceDetail> priceMap}) =
      _$SetPriceInfoImpl;

  Map<MaterialNumber, MaterialPriceDetail> get priceMap;
  @JsonKey(ignore: true)
  _$$SetPriceInfoImplCopyWith<_$SetPriceInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateItemQuantityImplCopyWith<$Res> {
  factory _$$UpdateItemQuantityImplCopyWith(_$UpdateItemQuantityImpl value,
          $Res Function(_$UpdateItemQuantityImpl) then) =
      __$$UpdateItemQuantityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialNumber item, int qty});
}

/// @nodoc
class __$$UpdateItemQuantityImplCopyWithImpl<$Res>
    extends _$ComboDealMaterialDetailEventCopyWithImpl<$Res,
        _$UpdateItemQuantityImpl>
    implements _$$UpdateItemQuantityImplCopyWith<$Res> {
  __$$UpdateItemQuantityImplCopyWithImpl(_$UpdateItemQuantityImpl _value,
      $Res Function(_$UpdateItemQuantityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? qty = null,
  }) {
    return _then(_$UpdateItemQuantityImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UpdateItemQuantityImpl implements _UpdateItemQuantity {
  const _$UpdateItemQuantityImpl({required this.item, required this.qty});

  @override
  final MaterialNumber item;
  @override
  final int qty;

  @override
  String toString() {
    return 'ComboDealMaterialDetailEvent.updateItemQuantity(item: $item, qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateItemQuantityImpl &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.qty, qty) || other.qty == qty));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item, qty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateItemQuantityImplCopyWith<_$UpdateItemQuantityImpl> get copyWith =>
      __$$UpdateItemQuantityImplCopyWithImpl<_$UpdateItemQuantityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)
        initialize,
    required TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)
        setPriceInfo,
    required TResult Function(MaterialNumber item, int qty) updateItemQuantity,
    required TResult Function(MaterialNumber item) updateItemSelection,
    required TResult Function(
            ComboDeal comboDeal,
            MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)
        fetchComboDealDetail,
    required TResult Function(SearchKey searchKey) search,
    required TResult Function(bool contain) cartContainsCurrentCombo,
    required TResult Function() clearSearch,
    required TResult Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)
        fetchComboDealPrincipal,
    required TResult Function(ComboDeal comboDeal, List<String> principles)
        loadMoreComboDealPrincipal,
    required TResult Function() clearSelectedItem,
  }) {
    return updateItemQuantity(item, qty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)?
        initialize,
    TResult? Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult? Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult? Function(MaterialNumber item)? updateItemSelection,
    TResult? Function(ComboDeal comboDeal, MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)?
        fetchComboDealDetail,
    TResult? Function(SearchKey searchKey)? search,
    TResult? Function(bool contain)? cartContainsCurrentCombo,
    TResult? Function()? clearSearch,
    TResult? Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealPrincipal,
    TResult? Function(ComboDeal comboDeal, List<String> principles)?
        loadMoreComboDealPrincipal,
    TResult? Function()? clearSelectedItem,
  }) {
    return updateItemQuantity?.call(item, qty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)?
        initialize,
    TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult Function(MaterialNumber item)? updateItemSelection,
    TResult Function(ComboDeal comboDeal, MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)?
        fetchComboDealDetail,
    TResult Function(SearchKey searchKey)? search,
    TResult Function(bool contain)? cartContainsCurrentCombo,
    TResult Function()? clearSearch,
    TResult Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealPrincipal,
    TResult Function(ComboDeal comboDeal, List<String> principles)?
        loadMoreComboDealPrincipal,
    TResult Function()? clearSelectedItem,
    required TResult orElse(),
  }) {
    if (updateItemQuantity != null) {
      return updateItemQuantity(item, qty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SetPriceInfo value) setPriceInfo,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_UpdateItemSelection value) updateItemSelection,
    required TResult Function(_FetchComboDealDetail value) fetchComboDealDetail,
    required TResult Function(_Search value) search,
    required TResult Function(_CartContainsCurrentCombo value)
        cartContainsCurrentCombo,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FetchComboDealPrincipal value)
        fetchComboDealPrincipal,
    required TResult Function(_LoadMoreComboDealPrincipal value)
        loadMoreComboDealPrincipal,
    required TResult Function(_ClearSelectedItem value) clearSelectedItem,
  }) {
    return updateItemQuantity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SetPriceInfo value)? setPriceInfo,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_UpdateItemSelection value)? updateItemSelection,
    TResult? Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult? Function(_Search value)? search,
    TResult? Function(_CartContainsCurrentCombo value)?
        cartContainsCurrentCombo,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FetchComboDealPrincipal value)? fetchComboDealPrincipal,
    TResult? Function(_LoadMoreComboDealPrincipal value)?
        loadMoreComboDealPrincipal,
    TResult? Function(_ClearSelectedItem value)? clearSelectedItem,
  }) {
    return updateItemQuantity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SetPriceInfo value)? setPriceInfo,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_UpdateItemSelection value)? updateItemSelection,
    TResult Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult Function(_Search value)? search,
    TResult Function(_CartContainsCurrentCombo value)? cartContainsCurrentCombo,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FetchComboDealPrincipal value)? fetchComboDealPrincipal,
    TResult Function(_LoadMoreComboDealPrincipal value)?
        loadMoreComboDealPrincipal,
    TResult Function(_ClearSelectedItem value)? clearSelectedItem,
    required TResult orElse(),
  }) {
    if (updateItemQuantity != null) {
      return updateItemQuantity(this);
    }
    return orElse();
  }
}

abstract class _UpdateItemQuantity implements ComboDealMaterialDetailEvent {
  const factory _UpdateItemQuantity(
      {required final MaterialNumber item,
      required final int qty}) = _$UpdateItemQuantityImpl;

  MaterialNumber get item;
  int get qty;
  @JsonKey(ignore: true)
  _$$UpdateItemQuantityImplCopyWith<_$UpdateItemQuantityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateItemSelectionImplCopyWith<$Res> {
  factory _$$UpdateItemSelectionImplCopyWith(_$UpdateItemSelectionImpl value,
          $Res Function(_$UpdateItemSelectionImpl) then) =
      __$$UpdateItemSelectionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialNumber item});
}

/// @nodoc
class __$$UpdateItemSelectionImplCopyWithImpl<$Res>
    extends _$ComboDealMaterialDetailEventCopyWithImpl<$Res,
        _$UpdateItemSelectionImpl>
    implements _$$UpdateItemSelectionImplCopyWith<$Res> {
  __$$UpdateItemSelectionImplCopyWithImpl(_$UpdateItemSelectionImpl _value,
      $Res Function(_$UpdateItemSelectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$UpdateItemSelectionImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
    ));
  }
}

/// @nodoc

class _$UpdateItemSelectionImpl implements _UpdateItemSelection {
  const _$UpdateItemSelectionImpl({required this.item});

  @override
  final MaterialNumber item;

  @override
  String toString() {
    return 'ComboDealMaterialDetailEvent.updateItemSelection(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateItemSelectionImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateItemSelectionImplCopyWith<_$UpdateItemSelectionImpl> get copyWith =>
      __$$UpdateItemSelectionImplCopyWithImpl<_$UpdateItemSelectionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)
        initialize,
    required TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)
        setPriceInfo,
    required TResult Function(MaterialNumber item, int qty) updateItemQuantity,
    required TResult Function(MaterialNumber item) updateItemSelection,
    required TResult Function(
            ComboDeal comboDeal,
            MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)
        fetchComboDealDetail,
    required TResult Function(SearchKey searchKey) search,
    required TResult Function(bool contain) cartContainsCurrentCombo,
    required TResult Function() clearSearch,
    required TResult Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)
        fetchComboDealPrincipal,
    required TResult Function(ComboDeal comboDeal, List<String> principles)
        loadMoreComboDealPrincipal,
    required TResult Function() clearSelectedItem,
  }) {
    return updateItemSelection(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)?
        initialize,
    TResult? Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult? Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult? Function(MaterialNumber item)? updateItemSelection,
    TResult? Function(ComboDeal comboDeal, MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)?
        fetchComboDealDetail,
    TResult? Function(SearchKey searchKey)? search,
    TResult? Function(bool contain)? cartContainsCurrentCombo,
    TResult? Function()? clearSearch,
    TResult? Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealPrincipal,
    TResult? Function(ComboDeal comboDeal, List<String> principles)?
        loadMoreComboDealPrincipal,
    TResult? Function()? clearSelectedItem,
  }) {
    return updateItemSelection?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)?
        initialize,
    TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult Function(MaterialNumber item)? updateItemSelection,
    TResult Function(ComboDeal comboDeal, MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)?
        fetchComboDealDetail,
    TResult Function(SearchKey searchKey)? search,
    TResult Function(bool contain)? cartContainsCurrentCombo,
    TResult Function()? clearSearch,
    TResult Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealPrincipal,
    TResult Function(ComboDeal comboDeal, List<String> principles)?
        loadMoreComboDealPrincipal,
    TResult Function()? clearSelectedItem,
    required TResult orElse(),
  }) {
    if (updateItemSelection != null) {
      return updateItemSelection(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SetPriceInfo value) setPriceInfo,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_UpdateItemSelection value) updateItemSelection,
    required TResult Function(_FetchComboDealDetail value) fetchComboDealDetail,
    required TResult Function(_Search value) search,
    required TResult Function(_CartContainsCurrentCombo value)
        cartContainsCurrentCombo,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FetchComboDealPrincipal value)
        fetchComboDealPrincipal,
    required TResult Function(_LoadMoreComboDealPrincipal value)
        loadMoreComboDealPrincipal,
    required TResult Function(_ClearSelectedItem value) clearSelectedItem,
  }) {
    return updateItemSelection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SetPriceInfo value)? setPriceInfo,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_UpdateItemSelection value)? updateItemSelection,
    TResult? Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult? Function(_Search value)? search,
    TResult? Function(_CartContainsCurrentCombo value)?
        cartContainsCurrentCombo,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FetchComboDealPrincipal value)? fetchComboDealPrincipal,
    TResult? Function(_LoadMoreComboDealPrincipal value)?
        loadMoreComboDealPrincipal,
    TResult? Function(_ClearSelectedItem value)? clearSelectedItem,
  }) {
    return updateItemSelection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SetPriceInfo value)? setPriceInfo,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_UpdateItemSelection value)? updateItemSelection,
    TResult Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult Function(_Search value)? search,
    TResult Function(_CartContainsCurrentCombo value)? cartContainsCurrentCombo,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FetchComboDealPrincipal value)? fetchComboDealPrincipal,
    TResult Function(_LoadMoreComboDealPrincipal value)?
        loadMoreComboDealPrincipal,
    TResult Function(_ClearSelectedItem value)? clearSelectedItem,
    required TResult orElse(),
  }) {
    if (updateItemSelection != null) {
      return updateItemSelection(this);
    }
    return orElse();
  }
}

abstract class _UpdateItemSelection implements ComboDealMaterialDetailEvent {
  const factory _UpdateItemSelection({required final MaterialNumber item}) =
      _$UpdateItemSelectionImpl;

  MaterialNumber get item;
  @JsonKey(ignore: true)
  _$$UpdateItemSelectionImplCopyWith<_$UpdateItemSelectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchComboDealDetailImplCopyWith<$Res> {
  factory _$$FetchComboDealDetailImplCopyWith(_$FetchComboDealDetailImpl value,
          $Res Function(_$FetchComboDealDetailImpl) then) =
      __$$FetchComboDealDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {ComboDeal comboDeal,
      MaterialNumber parentMaterialNumber,
      Map<MaterialNumber, int> comboMaterialsCurrentQuantity});

  $ComboDealCopyWith<$Res> get comboDeal;
}

/// @nodoc
class __$$FetchComboDealDetailImplCopyWithImpl<$Res>
    extends _$ComboDealMaterialDetailEventCopyWithImpl<$Res,
        _$FetchComboDealDetailImpl>
    implements _$$FetchComboDealDetailImplCopyWith<$Res> {
  __$$FetchComboDealDetailImplCopyWithImpl(_$FetchComboDealDetailImpl _value,
      $Res Function(_$FetchComboDealDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comboDeal = null,
    Object? parentMaterialNumber = null,
    Object? comboMaterialsCurrentQuantity = null,
  }) {
    return _then(_$FetchComboDealDetailImpl(
      comboDeal: null == comboDeal
          ? _value.comboDeal
          : comboDeal // ignore: cast_nullable_to_non_nullable
              as ComboDeal,
      parentMaterialNumber: null == parentMaterialNumber
          ? _value.parentMaterialNumber
          : parentMaterialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      comboMaterialsCurrentQuantity: null == comboMaterialsCurrentQuantity
          ? _value._comboMaterialsCurrentQuantity
          : comboMaterialsCurrentQuantity // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, int>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ComboDealCopyWith<$Res> get comboDeal {
    return $ComboDealCopyWith<$Res>(_value.comboDeal, (value) {
      return _then(_value.copyWith(comboDeal: value));
    });
  }
}

/// @nodoc

class _$FetchComboDealDetailImpl implements _FetchComboDealDetail {
  const _$FetchComboDealDetailImpl(
      {required this.comboDeal,
      required this.parentMaterialNumber,
      required final Map<MaterialNumber, int> comboMaterialsCurrentQuantity})
      : _comboMaterialsCurrentQuantity = comboMaterialsCurrentQuantity;

  @override
  final ComboDeal comboDeal;
  @override
  final MaterialNumber parentMaterialNumber;
  final Map<MaterialNumber, int> _comboMaterialsCurrentQuantity;
  @override
  Map<MaterialNumber, int> get comboMaterialsCurrentQuantity {
    if (_comboMaterialsCurrentQuantity is EqualUnmodifiableMapView)
      return _comboMaterialsCurrentQuantity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_comboMaterialsCurrentQuantity);
  }

  @override
  String toString() {
    return 'ComboDealMaterialDetailEvent.fetchComboDealDetail(comboDeal: $comboDeal, parentMaterialNumber: $parentMaterialNumber, comboMaterialsCurrentQuantity: $comboMaterialsCurrentQuantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchComboDealDetailImpl &&
            (identical(other.comboDeal, comboDeal) ||
                other.comboDeal == comboDeal) &&
            (identical(other.parentMaterialNumber, parentMaterialNumber) ||
                other.parentMaterialNumber == parentMaterialNumber) &&
            const DeepCollectionEquality().equals(
                other._comboMaterialsCurrentQuantity,
                _comboMaterialsCurrentQuantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, comboDeal, parentMaterialNumber,
      const DeepCollectionEquality().hash(_comboMaterialsCurrentQuantity));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchComboDealDetailImplCopyWith<_$FetchComboDealDetailImpl>
      get copyWith =>
          __$$FetchComboDealDetailImplCopyWithImpl<_$FetchComboDealDetailImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)
        initialize,
    required TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)
        setPriceInfo,
    required TResult Function(MaterialNumber item, int qty) updateItemQuantity,
    required TResult Function(MaterialNumber item) updateItemSelection,
    required TResult Function(
            ComboDeal comboDeal,
            MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)
        fetchComboDealDetail,
    required TResult Function(SearchKey searchKey) search,
    required TResult Function(bool contain) cartContainsCurrentCombo,
    required TResult Function() clearSearch,
    required TResult Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)
        fetchComboDealPrincipal,
    required TResult Function(ComboDeal comboDeal, List<String> principles)
        loadMoreComboDealPrincipal,
    required TResult Function() clearSelectedItem,
  }) {
    return fetchComboDealDetail(
        comboDeal, parentMaterialNumber, comboMaterialsCurrentQuantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)?
        initialize,
    TResult? Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult? Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult? Function(MaterialNumber item)? updateItemSelection,
    TResult? Function(ComboDeal comboDeal, MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)?
        fetchComboDealDetail,
    TResult? Function(SearchKey searchKey)? search,
    TResult? Function(bool contain)? cartContainsCurrentCombo,
    TResult? Function()? clearSearch,
    TResult? Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealPrincipal,
    TResult? Function(ComboDeal comboDeal, List<String> principles)?
        loadMoreComboDealPrincipal,
    TResult? Function()? clearSelectedItem,
  }) {
    return fetchComboDealDetail?.call(
        comboDeal, parentMaterialNumber, comboMaterialsCurrentQuantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)?
        initialize,
    TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult Function(MaterialNumber item)? updateItemSelection,
    TResult Function(ComboDeal comboDeal, MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)?
        fetchComboDealDetail,
    TResult Function(SearchKey searchKey)? search,
    TResult Function(bool contain)? cartContainsCurrentCombo,
    TResult Function()? clearSearch,
    TResult Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealPrincipal,
    TResult Function(ComboDeal comboDeal, List<String> principles)?
        loadMoreComboDealPrincipal,
    TResult Function()? clearSelectedItem,
    required TResult orElse(),
  }) {
    if (fetchComboDealDetail != null) {
      return fetchComboDealDetail(
          comboDeal, parentMaterialNumber, comboMaterialsCurrentQuantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SetPriceInfo value) setPriceInfo,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_UpdateItemSelection value) updateItemSelection,
    required TResult Function(_FetchComboDealDetail value) fetchComboDealDetail,
    required TResult Function(_Search value) search,
    required TResult Function(_CartContainsCurrentCombo value)
        cartContainsCurrentCombo,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FetchComboDealPrincipal value)
        fetchComboDealPrincipal,
    required TResult Function(_LoadMoreComboDealPrincipal value)
        loadMoreComboDealPrincipal,
    required TResult Function(_ClearSelectedItem value) clearSelectedItem,
  }) {
    return fetchComboDealDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SetPriceInfo value)? setPriceInfo,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_UpdateItemSelection value)? updateItemSelection,
    TResult? Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult? Function(_Search value)? search,
    TResult? Function(_CartContainsCurrentCombo value)?
        cartContainsCurrentCombo,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FetchComboDealPrincipal value)? fetchComboDealPrincipal,
    TResult? Function(_LoadMoreComboDealPrincipal value)?
        loadMoreComboDealPrincipal,
    TResult? Function(_ClearSelectedItem value)? clearSelectedItem,
  }) {
    return fetchComboDealDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SetPriceInfo value)? setPriceInfo,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_UpdateItemSelection value)? updateItemSelection,
    TResult Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult Function(_Search value)? search,
    TResult Function(_CartContainsCurrentCombo value)? cartContainsCurrentCombo,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FetchComboDealPrincipal value)? fetchComboDealPrincipal,
    TResult Function(_LoadMoreComboDealPrincipal value)?
        loadMoreComboDealPrincipal,
    TResult Function(_ClearSelectedItem value)? clearSelectedItem,
    required TResult orElse(),
  }) {
    if (fetchComboDealDetail != null) {
      return fetchComboDealDetail(this);
    }
    return orElse();
  }
}

abstract class _FetchComboDealDetail implements ComboDealMaterialDetailEvent {
  const factory _FetchComboDealDetail(
      {required final ComboDeal comboDeal,
      required final MaterialNumber parentMaterialNumber,
      required final Map<MaterialNumber, int>
          comboMaterialsCurrentQuantity}) = _$FetchComboDealDetailImpl;

  ComboDeal get comboDeal;
  MaterialNumber get parentMaterialNumber;
  Map<MaterialNumber, int> get comboMaterialsCurrentQuantity;
  @JsonKey(ignore: true)
  _$$FetchComboDealDetailImplCopyWith<_$FetchComboDealDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchImplCopyWith<$Res> {
  factory _$$SearchImplCopyWith(
          _$SearchImpl value, $Res Function(_$SearchImpl) then) =
      __$$SearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SearchKey searchKey});
}

/// @nodoc
class __$$SearchImplCopyWithImpl<$Res>
    extends _$ComboDealMaterialDetailEventCopyWithImpl<$Res, _$SearchImpl>
    implements _$$SearchImplCopyWith<$Res> {
  __$$SearchImplCopyWithImpl(
      _$SearchImpl _value, $Res Function(_$SearchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchKey = null,
  }) {
    return _then(_$SearchImpl(
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }
}

/// @nodoc

class _$SearchImpl implements _Search {
  const _$SearchImpl({required this.searchKey});

  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'ComboDealMaterialDetailEvent.search(searchKey: $searchKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchImpl &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      __$$SearchImplCopyWithImpl<_$SearchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)
        initialize,
    required TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)
        setPriceInfo,
    required TResult Function(MaterialNumber item, int qty) updateItemQuantity,
    required TResult Function(MaterialNumber item) updateItemSelection,
    required TResult Function(
            ComboDeal comboDeal,
            MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)
        fetchComboDealDetail,
    required TResult Function(SearchKey searchKey) search,
    required TResult Function(bool contain) cartContainsCurrentCombo,
    required TResult Function() clearSearch,
    required TResult Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)
        fetchComboDealPrincipal,
    required TResult Function(ComboDeal comboDeal, List<String> principles)
        loadMoreComboDealPrincipal,
    required TResult Function() clearSelectedItem,
  }) {
    return search(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)?
        initialize,
    TResult? Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult? Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult? Function(MaterialNumber item)? updateItemSelection,
    TResult? Function(ComboDeal comboDeal, MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)?
        fetchComboDealDetail,
    TResult? Function(SearchKey searchKey)? search,
    TResult? Function(bool contain)? cartContainsCurrentCombo,
    TResult? Function()? clearSearch,
    TResult? Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealPrincipal,
    TResult? Function(ComboDeal comboDeal, List<String> principles)?
        loadMoreComboDealPrincipal,
    TResult? Function()? clearSelectedItem,
  }) {
    return search?.call(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)?
        initialize,
    TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult Function(MaterialNumber item)? updateItemSelection,
    TResult Function(ComboDeal comboDeal, MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)?
        fetchComboDealDetail,
    TResult Function(SearchKey searchKey)? search,
    TResult Function(bool contain)? cartContainsCurrentCombo,
    TResult Function()? clearSearch,
    TResult Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealPrincipal,
    TResult Function(ComboDeal comboDeal, List<String> principles)?
        loadMoreComboDealPrincipal,
    TResult Function()? clearSelectedItem,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(searchKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SetPriceInfo value) setPriceInfo,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_UpdateItemSelection value) updateItemSelection,
    required TResult Function(_FetchComboDealDetail value) fetchComboDealDetail,
    required TResult Function(_Search value) search,
    required TResult Function(_CartContainsCurrentCombo value)
        cartContainsCurrentCombo,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FetchComboDealPrincipal value)
        fetchComboDealPrincipal,
    required TResult Function(_LoadMoreComboDealPrincipal value)
        loadMoreComboDealPrincipal,
    required TResult Function(_ClearSelectedItem value) clearSelectedItem,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SetPriceInfo value)? setPriceInfo,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_UpdateItemSelection value)? updateItemSelection,
    TResult? Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult? Function(_Search value)? search,
    TResult? Function(_CartContainsCurrentCombo value)?
        cartContainsCurrentCombo,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FetchComboDealPrincipal value)? fetchComboDealPrincipal,
    TResult? Function(_LoadMoreComboDealPrincipal value)?
        loadMoreComboDealPrincipal,
    TResult? Function(_ClearSelectedItem value)? clearSelectedItem,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SetPriceInfo value)? setPriceInfo,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_UpdateItemSelection value)? updateItemSelection,
    TResult Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult Function(_Search value)? search,
    TResult Function(_CartContainsCurrentCombo value)? cartContainsCurrentCombo,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FetchComboDealPrincipal value)? fetchComboDealPrincipal,
    TResult Function(_LoadMoreComboDealPrincipal value)?
        loadMoreComboDealPrincipal,
    TResult Function(_ClearSelectedItem value)? clearSelectedItem,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class _Search implements ComboDealMaterialDetailEvent {
  const factory _Search({required final SearchKey searchKey}) = _$SearchImpl;

  SearchKey get searchKey;
  @JsonKey(ignore: true)
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CartContainsCurrentComboImplCopyWith<$Res> {
  factory _$$CartContainsCurrentComboImplCopyWith(
          _$CartContainsCurrentComboImpl value,
          $Res Function(_$CartContainsCurrentComboImpl) then) =
      __$$CartContainsCurrentComboImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool contain});
}

/// @nodoc
class __$$CartContainsCurrentComboImplCopyWithImpl<$Res>
    extends _$ComboDealMaterialDetailEventCopyWithImpl<$Res,
        _$CartContainsCurrentComboImpl>
    implements _$$CartContainsCurrentComboImplCopyWith<$Res> {
  __$$CartContainsCurrentComboImplCopyWithImpl(
      _$CartContainsCurrentComboImpl _value,
      $Res Function(_$CartContainsCurrentComboImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contain = null,
  }) {
    return _then(_$CartContainsCurrentComboImpl(
      contain: null == contain
          ? _value.contain
          : contain // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CartContainsCurrentComboImpl implements _CartContainsCurrentCombo {
  const _$CartContainsCurrentComboImpl({required this.contain});

  @override
  final bool contain;

  @override
  String toString() {
    return 'ComboDealMaterialDetailEvent.cartContainsCurrentCombo(contain: $contain)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartContainsCurrentComboImpl &&
            (identical(other.contain, contain) || other.contain == contain));
  }

  @override
  int get hashCode => Object.hash(runtimeType, contain);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartContainsCurrentComboImplCopyWith<_$CartContainsCurrentComboImpl>
      get copyWith => __$$CartContainsCurrentComboImplCopyWithImpl<
          _$CartContainsCurrentComboImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)
        initialize,
    required TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)
        setPriceInfo,
    required TResult Function(MaterialNumber item, int qty) updateItemQuantity,
    required TResult Function(MaterialNumber item) updateItemSelection,
    required TResult Function(
            ComboDeal comboDeal,
            MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)
        fetchComboDealDetail,
    required TResult Function(SearchKey searchKey) search,
    required TResult Function(bool contain) cartContainsCurrentCombo,
    required TResult Function() clearSearch,
    required TResult Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)
        fetchComboDealPrincipal,
    required TResult Function(ComboDeal comboDeal, List<String> principles)
        loadMoreComboDealPrincipal,
    required TResult Function() clearSelectedItem,
  }) {
    return cartContainsCurrentCombo(contain);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)?
        initialize,
    TResult? Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult? Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult? Function(MaterialNumber item)? updateItemSelection,
    TResult? Function(ComboDeal comboDeal, MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)?
        fetchComboDealDetail,
    TResult? Function(SearchKey searchKey)? search,
    TResult? Function(bool contain)? cartContainsCurrentCombo,
    TResult? Function()? clearSearch,
    TResult? Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealPrincipal,
    TResult? Function(ComboDeal comboDeal, List<String> principles)?
        loadMoreComboDealPrincipal,
    TResult? Function()? clearSelectedItem,
  }) {
    return cartContainsCurrentCombo?.call(contain);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)?
        initialize,
    TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult Function(MaterialNumber item)? updateItemSelection,
    TResult Function(ComboDeal comboDeal, MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)?
        fetchComboDealDetail,
    TResult Function(SearchKey searchKey)? search,
    TResult Function(bool contain)? cartContainsCurrentCombo,
    TResult Function()? clearSearch,
    TResult Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealPrincipal,
    TResult Function(ComboDeal comboDeal, List<String> principles)?
        loadMoreComboDealPrincipal,
    TResult Function()? clearSelectedItem,
    required TResult orElse(),
  }) {
    if (cartContainsCurrentCombo != null) {
      return cartContainsCurrentCombo(contain);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SetPriceInfo value) setPriceInfo,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_UpdateItemSelection value) updateItemSelection,
    required TResult Function(_FetchComboDealDetail value) fetchComboDealDetail,
    required TResult Function(_Search value) search,
    required TResult Function(_CartContainsCurrentCombo value)
        cartContainsCurrentCombo,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FetchComboDealPrincipal value)
        fetchComboDealPrincipal,
    required TResult Function(_LoadMoreComboDealPrincipal value)
        loadMoreComboDealPrincipal,
    required TResult Function(_ClearSelectedItem value) clearSelectedItem,
  }) {
    return cartContainsCurrentCombo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SetPriceInfo value)? setPriceInfo,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_UpdateItemSelection value)? updateItemSelection,
    TResult? Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult? Function(_Search value)? search,
    TResult? Function(_CartContainsCurrentCombo value)?
        cartContainsCurrentCombo,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FetchComboDealPrincipal value)? fetchComboDealPrincipal,
    TResult? Function(_LoadMoreComboDealPrincipal value)?
        loadMoreComboDealPrincipal,
    TResult? Function(_ClearSelectedItem value)? clearSelectedItem,
  }) {
    return cartContainsCurrentCombo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SetPriceInfo value)? setPriceInfo,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_UpdateItemSelection value)? updateItemSelection,
    TResult Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult Function(_Search value)? search,
    TResult Function(_CartContainsCurrentCombo value)? cartContainsCurrentCombo,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FetchComboDealPrincipal value)? fetchComboDealPrincipal,
    TResult Function(_LoadMoreComboDealPrincipal value)?
        loadMoreComboDealPrincipal,
    TResult Function(_ClearSelectedItem value)? clearSelectedItem,
    required TResult orElse(),
  }) {
    if (cartContainsCurrentCombo != null) {
      return cartContainsCurrentCombo(this);
    }
    return orElse();
  }
}

abstract class _CartContainsCurrentCombo
    implements ComboDealMaterialDetailEvent {
  const factory _CartContainsCurrentCombo({required final bool contain}) =
      _$CartContainsCurrentComboImpl;

  bool get contain;
  @JsonKey(ignore: true)
  _$$CartContainsCurrentComboImplCopyWith<_$CartContainsCurrentComboImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearSearchImplCopyWith<$Res> {
  factory _$$ClearSearchImplCopyWith(
          _$ClearSearchImpl value, $Res Function(_$ClearSearchImpl) then) =
      __$$ClearSearchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSearchImplCopyWithImpl<$Res>
    extends _$ComboDealMaterialDetailEventCopyWithImpl<$Res, _$ClearSearchImpl>
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
    return 'ComboDealMaterialDetailEvent.clearSearch()';
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
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)
        initialize,
    required TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)
        setPriceInfo,
    required TResult Function(MaterialNumber item, int qty) updateItemQuantity,
    required TResult Function(MaterialNumber item) updateItemSelection,
    required TResult Function(
            ComboDeal comboDeal,
            MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)
        fetchComboDealDetail,
    required TResult Function(SearchKey searchKey) search,
    required TResult Function(bool contain) cartContainsCurrentCombo,
    required TResult Function() clearSearch,
    required TResult Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)
        fetchComboDealPrincipal,
    required TResult Function(ComboDeal comboDeal, List<String> principles)
        loadMoreComboDealPrincipal,
    required TResult Function() clearSelectedItem,
  }) {
    return clearSearch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)?
        initialize,
    TResult? Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult? Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult? Function(MaterialNumber item)? updateItemSelection,
    TResult? Function(ComboDeal comboDeal, MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)?
        fetchComboDealDetail,
    TResult? Function(SearchKey searchKey)? search,
    TResult? Function(bool contain)? cartContainsCurrentCombo,
    TResult? Function()? clearSearch,
    TResult? Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealPrincipal,
    TResult? Function(ComboDeal comboDeal, List<String> principles)?
        loadMoreComboDealPrincipal,
    TResult? Function()? clearSelectedItem,
  }) {
    return clearSearch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)?
        initialize,
    TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult Function(MaterialNumber item)? updateItemSelection,
    TResult Function(ComboDeal comboDeal, MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)?
        fetchComboDealDetail,
    TResult Function(SearchKey searchKey)? search,
    TResult Function(bool contain)? cartContainsCurrentCombo,
    TResult Function()? clearSearch,
    TResult Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealPrincipal,
    TResult Function(ComboDeal comboDeal, List<String> principles)?
        loadMoreComboDealPrincipal,
    TResult Function()? clearSelectedItem,
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
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SetPriceInfo value) setPriceInfo,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_UpdateItemSelection value) updateItemSelection,
    required TResult Function(_FetchComboDealDetail value) fetchComboDealDetail,
    required TResult Function(_Search value) search,
    required TResult Function(_CartContainsCurrentCombo value)
        cartContainsCurrentCombo,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FetchComboDealPrincipal value)
        fetchComboDealPrincipal,
    required TResult Function(_LoadMoreComboDealPrincipal value)
        loadMoreComboDealPrincipal,
    required TResult Function(_ClearSelectedItem value) clearSelectedItem,
  }) {
    return clearSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SetPriceInfo value)? setPriceInfo,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_UpdateItemSelection value)? updateItemSelection,
    TResult? Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult? Function(_Search value)? search,
    TResult? Function(_CartContainsCurrentCombo value)?
        cartContainsCurrentCombo,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FetchComboDealPrincipal value)? fetchComboDealPrincipal,
    TResult? Function(_LoadMoreComboDealPrincipal value)?
        loadMoreComboDealPrincipal,
    TResult? Function(_ClearSelectedItem value)? clearSelectedItem,
  }) {
    return clearSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SetPriceInfo value)? setPriceInfo,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_UpdateItemSelection value)? updateItemSelection,
    TResult Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult Function(_Search value)? search,
    TResult Function(_CartContainsCurrentCombo value)? cartContainsCurrentCombo,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FetchComboDealPrincipal value)? fetchComboDealPrincipal,
    TResult Function(_LoadMoreComboDealPrincipal value)?
        loadMoreComboDealPrincipal,
    TResult Function(_ClearSelectedItem value)? clearSelectedItem,
    required TResult orElse(),
  }) {
    if (clearSearch != null) {
      return clearSearch(this);
    }
    return orElse();
  }
}

abstract class _ClearSearch implements ComboDealMaterialDetailEvent {
  const factory _ClearSearch() = _$ClearSearchImpl;
}

/// @nodoc
abstract class _$$FetchComboDealPrincipalImplCopyWith<$Res> {
  factory _$$FetchComboDealPrincipalImplCopyWith(
          _$FetchComboDealPrincipalImpl value,
          $Res Function(_$FetchComboDealPrincipalImpl) then) =
      __$$FetchComboDealPrincipalImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {ComboDeal comboDeal,
      Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
      List<String> principles,
      MaterialNumber parentMaterialNumber});

  $ComboDealCopyWith<$Res> get comboDeal;
}

/// @nodoc
class __$$FetchComboDealPrincipalImplCopyWithImpl<$Res>
    extends _$ComboDealMaterialDetailEventCopyWithImpl<$Res,
        _$FetchComboDealPrincipalImpl>
    implements _$$FetchComboDealPrincipalImplCopyWith<$Res> {
  __$$FetchComboDealPrincipalImplCopyWithImpl(
      _$FetchComboDealPrincipalImpl _value,
      $Res Function(_$FetchComboDealPrincipalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comboDeal = null,
    Object? comboMaterialsCurrentQuantity = null,
    Object? principles = null,
    Object? parentMaterialNumber = null,
  }) {
    return _then(_$FetchComboDealPrincipalImpl(
      comboDeal: null == comboDeal
          ? _value.comboDeal
          : comboDeal // ignore: cast_nullable_to_non_nullable
              as ComboDeal,
      comboMaterialsCurrentQuantity: null == comboMaterialsCurrentQuantity
          ? _value._comboMaterialsCurrentQuantity
          : comboMaterialsCurrentQuantity // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, int>,
      principles: null == principles
          ? _value._principles
          : principles // ignore: cast_nullable_to_non_nullable
              as List<String>,
      parentMaterialNumber: null == parentMaterialNumber
          ? _value.parentMaterialNumber
          : parentMaterialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ComboDealCopyWith<$Res> get comboDeal {
    return $ComboDealCopyWith<$Res>(_value.comboDeal, (value) {
      return _then(_value.copyWith(comboDeal: value));
    });
  }
}

/// @nodoc

class _$FetchComboDealPrincipalImpl implements _FetchComboDealPrincipal {
  const _$FetchComboDealPrincipalImpl(
      {required this.comboDeal,
      required final Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
      required final List<String> principles,
      required this.parentMaterialNumber})
      : _comboMaterialsCurrentQuantity = comboMaterialsCurrentQuantity,
        _principles = principles;

  @override
  final ComboDeal comboDeal;
  final Map<MaterialNumber, int> _comboMaterialsCurrentQuantity;
  @override
  Map<MaterialNumber, int> get comboMaterialsCurrentQuantity {
    if (_comboMaterialsCurrentQuantity is EqualUnmodifiableMapView)
      return _comboMaterialsCurrentQuantity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_comboMaterialsCurrentQuantity);
  }

  final List<String> _principles;
  @override
  List<String> get principles {
    if (_principles is EqualUnmodifiableListView) return _principles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_principles);
  }

  @override
  final MaterialNumber parentMaterialNumber;

  @override
  String toString() {
    return 'ComboDealMaterialDetailEvent.fetchComboDealPrincipal(comboDeal: $comboDeal, comboMaterialsCurrentQuantity: $comboMaterialsCurrentQuantity, principles: $principles, parentMaterialNumber: $parentMaterialNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchComboDealPrincipalImpl &&
            (identical(other.comboDeal, comboDeal) ||
                other.comboDeal == comboDeal) &&
            const DeepCollectionEquality().equals(
                other._comboMaterialsCurrentQuantity,
                _comboMaterialsCurrentQuantity) &&
            const DeepCollectionEquality()
                .equals(other._principles, _principles) &&
            (identical(other.parentMaterialNumber, parentMaterialNumber) ||
                other.parentMaterialNumber == parentMaterialNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      comboDeal,
      const DeepCollectionEquality().hash(_comboMaterialsCurrentQuantity),
      const DeepCollectionEquality().hash(_principles),
      parentMaterialNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchComboDealPrincipalImplCopyWith<_$FetchComboDealPrincipalImpl>
      get copyWith => __$$FetchComboDealPrincipalImplCopyWithImpl<
          _$FetchComboDealPrincipalImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)
        initialize,
    required TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)
        setPriceInfo,
    required TResult Function(MaterialNumber item, int qty) updateItemQuantity,
    required TResult Function(MaterialNumber item) updateItemSelection,
    required TResult Function(
            ComboDeal comboDeal,
            MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)
        fetchComboDealDetail,
    required TResult Function(SearchKey searchKey) search,
    required TResult Function(bool contain) cartContainsCurrentCombo,
    required TResult Function() clearSearch,
    required TResult Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)
        fetchComboDealPrincipal,
    required TResult Function(ComboDeal comboDeal, List<String> principles)
        loadMoreComboDealPrincipal,
    required TResult Function() clearSelectedItem,
  }) {
    return fetchComboDealPrincipal(comboDeal, comboMaterialsCurrentQuantity,
        principles, parentMaterialNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)?
        initialize,
    TResult? Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult? Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult? Function(MaterialNumber item)? updateItemSelection,
    TResult? Function(ComboDeal comboDeal, MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)?
        fetchComboDealDetail,
    TResult? Function(SearchKey searchKey)? search,
    TResult? Function(bool contain)? cartContainsCurrentCombo,
    TResult? Function()? clearSearch,
    TResult? Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealPrincipal,
    TResult? Function(ComboDeal comboDeal, List<String> principles)?
        loadMoreComboDealPrincipal,
    TResult? Function()? clearSelectedItem,
  }) {
    return fetchComboDealPrincipal?.call(comboDeal,
        comboMaterialsCurrentQuantity, principles, parentMaterialNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)?
        initialize,
    TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult Function(MaterialNumber item)? updateItemSelection,
    TResult Function(ComboDeal comboDeal, MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)?
        fetchComboDealDetail,
    TResult Function(SearchKey searchKey)? search,
    TResult Function(bool contain)? cartContainsCurrentCombo,
    TResult Function()? clearSearch,
    TResult Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealPrincipal,
    TResult Function(ComboDeal comboDeal, List<String> principles)?
        loadMoreComboDealPrincipal,
    TResult Function()? clearSelectedItem,
    required TResult orElse(),
  }) {
    if (fetchComboDealPrincipal != null) {
      return fetchComboDealPrincipal(comboDeal, comboMaterialsCurrentQuantity,
          principles, parentMaterialNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SetPriceInfo value) setPriceInfo,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_UpdateItemSelection value) updateItemSelection,
    required TResult Function(_FetchComboDealDetail value) fetchComboDealDetail,
    required TResult Function(_Search value) search,
    required TResult Function(_CartContainsCurrentCombo value)
        cartContainsCurrentCombo,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FetchComboDealPrincipal value)
        fetchComboDealPrincipal,
    required TResult Function(_LoadMoreComboDealPrincipal value)
        loadMoreComboDealPrincipal,
    required TResult Function(_ClearSelectedItem value) clearSelectedItem,
  }) {
    return fetchComboDealPrincipal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SetPriceInfo value)? setPriceInfo,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_UpdateItemSelection value)? updateItemSelection,
    TResult? Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult? Function(_Search value)? search,
    TResult? Function(_CartContainsCurrentCombo value)?
        cartContainsCurrentCombo,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FetchComboDealPrincipal value)? fetchComboDealPrincipal,
    TResult? Function(_LoadMoreComboDealPrincipal value)?
        loadMoreComboDealPrincipal,
    TResult? Function(_ClearSelectedItem value)? clearSelectedItem,
  }) {
    return fetchComboDealPrincipal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SetPriceInfo value)? setPriceInfo,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_UpdateItemSelection value)? updateItemSelection,
    TResult Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult Function(_Search value)? search,
    TResult Function(_CartContainsCurrentCombo value)? cartContainsCurrentCombo,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FetchComboDealPrincipal value)? fetchComboDealPrincipal,
    TResult Function(_LoadMoreComboDealPrincipal value)?
        loadMoreComboDealPrincipal,
    TResult Function(_ClearSelectedItem value)? clearSelectedItem,
    required TResult orElse(),
  }) {
    if (fetchComboDealPrincipal != null) {
      return fetchComboDealPrincipal(this);
    }
    return orElse();
  }
}

abstract class _FetchComboDealPrincipal
    implements ComboDealMaterialDetailEvent {
  const factory _FetchComboDealPrincipal(
          {required final ComboDeal comboDeal,
          required final Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
          required final List<String> principles,
          required final MaterialNumber parentMaterialNumber}) =
      _$FetchComboDealPrincipalImpl;

  ComboDeal get comboDeal;
  Map<MaterialNumber, int> get comboMaterialsCurrentQuantity;
  List<String> get principles;
  MaterialNumber get parentMaterialNumber;
  @JsonKey(ignore: true)
  _$$FetchComboDealPrincipalImplCopyWith<_$FetchComboDealPrincipalImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreComboDealPrincipalImplCopyWith<$Res> {
  factory _$$LoadMoreComboDealPrincipalImplCopyWith(
          _$LoadMoreComboDealPrincipalImpl value,
          $Res Function(_$LoadMoreComboDealPrincipalImpl) then) =
      __$$LoadMoreComboDealPrincipalImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ComboDeal comboDeal, List<String> principles});

  $ComboDealCopyWith<$Res> get comboDeal;
}

/// @nodoc
class __$$LoadMoreComboDealPrincipalImplCopyWithImpl<$Res>
    extends _$ComboDealMaterialDetailEventCopyWithImpl<$Res,
        _$LoadMoreComboDealPrincipalImpl>
    implements _$$LoadMoreComboDealPrincipalImplCopyWith<$Res> {
  __$$LoadMoreComboDealPrincipalImplCopyWithImpl(
      _$LoadMoreComboDealPrincipalImpl _value,
      $Res Function(_$LoadMoreComboDealPrincipalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comboDeal = null,
    Object? principles = null,
  }) {
    return _then(_$LoadMoreComboDealPrincipalImpl(
      comboDeal: null == comboDeal
          ? _value.comboDeal
          : comboDeal // ignore: cast_nullable_to_non_nullable
              as ComboDeal,
      principles: null == principles
          ? _value._principles
          : principles // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ComboDealCopyWith<$Res> get comboDeal {
    return $ComboDealCopyWith<$Res>(_value.comboDeal, (value) {
      return _then(_value.copyWith(comboDeal: value));
    });
  }
}

/// @nodoc

class _$LoadMoreComboDealPrincipalImpl implements _LoadMoreComboDealPrincipal {
  const _$LoadMoreComboDealPrincipalImpl(
      {required this.comboDeal, required final List<String> principles})
      : _principles = principles;

  @override
  final ComboDeal comboDeal;
  final List<String> _principles;
  @override
  List<String> get principles {
    if (_principles is EqualUnmodifiableListView) return _principles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_principles);
  }

  @override
  String toString() {
    return 'ComboDealMaterialDetailEvent.loadMoreComboDealPrincipal(comboDeal: $comboDeal, principles: $principles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMoreComboDealPrincipalImpl &&
            (identical(other.comboDeal, comboDeal) ||
                other.comboDeal == comboDeal) &&
            const DeepCollectionEquality()
                .equals(other._principles, _principles));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, comboDeal, const DeepCollectionEquality().hash(_principles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadMoreComboDealPrincipalImplCopyWith<_$LoadMoreComboDealPrincipalImpl>
      get copyWith => __$$LoadMoreComboDealPrincipalImplCopyWithImpl<
          _$LoadMoreComboDealPrincipalImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)
        initialize,
    required TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)
        setPriceInfo,
    required TResult Function(MaterialNumber item, int qty) updateItemQuantity,
    required TResult Function(MaterialNumber item) updateItemSelection,
    required TResult Function(
            ComboDeal comboDeal,
            MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)
        fetchComboDealDetail,
    required TResult Function(SearchKey searchKey) search,
    required TResult Function(bool contain) cartContainsCurrentCombo,
    required TResult Function() clearSearch,
    required TResult Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)
        fetchComboDealPrincipal,
    required TResult Function(ComboDeal comboDeal, List<String> principles)
        loadMoreComboDealPrincipal,
    required TResult Function() clearSelectedItem,
  }) {
    return loadMoreComboDealPrincipal(comboDeal, principles);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)?
        initialize,
    TResult? Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult? Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult? Function(MaterialNumber item)? updateItemSelection,
    TResult? Function(ComboDeal comboDeal, MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)?
        fetchComboDealDetail,
    TResult? Function(SearchKey searchKey)? search,
    TResult? Function(bool contain)? cartContainsCurrentCombo,
    TResult? Function()? clearSearch,
    TResult? Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealPrincipal,
    TResult? Function(ComboDeal comboDeal, List<String> principles)?
        loadMoreComboDealPrincipal,
    TResult? Function()? clearSelectedItem,
  }) {
    return loadMoreComboDealPrincipal?.call(comboDeal, principles);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)?
        initialize,
    TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult Function(MaterialNumber item)? updateItemSelection,
    TResult Function(ComboDeal comboDeal, MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)?
        fetchComboDealDetail,
    TResult Function(SearchKey searchKey)? search,
    TResult Function(bool contain)? cartContainsCurrentCombo,
    TResult Function()? clearSearch,
    TResult Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealPrincipal,
    TResult Function(ComboDeal comboDeal, List<String> principles)?
        loadMoreComboDealPrincipal,
    TResult Function()? clearSelectedItem,
    required TResult orElse(),
  }) {
    if (loadMoreComboDealPrincipal != null) {
      return loadMoreComboDealPrincipal(comboDeal, principles);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SetPriceInfo value) setPriceInfo,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_UpdateItemSelection value) updateItemSelection,
    required TResult Function(_FetchComboDealDetail value) fetchComboDealDetail,
    required TResult Function(_Search value) search,
    required TResult Function(_CartContainsCurrentCombo value)
        cartContainsCurrentCombo,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FetchComboDealPrincipal value)
        fetchComboDealPrincipal,
    required TResult Function(_LoadMoreComboDealPrincipal value)
        loadMoreComboDealPrincipal,
    required TResult Function(_ClearSelectedItem value) clearSelectedItem,
  }) {
    return loadMoreComboDealPrincipal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SetPriceInfo value)? setPriceInfo,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_UpdateItemSelection value)? updateItemSelection,
    TResult? Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult? Function(_Search value)? search,
    TResult? Function(_CartContainsCurrentCombo value)?
        cartContainsCurrentCombo,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FetchComboDealPrincipal value)? fetchComboDealPrincipal,
    TResult? Function(_LoadMoreComboDealPrincipal value)?
        loadMoreComboDealPrincipal,
    TResult? Function(_ClearSelectedItem value)? clearSelectedItem,
  }) {
    return loadMoreComboDealPrincipal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SetPriceInfo value)? setPriceInfo,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_UpdateItemSelection value)? updateItemSelection,
    TResult Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult Function(_Search value)? search,
    TResult Function(_CartContainsCurrentCombo value)? cartContainsCurrentCombo,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FetchComboDealPrincipal value)? fetchComboDealPrincipal,
    TResult Function(_LoadMoreComboDealPrincipal value)?
        loadMoreComboDealPrincipal,
    TResult Function(_ClearSelectedItem value)? clearSelectedItem,
    required TResult orElse(),
  }) {
    if (loadMoreComboDealPrincipal != null) {
      return loadMoreComboDealPrincipal(this);
    }
    return orElse();
  }
}

abstract class _LoadMoreComboDealPrincipal
    implements ComboDealMaterialDetailEvent {
  const factory _LoadMoreComboDealPrincipal(
          {required final ComboDeal comboDeal,
          required final List<String> principles}) =
      _$LoadMoreComboDealPrincipalImpl;

  ComboDeal get comboDeal;
  List<String> get principles;
  @JsonKey(ignore: true)
  _$$LoadMoreComboDealPrincipalImplCopyWith<_$LoadMoreComboDealPrincipalImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearSelectedItemImplCopyWith<$Res> {
  factory _$$ClearSelectedItemImplCopyWith(_$ClearSelectedItemImpl value,
          $Res Function(_$ClearSelectedItemImpl) then) =
      __$$ClearSelectedItemImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSelectedItemImplCopyWithImpl<$Res>
    extends _$ComboDealMaterialDetailEventCopyWithImpl<$Res,
        _$ClearSelectedItemImpl>
    implements _$$ClearSelectedItemImplCopyWith<$Res> {
  __$$ClearSelectedItemImplCopyWithImpl(_$ClearSelectedItemImpl _value,
      $Res Function(_$ClearSelectedItemImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearSelectedItemImpl implements _ClearSelectedItem {
  const _$ClearSelectedItemImpl();

  @override
  String toString() {
    return 'ComboDealMaterialDetailEvent.clearSelectedItem()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearSelectedItemImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)
        initialize,
    required TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)
        setPriceInfo,
    required TResult Function(MaterialNumber item, int qty) updateItemQuantity,
    required TResult Function(MaterialNumber item) updateItemSelection,
    required TResult Function(
            ComboDeal comboDeal,
            MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)
        fetchComboDealDetail,
    required TResult Function(SearchKey searchKey) search,
    required TResult Function(bool contain) cartContainsCurrentCombo,
    required TResult Function() clearSearch,
    required TResult Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)
        fetchComboDealPrincipal,
    required TResult Function(ComboDeal comboDeal, List<String> principles)
        loadMoreComboDealPrincipal,
    required TResult Function() clearSelectedItem,
  }) {
    return clearSelectedItem();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)?
        initialize,
    TResult? Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult? Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult? Function(MaterialNumber item)? updateItemSelection,
    TResult? Function(ComboDeal comboDeal, MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)?
        fetchComboDealDetail,
    TResult? Function(SearchKey searchKey)? search,
    TResult? Function(bool contain)? cartContainsCurrentCombo,
    TResult? Function()? clearSearch,
    TResult? Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealPrincipal,
    TResult? Function(ComboDeal comboDeal, List<String> principles)?
        loadMoreComboDealPrincipal,
    TResult? Function()? clearSelectedItem,
  }) {
    return clearSelectedItem?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            SalesOrganisationConfigs salesConfigs)?
        initialize,
    TResult Function(Map<MaterialNumber, MaterialPriceDetail> priceMap)?
        setPriceInfo,
    TResult Function(MaterialNumber item, int qty)? updateItemQuantity,
    TResult Function(MaterialNumber item)? updateItemSelection,
    TResult Function(ComboDeal comboDeal, MaterialNumber parentMaterialNumber,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity)?
        fetchComboDealDetail,
    TResult Function(SearchKey searchKey)? search,
    TResult Function(bool contain)? cartContainsCurrentCombo,
    TResult Function()? clearSearch,
    TResult Function(
            ComboDeal comboDeal,
            Map<MaterialNumber, int> comboMaterialsCurrentQuantity,
            List<String> principles,
            MaterialNumber parentMaterialNumber)?
        fetchComboDealPrincipal,
    TResult Function(ComboDeal comboDeal, List<String> principles)?
        loadMoreComboDealPrincipal,
    TResult Function()? clearSelectedItem,
    required TResult orElse(),
  }) {
    if (clearSelectedItem != null) {
      return clearSelectedItem();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_SetPriceInfo value) setPriceInfo,
    required TResult Function(_UpdateItemQuantity value) updateItemQuantity,
    required TResult Function(_UpdateItemSelection value) updateItemSelection,
    required TResult Function(_FetchComboDealDetail value) fetchComboDealDetail,
    required TResult Function(_Search value) search,
    required TResult Function(_CartContainsCurrentCombo value)
        cartContainsCurrentCombo,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_FetchComboDealPrincipal value)
        fetchComboDealPrincipal,
    required TResult Function(_LoadMoreComboDealPrincipal value)
        loadMoreComboDealPrincipal,
    required TResult Function(_ClearSelectedItem value) clearSelectedItem,
  }) {
    return clearSelectedItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_SetPriceInfo value)? setPriceInfo,
    TResult? Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult? Function(_UpdateItemSelection value)? updateItemSelection,
    TResult? Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult? Function(_Search value)? search,
    TResult? Function(_CartContainsCurrentCombo value)?
        cartContainsCurrentCombo,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_FetchComboDealPrincipal value)? fetchComboDealPrincipal,
    TResult? Function(_LoadMoreComboDealPrincipal value)?
        loadMoreComboDealPrincipal,
    TResult? Function(_ClearSelectedItem value)? clearSelectedItem,
  }) {
    return clearSelectedItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_SetPriceInfo value)? setPriceInfo,
    TResult Function(_UpdateItemQuantity value)? updateItemQuantity,
    TResult Function(_UpdateItemSelection value)? updateItemSelection,
    TResult Function(_FetchComboDealDetail value)? fetchComboDealDetail,
    TResult Function(_Search value)? search,
    TResult Function(_CartContainsCurrentCombo value)? cartContainsCurrentCombo,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_FetchComboDealPrincipal value)? fetchComboDealPrincipal,
    TResult Function(_LoadMoreComboDealPrincipal value)?
        loadMoreComboDealPrincipal,
    TResult Function(_ClearSelectedItem value)? clearSelectedItem,
    required TResult orElse(),
  }) {
    if (clearSelectedItem != null) {
      return clearSelectedItem(this);
    }
    return orElse();
  }
}

abstract class _ClearSelectedItem implements ComboDealMaterialDetailEvent {
  const factory _ClearSelectedItem() = _$ClearSelectedItemImpl;
}

/// @nodoc
mixin _$ComboDealMaterialDetailState {
  Map<MaterialNumber, PriceAggregate> get items =>
      throw _privateConstructorUsedError;
  Map<MaterialNumber, bool> get selectedItems =>
      throw _privateConstructorUsedError;
  bool get isFetchingPrice => throw _privateConstructorUsedError;
  bool get isFetchingComboInfo => throw _privateConstructorUsedError;
  bool get isUpdateCart => throw _privateConstructorUsedError;
  bool get isLoadMore => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  ShipToInfo get shipToInfo => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  SalesOrganisationConfigs get salesConfigs =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  int get nextPageIndex => throw _privateConstructorUsedError;
  int get materialCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ComboDealMaterialDetailStateCopyWith<ComboDealMaterialDetailState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComboDealMaterialDetailStateCopyWith<$Res> {
  factory $ComboDealMaterialDetailStateCopyWith(
          ComboDealMaterialDetailState value,
          $Res Function(ComboDealMaterialDetailState) then) =
      _$ComboDealMaterialDetailStateCopyWithImpl<$Res,
          ComboDealMaterialDetailState>;
  @useResult
  $Res call(
      {Map<MaterialNumber, PriceAggregate> items,
      Map<MaterialNumber, bool> selectedItems,
      bool isFetchingPrice,
      bool isFetchingComboInfo,
      bool isUpdateCart,
      bool isLoadMore,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      User user,
      SalesOrganisationConfigs salesConfigs,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      SearchKey searchKey,
      bool canLoadMore,
      int nextPageIndex,
      int materialCount});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $UserCopyWith<$Res> get user;
  $SalesOrganisationConfigsCopyWith<$Res> get salesConfigs;
}

/// @nodoc
class _$ComboDealMaterialDetailStateCopyWithImpl<$Res,
        $Val extends ComboDealMaterialDetailState>
    implements $ComboDealMaterialDetailStateCopyWith<$Res> {
  _$ComboDealMaterialDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? selectedItems = null,
    Object? isFetchingPrice = null,
    Object? isFetchingComboInfo = null,
    Object? isUpdateCart = null,
    Object? isLoadMore = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? user = null,
    Object? salesConfigs = null,
    Object? apiFailureOrSuccessOption = null,
    Object? searchKey = null,
    Object? canLoadMore = null,
    Object? nextPageIndex = null,
    Object? materialCount = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, PriceAggregate>,
      selectedItems: null == selectedItems
          ? _value.selectedItems
          : selectedItems // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, bool>,
      isFetchingPrice: null == isFetchingPrice
          ? _value.isFetchingPrice
          : isFetchingPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingComboInfo: null == isFetchingComboInfo
          ? _value.isFetchingComboInfo
          : isFetchingComboInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdateCart: null == isUpdateCart
          ? _value.isUpdateCart
          : isUpdateCart // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadMore: null == isLoadMore
          ? _value.isLoadMore
          : isLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
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
      salesConfigs: null == salesConfigs
          ? _value.salesConfigs
          : salesConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      nextPageIndex: null == nextPageIndex
          ? _value.nextPageIndex
          : nextPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      materialCount: null == materialCount
          ? _value.materialCount
          : materialCount // ignore: cast_nullable_to_non_nullable
              as int,
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
  $SalesOrganisationConfigsCopyWith<$Res> get salesConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.salesConfigs,
        (value) {
      return _then(_value.copyWith(salesConfigs: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ComboDealDetailStateImplCopyWith<$Res>
    implements $ComboDealMaterialDetailStateCopyWith<$Res> {
  factory _$$ComboDealDetailStateImplCopyWith(_$ComboDealDetailStateImpl value,
          $Res Function(_$ComboDealDetailStateImpl) then) =
      __$$ComboDealDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<MaterialNumber, PriceAggregate> items,
      Map<MaterialNumber, bool> selectedItems,
      bool isFetchingPrice,
      bool isFetchingComboInfo,
      bool isUpdateCart,
      bool isLoadMore,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      User user,
      SalesOrganisationConfigs salesConfigs,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      SearchKey searchKey,
      bool canLoadMore,
      int nextPageIndex,
      int materialCount});

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  @override
  $UserCopyWith<$Res> get user;
  @override
  $SalesOrganisationConfigsCopyWith<$Res> get salesConfigs;
}

/// @nodoc
class __$$ComboDealDetailStateImplCopyWithImpl<$Res>
    extends _$ComboDealMaterialDetailStateCopyWithImpl<$Res,
        _$ComboDealDetailStateImpl>
    implements _$$ComboDealDetailStateImplCopyWith<$Res> {
  __$$ComboDealDetailStateImplCopyWithImpl(_$ComboDealDetailStateImpl _value,
      $Res Function(_$ComboDealDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? selectedItems = null,
    Object? isFetchingPrice = null,
    Object? isFetchingComboInfo = null,
    Object? isUpdateCart = null,
    Object? isLoadMore = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? user = null,
    Object? salesConfigs = null,
    Object? apiFailureOrSuccessOption = null,
    Object? searchKey = null,
    Object? canLoadMore = null,
    Object? nextPageIndex = null,
    Object? materialCount = null,
  }) {
    return _then(_$ComboDealDetailStateImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, PriceAggregate>,
      selectedItems: null == selectedItems
          ? _value._selectedItems
          : selectedItems // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, bool>,
      isFetchingPrice: null == isFetchingPrice
          ? _value.isFetchingPrice
          : isFetchingPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingComboInfo: null == isFetchingComboInfo
          ? _value.isFetchingComboInfo
          : isFetchingComboInfo // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdateCart: null == isUpdateCart
          ? _value.isUpdateCart
          : isUpdateCart // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadMore: null == isLoadMore
          ? _value.isLoadMore
          : isLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
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
      salesConfigs: null == salesConfigs
          ? _value.salesConfigs
          : salesConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      nextPageIndex: null == nextPageIndex
          ? _value.nextPageIndex
          : nextPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      materialCount: null == materialCount
          ? _value.materialCount
          : materialCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ComboDealDetailStateImpl extends _ComboDealDetailState {
  const _$ComboDealDetailStateImpl(
      {required final Map<MaterialNumber, PriceAggregate> items,
      required final Map<MaterialNumber, bool> selectedItems,
      required this.isFetchingPrice,
      required this.isFetchingComboInfo,
      required this.isUpdateCart,
      required this.isLoadMore,
      required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.user,
      required this.salesConfigs,
      required this.apiFailureOrSuccessOption,
      required this.searchKey,
      required this.canLoadMore,
      required this.nextPageIndex,
      required this.materialCount})
      : _items = items,
        _selectedItems = selectedItems,
        super._();

  final Map<MaterialNumber, PriceAggregate> _items;
  @override
  Map<MaterialNumber, PriceAggregate> get items {
    if (_items is EqualUnmodifiableMapView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_items);
  }

  final Map<MaterialNumber, bool> _selectedItems;
  @override
  Map<MaterialNumber, bool> get selectedItems {
    if (_selectedItems is EqualUnmodifiableMapView) return _selectedItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_selectedItems);
  }

  @override
  final bool isFetchingPrice;
  @override
  final bool isFetchingComboInfo;
  @override
  final bool isUpdateCart;
  @override
  final bool isLoadMore;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final User user;
  @override
  final SalesOrganisationConfigs salesConfigs;
  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;
  @override
  final SearchKey searchKey;
  @override
  final bool canLoadMore;
  @override
  final int nextPageIndex;
  @override
  final int materialCount;

  @override
  String toString() {
    return 'ComboDealMaterialDetailState(items: $items, selectedItems: $selectedItems, isFetchingPrice: $isFetchingPrice, isFetchingComboInfo: $isFetchingComboInfo, isUpdateCart: $isUpdateCart, isLoadMore: $isLoadMore, salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, user: $user, salesConfigs: $salesConfigs, apiFailureOrSuccessOption: $apiFailureOrSuccessOption, searchKey: $searchKey, canLoadMore: $canLoadMore, nextPageIndex: $nextPageIndex, materialCount: $materialCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComboDealDetailStateImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality()
                .equals(other._selectedItems, _selectedItems) &&
            (identical(other.isFetchingPrice, isFetchingPrice) ||
                other.isFetchingPrice == isFetchingPrice) &&
            (identical(other.isFetchingComboInfo, isFetchingComboInfo) ||
                other.isFetchingComboInfo == isFetchingComboInfo) &&
            (identical(other.isUpdateCart, isUpdateCart) ||
                other.isUpdateCart == isUpdateCart) &&
            (identical(other.isLoadMore, isLoadMore) ||
                other.isLoadMore == isLoadMore) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.salesConfigs, salesConfigs) ||
                other.salesConfigs == salesConfigs) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.nextPageIndex, nextPageIndex) ||
                other.nextPageIndex == nextPageIndex) &&
            (identical(other.materialCount, materialCount) ||
                other.materialCount == materialCount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_selectedItems),
      isFetchingPrice,
      isFetchingComboInfo,
      isUpdateCart,
      isLoadMore,
      salesOrganisation,
      customerCodeInfo,
      shipToInfo,
      user,
      salesConfigs,
      apiFailureOrSuccessOption,
      searchKey,
      canLoadMore,
      nextPageIndex,
      materialCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComboDealDetailStateImplCopyWith<_$ComboDealDetailStateImpl>
      get copyWith =>
          __$$ComboDealDetailStateImplCopyWithImpl<_$ComboDealDetailStateImpl>(
              this, _$identity);
}

abstract class _ComboDealDetailState extends ComboDealMaterialDetailState {
  const factory _ComboDealDetailState(
      {required final Map<MaterialNumber, PriceAggregate> items,
      required final Map<MaterialNumber, bool> selectedItems,
      required final bool isFetchingPrice,
      required final bool isFetchingComboInfo,
      required final bool isUpdateCart,
      required final bool isLoadMore,
      required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final User user,
      required final SalesOrganisationConfigs salesConfigs,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption,
      required final SearchKey searchKey,
      required final bool canLoadMore,
      required final int nextPageIndex,
      required final int materialCount}) = _$ComboDealDetailStateImpl;
  const _ComboDealDetailState._() : super._();

  @override
  Map<MaterialNumber, PriceAggregate> get items;
  @override
  Map<MaterialNumber, bool> get selectedItems;
  @override
  bool get isFetchingPrice;
  @override
  bool get isFetchingComboInfo;
  @override
  bool get isUpdateCart;
  @override
  bool get isLoadMore;
  @override
  SalesOrganisation get salesOrganisation;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  ShipToInfo get shipToInfo;
  @override
  User get user;
  @override
  SalesOrganisationConfigs get salesConfigs;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  SearchKey get searchKey;
  @override
  bool get canLoadMore;
  @override
  int get nextPageIndex;
  @override
  int get materialCount;
  @override
  @JsonKey(ignore: true)
  _$$ComboDealDetailStateImplCopyWith<_$ComboDealDetailStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

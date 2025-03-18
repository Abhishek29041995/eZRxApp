// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_price_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MaterialPriceEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(
            List<MaterialInfo> materials, bool comboDealEligible)
        fetch,
    required TResult Function(
            List<MaterialInfo> products, bool comboDealEligible)
        fetchPriceCartProduct,
    required TResult Function(MaterialInfo materialInfo)
        fetchPriceForZDP5Materials,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(List<MaterialInfo> materials, bool comboDealEligible)?
        fetch,
    TResult? Function(List<MaterialInfo> products, bool comboDealEligible)?
        fetchPriceCartProduct,
    TResult? Function(MaterialInfo materialInfo)? fetchPriceForZDP5Materials,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(List<MaterialInfo> materials, bool comboDealEligible)?
        fetch,
    TResult Function(List<MaterialInfo> products, bool comboDealEligible)?
        fetchPriceCartProduct,
    TResult Function(MaterialInfo materialInfo)? fetchPriceForZDP5Materials,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchPriceCartProduct value)
        fetchPriceCartProduct,
    required TResult Function(_FetchPriceForZDP5Materials value)
        fetchPriceForZDP5Materials,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchPriceCartProduct value)? fetchPriceCartProduct,
    TResult? Function(_FetchPriceForZDP5Materials value)?
        fetchPriceForZDP5Materials,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchPriceCartProduct value)? fetchPriceCartProduct,
    TResult Function(_FetchPriceForZDP5Materials value)?
        fetchPriceForZDP5Materials,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialPriceEventCopyWith<$Res> {
  factory $MaterialPriceEventCopyWith(
          MaterialPriceEvent value, $Res Function(MaterialPriceEvent) then) =
      _$MaterialPriceEventCopyWithImpl<$Res, MaterialPriceEvent>;
}

/// @nodoc
class _$MaterialPriceEventCopyWithImpl<$Res, $Val extends MaterialPriceEvent>
    implements $MaterialPriceEventCopyWith<$Res> {
  _$MaterialPriceEventCopyWithImpl(this._value, this._then);

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
      {CustomerCodeInfo customerCodeInfo,
      SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs salesConfigs,
      ShipToInfo shipToInfo});

  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $SalesOrganisationConfigsCopyWith<$Res> get salesConfigs;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$MaterialPriceEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeInfo = null,
    Object? salesOrganisation = null,
    Object? salesConfigs = null,
    Object? shipToInfo = null,
  }) {
    return _then(_$InitializedImpl(
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      salesConfigs: null == salesConfigs
          ? _value.salesConfigs
          : salesConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
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
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
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

  @override
  @pragma('vm:prefer-inline')
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value));
    });
  }
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl(
      {required this.customerCodeInfo,
      required this.salesOrganisation,
      required this.salesConfigs,
      required this.shipToInfo});

  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final SalesOrganisationConfigs salesConfigs;
  @override
  final ShipToInfo shipToInfo;

  @override
  String toString() {
    return 'MaterialPriceEvent.initialized(customerCodeInfo: $customerCodeInfo, salesOrganisation: $salesOrganisation, salesConfigs: $salesConfigs, shipToInfo: $shipToInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializedImpl &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.salesConfigs, salesConfigs) ||
                other.salesConfigs == salesConfigs) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerCodeInfo,
      salesOrganisation, salesConfigs, shipToInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      __$$InitializedImplCopyWithImpl<_$InitializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(
            List<MaterialInfo> materials, bool comboDealEligible)
        fetch,
    required TResult Function(
            List<MaterialInfo> products, bool comboDealEligible)
        fetchPriceCartProduct,
    required TResult Function(MaterialInfo materialInfo)
        fetchPriceForZDP5Materials,
  }) {
    return initialized(
        customerCodeInfo, salesOrganisation, salesConfigs, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(List<MaterialInfo> materials, bool comboDealEligible)?
        fetch,
    TResult? Function(List<MaterialInfo> products, bool comboDealEligible)?
        fetchPriceCartProduct,
    TResult? Function(MaterialInfo materialInfo)? fetchPriceForZDP5Materials,
  }) {
    return initialized?.call(
        customerCodeInfo, salesOrganisation, salesConfigs, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(List<MaterialInfo> materials, bool comboDealEligible)?
        fetch,
    TResult Function(List<MaterialInfo> products, bool comboDealEligible)?
        fetchPriceCartProduct,
    TResult Function(MaterialInfo materialInfo)? fetchPriceForZDP5Materials,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(
          customerCodeInfo, salesOrganisation, salesConfigs, shipToInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchPriceCartProduct value)
        fetchPriceCartProduct,
    required TResult Function(_FetchPriceForZDP5Materials value)
        fetchPriceForZDP5Materials,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchPriceCartProduct value)? fetchPriceCartProduct,
    TResult? Function(_FetchPriceForZDP5Materials value)?
        fetchPriceForZDP5Materials,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchPriceCartProduct value)? fetchPriceCartProduct,
    TResult Function(_FetchPriceForZDP5Materials value)?
        fetchPriceForZDP5Materials,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements MaterialPriceEvent {
  const factory _Initialized(
      {required final CustomerCodeInfo customerCodeInfo,
      required final SalesOrganisation salesOrganisation,
      required final SalesOrganisationConfigs salesConfigs,
      required final ShipToInfo shipToInfo}) = _$InitializedImpl;

  CustomerCodeInfo get customerCodeInfo;
  SalesOrganisation get salesOrganisation;
  SalesOrganisationConfigs get salesConfigs;
  ShipToInfo get shipToInfo;
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
  $Res call({List<MaterialInfo> materials, bool comboDealEligible});
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$MaterialPriceEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materials = null,
    Object? comboDealEligible = null,
  }) {
    return _then(_$FetchImpl(
      materials: null == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
      comboDealEligible: null == comboDealEligible
          ? _value.comboDealEligible
          : comboDealEligible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl(
      {required final List<MaterialInfo> materials,
      required this.comboDealEligible})
      : _materials = materials;

  final List<MaterialInfo> _materials;
  @override
  List<MaterialInfo> get materials {
    if (_materials is EqualUnmodifiableListView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materials);
  }

  @override
  final bool comboDealEligible;

  @override
  String toString() {
    return 'MaterialPriceEvent.fetch(materials: $materials, comboDealEligible: $comboDealEligible)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials) &&
            (identical(other.comboDealEligible, comboDealEligible) ||
                other.comboDealEligible == comboDealEligible));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_materials), comboDealEligible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(
            List<MaterialInfo> materials, bool comboDealEligible)
        fetch,
    required TResult Function(
            List<MaterialInfo> products, bool comboDealEligible)
        fetchPriceCartProduct,
    required TResult Function(MaterialInfo materialInfo)
        fetchPriceForZDP5Materials,
  }) {
    return fetch(materials, comboDealEligible);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(List<MaterialInfo> materials, bool comboDealEligible)?
        fetch,
    TResult? Function(List<MaterialInfo> products, bool comboDealEligible)?
        fetchPriceCartProduct,
    TResult? Function(MaterialInfo materialInfo)? fetchPriceForZDP5Materials,
  }) {
    return fetch?.call(materials, comboDealEligible);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(List<MaterialInfo> materials, bool comboDealEligible)?
        fetch,
    TResult Function(List<MaterialInfo> products, bool comboDealEligible)?
        fetchPriceCartProduct,
    TResult Function(MaterialInfo materialInfo)? fetchPriceForZDP5Materials,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(materials, comboDealEligible);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchPriceCartProduct value)
        fetchPriceCartProduct,
    required TResult Function(_FetchPriceForZDP5Materials value)
        fetchPriceForZDP5Materials,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchPriceCartProduct value)? fetchPriceCartProduct,
    TResult? Function(_FetchPriceForZDP5Materials value)?
        fetchPriceForZDP5Materials,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchPriceCartProduct value)? fetchPriceCartProduct,
    TResult Function(_FetchPriceForZDP5Materials value)?
        fetchPriceForZDP5Materials,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements MaterialPriceEvent {
  const factory _Fetch(
      {required final List<MaterialInfo> materials,
      required final bool comboDealEligible}) = _$FetchImpl;

  List<MaterialInfo> get materials;
  bool get comboDealEligible;
  @JsonKey(ignore: true)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchPriceCartProductImplCopyWith<$Res> {
  factory _$$FetchPriceCartProductImplCopyWith(
          _$FetchPriceCartProductImpl value,
          $Res Function(_$FetchPriceCartProductImpl) then) =
      __$$FetchPriceCartProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MaterialInfo> products, bool comboDealEligible});
}

/// @nodoc
class __$$FetchPriceCartProductImplCopyWithImpl<$Res>
    extends _$MaterialPriceEventCopyWithImpl<$Res, _$FetchPriceCartProductImpl>
    implements _$$FetchPriceCartProductImplCopyWith<$Res> {
  __$$FetchPriceCartProductImplCopyWithImpl(_$FetchPriceCartProductImpl _value,
      $Res Function(_$FetchPriceCartProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? comboDealEligible = null,
  }) {
    return _then(_$FetchPriceCartProductImpl(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
      comboDealEligible: null == comboDealEligible
          ? _value.comboDealEligible
          : comboDealEligible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FetchPriceCartProductImpl implements _FetchPriceCartProduct {
  const _$FetchPriceCartProductImpl(
      {required final List<MaterialInfo> products,
      required this.comboDealEligible})
      : _products = products;

  final List<MaterialInfo> _products;
  @override
  List<MaterialInfo> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final bool comboDealEligible;

  @override
  String toString() {
    return 'MaterialPriceEvent.fetchPriceCartProduct(products: $products, comboDealEligible: $comboDealEligible)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchPriceCartProductImpl &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.comboDealEligible, comboDealEligible) ||
                other.comboDealEligible == comboDealEligible));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_products), comboDealEligible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchPriceCartProductImplCopyWith<_$FetchPriceCartProductImpl>
      get copyWith => __$$FetchPriceCartProductImplCopyWithImpl<
          _$FetchPriceCartProductImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(
            List<MaterialInfo> materials, bool comboDealEligible)
        fetch,
    required TResult Function(
            List<MaterialInfo> products, bool comboDealEligible)
        fetchPriceCartProduct,
    required TResult Function(MaterialInfo materialInfo)
        fetchPriceForZDP5Materials,
  }) {
    return fetchPriceCartProduct(products, comboDealEligible);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(List<MaterialInfo> materials, bool comboDealEligible)?
        fetch,
    TResult? Function(List<MaterialInfo> products, bool comboDealEligible)?
        fetchPriceCartProduct,
    TResult? Function(MaterialInfo materialInfo)? fetchPriceForZDP5Materials,
  }) {
    return fetchPriceCartProduct?.call(products, comboDealEligible);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(List<MaterialInfo> materials, bool comboDealEligible)?
        fetch,
    TResult Function(List<MaterialInfo> products, bool comboDealEligible)?
        fetchPriceCartProduct,
    TResult Function(MaterialInfo materialInfo)? fetchPriceForZDP5Materials,
    required TResult orElse(),
  }) {
    if (fetchPriceCartProduct != null) {
      return fetchPriceCartProduct(products, comboDealEligible);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchPriceCartProduct value)
        fetchPriceCartProduct,
    required TResult Function(_FetchPriceForZDP5Materials value)
        fetchPriceForZDP5Materials,
  }) {
    return fetchPriceCartProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchPriceCartProduct value)? fetchPriceCartProduct,
    TResult? Function(_FetchPriceForZDP5Materials value)?
        fetchPriceForZDP5Materials,
  }) {
    return fetchPriceCartProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchPriceCartProduct value)? fetchPriceCartProduct,
    TResult Function(_FetchPriceForZDP5Materials value)?
        fetchPriceForZDP5Materials,
    required TResult orElse(),
  }) {
    if (fetchPriceCartProduct != null) {
      return fetchPriceCartProduct(this);
    }
    return orElse();
  }
}

abstract class _FetchPriceCartProduct implements MaterialPriceEvent {
  const factory _FetchPriceCartProduct(
      {required final List<MaterialInfo> products,
      required final bool comboDealEligible}) = _$FetchPriceCartProductImpl;

  List<MaterialInfo> get products;
  bool get comboDealEligible;
  @JsonKey(ignore: true)
  _$$FetchPriceCartProductImplCopyWith<_$FetchPriceCartProductImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchPriceForZDP5MaterialsImplCopyWith<$Res> {
  factory _$$FetchPriceForZDP5MaterialsImplCopyWith(
          _$FetchPriceForZDP5MaterialsImpl value,
          $Res Function(_$FetchPriceForZDP5MaterialsImpl) then) =
      __$$FetchPriceForZDP5MaterialsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialInfo materialInfo});

  $MaterialInfoCopyWith<$Res> get materialInfo;
}

/// @nodoc
class __$$FetchPriceForZDP5MaterialsImplCopyWithImpl<$Res>
    extends _$MaterialPriceEventCopyWithImpl<$Res,
        _$FetchPriceForZDP5MaterialsImpl>
    implements _$$FetchPriceForZDP5MaterialsImplCopyWith<$Res> {
  __$$FetchPriceForZDP5MaterialsImplCopyWithImpl(
      _$FetchPriceForZDP5MaterialsImpl _value,
      $Res Function(_$FetchPriceForZDP5MaterialsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialInfo = null,
  }) {
    return _then(_$FetchPriceForZDP5MaterialsImpl(
      materialInfo: null == materialInfo
          ? _value.materialInfo
          : materialInfo // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialInfoCopyWith<$Res> get materialInfo {
    return $MaterialInfoCopyWith<$Res>(_value.materialInfo, (value) {
      return _then(_value.copyWith(materialInfo: value));
    });
  }
}

/// @nodoc

class _$FetchPriceForZDP5MaterialsImpl implements _FetchPriceForZDP5Materials {
  const _$FetchPriceForZDP5MaterialsImpl({required this.materialInfo});

  @override
  final MaterialInfo materialInfo;

  @override
  String toString() {
    return 'MaterialPriceEvent.fetchPriceForZDP5Materials(materialInfo: $materialInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchPriceForZDP5MaterialsImpl &&
            (identical(other.materialInfo, materialInfo) ||
                other.materialInfo == materialInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchPriceForZDP5MaterialsImplCopyWith<_$FetchPriceForZDP5MaterialsImpl>
      get copyWith => __$$FetchPriceForZDP5MaterialsImplCopyWithImpl<
          _$FetchPriceForZDP5MaterialsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)
        initialized,
    required TResult Function(
            List<MaterialInfo> materials, bool comboDealEligible)
        fetch,
    required TResult Function(
            List<MaterialInfo> products, bool comboDealEligible)
        fetchPriceCartProduct,
    required TResult Function(MaterialInfo materialInfo)
        fetchPriceForZDP5Materials,
  }) {
    return fetchPriceForZDP5Materials(materialInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(List<MaterialInfo> materials, bool comboDealEligible)?
        fetch,
    TResult? Function(List<MaterialInfo> products, bool comboDealEligible)?
        fetchPriceCartProduct,
    TResult? Function(MaterialInfo materialInfo)? fetchPriceForZDP5Materials,
  }) {
    return fetchPriceForZDP5Materials?.call(materialInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            CustomerCodeInfo customerCodeInfo,
            SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesConfigs,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(List<MaterialInfo> materials, bool comboDealEligible)?
        fetch,
    TResult Function(List<MaterialInfo> products, bool comboDealEligible)?
        fetchPriceCartProduct,
    TResult Function(MaterialInfo materialInfo)? fetchPriceForZDP5Materials,
    required TResult orElse(),
  }) {
    if (fetchPriceForZDP5Materials != null) {
      return fetchPriceForZDP5Materials(materialInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchPriceCartProduct value)
        fetchPriceCartProduct,
    required TResult Function(_FetchPriceForZDP5Materials value)
        fetchPriceForZDP5Materials,
  }) {
    return fetchPriceForZDP5Materials(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchPriceCartProduct value)? fetchPriceCartProduct,
    TResult? Function(_FetchPriceForZDP5Materials value)?
        fetchPriceForZDP5Materials,
  }) {
    return fetchPriceForZDP5Materials?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchPriceCartProduct value)? fetchPriceCartProduct,
    TResult Function(_FetchPriceForZDP5Materials value)?
        fetchPriceForZDP5Materials,
    required TResult orElse(),
  }) {
    if (fetchPriceForZDP5Materials != null) {
      return fetchPriceForZDP5Materials(this);
    }
    return orElse();
  }
}

abstract class _FetchPriceForZDP5Materials implements MaterialPriceEvent {
  const factory _FetchPriceForZDP5Materials(
          {required final MaterialInfo materialInfo}) =
      _$FetchPriceForZDP5MaterialsImpl;

  MaterialInfo get materialInfo;
  @JsonKey(ignore: true)
  _$$FetchPriceForZDP5MaterialsImplCopyWith<_$FetchPriceForZDP5MaterialsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MaterialPriceState {
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  SalesOrganisationConfigs get salesConfigs =>
      throw _privateConstructorUsedError;
  ShipToInfo get shipToInfo => throw _privateConstructorUsedError;
  Map<MaterialNumber, Price> get materialPrice =>
      throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaterialPriceStateCopyWith<MaterialPriceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialPriceStateCopyWith<$Res> {
  factory $MaterialPriceStateCopyWith(
          MaterialPriceState value, $Res Function(MaterialPriceState) then) =
      _$MaterialPriceStateCopyWithImpl<$Res, MaterialPriceState>;
  @useResult
  $Res call(
      {CustomerCodeInfo customerCodeInfo,
      SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs salesConfigs,
      ShipToInfo shipToInfo,
      Map<MaterialNumber, Price> materialPrice,
      bool isFetching});

  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $SalesOrganisationConfigsCopyWith<$Res> get salesConfigs;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class _$MaterialPriceStateCopyWithImpl<$Res, $Val extends MaterialPriceState>
    implements $MaterialPriceStateCopyWith<$Res> {
  _$MaterialPriceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeInfo = null,
    Object? salesOrganisation = null,
    Object? salesConfigs = null,
    Object? shipToInfo = null,
    Object? materialPrice = null,
    Object? isFetching = null,
  }) {
    return _then(_value.copyWith(
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      salesConfigs: null == salesConfigs
          ? _value.salesConfigs
          : salesConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      materialPrice: null == materialPrice
          ? _value.materialPrice
          : materialPrice // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, Price>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
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
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value) as $Val);
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

  @override
  @pragma('vm:prefer-inline')
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MaterialPriceStateImplCopyWith<$Res>
    implements $MaterialPriceStateCopyWith<$Res> {
  factory _$$MaterialPriceStateImplCopyWith(_$MaterialPriceStateImpl value,
          $Res Function(_$MaterialPriceStateImpl) then) =
      __$$MaterialPriceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CustomerCodeInfo customerCodeInfo,
      SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs salesConfigs,
      ShipToInfo shipToInfo,
      Map<MaterialNumber, Price> materialPrice,
      bool isFetching});

  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $SalesOrganisationConfigsCopyWith<$Res> get salesConfigs;
  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$MaterialPriceStateImplCopyWithImpl<$Res>
    extends _$MaterialPriceStateCopyWithImpl<$Res, _$MaterialPriceStateImpl>
    implements _$$MaterialPriceStateImplCopyWith<$Res> {
  __$$MaterialPriceStateImplCopyWithImpl(_$MaterialPriceStateImpl _value,
      $Res Function(_$MaterialPriceStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeInfo = null,
    Object? salesOrganisation = null,
    Object? salesConfigs = null,
    Object? shipToInfo = null,
    Object? materialPrice = null,
    Object? isFetching = null,
  }) {
    return _then(_$MaterialPriceStateImpl(
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      salesConfigs: null == salesConfigs
          ? _value.salesConfigs
          : salesConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      materialPrice: null == materialPrice
          ? _value._materialPrice
          : materialPrice // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, Price>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MaterialPriceStateImpl extends _MaterialPriceState {
  const _$MaterialPriceStateImpl(
      {required this.customerCodeInfo,
      required this.salesOrganisation,
      required this.salesConfigs,
      required this.shipToInfo,
      required final Map<MaterialNumber, Price> materialPrice,
      required this.isFetching})
      : _materialPrice = materialPrice,
        super._();

  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final SalesOrganisationConfigs salesConfigs;
  @override
  final ShipToInfo shipToInfo;
  final Map<MaterialNumber, Price> _materialPrice;
  @override
  Map<MaterialNumber, Price> get materialPrice {
    if (_materialPrice is EqualUnmodifiableMapView) return _materialPrice;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_materialPrice);
  }

  @override
  final bool isFetching;

  @override
  String toString() {
    return 'MaterialPriceState(customerCodeInfo: $customerCodeInfo, salesOrganisation: $salesOrganisation, salesConfigs: $salesConfigs, shipToInfo: $shipToInfo, materialPrice: $materialPrice, isFetching: $isFetching)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialPriceStateImpl &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.salesConfigs, salesConfigs) ||
                other.salesConfigs == salesConfigs) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            const DeepCollectionEquality()
                .equals(other._materialPrice, _materialPrice) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      customerCodeInfo,
      salesOrganisation,
      salesConfigs,
      shipToInfo,
      const DeepCollectionEquality().hash(_materialPrice),
      isFetching);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialPriceStateImplCopyWith<_$MaterialPriceStateImpl> get copyWith =>
      __$$MaterialPriceStateImplCopyWithImpl<_$MaterialPriceStateImpl>(
          this, _$identity);
}

abstract class _MaterialPriceState extends MaterialPriceState {
  const factory _MaterialPriceState(
      {required final CustomerCodeInfo customerCodeInfo,
      required final SalesOrganisation salesOrganisation,
      required final SalesOrganisationConfigs salesConfigs,
      required final ShipToInfo shipToInfo,
      required final Map<MaterialNumber, Price> materialPrice,
      required final bool isFetching}) = _$MaterialPriceStateImpl;
  const _MaterialPriceState._() : super._();

  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  SalesOrganisation get salesOrganisation;
  @override
  SalesOrganisationConfigs get salesConfigs;
  @override
  ShipToInfo get shipToInfo;
  @override
  Map<MaterialNumber, Price> get materialPrice;
  @override
  bool get isFetching;
  @override
  @JsonKey(ignore: true)
  _$$MaterialPriceStateImplCopyWith<_$MaterialPriceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

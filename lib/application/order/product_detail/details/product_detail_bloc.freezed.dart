// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)
        fetch,
    required TResult Function() fetchSimilarProduct,
    required TResult Function() fetchMetaData,
    required TResult Function(MaterialNumber materialNumber) fetchStock,
    required TResult Function(List<MaterialInfo> materials) fetchStockForBundle,
    required TResult Function(int index) changeImage,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        addFavourite,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        deleteFavourite,
    required TResult Function(int qty) updateQty,
    required TResult Function(int quantity) fetchItemQuantityForZdp5Discount,
    required TResult Function(bool exceedQty) setExceedQty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)?
        fetch,
    TResult? Function()? fetchSimilarProduct,
    TResult? Function()? fetchMetaData,
    TResult? Function(MaterialNumber materialNumber)? fetchStock,
    TResult? Function(List<MaterialInfo> materials)? fetchStockForBundle,
    TResult? Function(int index)? changeImage,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    TResult? Function(int qty)? updateQty,
    TResult? Function(int quantity)? fetchItemQuantityForZdp5Discount,
    TResult? Function(bool exceedQty)? setExceedQty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)?
        fetch,
    TResult Function()? fetchSimilarProduct,
    TResult Function()? fetchMetaData,
    TResult Function(MaterialNumber materialNumber)? fetchStock,
    TResult Function(List<MaterialInfo> materials)? fetchStockForBundle,
    TResult Function(int index)? changeImage,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    TResult Function(int qty)? updateQty,
    TResult Function(int quantity)? fetchItemQuantityForZdp5Discount,
    TResult Function(bool exceedQty)? setExceedQty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchSimilarProduct value) fetchSimilarProduct,
    required TResult Function(_FetchMetaData value) fetchMetaData,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_FetchStockForBundle value) fetchStockForBundle,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
    required TResult Function(_UpdateQty value) updateQty,
    required TResult Function(_FetchItemQuantityForZdp5Discount value)
        fetchItemQuantityForZdp5Discount,
    required TResult Function(_SetExceedQty value) setExceedQty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult? Function(_FetchMetaData value)? fetchMetaData,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_FetchStockForBundle value)? fetchStockForBundle,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
    TResult? Function(_UpdateQty value)? updateQty,
    TResult? Function(_FetchItemQuantityForZdp5Discount value)?
        fetchItemQuantityForZdp5Discount,
    TResult? Function(_SetExceedQty value)? setExceedQty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult Function(_FetchMetaData value)? fetchMetaData,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_FetchStockForBundle value)? fetchStockForBundle,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    TResult Function(_UpdateQty value)? updateQty,
    TResult Function(_FetchItemQuantityForZdp5Discount value)?
        fetchItemQuantityForZdp5Discount,
    TResult Function(_SetExceedQty value)? setExceedQty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailEventCopyWith<$Res> {
  factory $ProductDetailEventCopyWith(
          ProductDetailEvent value, $Res Function(ProductDetailEvent) then) =
      _$ProductDetailEventCopyWithImpl<$Res, ProductDetailEvent>;
}

/// @nodoc
class _$ProductDetailEventCopyWithImpl<$Res, $Val extends ProductDetailEvent>
    implements $ProductDetailEventCopyWith<$Res> {
  _$ProductDetailEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      User user,
      MaterialInfo materialInfo});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $UserCopyWith<$Res> get user;
  $MaterialInfoCopyWith<$Res> get materialInfo;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? user = null,
    Object? materialInfo = null,
  }) {
    return _then(_$FetchImpl(
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
      materialInfo: null == materialInfo
          ? _value.materialInfo
          : materialInfo // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
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
  $MaterialInfoCopyWith<$Res> get materialInfo {
    return $MaterialInfoCopyWith<$Res>(_value.materialInfo, (value) {
      return _then(_value.copyWith(materialInfo: value));
    });
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  _$FetchImpl(
      {required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.user,
      required this.materialInfo});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final User user;
  @override
  final MaterialInfo materialInfo;

  @override
  String toString() {
    return 'ProductDetailEvent.fetch(salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, user: $user, materialInfo: $materialInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.materialInfo, materialInfo) ||
                other.materialInfo == materialInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrganisation,
      customerCodeInfo, shipToInfo, user, materialInfo);

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
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)
        fetch,
    required TResult Function() fetchSimilarProduct,
    required TResult Function() fetchMetaData,
    required TResult Function(MaterialNumber materialNumber) fetchStock,
    required TResult Function(List<MaterialInfo> materials) fetchStockForBundle,
    required TResult Function(int index) changeImage,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        addFavourite,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        deleteFavourite,
    required TResult Function(int qty) updateQty,
    required TResult Function(int quantity) fetchItemQuantityForZdp5Discount,
    required TResult Function(bool exceedQty) setExceedQty,
  }) {
    return fetch(
        salesOrganisation, customerCodeInfo, shipToInfo, user, materialInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)?
        fetch,
    TResult? Function()? fetchSimilarProduct,
    TResult? Function()? fetchMetaData,
    TResult? Function(MaterialNumber materialNumber)? fetchStock,
    TResult? Function(List<MaterialInfo> materials)? fetchStockForBundle,
    TResult? Function(int index)? changeImage,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    TResult? Function(int qty)? updateQty,
    TResult? Function(int quantity)? fetchItemQuantityForZdp5Discount,
    TResult? Function(bool exceedQty)? setExceedQty,
  }) {
    return fetch?.call(
        salesOrganisation, customerCodeInfo, shipToInfo, user, materialInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)?
        fetch,
    TResult Function()? fetchSimilarProduct,
    TResult Function()? fetchMetaData,
    TResult Function(MaterialNumber materialNumber)? fetchStock,
    TResult Function(List<MaterialInfo> materials)? fetchStockForBundle,
    TResult Function(int index)? changeImage,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    TResult Function(int qty)? updateQty,
    TResult Function(int quantity)? fetchItemQuantityForZdp5Discount,
    TResult Function(bool exceedQty)? setExceedQty,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(
          salesOrganisation, customerCodeInfo, shipToInfo, user, materialInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchSimilarProduct value) fetchSimilarProduct,
    required TResult Function(_FetchMetaData value) fetchMetaData,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_FetchStockForBundle value) fetchStockForBundle,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
    required TResult Function(_UpdateQty value) updateQty,
    required TResult Function(_FetchItemQuantityForZdp5Discount value)
        fetchItemQuantityForZdp5Discount,
    required TResult Function(_SetExceedQty value) setExceedQty,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult? Function(_FetchMetaData value)? fetchMetaData,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_FetchStockForBundle value)? fetchStockForBundle,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
    TResult? Function(_UpdateQty value)? updateQty,
    TResult? Function(_FetchItemQuantityForZdp5Discount value)?
        fetchItemQuantityForZdp5Discount,
    TResult? Function(_SetExceedQty value)? setExceedQty,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult Function(_FetchMetaData value)? fetchMetaData,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_FetchStockForBundle value)? fetchStockForBundle,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    TResult Function(_UpdateQty value)? updateQty,
    TResult Function(_FetchItemQuantityForZdp5Discount value)?
        fetchItemQuantityForZdp5Discount,
    TResult Function(_SetExceedQty value)? setExceedQty,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements ProductDetailEvent {
  factory _Fetch(
      {required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final User user,
      required final MaterialInfo materialInfo}) = _$FetchImpl;

  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  User get user;
  MaterialInfo get materialInfo;
  @JsonKey(ignore: true)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchSimilarProductImplCopyWith<$Res> {
  factory _$$FetchSimilarProductImplCopyWith(_$FetchSimilarProductImpl value,
          $Res Function(_$FetchSimilarProductImpl) then) =
      __$$FetchSimilarProductImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchSimilarProductImplCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res, _$FetchSimilarProductImpl>
    implements _$$FetchSimilarProductImplCopyWith<$Res> {
  __$$FetchSimilarProductImplCopyWithImpl(_$FetchSimilarProductImpl _value,
      $Res Function(_$FetchSimilarProductImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchSimilarProductImpl implements _FetchSimilarProduct {
  _$FetchSimilarProductImpl();

  @override
  String toString() {
    return 'ProductDetailEvent.fetchSimilarProduct()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchSimilarProductImpl);
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
            MaterialInfo materialInfo)
        fetch,
    required TResult Function() fetchSimilarProduct,
    required TResult Function() fetchMetaData,
    required TResult Function(MaterialNumber materialNumber) fetchStock,
    required TResult Function(List<MaterialInfo> materials) fetchStockForBundle,
    required TResult Function(int index) changeImage,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        addFavourite,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        deleteFavourite,
    required TResult Function(int qty) updateQty,
    required TResult Function(int quantity) fetchItemQuantityForZdp5Discount,
    required TResult Function(bool exceedQty) setExceedQty,
  }) {
    return fetchSimilarProduct();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)?
        fetch,
    TResult? Function()? fetchSimilarProduct,
    TResult? Function()? fetchMetaData,
    TResult? Function(MaterialNumber materialNumber)? fetchStock,
    TResult? Function(List<MaterialInfo> materials)? fetchStockForBundle,
    TResult? Function(int index)? changeImage,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    TResult? Function(int qty)? updateQty,
    TResult? Function(int quantity)? fetchItemQuantityForZdp5Discount,
    TResult? Function(bool exceedQty)? setExceedQty,
  }) {
    return fetchSimilarProduct?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)?
        fetch,
    TResult Function()? fetchSimilarProduct,
    TResult Function()? fetchMetaData,
    TResult Function(MaterialNumber materialNumber)? fetchStock,
    TResult Function(List<MaterialInfo> materials)? fetchStockForBundle,
    TResult Function(int index)? changeImage,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    TResult Function(int qty)? updateQty,
    TResult Function(int quantity)? fetchItemQuantityForZdp5Discount,
    TResult Function(bool exceedQty)? setExceedQty,
    required TResult orElse(),
  }) {
    if (fetchSimilarProduct != null) {
      return fetchSimilarProduct();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchSimilarProduct value) fetchSimilarProduct,
    required TResult Function(_FetchMetaData value) fetchMetaData,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_FetchStockForBundle value) fetchStockForBundle,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
    required TResult Function(_UpdateQty value) updateQty,
    required TResult Function(_FetchItemQuantityForZdp5Discount value)
        fetchItemQuantityForZdp5Discount,
    required TResult Function(_SetExceedQty value) setExceedQty,
  }) {
    return fetchSimilarProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult? Function(_FetchMetaData value)? fetchMetaData,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_FetchStockForBundle value)? fetchStockForBundle,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
    TResult? Function(_UpdateQty value)? updateQty,
    TResult? Function(_FetchItemQuantityForZdp5Discount value)?
        fetchItemQuantityForZdp5Discount,
    TResult? Function(_SetExceedQty value)? setExceedQty,
  }) {
    return fetchSimilarProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult Function(_FetchMetaData value)? fetchMetaData,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_FetchStockForBundle value)? fetchStockForBundle,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    TResult Function(_UpdateQty value)? updateQty,
    TResult Function(_FetchItemQuantityForZdp5Discount value)?
        fetchItemQuantityForZdp5Discount,
    TResult Function(_SetExceedQty value)? setExceedQty,
    required TResult orElse(),
  }) {
    if (fetchSimilarProduct != null) {
      return fetchSimilarProduct(this);
    }
    return orElse();
  }
}

abstract class _FetchSimilarProduct implements ProductDetailEvent {
  factory _FetchSimilarProduct() = _$FetchSimilarProductImpl;
}

/// @nodoc
abstract class _$$FetchMetaDataImplCopyWith<$Res> {
  factory _$$FetchMetaDataImplCopyWith(
          _$FetchMetaDataImpl value, $Res Function(_$FetchMetaDataImpl) then) =
      __$$FetchMetaDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchMetaDataImplCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res, _$FetchMetaDataImpl>
    implements _$$FetchMetaDataImplCopyWith<$Res> {
  __$$FetchMetaDataImplCopyWithImpl(
      _$FetchMetaDataImpl _value, $Res Function(_$FetchMetaDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchMetaDataImpl implements _FetchMetaData {
  _$FetchMetaDataImpl();

  @override
  String toString() {
    return 'ProductDetailEvent.fetchMetaData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchMetaDataImpl);
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
            MaterialInfo materialInfo)
        fetch,
    required TResult Function() fetchSimilarProduct,
    required TResult Function() fetchMetaData,
    required TResult Function(MaterialNumber materialNumber) fetchStock,
    required TResult Function(List<MaterialInfo> materials) fetchStockForBundle,
    required TResult Function(int index) changeImage,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        addFavourite,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        deleteFavourite,
    required TResult Function(int qty) updateQty,
    required TResult Function(int quantity) fetchItemQuantityForZdp5Discount,
    required TResult Function(bool exceedQty) setExceedQty,
  }) {
    return fetchMetaData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)?
        fetch,
    TResult? Function()? fetchSimilarProduct,
    TResult? Function()? fetchMetaData,
    TResult? Function(MaterialNumber materialNumber)? fetchStock,
    TResult? Function(List<MaterialInfo> materials)? fetchStockForBundle,
    TResult? Function(int index)? changeImage,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    TResult? Function(int qty)? updateQty,
    TResult? Function(int quantity)? fetchItemQuantityForZdp5Discount,
    TResult? Function(bool exceedQty)? setExceedQty,
  }) {
    return fetchMetaData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)?
        fetch,
    TResult Function()? fetchSimilarProduct,
    TResult Function()? fetchMetaData,
    TResult Function(MaterialNumber materialNumber)? fetchStock,
    TResult Function(List<MaterialInfo> materials)? fetchStockForBundle,
    TResult Function(int index)? changeImage,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    TResult Function(int qty)? updateQty,
    TResult Function(int quantity)? fetchItemQuantityForZdp5Discount,
    TResult Function(bool exceedQty)? setExceedQty,
    required TResult orElse(),
  }) {
    if (fetchMetaData != null) {
      return fetchMetaData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchSimilarProduct value) fetchSimilarProduct,
    required TResult Function(_FetchMetaData value) fetchMetaData,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_FetchStockForBundle value) fetchStockForBundle,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
    required TResult Function(_UpdateQty value) updateQty,
    required TResult Function(_FetchItemQuantityForZdp5Discount value)
        fetchItemQuantityForZdp5Discount,
    required TResult Function(_SetExceedQty value) setExceedQty,
  }) {
    return fetchMetaData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult? Function(_FetchMetaData value)? fetchMetaData,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_FetchStockForBundle value)? fetchStockForBundle,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
    TResult? Function(_UpdateQty value)? updateQty,
    TResult? Function(_FetchItemQuantityForZdp5Discount value)?
        fetchItemQuantityForZdp5Discount,
    TResult? Function(_SetExceedQty value)? setExceedQty,
  }) {
    return fetchMetaData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult Function(_FetchMetaData value)? fetchMetaData,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_FetchStockForBundle value)? fetchStockForBundle,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    TResult Function(_UpdateQty value)? updateQty,
    TResult Function(_FetchItemQuantityForZdp5Discount value)?
        fetchItemQuantityForZdp5Discount,
    TResult Function(_SetExceedQty value)? setExceedQty,
    required TResult orElse(),
  }) {
    if (fetchMetaData != null) {
      return fetchMetaData(this);
    }
    return orElse();
  }
}

abstract class _FetchMetaData implements ProductDetailEvent {
  factory _FetchMetaData() = _$FetchMetaDataImpl;
}

/// @nodoc
abstract class _$$FetchStockImplCopyWith<$Res> {
  factory _$$FetchStockImplCopyWith(
          _$FetchStockImpl value, $Res Function(_$FetchStockImpl) then) =
      __$$FetchStockImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialNumber materialNumber});
}

/// @nodoc
class __$$FetchStockImplCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res, _$FetchStockImpl>
    implements _$$FetchStockImplCopyWith<$Res> {
  __$$FetchStockImplCopyWithImpl(
      _$FetchStockImpl _value, $Res Function(_$FetchStockImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
  }) {
    return _then(_$FetchStockImpl(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
    ));
  }
}

/// @nodoc

class _$FetchStockImpl implements _FetchStock {
  _$FetchStockImpl({required this.materialNumber});

  @override
  final MaterialNumber materialNumber;

  @override
  String toString() {
    return 'ProductDetailEvent.fetchStock(materialNumber: $materialNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchStockImpl &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialNumber);

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
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)
        fetch,
    required TResult Function() fetchSimilarProduct,
    required TResult Function() fetchMetaData,
    required TResult Function(MaterialNumber materialNumber) fetchStock,
    required TResult Function(List<MaterialInfo> materials) fetchStockForBundle,
    required TResult Function(int index) changeImage,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        addFavourite,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        deleteFavourite,
    required TResult Function(int qty) updateQty,
    required TResult Function(int quantity) fetchItemQuantityForZdp5Discount,
    required TResult Function(bool exceedQty) setExceedQty,
  }) {
    return fetchStock(materialNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)?
        fetch,
    TResult? Function()? fetchSimilarProduct,
    TResult? Function()? fetchMetaData,
    TResult? Function(MaterialNumber materialNumber)? fetchStock,
    TResult? Function(List<MaterialInfo> materials)? fetchStockForBundle,
    TResult? Function(int index)? changeImage,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    TResult? Function(int qty)? updateQty,
    TResult? Function(int quantity)? fetchItemQuantityForZdp5Discount,
    TResult? Function(bool exceedQty)? setExceedQty,
  }) {
    return fetchStock?.call(materialNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)?
        fetch,
    TResult Function()? fetchSimilarProduct,
    TResult Function()? fetchMetaData,
    TResult Function(MaterialNumber materialNumber)? fetchStock,
    TResult Function(List<MaterialInfo> materials)? fetchStockForBundle,
    TResult Function(int index)? changeImage,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    TResult Function(int qty)? updateQty,
    TResult Function(int quantity)? fetchItemQuantityForZdp5Discount,
    TResult Function(bool exceedQty)? setExceedQty,
    required TResult orElse(),
  }) {
    if (fetchStock != null) {
      return fetchStock(materialNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchSimilarProduct value) fetchSimilarProduct,
    required TResult Function(_FetchMetaData value) fetchMetaData,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_FetchStockForBundle value) fetchStockForBundle,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
    required TResult Function(_UpdateQty value) updateQty,
    required TResult Function(_FetchItemQuantityForZdp5Discount value)
        fetchItemQuantityForZdp5Discount,
    required TResult Function(_SetExceedQty value) setExceedQty,
  }) {
    return fetchStock(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult? Function(_FetchMetaData value)? fetchMetaData,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_FetchStockForBundle value)? fetchStockForBundle,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
    TResult? Function(_UpdateQty value)? updateQty,
    TResult? Function(_FetchItemQuantityForZdp5Discount value)?
        fetchItemQuantityForZdp5Discount,
    TResult? Function(_SetExceedQty value)? setExceedQty,
  }) {
    return fetchStock?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult Function(_FetchMetaData value)? fetchMetaData,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_FetchStockForBundle value)? fetchStockForBundle,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    TResult Function(_UpdateQty value)? updateQty,
    TResult Function(_FetchItemQuantityForZdp5Discount value)?
        fetchItemQuantityForZdp5Discount,
    TResult Function(_SetExceedQty value)? setExceedQty,
    required TResult orElse(),
  }) {
    if (fetchStock != null) {
      return fetchStock(this);
    }
    return orElse();
  }
}

abstract class _FetchStock implements ProductDetailEvent {
  factory _FetchStock({required final MaterialNumber materialNumber}) =
      _$FetchStockImpl;

  MaterialNumber get materialNumber;
  @JsonKey(ignore: true)
  _$$FetchStockImplCopyWith<_$FetchStockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchStockForBundleImplCopyWith<$Res> {
  factory _$$FetchStockForBundleImplCopyWith(_$FetchStockForBundleImpl value,
          $Res Function(_$FetchStockForBundleImpl) then) =
      __$$FetchStockForBundleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MaterialInfo> materials});
}

/// @nodoc
class __$$FetchStockForBundleImplCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res, _$FetchStockForBundleImpl>
    implements _$$FetchStockForBundleImplCopyWith<$Res> {
  __$$FetchStockForBundleImplCopyWithImpl(_$FetchStockForBundleImpl _value,
      $Res Function(_$FetchStockForBundleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materials = null,
  }) {
    return _then(_$FetchStockForBundleImpl(
      materials: null == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
    ));
  }
}

/// @nodoc

class _$FetchStockForBundleImpl implements _FetchStockForBundle {
  _$FetchStockForBundleImpl({required final List<MaterialInfo> materials})
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
    return 'ProductDetailEvent.fetchStockForBundle(materials: $materials)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchStockForBundleImpl &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_materials));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchStockForBundleImplCopyWith<_$FetchStockForBundleImpl> get copyWith =>
      __$$FetchStockForBundleImplCopyWithImpl<_$FetchStockForBundleImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)
        fetch,
    required TResult Function() fetchSimilarProduct,
    required TResult Function() fetchMetaData,
    required TResult Function(MaterialNumber materialNumber) fetchStock,
    required TResult Function(List<MaterialInfo> materials) fetchStockForBundle,
    required TResult Function(int index) changeImage,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        addFavourite,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        deleteFavourite,
    required TResult Function(int qty) updateQty,
    required TResult Function(int quantity) fetchItemQuantityForZdp5Discount,
    required TResult Function(bool exceedQty) setExceedQty,
  }) {
    return fetchStockForBundle(materials);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)?
        fetch,
    TResult? Function()? fetchSimilarProduct,
    TResult? Function()? fetchMetaData,
    TResult? Function(MaterialNumber materialNumber)? fetchStock,
    TResult? Function(List<MaterialInfo> materials)? fetchStockForBundle,
    TResult? Function(int index)? changeImage,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    TResult? Function(int qty)? updateQty,
    TResult? Function(int quantity)? fetchItemQuantityForZdp5Discount,
    TResult? Function(bool exceedQty)? setExceedQty,
  }) {
    return fetchStockForBundle?.call(materials);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)?
        fetch,
    TResult Function()? fetchSimilarProduct,
    TResult Function()? fetchMetaData,
    TResult Function(MaterialNumber materialNumber)? fetchStock,
    TResult Function(List<MaterialInfo> materials)? fetchStockForBundle,
    TResult Function(int index)? changeImage,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    TResult Function(int qty)? updateQty,
    TResult Function(int quantity)? fetchItemQuantityForZdp5Discount,
    TResult Function(bool exceedQty)? setExceedQty,
    required TResult orElse(),
  }) {
    if (fetchStockForBundle != null) {
      return fetchStockForBundle(materials);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchSimilarProduct value) fetchSimilarProduct,
    required TResult Function(_FetchMetaData value) fetchMetaData,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_FetchStockForBundle value) fetchStockForBundle,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
    required TResult Function(_UpdateQty value) updateQty,
    required TResult Function(_FetchItemQuantityForZdp5Discount value)
        fetchItemQuantityForZdp5Discount,
    required TResult Function(_SetExceedQty value) setExceedQty,
  }) {
    return fetchStockForBundle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult? Function(_FetchMetaData value)? fetchMetaData,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_FetchStockForBundle value)? fetchStockForBundle,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
    TResult? Function(_UpdateQty value)? updateQty,
    TResult? Function(_FetchItemQuantityForZdp5Discount value)?
        fetchItemQuantityForZdp5Discount,
    TResult? Function(_SetExceedQty value)? setExceedQty,
  }) {
    return fetchStockForBundle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult Function(_FetchMetaData value)? fetchMetaData,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_FetchStockForBundle value)? fetchStockForBundle,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    TResult Function(_UpdateQty value)? updateQty,
    TResult Function(_FetchItemQuantityForZdp5Discount value)?
        fetchItemQuantityForZdp5Discount,
    TResult Function(_SetExceedQty value)? setExceedQty,
    required TResult orElse(),
  }) {
    if (fetchStockForBundle != null) {
      return fetchStockForBundle(this);
    }
    return orElse();
  }
}

abstract class _FetchStockForBundle implements ProductDetailEvent {
  factory _FetchStockForBundle({required final List<MaterialInfo> materials}) =
      _$FetchStockForBundleImpl;

  List<MaterialInfo> get materials;
  @JsonKey(ignore: true)
  _$$FetchStockForBundleImplCopyWith<_$FetchStockForBundleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeImageImplCopyWith<$Res> {
  factory _$$ChangeImageImplCopyWith(
          _$ChangeImageImpl value, $Res Function(_$ChangeImageImpl) then) =
      __$$ChangeImageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$ChangeImageImplCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res, _$ChangeImageImpl>
    implements _$$ChangeImageImplCopyWith<$Res> {
  __$$ChangeImageImplCopyWithImpl(
      _$ChangeImageImpl _value, $Res Function(_$ChangeImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$ChangeImageImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChangeImageImpl implements _ChangeImage {
  _$ChangeImageImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'ProductDetailEvent.changeImage(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeImageImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeImageImplCopyWith<_$ChangeImageImpl> get copyWith =>
      __$$ChangeImageImplCopyWithImpl<_$ChangeImageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)
        fetch,
    required TResult Function() fetchSimilarProduct,
    required TResult Function() fetchMetaData,
    required TResult Function(MaterialNumber materialNumber) fetchStock,
    required TResult Function(List<MaterialInfo> materials) fetchStockForBundle,
    required TResult Function(int index) changeImage,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        addFavourite,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        deleteFavourite,
    required TResult Function(int qty) updateQty,
    required TResult Function(int quantity) fetchItemQuantityForZdp5Discount,
    required TResult Function(bool exceedQty) setExceedQty,
  }) {
    return changeImage(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)?
        fetch,
    TResult? Function()? fetchSimilarProduct,
    TResult? Function()? fetchMetaData,
    TResult? Function(MaterialNumber materialNumber)? fetchStock,
    TResult? Function(List<MaterialInfo> materials)? fetchStockForBundle,
    TResult? Function(int index)? changeImage,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    TResult? Function(int qty)? updateQty,
    TResult? Function(int quantity)? fetchItemQuantityForZdp5Discount,
    TResult? Function(bool exceedQty)? setExceedQty,
  }) {
    return changeImage?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)?
        fetch,
    TResult Function()? fetchSimilarProduct,
    TResult Function()? fetchMetaData,
    TResult Function(MaterialNumber materialNumber)? fetchStock,
    TResult Function(List<MaterialInfo> materials)? fetchStockForBundle,
    TResult Function(int index)? changeImage,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    TResult Function(int qty)? updateQty,
    TResult Function(int quantity)? fetchItemQuantityForZdp5Discount,
    TResult Function(bool exceedQty)? setExceedQty,
    required TResult orElse(),
  }) {
    if (changeImage != null) {
      return changeImage(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchSimilarProduct value) fetchSimilarProduct,
    required TResult Function(_FetchMetaData value) fetchMetaData,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_FetchStockForBundle value) fetchStockForBundle,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
    required TResult Function(_UpdateQty value) updateQty,
    required TResult Function(_FetchItemQuantityForZdp5Discount value)
        fetchItemQuantityForZdp5Discount,
    required TResult Function(_SetExceedQty value) setExceedQty,
  }) {
    return changeImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult? Function(_FetchMetaData value)? fetchMetaData,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_FetchStockForBundle value)? fetchStockForBundle,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
    TResult? Function(_UpdateQty value)? updateQty,
    TResult? Function(_FetchItemQuantityForZdp5Discount value)?
        fetchItemQuantityForZdp5Discount,
    TResult? Function(_SetExceedQty value)? setExceedQty,
  }) {
    return changeImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult Function(_FetchMetaData value)? fetchMetaData,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_FetchStockForBundle value)? fetchStockForBundle,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    TResult Function(_UpdateQty value)? updateQty,
    TResult Function(_FetchItemQuantityForZdp5Discount value)?
        fetchItemQuantityForZdp5Discount,
    TResult Function(_SetExceedQty value)? setExceedQty,
    required TResult orElse(),
  }) {
    if (changeImage != null) {
      return changeImage(this);
    }
    return orElse();
  }
}

abstract class _ChangeImage implements ProductDetailEvent {
  factory _ChangeImage(final int index) = _$ChangeImageImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$ChangeImageImplCopyWith<_$ChangeImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddFavouriteImplCopyWith<$Res> {
  factory _$$AddFavouriteImplCopyWith(
          _$AddFavouriteImpl value, $Res Function(_$AddFavouriteImpl) then) =
      __$$AddFavouriteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isForSimilarProduct, MaterialNumber materialNumber});
}

/// @nodoc
class __$$AddFavouriteImplCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res, _$AddFavouriteImpl>
    implements _$$AddFavouriteImplCopyWith<$Res> {
  __$$AddFavouriteImplCopyWithImpl(
      _$AddFavouriteImpl _value, $Res Function(_$AddFavouriteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isForSimilarProduct = null,
    Object? materialNumber = null,
  }) {
    return _then(_$AddFavouriteImpl(
      isForSimilarProduct: null == isForSimilarProduct
          ? _value.isForSimilarProduct
          : isForSimilarProduct // ignore: cast_nullable_to_non_nullable
              as bool,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
    ));
  }
}

/// @nodoc

class _$AddFavouriteImpl implements _AddFavourite {
  _$AddFavouriteImpl(
      {required this.isForSimilarProduct, required this.materialNumber});

  @override
  final bool isForSimilarProduct;
  @override
  final MaterialNumber materialNumber;

  @override
  String toString() {
    return 'ProductDetailEvent.addFavourite(isForSimilarProduct: $isForSimilarProduct, materialNumber: $materialNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddFavouriteImpl &&
            (identical(other.isForSimilarProduct, isForSimilarProduct) ||
                other.isForSimilarProduct == isForSimilarProduct) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isForSimilarProduct, materialNumber);

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
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)
        fetch,
    required TResult Function() fetchSimilarProduct,
    required TResult Function() fetchMetaData,
    required TResult Function(MaterialNumber materialNumber) fetchStock,
    required TResult Function(List<MaterialInfo> materials) fetchStockForBundle,
    required TResult Function(int index) changeImage,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        addFavourite,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        deleteFavourite,
    required TResult Function(int qty) updateQty,
    required TResult Function(int quantity) fetchItemQuantityForZdp5Discount,
    required TResult Function(bool exceedQty) setExceedQty,
  }) {
    return addFavourite(isForSimilarProduct, materialNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)?
        fetch,
    TResult? Function()? fetchSimilarProduct,
    TResult? Function()? fetchMetaData,
    TResult? Function(MaterialNumber materialNumber)? fetchStock,
    TResult? Function(List<MaterialInfo> materials)? fetchStockForBundle,
    TResult? Function(int index)? changeImage,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    TResult? Function(int qty)? updateQty,
    TResult? Function(int quantity)? fetchItemQuantityForZdp5Discount,
    TResult? Function(bool exceedQty)? setExceedQty,
  }) {
    return addFavourite?.call(isForSimilarProduct, materialNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)?
        fetch,
    TResult Function()? fetchSimilarProduct,
    TResult Function()? fetchMetaData,
    TResult Function(MaterialNumber materialNumber)? fetchStock,
    TResult Function(List<MaterialInfo> materials)? fetchStockForBundle,
    TResult Function(int index)? changeImage,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    TResult Function(int qty)? updateQty,
    TResult Function(int quantity)? fetchItemQuantityForZdp5Discount,
    TResult Function(bool exceedQty)? setExceedQty,
    required TResult orElse(),
  }) {
    if (addFavourite != null) {
      return addFavourite(isForSimilarProduct, materialNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchSimilarProduct value) fetchSimilarProduct,
    required TResult Function(_FetchMetaData value) fetchMetaData,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_FetchStockForBundle value) fetchStockForBundle,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
    required TResult Function(_UpdateQty value) updateQty,
    required TResult Function(_FetchItemQuantityForZdp5Discount value)
        fetchItemQuantityForZdp5Discount,
    required TResult Function(_SetExceedQty value) setExceedQty,
  }) {
    return addFavourite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult? Function(_FetchMetaData value)? fetchMetaData,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_FetchStockForBundle value)? fetchStockForBundle,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
    TResult? Function(_UpdateQty value)? updateQty,
    TResult? Function(_FetchItemQuantityForZdp5Discount value)?
        fetchItemQuantityForZdp5Discount,
    TResult? Function(_SetExceedQty value)? setExceedQty,
  }) {
    return addFavourite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult Function(_FetchMetaData value)? fetchMetaData,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_FetchStockForBundle value)? fetchStockForBundle,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    TResult Function(_UpdateQty value)? updateQty,
    TResult Function(_FetchItemQuantityForZdp5Discount value)?
        fetchItemQuantityForZdp5Discount,
    TResult Function(_SetExceedQty value)? setExceedQty,
    required TResult orElse(),
  }) {
    if (addFavourite != null) {
      return addFavourite(this);
    }
    return orElse();
  }
}

abstract class _AddFavourite implements ProductDetailEvent {
  factory _AddFavourite(
      {required final bool isForSimilarProduct,
      required final MaterialNumber materialNumber}) = _$AddFavouriteImpl;

  bool get isForSimilarProduct;
  MaterialNumber get materialNumber;
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
  $Res call({bool isForSimilarProduct, MaterialNumber materialNumber});
}

/// @nodoc
class __$$DeleteFavouriteImplCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res, _$DeleteFavouriteImpl>
    implements _$$DeleteFavouriteImplCopyWith<$Res> {
  __$$DeleteFavouriteImplCopyWithImpl(
      _$DeleteFavouriteImpl _value, $Res Function(_$DeleteFavouriteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isForSimilarProduct = null,
    Object? materialNumber = null,
  }) {
    return _then(_$DeleteFavouriteImpl(
      isForSimilarProduct: null == isForSimilarProduct
          ? _value.isForSimilarProduct
          : isForSimilarProduct // ignore: cast_nullable_to_non_nullable
              as bool,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
    ));
  }
}

/// @nodoc

class _$DeleteFavouriteImpl implements _DeleteFavourite {
  _$DeleteFavouriteImpl(
      {required this.isForSimilarProduct, required this.materialNumber});

  @override
  final bool isForSimilarProduct;
  @override
  final MaterialNumber materialNumber;

  @override
  String toString() {
    return 'ProductDetailEvent.deleteFavourite(isForSimilarProduct: $isForSimilarProduct, materialNumber: $materialNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteFavouriteImpl &&
            (identical(other.isForSimilarProduct, isForSimilarProduct) ||
                other.isForSimilarProduct == isForSimilarProduct) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isForSimilarProduct, materialNumber);

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
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)
        fetch,
    required TResult Function() fetchSimilarProduct,
    required TResult Function() fetchMetaData,
    required TResult Function(MaterialNumber materialNumber) fetchStock,
    required TResult Function(List<MaterialInfo> materials) fetchStockForBundle,
    required TResult Function(int index) changeImage,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        addFavourite,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        deleteFavourite,
    required TResult Function(int qty) updateQty,
    required TResult Function(int quantity) fetchItemQuantityForZdp5Discount,
    required TResult Function(bool exceedQty) setExceedQty,
  }) {
    return deleteFavourite(isForSimilarProduct, materialNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)?
        fetch,
    TResult? Function()? fetchSimilarProduct,
    TResult? Function()? fetchMetaData,
    TResult? Function(MaterialNumber materialNumber)? fetchStock,
    TResult? Function(List<MaterialInfo> materials)? fetchStockForBundle,
    TResult? Function(int index)? changeImage,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    TResult? Function(int qty)? updateQty,
    TResult? Function(int quantity)? fetchItemQuantityForZdp5Discount,
    TResult? Function(bool exceedQty)? setExceedQty,
  }) {
    return deleteFavourite?.call(isForSimilarProduct, materialNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)?
        fetch,
    TResult Function()? fetchSimilarProduct,
    TResult Function()? fetchMetaData,
    TResult Function(MaterialNumber materialNumber)? fetchStock,
    TResult Function(List<MaterialInfo> materials)? fetchStockForBundle,
    TResult Function(int index)? changeImage,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    TResult Function(int qty)? updateQty,
    TResult Function(int quantity)? fetchItemQuantityForZdp5Discount,
    TResult Function(bool exceedQty)? setExceedQty,
    required TResult orElse(),
  }) {
    if (deleteFavourite != null) {
      return deleteFavourite(isForSimilarProduct, materialNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchSimilarProduct value) fetchSimilarProduct,
    required TResult Function(_FetchMetaData value) fetchMetaData,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_FetchStockForBundle value) fetchStockForBundle,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
    required TResult Function(_UpdateQty value) updateQty,
    required TResult Function(_FetchItemQuantityForZdp5Discount value)
        fetchItemQuantityForZdp5Discount,
    required TResult Function(_SetExceedQty value) setExceedQty,
  }) {
    return deleteFavourite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult? Function(_FetchMetaData value)? fetchMetaData,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_FetchStockForBundle value)? fetchStockForBundle,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
    TResult? Function(_UpdateQty value)? updateQty,
    TResult? Function(_FetchItemQuantityForZdp5Discount value)?
        fetchItemQuantityForZdp5Discount,
    TResult? Function(_SetExceedQty value)? setExceedQty,
  }) {
    return deleteFavourite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult Function(_FetchMetaData value)? fetchMetaData,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_FetchStockForBundle value)? fetchStockForBundle,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    TResult Function(_UpdateQty value)? updateQty,
    TResult Function(_FetchItemQuantityForZdp5Discount value)?
        fetchItemQuantityForZdp5Discount,
    TResult Function(_SetExceedQty value)? setExceedQty,
    required TResult orElse(),
  }) {
    if (deleteFavourite != null) {
      return deleteFavourite(this);
    }
    return orElse();
  }
}

abstract class _DeleteFavourite implements ProductDetailEvent {
  factory _DeleteFavourite(
      {required final bool isForSimilarProduct,
      required final MaterialNumber materialNumber}) = _$DeleteFavouriteImpl;

  bool get isForSimilarProduct;
  MaterialNumber get materialNumber;
  @JsonKey(ignore: true)
  _$$DeleteFavouriteImplCopyWith<_$DeleteFavouriteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateQtyImplCopyWith<$Res> {
  factory _$$UpdateQtyImplCopyWith(
          _$UpdateQtyImpl value, $Res Function(_$UpdateQtyImpl) then) =
      __$$UpdateQtyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int qty});
}

/// @nodoc
class __$$UpdateQtyImplCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res, _$UpdateQtyImpl>
    implements _$$UpdateQtyImplCopyWith<$Res> {
  __$$UpdateQtyImplCopyWithImpl(
      _$UpdateQtyImpl _value, $Res Function(_$UpdateQtyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qty = null,
  }) {
    return _then(_$UpdateQtyImpl(
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UpdateQtyImpl implements _UpdateQty {
  _$UpdateQtyImpl({required this.qty});

  @override
  final int qty;

  @override
  String toString() {
    return 'ProductDetailEvent.updateQty(qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateQtyImpl &&
            (identical(other.qty, qty) || other.qty == qty));
  }

  @override
  int get hashCode => Object.hash(runtimeType, qty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateQtyImplCopyWith<_$UpdateQtyImpl> get copyWith =>
      __$$UpdateQtyImplCopyWithImpl<_$UpdateQtyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)
        fetch,
    required TResult Function() fetchSimilarProduct,
    required TResult Function() fetchMetaData,
    required TResult Function(MaterialNumber materialNumber) fetchStock,
    required TResult Function(List<MaterialInfo> materials) fetchStockForBundle,
    required TResult Function(int index) changeImage,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        addFavourite,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        deleteFavourite,
    required TResult Function(int qty) updateQty,
    required TResult Function(int quantity) fetchItemQuantityForZdp5Discount,
    required TResult Function(bool exceedQty) setExceedQty,
  }) {
    return updateQty(qty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)?
        fetch,
    TResult? Function()? fetchSimilarProduct,
    TResult? Function()? fetchMetaData,
    TResult? Function(MaterialNumber materialNumber)? fetchStock,
    TResult? Function(List<MaterialInfo> materials)? fetchStockForBundle,
    TResult? Function(int index)? changeImage,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    TResult? Function(int qty)? updateQty,
    TResult? Function(int quantity)? fetchItemQuantityForZdp5Discount,
    TResult? Function(bool exceedQty)? setExceedQty,
  }) {
    return updateQty?.call(qty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)?
        fetch,
    TResult Function()? fetchSimilarProduct,
    TResult Function()? fetchMetaData,
    TResult Function(MaterialNumber materialNumber)? fetchStock,
    TResult Function(List<MaterialInfo> materials)? fetchStockForBundle,
    TResult Function(int index)? changeImage,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    TResult Function(int qty)? updateQty,
    TResult Function(int quantity)? fetchItemQuantityForZdp5Discount,
    TResult Function(bool exceedQty)? setExceedQty,
    required TResult orElse(),
  }) {
    if (updateQty != null) {
      return updateQty(qty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchSimilarProduct value) fetchSimilarProduct,
    required TResult Function(_FetchMetaData value) fetchMetaData,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_FetchStockForBundle value) fetchStockForBundle,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
    required TResult Function(_UpdateQty value) updateQty,
    required TResult Function(_FetchItemQuantityForZdp5Discount value)
        fetchItemQuantityForZdp5Discount,
    required TResult Function(_SetExceedQty value) setExceedQty,
  }) {
    return updateQty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult? Function(_FetchMetaData value)? fetchMetaData,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_FetchStockForBundle value)? fetchStockForBundle,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
    TResult? Function(_UpdateQty value)? updateQty,
    TResult? Function(_FetchItemQuantityForZdp5Discount value)?
        fetchItemQuantityForZdp5Discount,
    TResult? Function(_SetExceedQty value)? setExceedQty,
  }) {
    return updateQty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult Function(_FetchMetaData value)? fetchMetaData,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_FetchStockForBundle value)? fetchStockForBundle,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    TResult Function(_UpdateQty value)? updateQty,
    TResult Function(_FetchItemQuantityForZdp5Discount value)?
        fetchItemQuantityForZdp5Discount,
    TResult Function(_SetExceedQty value)? setExceedQty,
    required TResult orElse(),
  }) {
    if (updateQty != null) {
      return updateQty(this);
    }
    return orElse();
  }
}

abstract class _UpdateQty implements ProductDetailEvent {
  factory _UpdateQty({required final int qty}) = _$UpdateQtyImpl;

  int get qty;
  @JsonKey(ignore: true)
  _$$UpdateQtyImplCopyWith<_$UpdateQtyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchItemQuantityForZdp5DiscountImplCopyWith<$Res> {
  factory _$$FetchItemQuantityForZdp5DiscountImplCopyWith(
          _$FetchItemQuantityForZdp5DiscountImpl value,
          $Res Function(_$FetchItemQuantityForZdp5DiscountImpl) then) =
      __$$FetchItemQuantityForZdp5DiscountImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int quantity});
}

/// @nodoc
class __$$FetchItemQuantityForZdp5DiscountImplCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res,
        _$FetchItemQuantityForZdp5DiscountImpl>
    implements _$$FetchItemQuantityForZdp5DiscountImplCopyWith<$Res> {
  __$$FetchItemQuantityForZdp5DiscountImplCopyWithImpl(
      _$FetchItemQuantityForZdp5DiscountImpl _value,
      $Res Function(_$FetchItemQuantityForZdp5DiscountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
  }) {
    return _then(_$FetchItemQuantityForZdp5DiscountImpl(
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchItemQuantityForZdp5DiscountImpl
    implements _FetchItemQuantityForZdp5Discount {
  const _$FetchItemQuantityForZdp5DiscountImpl({required this.quantity});

  @override
  final int quantity;

  @override
  String toString() {
    return 'ProductDetailEvent.fetchItemQuantityForZdp5Discount(quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchItemQuantityForZdp5DiscountImpl &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchItemQuantityForZdp5DiscountImplCopyWith<
          _$FetchItemQuantityForZdp5DiscountImpl>
      get copyWith => __$$FetchItemQuantityForZdp5DiscountImplCopyWithImpl<
          _$FetchItemQuantityForZdp5DiscountImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)
        fetch,
    required TResult Function() fetchSimilarProduct,
    required TResult Function() fetchMetaData,
    required TResult Function(MaterialNumber materialNumber) fetchStock,
    required TResult Function(List<MaterialInfo> materials) fetchStockForBundle,
    required TResult Function(int index) changeImage,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        addFavourite,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        deleteFavourite,
    required TResult Function(int qty) updateQty,
    required TResult Function(int quantity) fetchItemQuantityForZdp5Discount,
    required TResult Function(bool exceedQty) setExceedQty,
  }) {
    return fetchItemQuantityForZdp5Discount(quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)?
        fetch,
    TResult? Function()? fetchSimilarProduct,
    TResult? Function()? fetchMetaData,
    TResult? Function(MaterialNumber materialNumber)? fetchStock,
    TResult? Function(List<MaterialInfo> materials)? fetchStockForBundle,
    TResult? Function(int index)? changeImage,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    TResult? Function(int qty)? updateQty,
    TResult? Function(int quantity)? fetchItemQuantityForZdp5Discount,
    TResult? Function(bool exceedQty)? setExceedQty,
  }) {
    return fetchItemQuantityForZdp5Discount?.call(quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)?
        fetch,
    TResult Function()? fetchSimilarProduct,
    TResult Function()? fetchMetaData,
    TResult Function(MaterialNumber materialNumber)? fetchStock,
    TResult Function(List<MaterialInfo> materials)? fetchStockForBundle,
    TResult Function(int index)? changeImage,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    TResult Function(int qty)? updateQty,
    TResult Function(int quantity)? fetchItemQuantityForZdp5Discount,
    TResult Function(bool exceedQty)? setExceedQty,
    required TResult orElse(),
  }) {
    if (fetchItemQuantityForZdp5Discount != null) {
      return fetchItemQuantityForZdp5Discount(quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchSimilarProduct value) fetchSimilarProduct,
    required TResult Function(_FetchMetaData value) fetchMetaData,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_FetchStockForBundle value) fetchStockForBundle,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
    required TResult Function(_UpdateQty value) updateQty,
    required TResult Function(_FetchItemQuantityForZdp5Discount value)
        fetchItemQuantityForZdp5Discount,
    required TResult Function(_SetExceedQty value) setExceedQty,
  }) {
    return fetchItemQuantityForZdp5Discount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult? Function(_FetchMetaData value)? fetchMetaData,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_FetchStockForBundle value)? fetchStockForBundle,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
    TResult? Function(_UpdateQty value)? updateQty,
    TResult? Function(_FetchItemQuantityForZdp5Discount value)?
        fetchItemQuantityForZdp5Discount,
    TResult? Function(_SetExceedQty value)? setExceedQty,
  }) {
    return fetchItemQuantityForZdp5Discount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult Function(_FetchMetaData value)? fetchMetaData,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_FetchStockForBundle value)? fetchStockForBundle,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    TResult Function(_UpdateQty value)? updateQty,
    TResult Function(_FetchItemQuantityForZdp5Discount value)?
        fetchItemQuantityForZdp5Discount,
    TResult Function(_SetExceedQty value)? setExceedQty,
    required TResult orElse(),
  }) {
    if (fetchItemQuantityForZdp5Discount != null) {
      return fetchItemQuantityForZdp5Discount(this);
    }
    return orElse();
  }
}

abstract class _FetchItemQuantityForZdp5Discount implements ProductDetailEvent {
  const factory _FetchItemQuantityForZdp5Discount(
      {required final int quantity}) = _$FetchItemQuantityForZdp5DiscountImpl;

  int get quantity;
  @JsonKey(ignore: true)
  _$$FetchItemQuantityForZdp5DiscountImplCopyWith<
          _$FetchItemQuantityForZdp5DiscountImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetExceedQtyImplCopyWith<$Res> {
  factory _$$SetExceedQtyImplCopyWith(
          _$SetExceedQtyImpl value, $Res Function(_$SetExceedQtyImpl) then) =
      __$$SetExceedQtyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool exceedQty});
}

/// @nodoc
class __$$SetExceedQtyImplCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res, _$SetExceedQtyImpl>
    implements _$$SetExceedQtyImplCopyWith<$Res> {
  __$$SetExceedQtyImplCopyWithImpl(
      _$SetExceedQtyImpl _value, $Res Function(_$SetExceedQtyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exceedQty = null,
  }) {
    return _then(_$SetExceedQtyImpl(
      exceedQty: null == exceedQty
          ? _value.exceedQty
          : exceedQty // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SetExceedQtyImpl implements _SetExceedQty {
  const _$SetExceedQtyImpl({required this.exceedQty});

  @override
  final bool exceedQty;

  @override
  String toString() {
    return 'ProductDetailEvent.setExceedQty(exceedQty: $exceedQty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetExceedQtyImpl &&
            (identical(other.exceedQty, exceedQty) ||
                other.exceedQty == exceedQty));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exceedQty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetExceedQtyImplCopyWith<_$SetExceedQtyImpl> get copyWith =>
      __$$SetExceedQtyImplCopyWithImpl<_$SetExceedQtyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)
        fetch,
    required TResult Function() fetchSimilarProduct,
    required TResult Function() fetchMetaData,
    required TResult Function(MaterialNumber materialNumber) fetchStock,
    required TResult Function(List<MaterialInfo> materials) fetchStockForBundle,
    required TResult Function(int index) changeImage,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        addFavourite,
    required TResult Function(
            bool isForSimilarProduct, MaterialNumber materialNumber)
        deleteFavourite,
    required TResult Function(int qty) updateQty,
    required TResult Function(int quantity) fetchItemQuantityForZdp5Discount,
    required TResult Function(bool exceedQty) setExceedQty,
  }) {
    return setExceedQty(exceedQty);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)?
        fetch,
    TResult? Function()? fetchSimilarProduct,
    TResult? Function()? fetchMetaData,
    TResult? Function(MaterialNumber materialNumber)? fetchStock,
    TResult? Function(List<MaterialInfo> materials)? fetchStockForBundle,
    TResult? Function(int index)? changeImage,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult? Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    TResult? Function(int qty)? updateQty,
    TResult? Function(int quantity)? fetchItemQuantityForZdp5Discount,
    TResult? Function(bool exceedQty)? setExceedQty,
  }) {
    return setExceedQty?.call(exceedQty);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            MaterialInfo materialInfo)?
        fetch,
    TResult Function()? fetchSimilarProduct,
    TResult Function()? fetchMetaData,
    TResult Function(MaterialNumber materialNumber)? fetchStock,
    TResult Function(List<MaterialInfo> materials)? fetchStockForBundle,
    TResult Function(int index)? changeImage,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        addFavourite,
    TResult Function(bool isForSimilarProduct, MaterialNumber materialNumber)?
        deleteFavourite,
    TResult Function(int qty)? updateQty,
    TResult Function(int quantity)? fetchItemQuantityForZdp5Discount,
    TResult Function(bool exceedQty)? setExceedQty,
    required TResult orElse(),
  }) {
    if (setExceedQty != null) {
      return setExceedQty(exceedQty);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchSimilarProduct value) fetchSimilarProduct,
    required TResult Function(_FetchMetaData value) fetchMetaData,
    required TResult Function(_FetchStock value) fetchStock,
    required TResult Function(_FetchStockForBundle value) fetchStockForBundle,
    required TResult Function(_ChangeImage value) changeImage,
    required TResult Function(_AddFavourite value) addFavourite,
    required TResult Function(_DeleteFavourite value) deleteFavourite,
    required TResult Function(_UpdateQty value) updateQty,
    required TResult Function(_FetchItemQuantityForZdp5Discount value)
        fetchItemQuantityForZdp5Discount,
    required TResult Function(_SetExceedQty value) setExceedQty,
  }) {
    return setExceedQty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult? Function(_FetchMetaData value)? fetchMetaData,
    TResult? Function(_FetchStock value)? fetchStock,
    TResult? Function(_FetchStockForBundle value)? fetchStockForBundle,
    TResult? Function(_ChangeImage value)? changeImage,
    TResult? Function(_AddFavourite value)? addFavourite,
    TResult? Function(_DeleteFavourite value)? deleteFavourite,
    TResult? Function(_UpdateQty value)? updateQty,
    TResult? Function(_FetchItemQuantityForZdp5Discount value)?
        fetchItemQuantityForZdp5Discount,
    TResult? Function(_SetExceedQty value)? setExceedQty,
  }) {
    return setExceedQty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchSimilarProduct value)? fetchSimilarProduct,
    TResult Function(_FetchMetaData value)? fetchMetaData,
    TResult Function(_FetchStock value)? fetchStock,
    TResult Function(_FetchStockForBundle value)? fetchStockForBundle,
    TResult Function(_ChangeImage value)? changeImage,
    TResult Function(_AddFavourite value)? addFavourite,
    TResult Function(_DeleteFavourite value)? deleteFavourite,
    TResult Function(_UpdateQty value)? updateQty,
    TResult Function(_FetchItemQuantityForZdp5Discount value)?
        fetchItemQuantityForZdp5Discount,
    TResult Function(_SetExceedQty value)? setExceedQty,
    required TResult orElse(),
  }) {
    if (setExceedQty != null) {
      return setExceedQty(this);
    }
    return orElse();
  }
}

abstract class _SetExceedQty implements ProductDetailEvent {
  const factory _SetExceedQty({required final bool exceedQty}) =
      _$SetExceedQtyImpl;

  bool get exceedQty;
  @JsonKey(ignore: true)
  _$$SetExceedQtyImplCopyWith<_$SetExceedQtyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductDetailState {
  User get user => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  ShipToInfo get shipToInfo => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  ProductDetailAggregate get productDetailAggregate =>
      throw _privateConstructorUsedError;
  bool get isDetailFetching => throw _privateConstructorUsedError;
  bool get isStockFetching => throw _privateConstructorUsedError;
  bool get isRelatedProductsFetching => throw _privateConstructorUsedError;
  bool get isMetadataFetching => throw _privateConstructorUsedError;
  int get inputQty => throw _privateConstructorUsedError;
  int get selectedImageIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductDetailStateCopyWith<ProductDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailStateCopyWith<$Res> {
  factory $ProductDetailStateCopyWith(
          ProductDetailState value, $Res Function(ProductDetailState) then) =
      _$ProductDetailStateCopyWithImpl<$Res, ProductDetailState>;
  @useResult
  $Res call(
      {User user,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      ProductDetailAggregate productDetailAggregate,
      bool isDetailFetching,
      bool isStockFetching,
      bool isRelatedProductsFetching,
      bool isMetadataFetching,
      int inputQty,
      int selectedImageIndex});

  $UserCopyWith<$Res> get user;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $ProductDetailAggregateCopyWith<$Res> get productDetailAggregate;
}

/// @nodoc
class _$ProductDetailStateCopyWithImpl<$Res, $Val extends ProductDetailState>
    implements $ProductDetailStateCopyWith<$Res> {
  _$ProductDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? failureOrSuccessOption = null,
    Object? productDetailAggregate = null,
    Object? isDetailFetching = null,
    Object? isStockFetching = null,
    Object? isRelatedProductsFetching = null,
    Object? isMetadataFetching = null,
    Object? inputQty = null,
    Object? selectedImageIndex = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
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
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      productDetailAggregate: null == productDetailAggregate
          ? _value.productDetailAggregate
          : productDetailAggregate // ignore: cast_nullable_to_non_nullable
              as ProductDetailAggregate,
      isDetailFetching: null == isDetailFetching
          ? _value.isDetailFetching
          : isDetailFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isStockFetching: null == isStockFetching
          ? _value.isStockFetching
          : isStockFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isRelatedProductsFetching: null == isRelatedProductsFetching
          ? _value.isRelatedProductsFetching
          : isRelatedProductsFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isMetadataFetching: null == isMetadataFetching
          ? _value.isMetadataFetching
          : isMetadataFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      inputQty: null == inputQty
          ? _value.inputQty
          : inputQty // ignore: cast_nullable_to_non_nullable
              as int,
      selectedImageIndex: null == selectedImageIndex
          ? _value.selectedImageIndex
          : selectedImageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
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
  $ProductDetailAggregateCopyWith<$Res> get productDetailAggregate {
    return $ProductDetailAggregateCopyWith<$Res>(_value.productDetailAggregate,
        (value) {
      return _then(_value.copyWith(productDetailAggregate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductDetailStateImplCopyWith<$Res>
    implements $ProductDetailStateCopyWith<$Res> {
  factory _$$ProductDetailStateImplCopyWith(_$ProductDetailStateImpl value,
          $Res Function(_$ProductDetailStateImpl) then) =
      __$$ProductDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User user,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      ProductDetailAggregate productDetailAggregate,
      bool isDetailFetching,
      bool isStockFetching,
      bool isRelatedProductsFetching,
      bool isMetadataFetching,
      int inputQty,
      int selectedImageIndex});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  @override
  $ProductDetailAggregateCopyWith<$Res> get productDetailAggregate;
}

/// @nodoc
class __$$ProductDetailStateImplCopyWithImpl<$Res>
    extends _$ProductDetailStateCopyWithImpl<$Res, _$ProductDetailStateImpl>
    implements _$$ProductDetailStateImplCopyWith<$Res> {
  __$$ProductDetailStateImplCopyWithImpl(_$ProductDetailStateImpl _value,
      $Res Function(_$ProductDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? failureOrSuccessOption = null,
    Object? productDetailAggregate = null,
    Object? isDetailFetching = null,
    Object? isStockFetching = null,
    Object? isRelatedProductsFetching = null,
    Object? isMetadataFetching = null,
    Object? inputQty = null,
    Object? selectedImageIndex = null,
  }) {
    return _then(_$ProductDetailStateImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
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
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      productDetailAggregate: null == productDetailAggregate
          ? _value.productDetailAggregate
          : productDetailAggregate // ignore: cast_nullable_to_non_nullable
              as ProductDetailAggregate,
      isDetailFetching: null == isDetailFetching
          ? _value.isDetailFetching
          : isDetailFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isStockFetching: null == isStockFetching
          ? _value.isStockFetching
          : isStockFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isRelatedProductsFetching: null == isRelatedProductsFetching
          ? _value.isRelatedProductsFetching
          : isRelatedProductsFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isMetadataFetching: null == isMetadataFetching
          ? _value.isMetadataFetching
          : isMetadataFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      inputQty: null == inputQty
          ? _value.inputQty
          : inputQty // ignore: cast_nullable_to_non_nullable
              as int,
      selectedImageIndex: null == selectedImageIndex
          ? _value.selectedImageIndex
          : selectedImageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ProductDetailStateImpl extends _ProductDetailState {
  const _$ProductDetailStateImpl(
      {required this.user,
      required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.failureOrSuccessOption,
      required this.productDetailAggregate,
      required this.isDetailFetching,
      required this.isStockFetching,
      required this.isRelatedProductsFetching,
      required this.isMetadataFetching,
      required this.inputQty,
      this.selectedImageIndex = 0})
      : super._();

  @override
  final User user;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  @override
  final ProductDetailAggregate productDetailAggregate;
  @override
  final bool isDetailFetching;
  @override
  final bool isStockFetching;
  @override
  final bool isRelatedProductsFetching;
  @override
  final bool isMetadataFetching;
  @override
  final int inputQty;
  @override
  @JsonKey()
  final int selectedImageIndex;

  @override
  String toString() {
    return 'ProductDetailState(user: $user, salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, failureOrSuccessOption: $failureOrSuccessOption, productDetailAggregate: $productDetailAggregate, isDetailFetching: $isDetailFetching, isStockFetching: $isStockFetching, isRelatedProductsFetching: $isRelatedProductsFetching, isMetadataFetching: $isMetadataFetching, inputQty: $inputQty, selectedImageIndex: $selectedImageIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.productDetailAggregate, productDetailAggregate) ||
                other.productDetailAggregate == productDetailAggregate) &&
            (identical(other.isDetailFetching, isDetailFetching) ||
                other.isDetailFetching == isDetailFetching) &&
            (identical(other.isStockFetching, isStockFetching) ||
                other.isStockFetching == isStockFetching) &&
            (identical(other.isRelatedProductsFetching,
                    isRelatedProductsFetching) ||
                other.isRelatedProductsFetching == isRelatedProductsFetching) &&
            (identical(other.isMetadataFetching, isMetadataFetching) ||
                other.isMetadataFetching == isMetadataFetching) &&
            (identical(other.inputQty, inputQty) ||
                other.inputQty == inputQty) &&
            (identical(other.selectedImageIndex, selectedImageIndex) ||
                other.selectedImageIndex == selectedImageIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      salesOrganisation,
      customerCodeInfo,
      shipToInfo,
      failureOrSuccessOption,
      productDetailAggregate,
      isDetailFetching,
      isStockFetching,
      isRelatedProductsFetching,
      isMetadataFetching,
      inputQty,
      selectedImageIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDetailStateImplCopyWith<_$ProductDetailStateImpl> get copyWith =>
      __$$ProductDetailStateImplCopyWithImpl<_$ProductDetailStateImpl>(
          this, _$identity);
}

abstract class _ProductDetailState extends ProductDetailState {
  const factory _ProductDetailState(
      {required final User user,
      required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final ProductDetailAggregate productDetailAggregate,
      required final bool isDetailFetching,
      required final bool isStockFetching,
      required final bool isRelatedProductsFetching,
      required final bool isMetadataFetching,
      required final int inputQty,
      final int selectedImageIndex}) = _$ProductDetailStateImpl;
  const _ProductDetailState._() : super._();

  @override
  User get user;
  @override
  SalesOrganisation get salesOrganisation;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  ShipToInfo get shipToInfo;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  ProductDetailAggregate get productDetailAggregate;
  @override
  bool get isDetailFetching;
  @override
  bool get isStockFetching;
  @override
  bool get isRelatedProductsFetching;
  @override
  bool get isMetadataFetching;
  @override
  int get inputQty;
  @override
  int get selectedImageIndex;
  @override
  @JsonKey(ignore: true)
  _$$ProductDetailStateImplCopyWith<_$ProductDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)
        addHistoryItemsToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function() updatePriceForIdMarket,
    required TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)
        updateProductDetermination,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
    required TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)
        updateTenderContract,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult? Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function()? updatePriceForIdMarket,
    TResult? Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
    TResult? Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function()? updatePriceForIdMarket,
    TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_UpdateProductDetermination value)
        updateProductDetermination,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
    required TResult Function(_UpdateTenderContract value) updateTenderContract,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult? Function(_UpdateTenderContract value)? updateTenderContract,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult Function(_UpdateTenderContract value)? updateTenderContract,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartEventCopyWith<$Res> {
  factory $CartEventCopyWith(CartEvent value, $Res Function(CartEvent) then) =
      _$CartEventCopyWithImpl<$Res, CartEvent>;
}

/// @nodoc
class _$CartEventCopyWithImpl<$Res, $Val extends CartEvent>
    implements $CartEventCopyWith<$Res> {
  _$CartEventCopyWithImpl(this._value, this._then);

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
      {SalesOrganisationConfigs salesOrganisationConfigs,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      User user});

  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisationConfigs = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? user = null,
  }) {
    return _then(_$InitializedImpl(
      salesOrganisationConfigs: null == salesOrganisationConfigs
          ? _value.salesOrganisationConfigs
          : salesOrganisationConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
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
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(
        _value.salesOrganisationConfigs, (value) {
      return _then(_value.copyWith(salesOrganisationConfigs: value));
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
      {required this.salesOrganisationConfigs,
      required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.user});

  @override
  final SalesOrganisationConfigs salesOrganisationConfigs;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final User user;

  @override
  String toString() {
    return 'CartEvent.initialized(salesOrganisationConfigs: $salesOrganisationConfigs, salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializedImpl &&
            (identical(
                    other.salesOrganisationConfigs, salesOrganisationConfigs) ||
                other.salesOrganisationConfigs == salesOrganisationConfigs) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrganisationConfigs,
      salesOrganisation, customerCodeInfo, shipToInfo, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      __$$InitializedImplCopyWithImpl<_$InitializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)
        addHistoryItemsToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function() updatePriceForIdMarket,
    required TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)
        updateProductDetermination,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
    required TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)
        updateTenderContract,
  }) {
    return initialized(salesOrganisationConfigs, salesOrganisation,
        customerCodeInfo, shipToInfo, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult? Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function()? updatePriceForIdMarket,
    TResult? Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
    TResult? Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
  }) {
    return initialized?.call(salesOrganisationConfigs, salesOrganisation,
        customerCodeInfo, shipToInfo, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function()? updatePriceForIdMarket,
    TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(salesOrganisationConfigs, salesOrganisation,
          customerCodeInfo, shipToInfo, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_UpdateProductDetermination value)
        updateProductDetermination,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
    required TResult Function(_UpdateTenderContract value) updateTenderContract,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult? Function(_UpdateTenderContract value)? updateTenderContract,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult Function(_UpdateTenderContract value)? updateTenderContract,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements CartEvent {
  const factory _Initialized(
      {required final SalesOrganisationConfigs salesOrganisationConfigs,
      required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final User user}) = _$InitializedImpl;

  SalesOrganisationConfigs get salesOrganisationConfigs;
  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  User get user;
  @JsonKey(ignore: true)
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyMaterialDealBonusImplCopyWith<$Res> {
  factory _$$VerifyMaterialDealBonusImplCopyWith(
          _$VerifyMaterialDealBonusImpl value,
          $Res Function(_$VerifyMaterialDealBonusImpl) then) =
      __$$VerifyMaterialDealBonusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PriceAggregate item, List<PriceAggregate> items});

  $PriceAggregateCopyWith<$Res> get item;
}

/// @nodoc
class __$$VerifyMaterialDealBonusImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$VerifyMaterialDealBonusImpl>
    implements _$$VerifyMaterialDealBonusImplCopyWith<$Res> {
  __$$VerifyMaterialDealBonusImplCopyWithImpl(
      _$VerifyMaterialDealBonusImpl _value,
      $Res Function(_$VerifyMaterialDealBonusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? items = null,
  }) {
    return _then(_$VerifyMaterialDealBonusImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceAggregateCopyWith<$Res> get item {
    return $PriceAggregateCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$VerifyMaterialDealBonusImpl implements _VerifyMaterialDealBonus {
  const _$VerifyMaterialDealBonusImpl(
      {required this.item, required final List<PriceAggregate> items})
      : _items = items;

  ///Todo: consider to remove it
  @override
  final PriceAggregate item;
  final List<PriceAggregate> _items;
  @override
  List<PriceAggregate> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'CartEvent.verifyMaterialDealBonus(item: $item, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyMaterialDealBonusImpl &&
            (identical(other.item, item) || other.item == item) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, item, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyMaterialDealBonusImplCopyWith<_$VerifyMaterialDealBonusImpl>
      get copyWith => __$$VerifyMaterialDealBonusImplCopyWithImpl<
          _$VerifyMaterialDealBonusImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)
        addHistoryItemsToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function() updatePriceForIdMarket,
    required TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)
        updateProductDetermination,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
    required TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)
        updateTenderContract,
  }) {
    return verifyMaterialDealBonus(item, items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult? Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function()? updatePriceForIdMarket,
    TResult? Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
    TResult? Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
  }) {
    return verifyMaterialDealBonus?.call(item, items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function()? updatePriceForIdMarket,
    TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
    required TResult orElse(),
  }) {
    if (verifyMaterialDealBonus != null) {
      return verifyMaterialDealBonus(item, items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_UpdateProductDetermination value)
        updateProductDetermination,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
    required TResult Function(_UpdateTenderContract value) updateTenderContract,
  }) {
    return verifyMaterialDealBonus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult? Function(_UpdateTenderContract value)? updateTenderContract,
  }) {
    return verifyMaterialDealBonus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult Function(_UpdateTenderContract value)? updateTenderContract,
    required TResult orElse(),
  }) {
    if (verifyMaterialDealBonus != null) {
      return verifyMaterialDealBonus(this);
    }
    return orElse();
  }
}

abstract class _VerifyMaterialDealBonus implements CartEvent {
  const factory _VerifyMaterialDealBonus(
          {required final PriceAggregate item,
          required final List<PriceAggregate> items}) =
      _$VerifyMaterialDealBonusImpl;

  ///Todo: consider to remove it
  PriceAggregate get item;
  List<PriceAggregate> get items;
  @JsonKey(ignore: true)
  _$$VerifyMaterialDealBonusImplCopyWith<_$VerifyMaterialDealBonusImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddBonusToCartItemImplCopyWith<$Res> {
  factory _$$AddBonusToCartItemImplCopyWith(_$AddBonusToCartItemImpl value,
          $Res Function(_$AddBonusToCartItemImpl) then) =
      __$$AddBonusToCartItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {MaterialInfo bonusMaterial,
      StringValue bonusItemId,
      RequestCounterOfferDetails counterOfferDetails});

  $MaterialInfoCopyWith<$Res> get bonusMaterial;
  $RequestCounterOfferDetailsCopyWith<$Res> get counterOfferDetails;
}

/// @nodoc
class __$$AddBonusToCartItemImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$AddBonusToCartItemImpl>
    implements _$$AddBonusToCartItemImplCopyWith<$Res> {
  __$$AddBonusToCartItemImplCopyWithImpl(_$AddBonusToCartItemImpl _value,
      $Res Function(_$AddBonusToCartItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bonusMaterial = null,
    Object? bonusItemId = null,
    Object? counterOfferDetails = null,
  }) {
    return _then(_$AddBonusToCartItemImpl(
      bonusMaterial: null == bonusMaterial
          ? _value.bonusMaterial
          : bonusMaterial // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
      bonusItemId: null == bonusItemId
          ? _value.bonusItemId
          : bonusItemId // ignore: cast_nullable_to_non_nullable
              as StringValue,
      counterOfferDetails: null == counterOfferDetails
          ? _value.counterOfferDetails
          : counterOfferDetails // ignore: cast_nullable_to_non_nullable
              as RequestCounterOfferDetails,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialInfoCopyWith<$Res> get bonusMaterial {
    return $MaterialInfoCopyWith<$Res>(_value.bonusMaterial, (value) {
      return _then(_value.copyWith(bonusMaterial: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RequestCounterOfferDetailsCopyWith<$Res> get counterOfferDetails {
    return $RequestCounterOfferDetailsCopyWith<$Res>(_value.counterOfferDetails,
        (value) {
      return _then(_value.copyWith(counterOfferDetails: value));
    });
  }
}

/// @nodoc

class _$AddBonusToCartItemImpl implements _AddBonusToCartItem {
  const _$AddBonusToCartItemImpl(
      {required this.bonusMaterial,
      required this.bonusItemId,
      required this.counterOfferDetails});

  @override
  final MaterialInfo bonusMaterial;
  @override
  final StringValue bonusItemId;
  @override
  final RequestCounterOfferDetails counterOfferDetails;

  @override
  String toString() {
    return 'CartEvent.addBonusToCartItem(bonusMaterial: $bonusMaterial, bonusItemId: $bonusItemId, counterOfferDetails: $counterOfferDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddBonusToCartItemImpl &&
            (identical(other.bonusMaterial, bonusMaterial) ||
                other.bonusMaterial == bonusMaterial) &&
            (identical(other.bonusItemId, bonusItemId) ||
                other.bonusItemId == bonusItemId) &&
            (identical(other.counterOfferDetails, counterOfferDetails) ||
                other.counterOfferDetails == counterOfferDetails));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, bonusMaterial, bonusItemId, counterOfferDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddBonusToCartItemImplCopyWith<_$AddBonusToCartItemImpl> get copyWith =>
      __$$AddBonusToCartItemImplCopyWithImpl<_$AddBonusToCartItemImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)
        addHistoryItemsToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function() updatePriceForIdMarket,
    required TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)
        updateProductDetermination,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
    required TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)
        updateTenderContract,
  }) {
    return addBonusToCartItem(bonusMaterial, bonusItemId, counterOfferDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult? Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function()? updatePriceForIdMarket,
    TResult? Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
    TResult? Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
  }) {
    return addBonusToCartItem?.call(
        bonusMaterial, bonusItemId, counterOfferDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function()? updatePriceForIdMarket,
    TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
    required TResult orElse(),
  }) {
    if (addBonusToCartItem != null) {
      return addBonusToCartItem(
          bonusMaterial, bonusItemId, counterOfferDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_UpdateProductDetermination value)
        updateProductDetermination,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
    required TResult Function(_UpdateTenderContract value) updateTenderContract,
  }) {
    return addBonusToCartItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult? Function(_UpdateTenderContract value)? updateTenderContract,
  }) {
    return addBonusToCartItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult Function(_UpdateTenderContract value)? updateTenderContract,
    required TResult orElse(),
  }) {
    if (addBonusToCartItem != null) {
      return addBonusToCartItem(this);
    }
    return orElse();
  }
}

abstract class _AddBonusToCartItem implements CartEvent {
  const factory _AddBonusToCartItem(
          {required final MaterialInfo bonusMaterial,
          required final StringValue bonusItemId,
          required final RequestCounterOfferDetails counterOfferDetails}) =
      _$AddBonusToCartItemImpl;

  MaterialInfo get bonusMaterial;
  StringValue get bonusItemId;
  RequestCounterOfferDetails get counterOfferDetails;
  @JsonKey(ignore: true)
  _$$AddBonusToCartItemImplCopyWith<_$AddBonusToCartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveSampleBonusFromCartConfigImplCopyWith<$Res> {
  factory _$$RemoveSampleBonusFromCartConfigImplCopyWith(
          _$RemoveSampleBonusFromCartConfigImpl value,
          $Res Function(_$RemoveSampleBonusFromCartConfigImpl) then) =
      __$$RemoveSampleBonusFromCartConfigImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RemoveSampleBonusFromCartConfigImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$RemoveSampleBonusFromCartConfigImpl>
    implements _$$RemoveSampleBonusFromCartConfigImplCopyWith<$Res> {
  __$$RemoveSampleBonusFromCartConfigImplCopyWithImpl(
      _$RemoveSampleBonusFromCartConfigImpl _value,
      $Res Function(_$RemoveSampleBonusFromCartConfigImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RemoveSampleBonusFromCartConfigImpl
    implements _RemoveSampleBonusFromCartConfig {
  const _$RemoveSampleBonusFromCartConfigImpl();

  @override
  String toString() {
    return 'CartEvent.removeSampleBonusFromCartConfig()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveSampleBonusFromCartConfigImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)
        addHistoryItemsToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function() updatePriceForIdMarket,
    required TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)
        updateProductDetermination,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
    required TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)
        updateTenderContract,
  }) {
    return removeSampleBonusFromCartConfig();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult? Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function()? updatePriceForIdMarket,
    TResult? Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
    TResult? Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
  }) {
    return removeSampleBonusFromCartConfig?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function()? updatePriceForIdMarket,
    TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
    required TResult orElse(),
  }) {
    if (removeSampleBonusFromCartConfig != null) {
      return removeSampleBonusFromCartConfig();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_UpdateProductDetermination value)
        updateProductDetermination,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
    required TResult Function(_UpdateTenderContract value) updateTenderContract,
  }) {
    return removeSampleBonusFromCartConfig(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult? Function(_UpdateTenderContract value)? updateTenderContract,
  }) {
    return removeSampleBonusFromCartConfig?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult Function(_UpdateTenderContract value)? updateTenderContract,
    required TResult orElse(),
  }) {
    if (removeSampleBonusFromCartConfig != null) {
      return removeSampleBonusFromCartConfig(this);
    }
    return orElse();
  }
}

abstract class _RemoveSampleBonusFromCartConfig implements CartEvent {
  const factory _RemoveSampleBonusFromCartConfig() =
      _$RemoveSampleBonusFromCartConfigImpl;
}

/// @nodoc
abstract class _$$ClearCartImplCopyWith<$Res> {
  factory _$$ClearCartImplCopyWith(
          _$ClearCartImpl value, $Res Function(_$ClearCartImpl) then) =
      __$$ClearCartImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearCartImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$ClearCartImpl>
    implements _$$ClearCartImplCopyWith<$Res> {
  __$$ClearCartImplCopyWithImpl(
      _$ClearCartImpl _value, $Res Function(_$ClearCartImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearCartImpl implements _ClearCart {
  const _$ClearCartImpl();

  @override
  String toString() {
    return 'CartEvent.clearCart()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearCartImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)
        addHistoryItemsToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function() updatePriceForIdMarket,
    required TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)
        updateProductDetermination,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
    required TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)
        updateTenderContract,
  }) {
    return clearCart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult? Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function()? updatePriceForIdMarket,
    TResult? Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
    TResult? Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
  }) {
    return clearCart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function()? updatePriceForIdMarket,
    TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
    required TResult orElse(),
  }) {
    if (clearCart != null) {
      return clearCart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_UpdateProductDetermination value)
        updateProductDetermination,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
    required TResult Function(_UpdateTenderContract value) updateTenderContract,
  }) {
    return clearCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult? Function(_UpdateTenderContract value)? updateTenderContract,
  }) {
    return clearCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult Function(_UpdateTenderContract value)? updateTenderContract,
    required TResult orElse(),
  }) {
    if (clearCart != null) {
      return clearCart(this);
    }
    return orElse();
  }
}

abstract class _ClearCart implements CartEvent {
  const factory _ClearCart() = _$ClearCartImpl;
}

/// @nodoc
abstract class _$$FetchProductsAddedToCartImplCopyWith<$Res> {
  factory _$$FetchProductsAddedToCartImplCopyWith(
          _$FetchProductsAddedToCartImpl value,
          $Res Function(_$FetchProductsAddedToCartImpl) then) =
      __$$FetchProductsAddedToCartImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchProductsAddedToCartImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$FetchProductsAddedToCartImpl>
    implements _$$FetchProductsAddedToCartImplCopyWith<$Res> {
  __$$FetchProductsAddedToCartImplCopyWithImpl(
      _$FetchProductsAddedToCartImpl _value,
      $Res Function(_$FetchProductsAddedToCartImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchProductsAddedToCartImpl implements _FetchProductsAddedToCart {
  const _$FetchProductsAddedToCartImpl();

  @override
  String toString() {
    return 'CartEvent.fetchProductsAddedToCart()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchProductsAddedToCartImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)
        addHistoryItemsToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function() updatePriceForIdMarket,
    required TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)
        updateProductDetermination,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
    required TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)
        updateTenderContract,
  }) {
    return fetchProductsAddedToCart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult? Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function()? updatePriceForIdMarket,
    TResult? Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
    TResult? Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
  }) {
    return fetchProductsAddedToCart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function()? updatePriceForIdMarket,
    TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
    required TResult orElse(),
  }) {
    if (fetchProductsAddedToCart != null) {
      return fetchProductsAddedToCart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_UpdateProductDetermination value)
        updateProductDetermination,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
    required TResult Function(_UpdateTenderContract value) updateTenderContract,
  }) {
    return fetchProductsAddedToCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult? Function(_UpdateTenderContract value)? updateTenderContract,
  }) {
    return fetchProductsAddedToCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult Function(_UpdateTenderContract value)? updateTenderContract,
    required TResult orElse(),
  }) {
    if (fetchProductsAddedToCart != null) {
      return fetchProductsAddedToCart(this);
    }
    return orElse();
  }
}

abstract class _FetchProductsAddedToCart implements CartEvent {
  const factory _FetchProductsAddedToCart() = _$FetchProductsAddedToCartImpl;
}

/// @nodoc
abstract class _$$UpsertCartImplCopyWith<$Res> {
  factory _$$UpsertCartImplCopyWith(
          _$UpsertCartImpl value, $Res Function(_$UpsertCartImpl) then) =
      __$$UpsertCartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PriceAggregate priceAggregate, EZReachBanner? banner});

  $PriceAggregateCopyWith<$Res> get priceAggregate;
  $EZReachBannerCopyWith<$Res>? get banner;
}

/// @nodoc
class __$$UpsertCartImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$UpsertCartImpl>
    implements _$$UpsertCartImplCopyWith<$Res> {
  __$$UpsertCartImplCopyWithImpl(
      _$UpsertCartImpl _value, $Res Function(_$UpsertCartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceAggregate = null,
    Object? banner = freezed,
  }) {
    return _then(_$UpsertCartImpl(
      priceAggregate: null == priceAggregate
          ? _value.priceAggregate
          : priceAggregate // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
      banner: freezed == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as EZReachBanner?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceAggregateCopyWith<$Res> get priceAggregate {
    return $PriceAggregateCopyWith<$Res>(_value.priceAggregate, (value) {
      return _then(_value.copyWith(priceAggregate: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EZReachBannerCopyWith<$Res>? get banner {
    if (_value.banner == null) {
      return null;
    }

    return $EZReachBannerCopyWith<$Res>(_value.banner!, (value) {
      return _then(_value.copyWith(banner: value));
    });
  }
}

/// @nodoc

class _$UpsertCartImpl implements _UpsertCart {
  const _$UpsertCartImpl({required this.priceAggregate, this.banner});

  @override
  final PriceAggregate priceAggregate;
  @override
  final EZReachBanner? banner;

  @override
  String toString() {
    return 'CartEvent.upsertCart(priceAggregate: $priceAggregate, banner: $banner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpsertCartImpl &&
            (identical(other.priceAggregate, priceAggregate) ||
                other.priceAggregate == priceAggregate) &&
            (identical(other.banner, banner) || other.banner == banner));
  }

  @override
  int get hashCode => Object.hash(runtimeType, priceAggregate, banner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpsertCartImplCopyWith<_$UpsertCartImpl> get copyWith =>
      __$$UpsertCartImplCopyWithImpl<_$UpsertCartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)
        addHistoryItemsToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function() updatePriceForIdMarket,
    required TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)
        updateProductDetermination,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
    required TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)
        updateTenderContract,
  }) {
    return upsertCart(priceAggregate, banner);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult? Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function()? updatePriceForIdMarket,
    TResult? Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
    TResult? Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
  }) {
    return upsertCart?.call(priceAggregate, banner);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function()? updatePriceForIdMarket,
    TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
    required TResult orElse(),
  }) {
    if (upsertCart != null) {
      return upsertCart(priceAggregate, banner);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_UpdateProductDetermination value)
        updateProductDetermination,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
    required TResult Function(_UpdateTenderContract value) updateTenderContract,
  }) {
    return upsertCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult? Function(_UpdateTenderContract value)? updateTenderContract,
  }) {
    return upsertCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult Function(_UpdateTenderContract value)? updateTenderContract,
    required TResult orElse(),
  }) {
    if (upsertCart != null) {
      return upsertCart(this);
    }
    return orElse();
  }
}

abstract class _UpsertCart implements CartEvent {
  const factory _UpsertCart(
      {required final PriceAggregate priceAggregate,
      final EZReachBanner? banner}) = _$UpsertCartImpl;

  PriceAggregate get priceAggregate;
  EZReachBanner? get banner;
  @JsonKey(ignore: true)
  _$$UpsertCartImplCopyWith<_$UpsertCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$addHistoryItemsToCartImplCopyWith<$Res> {
  factory _$$addHistoryItemsToCartImplCopyWith(
          _$addHistoryItemsToCartImpl value,
          $Res Function(_$addHistoryItemsToCartImpl) then) =
      __$$addHistoryItemsToCartImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<PriceAggregate> items,
      RequestCounterOfferDetails counterOfferDetails,
      Map<MaterialNumber, TenderContract> tenderContractList});

  $RequestCounterOfferDetailsCopyWith<$Res> get counterOfferDetails;
}

/// @nodoc
class __$$addHistoryItemsToCartImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$addHistoryItemsToCartImpl>
    implements _$$addHistoryItemsToCartImplCopyWith<$Res> {
  __$$addHistoryItemsToCartImplCopyWithImpl(_$addHistoryItemsToCartImpl _value,
      $Res Function(_$addHistoryItemsToCartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? counterOfferDetails = null,
    Object? tenderContractList = null,
  }) {
    return _then(_$addHistoryItemsToCartImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
      counterOfferDetails: null == counterOfferDetails
          ? _value.counterOfferDetails
          : counterOfferDetails // ignore: cast_nullable_to_non_nullable
              as RequestCounterOfferDetails,
      tenderContractList: null == tenderContractList
          ? _value._tenderContractList
          : tenderContractList // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, TenderContract>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $RequestCounterOfferDetailsCopyWith<$Res> get counterOfferDetails {
    return $RequestCounterOfferDetailsCopyWith<$Res>(_value.counterOfferDetails,
        (value) {
      return _then(_value.copyWith(counterOfferDetails: value));
    });
  }
}

/// @nodoc

class _$addHistoryItemsToCartImpl implements _addHistoryItemsToCart {
  const _$addHistoryItemsToCartImpl(
      {required final List<PriceAggregate> items,
      required this.counterOfferDetails,
      required final Map<MaterialNumber, TenderContract> tenderContractList})
      : _items = items,
        _tenderContractList = tenderContractList;

  final List<PriceAggregate> _items;
  @override
  List<PriceAggregate> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final RequestCounterOfferDetails counterOfferDetails;
  final Map<MaterialNumber, TenderContract> _tenderContractList;
  @override
  Map<MaterialNumber, TenderContract> get tenderContractList {
    if (_tenderContractList is EqualUnmodifiableMapView)
      return _tenderContractList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_tenderContractList);
  }

  @override
  String toString() {
    return 'CartEvent.addHistoryItemsToCart(items: $items, counterOfferDetails: $counterOfferDetails, tenderContractList: $tenderContractList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$addHistoryItemsToCartImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.counterOfferDetails, counterOfferDetails) ||
                other.counterOfferDetails == counterOfferDetails) &&
            const DeepCollectionEquality()
                .equals(other._tenderContractList, _tenderContractList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      counterOfferDetails,
      const DeepCollectionEquality().hash(_tenderContractList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$addHistoryItemsToCartImplCopyWith<_$addHistoryItemsToCartImpl>
      get copyWith => __$$addHistoryItemsToCartImplCopyWithImpl<
          _$addHistoryItemsToCartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)
        addHistoryItemsToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function() updatePriceForIdMarket,
    required TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)
        updateProductDetermination,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
    required TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)
        updateTenderContract,
  }) {
    return addHistoryItemsToCart(
        items, counterOfferDetails, tenderContractList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult? Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function()? updatePriceForIdMarket,
    TResult? Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
    TResult? Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
  }) {
    return addHistoryItemsToCart?.call(
        items, counterOfferDetails, tenderContractList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function()? updatePriceForIdMarket,
    TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
    required TResult orElse(),
  }) {
    if (addHistoryItemsToCart != null) {
      return addHistoryItemsToCart(
          items, counterOfferDetails, tenderContractList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_UpdateProductDetermination value)
        updateProductDetermination,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
    required TResult Function(_UpdateTenderContract value) updateTenderContract,
  }) {
    return addHistoryItemsToCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult? Function(_UpdateTenderContract value)? updateTenderContract,
  }) {
    return addHistoryItemsToCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult Function(_UpdateTenderContract value)? updateTenderContract,
    required TResult orElse(),
  }) {
    if (addHistoryItemsToCart != null) {
      return addHistoryItemsToCart(this);
    }
    return orElse();
  }
}

abstract class _addHistoryItemsToCart implements CartEvent {
  const factory _addHistoryItemsToCart(
      {required final List<PriceAggregate> items,
      required final RequestCounterOfferDetails counterOfferDetails,
      required final Map<MaterialNumber, TenderContract>
          tenderContractList}) = _$addHistoryItemsToCartImpl;

  List<PriceAggregate> get items;
  RequestCounterOfferDetails get counterOfferDetails;
  Map<MaterialNumber, TenderContract> get tenderContractList;
  @JsonKey(ignore: true)
  _$$addHistoryItemsToCartImplCopyWith<_$addHistoryItemsToCartImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpsertCartItemsImplCopyWith<$Res> {
  factory _$$UpsertCartItemsImplCopyWith(_$UpsertCartItemsImpl value,
          $Res Function(_$UpsertCartItemsImpl) then) =
      __$$UpsertCartItemsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PriceAggregate priceAggregate, EZReachBanner? banner});

  $PriceAggregateCopyWith<$Res> get priceAggregate;
  $EZReachBannerCopyWith<$Res>? get banner;
}

/// @nodoc
class __$$UpsertCartItemsImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$UpsertCartItemsImpl>
    implements _$$UpsertCartItemsImplCopyWith<$Res> {
  __$$UpsertCartItemsImplCopyWithImpl(
      _$UpsertCartItemsImpl _value, $Res Function(_$UpsertCartItemsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceAggregate = null,
    Object? banner = freezed,
  }) {
    return _then(_$UpsertCartItemsImpl(
      priceAggregate: null == priceAggregate
          ? _value.priceAggregate
          : priceAggregate // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
      banner: freezed == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as EZReachBanner?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceAggregateCopyWith<$Res> get priceAggregate {
    return $PriceAggregateCopyWith<$Res>(_value.priceAggregate, (value) {
      return _then(_value.copyWith(priceAggregate: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EZReachBannerCopyWith<$Res>? get banner {
    if (_value.banner == null) {
      return null;
    }

    return $EZReachBannerCopyWith<$Res>(_value.banner!, (value) {
      return _then(_value.copyWith(banner: value));
    });
  }
}

/// @nodoc

class _$UpsertCartItemsImpl implements _UpsertCartItems {
  const _$UpsertCartItemsImpl({required this.priceAggregate, this.banner});

  @override
  final PriceAggregate priceAggregate;
  @override
  final EZReachBanner? banner;

  @override
  String toString() {
    return 'CartEvent.upsertCartItems(priceAggregate: $priceAggregate, banner: $banner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpsertCartItemsImpl &&
            (identical(other.priceAggregate, priceAggregate) ||
                other.priceAggregate == priceAggregate) &&
            (identical(other.banner, banner) || other.banner == banner));
  }

  @override
  int get hashCode => Object.hash(runtimeType, priceAggregate, banner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpsertCartItemsImplCopyWith<_$UpsertCartItemsImpl> get copyWith =>
      __$$UpsertCartItemsImplCopyWithImpl<_$UpsertCartItemsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)
        addHistoryItemsToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function() updatePriceForIdMarket,
    required TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)
        updateProductDetermination,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
    required TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)
        updateTenderContract,
  }) {
    return upsertCartItems(priceAggregate, banner);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult? Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function()? updatePriceForIdMarket,
    TResult? Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
    TResult? Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
  }) {
    return upsertCartItems?.call(priceAggregate, banner);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function()? updatePriceForIdMarket,
    TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
    required TResult orElse(),
  }) {
    if (upsertCartItems != null) {
      return upsertCartItems(priceAggregate, banner);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_UpdateProductDetermination value)
        updateProductDetermination,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
    required TResult Function(_UpdateTenderContract value) updateTenderContract,
  }) {
    return upsertCartItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult? Function(_UpdateTenderContract value)? updateTenderContract,
  }) {
    return upsertCartItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult Function(_UpdateTenderContract value)? updateTenderContract,
    required TResult orElse(),
  }) {
    if (upsertCartItems != null) {
      return upsertCartItems(this);
    }
    return orElse();
  }
}

abstract class _UpsertCartItems implements CartEvent {
  const factory _UpsertCartItems(
      {required final PriceAggregate priceAggregate,
      final EZReachBanner? banner}) = _$UpsertCartItemsImpl;

  PriceAggregate get priceAggregate;
  EZReachBanner? get banner;
  @JsonKey(ignore: true)
  _$$UpsertCartItemsImplCopyWith<_$UpsertCartItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetDetailsProductsAddedToCartImplCopyWith<$Res> {
  factory _$$GetDetailsProductsAddedToCartImplCopyWith(
          _$GetDetailsProductsAddedToCartImpl value,
          $Res Function(_$GetDetailsProductsAddedToCartImpl) then) =
      __$$GetDetailsProductsAddedToCartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PriceAggregate> cartProducts});
}

/// @nodoc
class __$$GetDetailsProductsAddedToCartImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$GetDetailsProductsAddedToCartImpl>
    implements _$$GetDetailsProductsAddedToCartImplCopyWith<$Res> {
  __$$GetDetailsProductsAddedToCartImplCopyWithImpl(
      _$GetDetailsProductsAddedToCartImpl _value,
      $Res Function(_$GetDetailsProductsAddedToCartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartProducts = null,
  }) {
    return _then(_$GetDetailsProductsAddedToCartImpl(
      cartProducts: null == cartProducts
          ? _value._cartProducts
          : cartProducts // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
    ));
  }
}

/// @nodoc

class _$GetDetailsProductsAddedToCartImpl
    implements _GetDetailsProductsAddedToCart {
  const _$GetDetailsProductsAddedToCartImpl(
      {required final List<PriceAggregate> cartProducts})
      : _cartProducts = cartProducts;

  final List<PriceAggregate> _cartProducts;
  @override
  List<PriceAggregate> get cartProducts {
    if (_cartProducts is EqualUnmodifiableListView) return _cartProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartProducts);
  }

  @override
  String toString() {
    return 'CartEvent.getDetailsProductsAddedToCart(cartProducts: $cartProducts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetDetailsProductsAddedToCartImpl &&
            const DeepCollectionEquality()
                .equals(other._cartProducts, _cartProducts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_cartProducts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetDetailsProductsAddedToCartImplCopyWith<
          _$GetDetailsProductsAddedToCartImpl>
      get copyWith => __$$GetDetailsProductsAddedToCartImplCopyWithImpl<
          _$GetDetailsProductsAddedToCartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)
        addHistoryItemsToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function() updatePriceForIdMarket,
    required TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)
        updateProductDetermination,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
    required TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)
        updateTenderContract,
  }) {
    return getDetailsProductsAddedToCart(cartProducts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult? Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function()? updatePriceForIdMarket,
    TResult? Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
    TResult? Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
  }) {
    return getDetailsProductsAddedToCart?.call(cartProducts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function()? updatePriceForIdMarket,
    TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
    required TResult orElse(),
  }) {
    if (getDetailsProductsAddedToCart != null) {
      return getDetailsProductsAddedToCart(cartProducts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_UpdateProductDetermination value)
        updateProductDetermination,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
    required TResult Function(_UpdateTenderContract value) updateTenderContract,
  }) {
    return getDetailsProductsAddedToCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult? Function(_UpdateTenderContract value)? updateTenderContract,
  }) {
    return getDetailsProductsAddedToCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult Function(_UpdateTenderContract value)? updateTenderContract,
    required TResult orElse(),
  }) {
    if (getDetailsProductsAddedToCart != null) {
      return getDetailsProductsAddedToCart(this);
    }
    return orElse();
  }
}

abstract class _GetDetailsProductsAddedToCart implements CartEvent {
  const factory _GetDetailsProductsAddedToCart(
          {required final List<PriceAggregate> cartProducts}) =
      _$GetDetailsProductsAddedToCartImpl;

  List<PriceAggregate> get cartProducts;
  @JsonKey(ignore: true)
  _$$GetDetailsProductsAddedToCartImplCopyWith<
          _$GetDetailsProductsAddedToCartImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePriceProductImplCopyWith<$Res> {
  factory _$$UpdatePriceProductImplCopyWith(_$UpdatePriceProductImpl value,
          $Res Function(_$UpdatePriceProductImpl) then) =
      __$$UpdatePriceProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<MaterialNumber, Price> priceProducts});
}

/// @nodoc
class __$$UpdatePriceProductImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$UpdatePriceProductImpl>
    implements _$$UpdatePriceProductImplCopyWith<$Res> {
  __$$UpdatePriceProductImplCopyWithImpl(_$UpdatePriceProductImpl _value,
      $Res Function(_$UpdatePriceProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceProducts = null,
  }) {
    return _then(_$UpdatePriceProductImpl(
      priceProducts: null == priceProducts
          ? _value._priceProducts
          : priceProducts // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, Price>,
    ));
  }
}

/// @nodoc

class _$UpdatePriceProductImpl implements _UpdatePriceProduct {
  const _$UpdatePriceProductImpl(
      {required final Map<MaterialNumber, Price> priceProducts})
      : _priceProducts = priceProducts;

  final Map<MaterialNumber, Price> _priceProducts;
  @override
  Map<MaterialNumber, Price> get priceProducts {
    if (_priceProducts is EqualUnmodifiableMapView) return _priceProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_priceProducts);
  }

  @override
  String toString() {
    return 'CartEvent.updatePriceProduct(priceProducts: $priceProducts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePriceProductImpl &&
            const DeepCollectionEquality()
                .equals(other._priceProducts, _priceProducts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_priceProducts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePriceProductImplCopyWith<_$UpdatePriceProductImpl> get copyWith =>
      __$$UpdatePriceProductImplCopyWithImpl<_$UpdatePriceProductImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)
        addHistoryItemsToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function() updatePriceForIdMarket,
    required TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)
        updateProductDetermination,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
    required TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)
        updateTenderContract,
  }) {
    return updatePriceProduct(priceProducts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult? Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function()? updatePriceForIdMarket,
    TResult? Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
    TResult? Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
  }) {
    return updatePriceProduct?.call(priceProducts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function()? updatePriceForIdMarket,
    TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
    required TResult orElse(),
  }) {
    if (updatePriceProduct != null) {
      return updatePriceProduct(priceProducts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_UpdateProductDetermination value)
        updateProductDetermination,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
    required TResult Function(_UpdateTenderContract value) updateTenderContract,
  }) {
    return updatePriceProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult? Function(_UpdateTenderContract value)? updateTenderContract,
  }) {
    return updatePriceProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult Function(_UpdateTenderContract value)? updateTenderContract,
    required TResult orElse(),
  }) {
    if (updatePriceProduct != null) {
      return updatePriceProduct(this);
    }
    return orElse();
  }
}

abstract class _UpdatePriceProduct implements CartEvent {
  const factory _UpdatePriceProduct(
          {required final Map<MaterialNumber, Price> priceProducts}) =
      _$UpdatePriceProductImpl;

  Map<MaterialNumber, Price> get priceProducts;
  @JsonKey(ignore: true)
  _$$UpdatePriceProductImplCopyWith<_$UpdatePriceProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateProductStockImplCopyWith<$Res> {
  factory _$$UpdateProductStockImplCopyWith(_$UpdateProductStockImpl value,
          $Res Function(_$UpdateProductStockImpl) then) =
      __$$UpdateProductStockImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateProductStockImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$UpdateProductStockImpl>
    implements _$$UpdateProductStockImplCopyWith<$Res> {
  __$$UpdateProductStockImplCopyWithImpl(_$UpdateProductStockImpl _value,
      $Res Function(_$UpdateProductStockImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpdateProductStockImpl implements _UpdateProductStock {
  const _$UpdateProductStockImpl();

  @override
  String toString() {
    return 'CartEvent.updateProductStock()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdateProductStockImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)
        addHistoryItemsToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function() updatePriceForIdMarket,
    required TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)
        updateProductDetermination,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
    required TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)
        updateTenderContract,
  }) {
    return updateProductStock();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult? Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function()? updatePriceForIdMarket,
    TResult? Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
    TResult? Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
  }) {
    return updateProductStock?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function()? updatePriceForIdMarket,
    TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
    required TResult orElse(),
  }) {
    if (updateProductStock != null) {
      return updateProductStock();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_UpdateProductDetermination value)
        updateProductDetermination,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
    required TResult Function(_UpdateTenderContract value) updateTenderContract,
  }) {
    return updateProductStock(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult? Function(_UpdateTenderContract value)? updateTenderContract,
  }) {
    return updateProductStock?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult Function(_UpdateTenderContract value)? updateTenderContract,
    required TResult orElse(),
  }) {
    if (updateProductStock != null) {
      return updateProductStock(this);
    }
    return orElse();
  }
}

abstract class _UpdateProductStock implements CartEvent {
  const factory _UpdateProductStock() = _$UpdateProductStockImpl;
}

/// @nodoc
abstract class _$$RemoveInvalidProductsImplCopyWith<$Res> {
  factory _$$RemoveInvalidProductsImplCopyWith(
          _$RemoveInvalidProductsImpl value,
          $Res Function(_$RemoveInvalidProductsImpl) then) =
      __$$RemoveInvalidProductsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MaterialInfo> invalidCartItems});
}

/// @nodoc
class __$$RemoveInvalidProductsImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$RemoveInvalidProductsImpl>
    implements _$$RemoveInvalidProductsImplCopyWith<$Res> {
  __$$RemoveInvalidProductsImplCopyWithImpl(_$RemoveInvalidProductsImpl _value,
      $Res Function(_$RemoveInvalidProductsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invalidCartItems = null,
  }) {
    return _then(_$RemoveInvalidProductsImpl(
      invalidCartItems: null == invalidCartItems
          ? _value._invalidCartItems
          : invalidCartItems // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
    ));
  }
}

/// @nodoc

class _$RemoveInvalidProductsImpl implements _RemoveInvalidProducts {
  const _$RemoveInvalidProductsImpl(
      {required final List<MaterialInfo> invalidCartItems})
      : _invalidCartItems = invalidCartItems;

  final List<MaterialInfo> _invalidCartItems;
  @override
  List<MaterialInfo> get invalidCartItems {
    if (_invalidCartItems is EqualUnmodifiableListView)
      return _invalidCartItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invalidCartItems);
  }

  @override
  String toString() {
    return 'CartEvent.removeInvalidProducts(invalidCartItems: $invalidCartItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveInvalidProductsImpl &&
            const DeepCollectionEquality()
                .equals(other._invalidCartItems, _invalidCartItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_invalidCartItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveInvalidProductsImplCopyWith<_$RemoveInvalidProductsImpl>
      get copyWith => __$$RemoveInvalidProductsImplCopyWithImpl<
          _$RemoveInvalidProductsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)
        addHistoryItemsToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function() updatePriceForIdMarket,
    required TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)
        updateProductDetermination,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
    required TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)
        updateTenderContract,
  }) {
    return removeInvalidProducts(invalidCartItems);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult? Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function()? updatePriceForIdMarket,
    TResult? Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
    TResult? Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
  }) {
    return removeInvalidProducts?.call(invalidCartItems);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function()? updatePriceForIdMarket,
    TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
    required TResult orElse(),
  }) {
    if (removeInvalidProducts != null) {
      return removeInvalidProducts(invalidCartItems);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_UpdateProductDetermination value)
        updateProductDetermination,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
    required TResult Function(_UpdateTenderContract value) updateTenderContract,
  }) {
    return removeInvalidProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult? Function(_UpdateTenderContract value)? updateTenderContract,
  }) {
    return removeInvalidProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult Function(_UpdateTenderContract value)? updateTenderContract,
    required TResult orElse(),
  }) {
    if (removeInvalidProducts != null) {
      return removeInvalidProducts(this);
    }
    return orElse();
  }
}

abstract class _RemoveInvalidProducts implements CartEvent {
  const factory _RemoveInvalidProducts(
          {required final List<MaterialInfo> invalidCartItems}) =
      _$RemoveInvalidProductsImpl;

  List<MaterialInfo> get invalidCartItems;
  @JsonKey(ignore: true)
  _$$RemoveInvalidProductsImplCopyWith<_$RemoveInvalidProductsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpsertCartItemsWithComboOffersImplCopyWith<$Res> {
  factory _$$UpsertCartItemsWithComboOffersImplCopyWith(
          _$UpsertCartItemsWithComboOffersImpl value,
          $Res Function(_$UpsertCartItemsWithComboOffersImpl) then) =
      __$$UpsertCartItemsWithComboOffersImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PriceAggregate> priceAggregates, bool isDeleteCombo});
}

/// @nodoc
class __$$UpsertCartItemsWithComboOffersImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$UpsertCartItemsWithComboOffersImpl>
    implements _$$UpsertCartItemsWithComboOffersImplCopyWith<$Res> {
  __$$UpsertCartItemsWithComboOffersImplCopyWithImpl(
      _$UpsertCartItemsWithComboOffersImpl _value,
      $Res Function(_$UpsertCartItemsWithComboOffersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceAggregates = null,
    Object? isDeleteCombo = null,
  }) {
    return _then(_$UpsertCartItemsWithComboOffersImpl(
      priceAggregates: null == priceAggregates
          ? _value._priceAggregates
          : priceAggregates // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
      isDeleteCombo: null == isDeleteCombo
          ? _value.isDeleteCombo
          : isDeleteCombo // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UpsertCartItemsWithComboOffersImpl
    implements _UpsertCartItemsWithComboOffers {
  const _$UpsertCartItemsWithComboOffersImpl(
      {required final List<PriceAggregate> priceAggregates,
      required this.isDeleteCombo})
      : _priceAggregates = priceAggregates;

  final List<PriceAggregate> _priceAggregates;
  @override
  List<PriceAggregate> get priceAggregates {
    if (_priceAggregates is EqualUnmodifiableListView) return _priceAggregates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_priceAggregates);
  }

  @override
  final bool isDeleteCombo;

  @override
  String toString() {
    return 'CartEvent.upsertCartItemsWithComboOffers(priceAggregates: $priceAggregates, isDeleteCombo: $isDeleteCombo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpsertCartItemsWithComboOffersImpl &&
            const DeepCollectionEquality()
                .equals(other._priceAggregates, _priceAggregates) &&
            (identical(other.isDeleteCombo, isDeleteCombo) ||
                other.isDeleteCombo == isDeleteCombo));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_priceAggregates), isDeleteCombo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpsertCartItemsWithComboOffersImplCopyWith<
          _$UpsertCartItemsWithComboOffersImpl>
      get copyWith => __$$UpsertCartItemsWithComboOffersImplCopyWithImpl<
          _$UpsertCartItemsWithComboOffersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)
        addHistoryItemsToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function() updatePriceForIdMarket,
    required TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)
        updateProductDetermination,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
    required TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)
        updateTenderContract,
  }) {
    return upsertCartItemsWithComboOffers(priceAggregates, isDeleteCombo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult? Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function()? updatePriceForIdMarket,
    TResult? Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
    TResult? Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
  }) {
    return upsertCartItemsWithComboOffers?.call(priceAggregates, isDeleteCombo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function()? updatePriceForIdMarket,
    TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
    required TResult orElse(),
  }) {
    if (upsertCartItemsWithComboOffers != null) {
      return upsertCartItemsWithComboOffers(priceAggregates, isDeleteCombo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_UpdateProductDetermination value)
        updateProductDetermination,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
    required TResult Function(_UpdateTenderContract value) updateTenderContract,
  }) {
    return upsertCartItemsWithComboOffers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult? Function(_UpdateTenderContract value)? updateTenderContract,
  }) {
    return upsertCartItemsWithComboOffers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult Function(_UpdateTenderContract value)? updateTenderContract,
    required TResult orElse(),
  }) {
    if (upsertCartItemsWithComboOffers != null) {
      return upsertCartItemsWithComboOffers(this);
    }
    return orElse();
  }
}

abstract class _UpsertCartItemsWithComboOffers implements CartEvent {
  const factory _UpsertCartItemsWithComboOffers(
          {required final List<PriceAggregate> priceAggregates,
          required final bool isDeleteCombo}) =
      _$UpsertCartItemsWithComboOffersImpl;

  List<PriceAggregate> get priceAggregates;
  bool get isDeleteCombo;
  @JsonKey(ignore: true)
  _$$UpsertCartItemsWithComboOffersImplCopyWith<
          _$UpsertCartItemsWithComboOffersImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateCartProductWithCounterOfferImplCopyWith<$Res> {
  factory _$$UpdateCartProductWithCounterOfferImplCopyWith(
          _$UpdateCartProductWithCounterOfferImpl value,
          $Res Function(_$UpdateCartProductWithCounterOfferImpl) then) =
      __$$UpdateCartProductWithCounterOfferImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Price overriddenProductPrice});

  $PriceCopyWith<$Res> get overriddenProductPrice;
}

/// @nodoc
class __$$UpdateCartProductWithCounterOfferImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res,
        _$UpdateCartProductWithCounterOfferImpl>
    implements _$$UpdateCartProductWithCounterOfferImplCopyWith<$Res> {
  __$$UpdateCartProductWithCounterOfferImplCopyWithImpl(
      _$UpdateCartProductWithCounterOfferImpl _value,
      $Res Function(_$UpdateCartProductWithCounterOfferImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overriddenProductPrice = null,
  }) {
    return _then(_$UpdateCartProductWithCounterOfferImpl(
      overriddenProductPrice: null == overriddenProductPrice
          ? _value.overriddenProductPrice
          : overriddenProductPrice // ignore: cast_nullable_to_non_nullable
              as Price,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceCopyWith<$Res> get overriddenProductPrice {
    return $PriceCopyWith<$Res>(_value.overriddenProductPrice, (value) {
      return _then(_value.copyWith(overriddenProductPrice: value));
    });
  }
}

/// @nodoc

class _$UpdateCartProductWithCounterOfferImpl
    implements _UpdateCartProductWithCounterOffer {
  const _$UpdateCartProductWithCounterOfferImpl(
      {required this.overriddenProductPrice});

  @override
  final Price overriddenProductPrice;

  @override
  String toString() {
    return 'CartEvent.updateCartProductWithCounterOffer(overriddenProductPrice: $overriddenProductPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateCartProductWithCounterOfferImpl &&
            (identical(other.overriddenProductPrice, overriddenProductPrice) ||
                other.overriddenProductPrice == overriddenProductPrice));
  }

  @override
  int get hashCode => Object.hash(runtimeType, overriddenProductPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateCartProductWithCounterOfferImplCopyWith<
          _$UpdateCartProductWithCounterOfferImpl>
      get copyWith => __$$UpdateCartProductWithCounterOfferImplCopyWithImpl<
          _$UpdateCartProductWithCounterOfferImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)
        addHistoryItemsToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function() updatePriceForIdMarket,
    required TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)
        updateProductDetermination,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
    required TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)
        updateTenderContract,
  }) {
    return updateCartProductWithCounterOffer(overriddenProductPrice);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult? Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function()? updatePriceForIdMarket,
    TResult? Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
    TResult? Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
  }) {
    return updateCartProductWithCounterOffer?.call(overriddenProductPrice);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function()? updatePriceForIdMarket,
    TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
    required TResult orElse(),
  }) {
    if (updateCartProductWithCounterOffer != null) {
      return updateCartProductWithCounterOffer(overriddenProductPrice);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_UpdateProductDetermination value)
        updateProductDetermination,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
    required TResult Function(_UpdateTenderContract value) updateTenderContract,
  }) {
    return updateCartProductWithCounterOffer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult? Function(_UpdateTenderContract value)? updateTenderContract,
  }) {
    return updateCartProductWithCounterOffer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult Function(_UpdateTenderContract value)? updateTenderContract,
    required TResult orElse(),
  }) {
    if (updateCartProductWithCounterOffer != null) {
      return updateCartProductWithCounterOffer(this);
    }
    return orElse();
  }
}

abstract class _UpdateCartProductWithCounterOffer implements CartEvent {
  const factory _UpdateCartProductWithCounterOffer(
          {required final Price overriddenProductPrice}) =
      _$UpdateCartProductWithCounterOfferImpl;

  Price get overriddenProductPrice;
  @JsonKey(ignore: true)
  _$$UpdateCartProductWithCounterOfferImplCopyWith<
          _$UpdateCartProductWithCounterOfferImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePriceForIdMarketImplCopyWith<$Res> {
  factory _$$UpdatePriceForIdMarketImplCopyWith(
          _$UpdatePriceForIdMarketImpl value,
          $Res Function(_$UpdatePriceForIdMarketImpl) then) =
      __$$UpdatePriceForIdMarketImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdatePriceForIdMarketImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$UpdatePriceForIdMarketImpl>
    implements _$$UpdatePriceForIdMarketImplCopyWith<$Res> {
  __$$UpdatePriceForIdMarketImplCopyWithImpl(
      _$UpdatePriceForIdMarketImpl _value,
      $Res Function(_$UpdatePriceForIdMarketImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpdatePriceForIdMarketImpl implements _UpdatePriceForIdMarket {
  const _$UpdatePriceForIdMarketImpl();

  @override
  String toString() {
    return 'CartEvent.updatePriceForIdMarket()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePriceForIdMarketImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)
        addHistoryItemsToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function() updatePriceForIdMarket,
    required TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)
        updateProductDetermination,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
    required TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)
        updateTenderContract,
  }) {
    return updatePriceForIdMarket();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult? Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function()? updatePriceForIdMarket,
    TResult? Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
    TResult? Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
  }) {
    return updatePriceForIdMarket?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function()? updatePriceForIdMarket,
    TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
    required TResult orElse(),
  }) {
    if (updatePriceForIdMarket != null) {
      return updatePriceForIdMarket();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_UpdateProductDetermination value)
        updateProductDetermination,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
    required TResult Function(_UpdateTenderContract value) updateTenderContract,
  }) {
    return updatePriceForIdMarket(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult? Function(_UpdateTenderContract value)? updateTenderContract,
  }) {
    return updatePriceForIdMarket?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult Function(_UpdateTenderContract value)? updateTenderContract,
    required TResult orElse(),
  }) {
    if (updatePriceForIdMarket != null) {
      return updatePriceForIdMarket(this);
    }
    return orElse();
  }
}

abstract class _UpdatePriceForIdMarket implements CartEvent {
  const factory _UpdatePriceForIdMarket() = _$UpdatePriceForIdMarketImpl;
}

/// @nodoc
abstract class _$$UpdateProductDeterminationImplCopyWith<$Res> {
  factory _$$UpdateProductDeterminationImplCopyWith(
          _$UpdateProductDeterminationImpl value,
          $Res Function(_$UpdateProductDeterminationImpl) then) =
      __$$UpdateProductDeterminationImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<AplProduct> productDeterminationList,
      List<PriceAggregate> updatedCartItems});
}

/// @nodoc
class __$$UpdateProductDeterminationImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$UpdateProductDeterminationImpl>
    implements _$$UpdateProductDeterminationImplCopyWith<$Res> {
  __$$UpdateProductDeterminationImplCopyWithImpl(
      _$UpdateProductDeterminationImpl _value,
      $Res Function(_$UpdateProductDeterminationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productDeterminationList = null,
    Object? updatedCartItems = null,
  }) {
    return _then(_$UpdateProductDeterminationImpl(
      productDeterminationList: null == productDeterminationList
          ? _value._productDeterminationList
          : productDeterminationList // ignore: cast_nullable_to_non_nullable
              as List<AplProduct>,
      updatedCartItems: null == updatedCartItems
          ? _value._updatedCartItems
          : updatedCartItems // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
    ));
  }
}

/// @nodoc

class _$UpdateProductDeterminationImpl implements _UpdateProductDetermination {
  const _$UpdateProductDeterminationImpl(
      {required final List<AplProduct> productDeterminationList,
      required final List<PriceAggregate> updatedCartItems})
      : _productDeterminationList = productDeterminationList,
        _updatedCartItems = updatedCartItems;

  final List<AplProduct> _productDeterminationList;
  @override
  List<AplProduct> get productDeterminationList {
    if (_productDeterminationList is EqualUnmodifiableListView)
      return _productDeterminationList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productDeterminationList);
  }

  final List<PriceAggregate> _updatedCartItems;
  @override
  List<PriceAggregate> get updatedCartItems {
    if (_updatedCartItems is EqualUnmodifiableListView)
      return _updatedCartItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_updatedCartItems);
  }

  @override
  String toString() {
    return 'CartEvent.updateProductDetermination(productDeterminationList: $productDeterminationList, updatedCartItems: $updatedCartItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProductDeterminationImpl &&
            const DeepCollectionEquality().equals(
                other._productDeterminationList, _productDeterminationList) &&
            const DeepCollectionEquality()
                .equals(other._updatedCartItems, _updatedCartItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_productDeterminationList),
      const DeepCollectionEquality().hash(_updatedCartItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProductDeterminationImplCopyWith<_$UpdateProductDeterminationImpl>
      get copyWith => __$$UpdateProductDeterminationImplCopyWithImpl<
          _$UpdateProductDeterminationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)
        addHistoryItemsToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function() updatePriceForIdMarket,
    required TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)
        updateProductDetermination,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
    required TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)
        updateTenderContract,
  }) {
    return updateProductDetermination(
        productDeterminationList, updatedCartItems);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult? Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function()? updatePriceForIdMarket,
    TResult? Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
    TResult? Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
  }) {
    return updateProductDetermination?.call(
        productDeterminationList, updatedCartItems);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function()? updatePriceForIdMarket,
    TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
    required TResult orElse(),
  }) {
    if (updateProductDetermination != null) {
      return updateProductDetermination(
          productDeterminationList, updatedCartItems);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_UpdateProductDetermination value)
        updateProductDetermination,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
    required TResult Function(_UpdateTenderContract value) updateTenderContract,
  }) {
    return updateProductDetermination(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult? Function(_UpdateTenderContract value)? updateTenderContract,
  }) {
    return updateProductDetermination?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult Function(_UpdateTenderContract value)? updateTenderContract,
    required TResult orElse(),
  }) {
    if (updateProductDetermination != null) {
      return updateProductDetermination(this);
    }
    return orElse();
  }
}

abstract class _UpdateProductDetermination implements CartEvent {
  const factory _UpdateProductDetermination(
          {required final List<AplProduct> productDeterminationList,
          required final List<PriceAggregate> updatedCartItems}) =
      _$UpdateProductDeterminationImpl;

  List<AplProduct> get productDeterminationList;
  List<PriceAggregate> get updatedCartItems;
  @JsonKey(ignore: true)
  _$$UpdateProductDeterminationImplCopyWith<_$UpdateProductDeterminationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchGrandTotalPriceForIdMarketImplCopyWith<$Res> {
  factory _$$FetchGrandTotalPriceForIdMarketImplCopyWith(
          _$FetchGrandTotalPriceForIdMarketImpl value,
          $Res Function(_$FetchGrandTotalPriceForIdMarketImpl) then) =
      __$$FetchGrandTotalPriceForIdMarketImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchGrandTotalPriceForIdMarketImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$FetchGrandTotalPriceForIdMarketImpl>
    implements _$$FetchGrandTotalPriceForIdMarketImplCopyWith<$Res> {
  __$$FetchGrandTotalPriceForIdMarketImplCopyWithImpl(
      _$FetchGrandTotalPriceForIdMarketImpl _value,
      $Res Function(_$FetchGrandTotalPriceForIdMarketImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchGrandTotalPriceForIdMarketImpl
    implements _FetchGrandTotalPriceForIdMarket {
  const _$FetchGrandTotalPriceForIdMarketImpl();

  @override
  String toString() {
    return 'CartEvent.fetchGrandTotalPriceForIdMarket()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchGrandTotalPriceForIdMarketImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)
        addHistoryItemsToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function() updatePriceForIdMarket,
    required TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)
        updateProductDetermination,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
    required TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)
        updateTenderContract,
  }) {
    return fetchGrandTotalPriceForIdMarket();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult? Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function()? updatePriceForIdMarket,
    TResult? Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
    TResult? Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
  }) {
    return fetchGrandTotalPriceForIdMarket?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function()? updatePriceForIdMarket,
    TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
    required TResult orElse(),
  }) {
    if (fetchGrandTotalPriceForIdMarket != null) {
      return fetchGrandTotalPriceForIdMarket();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_UpdateProductDetermination value)
        updateProductDetermination,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
    required TResult Function(_UpdateTenderContract value) updateTenderContract,
  }) {
    return fetchGrandTotalPriceForIdMarket(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult? Function(_UpdateTenderContract value)? updateTenderContract,
  }) {
    return fetchGrandTotalPriceForIdMarket?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult Function(_UpdateTenderContract value)? updateTenderContract,
    required TResult orElse(),
  }) {
    if (fetchGrandTotalPriceForIdMarket != null) {
      return fetchGrandTotalPriceForIdMarket(this);
    }
    return orElse();
  }
}

abstract class _FetchGrandTotalPriceForIdMarket implements CartEvent {
  const factory _FetchGrandTotalPriceForIdMarket() =
      _$FetchGrandTotalPriceForIdMarketImpl;
}

/// @nodoc
abstract class _$$UpdateTenderContractImplCopyWith<$Res> {
  factory _$$UpdateTenderContractImplCopyWith(_$UpdateTenderContractImpl value,
          $Res Function(_$UpdateTenderContractImpl) then) =
      __$$UpdateTenderContractImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<MaterialNumber, List<TenderContract>> tenderContractList});
}

/// @nodoc
class __$$UpdateTenderContractImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$UpdateTenderContractImpl>
    implements _$$UpdateTenderContractImplCopyWith<$Res> {
  __$$UpdateTenderContractImplCopyWithImpl(_$UpdateTenderContractImpl _value,
      $Res Function(_$UpdateTenderContractImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenderContractList = null,
  }) {
    return _then(_$UpdateTenderContractImpl(
      tenderContractList: null == tenderContractList
          ? _value._tenderContractList
          : tenderContractList // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, List<TenderContract>>,
    ));
  }
}

/// @nodoc

class _$UpdateTenderContractImpl implements _UpdateTenderContract {
  const _$UpdateTenderContractImpl(
      {required final Map<MaterialNumber, List<TenderContract>>
          tenderContractList})
      : _tenderContractList = tenderContractList;

  final Map<MaterialNumber, List<TenderContract>> _tenderContractList;
  @override
  Map<MaterialNumber, List<TenderContract>> get tenderContractList {
    if (_tenderContractList is EqualUnmodifiableMapView)
      return _tenderContractList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_tenderContractList);
  }

  @override
  String toString() {
    return 'CartEvent.updateTenderContract(tenderContractList: $tenderContractList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTenderContractImpl &&
            const DeepCollectionEquality()
                .equals(other._tenderContractList, _tenderContractList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_tenderContractList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTenderContractImplCopyWith<_$UpdateTenderContractImpl>
      get copyWith =>
          __$$UpdateTenderContractImplCopyWithImpl<_$UpdateTenderContractImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)
        initialized,
    required TResult Function(PriceAggregate item, List<PriceAggregate> items)
        verifyMaterialDealBonus,
    required TResult Function(
            MaterialInfo bonusMaterial,
            StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)
        addBonusToCartItem,
    required TResult Function() removeSampleBonusFromCartConfig,
    required TResult Function() clearCart,
    required TResult Function() fetchProductsAddedToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCart,
    required TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)
        addHistoryItemsToCart,
    required TResult Function(
            PriceAggregate priceAggregate, EZReachBanner? banner)
        upsertCartItems,
    required TResult Function(List<PriceAggregate> cartProducts)
        getDetailsProductsAddedToCart,
    required TResult Function(Map<MaterialNumber, Price> priceProducts)
        updatePriceProduct,
    required TResult Function() updateProductStock,
    required TResult Function(List<MaterialInfo> invalidCartItems)
        removeInvalidProducts,
    required TResult Function(
            List<PriceAggregate> priceAggregates, bool isDeleteCombo)
        upsertCartItemsWithComboOffers,
    required TResult Function(Price overriddenProductPrice)
        updateCartProductWithCounterOffer,
    required TResult Function() updatePriceForIdMarket,
    required TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)
        updateProductDetermination,
    required TResult Function() fetchGrandTotalPriceForIdMarket,
    required TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)
        updateTenderContract,
  }) {
    return updateTenderContract(tenderContractList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult? Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult? Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult? Function()? removeSampleBonusFromCartConfig,
    TResult? Function()? clearCart,
    TResult? Function()? fetchProductsAddedToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult? Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult? Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult? Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult? Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult? Function()? updateProductStock,
    TResult? Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult? Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult? Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult? Function()? updatePriceForIdMarket,
    TResult? Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult? Function()? fetchGrandTotalPriceForIdMarket,
    TResult? Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
  }) {
    return updateTenderContract?.call(tenderContractList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user)?
        initialized,
    TResult Function(PriceAggregate item, List<PriceAggregate> items)?
        verifyMaterialDealBonus,
    TResult Function(MaterialInfo bonusMaterial, StringValue bonusItemId,
            RequestCounterOfferDetails counterOfferDetails)?
        addBonusToCartItem,
    TResult Function()? removeSampleBonusFromCartConfig,
    TResult Function()? clearCart,
    TResult Function()? fetchProductsAddedToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCart,
    TResult Function(
            List<PriceAggregate> items,
            RequestCounterOfferDetails counterOfferDetails,
            Map<MaterialNumber, TenderContract> tenderContractList)?
        addHistoryItemsToCart,
    TResult Function(PriceAggregate priceAggregate, EZReachBanner? banner)?
        upsertCartItems,
    TResult Function(List<PriceAggregate> cartProducts)?
        getDetailsProductsAddedToCart,
    TResult Function(Map<MaterialNumber, Price> priceProducts)?
        updatePriceProduct,
    TResult Function()? updateProductStock,
    TResult Function(List<MaterialInfo> invalidCartItems)?
        removeInvalidProducts,
    TResult Function(List<PriceAggregate> priceAggregates, bool isDeleteCombo)?
        upsertCartItemsWithComboOffers,
    TResult Function(Price overriddenProductPrice)?
        updateCartProductWithCounterOffer,
    TResult Function()? updatePriceForIdMarket,
    TResult Function(List<AplProduct> productDeterminationList,
            List<PriceAggregate> updatedCartItems)?
        updateProductDetermination,
    TResult Function()? fetchGrandTotalPriceForIdMarket,
    TResult Function(
            Map<MaterialNumber, List<TenderContract>> tenderContractList)?
        updateTenderContract,
    required TResult orElse(),
  }) {
    if (updateTenderContract != null) {
      return updateTenderContract(tenderContractList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_VerifyMaterialDealBonus value)
        verifyMaterialDealBonus,
    required TResult Function(_AddBonusToCartItem value) addBonusToCartItem,
    required TResult Function(_RemoveSampleBonusFromCartConfig value)
        removeSampleBonusFromCartConfig,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_FetchProductsAddedToCart value)
        fetchProductsAddedToCart,
    required TResult Function(_UpsertCart value) upsertCart,
    required TResult Function(_addHistoryItemsToCart value)
        addHistoryItemsToCart,
    required TResult Function(_UpsertCartItems value) upsertCartItems,
    required TResult Function(_GetDetailsProductsAddedToCart value)
        getDetailsProductsAddedToCart,
    required TResult Function(_UpdatePriceProduct value) updatePriceProduct,
    required TResult Function(_UpdateProductStock value) updateProductStock,
    required TResult Function(_RemoveInvalidProducts value)
        removeInvalidProducts,
    required TResult Function(_UpsertCartItemsWithComboOffers value)
        upsertCartItemsWithComboOffers,
    required TResult Function(_UpdateCartProductWithCounterOffer value)
        updateCartProductWithCounterOffer,
    required TResult Function(_UpdatePriceForIdMarket value)
        updatePriceForIdMarket,
    required TResult Function(_UpdateProductDetermination value)
        updateProductDetermination,
    required TResult Function(_FetchGrandTotalPriceForIdMarket value)
        fetchGrandTotalPriceForIdMarket,
    required TResult Function(_UpdateTenderContract value) updateTenderContract,
  }) {
    return updateTenderContract(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult? Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult? Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_FetchProductsAddedToCart value)?
        fetchProductsAddedToCart,
    TResult? Function(_UpsertCart value)? upsertCart,
    TResult? Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult? Function(_UpsertCartItems value)? upsertCartItems,
    TResult? Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult? Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult? Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult? Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult? Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult? Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult? Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult? Function(_UpdateTenderContract value)? updateTenderContract,
  }) {
    return updateTenderContract?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_VerifyMaterialDealBonus value)? verifyMaterialDealBonus,
    TResult Function(_AddBonusToCartItem value)? addBonusToCartItem,
    TResult Function(_RemoveSampleBonusFromCartConfig value)?
        removeSampleBonusFromCartConfig,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_FetchProductsAddedToCart value)? fetchProductsAddedToCart,
    TResult Function(_UpsertCart value)? upsertCart,
    TResult Function(_addHistoryItemsToCart value)? addHistoryItemsToCart,
    TResult Function(_UpsertCartItems value)? upsertCartItems,
    TResult Function(_GetDetailsProductsAddedToCart value)?
        getDetailsProductsAddedToCart,
    TResult Function(_UpdatePriceProduct value)? updatePriceProduct,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_RemoveInvalidProducts value)? removeInvalidProducts,
    TResult Function(_UpsertCartItemsWithComboOffers value)?
        upsertCartItemsWithComboOffers,
    TResult Function(_UpdateCartProductWithCounterOffer value)?
        updateCartProductWithCounterOffer,
    TResult Function(_UpdatePriceForIdMarket value)? updatePriceForIdMarket,
    TResult Function(_UpdateProductDetermination value)?
        updateProductDetermination,
    TResult Function(_FetchGrandTotalPriceForIdMarket value)?
        fetchGrandTotalPriceForIdMarket,
    TResult Function(_UpdateTenderContract value)? updateTenderContract,
    required TResult orElse(),
  }) {
    if (updateTenderContract != null) {
      return updateTenderContract(this);
    }
    return orElse();
  }
}

abstract class _UpdateTenderContract implements CartEvent {
  const factory _UpdateTenderContract(
      {required final Map<MaterialNumber, List<TenderContract>>
          tenderContractList}) = _$UpdateTenderContractImpl;

  Map<MaterialNumber, List<TenderContract>> get tenderContractList;
  @JsonKey(ignore: true)
  _$$UpdateTenderContractImplCopyWith<_$UpdateTenderContractImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CartState {
  List<PriceAggregate> get cartProducts => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get updateFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  bool get isClearing => throw _privateConstructorUsedError;
  bool get isFetchingBonus => throw _privateConstructorUsedError;
  bool get isFetchingCartProductDetail => throw _privateConstructorUsedError;
  bool get isUpserting => throw _privateConstructorUsedError;
  bool get isMappingPrice => throw _privateConstructorUsedError;
  bool get isUpdatingStock => throw _privateConstructorUsedError;
  bool get isBuyAgain => throw _privateConstructorUsedError;
  bool get isAplProductLoading => throw _privateConstructorUsedError;
  bool get isDeleteCombo => throw _privateConstructorUsedError;
  bool get isTenderContractLoading => throw _privateConstructorUsedError;
  bool get isUpdateProductDetermination => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  ShipToInfo get shipToInfo => throw _privateConstructorUsedError;
  SalesOrganisationConfigs get config => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  Map<MaterialNumber, ProductMetaData> get additionInfo =>
      throw _privateConstructorUsedError;
  List<int> get upsertBonusItemInProgressHashCode =>
      throw _privateConstructorUsedError;
  AplGetTotalPrice get aplGetTotalPrice => throw _privateConstructorUsedError;
  AplSimulatorOrder get aplSimulatorOrder => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartStateCopyWith<CartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
  @useResult
  $Res call(
      {List<PriceAggregate> cartProducts,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      Option<Either<ApiFailure, dynamic>> updateFailureOrSuccessOption,
      bool isFetching,
      bool isClearing,
      bool isFetchingBonus,
      bool isFetchingCartProductDetail,
      bool isUpserting,
      bool isMappingPrice,
      bool isUpdatingStock,
      bool isBuyAgain,
      bool isAplProductLoading,
      bool isDeleteCombo,
      bool isTenderContractLoading,
      bool isUpdateProductDetermination,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      SalesOrganisationConfigs config,
      User user,
      Map<MaterialNumber, ProductMetaData> additionInfo,
      List<int> upsertBonusItemInProgressHashCode,
      AplGetTotalPrice aplGetTotalPrice,
      AplSimulatorOrder aplSimulatorOrder});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $SalesOrganisationConfigsCopyWith<$Res> get config;
  $UserCopyWith<$Res> get user;
  $AplGetTotalPriceCopyWith<$Res> get aplGetTotalPrice;
  $AplSimulatorOrderCopyWith<$Res> get aplSimulatorOrder;
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartProducts = null,
    Object? apiFailureOrSuccessOption = null,
    Object? updateFailureOrSuccessOption = null,
    Object? isFetching = null,
    Object? isClearing = null,
    Object? isFetchingBonus = null,
    Object? isFetchingCartProductDetail = null,
    Object? isUpserting = null,
    Object? isMappingPrice = null,
    Object? isUpdatingStock = null,
    Object? isBuyAgain = null,
    Object? isAplProductLoading = null,
    Object? isDeleteCombo = null,
    Object? isTenderContractLoading = null,
    Object? isUpdateProductDetermination = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? config = null,
    Object? user = null,
    Object? additionInfo = null,
    Object? upsertBonusItemInProgressHashCode = null,
    Object? aplGetTotalPrice = null,
    Object? aplSimulatorOrder = null,
  }) {
    return _then(_value.copyWith(
      cartProducts: null == cartProducts
          ? _value.cartProducts
          : cartProducts // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      updateFailureOrSuccessOption: null == updateFailureOrSuccessOption
          ? _value.updateFailureOrSuccessOption
          : updateFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isClearing: null == isClearing
          ? _value.isClearing
          : isClearing // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingBonus: null == isFetchingBonus
          ? _value.isFetchingBonus
          : isFetchingBonus // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingCartProductDetail: null == isFetchingCartProductDetail
          ? _value.isFetchingCartProductDetail
          : isFetchingCartProductDetail // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpserting: null == isUpserting
          ? _value.isUpserting
          : isUpserting // ignore: cast_nullable_to_non_nullable
              as bool,
      isMappingPrice: null == isMappingPrice
          ? _value.isMappingPrice
          : isMappingPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdatingStock: null == isUpdatingStock
          ? _value.isUpdatingStock
          : isUpdatingStock // ignore: cast_nullable_to_non_nullable
              as bool,
      isBuyAgain: null == isBuyAgain
          ? _value.isBuyAgain
          : isBuyAgain // ignore: cast_nullable_to_non_nullable
              as bool,
      isAplProductLoading: null == isAplProductLoading
          ? _value.isAplProductLoading
          : isAplProductLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleteCombo: null == isDeleteCombo
          ? _value.isDeleteCombo
          : isDeleteCombo // ignore: cast_nullable_to_non_nullable
              as bool,
      isTenderContractLoading: null == isTenderContractLoading
          ? _value.isTenderContractLoading
          : isTenderContractLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdateProductDetermination: null == isUpdateProductDetermination
          ? _value.isUpdateProductDetermination
          : isUpdateProductDetermination // ignore: cast_nullable_to_non_nullable
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
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      additionInfo: null == additionInfo
          ? _value.additionInfo
          : additionInfo // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, ProductMetaData>,
      upsertBonusItemInProgressHashCode: null ==
              upsertBonusItemInProgressHashCode
          ? _value.upsertBonusItemInProgressHashCode
          : upsertBonusItemInProgressHashCode // ignore: cast_nullable_to_non_nullable
              as List<int>,
      aplGetTotalPrice: null == aplGetTotalPrice
          ? _value.aplGetTotalPrice
          : aplGetTotalPrice // ignore: cast_nullable_to_non_nullable
              as AplGetTotalPrice,
      aplSimulatorOrder: null == aplSimulatorOrder
          ? _value.aplSimulatorOrder
          : aplSimulatorOrder // ignore: cast_nullable_to_non_nullable
              as AplSimulatorOrder,
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
  $SalesOrganisationConfigsCopyWith<$Res> get config {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value) as $Val);
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
  $AplGetTotalPriceCopyWith<$Res> get aplGetTotalPrice {
    return $AplGetTotalPriceCopyWith<$Res>(_value.aplGetTotalPrice, (value) {
      return _then(_value.copyWith(aplGetTotalPrice: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AplSimulatorOrderCopyWith<$Res> get aplSimulatorOrder {
    return $AplSimulatorOrderCopyWith<$Res>(_value.aplSimulatorOrder, (value) {
      return _then(_value.copyWith(aplSimulatorOrder: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CartStateImplCopyWith<$Res>
    implements $CartStateCopyWith<$Res> {
  factory _$$CartStateImplCopyWith(
          _$CartStateImpl value, $Res Function(_$CartStateImpl) then) =
      __$$CartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PriceAggregate> cartProducts,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      Option<Either<ApiFailure, dynamic>> updateFailureOrSuccessOption,
      bool isFetching,
      bool isClearing,
      bool isFetchingBonus,
      bool isFetchingCartProductDetail,
      bool isUpserting,
      bool isMappingPrice,
      bool isUpdatingStock,
      bool isBuyAgain,
      bool isAplProductLoading,
      bool isDeleteCombo,
      bool isTenderContractLoading,
      bool isUpdateProductDetermination,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      SalesOrganisationConfigs config,
      User user,
      Map<MaterialNumber, ProductMetaData> additionInfo,
      List<int> upsertBonusItemInProgressHashCode,
      AplGetTotalPrice aplGetTotalPrice,
      AplSimulatorOrder aplSimulatorOrder});

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  @override
  $SalesOrganisationConfigsCopyWith<$Res> get config;
  @override
  $UserCopyWith<$Res> get user;
  @override
  $AplGetTotalPriceCopyWith<$Res> get aplGetTotalPrice;
  @override
  $AplSimulatorOrderCopyWith<$Res> get aplSimulatorOrder;
}

/// @nodoc
class __$$CartStateImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartStateImpl>
    implements _$$CartStateImplCopyWith<$Res> {
  __$$CartStateImplCopyWithImpl(
      _$CartStateImpl _value, $Res Function(_$CartStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartProducts = null,
    Object? apiFailureOrSuccessOption = null,
    Object? updateFailureOrSuccessOption = null,
    Object? isFetching = null,
    Object? isClearing = null,
    Object? isFetchingBonus = null,
    Object? isFetchingCartProductDetail = null,
    Object? isUpserting = null,
    Object? isMappingPrice = null,
    Object? isUpdatingStock = null,
    Object? isBuyAgain = null,
    Object? isAplProductLoading = null,
    Object? isDeleteCombo = null,
    Object? isTenderContractLoading = null,
    Object? isUpdateProductDetermination = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? config = null,
    Object? user = null,
    Object? additionInfo = null,
    Object? upsertBonusItemInProgressHashCode = null,
    Object? aplGetTotalPrice = null,
    Object? aplSimulatorOrder = null,
  }) {
    return _then(_$CartStateImpl(
      cartProducts: null == cartProducts
          ? _value._cartProducts
          : cartProducts // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      updateFailureOrSuccessOption: null == updateFailureOrSuccessOption
          ? _value.updateFailureOrSuccessOption
          : updateFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isClearing: null == isClearing
          ? _value.isClearing
          : isClearing // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingBonus: null == isFetchingBonus
          ? _value.isFetchingBonus
          : isFetchingBonus // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingCartProductDetail: null == isFetchingCartProductDetail
          ? _value.isFetchingCartProductDetail
          : isFetchingCartProductDetail // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpserting: null == isUpserting
          ? _value.isUpserting
          : isUpserting // ignore: cast_nullable_to_non_nullable
              as bool,
      isMappingPrice: null == isMappingPrice
          ? _value.isMappingPrice
          : isMappingPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdatingStock: null == isUpdatingStock
          ? _value.isUpdatingStock
          : isUpdatingStock // ignore: cast_nullable_to_non_nullable
              as bool,
      isBuyAgain: null == isBuyAgain
          ? _value.isBuyAgain
          : isBuyAgain // ignore: cast_nullable_to_non_nullable
              as bool,
      isAplProductLoading: null == isAplProductLoading
          ? _value.isAplProductLoading
          : isAplProductLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleteCombo: null == isDeleteCombo
          ? _value.isDeleteCombo
          : isDeleteCombo // ignore: cast_nullable_to_non_nullable
              as bool,
      isTenderContractLoading: null == isTenderContractLoading
          ? _value.isTenderContractLoading
          : isTenderContractLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdateProductDetermination: null == isUpdateProductDetermination
          ? _value.isUpdateProductDetermination
          : isUpdateProductDetermination // ignore: cast_nullable_to_non_nullable
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
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      additionInfo: null == additionInfo
          ? _value._additionInfo
          : additionInfo // ignore: cast_nullable_to_non_nullable
              as Map<MaterialNumber, ProductMetaData>,
      upsertBonusItemInProgressHashCode: null ==
              upsertBonusItemInProgressHashCode
          ? _value._upsertBonusItemInProgressHashCode
          : upsertBonusItemInProgressHashCode // ignore: cast_nullable_to_non_nullable
              as List<int>,
      aplGetTotalPrice: null == aplGetTotalPrice
          ? _value.aplGetTotalPrice
          : aplGetTotalPrice // ignore: cast_nullable_to_non_nullable
              as AplGetTotalPrice,
      aplSimulatorOrder: null == aplSimulatorOrder
          ? _value.aplSimulatorOrder
          : aplSimulatorOrder // ignore: cast_nullable_to_non_nullable
              as AplSimulatorOrder,
    ));
  }
}

/// @nodoc

class _$CartStateImpl extends _CartState {
  const _$CartStateImpl(
      {required final List<PriceAggregate> cartProducts,
      required this.apiFailureOrSuccessOption,
      required this.updateFailureOrSuccessOption,
      required this.isFetching,
      required this.isClearing,
      required this.isFetchingBonus,
      required this.isFetchingCartProductDetail,
      required this.isUpserting,
      required this.isMappingPrice,
      required this.isUpdatingStock,
      required this.isBuyAgain,
      required this.isAplProductLoading,
      required this.isDeleteCombo,
      required this.isTenderContractLoading,
      required this.isUpdateProductDetermination,
      required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.config,
      required this.user,
      required final Map<MaterialNumber, ProductMetaData> additionInfo,
      required final List<int> upsertBonusItemInProgressHashCode,
      required this.aplGetTotalPrice,
      required this.aplSimulatorOrder})
      : _cartProducts = cartProducts,
        _additionInfo = additionInfo,
        _upsertBonusItemInProgressHashCode = upsertBonusItemInProgressHashCode,
        super._();

  final List<PriceAggregate> _cartProducts;
  @override
  List<PriceAggregate> get cartProducts {
    if (_cartProducts is EqualUnmodifiableListView) return _cartProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartProducts);
  }

  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;
  @override
  final Option<Either<ApiFailure, dynamic>> updateFailureOrSuccessOption;
  @override
  final bool isFetching;
  @override
  final bool isClearing;
  @override
  final bool isFetchingBonus;
  @override
  final bool isFetchingCartProductDetail;
  @override
  final bool isUpserting;
  @override
  final bool isMappingPrice;
  @override
  final bool isUpdatingStock;
  @override
  final bool isBuyAgain;
  @override
  final bool isAplProductLoading;
  @override
  final bool isDeleteCombo;
  @override
  final bool isTenderContractLoading;
  @override
  final bool isUpdateProductDetermination;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final SalesOrganisationConfigs config;
  @override
  final User user;
  final Map<MaterialNumber, ProductMetaData> _additionInfo;
  @override
  Map<MaterialNumber, ProductMetaData> get additionInfo {
    if (_additionInfo is EqualUnmodifiableMapView) return _additionInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_additionInfo);
  }

  final List<int> _upsertBonusItemInProgressHashCode;
  @override
  List<int> get upsertBonusItemInProgressHashCode {
    if (_upsertBonusItemInProgressHashCode is EqualUnmodifiableListView)
      return _upsertBonusItemInProgressHashCode;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_upsertBonusItemInProgressHashCode);
  }

  @override
  final AplGetTotalPrice aplGetTotalPrice;
  @override
  final AplSimulatorOrder aplSimulatorOrder;

  @override
  String toString() {
    return 'CartState(cartProducts: $cartProducts, apiFailureOrSuccessOption: $apiFailureOrSuccessOption, updateFailureOrSuccessOption: $updateFailureOrSuccessOption, isFetching: $isFetching, isClearing: $isClearing, isFetchingBonus: $isFetchingBonus, isFetchingCartProductDetail: $isFetchingCartProductDetail, isUpserting: $isUpserting, isMappingPrice: $isMappingPrice, isUpdatingStock: $isUpdatingStock, isBuyAgain: $isBuyAgain, isAplProductLoading: $isAplProductLoading, isDeleteCombo: $isDeleteCombo, isTenderContractLoading: $isTenderContractLoading, isUpdateProductDetermination: $isUpdateProductDetermination, salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, config: $config, user: $user, additionInfo: $additionInfo, upsertBonusItemInProgressHashCode: $upsertBonusItemInProgressHashCode, aplGetTotalPrice: $aplGetTotalPrice, aplSimulatorOrder: $aplSimulatorOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartStateImpl &&
            const DeepCollectionEquality()
                .equals(other._cartProducts, _cartProducts) &&
            (identical(other.apiFailureOrSuccessOption, apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption) &&
            (identical(other.updateFailureOrSuccessOption, updateFailureOrSuccessOption) ||
                other.updateFailureOrSuccessOption ==
                    updateFailureOrSuccessOption) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.isClearing, isClearing) ||
                other.isClearing == isClearing) &&
            (identical(other.isFetchingBonus, isFetchingBonus) ||
                other.isFetchingBonus == isFetchingBonus) &&
            (identical(other.isFetchingCartProductDetail, isFetchingCartProductDetail) ||
                other.isFetchingCartProductDetail ==
                    isFetchingCartProductDetail) &&
            (identical(other.isUpserting, isUpserting) ||
                other.isUpserting == isUpserting) &&
            (identical(other.isMappingPrice, isMappingPrice) ||
                other.isMappingPrice == isMappingPrice) &&
            (identical(other.isUpdatingStock, isUpdatingStock) ||
                other.isUpdatingStock == isUpdatingStock) &&
            (identical(other.isBuyAgain, isBuyAgain) ||
                other.isBuyAgain == isBuyAgain) &&
            (identical(other.isAplProductLoading, isAplProductLoading) ||
                other.isAplProductLoading == isAplProductLoading) &&
            (identical(other.isDeleteCombo, isDeleteCombo) ||
                other.isDeleteCombo == isDeleteCombo) &&
            (identical(other.isTenderContractLoading, isTenderContractLoading) ||
                other.isTenderContractLoading == isTenderContractLoading) &&
            (identical(other.isUpdateProductDetermination, isUpdateProductDetermination) ||
                other.isUpdateProductDetermination ==
                    isUpdateProductDetermination) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.config, config) || other.config == config) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._additionInfo, _additionInfo) &&
            const DeepCollectionEquality().equals(
                other._upsertBonusItemInProgressHashCode,
                _upsertBonusItemInProgressHashCode) &&
            (identical(other.aplGetTotalPrice, aplGetTotalPrice) || other.aplGetTotalPrice == aplGetTotalPrice) &&
            (identical(other.aplSimulatorOrder, aplSimulatorOrder) || other.aplSimulatorOrder == aplSimulatorOrder));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(_cartProducts),
        apiFailureOrSuccessOption,
        updateFailureOrSuccessOption,
        isFetching,
        isClearing,
        isFetchingBonus,
        isFetchingCartProductDetail,
        isUpserting,
        isMappingPrice,
        isUpdatingStock,
        isBuyAgain,
        isAplProductLoading,
        isDeleteCombo,
        isTenderContractLoading,
        isUpdateProductDetermination,
        salesOrganisation,
        customerCodeInfo,
        shipToInfo,
        config,
        user,
        const DeepCollectionEquality().hash(_additionInfo),
        const DeepCollectionEquality().hash(_upsertBonusItemInProgressHashCode),
        aplGetTotalPrice,
        aplSimulatorOrder
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      __$$CartStateImplCopyWithImpl<_$CartStateImpl>(this, _$identity);
}

abstract class _CartState extends CartState {
  const factory _CartState(
      {required final List<PriceAggregate> cartProducts,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption,
      required final Option<Either<ApiFailure, dynamic>>
          updateFailureOrSuccessOption,
      required final bool isFetching,
      required final bool isClearing,
      required final bool isFetchingBonus,
      required final bool isFetchingCartProductDetail,
      required final bool isUpserting,
      required final bool isMappingPrice,
      required final bool isUpdatingStock,
      required final bool isBuyAgain,
      required final bool isAplProductLoading,
      required final bool isDeleteCombo,
      required final bool isTenderContractLoading,
      required final bool isUpdateProductDetermination,
      required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final SalesOrganisationConfigs config,
      required final User user,
      required final Map<MaterialNumber, ProductMetaData> additionInfo,
      required final List<int> upsertBonusItemInProgressHashCode,
      required final AplGetTotalPrice aplGetTotalPrice,
      required final AplSimulatorOrder aplSimulatorOrder}) = _$CartStateImpl;
  const _CartState._() : super._();

  @override
  List<PriceAggregate> get cartProducts;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  Option<Either<ApiFailure, dynamic>> get updateFailureOrSuccessOption;
  @override
  bool get isFetching;
  @override
  bool get isClearing;
  @override
  bool get isFetchingBonus;
  @override
  bool get isFetchingCartProductDetail;
  @override
  bool get isUpserting;
  @override
  bool get isMappingPrice;
  @override
  bool get isUpdatingStock;
  @override
  bool get isBuyAgain;
  @override
  bool get isAplProductLoading;
  @override
  bool get isDeleteCombo;
  @override
  bool get isTenderContractLoading;
  @override
  bool get isUpdateProductDetermination;
  @override
  SalesOrganisation get salesOrganisation;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  ShipToInfo get shipToInfo;
  @override
  SalesOrganisationConfigs get config;
  @override
  User get user;
  @override
  Map<MaterialNumber, ProductMetaData> get additionInfo;
  @override
  List<int> get upsertBonusItemInProgressHashCode;
  @override
  AplGetTotalPrice get aplGetTotalPrice;
  @override
  AplSimulatorOrder get aplSimulatorOrder;
  @override
  @JsonKey(ignore: true)
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_eligibility_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderEligibilityEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user,
            SalesOrganisation salesOrg,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipInfo)
        initialized,
    required TResult Function(List<PriceAggregate> cartItems, double grandTotal,
            double zpSubtotal, double mpSubtotal, double subTotal)
        update,
    required TResult Function(DeliveryOption value) selectDeliveryOption,
    required TResult Function() validateOrderEligibility,
    required TResult Function(UrgentDeliveryTimePickerOption value)
        updateUrgentDeliveryOption,
    required TResult Function(String value) selectRequestDeliveryDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            SalesOrganisation salesOrg,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipInfo)?
        initialized,
    TResult? Function(List<PriceAggregate> cartItems, double grandTotal,
            double zpSubtotal, double mpSubtotal, double subTotal)?
        update,
    TResult? Function(DeliveryOption value)? selectDeliveryOption,
    TResult? Function()? validateOrderEligibility,
    TResult? Function(UrgentDeliveryTimePickerOption value)?
        updateUrgentDeliveryOption,
    TResult? Function(String value)? selectRequestDeliveryDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            SalesOrganisation salesOrg,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipInfo)?
        initialized,
    TResult Function(List<PriceAggregate> cartItems, double grandTotal,
            double zpSubtotal, double mpSubtotal, double subTotal)?
        update,
    TResult Function(DeliveryOption value)? selectDeliveryOption,
    TResult Function()? validateOrderEligibility,
    TResult Function(UrgentDeliveryTimePickerOption value)?
        updateUrgentDeliveryOption,
    TResult Function(String value)? selectRequestDeliveryDate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Update value) update,
    required TResult Function(_SelectDeliveryOption value) selectDeliveryOption,
    required TResult Function(_ValidateOrderEligibility value)
        validateOrderEligibility,
    required TResult Function(_UpdateUrgentDeliveryOption value)
        updateUrgentDeliveryOption,
    required TResult Function(_SelectRequestDeliveryDate value)
        selectRequestDeliveryDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Update value)? update,
    TResult? Function(_SelectDeliveryOption value)? selectDeliveryOption,
    TResult? Function(_ValidateOrderEligibility value)?
        validateOrderEligibility,
    TResult? Function(_UpdateUrgentDeliveryOption value)?
        updateUrgentDeliveryOption,
    TResult? Function(_SelectRequestDeliveryDate value)?
        selectRequestDeliveryDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Update value)? update,
    TResult Function(_SelectDeliveryOption value)? selectDeliveryOption,
    TResult Function(_ValidateOrderEligibility value)? validateOrderEligibility,
    TResult Function(_UpdateUrgentDeliveryOption value)?
        updateUrgentDeliveryOption,
    TResult Function(_SelectRequestDeliveryDate value)?
        selectRequestDeliveryDate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderEligibilityEventCopyWith<$Res> {
  factory $OrderEligibilityEventCopyWith(OrderEligibilityEvent value,
          $Res Function(OrderEligibilityEvent) then) =
      _$OrderEligibilityEventCopyWithImpl<$Res, OrderEligibilityEvent>;
}

/// @nodoc
class _$OrderEligibilityEventCopyWithImpl<$Res,
        $Val extends OrderEligibilityEvent>
    implements $OrderEligibilityEventCopyWith<$Res> {
  _$OrderEligibilityEventCopyWithImpl(this._value, this._then);

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
      {User user,
      SalesOrganisation salesOrg,
      SalesOrganisationConfigs configs,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipInfo});

  $UserCopyWith<$Res> get user;
  $SalesOrganisationCopyWith<$Res> get salesOrg;
  $SalesOrganisationConfigsCopyWith<$Res> get configs;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipInfo;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$OrderEligibilityEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? salesOrg = null,
    Object? configs = null,
    Object? customerCodeInfo = null,
    Object? shipInfo = null,
  }) {
    return _then(_$InitializedImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      configs: null == configs
          ? _value.configs
          : configs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipInfo: null == shipInfo
          ? _value.shipInfo
          : shipInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
    ));
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
  $SalesOrganisationCopyWith<$Res> get salesOrg {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrg, (value) {
      return _then(_value.copyWith(salesOrg: value));
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
  $ShipToInfoCopyWith<$Res> get shipInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipInfo, (value) {
      return _then(_value.copyWith(shipInfo: value));
    });
  }
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl(
      {required this.user,
      required this.salesOrg,
      required this.configs,
      required this.customerCodeInfo,
      required this.shipInfo});

  @override
  final User user;
  @override
  final SalesOrganisation salesOrg;
  @override
  final SalesOrganisationConfigs configs;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipInfo;

  @override
  String toString() {
    return 'OrderEligibilityEvent.initialized(user: $user, salesOrg: $salesOrg, configs: $configs, customerCodeInfo: $customerCodeInfo, shipInfo: $shipInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializedImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.configs, configs) || other.configs == configs) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipInfo, shipInfo) ||
                other.shipInfo == shipInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, user, salesOrg, configs, customerCodeInfo, shipInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      __$$InitializedImplCopyWithImpl<_$InitializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user,
            SalesOrganisation salesOrg,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipInfo)
        initialized,
    required TResult Function(List<PriceAggregate> cartItems, double grandTotal,
            double zpSubtotal, double mpSubtotal, double subTotal)
        update,
    required TResult Function(DeliveryOption value) selectDeliveryOption,
    required TResult Function() validateOrderEligibility,
    required TResult Function(UrgentDeliveryTimePickerOption value)
        updateUrgentDeliveryOption,
    required TResult Function(String value) selectRequestDeliveryDate,
  }) {
    return initialized(user, salesOrg, configs, customerCodeInfo, shipInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            SalesOrganisation salesOrg,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipInfo)?
        initialized,
    TResult? Function(List<PriceAggregate> cartItems, double grandTotal,
            double zpSubtotal, double mpSubtotal, double subTotal)?
        update,
    TResult? Function(DeliveryOption value)? selectDeliveryOption,
    TResult? Function()? validateOrderEligibility,
    TResult? Function(UrgentDeliveryTimePickerOption value)?
        updateUrgentDeliveryOption,
    TResult? Function(String value)? selectRequestDeliveryDate,
  }) {
    return initialized?.call(
        user, salesOrg, configs, customerCodeInfo, shipInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            SalesOrganisation salesOrg,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipInfo)?
        initialized,
    TResult Function(List<PriceAggregate> cartItems, double grandTotal,
            double zpSubtotal, double mpSubtotal, double subTotal)?
        update,
    TResult Function(DeliveryOption value)? selectDeliveryOption,
    TResult Function()? validateOrderEligibility,
    TResult Function(UrgentDeliveryTimePickerOption value)?
        updateUrgentDeliveryOption,
    TResult Function(String value)? selectRequestDeliveryDate,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(user, salesOrg, configs, customerCodeInfo, shipInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Update value) update,
    required TResult Function(_SelectDeliveryOption value) selectDeliveryOption,
    required TResult Function(_ValidateOrderEligibility value)
        validateOrderEligibility,
    required TResult Function(_UpdateUrgentDeliveryOption value)
        updateUrgentDeliveryOption,
    required TResult Function(_SelectRequestDeliveryDate value)
        selectRequestDeliveryDate,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Update value)? update,
    TResult? Function(_SelectDeliveryOption value)? selectDeliveryOption,
    TResult? Function(_ValidateOrderEligibility value)?
        validateOrderEligibility,
    TResult? Function(_UpdateUrgentDeliveryOption value)?
        updateUrgentDeliveryOption,
    TResult? Function(_SelectRequestDeliveryDate value)?
        selectRequestDeliveryDate,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Update value)? update,
    TResult Function(_SelectDeliveryOption value)? selectDeliveryOption,
    TResult Function(_ValidateOrderEligibility value)? validateOrderEligibility,
    TResult Function(_UpdateUrgentDeliveryOption value)?
        updateUrgentDeliveryOption,
    TResult Function(_SelectRequestDeliveryDate value)?
        selectRequestDeliveryDate,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements OrderEligibilityEvent {
  const factory _Initialized(
      {required final User user,
      required final SalesOrganisation salesOrg,
      required final SalesOrganisationConfigs configs,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipInfo}) = _$InitializedImpl;

  User get user;
  SalesOrganisation get salesOrg;
  SalesOrganisationConfigs get configs;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipInfo;
  @JsonKey(ignore: true)
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateImplCopyWith<$Res> {
  factory _$$UpdateImplCopyWith(
          _$UpdateImpl value, $Res Function(_$UpdateImpl) then) =
      __$$UpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<PriceAggregate> cartItems,
      double grandTotal,
      double zpSubtotal,
      double mpSubtotal,
      double subTotal});
}

/// @nodoc
class __$$UpdateImplCopyWithImpl<$Res>
    extends _$OrderEligibilityEventCopyWithImpl<$Res, _$UpdateImpl>
    implements _$$UpdateImplCopyWith<$Res> {
  __$$UpdateImplCopyWithImpl(
      _$UpdateImpl _value, $Res Function(_$UpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItems = null,
    Object? grandTotal = null,
    Object? zpSubtotal = null,
    Object? mpSubtotal = null,
    Object? subTotal = null,
  }) {
    return _then(_$UpdateImpl(
      cartItems: null == cartItems
          ? _value._cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
      grandTotal: null == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
      zpSubtotal: null == zpSubtotal
          ? _value.zpSubtotal
          : zpSubtotal // ignore: cast_nullable_to_non_nullable
              as double,
      mpSubtotal: null == mpSubtotal
          ? _value.mpSubtotal
          : mpSubtotal // ignore: cast_nullable_to_non_nullable
              as double,
      subTotal: null == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$UpdateImpl implements _Update {
  const _$UpdateImpl(
      {required final List<PriceAggregate> cartItems,
      required this.grandTotal,
      required this.zpSubtotal,
      required this.mpSubtotal,
      required this.subTotal})
      : _cartItems = cartItems;

  final List<PriceAggregate> _cartItems;
  @override
  List<PriceAggregate> get cartItems {
    if (_cartItems is EqualUnmodifiableListView) return _cartItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartItems);
  }

  @override
  final double grandTotal;
  @override
  final double zpSubtotal;
  @override
  final double mpSubtotal;
  @override
  final double subTotal;

  @override
  String toString() {
    return 'OrderEligibilityEvent.update(cartItems: $cartItems, grandTotal: $grandTotal, zpSubtotal: $zpSubtotal, mpSubtotal: $mpSubtotal, subTotal: $subTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateImpl &&
            const DeepCollectionEquality()
                .equals(other._cartItems, _cartItems) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.zpSubtotal, zpSubtotal) ||
                other.zpSubtotal == zpSubtotal) &&
            (identical(other.mpSubtotal, mpSubtotal) ||
                other.mpSubtotal == mpSubtotal) &&
            (identical(other.subTotal, subTotal) ||
                other.subTotal == subTotal));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cartItems),
      grandTotal,
      zpSubtotal,
      mpSubtotal,
      subTotal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
      __$$UpdateImplCopyWithImpl<_$UpdateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user,
            SalesOrganisation salesOrg,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipInfo)
        initialized,
    required TResult Function(List<PriceAggregate> cartItems, double grandTotal,
            double zpSubtotal, double mpSubtotal, double subTotal)
        update,
    required TResult Function(DeliveryOption value) selectDeliveryOption,
    required TResult Function() validateOrderEligibility,
    required TResult Function(UrgentDeliveryTimePickerOption value)
        updateUrgentDeliveryOption,
    required TResult Function(String value) selectRequestDeliveryDate,
  }) {
    return update(cartItems, grandTotal, zpSubtotal, mpSubtotal, subTotal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            SalesOrganisation salesOrg,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipInfo)?
        initialized,
    TResult? Function(List<PriceAggregate> cartItems, double grandTotal,
            double zpSubtotal, double mpSubtotal, double subTotal)?
        update,
    TResult? Function(DeliveryOption value)? selectDeliveryOption,
    TResult? Function()? validateOrderEligibility,
    TResult? Function(UrgentDeliveryTimePickerOption value)?
        updateUrgentDeliveryOption,
    TResult? Function(String value)? selectRequestDeliveryDate,
  }) {
    return update?.call(
        cartItems, grandTotal, zpSubtotal, mpSubtotal, subTotal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            SalesOrganisation salesOrg,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipInfo)?
        initialized,
    TResult Function(List<PriceAggregate> cartItems, double grandTotal,
            double zpSubtotal, double mpSubtotal, double subTotal)?
        update,
    TResult Function(DeliveryOption value)? selectDeliveryOption,
    TResult Function()? validateOrderEligibility,
    TResult Function(UrgentDeliveryTimePickerOption value)?
        updateUrgentDeliveryOption,
    TResult Function(String value)? selectRequestDeliveryDate,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(cartItems, grandTotal, zpSubtotal, mpSubtotal, subTotal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Update value) update,
    required TResult Function(_SelectDeliveryOption value) selectDeliveryOption,
    required TResult Function(_ValidateOrderEligibility value)
        validateOrderEligibility,
    required TResult Function(_UpdateUrgentDeliveryOption value)
        updateUrgentDeliveryOption,
    required TResult Function(_SelectRequestDeliveryDate value)
        selectRequestDeliveryDate,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Update value)? update,
    TResult? Function(_SelectDeliveryOption value)? selectDeliveryOption,
    TResult? Function(_ValidateOrderEligibility value)?
        validateOrderEligibility,
    TResult? Function(_UpdateUrgentDeliveryOption value)?
        updateUrgentDeliveryOption,
    TResult? Function(_SelectRequestDeliveryDate value)?
        selectRequestDeliveryDate,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Update value)? update,
    TResult Function(_SelectDeliveryOption value)? selectDeliveryOption,
    TResult Function(_ValidateOrderEligibility value)? validateOrderEligibility,
    TResult Function(_UpdateUrgentDeliveryOption value)?
        updateUrgentDeliveryOption,
    TResult Function(_SelectRequestDeliveryDate value)?
        selectRequestDeliveryDate,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _Update implements OrderEligibilityEvent {
  const factory _Update(
      {required final List<PriceAggregate> cartItems,
      required final double grandTotal,
      required final double zpSubtotal,
      required final double mpSubtotal,
      required final double subTotal}) = _$UpdateImpl;

  List<PriceAggregate> get cartItems;
  double get grandTotal;
  double get zpSubtotal;
  double get mpSubtotal;
  double get subTotal;
  @JsonKey(ignore: true)
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectDeliveryOptionImplCopyWith<$Res> {
  factory _$$SelectDeliveryOptionImplCopyWith(_$SelectDeliveryOptionImpl value,
          $Res Function(_$SelectDeliveryOptionImpl) then) =
      __$$SelectDeliveryOptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DeliveryOption value});
}

/// @nodoc
class __$$SelectDeliveryOptionImplCopyWithImpl<$Res>
    extends _$OrderEligibilityEventCopyWithImpl<$Res,
        _$SelectDeliveryOptionImpl>
    implements _$$SelectDeliveryOptionImplCopyWith<$Res> {
  __$$SelectDeliveryOptionImplCopyWithImpl(_$SelectDeliveryOptionImpl _value,
      $Res Function(_$SelectDeliveryOptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$SelectDeliveryOptionImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as DeliveryOption,
    ));
  }
}

/// @nodoc

class _$SelectDeliveryOptionImpl implements _SelectDeliveryOption {
  const _$SelectDeliveryOptionImpl(this.value);

  @override
  final DeliveryOption value;

  @override
  String toString() {
    return 'OrderEligibilityEvent.selectDeliveryOption(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectDeliveryOptionImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectDeliveryOptionImplCopyWith<_$SelectDeliveryOptionImpl>
      get copyWith =>
          __$$SelectDeliveryOptionImplCopyWithImpl<_$SelectDeliveryOptionImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user,
            SalesOrganisation salesOrg,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipInfo)
        initialized,
    required TResult Function(List<PriceAggregate> cartItems, double grandTotal,
            double zpSubtotal, double mpSubtotal, double subTotal)
        update,
    required TResult Function(DeliveryOption value) selectDeliveryOption,
    required TResult Function() validateOrderEligibility,
    required TResult Function(UrgentDeliveryTimePickerOption value)
        updateUrgentDeliveryOption,
    required TResult Function(String value) selectRequestDeliveryDate,
  }) {
    return selectDeliveryOption(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            SalesOrganisation salesOrg,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipInfo)?
        initialized,
    TResult? Function(List<PriceAggregate> cartItems, double grandTotal,
            double zpSubtotal, double mpSubtotal, double subTotal)?
        update,
    TResult? Function(DeliveryOption value)? selectDeliveryOption,
    TResult? Function()? validateOrderEligibility,
    TResult? Function(UrgentDeliveryTimePickerOption value)?
        updateUrgentDeliveryOption,
    TResult? Function(String value)? selectRequestDeliveryDate,
  }) {
    return selectDeliveryOption?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            SalesOrganisation salesOrg,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipInfo)?
        initialized,
    TResult Function(List<PriceAggregate> cartItems, double grandTotal,
            double zpSubtotal, double mpSubtotal, double subTotal)?
        update,
    TResult Function(DeliveryOption value)? selectDeliveryOption,
    TResult Function()? validateOrderEligibility,
    TResult Function(UrgentDeliveryTimePickerOption value)?
        updateUrgentDeliveryOption,
    TResult Function(String value)? selectRequestDeliveryDate,
    required TResult orElse(),
  }) {
    if (selectDeliveryOption != null) {
      return selectDeliveryOption(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Update value) update,
    required TResult Function(_SelectDeliveryOption value) selectDeliveryOption,
    required TResult Function(_ValidateOrderEligibility value)
        validateOrderEligibility,
    required TResult Function(_UpdateUrgentDeliveryOption value)
        updateUrgentDeliveryOption,
    required TResult Function(_SelectRequestDeliveryDate value)
        selectRequestDeliveryDate,
  }) {
    return selectDeliveryOption(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Update value)? update,
    TResult? Function(_SelectDeliveryOption value)? selectDeliveryOption,
    TResult? Function(_ValidateOrderEligibility value)?
        validateOrderEligibility,
    TResult? Function(_UpdateUrgentDeliveryOption value)?
        updateUrgentDeliveryOption,
    TResult? Function(_SelectRequestDeliveryDate value)?
        selectRequestDeliveryDate,
  }) {
    return selectDeliveryOption?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Update value)? update,
    TResult Function(_SelectDeliveryOption value)? selectDeliveryOption,
    TResult Function(_ValidateOrderEligibility value)? validateOrderEligibility,
    TResult Function(_UpdateUrgentDeliveryOption value)?
        updateUrgentDeliveryOption,
    TResult Function(_SelectRequestDeliveryDate value)?
        selectRequestDeliveryDate,
    required TResult orElse(),
  }) {
    if (selectDeliveryOption != null) {
      return selectDeliveryOption(this);
    }
    return orElse();
  }
}

abstract class _SelectDeliveryOption implements OrderEligibilityEvent {
  const factory _SelectDeliveryOption(final DeliveryOption value) =
      _$SelectDeliveryOptionImpl;

  DeliveryOption get value;
  @JsonKey(ignore: true)
  _$$SelectDeliveryOptionImplCopyWith<_$SelectDeliveryOptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidateOrderEligibilityImplCopyWith<$Res> {
  factory _$$ValidateOrderEligibilityImplCopyWith(
          _$ValidateOrderEligibilityImpl value,
          $Res Function(_$ValidateOrderEligibilityImpl) then) =
      __$$ValidateOrderEligibilityImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ValidateOrderEligibilityImplCopyWithImpl<$Res>
    extends _$OrderEligibilityEventCopyWithImpl<$Res,
        _$ValidateOrderEligibilityImpl>
    implements _$$ValidateOrderEligibilityImplCopyWith<$Res> {
  __$$ValidateOrderEligibilityImplCopyWithImpl(
      _$ValidateOrderEligibilityImpl _value,
      $Res Function(_$ValidateOrderEligibilityImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ValidateOrderEligibilityImpl implements _ValidateOrderEligibility {
  const _$ValidateOrderEligibilityImpl();

  @override
  String toString() {
    return 'OrderEligibilityEvent.validateOrderEligibility()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidateOrderEligibilityImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user,
            SalesOrganisation salesOrg,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipInfo)
        initialized,
    required TResult Function(List<PriceAggregate> cartItems, double grandTotal,
            double zpSubtotal, double mpSubtotal, double subTotal)
        update,
    required TResult Function(DeliveryOption value) selectDeliveryOption,
    required TResult Function() validateOrderEligibility,
    required TResult Function(UrgentDeliveryTimePickerOption value)
        updateUrgentDeliveryOption,
    required TResult Function(String value) selectRequestDeliveryDate,
  }) {
    return validateOrderEligibility();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            SalesOrganisation salesOrg,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipInfo)?
        initialized,
    TResult? Function(List<PriceAggregate> cartItems, double grandTotal,
            double zpSubtotal, double mpSubtotal, double subTotal)?
        update,
    TResult? Function(DeliveryOption value)? selectDeliveryOption,
    TResult? Function()? validateOrderEligibility,
    TResult? Function(UrgentDeliveryTimePickerOption value)?
        updateUrgentDeliveryOption,
    TResult? Function(String value)? selectRequestDeliveryDate,
  }) {
    return validateOrderEligibility?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            SalesOrganisation salesOrg,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipInfo)?
        initialized,
    TResult Function(List<PriceAggregate> cartItems, double grandTotal,
            double zpSubtotal, double mpSubtotal, double subTotal)?
        update,
    TResult Function(DeliveryOption value)? selectDeliveryOption,
    TResult Function()? validateOrderEligibility,
    TResult Function(UrgentDeliveryTimePickerOption value)?
        updateUrgentDeliveryOption,
    TResult Function(String value)? selectRequestDeliveryDate,
    required TResult orElse(),
  }) {
    if (validateOrderEligibility != null) {
      return validateOrderEligibility();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Update value) update,
    required TResult Function(_SelectDeliveryOption value) selectDeliveryOption,
    required TResult Function(_ValidateOrderEligibility value)
        validateOrderEligibility,
    required TResult Function(_UpdateUrgentDeliveryOption value)
        updateUrgentDeliveryOption,
    required TResult Function(_SelectRequestDeliveryDate value)
        selectRequestDeliveryDate,
  }) {
    return validateOrderEligibility(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Update value)? update,
    TResult? Function(_SelectDeliveryOption value)? selectDeliveryOption,
    TResult? Function(_ValidateOrderEligibility value)?
        validateOrderEligibility,
    TResult? Function(_UpdateUrgentDeliveryOption value)?
        updateUrgentDeliveryOption,
    TResult? Function(_SelectRequestDeliveryDate value)?
        selectRequestDeliveryDate,
  }) {
    return validateOrderEligibility?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Update value)? update,
    TResult Function(_SelectDeliveryOption value)? selectDeliveryOption,
    TResult Function(_ValidateOrderEligibility value)? validateOrderEligibility,
    TResult Function(_UpdateUrgentDeliveryOption value)?
        updateUrgentDeliveryOption,
    TResult Function(_SelectRequestDeliveryDate value)?
        selectRequestDeliveryDate,
    required TResult orElse(),
  }) {
    if (validateOrderEligibility != null) {
      return validateOrderEligibility(this);
    }
    return orElse();
  }
}

abstract class _ValidateOrderEligibility implements OrderEligibilityEvent {
  const factory _ValidateOrderEligibility() = _$ValidateOrderEligibilityImpl;
}

/// @nodoc
abstract class _$$UpdateUrgentDeliveryOptionImplCopyWith<$Res> {
  factory _$$UpdateUrgentDeliveryOptionImplCopyWith(
          _$UpdateUrgentDeliveryOptionImpl value,
          $Res Function(_$UpdateUrgentDeliveryOptionImpl) then) =
      __$$UpdateUrgentDeliveryOptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UrgentDeliveryTimePickerOption value});
}

/// @nodoc
class __$$UpdateUrgentDeliveryOptionImplCopyWithImpl<$Res>
    extends _$OrderEligibilityEventCopyWithImpl<$Res,
        _$UpdateUrgentDeliveryOptionImpl>
    implements _$$UpdateUrgentDeliveryOptionImplCopyWith<$Res> {
  __$$UpdateUrgentDeliveryOptionImplCopyWithImpl(
      _$UpdateUrgentDeliveryOptionImpl _value,
      $Res Function(_$UpdateUrgentDeliveryOptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$UpdateUrgentDeliveryOptionImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as UrgentDeliveryTimePickerOption,
    ));
  }
}

/// @nodoc

class _$UpdateUrgentDeliveryOptionImpl implements _UpdateUrgentDeliveryOption {
  const _$UpdateUrgentDeliveryOptionImpl(this.value);

  @override
  final UrgentDeliveryTimePickerOption value;

  @override
  String toString() {
    return 'OrderEligibilityEvent.updateUrgentDeliveryOption(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUrgentDeliveryOptionImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUrgentDeliveryOptionImplCopyWith<_$UpdateUrgentDeliveryOptionImpl>
      get copyWith => __$$UpdateUrgentDeliveryOptionImplCopyWithImpl<
          _$UpdateUrgentDeliveryOptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user,
            SalesOrganisation salesOrg,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipInfo)
        initialized,
    required TResult Function(List<PriceAggregate> cartItems, double grandTotal,
            double zpSubtotal, double mpSubtotal, double subTotal)
        update,
    required TResult Function(DeliveryOption value) selectDeliveryOption,
    required TResult Function() validateOrderEligibility,
    required TResult Function(UrgentDeliveryTimePickerOption value)
        updateUrgentDeliveryOption,
    required TResult Function(String value) selectRequestDeliveryDate,
  }) {
    return updateUrgentDeliveryOption(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            SalesOrganisation salesOrg,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipInfo)?
        initialized,
    TResult? Function(List<PriceAggregate> cartItems, double grandTotal,
            double zpSubtotal, double mpSubtotal, double subTotal)?
        update,
    TResult? Function(DeliveryOption value)? selectDeliveryOption,
    TResult? Function()? validateOrderEligibility,
    TResult? Function(UrgentDeliveryTimePickerOption value)?
        updateUrgentDeliveryOption,
    TResult? Function(String value)? selectRequestDeliveryDate,
  }) {
    return updateUrgentDeliveryOption?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            SalesOrganisation salesOrg,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipInfo)?
        initialized,
    TResult Function(List<PriceAggregate> cartItems, double grandTotal,
            double zpSubtotal, double mpSubtotal, double subTotal)?
        update,
    TResult Function(DeliveryOption value)? selectDeliveryOption,
    TResult Function()? validateOrderEligibility,
    TResult Function(UrgentDeliveryTimePickerOption value)?
        updateUrgentDeliveryOption,
    TResult Function(String value)? selectRequestDeliveryDate,
    required TResult orElse(),
  }) {
    if (updateUrgentDeliveryOption != null) {
      return updateUrgentDeliveryOption(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Update value) update,
    required TResult Function(_SelectDeliveryOption value) selectDeliveryOption,
    required TResult Function(_ValidateOrderEligibility value)
        validateOrderEligibility,
    required TResult Function(_UpdateUrgentDeliveryOption value)
        updateUrgentDeliveryOption,
    required TResult Function(_SelectRequestDeliveryDate value)
        selectRequestDeliveryDate,
  }) {
    return updateUrgentDeliveryOption(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Update value)? update,
    TResult? Function(_SelectDeliveryOption value)? selectDeliveryOption,
    TResult? Function(_ValidateOrderEligibility value)?
        validateOrderEligibility,
    TResult? Function(_UpdateUrgentDeliveryOption value)?
        updateUrgentDeliveryOption,
    TResult? Function(_SelectRequestDeliveryDate value)?
        selectRequestDeliveryDate,
  }) {
    return updateUrgentDeliveryOption?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Update value)? update,
    TResult Function(_SelectDeliveryOption value)? selectDeliveryOption,
    TResult Function(_ValidateOrderEligibility value)? validateOrderEligibility,
    TResult Function(_UpdateUrgentDeliveryOption value)?
        updateUrgentDeliveryOption,
    TResult Function(_SelectRequestDeliveryDate value)?
        selectRequestDeliveryDate,
    required TResult orElse(),
  }) {
    if (updateUrgentDeliveryOption != null) {
      return updateUrgentDeliveryOption(this);
    }
    return orElse();
  }
}

abstract class _UpdateUrgentDeliveryOption implements OrderEligibilityEvent {
  const factory _UpdateUrgentDeliveryOption(
          final UrgentDeliveryTimePickerOption value) =
      _$UpdateUrgentDeliveryOptionImpl;

  UrgentDeliveryTimePickerOption get value;
  @JsonKey(ignore: true)
  _$$UpdateUrgentDeliveryOptionImplCopyWith<_$UpdateUrgentDeliveryOptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectRequestDeliveryDateImplCopyWith<$Res> {
  factory _$$SelectRequestDeliveryDateImplCopyWith(
          _$SelectRequestDeliveryDateImpl value,
          $Res Function(_$SelectRequestDeliveryDateImpl) then) =
      __$$SelectRequestDeliveryDateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$SelectRequestDeliveryDateImplCopyWithImpl<$Res>
    extends _$OrderEligibilityEventCopyWithImpl<$Res,
        _$SelectRequestDeliveryDateImpl>
    implements _$$SelectRequestDeliveryDateImplCopyWith<$Res> {
  __$$SelectRequestDeliveryDateImplCopyWithImpl(
      _$SelectRequestDeliveryDateImpl _value,
      $Res Function(_$SelectRequestDeliveryDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$SelectRequestDeliveryDateImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelectRequestDeliveryDateImpl implements _SelectRequestDeliveryDate {
  const _$SelectRequestDeliveryDateImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'OrderEligibilityEvent.selectRequestDeliveryDate(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectRequestDeliveryDateImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectRequestDeliveryDateImplCopyWith<_$SelectRequestDeliveryDateImpl>
      get copyWith => __$$SelectRequestDeliveryDateImplCopyWithImpl<
          _$SelectRequestDeliveryDateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            User user,
            SalesOrganisation salesOrg,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipInfo)
        initialized,
    required TResult Function(List<PriceAggregate> cartItems, double grandTotal,
            double zpSubtotal, double mpSubtotal, double subTotal)
        update,
    required TResult Function(DeliveryOption value) selectDeliveryOption,
    required TResult Function() validateOrderEligibility,
    required TResult Function(UrgentDeliveryTimePickerOption value)
        updateUrgentDeliveryOption,
    required TResult Function(String value) selectRequestDeliveryDate,
  }) {
    return selectRequestDeliveryDate(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            User user,
            SalesOrganisation salesOrg,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipInfo)?
        initialized,
    TResult? Function(List<PriceAggregate> cartItems, double grandTotal,
            double zpSubtotal, double mpSubtotal, double subTotal)?
        update,
    TResult? Function(DeliveryOption value)? selectDeliveryOption,
    TResult? Function()? validateOrderEligibility,
    TResult? Function(UrgentDeliveryTimePickerOption value)?
        updateUrgentDeliveryOption,
    TResult? Function(String value)? selectRequestDeliveryDate,
  }) {
    return selectRequestDeliveryDate?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            User user,
            SalesOrganisation salesOrg,
            SalesOrganisationConfigs configs,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipInfo)?
        initialized,
    TResult Function(List<PriceAggregate> cartItems, double grandTotal,
            double zpSubtotal, double mpSubtotal, double subTotal)?
        update,
    TResult Function(DeliveryOption value)? selectDeliveryOption,
    TResult Function()? validateOrderEligibility,
    TResult Function(UrgentDeliveryTimePickerOption value)?
        updateUrgentDeliveryOption,
    TResult Function(String value)? selectRequestDeliveryDate,
    required TResult orElse(),
  }) {
    if (selectRequestDeliveryDate != null) {
      return selectRequestDeliveryDate(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Update value) update,
    required TResult Function(_SelectDeliveryOption value) selectDeliveryOption,
    required TResult Function(_ValidateOrderEligibility value)
        validateOrderEligibility,
    required TResult Function(_UpdateUrgentDeliveryOption value)
        updateUrgentDeliveryOption,
    required TResult Function(_SelectRequestDeliveryDate value)
        selectRequestDeliveryDate,
  }) {
    return selectRequestDeliveryDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Update value)? update,
    TResult? Function(_SelectDeliveryOption value)? selectDeliveryOption,
    TResult? Function(_ValidateOrderEligibility value)?
        validateOrderEligibility,
    TResult? Function(_UpdateUrgentDeliveryOption value)?
        updateUrgentDeliveryOption,
    TResult? Function(_SelectRequestDeliveryDate value)?
        selectRequestDeliveryDate,
  }) {
    return selectRequestDeliveryDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Update value)? update,
    TResult Function(_SelectDeliveryOption value)? selectDeliveryOption,
    TResult Function(_ValidateOrderEligibility value)? validateOrderEligibility,
    TResult Function(_UpdateUrgentDeliveryOption value)?
        updateUrgentDeliveryOption,
    TResult Function(_SelectRequestDeliveryDate value)?
        selectRequestDeliveryDate,
    required TResult orElse(),
  }) {
    if (selectRequestDeliveryDate != null) {
      return selectRequestDeliveryDate(this);
    }
    return orElse();
  }
}

abstract class _SelectRequestDeliveryDate implements OrderEligibilityEvent {
  const factory _SelectRequestDeliveryDate(final String value) =
      _$SelectRequestDeliveryDateImpl;

  String get value;
  @JsonKey(ignore: true)
  _$$SelectRequestDeliveryDateImplCopyWith<_$SelectRequestDeliveryDateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderEligibilityState {
  List<PriceAggregate> get cartItems => throw _privateConstructorUsedError;
  SalesOrganisationConfigs get configs => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrg => throw _privateConstructorUsedError;
  double get grandTotal => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  ShipToInfo get shipInfo => throw _privateConstructorUsedError;
  DeliveryOption get deliveryOption => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  double get zpSubtotal => throw _privateConstructorUsedError;
  double get mpSubtotal => throw _privateConstructorUsedError;
  double get subTotal => throw _privateConstructorUsedError;
  bool get showErrorMessage => throw _privateConstructorUsedError;
  UrgentDeliveryTimePickerOption get urgentDeliveryOption =>
      throw _privateConstructorUsedError;
  String get selectedRequestDeliveryDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderEligibilityStateCopyWith<OrderEligibilityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderEligibilityStateCopyWith<$Res> {
  factory $OrderEligibilityStateCopyWith(OrderEligibilityState value,
          $Res Function(OrderEligibilityState) then) =
      _$OrderEligibilityStateCopyWithImpl<$Res, OrderEligibilityState>;
  @useResult
  $Res call(
      {List<PriceAggregate> cartItems,
      SalesOrganisationConfigs configs,
      SalesOrganisation salesOrg,
      double grandTotal,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipInfo,
      DeliveryOption deliveryOption,
      User user,
      double zpSubtotal,
      double mpSubtotal,
      double subTotal,
      bool showErrorMessage,
      UrgentDeliveryTimePickerOption urgentDeliveryOption,
      String selectedRequestDeliveryDate});

  $SalesOrganisationConfigsCopyWith<$Res> get configs;
  $SalesOrganisationCopyWith<$Res> get salesOrg;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipInfo;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$OrderEligibilityStateCopyWithImpl<$Res,
        $Val extends OrderEligibilityState>
    implements $OrderEligibilityStateCopyWith<$Res> {
  _$OrderEligibilityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItems = null,
    Object? configs = null,
    Object? salesOrg = null,
    Object? grandTotal = null,
    Object? customerCodeInfo = null,
    Object? shipInfo = null,
    Object? deliveryOption = null,
    Object? user = null,
    Object? zpSubtotal = null,
    Object? mpSubtotal = null,
    Object? subTotal = null,
    Object? showErrorMessage = null,
    Object? urgentDeliveryOption = null,
    Object? selectedRequestDeliveryDate = null,
  }) {
    return _then(_value.copyWith(
      cartItems: null == cartItems
          ? _value.cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
      configs: null == configs
          ? _value.configs
          : configs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      grandTotal: null == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipInfo: null == shipInfo
          ? _value.shipInfo
          : shipInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      deliveryOption: null == deliveryOption
          ? _value.deliveryOption
          : deliveryOption // ignore: cast_nullable_to_non_nullable
              as DeliveryOption,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      zpSubtotal: null == zpSubtotal
          ? _value.zpSubtotal
          : zpSubtotal // ignore: cast_nullable_to_non_nullable
              as double,
      mpSubtotal: null == mpSubtotal
          ? _value.mpSubtotal
          : mpSubtotal // ignore: cast_nullable_to_non_nullable
              as double,
      subTotal: null == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double,
      showErrorMessage: null == showErrorMessage
          ? _value.showErrorMessage
          : showErrorMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      urgentDeliveryOption: null == urgentDeliveryOption
          ? _value.urgentDeliveryOption
          : urgentDeliveryOption // ignore: cast_nullable_to_non_nullable
              as UrgentDeliveryTimePickerOption,
      selectedRequestDeliveryDate: null == selectedRequestDeliveryDate
          ? _value.selectedRequestDeliveryDate
          : selectedRequestDeliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
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
  $SalesOrganisationCopyWith<$Res> get salesOrg {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrg, (value) {
      return _then(_value.copyWith(salesOrg: value) as $Val);
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
  $ShipToInfoCopyWith<$Res> get shipInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipInfo, (value) {
      return _then(_value.copyWith(shipInfo: value) as $Val);
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
abstract class _$$OrderEligibilityStateImplCopyWith<$Res>
    implements $OrderEligibilityStateCopyWith<$Res> {
  factory _$$OrderEligibilityStateImplCopyWith(
          _$OrderEligibilityStateImpl value,
          $Res Function(_$OrderEligibilityStateImpl) then) =
      __$$OrderEligibilityStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PriceAggregate> cartItems,
      SalesOrganisationConfigs configs,
      SalesOrganisation salesOrg,
      double grandTotal,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipInfo,
      DeliveryOption deliveryOption,
      User user,
      double zpSubtotal,
      double mpSubtotal,
      double subTotal,
      bool showErrorMessage,
      UrgentDeliveryTimePickerOption urgentDeliveryOption,
      String selectedRequestDeliveryDate});

  @override
  $SalesOrganisationConfigsCopyWith<$Res> get configs;
  @override
  $SalesOrganisationCopyWith<$Res> get salesOrg;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $ShipToInfoCopyWith<$Res> get shipInfo;
  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$OrderEligibilityStateImplCopyWithImpl<$Res>
    extends _$OrderEligibilityStateCopyWithImpl<$Res,
        _$OrderEligibilityStateImpl>
    implements _$$OrderEligibilityStateImplCopyWith<$Res> {
  __$$OrderEligibilityStateImplCopyWithImpl(_$OrderEligibilityStateImpl _value,
      $Res Function(_$OrderEligibilityStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItems = null,
    Object? configs = null,
    Object? salesOrg = null,
    Object? grandTotal = null,
    Object? customerCodeInfo = null,
    Object? shipInfo = null,
    Object? deliveryOption = null,
    Object? user = null,
    Object? zpSubtotal = null,
    Object? mpSubtotal = null,
    Object? subTotal = null,
    Object? showErrorMessage = null,
    Object? urgentDeliveryOption = null,
    Object? selectedRequestDeliveryDate = null,
  }) {
    return _then(_$OrderEligibilityStateImpl(
      cartItems: null == cartItems
          ? _value._cartItems
          : cartItems // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
      configs: null == configs
          ? _value.configs
          : configs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      grandTotal: null == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipInfo: null == shipInfo
          ? _value.shipInfo
          : shipInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      deliveryOption: null == deliveryOption
          ? _value.deliveryOption
          : deliveryOption // ignore: cast_nullable_to_non_nullable
              as DeliveryOption,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      zpSubtotal: null == zpSubtotal
          ? _value.zpSubtotal
          : zpSubtotal // ignore: cast_nullable_to_non_nullable
              as double,
      mpSubtotal: null == mpSubtotal
          ? _value.mpSubtotal
          : mpSubtotal // ignore: cast_nullable_to_non_nullable
              as double,
      subTotal: null == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double,
      showErrorMessage: null == showErrorMessage
          ? _value.showErrorMessage
          : showErrorMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      urgentDeliveryOption: null == urgentDeliveryOption
          ? _value.urgentDeliveryOption
          : urgentDeliveryOption // ignore: cast_nullable_to_non_nullable
              as UrgentDeliveryTimePickerOption,
      selectedRequestDeliveryDate: null == selectedRequestDeliveryDate
          ? _value.selectedRequestDeliveryDate
          : selectedRequestDeliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OrderEligibilityStateImpl extends _OrderEligibilityState {
  const _$OrderEligibilityStateImpl(
      {required final List<PriceAggregate> cartItems,
      required this.configs,
      required this.salesOrg,
      required this.grandTotal,
      required this.customerCodeInfo,
      required this.shipInfo,
      required this.deliveryOption,
      required this.user,
      required this.zpSubtotal,
      required this.mpSubtotal,
      required this.subTotal,
      required this.showErrorMessage,
      required this.urgentDeliveryOption,
      required this.selectedRequestDeliveryDate})
      : _cartItems = cartItems,
        super._();

  final List<PriceAggregate> _cartItems;
  @override
  List<PriceAggregate> get cartItems {
    if (_cartItems is EqualUnmodifiableListView) return _cartItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartItems);
  }

  @override
  final SalesOrganisationConfigs configs;
  @override
  final SalesOrganisation salesOrg;
  @override
  final double grandTotal;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipInfo;
  @override
  final DeliveryOption deliveryOption;
  @override
  final User user;
  @override
  final double zpSubtotal;
  @override
  final double mpSubtotal;
  @override
  final double subTotal;
  @override
  final bool showErrorMessage;
  @override
  final UrgentDeliveryTimePickerOption urgentDeliveryOption;
  @override
  final String selectedRequestDeliveryDate;

  @override
  String toString() {
    return 'OrderEligibilityState(cartItems: $cartItems, configs: $configs, salesOrg: $salesOrg, grandTotal: $grandTotal, customerCodeInfo: $customerCodeInfo, shipInfo: $shipInfo, deliveryOption: $deliveryOption, user: $user, zpSubtotal: $zpSubtotal, mpSubtotal: $mpSubtotal, subTotal: $subTotal, showErrorMessage: $showErrorMessage, urgentDeliveryOption: $urgentDeliveryOption, selectedRequestDeliveryDate: $selectedRequestDeliveryDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderEligibilityStateImpl &&
            const DeepCollectionEquality()
                .equals(other._cartItems, _cartItems) &&
            (identical(other.configs, configs) || other.configs == configs) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipInfo, shipInfo) ||
                other.shipInfo == shipInfo) &&
            (identical(other.deliveryOption, deliveryOption) ||
                other.deliveryOption == deliveryOption) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.zpSubtotal, zpSubtotal) ||
                other.zpSubtotal == zpSubtotal) &&
            (identical(other.mpSubtotal, mpSubtotal) ||
                other.mpSubtotal == mpSubtotal) &&
            (identical(other.subTotal, subTotal) ||
                other.subTotal == subTotal) &&
            (identical(other.showErrorMessage, showErrorMessage) ||
                other.showErrorMessage == showErrorMessage) &&
            (identical(other.urgentDeliveryOption, urgentDeliveryOption) ||
                other.urgentDeliveryOption == urgentDeliveryOption) &&
            (identical(other.selectedRequestDeliveryDate,
                    selectedRequestDeliveryDate) ||
                other.selectedRequestDeliveryDate ==
                    selectedRequestDeliveryDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_cartItems),
      configs,
      salesOrg,
      grandTotal,
      customerCodeInfo,
      shipInfo,
      deliveryOption,
      user,
      zpSubtotal,
      mpSubtotal,
      subTotal,
      showErrorMessage,
      urgentDeliveryOption,
      selectedRequestDeliveryDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderEligibilityStateImplCopyWith<_$OrderEligibilityStateImpl>
      get copyWith => __$$OrderEligibilityStateImplCopyWithImpl<
          _$OrderEligibilityStateImpl>(this, _$identity);
}

abstract class _OrderEligibilityState extends OrderEligibilityState {
  const factory _OrderEligibilityState(
          {required final List<PriceAggregate> cartItems,
          required final SalesOrganisationConfigs configs,
          required final SalesOrganisation salesOrg,
          required final double grandTotal,
          required final CustomerCodeInfo customerCodeInfo,
          required final ShipToInfo shipInfo,
          required final DeliveryOption deliveryOption,
          required final User user,
          required final double zpSubtotal,
          required final double mpSubtotal,
          required final double subTotal,
          required final bool showErrorMessage,
          required final UrgentDeliveryTimePickerOption urgentDeliveryOption,
          required final String selectedRequestDeliveryDate}) =
      _$OrderEligibilityStateImpl;
  const _OrderEligibilityState._() : super._();

  @override
  List<PriceAggregate> get cartItems;
  @override
  SalesOrganisationConfigs get configs;
  @override
  SalesOrganisation get salesOrg;
  @override
  double get grandTotal;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  ShipToInfo get shipInfo;
  @override
  DeliveryOption get deliveryOption;
  @override
  User get user;
  @override
  double get zpSubtotal;
  @override
  double get mpSubtotal;
  @override
  double get subTotal;
  @override
  bool get showErrorMessage;
  @override
  UrgentDeliveryTimePickerOption get urgentDeliveryOption;
  @override
  String get selectedRequestDeliveryDate;
  @override
  @JsonKey(ignore: true)
  _$$OrderEligibilityStateImplCopyWith<_$OrderEligibilityStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eligibility_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EligibilityEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)
        update,
    required TResult Function() registerChatBot,
    required TResult Function(
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)
        selectedCustomerCode,
    required TResult Function(CustomerCodeConfig customerCodeConfig)
        updatedCustomerCodeConfig,
    required TResult Function() loadStoredCustomerCode,
    required TResult Function() fetchAndPreSelectCustomerCode,
    required TResult Function(bool isStockInfoNotAvailable)
        updateStockInfoAvailability,
    required TResult Function() watchStockApiStatus,
    required TResult Function() watchConnectivityStatus,
    required TResult Function(bool isNetworkAvailable)
        updateNetworkAvailability,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)?
        update,
    TResult? Function()? registerChatBot,
    TResult? Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        selectedCustomerCode,
    TResult? Function(CustomerCodeConfig customerCodeConfig)?
        updatedCustomerCodeConfig,
    TResult? Function()? loadStoredCustomerCode,
    TResult? Function()? fetchAndPreSelectCustomerCode,
    TResult? Function(bool isStockInfoNotAvailable)?
        updateStockInfoAvailability,
    TResult? Function()? watchStockApiStatus,
    TResult? Function()? watchConnectivityStatus,
    TResult? Function(bool isNetworkAvailable)? updateNetworkAvailability,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)?
        update,
    TResult Function()? registerChatBot,
    TResult Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        selectedCustomerCode,
    TResult Function(CustomerCodeConfig customerCodeConfig)?
        updatedCustomerCodeConfig,
    TResult Function()? loadStoredCustomerCode,
    TResult Function()? fetchAndPreSelectCustomerCode,
    TResult Function(bool isStockInfoNotAvailable)? updateStockInfoAvailability,
    TResult Function()? watchStockApiStatus,
    TResult Function()? watchConnectivityStatus,
    TResult Function(bool isNetworkAvailable)? updateNetworkAvailability,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Update value) update,
    required TResult Function(_RegisterChatBot value) registerChatBot,
    required TResult Function(_SelectedCustomerCode value) selectedCustomerCode,
    required TResult Function(_UpdatedCustomerCodeConfig value)
        updatedCustomerCodeConfig,
    required TResult Function(_LoadStoredCustomerCode value)
        loadStoredCustomerCode,
    required TResult Function(_FetchAndPreSelectCustomerCode value)
        fetchAndPreSelectCustomerCode,
    required TResult Function(_UpdateStockInfoAvailability value)
        updateStockInfoAvailability,
    required TResult Function(_WatchStockApiStatus value) watchStockApiStatus,
    required TResult Function(_WatchConnectivityStatus value)
        watchConnectivityStatus,
    required TResult Function(_UpdateNetworkAvailability value)
        updateNetworkAvailability,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Update value)? update,
    TResult? Function(_RegisterChatBot value)? registerChatBot,
    TResult? Function(_SelectedCustomerCode value)? selectedCustomerCode,
    TResult? Function(_UpdatedCustomerCodeConfig value)?
        updatedCustomerCodeConfig,
    TResult? Function(_LoadStoredCustomerCode value)? loadStoredCustomerCode,
    TResult? Function(_FetchAndPreSelectCustomerCode value)?
        fetchAndPreSelectCustomerCode,
    TResult? Function(_UpdateStockInfoAvailability value)?
        updateStockInfoAvailability,
    TResult? Function(_WatchStockApiStatus value)? watchStockApiStatus,
    TResult? Function(_WatchConnectivityStatus value)? watchConnectivityStatus,
    TResult? Function(_UpdateNetworkAvailability value)?
        updateNetworkAvailability,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Update value)? update,
    TResult Function(_RegisterChatBot value)? registerChatBot,
    TResult Function(_SelectedCustomerCode value)? selectedCustomerCode,
    TResult Function(_UpdatedCustomerCodeConfig value)?
        updatedCustomerCodeConfig,
    TResult Function(_LoadStoredCustomerCode value)? loadStoredCustomerCode,
    TResult Function(_FetchAndPreSelectCustomerCode value)?
        fetchAndPreSelectCustomerCode,
    TResult Function(_UpdateStockInfoAvailability value)?
        updateStockInfoAvailability,
    TResult Function(_WatchStockApiStatus value)? watchStockApiStatus,
    TResult Function(_WatchConnectivityStatus value)? watchConnectivityStatus,
    TResult Function(_UpdateNetworkAvailability value)?
        updateNetworkAvailability,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EligibilityEventCopyWith<$Res> {
  factory $EligibilityEventCopyWith(
          EligibilityEvent value, $Res Function(EligibilityEvent) then) =
      _$EligibilityEventCopyWithImpl<$Res, EligibilityEvent>;
}

/// @nodoc
class _$EligibilityEventCopyWithImpl<$Res, $Val extends EligibilityEvent>
    implements $EligibilityEventCopyWith<$Res> {
  _$EligibilityEventCopyWithImpl(this._value, this._then);

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
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$EligibilityEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl();

  @override
  String toString() {
    return 'EligibilityEvent.initialized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)
        update,
    required TResult Function() registerChatBot,
    required TResult Function(
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)
        selectedCustomerCode,
    required TResult Function(CustomerCodeConfig customerCodeConfig)
        updatedCustomerCodeConfig,
    required TResult Function() loadStoredCustomerCode,
    required TResult Function() fetchAndPreSelectCustomerCode,
    required TResult Function(bool isStockInfoNotAvailable)
        updateStockInfoAvailability,
    required TResult Function() watchStockApiStatus,
    required TResult Function() watchConnectivityStatus,
    required TResult Function(bool isNetworkAvailable)
        updateNetworkAvailability,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)?
        update,
    TResult? Function()? registerChatBot,
    TResult? Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        selectedCustomerCode,
    TResult? Function(CustomerCodeConfig customerCodeConfig)?
        updatedCustomerCodeConfig,
    TResult? Function()? loadStoredCustomerCode,
    TResult? Function()? fetchAndPreSelectCustomerCode,
    TResult? Function(bool isStockInfoNotAvailable)?
        updateStockInfoAvailability,
    TResult? Function()? watchStockApiStatus,
    TResult? Function()? watchConnectivityStatus,
    TResult? Function(bool isNetworkAvailable)? updateNetworkAvailability,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)?
        update,
    TResult Function()? registerChatBot,
    TResult Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        selectedCustomerCode,
    TResult Function(CustomerCodeConfig customerCodeConfig)?
        updatedCustomerCodeConfig,
    TResult Function()? loadStoredCustomerCode,
    TResult Function()? fetchAndPreSelectCustomerCode,
    TResult Function(bool isStockInfoNotAvailable)? updateStockInfoAvailability,
    TResult Function()? watchStockApiStatus,
    TResult Function()? watchConnectivityStatus,
    TResult Function(bool isNetworkAvailable)? updateNetworkAvailability,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Update value) update,
    required TResult Function(_RegisterChatBot value) registerChatBot,
    required TResult Function(_SelectedCustomerCode value) selectedCustomerCode,
    required TResult Function(_UpdatedCustomerCodeConfig value)
        updatedCustomerCodeConfig,
    required TResult Function(_LoadStoredCustomerCode value)
        loadStoredCustomerCode,
    required TResult Function(_FetchAndPreSelectCustomerCode value)
        fetchAndPreSelectCustomerCode,
    required TResult Function(_UpdateStockInfoAvailability value)
        updateStockInfoAvailability,
    required TResult Function(_WatchStockApiStatus value) watchStockApiStatus,
    required TResult Function(_WatchConnectivityStatus value)
        watchConnectivityStatus,
    required TResult Function(_UpdateNetworkAvailability value)
        updateNetworkAvailability,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Update value)? update,
    TResult? Function(_RegisterChatBot value)? registerChatBot,
    TResult? Function(_SelectedCustomerCode value)? selectedCustomerCode,
    TResult? Function(_UpdatedCustomerCodeConfig value)?
        updatedCustomerCodeConfig,
    TResult? Function(_LoadStoredCustomerCode value)? loadStoredCustomerCode,
    TResult? Function(_FetchAndPreSelectCustomerCode value)?
        fetchAndPreSelectCustomerCode,
    TResult? Function(_UpdateStockInfoAvailability value)?
        updateStockInfoAvailability,
    TResult? Function(_WatchStockApiStatus value)? watchStockApiStatus,
    TResult? Function(_WatchConnectivityStatus value)? watchConnectivityStatus,
    TResult? Function(_UpdateNetworkAvailability value)?
        updateNetworkAvailability,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Update value)? update,
    TResult Function(_RegisterChatBot value)? registerChatBot,
    TResult Function(_SelectedCustomerCode value)? selectedCustomerCode,
    TResult Function(_UpdatedCustomerCodeConfig value)?
        updatedCustomerCodeConfig,
    TResult Function(_LoadStoredCustomerCode value)? loadStoredCustomerCode,
    TResult Function(_FetchAndPreSelectCustomerCode value)?
        fetchAndPreSelectCustomerCode,
    TResult Function(_UpdateStockInfoAvailability value)?
        updateStockInfoAvailability,
    TResult Function(_WatchStockApiStatus value)? watchStockApiStatus,
    TResult Function(_WatchConnectivityStatus value)? watchConnectivityStatus,
    TResult Function(_UpdateNetworkAvailability value)?
        updateNetworkAvailability,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements EligibilityEvent {
  const factory _Initialized() = _$InitializedImpl;
}

/// @nodoc
abstract class _$$UpdateImplCopyWith<$Res> {
  factory _$$UpdateImplCopyWith(
          _$UpdateImpl value, $Res Function(_$UpdateImpl) then) =
      __$$UpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {User user,
      SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs salesOrgConfigs});

  $UserCopyWith<$Res> get user;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs;
}

/// @nodoc
class __$$UpdateImplCopyWithImpl<$Res>
    extends _$EligibilityEventCopyWithImpl<$Res, _$UpdateImpl>
    implements _$$UpdateImplCopyWith<$Res> {
  __$$UpdateImplCopyWithImpl(
      _$UpdateImpl _value, $Res Function(_$UpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? salesOrganisation = null,
    Object? salesOrgConfigs = null,
  }) {
    return _then(_$UpdateImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      salesOrgConfigs: null == salesOrgConfigs
          ? _value.salesOrgConfigs
          : salesOrgConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
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
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.salesOrgConfigs,
        (value) {
      return _then(_value.copyWith(salesOrgConfigs: value));
    });
  }
}

/// @nodoc

class _$UpdateImpl implements _Update {
  const _$UpdateImpl(
      {required this.user,
      required this.salesOrganisation,
      required this.salesOrgConfigs});

  @override
  final User user;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final SalesOrganisationConfigs salesOrgConfigs;

  @override
  String toString() {
    return 'EligibilityEvent.update(user: $user, salesOrganisation: $salesOrganisation, salesOrgConfigs: $salesOrgConfigs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.salesOrgConfigs, salesOrgConfigs) ||
                other.salesOrgConfigs == salesOrgConfigs));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, user, salesOrganisation, salesOrgConfigs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
      __$$UpdateImplCopyWithImpl<_$UpdateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)
        update,
    required TResult Function() registerChatBot,
    required TResult Function(
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)
        selectedCustomerCode,
    required TResult Function(CustomerCodeConfig customerCodeConfig)
        updatedCustomerCodeConfig,
    required TResult Function() loadStoredCustomerCode,
    required TResult Function() fetchAndPreSelectCustomerCode,
    required TResult Function(bool isStockInfoNotAvailable)
        updateStockInfoAvailability,
    required TResult Function() watchStockApiStatus,
    required TResult Function() watchConnectivityStatus,
    required TResult Function(bool isNetworkAvailable)
        updateNetworkAvailability,
  }) {
    return update(user, salesOrganisation, salesOrgConfigs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)?
        update,
    TResult? Function()? registerChatBot,
    TResult? Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        selectedCustomerCode,
    TResult? Function(CustomerCodeConfig customerCodeConfig)?
        updatedCustomerCodeConfig,
    TResult? Function()? loadStoredCustomerCode,
    TResult? Function()? fetchAndPreSelectCustomerCode,
    TResult? Function(bool isStockInfoNotAvailable)?
        updateStockInfoAvailability,
    TResult? Function()? watchStockApiStatus,
    TResult? Function()? watchConnectivityStatus,
    TResult? Function(bool isNetworkAvailable)? updateNetworkAvailability,
  }) {
    return update?.call(user, salesOrganisation, salesOrgConfigs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)?
        update,
    TResult Function()? registerChatBot,
    TResult Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        selectedCustomerCode,
    TResult Function(CustomerCodeConfig customerCodeConfig)?
        updatedCustomerCodeConfig,
    TResult Function()? loadStoredCustomerCode,
    TResult Function()? fetchAndPreSelectCustomerCode,
    TResult Function(bool isStockInfoNotAvailable)? updateStockInfoAvailability,
    TResult Function()? watchStockApiStatus,
    TResult Function()? watchConnectivityStatus,
    TResult Function(bool isNetworkAvailable)? updateNetworkAvailability,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(user, salesOrganisation, salesOrgConfigs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Update value) update,
    required TResult Function(_RegisterChatBot value) registerChatBot,
    required TResult Function(_SelectedCustomerCode value) selectedCustomerCode,
    required TResult Function(_UpdatedCustomerCodeConfig value)
        updatedCustomerCodeConfig,
    required TResult Function(_LoadStoredCustomerCode value)
        loadStoredCustomerCode,
    required TResult Function(_FetchAndPreSelectCustomerCode value)
        fetchAndPreSelectCustomerCode,
    required TResult Function(_UpdateStockInfoAvailability value)
        updateStockInfoAvailability,
    required TResult Function(_WatchStockApiStatus value) watchStockApiStatus,
    required TResult Function(_WatchConnectivityStatus value)
        watchConnectivityStatus,
    required TResult Function(_UpdateNetworkAvailability value)
        updateNetworkAvailability,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Update value)? update,
    TResult? Function(_RegisterChatBot value)? registerChatBot,
    TResult? Function(_SelectedCustomerCode value)? selectedCustomerCode,
    TResult? Function(_UpdatedCustomerCodeConfig value)?
        updatedCustomerCodeConfig,
    TResult? Function(_LoadStoredCustomerCode value)? loadStoredCustomerCode,
    TResult? Function(_FetchAndPreSelectCustomerCode value)?
        fetchAndPreSelectCustomerCode,
    TResult? Function(_UpdateStockInfoAvailability value)?
        updateStockInfoAvailability,
    TResult? Function(_WatchStockApiStatus value)? watchStockApiStatus,
    TResult? Function(_WatchConnectivityStatus value)? watchConnectivityStatus,
    TResult? Function(_UpdateNetworkAvailability value)?
        updateNetworkAvailability,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Update value)? update,
    TResult Function(_RegisterChatBot value)? registerChatBot,
    TResult Function(_SelectedCustomerCode value)? selectedCustomerCode,
    TResult Function(_UpdatedCustomerCodeConfig value)?
        updatedCustomerCodeConfig,
    TResult Function(_LoadStoredCustomerCode value)? loadStoredCustomerCode,
    TResult Function(_FetchAndPreSelectCustomerCode value)?
        fetchAndPreSelectCustomerCode,
    TResult Function(_UpdateStockInfoAvailability value)?
        updateStockInfoAvailability,
    TResult Function(_WatchStockApiStatus value)? watchStockApiStatus,
    TResult Function(_WatchConnectivityStatus value)? watchConnectivityStatus,
    TResult Function(_UpdateNetworkAvailability value)?
        updateNetworkAvailability,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _Update implements EligibilityEvent {
  const factory _Update(
      {required final User user,
      required final SalesOrganisation salesOrganisation,
      required final SalesOrganisationConfigs salesOrgConfigs}) = _$UpdateImpl;

  User get user;
  SalesOrganisation get salesOrganisation;
  SalesOrganisationConfigs get salesOrgConfigs;
  @JsonKey(ignore: true)
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterChatBotImplCopyWith<$Res> {
  factory _$$RegisterChatBotImplCopyWith(_$RegisterChatBotImpl value,
          $Res Function(_$RegisterChatBotImpl) then) =
      __$$RegisterChatBotImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterChatBotImplCopyWithImpl<$Res>
    extends _$EligibilityEventCopyWithImpl<$Res, _$RegisterChatBotImpl>
    implements _$$RegisterChatBotImplCopyWith<$Res> {
  __$$RegisterChatBotImplCopyWithImpl(
      _$RegisterChatBotImpl _value, $Res Function(_$RegisterChatBotImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegisterChatBotImpl implements _RegisterChatBot {
  const _$RegisterChatBotImpl();

  @override
  String toString() {
    return 'EligibilityEvent.registerChatBot()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RegisterChatBotImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)
        update,
    required TResult Function() registerChatBot,
    required TResult Function(
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)
        selectedCustomerCode,
    required TResult Function(CustomerCodeConfig customerCodeConfig)
        updatedCustomerCodeConfig,
    required TResult Function() loadStoredCustomerCode,
    required TResult Function() fetchAndPreSelectCustomerCode,
    required TResult Function(bool isStockInfoNotAvailable)
        updateStockInfoAvailability,
    required TResult Function() watchStockApiStatus,
    required TResult Function() watchConnectivityStatus,
    required TResult Function(bool isNetworkAvailable)
        updateNetworkAvailability,
  }) {
    return registerChatBot();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)?
        update,
    TResult? Function()? registerChatBot,
    TResult? Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        selectedCustomerCode,
    TResult? Function(CustomerCodeConfig customerCodeConfig)?
        updatedCustomerCodeConfig,
    TResult? Function()? loadStoredCustomerCode,
    TResult? Function()? fetchAndPreSelectCustomerCode,
    TResult? Function(bool isStockInfoNotAvailable)?
        updateStockInfoAvailability,
    TResult? Function()? watchStockApiStatus,
    TResult? Function()? watchConnectivityStatus,
    TResult? Function(bool isNetworkAvailable)? updateNetworkAvailability,
  }) {
    return registerChatBot?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)?
        update,
    TResult Function()? registerChatBot,
    TResult Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        selectedCustomerCode,
    TResult Function(CustomerCodeConfig customerCodeConfig)?
        updatedCustomerCodeConfig,
    TResult Function()? loadStoredCustomerCode,
    TResult Function()? fetchAndPreSelectCustomerCode,
    TResult Function(bool isStockInfoNotAvailable)? updateStockInfoAvailability,
    TResult Function()? watchStockApiStatus,
    TResult Function()? watchConnectivityStatus,
    TResult Function(bool isNetworkAvailable)? updateNetworkAvailability,
    required TResult orElse(),
  }) {
    if (registerChatBot != null) {
      return registerChatBot();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Update value) update,
    required TResult Function(_RegisterChatBot value) registerChatBot,
    required TResult Function(_SelectedCustomerCode value) selectedCustomerCode,
    required TResult Function(_UpdatedCustomerCodeConfig value)
        updatedCustomerCodeConfig,
    required TResult Function(_LoadStoredCustomerCode value)
        loadStoredCustomerCode,
    required TResult Function(_FetchAndPreSelectCustomerCode value)
        fetchAndPreSelectCustomerCode,
    required TResult Function(_UpdateStockInfoAvailability value)
        updateStockInfoAvailability,
    required TResult Function(_WatchStockApiStatus value) watchStockApiStatus,
    required TResult Function(_WatchConnectivityStatus value)
        watchConnectivityStatus,
    required TResult Function(_UpdateNetworkAvailability value)
        updateNetworkAvailability,
  }) {
    return registerChatBot(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Update value)? update,
    TResult? Function(_RegisterChatBot value)? registerChatBot,
    TResult? Function(_SelectedCustomerCode value)? selectedCustomerCode,
    TResult? Function(_UpdatedCustomerCodeConfig value)?
        updatedCustomerCodeConfig,
    TResult? Function(_LoadStoredCustomerCode value)? loadStoredCustomerCode,
    TResult? Function(_FetchAndPreSelectCustomerCode value)?
        fetchAndPreSelectCustomerCode,
    TResult? Function(_UpdateStockInfoAvailability value)?
        updateStockInfoAvailability,
    TResult? Function(_WatchStockApiStatus value)? watchStockApiStatus,
    TResult? Function(_WatchConnectivityStatus value)? watchConnectivityStatus,
    TResult? Function(_UpdateNetworkAvailability value)?
        updateNetworkAvailability,
  }) {
    return registerChatBot?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Update value)? update,
    TResult Function(_RegisterChatBot value)? registerChatBot,
    TResult Function(_SelectedCustomerCode value)? selectedCustomerCode,
    TResult Function(_UpdatedCustomerCodeConfig value)?
        updatedCustomerCodeConfig,
    TResult Function(_LoadStoredCustomerCode value)? loadStoredCustomerCode,
    TResult Function(_FetchAndPreSelectCustomerCode value)?
        fetchAndPreSelectCustomerCode,
    TResult Function(_UpdateStockInfoAvailability value)?
        updateStockInfoAvailability,
    TResult Function(_WatchStockApiStatus value)? watchStockApiStatus,
    TResult Function(_WatchConnectivityStatus value)? watchConnectivityStatus,
    TResult Function(_UpdateNetworkAvailability value)?
        updateNetworkAvailability,
    required TResult orElse(),
  }) {
    if (registerChatBot != null) {
      return registerChatBot(this);
    }
    return orElse();
  }
}

abstract class _RegisterChatBot implements EligibilityEvent {
  const factory _RegisterChatBot() = _$RegisterChatBotImpl;
}

/// @nodoc
abstract class _$$SelectedCustomerCodeImplCopyWith<$Res> {
  factory _$$SelectedCustomerCodeImplCopyWith(_$SelectedCustomerCodeImpl value,
          $Res Function(_$SelectedCustomerCodeImpl) then) =
      __$$SelectedCustomerCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo});

  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$SelectedCustomerCodeImplCopyWithImpl<$Res>
    extends _$EligibilityEventCopyWithImpl<$Res, _$SelectedCustomerCodeImpl>
    implements _$$SelectedCustomerCodeImplCopyWith<$Res> {
  __$$SelectedCustomerCodeImplCopyWithImpl(_$SelectedCustomerCodeImpl _value,
      $Res Function(_$SelectedCustomerCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
  }) {
    return _then(_$SelectedCustomerCodeImpl(
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
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
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value));
    });
  }
}

/// @nodoc

class _$SelectedCustomerCodeImpl implements _SelectedCustomerCode {
  const _$SelectedCustomerCodeImpl(
      {required this.customerCodeInfo, required this.shipToInfo});

  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;

  @override
  String toString() {
    return 'EligibilityEvent.selectedCustomerCode(customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedCustomerCodeImpl &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerCodeInfo, shipToInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedCustomerCodeImplCopyWith<_$SelectedCustomerCodeImpl>
      get copyWith =>
          __$$SelectedCustomerCodeImplCopyWithImpl<_$SelectedCustomerCodeImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)
        update,
    required TResult Function() registerChatBot,
    required TResult Function(
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)
        selectedCustomerCode,
    required TResult Function(CustomerCodeConfig customerCodeConfig)
        updatedCustomerCodeConfig,
    required TResult Function() loadStoredCustomerCode,
    required TResult Function() fetchAndPreSelectCustomerCode,
    required TResult Function(bool isStockInfoNotAvailable)
        updateStockInfoAvailability,
    required TResult Function() watchStockApiStatus,
    required TResult Function() watchConnectivityStatus,
    required TResult Function(bool isNetworkAvailable)
        updateNetworkAvailability,
  }) {
    return selectedCustomerCode(customerCodeInfo, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)?
        update,
    TResult? Function()? registerChatBot,
    TResult? Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        selectedCustomerCode,
    TResult? Function(CustomerCodeConfig customerCodeConfig)?
        updatedCustomerCodeConfig,
    TResult? Function()? loadStoredCustomerCode,
    TResult? Function()? fetchAndPreSelectCustomerCode,
    TResult? Function(bool isStockInfoNotAvailable)?
        updateStockInfoAvailability,
    TResult? Function()? watchStockApiStatus,
    TResult? Function()? watchConnectivityStatus,
    TResult? Function(bool isNetworkAvailable)? updateNetworkAvailability,
  }) {
    return selectedCustomerCode?.call(customerCodeInfo, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)?
        update,
    TResult Function()? registerChatBot,
    TResult Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        selectedCustomerCode,
    TResult Function(CustomerCodeConfig customerCodeConfig)?
        updatedCustomerCodeConfig,
    TResult Function()? loadStoredCustomerCode,
    TResult Function()? fetchAndPreSelectCustomerCode,
    TResult Function(bool isStockInfoNotAvailable)? updateStockInfoAvailability,
    TResult Function()? watchStockApiStatus,
    TResult Function()? watchConnectivityStatus,
    TResult Function(bool isNetworkAvailable)? updateNetworkAvailability,
    required TResult orElse(),
  }) {
    if (selectedCustomerCode != null) {
      return selectedCustomerCode(customerCodeInfo, shipToInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Update value) update,
    required TResult Function(_RegisterChatBot value) registerChatBot,
    required TResult Function(_SelectedCustomerCode value) selectedCustomerCode,
    required TResult Function(_UpdatedCustomerCodeConfig value)
        updatedCustomerCodeConfig,
    required TResult Function(_LoadStoredCustomerCode value)
        loadStoredCustomerCode,
    required TResult Function(_FetchAndPreSelectCustomerCode value)
        fetchAndPreSelectCustomerCode,
    required TResult Function(_UpdateStockInfoAvailability value)
        updateStockInfoAvailability,
    required TResult Function(_WatchStockApiStatus value) watchStockApiStatus,
    required TResult Function(_WatchConnectivityStatus value)
        watchConnectivityStatus,
    required TResult Function(_UpdateNetworkAvailability value)
        updateNetworkAvailability,
  }) {
    return selectedCustomerCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Update value)? update,
    TResult? Function(_RegisterChatBot value)? registerChatBot,
    TResult? Function(_SelectedCustomerCode value)? selectedCustomerCode,
    TResult? Function(_UpdatedCustomerCodeConfig value)?
        updatedCustomerCodeConfig,
    TResult? Function(_LoadStoredCustomerCode value)? loadStoredCustomerCode,
    TResult? Function(_FetchAndPreSelectCustomerCode value)?
        fetchAndPreSelectCustomerCode,
    TResult? Function(_UpdateStockInfoAvailability value)?
        updateStockInfoAvailability,
    TResult? Function(_WatchStockApiStatus value)? watchStockApiStatus,
    TResult? Function(_WatchConnectivityStatus value)? watchConnectivityStatus,
    TResult? Function(_UpdateNetworkAvailability value)?
        updateNetworkAvailability,
  }) {
    return selectedCustomerCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Update value)? update,
    TResult Function(_RegisterChatBot value)? registerChatBot,
    TResult Function(_SelectedCustomerCode value)? selectedCustomerCode,
    TResult Function(_UpdatedCustomerCodeConfig value)?
        updatedCustomerCodeConfig,
    TResult Function(_LoadStoredCustomerCode value)? loadStoredCustomerCode,
    TResult Function(_FetchAndPreSelectCustomerCode value)?
        fetchAndPreSelectCustomerCode,
    TResult Function(_UpdateStockInfoAvailability value)?
        updateStockInfoAvailability,
    TResult Function(_WatchStockApiStatus value)? watchStockApiStatus,
    TResult Function(_WatchConnectivityStatus value)? watchConnectivityStatus,
    TResult Function(_UpdateNetworkAvailability value)?
        updateNetworkAvailability,
    required TResult orElse(),
  }) {
    if (selectedCustomerCode != null) {
      return selectedCustomerCode(this);
    }
    return orElse();
  }
}

abstract class _SelectedCustomerCode implements EligibilityEvent {
  const factory _SelectedCustomerCode(
      {required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo}) = _$SelectedCustomerCodeImpl;

  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  @JsonKey(ignore: true)
  _$$SelectedCustomerCodeImplCopyWith<_$SelectedCustomerCodeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatedCustomerCodeConfigImplCopyWith<$Res> {
  factory _$$UpdatedCustomerCodeConfigImplCopyWith(
          _$UpdatedCustomerCodeConfigImpl value,
          $Res Function(_$UpdatedCustomerCodeConfigImpl) then) =
      __$$UpdatedCustomerCodeConfigImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CustomerCodeConfig customerCodeConfig});

  $CustomerCodeConfigCopyWith<$Res> get customerCodeConfig;
}

/// @nodoc
class __$$UpdatedCustomerCodeConfigImplCopyWithImpl<$Res>
    extends _$EligibilityEventCopyWithImpl<$Res,
        _$UpdatedCustomerCodeConfigImpl>
    implements _$$UpdatedCustomerCodeConfigImplCopyWith<$Res> {
  __$$UpdatedCustomerCodeConfigImplCopyWithImpl(
      _$UpdatedCustomerCodeConfigImpl _value,
      $Res Function(_$UpdatedCustomerCodeConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeConfig = null,
  }) {
    return _then(_$UpdatedCustomerCodeConfigImpl(
      customerCodeConfig: null == customerCodeConfig
          ? _value.customerCodeConfig
          : customerCodeConfig // ignore: cast_nullable_to_non_nullable
              as CustomerCodeConfig,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerCodeConfigCopyWith<$Res> get customerCodeConfig {
    return $CustomerCodeConfigCopyWith<$Res>(_value.customerCodeConfig,
        (value) {
      return _then(_value.copyWith(customerCodeConfig: value));
    });
  }
}

/// @nodoc

class _$UpdatedCustomerCodeConfigImpl implements _UpdatedCustomerCodeConfig {
  const _$UpdatedCustomerCodeConfigImpl({required this.customerCodeConfig});

  @override
  final CustomerCodeConfig customerCodeConfig;

  @override
  String toString() {
    return 'EligibilityEvent.updatedCustomerCodeConfig(customerCodeConfig: $customerCodeConfig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatedCustomerCodeConfigImpl &&
            (identical(other.customerCodeConfig, customerCodeConfig) ||
                other.customerCodeConfig == customerCodeConfig));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerCodeConfig);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatedCustomerCodeConfigImplCopyWith<_$UpdatedCustomerCodeConfigImpl>
      get copyWith => __$$UpdatedCustomerCodeConfigImplCopyWithImpl<
          _$UpdatedCustomerCodeConfigImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)
        update,
    required TResult Function() registerChatBot,
    required TResult Function(
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)
        selectedCustomerCode,
    required TResult Function(CustomerCodeConfig customerCodeConfig)
        updatedCustomerCodeConfig,
    required TResult Function() loadStoredCustomerCode,
    required TResult Function() fetchAndPreSelectCustomerCode,
    required TResult Function(bool isStockInfoNotAvailable)
        updateStockInfoAvailability,
    required TResult Function() watchStockApiStatus,
    required TResult Function() watchConnectivityStatus,
    required TResult Function(bool isNetworkAvailable)
        updateNetworkAvailability,
  }) {
    return updatedCustomerCodeConfig(customerCodeConfig);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)?
        update,
    TResult? Function()? registerChatBot,
    TResult? Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        selectedCustomerCode,
    TResult? Function(CustomerCodeConfig customerCodeConfig)?
        updatedCustomerCodeConfig,
    TResult? Function()? loadStoredCustomerCode,
    TResult? Function()? fetchAndPreSelectCustomerCode,
    TResult? Function(bool isStockInfoNotAvailable)?
        updateStockInfoAvailability,
    TResult? Function()? watchStockApiStatus,
    TResult? Function()? watchConnectivityStatus,
    TResult? Function(bool isNetworkAvailable)? updateNetworkAvailability,
  }) {
    return updatedCustomerCodeConfig?.call(customerCodeConfig);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)?
        update,
    TResult Function()? registerChatBot,
    TResult Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        selectedCustomerCode,
    TResult Function(CustomerCodeConfig customerCodeConfig)?
        updatedCustomerCodeConfig,
    TResult Function()? loadStoredCustomerCode,
    TResult Function()? fetchAndPreSelectCustomerCode,
    TResult Function(bool isStockInfoNotAvailable)? updateStockInfoAvailability,
    TResult Function()? watchStockApiStatus,
    TResult Function()? watchConnectivityStatus,
    TResult Function(bool isNetworkAvailable)? updateNetworkAvailability,
    required TResult orElse(),
  }) {
    if (updatedCustomerCodeConfig != null) {
      return updatedCustomerCodeConfig(customerCodeConfig);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Update value) update,
    required TResult Function(_RegisterChatBot value) registerChatBot,
    required TResult Function(_SelectedCustomerCode value) selectedCustomerCode,
    required TResult Function(_UpdatedCustomerCodeConfig value)
        updatedCustomerCodeConfig,
    required TResult Function(_LoadStoredCustomerCode value)
        loadStoredCustomerCode,
    required TResult Function(_FetchAndPreSelectCustomerCode value)
        fetchAndPreSelectCustomerCode,
    required TResult Function(_UpdateStockInfoAvailability value)
        updateStockInfoAvailability,
    required TResult Function(_WatchStockApiStatus value) watchStockApiStatus,
    required TResult Function(_WatchConnectivityStatus value)
        watchConnectivityStatus,
    required TResult Function(_UpdateNetworkAvailability value)
        updateNetworkAvailability,
  }) {
    return updatedCustomerCodeConfig(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Update value)? update,
    TResult? Function(_RegisterChatBot value)? registerChatBot,
    TResult? Function(_SelectedCustomerCode value)? selectedCustomerCode,
    TResult? Function(_UpdatedCustomerCodeConfig value)?
        updatedCustomerCodeConfig,
    TResult? Function(_LoadStoredCustomerCode value)? loadStoredCustomerCode,
    TResult? Function(_FetchAndPreSelectCustomerCode value)?
        fetchAndPreSelectCustomerCode,
    TResult? Function(_UpdateStockInfoAvailability value)?
        updateStockInfoAvailability,
    TResult? Function(_WatchStockApiStatus value)? watchStockApiStatus,
    TResult? Function(_WatchConnectivityStatus value)? watchConnectivityStatus,
    TResult? Function(_UpdateNetworkAvailability value)?
        updateNetworkAvailability,
  }) {
    return updatedCustomerCodeConfig?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Update value)? update,
    TResult Function(_RegisterChatBot value)? registerChatBot,
    TResult Function(_SelectedCustomerCode value)? selectedCustomerCode,
    TResult Function(_UpdatedCustomerCodeConfig value)?
        updatedCustomerCodeConfig,
    TResult Function(_LoadStoredCustomerCode value)? loadStoredCustomerCode,
    TResult Function(_FetchAndPreSelectCustomerCode value)?
        fetchAndPreSelectCustomerCode,
    TResult Function(_UpdateStockInfoAvailability value)?
        updateStockInfoAvailability,
    TResult Function(_WatchStockApiStatus value)? watchStockApiStatus,
    TResult Function(_WatchConnectivityStatus value)? watchConnectivityStatus,
    TResult Function(_UpdateNetworkAvailability value)?
        updateNetworkAvailability,
    required TResult orElse(),
  }) {
    if (updatedCustomerCodeConfig != null) {
      return updatedCustomerCodeConfig(this);
    }
    return orElse();
  }
}

abstract class _UpdatedCustomerCodeConfig implements EligibilityEvent {
  const factory _UpdatedCustomerCodeConfig(
          {required final CustomerCodeConfig customerCodeConfig}) =
      _$UpdatedCustomerCodeConfigImpl;

  CustomerCodeConfig get customerCodeConfig;
  @JsonKey(ignore: true)
  _$$UpdatedCustomerCodeConfigImplCopyWith<_$UpdatedCustomerCodeConfigImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadStoredCustomerCodeImplCopyWith<$Res> {
  factory _$$LoadStoredCustomerCodeImplCopyWith(
          _$LoadStoredCustomerCodeImpl value,
          $Res Function(_$LoadStoredCustomerCodeImpl) then) =
      __$$LoadStoredCustomerCodeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadStoredCustomerCodeImplCopyWithImpl<$Res>
    extends _$EligibilityEventCopyWithImpl<$Res, _$LoadStoredCustomerCodeImpl>
    implements _$$LoadStoredCustomerCodeImplCopyWith<$Res> {
  __$$LoadStoredCustomerCodeImplCopyWithImpl(
      _$LoadStoredCustomerCodeImpl _value,
      $Res Function(_$LoadStoredCustomerCodeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadStoredCustomerCodeImpl implements _LoadStoredCustomerCode {
  const _$LoadStoredCustomerCodeImpl();

  @override
  String toString() {
    return 'EligibilityEvent.loadStoredCustomerCode()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadStoredCustomerCodeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)
        update,
    required TResult Function() registerChatBot,
    required TResult Function(
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)
        selectedCustomerCode,
    required TResult Function(CustomerCodeConfig customerCodeConfig)
        updatedCustomerCodeConfig,
    required TResult Function() loadStoredCustomerCode,
    required TResult Function() fetchAndPreSelectCustomerCode,
    required TResult Function(bool isStockInfoNotAvailable)
        updateStockInfoAvailability,
    required TResult Function() watchStockApiStatus,
    required TResult Function() watchConnectivityStatus,
    required TResult Function(bool isNetworkAvailable)
        updateNetworkAvailability,
  }) {
    return loadStoredCustomerCode();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)?
        update,
    TResult? Function()? registerChatBot,
    TResult? Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        selectedCustomerCode,
    TResult? Function(CustomerCodeConfig customerCodeConfig)?
        updatedCustomerCodeConfig,
    TResult? Function()? loadStoredCustomerCode,
    TResult? Function()? fetchAndPreSelectCustomerCode,
    TResult? Function(bool isStockInfoNotAvailable)?
        updateStockInfoAvailability,
    TResult? Function()? watchStockApiStatus,
    TResult? Function()? watchConnectivityStatus,
    TResult? Function(bool isNetworkAvailable)? updateNetworkAvailability,
  }) {
    return loadStoredCustomerCode?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)?
        update,
    TResult Function()? registerChatBot,
    TResult Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        selectedCustomerCode,
    TResult Function(CustomerCodeConfig customerCodeConfig)?
        updatedCustomerCodeConfig,
    TResult Function()? loadStoredCustomerCode,
    TResult Function()? fetchAndPreSelectCustomerCode,
    TResult Function(bool isStockInfoNotAvailable)? updateStockInfoAvailability,
    TResult Function()? watchStockApiStatus,
    TResult Function()? watchConnectivityStatus,
    TResult Function(bool isNetworkAvailable)? updateNetworkAvailability,
    required TResult orElse(),
  }) {
    if (loadStoredCustomerCode != null) {
      return loadStoredCustomerCode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Update value) update,
    required TResult Function(_RegisterChatBot value) registerChatBot,
    required TResult Function(_SelectedCustomerCode value) selectedCustomerCode,
    required TResult Function(_UpdatedCustomerCodeConfig value)
        updatedCustomerCodeConfig,
    required TResult Function(_LoadStoredCustomerCode value)
        loadStoredCustomerCode,
    required TResult Function(_FetchAndPreSelectCustomerCode value)
        fetchAndPreSelectCustomerCode,
    required TResult Function(_UpdateStockInfoAvailability value)
        updateStockInfoAvailability,
    required TResult Function(_WatchStockApiStatus value) watchStockApiStatus,
    required TResult Function(_WatchConnectivityStatus value)
        watchConnectivityStatus,
    required TResult Function(_UpdateNetworkAvailability value)
        updateNetworkAvailability,
  }) {
    return loadStoredCustomerCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Update value)? update,
    TResult? Function(_RegisterChatBot value)? registerChatBot,
    TResult? Function(_SelectedCustomerCode value)? selectedCustomerCode,
    TResult? Function(_UpdatedCustomerCodeConfig value)?
        updatedCustomerCodeConfig,
    TResult? Function(_LoadStoredCustomerCode value)? loadStoredCustomerCode,
    TResult? Function(_FetchAndPreSelectCustomerCode value)?
        fetchAndPreSelectCustomerCode,
    TResult? Function(_UpdateStockInfoAvailability value)?
        updateStockInfoAvailability,
    TResult? Function(_WatchStockApiStatus value)? watchStockApiStatus,
    TResult? Function(_WatchConnectivityStatus value)? watchConnectivityStatus,
    TResult? Function(_UpdateNetworkAvailability value)?
        updateNetworkAvailability,
  }) {
    return loadStoredCustomerCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Update value)? update,
    TResult Function(_RegisterChatBot value)? registerChatBot,
    TResult Function(_SelectedCustomerCode value)? selectedCustomerCode,
    TResult Function(_UpdatedCustomerCodeConfig value)?
        updatedCustomerCodeConfig,
    TResult Function(_LoadStoredCustomerCode value)? loadStoredCustomerCode,
    TResult Function(_FetchAndPreSelectCustomerCode value)?
        fetchAndPreSelectCustomerCode,
    TResult Function(_UpdateStockInfoAvailability value)?
        updateStockInfoAvailability,
    TResult Function(_WatchStockApiStatus value)? watchStockApiStatus,
    TResult Function(_WatchConnectivityStatus value)? watchConnectivityStatus,
    TResult Function(_UpdateNetworkAvailability value)?
        updateNetworkAvailability,
    required TResult orElse(),
  }) {
    if (loadStoredCustomerCode != null) {
      return loadStoredCustomerCode(this);
    }
    return orElse();
  }
}

abstract class _LoadStoredCustomerCode implements EligibilityEvent {
  const factory _LoadStoredCustomerCode() = _$LoadStoredCustomerCodeImpl;
}

/// @nodoc
abstract class _$$FetchAndPreSelectCustomerCodeImplCopyWith<$Res> {
  factory _$$FetchAndPreSelectCustomerCodeImplCopyWith(
          _$FetchAndPreSelectCustomerCodeImpl value,
          $Res Function(_$FetchAndPreSelectCustomerCodeImpl) then) =
      __$$FetchAndPreSelectCustomerCodeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchAndPreSelectCustomerCodeImplCopyWithImpl<$Res>
    extends _$EligibilityEventCopyWithImpl<$Res,
        _$FetchAndPreSelectCustomerCodeImpl>
    implements _$$FetchAndPreSelectCustomerCodeImplCopyWith<$Res> {
  __$$FetchAndPreSelectCustomerCodeImplCopyWithImpl(
      _$FetchAndPreSelectCustomerCodeImpl _value,
      $Res Function(_$FetchAndPreSelectCustomerCodeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchAndPreSelectCustomerCodeImpl
    implements _FetchAndPreSelectCustomerCode {
  const _$FetchAndPreSelectCustomerCodeImpl();

  @override
  String toString() {
    return 'EligibilityEvent.fetchAndPreSelectCustomerCode()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAndPreSelectCustomerCodeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)
        update,
    required TResult Function() registerChatBot,
    required TResult Function(
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)
        selectedCustomerCode,
    required TResult Function(CustomerCodeConfig customerCodeConfig)
        updatedCustomerCodeConfig,
    required TResult Function() loadStoredCustomerCode,
    required TResult Function() fetchAndPreSelectCustomerCode,
    required TResult Function(bool isStockInfoNotAvailable)
        updateStockInfoAvailability,
    required TResult Function() watchStockApiStatus,
    required TResult Function() watchConnectivityStatus,
    required TResult Function(bool isNetworkAvailable)
        updateNetworkAvailability,
  }) {
    return fetchAndPreSelectCustomerCode();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)?
        update,
    TResult? Function()? registerChatBot,
    TResult? Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        selectedCustomerCode,
    TResult? Function(CustomerCodeConfig customerCodeConfig)?
        updatedCustomerCodeConfig,
    TResult? Function()? loadStoredCustomerCode,
    TResult? Function()? fetchAndPreSelectCustomerCode,
    TResult? Function(bool isStockInfoNotAvailable)?
        updateStockInfoAvailability,
    TResult? Function()? watchStockApiStatus,
    TResult? Function()? watchConnectivityStatus,
    TResult? Function(bool isNetworkAvailable)? updateNetworkAvailability,
  }) {
    return fetchAndPreSelectCustomerCode?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)?
        update,
    TResult Function()? registerChatBot,
    TResult Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        selectedCustomerCode,
    TResult Function(CustomerCodeConfig customerCodeConfig)?
        updatedCustomerCodeConfig,
    TResult Function()? loadStoredCustomerCode,
    TResult Function()? fetchAndPreSelectCustomerCode,
    TResult Function(bool isStockInfoNotAvailable)? updateStockInfoAvailability,
    TResult Function()? watchStockApiStatus,
    TResult Function()? watchConnectivityStatus,
    TResult Function(bool isNetworkAvailable)? updateNetworkAvailability,
    required TResult orElse(),
  }) {
    if (fetchAndPreSelectCustomerCode != null) {
      return fetchAndPreSelectCustomerCode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Update value) update,
    required TResult Function(_RegisterChatBot value) registerChatBot,
    required TResult Function(_SelectedCustomerCode value) selectedCustomerCode,
    required TResult Function(_UpdatedCustomerCodeConfig value)
        updatedCustomerCodeConfig,
    required TResult Function(_LoadStoredCustomerCode value)
        loadStoredCustomerCode,
    required TResult Function(_FetchAndPreSelectCustomerCode value)
        fetchAndPreSelectCustomerCode,
    required TResult Function(_UpdateStockInfoAvailability value)
        updateStockInfoAvailability,
    required TResult Function(_WatchStockApiStatus value) watchStockApiStatus,
    required TResult Function(_WatchConnectivityStatus value)
        watchConnectivityStatus,
    required TResult Function(_UpdateNetworkAvailability value)
        updateNetworkAvailability,
  }) {
    return fetchAndPreSelectCustomerCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Update value)? update,
    TResult? Function(_RegisterChatBot value)? registerChatBot,
    TResult? Function(_SelectedCustomerCode value)? selectedCustomerCode,
    TResult? Function(_UpdatedCustomerCodeConfig value)?
        updatedCustomerCodeConfig,
    TResult? Function(_LoadStoredCustomerCode value)? loadStoredCustomerCode,
    TResult? Function(_FetchAndPreSelectCustomerCode value)?
        fetchAndPreSelectCustomerCode,
    TResult? Function(_UpdateStockInfoAvailability value)?
        updateStockInfoAvailability,
    TResult? Function(_WatchStockApiStatus value)? watchStockApiStatus,
    TResult? Function(_WatchConnectivityStatus value)? watchConnectivityStatus,
    TResult? Function(_UpdateNetworkAvailability value)?
        updateNetworkAvailability,
  }) {
    return fetchAndPreSelectCustomerCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Update value)? update,
    TResult Function(_RegisterChatBot value)? registerChatBot,
    TResult Function(_SelectedCustomerCode value)? selectedCustomerCode,
    TResult Function(_UpdatedCustomerCodeConfig value)?
        updatedCustomerCodeConfig,
    TResult Function(_LoadStoredCustomerCode value)? loadStoredCustomerCode,
    TResult Function(_FetchAndPreSelectCustomerCode value)?
        fetchAndPreSelectCustomerCode,
    TResult Function(_UpdateStockInfoAvailability value)?
        updateStockInfoAvailability,
    TResult Function(_WatchStockApiStatus value)? watchStockApiStatus,
    TResult Function(_WatchConnectivityStatus value)? watchConnectivityStatus,
    TResult Function(_UpdateNetworkAvailability value)?
        updateNetworkAvailability,
    required TResult orElse(),
  }) {
    if (fetchAndPreSelectCustomerCode != null) {
      return fetchAndPreSelectCustomerCode(this);
    }
    return orElse();
  }
}

abstract class _FetchAndPreSelectCustomerCode implements EligibilityEvent {
  const factory _FetchAndPreSelectCustomerCode() =
      _$FetchAndPreSelectCustomerCodeImpl;
}

/// @nodoc
abstract class _$$UpdateStockInfoAvailabilityImplCopyWith<$Res> {
  factory _$$UpdateStockInfoAvailabilityImplCopyWith(
          _$UpdateStockInfoAvailabilityImpl value,
          $Res Function(_$UpdateStockInfoAvailabilityImpl) then) =
      __$$UpdateStockInfoAvailabilityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isStockInfoNotAvailable});
}

/// @nodoc
class __$$UpdateStockInfoAvailabilityImplCopyWithImpl<$Res>
    extends _$EligibilityEventCopyWithImpl<$Res,
        _$UpdateStockInfoAvailabilityImpl>
    implements _$$UpdateStockInfoAvailabilityImplCopyWith<$Res> {
  __$$UpdateStockInfoAvailabilityImplCopyWithImpl(
      _$UpdateStockInfoAvailabilityImpl _value,
      $Res Function(_$UpdateStockInfoAvailabilityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isStockInfoNotAvailable = null,
  }) {
    return _then(_$UpdateStockInfoAvailabilityImpl(
      isStockInfoNotAvailable: null == isStockInfoNotAvailable
          ? _value.isStockInfoNotAvailable
          : isStockInfoNotAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UpdateStockInfoAvailabilityImpl
    implements _UpdateStockInfoAvailability {
  const _$UpdateStockInfoAvailabilityImpl(
      {required this.isStockInfoNotAvailable});

  @override
  final bool isStockInfoNotAvailable;

  @override
  String toString() {
    return 'EligibilityEvent.updateStockInfoAvailability(isStockInfoNotAvailable: $isStockInfoNotAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateStockInfoAvailabilityImpl &&
            (identical(
                    other.isStockInfoNotAvailable, isStockInfoNotAvailable) ||
                other.isStockInfoNotAvailable == isStockInfoNotAvailable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isStockInfoNotAvailable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateStockInfoAvailabilityImplCopyWith<_$UpdateStockInfoAvailabilityImpl>
      get copyWith => __$$UpdateStockInfoAvailabilityImplCopyWithImpl<
          _$UpdateStockInfoAvailabilityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)
        update,
    required TResult Function() registerChatBot,
    required TResult Function(
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)
        selectedCustomerCode,
    required TResult Function(CustomerCodeConfig customerCodeConfig)
        updatedCustomerCodeConfig,
    required TResult Function() loadStoredCustomerCode,
    required TResult Function() fetchAndPreSelectCustomerCode,
    required TResult Function(bool isStockInfoNotAvailable)
        updateStockInfoAvailability,
    required TResult Function() watchStockApiStatus,
    required TResult Function() watchConnectivityStatus,
    required TResult Function(bool isNetworkAvailable)
        updateNetworkAvailability,
  }) {
    return updateStockInfoAvailability(isStockInfoNotAvailable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)?
        update,
    TResult? Function()? registerChatBot,
    TResult? Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        selectedCustomerCode,
    TResult? Function(CustomerCodeConfig customerCodeConfig)?
        updatedCustomerCodeConfig,
    TResult? Function()? loadStoredCustomerCode,
    TResult? Function()? fetchAndPreSelectCustomerCode,
    TResult? Function(bool isStockInfoNotAvailable)?
        updateStockInfoAvailability,
    TResult? Function()? watchStockApiStatus,
    TResult? Function()? watchConnectivityStatus,
    TResult? Function(bool isNetworkAvailable)? updateNetworkAvailability,
  }) {
    return updateStockInfoAvailability?.call(isStockInfoNotAvailable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)?
        update,
    TResult Function()? registerChatBot,
    TResult Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        selectedCustomerCode,
    TResult Function(CustomerCodeConfig customerCodeConfig)?
        updatedCustomerCodeConfig,
    TResult Function()? loadStoredCustomerCode,
    TResult Function()? fetchAndPreSelectCustomerCode,
    TResult Function(bool isStockInfoNotAvailable)? updateStockInfoAvailability,
    TResult Function()? watchStockApiStatus,
    TResult Function()? watchConnectivityStatus,
    TResult Function(bool isNetworkAvailable)? updateNetworkAvailability,
    required TResult orElse(),
  }) {
    if (updateStockInfoAvailability != null) {
      return updateStockInfoAvailability(isStockInfoNotAvailable);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Update value) update,
    required TResult Function(_RegisterChatBot value) registerChatBot,
    required TResult Function(_SelectedCustomerCode value) selectedCustomerCode,
    required TResult Function(_UpdatedCustomerCodeConfig value)
        updatedCustomerCodeConfig,
    required TResult Function(_LoadStoredCustomerCode value)
        loadStoredCustomerCode,
    required TResult Function(_FetchAndPreSelectCustomerCode value)
        fetchAndPreSelectCustomerCode,
    required TResult Function(_UpdateStockInfoAvailability value)
        updateStockInfoAvailability,
    required TResult Function(_WatchStockApiStatus value) watchStockApiStatus,
    required TResult Function(_WatchConnectivityStatus value)
        watchConnectivityStatus,
    required TResult Function(_UpdateNetworkAvailability value)
        updateNetworkAvailability,
  }) {
    return updateStockInfoAvailability(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Update value)? update,
    TResult? Function(_RegisterChatBot value)? registerChatBot,
    TResult? Function(_SelectedCustomerCode value)? selectedCustomerCode,
    TResult? Function(_UpdatedCustomerCodeConfig value)?
        updatedCustomerCodeConfig,
    TResult? Function(_LoadStoredCustomerCode value)? loadStoredCustomerCode,
    TResult? Function(_FetchAndPreSelectCustomerCode value)?
        fetchAndPreSelectCustomerCode,
    TResult? Function(_UpdateStockInfoAvailability value)?
        updateStockInfoAvailability,
    TResult? Function(_WatchStockApiStatus value)? watchStockApiStatus,
    TResult? Function(_WatchConnectivityStatus value)? watchConnectivityStatus,
    TResult? Function(_UpdateNetworkAvailability value)?
        updateNetworkAvailability,
  }) {
    return updateStockInfoAvailability?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Update value)? update,
    TResult Function(_RegisterChatBot value)? registerChatBot,
    TResult Function(_SelectedCustomerCode value)? selectedCustomerCode,
    TResult Function(_UpdatedCustomerCodeConfig value)?
        updatedCustomerCodeConfig,
    TResult Function(_LoadStoredCustomerCode value)? loadStoredCustomerCode,
    TResult Function(_FetchAndPreSelectCustomerCode value)?
        fetchAndPreSelectCustomerCode,
    TResult Function(_UpdateStockInfoAvailability value)?
        updateStockInfoAvailability,
    TResult Function(_WatchStockApiStatus value)? watchStockApiStatus,
    TResult Function(_WatchConnectivityStatus value)? watchConnectivityStatus,
    TResult Function(_UpdateNetworkAvailability value)?
        updateNetworkAvailability,
    required TResult orElse(),
  }) {
    if (updateStockInfoAvailability != null) {
      return updateStockInfoAvailability(this);
    }
    return orElse();
  }
}

abstract class _UpdateStockInfoAvailability implements EligibilityEvent {
  const factory _UpdateStockInfoAvailability(
          {required final bool isStockInfoNotAvailable}) =
      _$UpdateStockInfoAvailabilityImpl;

  bool get isStockInfoNotAvailable;
  @JsonKey(ignore: true)
  _$$UpdateStockInfoAvailabilityImplCopyWith<_$UpdateStockInfoAvailabilityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WatchStockApiStatusImplCopyWith<$Res> {
  factory _$$WatchStockApiStatusImplCopyWith(_$WatchStockApiStatusImpl value,
          $Res Function(_$WatchStockApiStatusImpl) then) =
      __$$WatchStockApiStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WatchStockApiStatusImplCopyWithImpl<$Res>
    extends _$EligibilityEventCopyWithImpl<$Res, _$WatchStockApiStatusImpl>
    implements _$$WatchStockApiStatusImplCopyWith<$Res> {
  __$$WatchStockApiStatusImplCopyWithImpl(_$WatchStockApiStatusImpl _value,
      $Res Function(_$WatchStockApiStatusImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WatchStockApiStatusImpl implements _WatchStockApiStatus {
  const _$WatchStockApiStatusImpl();

  @override
  String toString() {
    return 'EligibilityEvent.watchStockApiStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchStockApiStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)
        update,
    required TResult Function() registerChatBot,
    required TResult Function(
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)
        selectedCustomerCode,
    required TResult Function(CustomerCodeConfig customerCodeConfig)
        updatedCustomerCodeConfig,
    required TResult Function() loadStoredCustomerCode,
    required TResult Function() fetchAndPreSelectCustomerCode,
    required TResult Function(bool isStockInfoNotAvailable)
        updateStockInfoAvailability,
    required TResult Function() watchStockApiStatus,
    required TResult Function() watchConnectivityStatus,
    required TResult Function(bool isNetworkAvailable)
        updateNetworkAvailability,
  }) {
    return watchStockApiStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)?
        update,
    TResult? Function()? registerChatBot,
    TResult? Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        selectedCustomerCode,
    TResult? Function(CustomerCodeConfig customerCodeConfig)?
        updatedCustomerCodeConfig,
    TResult? Function()? loadStoredCustomerCode,
    TResult? Function()? fetchAndPreSelectCustomerCode,
    TResult? Function(bool isStockInfoNotAvailable)?
        updateStockInfoAvailability,
    TResult? Function()? watchStockApiStatus,
    TResult? Function()? watchConnectivityStatus,
    TResult? Function(bool isNetworkAvailable)? updateNetworkAvailability,
  }) {
    return watchStockApiStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)?
        update,
    TResult Function()? registerChatBot,
    TResult Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        selectedCustomerCode,
    TResult Function(CustomerCodeConfig customerCodeConfig)?
        updatedCustomerCodeConfig,
    TResult Function()? loadStoredCustomerCode,
    TResult Function()? fetchAndPreSelectCustomerCode,
    TResult Function(bool isStockInfoNotAvailable)? updateStockInfoAvailability,
    TResult Function()? watchStockApiStatus,
    TResult Function()? watchConnectivityStatus,
    TResult Function(bool isNetworkAvailable)? updateNetworkAvailability,
    required TResult orElse(),
  }) {
    if (watchStockApiStatus != null) {
      return watchStockApiStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Update value) update,
    required TResult Function(_RegisterChatBot value) registerChatBot,
    required TResult Function(_SelectedCustomerCode value) selectedCustomerCode,
    required TResult Function(_UpdatedCustomerCodeConfig value)
        updatedCustomerCodeConfig,
    required TResult Function(_LoadStoredCustomerCode value)
        loadStoredCustomerCode,
    required TResult Function(_FetchAndPreSelectCustomerCode value)
        fetchAndPreSelectCustomerCode,
    required TResult Function(_UpdateStockInfoAvailability value)
        updateStockInfoAvailability,
    required TResult Function(_WatchStockApiStatus value) watchStockApiStatus,
    required TResult Function(_WatchConnectivityStatus value)
        watchConnectivityStatus,
    required TResult Function(_UpdateNetworkAvailability value)
        updateNetworkAvailability,
  }) {
    return watchStockApiStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Update value)? update,
    TResult? Function(_RegisterChatBot value)? registerChatBot,
    TResult? Function(_SelectedCustomerCode value)? selectedCustomerCode,
    TResult? Function(_UpdatedCustomerCodeConfig value)?
        updatedCustomerCodeConfig,
    TResult? Function(_LoadStoredCustomerCode value)? loadStoredCustomerCode,
    TResult? Function(_FetchAndPreSelectCustomerCode value)?
        fetchAndPreSelectCustomerCode,
    TResult? Function(_UpdateStockInfoAvailability value)?
        updateStockInfoAvailability,
    TResult? Function(_WatchStockApiStatus value)? watchStockApiStatus,
    TResult? Function(_WatchConnectivityStatus value)? watchConnectivityStatus,
    TResult? Function(_UpdateNetworkAvailability value)?
        updateNetworkAvailability,
  }) {
    return watchStockApiStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Update value)? update,
    TResult Function(_RegisterChatBot value)? registerChatBot,
    TResult Function(_SelectedCustomerCode value)? selectedCustomerCode,
    TResult Function(_UpdatedCustomerCodeConfig value)?
        updatedCustomerCodeConfig,
    TResult Function(_LoadStoredCustomerCode value)? loadStoredCustomerCode,
    TResult Function(_FetchAndPreSelectCustomerCode value)?
        fetchAndPreSelectCustomerCode,
    TResult Function(_UpdateStockInfoAvailability value)?
        updateStockInfoAvailability,
    TResult Function(_WatchStockApiStatus value)? watchStockApiStatus,
    TResult Function(_WatchConnectivityStatus value)? watchConnectivityStatus,
    TResult Function(_UpdateNetworkAvailability value)?
        updateNetworkAvailability,
    required TResult orElse(),
  }) {
    if (watchStockApiStatus != null) {
      return watchStockApiStatus(this);
    }
    return orElse();
  }
}

abstract class _WatchStockApiStatus implements EligibilityEvent {
  const factory _WatchStockApiStatus() = _$WatchStockApiStatusImpl;
}

/// @nodoc
abstract class _$$WatchConnectivityStatusImplCopyWith<$Res> {
  factory _$$WatchConnectivityStatusImplCopyWith(
          _$WatchConnectivityStatusImpl value,
          $Res Function(_$WatchConnectivityStatusImpl) then) =
      __$$WatchConnectivityStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WatchConnectivityStatusImplCopyWithImpl<$Res>
    extends _$EligibilityEventCopyWithImpl<$Res, _$WatchConnectivityStatusImpl>
    implements _$$WatchConnectivityStatusImplCopyWith<$Res> {
  __$$WatchConnectivityStatusImplCopyWithImpl(
      _$WatchConnectivityStatusImpl _value,
      $Res Function(_$WatchConnectivityStatusImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WatchConnectivityStatusImpl implements _WatchConnectivityStatus {
  const _$WatchConnectivityStatusImpl();

  @override
  String toString() {
    return 'EligibilityEvent.watchConnectivityStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchConnectivityStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)
        update,
    required TResult Function() registerChatBot,
    required TResult Function(
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)
        selectedCustomerCode,
    required TResult Function(CustomerCodeConfig customerCodeConfig)
        updatedCustomerCodeConfig,
    required TResult Function() loadStoredCustomerCode,
    required TResult Function() fetchAndPreSelectCustomerCode,
    required TResult Function(bool isStockInfoNotAvailable)
        updateStockInfoAvailability,
    required TResult Function() watchStockApiStatus,
    required TResult Function() watchConnectivityStatus,
    required TResult Function(bool isNetworkAvailable)
        updateNetworkAvailability,
  }) {
    return watchConnectivityStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)?
        update,
    TResult? Function()? registerChatBot,
    TResult? Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        selectedCustomerCode,
    TResult? Function(CustomerCodeConfig customerCodeConfig)?
        updatedCustomerCodeConfig,
    TResult? Function()? loadStoredCustomerCode,
    TResult? Function()? fetchAndPreSelectCustomerCode,
    TResult? Function(bool isStockInfoNotAvailable)?
        updateStockInfoAvailability,
    TResult? Function()? watchStockApiStatus,
    TResult? Function()? watchConnectivityStatus,
    TResult? Function(bool isNetworkAvailable)? updateNetworkAvailability,
  }) {
    return watchConnectivityStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)?
        update,
    TResult Function()? registerChatBot,
    TResult Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        selectedCustomerCode,
    TResult Function(CustomerCodeConfig customerCodeConfig)?
        updatedCustomerCodeConfig,
    TResult Function()? loadStoredCustomerCode,
    TResult Function()? fetchAndPreSelectCustomerCode,
    TResult Function(bool isStockInfoNotAvailable)? updateStockInfoAvailability,
    TResult Function()? watchStockApiStatus,
    TResult Function()? watchConnectivityStatus,
    TResult Function(bool isNetworkAvailable)? updateNetworkAvailability,
    required TResult orElse(),
  }) {
    if (watchConnectivityStatus != null) {
      return watchConnectivityStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Update value) update,
    required TResult Function(_RegisterChatBot value) registerChatBot,
    required TResult Function(_SelectedCustomerCode value) selectedCustomerCode,
    required TResult Function(_UpdatedCustomerCodeConfig value)
        updatedCustomerCodeConfig,
    required TResult Function(_LoadStoredCustomerCode value)
        loadStoredCustomerCode,
    required TResult Function(_FetchAndPreSelectCustomerCode value)
        fetchAndPreSelectCustomerCode,
    required TResult Function(_UpdateStockInfoAvailability value)
        updateStockInfoAvailability,
    required TResult Function(_WatchStockApiStatus value) watchStockApiStatus,
    required TResult Function(_WatchConnectivityStatus value)
        watchConnectivityStatus,
    required TResult Function(_UpdateNetworkAvailability value)
        updateNetworkAvailability,
  }) {
    return watchConnectivityStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Update value)? update,
    TResult? Function(_RegisterChatBot value)? registerChatBot,
    TResult? Function(_SelectedCustomerCode value)? selectedCustomerCode,
    TResult? Function(_UpdatedCustomerCodeConfig value)?
        updatedCustomerCodeConfig,
    TResult? Function(_LoadStoredCustomerCode value)? loadStoredCustomerCode,
    TResult? Function(_FetchAndPreSelectCustomerCode value)?
        fetchAndPreSelectCustomerCode,
    TResult? Function(_UpdateStockInfoAvailability value)?
        updateStockInfoAvailability,
    TResult? Function(_WatchStockApiStatus value)? watchStockApiStatus,
    TResult? Function(_WatchConnectivityStatus value)? watchConnectivityStatus,
    TResult? Function(_UpdateNetworkAvailability value)?
        updateNetworkAvailability,
  }) {
    return watchConnectivityStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Update value)? update,
    TResult Function(_RegisterChatBot value)? registerChatBot,
    TResult Function(_SelectedCustomerCode value)? selectedCustomerCode,
    TResult Function(_UpdatedCustomerCodeConfig value)?
        updatedCustomerCodeConfig,
    TResult Function(_LoadStoredCustomerCode value)? loadStoredCustomerCode,
    TResult Function(_FetchAndPreSelectCustomerCode value)?
        fetchAndPreSelectCustomerCode,
    TResult Function(_UpdateStockInfoAvailability value)?
        updateStockInfoAvailability,
    TResult Function(_WatchStockApiStatus value)? watchStockApiStatus,
    TResult Function(_WatchConnectivityStatus value)? watchConnectivityStatus,
    TResult Function(_UpdateNetworkAvailability value)?
        updateNetworkAvailability,
    required TResult orElse(),
  }) {
    if (watchConnectivityStatus != null) {
      return watchConnectivityStatus(this);
    }
    return orElse();
  }
}

abstract class _WatchConnectivityStatus implements EligibilityEvent {
  const factory _WatchConnectivityStatus() = _$WatchConnectivityStatusImpl;
}

/// @nodoc
abstract class _$$UpdateNetworkAvailabilityImplCopyWith<$Res> {
  factory _$$UpdateNetworkAvailabilityImplCopyWith(
          _$UpdateNetworkAvailabilityImpl value,
          $Res Function(_$UpdateNetworkAvailabilityImpl) then) =
      __$$UpdateNetworkAvailabilityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isNetworkAvailable});
}

/// @nodoc
class __$$UpdateNetworkAvailabilityImplCopyWithImpl<$Res>
    extends _$EligibilityEventCopyWithImpl<$Res,
        _$UpdateNetworkAvailabilityImpl>
    implements _$$UpdateNetworkAvailabilityImplCopyWith<$Res> {
  __$$UpdateNetworkAvailabilityImplCopyWithImpl(
      _$UpdateNetworkAvailabilityImpl _value,
      $Res Function(_$UpdateNetworkAvailabilityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNetworkAvailable = null,
  }) {
    return _then(_$UpdateNetworkAvailabilityImpl(
      isNetworkAvailable: null == isNetworkAvailable
          ? _value.isNetworkAvailable
          : isNetworkAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UpdateNetworkAvailabilityImpl implements _UpdateNetworkAvailability {
  const _$UpdateNetworkAvailabilityImpl({required this.isNetworkAvailable});

  @override
  final bool isNetworkAvailable;

  @override
  String toString() {
    return 'EligibilityEvent.updateNetworkAvailability(isNetworkAvailable: $isNetworkAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateNetworkAvailabilityImpl &&
            (identical(other.isNetworkAvailable, isNetworkAvailable) ||
                other.isNetworkAvailable == isNetworkAvailable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isNetworkAvailable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateNetworkAvailabilityImplCopyWith<_$UpdateNetworkAvailabilityImpl>
      get copyWith => __$$UpdateNetworkAvailabilityImplCopyWithImpl<
          _$UpdateNetworkAvailabilityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)
        update,
    required TResult Function() registerChatBot,
    required TResult Function(
            CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)
        selectedCustomerCode,
    required TResult Function(CustomerCodeConfig customerCodeConfig)
        updatedCustomerCodeConfig,
    required TResult Function() loadStoredCustomerCode,
    required TResult Function() fetchAndPreSelectCustomerCode,
    required TResult Function(bool isStockInfoNotAvailable)
        updateStockInfoAvailability,
    required TResult Function() watchStockApiStatus,
    required TResult Function() watchConnectivityStatus,
    required TResult Function(bool isNetworkAvailable)
        updateNetworkAvailability,
  }) {
    return updateNetworkAvailability(isNetworkAvailable);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)?
        update,
    TResult? Function()? registerChatBot,
    TResult? Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        selectedCustomerCode,
    TResult? Function(CustomerCodeConfig customerCodeConfig)?
        updatedCustomerCodeConfig,
    TResult? Function()? loadStoredCustomerCode,
    TResult? Function()? fetchAndPreSelectCustomerCode,
    TResult? Function(bool isStockInfoNotAvailable)?
        updateStockInfoAvailability,
    TResult? Function()? watchStockApiStatus,
    TResult? Function()? watchConnectivityStatus,
    TResult? Function(bool isNetworkAvailable)? updateNetworkAvailability,
  }) {
    return updateNetworkAvailability?.call(isNetworkAvailable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(User user, SalesOrganisation salesOrganisation,
            SalesOrganisationConfigs salesOrgConfigs)?
        update,
    TResult Function()? registerChatBot,
    TResult Function(CustomerCodeInfo customerCodeInfo, ShipToInfo shipToInfo)?
        selectedCustomerCode,
    TResult Function(CustomerCodeConfig customerCodeConfig)?
        updatedCustomerCodeConfig,
    TResult Function()? loadStoredCustomerCode,
    TResult Function()? fetchAndPreSelectCustomerCode,
    TResult Function(bool isStockInfoNotAvailable)? updateStockInfoAvailability,
    TResult Function()? watchStockApiStatus,
    TResult Function()? watchConnectivityStatus,
    TResult Function(bool isNetworkAvailable)? updateNetworkAvailability,
    required TResult orElse(),
  }) {
    if (updateNetworkAvailability != null) {
      return updateNetworkAvailability(isNetworkAvailable);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Update value) update,
    required TResult Function(_RegisterChatBot value) registerChatBot,
    required TResult Function(_SelectedCustomerCode value) selectedCustomerCode,
    required TResult Function(_UpdatedCustomerCodeConfig value)
        updatedCustomerCodeConfig,
    required TResult Function(_LoadStoredCustomerCode value)
        loadStoredCustomerCode,
    required TResult Function(_FetchAndPreSelectCustomerCode value)
        fetchAndPreSelectCustomerCode,
    required TResult Function(_UpdateStockInfoAvailability value)
        updateStockInfoAvailability,
    required TResult Function(_WatchStockApiStatus value) watchStockApiStatus,
    required TResult Function(_WatchConnectivityStatus value)
        watchConnectivityStatus,
    required TResult Function(_UpdateNetworkAvailability value)
        updateNetworkAvailability,
  }) {
    return updateNetworkAvailability(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Update value)? update,
    TResult? Function(_RegisterChatBot value)? registerChatBot,
    TResult? Function(_SelectedCustomerCode value)? selectedCustomerCode,
    TResult? Function(_UpdatedCustomerCodeConfig value)?
        updatedCustomerCodeConfig,
    TResult? Function(_LoadStoredCustomerCode value)? loadStoredCustomerCode,
    TResult? Function(_FetchAndPreSelectCustomerCode value)?
        fetchAndPreSelectCustomerCode,
    TResult? Function(_UpdateStockInfoAvailability value)?
        updateStockInfoAvailability,
    TResult? Function(_WatchStockApiStatus value)? watchStockApiStatus,
    TResult? Function(_WatchConnectivityStatus value)? watchConnectivityStatus,
    TResult? Function(_UpdateNetworkAvailability value)?
        updateNetworkAvailability,
  }) {
    return updateNetworkAvailability?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Update value)? update,
    TResult Function(_RegisterChatBot value)? registerChatBot,
    TResult Function(_SelectedCustomerCode value)? selectedCustomerCode,
    TResult Function(_UpdatedCustomerCodeConfig value)?
        updatedCustomerCodeConfig,
    TResult Function(_LoadStoredCustomerCode value)? loadStoredCustomerCode,
    TResult Function(_FetchAndPreSelectCustomerCode value)?
        fetchAndPreSelectCustomerCode,
    TResult Function(_UpdateStockInfoAvailability value)?
        updateStockInfoAvailability,
    TResult Function(_WatchStockApiStatus value)? watchStockApiStatus,
    TResult Function(_WatchConnectivityStatus value)? watchConnectivityStatus,
    TResult Function(_UpdateNetworkAvailability value)?
        updateNetworkAvailability,
    required TResult orElse(),
  }) {
    if (updateNetworkAvailability != null) {
      return updateNetworkAvailability(this);
    }
    return orElse();
  }
}

abstract class _UpdateNetworkAvailability implements EligibilityEvent {
  const factory _UpdateNetworkAvailability(
          {required final bool isNetworkAvailable}) =
      _$UpdateNetworkAvailabilityImpl;

  bool get isNetworkAvailable;
  @JsonKey(ignore: true)
  _$$UpdateNetworkAvailabilityImplCopyWith<_$UpdateNetworkAvailabilityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EligibilityState {
  User get user => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  SalesOrganisationConfigs get salesOrgConfigs =>
      throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  ShipToInfo get shipToInfo => throw _privateConstructorUsedError;
  CustomerCodeConfig get customerCodeConfig =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isLoadingCustomerCode => throw _privateConstructorUsedError;
  bool get preSelectShipTo => throw _privateConstructorUsedError;
  bool get isStockInfoNotAvailable => throw _privateConstructorUsedError;
  bool get isNetworkAvailable => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EligibilityStateCopyWith<EligibilityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EligibilityStateCopyWith<$Res> {
  factory $EligibilityStateCopyWith(
          EligibilityState value, $Res Function(EligibilityState) then) =
      _$EligibilityStateCopyWithImpl<$Res, EligibilityState>;
  @useResult
  $Res call(
      {User user,
      SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs salesOrgConfigs,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      CustomerCodeConfig customerCodeConfig,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isLoadingCustomerCode,
      bool preSelectShipTo,
      bool isStockInfoNotAvailable,
      bool isNetworkAvailable});

  $UserCopyWith<$Res> get user;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $CustomerCodeConfigCopyWith<$Res> get customerCodeConfig;
}

/// @nodoc
class _$EligibilityStateCopyWithImpl<$Res, $Val extends EligibilityState>
    implements $EligibilityStateCopyWith<$Res> {
  _$EligibilityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? salesOrganisation = null,
    Object? salesOrgConfigs = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? customerCodeConfig = null,
    Object? failureOrSuccessOption = null,
    Object? isLoadingCustomerCode = null,
    Object? preSelectShipTo = null,
    Object? isStockInfoNotAvailable = null,
    Object? isNetworkAvailable = null,
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
      salesOrgConfigs: null == salesOrgConfigs
          ? _value.salesOrgConfigs
          : salesOrgConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      customerCodeConfig: null == customerCodeConfig
          ? _value.customerCodeConfig
          : customerCodeConfig // ignore: cast_nullable_to_non_nullable
              as CustomerCodeConfig,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isLoadingCustomerCode: null == isLoadingCustomerCode
          ? _value.isLoadingCustomerCode
          : isLoadingCustomerCode // ignore: cast_nullable_to_non_nullable
              as bool,
      preSelectShipTo: null == preSelectShipTo
          ? _value.preSelectShipTo
          : preSelectShipTo // ignore: cast_nullable_to_non_nullable
              as bool,
      isStockInfoNotAvailable: null == isStockInfoNotAvailable
          ? _value.isStockInfoNotAvailable
          : isStockInfoNotAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      isNetworkAvailable: null == isNetworkAvailable
          ? _value.isNetworkAvailable
          : isNetworkAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.salesOrgConfigs,
        (value) {
      return _then(_value.copyWith(salesOrgConfigs: value) as $Val);
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
  $CustomerCodeConfigCopyWith<$Res> get customerCodeConfig {
    return $CustomerCodeConfigCopyWith<$Res>(_value.customerCodeConfig,
        (value) {
      return _then(_value.copyWith(customerCodeConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EligibilityStateImplCopyWith<$Res>
    implements $EligibilityStateCopyWith<$Res> {
  factory _$$EligibilityStateImplCopyWith(_$EligibilityStateImpl value,
          $Res Function(_$EligibilityStateImpl) then) =
      __$$EligibilityStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {User user,
      SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs salesOrgConfigs,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      CustomerCodeConfig customerCodeConfig,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isLoadingCustomerCode,
      bool preSelectShipTo,
      bool isStockInfoNotAvailable,
      bool isNetworkAvailable});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrgConfigs;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  @override
  $CustomerCodeConfigCopyWith<$Res> get customerCodeConfig;
}

/// @nodoc
class __$$EligibilityStateImplCopyWithImpl<$Res>
    extends _$EligibilityStateCopyWithImpl<$Res, _$EligibilityStateImpl>
    implements _$$EligibilityStateImplCopyWith<$Res> {
  __$$EligibilityStateImplCopyWithImpl(_$EligibilityStateImpl _value,
      $Res Function(_$EligibilityStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? salesOrganisation = null,
    Object? salesOrgConfigs = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? customerCodeConfig = null,
    Object? failureOrSuccessOption = null,
    Object? isLoadingCustomerCode = null,
    Object? preSelectShipTo = null,
    Object? isStockInfoNotAvailable = null,
    Object? isNetworkAvailable = null,
  }) {
    return _then(_$EligibilityStateImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      salesOrgConfigs: null == salesOrgConfigs
          ? _value.salesOrgConfigs
          : salesOrgConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      customerCodeConfig: null == customerCodeConfig
          ? _value.customerCodeConfig
          : customerCodeConfig // ignore: cast_nullable_to_non_nullable
              as CustomerCodeConfig,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isLoadingCustomerCode: null == isLoadingCustomerCode
          ? _value.isLoadingCustomerCode
          : isLoadingCustomerCode // ignore: cast_nullable_to_non_nullable
              as bool,
      preSelectShipTo: null == preSelectShipTo
          ? _value.preSelectShipTo
          : preSelectShipTo // ignore: cast_nullable_to_non_nullable
              as bool,
      isStockInfoNotAvailable: null == isStockInfoNotAvailable
          ? _value.isStockInfoNotAvailable
          : isStockInfoNotAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      isNetworkAvailable: null == isNetworkAvailable
          ? _value.isNetworkAvailable
          : isNetworkAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$EligibilityStateImpl extends _EligibilityState {
  const _$EligibilityStateImpl(
      {required this.user,
      required this.salesOrganisation,
      required this.salesOrgConfigs,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.customerCodeConfig,
      required this.failureOrSuccessOption,
      required this.isLoadingCustomerCode,
      required this.preSelectShipTo,
      required this.isStockInfoNotAvailable,
      required this.isNetworkAvailable})
      : super._();

  @override
  final User user;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final SalesOrganisationConfigs salesOrgConfigs;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final CustomerCodeConfig customerCodeConfig;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  @override
  final bool isLoadingCustomerCode;
  @override
  final bool preSelectShipTo;
  @override
  final bool isStockInfoNotAvailable;
  @override
  final bool isNetworkAvailable;

  @override
  String toString() {
    return 'EligibilityState(user: $user, salesOrganisation: $salesOrganisation, salesOrgConfigs: $salesOrgConfigs, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, customerCodeConfig: $customerCodeConfig, failureOrSuccessOption: $failureOrSuccessOption, isLoadingCustomerCode: $isLoadingCustomerCode, preSelectShipTo: $preSelectShipTo, isStockInfoNotAvailable: $isStockInfoNotAvailable, isNetworkAvailable: $isNetworkAvailable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EligibilityStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.salesOrgConfigs, salesOrgConfigs) ||
                other.salesOrgConfigs == salesOrgConfigs) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.customerCodeConfig, customerCodeConfig) ||
                other.customerCodeConfig == customerCodeConfig) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.isLoadingCustomerCode, isLoadingCustomerCode) ||
                other.isLoadingCustomerCode == isLoadingCustomerCode) &&
            (identical(other.preSelectShipTo, preSelectShipTo) ||
                other.preSelectShipTo == preSelectShipTo) &&
            (identical(
                    other.isStockInfoNotAvailable, isStockInfoNotAvailable) ||
                other.isStockInfoNotAvailable == isStockInfoNotAvailable) &&
            (identical(other.isNetworkAvailable, isNetworkAvailable) ||
                other.isNetworkAvailable == isNetworkAvailable));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      salesOrganisation,
      salesOrgConfigs,
      customerCodeInfo,
      shipToInfo,
      customerCodeConfig,
      failureOrSuccessOption,
      isLoadingCustomerCode,
      preSelectShipTo,
      isStockInfoNotAvailable,
      isNetworkAvailable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EligibilityStateImplCopyWith<_$EligibilityStateImpl> get copyWith =>
      __$$EligibilityStateImplCopyWithImpl<_$EligibilityStateImpl>(
          this, _$identity);
}

abstract class _EligibilityState extends EligibilityState {
  const factory _EligibilityState(
      {required final User user,
      required final SalesOrganisation salesOrganisation,
      required final SalesOrganisationConfigs salesOrgConfigs,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final CustomerCodeConfig customerCodeConfig,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final bool isLoadingCustomerCode,
      required final bool preSelectShipTo,
      required final bool isStockInfoNotAvailable,
      required final bool isNetworkAvailable}) = _$EligibilityStateImpl;
  const _EligibilityState._() : super._();

  @override
  User get user;
  @override
  SalesOrganisation get salesOrganisation;
  @override
  SalesOrganisationConfigs get salesOrgConfigs;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  ShipToInfo get shipToInfo;
  @override
  CustomerCodeConfig get customerCodeConfig;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  bool get isLoadingCustomerCode;
  @override
  bool get preSelectShipTo;
  @override
  bool get isStockInfoNotAvailable;
  @override
  bool get isNetworkAvailable;
  @override
  @JsonKey(ignore: true)
  _$$EligibilityStateImplCopyWith<_$EligibilityStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

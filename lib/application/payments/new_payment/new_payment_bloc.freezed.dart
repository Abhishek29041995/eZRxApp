// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_payment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewPaymentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)
        initialized,
    required TResult Function() fetchAvailablePaymentMethods,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function() pay,
    required TResult Function(PaymentStatus paymentStatus) updatePaymentGateway,
    required TResult Function() fetchInvoiceInfoPdf,
    required TResult Function(Uint8List dataInvoicePdf) saveInvoicePdf,
    required TResult Function(NewPaymentMethod paymentMethodSelected)
        updatePaymentMethodSelected,
    required TResult Function(PaymentMethodOption paymentMethodOptionSelected)
        updatePaymentMethodOptionSelected,
    required TResult Function() createVirtualAccount,
    required TResult Function() getPrincipalCutoffs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult? Function()? fetchAvailablePaymentMethods,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function()? pay,
    TResult? Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult? Function()? fetchInvoiceInfoPdf,
    TResult? Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult? Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult? Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult? Function()? createVirtualAccount,
    TResult? Function()? getPrincipalCutoffs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult Function()? fetchAvailablePaymentMethods,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function()? pay,
    TResult Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult Function()? fetchInvoiceInfoPdf,
    TResult Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult Function()? createVirtualAccount,
    TResult Function()? getPrincipalCutoffs,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchAvailablePaymentMethods value)
        fetchAvailablePaymentMethods,
    required TResult Function(_SelectAllInvoices value) updateAllInvoices,
    required TResult Function(_ToggleInvoice value) toggleInvoice,
    required TResult Function(_SelectAllCredits value) updateAllCredits,
    required TResult Function(_ToggleCredit value) toggleCredit,
    required TResult Function(_Pay value) pay,
    required TResult Function(_UpdatePaymentGateway value) updatePaymentGateway,
    required TResult Function(_FetchInvoiceInfoPdf value) fetchInvoiceInfoPdf,
    required TResult Function(_SaveInvoicePdf value) saveInvoicePdf,
    required TResult Function(_UpdatePaymentMethodSelected value)
        updatePaymentMethodSelected,
    required TResult Function(_UpdatePaymentMethodOptionSelected value)
        updatePaymentMethodOptionSelected,
    required TResult Function(_CreateVirtualAccount value) createVirtualAccount,
    required TResult Function(_GetPrincipalCutoffs value) getPrincipalCutoffs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult? Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult? Function(_ToggleInvoice value)? toggleInvoice,
    TResult? Function(_SelectAllCredits value)? updateAllCredits,
    TResult? Function(_ToggleCredit value)? toggleCredit,
    TResult? Function(_Pay value)? pay,
    TResult? Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult? Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult? Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult? Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult? Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult? Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult? Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult Function(_ToggleInvoice value)? toggleInvoice,
    TResult Function(_SelectAllCredits value)? updateAllCredits,
    TResult Function(_ToggleCredit value)? toggleCredit,
    TResult Function(_Pay value)? pay,
    TResult Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewPaymentEventCopyWith<$Res> {
  factory $NewPaymentEventCopyWith(
          NewPaymentEvent value, $Res Function(NewPaymentEvent) then) =
      _$NewPaymentEventCopyWithImpl<$Res, NewPaymentEvent>;
}

/// @nodoc
class _$NewPaymentEventCopyWithImpl<$Res, $Val extends NewPaymentEvent>
    implements $NewPaymentEventCopyWith<$Res> {
  _$NewPaymentEventCopyWithImpl(this._value, this._then);

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
      {SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      User user,
      bool isMarketPlace});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$initializedImplCopyWithImpl<$Res>
    extends _$NewPaymentEventCopyWithImpl<$Res, _$initializedImpl>
    implements _$$initializedImplCopyWith<$Res> {
  __$$initializedImplCopyWithImpl(
      _$initializedImpl _value, $Res Function(_$initializedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? user = null,
    Object? isMarketPlace = null,
  }) {
    return _then(_$initializedImpl(
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
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
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
}

/// @nodoc

class _$initializedImpl implements _initialized {
  const _$initializedImpl(
      {required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.user,
      required this.isMarketPlace});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final User user;
  @override
  final bool isMarketPlace;

  @override
  String toString() {
    return 'NewPaymentEvent.initialized(salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, user: $user, isMarketPlace: $isMarketPlace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$initializedImpl &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isMarketPlace, isMarketPlace) ||
                other.isMarketPlace == isMarketPlace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrganisation,
      customerCodeInfo, shipToInfo, user, isMarketPlace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$initializedImplCopyWith<_$initializedImpl> get copyWith =>
      __$$initializedImplCopyWithImpl<_$initializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)
        initialized,
    required TResult Function() fetchAvailablePaymentMethods,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function() pay,
    required TResult Function(PaymentStatus paymentStatus) updatePaymentGateway,
    required TResult Function() fetchInvoiceInfoPdf,
    required TResult Function(Uint8List dataInvoicePdf) saveInvoicePdf,
    required TResult Function(NewPaymentMethod paymentMethodSelected)
        updatePaymentMethodSelected,
    required TResult Function(PaymentMethodOption paymentMethodOptionSelected)
        updatePaymentMethodOptionSelected,
    required TResult Function() createVirtualAccount,
    required TResult Function() getPrincipalCutoffs,
  }) {
    return initialized(
        salesOrganisation, customerCodeInfo, shipToInfo, user, isMarketPlace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult? Function()? fetchAvailablePaymentMethods,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function()? pay,
    TResult? Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult? Function()? fetchInvoiceInfoPdf,
    TResult? Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult? Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult? Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult? Function()? createVirtualAccount,
    TResult? Function()? getPrincipalCutoffs,
  }) {
    return initialized?.call(
        salesOrganisation, customerCodeInfo, shipToInfo, user, isMarketPlace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult Function()? fetchAvailablePaymentMethods,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function()? pay,
    TResult Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult Function()? fetchInvoiceInfoPdf,
    TResult Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult Function()? createVirtualAccount,
    TResult Function()? getPrincipalCutoffs,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(
          salesOrganisation, customerCodeInfo, shipToInfo, user, isMarketPlace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchAvailablePaymentMethods value)
        fetchAvailablePaymentMethods,
    required TResult Function(_SelectAllInvoices value) updateAllInvoices,
    required TResult Function(_ToggleInvoice value) toggleInvoice,
    required TResult Function(_SelectAllCredits value) updateAllCredits,
    required TResult Function(_ToggleCredit value) toggleCredit,
    required TResult Function(_Pay value) pay,
    required TResult Function(_UpdatePaymentGateway value) updatePaymentGateway,
    required TResult Function(_FetchInvoiceInfoPdf value) fetchInvoiceInfoPdf,
    required TResult Function(_SaveInvoicePdf value) saveInvoicePdf,
    required TResult Function(_UpdatePaymentMethodSelected value)
        updatePaymentMethodSelected,
    required TResult Function(_UpdatePaymentMethodOptionSelected value)
        updatePaymentMethodOptionSelected,
    required TResult Function(_CreateVirtualAccount value) createVirtualAccount,
    required TResult Function(_GetPrincipalCutoffs value) getPrincipalCutoffs,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult? Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult? Function(_ToggleInvoice value)? toggleInvoice,
    TResult? Function(_SelectAllCredits value)? updateAllCredits,
    TResult? Function(_ToggleCredit value)? toggleCredit,
    TResult? Function(_Pay value)? pay,
    TResult? Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult? Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult? Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult? Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult? Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult? Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult? Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult Function(_ToggleInvoice value)? toggleInvoice,
    TResult Function(_SelectAllCredits value)? updateAllCredits,
    TResult Function(_ToggleCredit value)? toggleCredit,
    TResult Function(_Pay value)? pay,
    TResult Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _initialized implements NewPaymentEvent {
  const factory _initialized(
      {required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final User user,
      required final bool isMarketPlace}) = _$initializedImpl;

  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  User get user;
  bool get isMarketPlace;
  @JsonKey(ignore: true)
  _$$initializedImplCopyWith<_$initializedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchAvailablePaymentMethodsImplCopyWith<$Res> {
  factory _$$FetchAvailablePaymentMethodsImplCopyWith(
          _$FetchAvailablePaymentMethodsImpl value,
          $Res Function(_$FetchAvailablePaymentMethodsImpl) then) =
      __$$FetchAvailablePaymentMethodsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchAvailablePaymentMethodsImplCopyWithImpl<$Res>
    extends _$NewPaymentEventCopyWithImpl<$Res,
        _$FetchAvailablePaymentMethodsImpl>
    implements _$$FetchAvailablePaymentMethodsImplCopyWith<$Res> {
  __$$FetchAvailablePaymentMethodsImplCopyWithImpl(
      _$FetchAvailablePaymentMethodsImpl _value,
      $Res Function(_$FetchAvailablePaymentMethodsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchAvailablePaymentMethodsImpl
    implements _FetchAvailablePaymentMethods {
  const _$FetchAvailablePaymentMethodsImpl();

  @override
  String toString() {
    return 'NewPaymentEvent.fetchAvailablePaymentMethods()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAvailablePaymentMethodsImpl);
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
            bool isMarketPlace)
        initialized,
    required TResult Function() fetchAvailablePaymentMethods,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function() pay,
    required TResult Function(PaymentStatus paymentStatus) updatePaymentGateway,
    required TResult Function() fetchInvoiceInfoPdf,
    required TResult Function(Uint8List dataInvoicePdf) saveInvoicePdf,
    required TResult Function(NewPaymentMethod paymentMethodSelected)
        updatePaymentMethodSelected,
    required TResult Function(PaymentMethodOption paymentMethodOptionSelected)
        updatePaymentMethodOptionSelected,
    required TResult Function() createVirtualAccount,
    required TResult Function() getPrincipalCutoffs,
  }) {
    return fetchAvailablePaymentMethods();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult? Function()? fetchAvailablePaymentMethods,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function()? pay,
    TResult? Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult? Function()? fetchInvoiceInfoPdf,
    TResult? Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult? Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult? Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult? Function()? createVirtualAccount,
    TResult? Function()? getPrincipalCutoffs,
  }) {
    return fetchAvailablePaymentMethods?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult Function()? fetchAvailablePaymentMethods,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function()? pay,
    TResult Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult Function()? fetchInvoiceInfoPdf,
    TResult Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult Function()? createVirtualAccount,
    TResult Function()? getPrincipalCutoffs,
    required TResult orElse(),
  }) {
    if (fetchAvailablePaymentMethods != null) {
      return fetchAvailablePaymentMethods();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchAvailablePaymentMethods value)
        fetchAvailablePaymentMethods,
    required TResult Function(_SelectAllInvoices value) updateAllInvoices,
    required TResult Function(_ToggleInvoice value) toggleInvoice,
    required TResult Function(_SelectAllCredits value) updateAllCredits,
    required TResult Function(_ToggleCredit value) toggleCredit,
    required TResult Function(_Pay value) pay,
    required TResult Function(_UpdatePaymentGateway value) updatePaymentGateway,
    required TResult Function(_FetchInvoiceInfoPdf value) fetchInvoiceInfoPdf,
    required TResult Function(_SaveInvoicePdf value) saveInvoicePdf,
    required TResult Function(_UpdatePaymentMethodSelected value)
        updatePaymentMethodSelected,
    required TResult Function(_UpdatePaymentMethodOptionSelected value)
        updatePaymentMethodOptionSelected,
    required TResult Function(_CreateVirtualAccount value) createVirtualAccount,
    required TResult Function(_GetPrincipalCutoffs value) getPrincipalCutoffs,
  }) {
    return fetchAvailablePaymentMethods(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult? Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult? Function(_ToggleInvoice value)? toggleInvoice,
    TResult? Function(_SelectAllCredits value)? updateAllCredits,
    TResult? Function(_ToggleCredit value)? toggleCredit,
    TResult? Function(_Pay value)? pay,
    TResult? Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult? Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult? Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult? Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult? Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult? Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult? Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
  }) {
    return fetchAvailablePaymentMethods?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult Function(_ToggleInvoice value)? toggleInvoice,
    TResult Function(_SelectAllCredits value)? updateAllCredits,
    TResult Function(_ToggleCredit value)? toggleCredit,
    TResult Function(_Pay value)? pay,
    TResult Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
    required TResult orElse(),
  }) {
    if (fetchAvailablePaymentMethods != null) {
      return fetchAvailablePaymentMethods(this);
    }
    return orElse();
  }
}

abstract class _FetchAvailablePaymentMethods implements NewPaymentEvent {
  const factory _FetchAvailablePaymentMethods() =
      _$FetchAvailablePaymentMethodsImpl;
}

/// @nodoc
abstract class _$$SelectAllInvoicesImplCopyWith<$Res> {
  factory _$$SelectAllInvoicesImplCopyWith(_$SelectAllInvoicesImpl value,
          $Res Function(_$SelectAllInvoicesImpl) then) =
      __$$SelectAllInvoicesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CustomerOpenItem> items});
}

/// @nodoc
class __$$SelectAllInvoicesImplCopyWithImpl<$Res>
    extends _$NewPaymentEventCopyWithImpl<$Res, _$SelectAllInvoicesImpl>
    implements _$$SelectAllInvoicesImplCopyWith<$Res> {
  __$$SelectAllInvoicesImplCopyWithImpl(_$SelectAllInvoicesImpl _value,
      $Res Function(_$SelectAllInvoicesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$SelectAllInvoicesImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CustomerOpenItem>,
    ));
  }
}

/// @nodoc

class _$SelectAllInvoicesImpl implements _SelectAllInvoices {
  const _$SelectAllInvoicesImpl({required final List<CustomerOpenItem> items})
      : _items = items;

  final List<CustomerOpenItem> _items;
  @override
  List<CustomerOpenItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'NewPaymentEvent.updateAllInvoices(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectAllInvoicesImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectAllInvoicesImplCopyWith<_$SelectAllInvoicesImpl> get copyWith =>
      __$$SelectAllInvoicesImplCopyWithImpl<_$SelectAllInvoicesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)
        initialized,
    required TResult Function() fetchAvailablePaymentMethods,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function() pay,
    required TResult Function(PaymentStatus paymentStatus) updatePaymentGateway,
    required TResult Function() fetchInvoiceInfoPdf,
    required TResult Function(Uint8List dataInvoicePdf) saveInvoicePdf,
    required TResult Function(NewPaymentMethod paymentMethodSelected)
        updatePaymentMethodSelected,
    required TResult Function(PaymentMethodOption paymentMethodOptionSelected)
        updatePaymentMethodOptionSelected,
    required TResult Function() createVirtualAccount,
    required TResult Function() getPrincipalCutoffs,
  }) {
    return updateAllInvoices(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult? Function()? fetchAvailablePaymentMethods,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function()? pay,
    TResult? Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult? Function()? fetchInvoiceInfoPdf,
    TResult? Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult? Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult? Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult? Function()? createVirtualAccount,
    TResult? Function()? getPrincipalCutoffs,
  }) {
    return updateAllInvoices?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult Function()? fetchAvailablePaymentMethods,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function()? pay,
    TResult Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult Function()? fetchInvoiceInfoPdf,
    TResult Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult Function()? createVirtualAccount,
    TResult Function()? getPrincipalCutoffs,
    required TResult orElse(),
  }) {
    if (updateAllInvoices != null) {
      return updateAllInvoices(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchAvailablePaymentMethods value)
        fetchAvailablePaymentMethods,
    required TResult Function(_SelectAllInvoices value) updateAllInvoices,
    required TResult Function(_ToggleInvoice value) toggleInvoice,
    required TResult Function(_SelectAllCredits value) updateAllCredits,
    required TResult Function(_ToggleCredit value) toggleCredit,
    required TResult Function(_Pay value) pay,
    required TResult Function(_UpdatePaymentGateway value) updatePaymentGateway,
    required TResult Function(_FetchInvoiceInfoPdf value) fetchInvoiceInfoPdf,
    required TResult Function(_SaveInvoicePdf value) saveInvoicePdf,
    required TResult Function(_UpdatePaymentMethodSelected value)
        updatePaymentMethodSelected,
    required TResult Function(_UpdatePaymentMethodOptionSelected value)
        updatePaymentMethodOptionSelected,
    required TResult Function(_CreateVirtualAccount value) createVirtualAccount,
    required TResult Function(_GetPrincipalCutoffs value) getPrincipalCutoffs,
  }) {
    return updateAllInvoices(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult? Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult? Function(_ToggleInvoice value)? toggleInvoice,
    TResult? Function(_SelectAllCredits value)? updateAllCredits,
    TResult? Function(_ToggleCredit value)? toggleCredit,
    TResult? Function(_Pay value)? pay,
    TResult? Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult? Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult? Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult? Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult? Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult? Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult? Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
  }) {
    return updateAllInvoices?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult Function(_ToggleInvoice value)? toggleInvoice,
    TResult Function(_SelectAllCredits value)? updateAllCredits,
    TResult Function(_ToggleCredit value)? toggleCredit,
    TResult Function(_Pay value)? pay,
    TResult Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
    required TResult orElse(),
  }) {
    if (updateAllInvoices != null) {
      return updateAllInvoices(this);
    }
    return orElse();
  }
}

abstract class _SelectAllInvoices implements NewPaymentEvent {
  const factory _SelectAllInvoices(
      {required final List<CustomerOpenItem> items}) = _$SelectAllInvoicesImpl;

  List<CustomerOpenItem> get items;
  @JsonKey(ignore: true)
  _$$SelectAllInvoicesImplCopyWith<_$SelectAllInvoicesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleInvoiceImplCopyWith<$Res> {
  factory _$$ToggleInvoiceImplCopyWith(
          _$ToggleInvoiceImpl value, $Res Function(_$ToggleInvoiceImpl) then) =
      __$$ToggleInvoiceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CustomerOpenItem item, bool selected});

  $CustomerOpenItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$ToggleInvoiceImplCopyWithImpl<$Res>
    extends _$NewPaymentEventCopyWithImpl<$Res, _$ToggleInvoiceImpl>
    implements _$$ToggleInvoiceImplCopyWith<$Res> {
  __$$ToggleInvoiceImplCopyWithImpl(
      _$ToggleInvoiceImpl _value, $Res Function(_$ToggleInvoiceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? selected = null,
  }) {
    return _then(_$ToggleInvoiceImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as CustomerOpenItem,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerOpenItemCopyWith<$Res> get item {
    return $CustomerOpenItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$ToggleInvoiceImpl implements _ToggleInvoice {
  const _$ToggleInvoiceImpl({required this.item, required this.selected});

  @override
  final CustomerOpenItem item;
  @override
  final bool selected;

  @override
  String toString() {
    return 'NewPaymentEvent.toggleInvoice(item: $item, selected: $selected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleInvoiceImpl &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item, selected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleInvoiceImplCopyWith<_$ToggleInvoiceImpl> get copyWith =>
      __$$ToggleInvoiceImplCopyWithImpl<_$ToggleInvoiceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)
        initialized,
    required TResult Function() fetchAvailablePaymentMethods,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function() pay,
    required TResult Function(PaymentStatus paymentStatus) updatePaymentGateway,
    required TResult Function() fetchInvoiceInfoPdf,
    required TResult Function(Uint8List dataInvoicePdf) saveInvoicePdf,
    required TResult Function(NewPaymentMethod paymentMethodSelected)
        updatePaymentMethodSelected,
    required TResult Function(PaymentMethodOption paymentMethodOptionSelected)
        updatePaymentMethodOptionSelected,
    required TResult Function() createVirtualAccount,
    required TResult Function() getPrincipalCutoffs,
  }) {
    return toggleInvoice(item, selected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult? Function()? fetchAvailablePaymentMethods,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function()? pay,
    TResult? Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult? Function()? fetchInvoiceInfoPdf,
    TResult? Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult? Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult? Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult? Function()? createVirtualAccount,
    TResult? Function()? getPrincipalCutoffs,
  }) {
    return toggleInvoice?.call(item, selected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult Function()? fetchAvailablePaymentMethods,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function()? pay,
    TResult Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult Function()? fetchInvoiceInfoPdf,
    TResult Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult Function()? createVirtualAccount,
    TResult Function()? getPrincipalCutoffs,
    required TResult orElse(),
  }) {
    if (toggleInvoice != null) {
      return toggleInvoice(item, selected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchAvailablePaymentMethods value)
        fetchAvailablePaymentMethods,
    required TResult Function(_SelectAllInvoices value) updateAllInvoices,
    required TResult Function(_ToggleInvoice value) toggleInvoice,
    required TResult Function(_SelectAllCredits value) updateAllCredits,
    required TResult Function(_ToggleCredit value) toggleCredit,
    required TResult Function(_Pay value) pay,
    required TResult Function(_UpdatePaymentGateway value) updatePaymentGateway,
    required TResult Function(_FetchInvoiceInfoPdf value) fetchInvoiceInfoPdf,
    required TResult Function(_SaveInvoicePdf value) saveInvoicePdf,
    required TResult Function(_UpdatePaymentMethodSelected value)
        updatePaymentMethodSelected,
    required TResult Function(_UpdatePaymentMethodOptionSelected value)
        updatePaymentMethodOptionSelected,
    required TResult Function(_CreateVirtualAccount value) createVirtualAccount,
    required TResult Function(_GetPrincipalCutoffs value) getPrincipalCutoffs,
  }) {
    return toggleInvoice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult? Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult? Function(_ToggleInvoice value)? toggleInvoice,
    TResult? Function(_SelectAllCredits value)? updateAllCredits,
    TResult? Function(_ToggleCredit value)? toggleCredit,
    TResult? Function(_Pay value)? pay,
    TResult? Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult? Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult? Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult? Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult? Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult? Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult? Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
  }) {
    return toggleInvoice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult Function(_ToggleInvoice value)? toggleInvoice,
    TResult Function(_SelectAllCredits value)? updateAllCredits,
    TResult Function(_ToggleCredit value)? toggleCredit,
    TResult Function(_Pay value)? pay,
    TResult Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
    required TResult orElse(),
  }) {
    if (toggleInvoice != null) {
      return toggleInvoice(this);
    }
    return orElse();
  }
}

abstract class _ToggleInvoice implements NewPaymentEvent {
  const factory _ToggleInvoice(
      {required final CustomerOpenItem item,
      required final bool selected}) = _$ToggleInvoiceImpl;

  CustomerOpenItem get item;
  bool get selected;
  @JsonKey(ignore: true)
  _$$ToggleInvoiceImplCopyWith<_$ToggleInvoiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectAllCreditsImplCopyWith<$Res> {
  factory _$$SelectAllCreditsImplCopyWith(_$SelectAllCreditsImpl value,
          $Res Function(_$SelectAllCreditsImpl) then) =
      __$$SelectAllCreditsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CustomerOpenItem> items});
}

/// @nodoc
class __$$SelectAllCreditsImplCopyWithImpl<$Res>
    extends _$NewPaymentEventCopyWithImpl<$Res, _$SelectAllCreditsImpl>
    implements _$$SelectAllCreditsImplCopyWith<$Res> {
  __$$SelectAllCreditsImplCopyWithImpl(_$SelectAllCreditsImpl _value,
      $Res Function(_$SelectAllCreditsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$SelectAllCreditsImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CustomerOpenItem>,
    ));
  }
}

/// @nodoc

class _$SelectAllCreditsImpl implements _SelectAllCredits {
  const _$SelectAllCreditsImpl({required final List<CustomerOpenItem> items})
      : _items = items;

  final List<CustomerOpenItem> _items;
  @override
  List<CustomerOpenItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'NewPaymentEvent.updateAllCredits(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectAllCreditsImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectAllCreditsImplCopyWith<_$SelectAllCreditsImpl> get copyWith =>
      __$$SelectAllCreditsImplCopyWithImpl<_$SelectAllCreditsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)
        initialized,
    required TResult Function() fetchAvailablePaymentMethods,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function() pay,
    required TResult Function(PaymentStatus paymentStatus) updatePaymentGateway,
    required TResult Function() fetchInvoiceInfoPdf,
    required TResult Function(Uint8List dataInvoicePdf) saveInvoicePdf,
    required TResult Function(NewPaymentMethod paymentMethodSelected)
        updatePaymentMethodSelected,
    required TResult Function(PaymentMethodOption paymentMethodOptionSelected)
        updatePaymentMethodOptionSelected,
    required TResult Function() createVirtualAccount,
    required TResult Function() getPrincipalCutoffs,
  }) {
    return updateAllCredits(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult? Function()? fetchAvailablePaymentMethods,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function()? pay,
    TResult? Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult? Function()? fetchInvoiceInfoPdf,
    TResult? Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult? Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult? Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult? Function()? createVirtualAccount,
    TResult? Function()? getPrincipalCutoffs,
  }) {
    return updateAllCredits?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult Function()? fetchAvailablePaymentMethods,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function()? pay,
    TResult Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult Function()? fetchInvoiceInfoPdf,
    TResult Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult Function()? createVirtualAccount,
    TResult Function()? getPrincipalCutoffs,
    required TResult orElse(),
  }) {
    if (updateAllCredits != null) {
      return updateAllCredits(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchAvailablePaymentMethods value)
        fetchAvailablePaymentMethods,
    required TResult Function(_SelectAllInvoices value) updateAllInvoices,
    required TResult Function(_ToggleInvoice value) toggleInvoice,
    required TResult Function(_SelectAllCredits value) updateAllCredits,
    required TResult Function(_ToggleCredit value) toggleCredit,
    required TResult Function(_Pay value) pay,
    required TResult Function(_UpdatePaymentGateway value) updatePaymentGateway,
    required TResult Function(_FetchInvoiceInfoPdf value) fetchInvoiceInfoPdf,
    required TResult Function(_SaveInvoicePdf value) saveInvoicePdf,
    required TResult Function(_UpdatePaymentMethodSelected value)
        updatePaymentMethodSelected,
    required TResult Function(_UpdatePaymentMethodOptionSelected value)
        updatePaymentMethodOptionSelected,
    required TResult Function(_CreateVirtualAccount value) createVirtualAccount,
    required TResult Function(_GetPrincipalCutoffs value) getPrincipalCutoffs,
  }) {
    return updateAllCredits(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult? Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult? Function(_ToggleInvoice value)? toggleInvoice,
    TResult? Function(_SelectAllCredits value)? updateAllCredits,
    TResult? Function(_ToggleCredit value)? toggleCredit,
    TResult? Function(_Pay value)? pay,
    TResult? Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult? Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult? Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult? Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult? Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult? Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult? Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
  }) {
    return updateAllCredits?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult Function(_ToggleInvoice value)? toggleInvoice,
    TResult Function(_SelectAllCredits value)? updateAllCredits,
    TResult Function(_ToggleCredit value)? toggleCredit,
    TResult Function(_Pay value)? pay,
    TResult Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
    required TResult orElse(),
  }) {
    if (updateAllCredits != null) {
      return updateAllCredits(this);
    }
    return orElse();
  }
}

abstract class _SelectAllCredits implements NewPaymentEvent {
  const factory _SelectAllCredits(
      {required final List<CustomerOpenItem> items}) = _$SelectAllCreditsImpl;

  List<CustomerOpenItem> get items;
  @JsonKey(ignore: true)
  _$$SelectAllCreditsImplCopyWith<_$SelectAllCreditsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleCreditImplCopyWith<$Res> {
  factory _$$ToggleCreditImplCopyWith(
          _$ToggleCreditImpl value, $Res Function(_$ToggleCreditImpl) then) =
      __$$ToggleCreditImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CustomerOpenItem item, bool selected});

  $CustomerOpenItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$ToggleCreditImplCopyWithImpl<$Res>
    extends _$NewPaymentEventCopyWithImpl<$Res, _$ToggleCreditImpl>
    implements _$$ToggleCreditImplCopyWith<$Res> {
  __$$ToggleCreditImplCopyWithImpl(
      _$ToggleCreditImpl _value, $Res Function(_$ToggleCreditImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? selected = null,
  }) {
    return _then(_$ToggleCreditImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as CustomerOpenItem,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerOpenItemCopyWith<$Res> get item {
    return $CustomerOpenItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$ToggleCreditImpl implements _ToggleCredit {
  const _$ToggleCreditImpl({required this.item, required this.selected});

  @override
  final CustomerOpenItem item;
  @override
  final bool selected;

  @override
  String toString() {
    return 'NewPaymentEvent.toggleCredit(item: $item, selected: $selected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleCreditImpl &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item, selected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleCreditImplCopyWith<_$ToggleCreditImpl> get copyWith =>
      __$$ToggleCreditImplCopyWithImpl<_$ToggleCreditImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)
        initialized,
    required TResult Function() fetchAvailablePaymentMethods,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function() pay,
    required TResult Function(PaymentStatus paymentStatus) updatePaymentGateway,
    required TResult Function() fetchInvoiceInfoPdf,
    required TResult Function(Uint8List dataInvoicePdf) saveInvoicePdf,
    required TResult Function(NewPaymentMethod paymentMethodSelected)
        updatePaymentMethodSelected,
    required TResult Function(PaymentMethodOption paymentMethodOptionSelected)
        updatePaymentMethodOptionSelected,
    required TResult Function() createVirtualAccount,
    required TResult Function() getPrincipalCutoffs,
  }) {
    return toggleCredit(item, selected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult? Function()? fetchAvailablePaymentMethods,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function()? pay,
    TResult? Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult? Function()? fetchInvoiceInfoPdf,
    TResult? Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult? Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult? Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult? Function()? createVirtualAccount,
    TResult? Function()? getPrincipalCutoffs,
  }) {
    return toggleCredit?.call(item, selected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult Function()? fetchAvailablePaymentMethods,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function()? pay,
    TResult Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult Function()? fetchInvoiceInfoPdf,
    TResult Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult Function()? createVirtualAccount,
    TResult Function()? getPrincipalCutoffs,
    required TResult orElse(),
  }) {
    if (toggleCredit != null) {
      return toggleCredit(item, selected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchAvailablePaymentMethods value)
        fetchAvailablePaymentMethods,
    required TResult Function(_SelectAllInvoices value) updateAllInvoices,
    required TResult Function(_ToggleInvoice value) toggleInvoice,
    required TResult Function(_SelectAllCredits value) updateAllCredits,
    required TResult Function(_ToggleCredit value) toggleCredit,
    required TResult Function(_Pay value) pay,
    required TResult Function(_UpdatePaymentGateway value) updatePaymentGateway,
    required TResult Function(_FetchInvoiceInfoPdf value) fetchInvoiceInfoPdf,
    required TResult Function(_SaveInvoicePdf value) saveInvoicePdf,
    required TResult Function(_UpdatePaymentMethodSelected value)
        updatePaymentMethodSelected,
    required TResult Function(_UpdatePaymentMethodOptionSelected value)
        updatePaymentMethodOptionSelected,
    required TResult Function(_CreateVirtualAccount value) createVirtualAccount,
    required TResult Function(_GetPrincipalCutoffs value) getPrincipalCutoffs,
  }) {
    return toggleCredit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult? Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult? Function(_ToggleInvoice value)? toggleInvoice,
    TResult? Function(_SelectAllCredits value)? updateAllCredits,
    TResult? Function(_ToggleCredit value)? toggleCredit,
    TResult? Function(_Pay value)? pay,
    TResult? Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult? Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult? Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult? Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult? Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult? Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult? Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
  }) {
    return toggleCredit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult Function(_ToggleInvoice value)? toggleInvoice,
    TResult Function(_SelectAllCredits value)? updateAllCredits,
    TResult Function(_ToggleCredit value)? toggleCredit,
    TResult Function(_Pay value)? pay,
    TResult Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
    required TResult orElse(),
  }) {
    if (toggleCredit != null) {
      return toggleCredit(this);
    }
    return orElse();
  }
}

abstract class _ToggleCredit implements NewPaymentEvent {
  const factory _ToggleCredit(
      {required final CustomerOpenItem item,
      required final bool selected}) = _$ToggleCreditImpl;

  CustomerOpenItem get item;
  bool get selected;
  @JsonKey(ignore: true)
  _$$ToggleCreditImplCopyWith<_$ToggleCreditImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PayImplCopyWith<$Res> {
  factory _$$PayImplCopyWith(_$PayImpl value, $Res Function(_$PayImpl) then) =
      __$$PayImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PayImplCopyWithImpl<$Res>
    extends _$NewPaymentEventCopyWithImpl<$Res, _$PayImpl>
    implements _$$PayImplCopyWith<$Res> {
  __$$PayImplCopyWithImpl(_$PayImpl _value, $Res Function(_$PayImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PayImpl implements _Pay {
  const _$PayImpl();

  @override
  String toString() {
    return 'NewPaymentEvent.pay()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PayImpl);
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
            bool isMarketPlace)
        initialized,
    required TResult Function() fetchAvailablePaymentMethods,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function() pay,
    required TResult Function(PaymentStatus paymentStatus) updatePaymentGateway,
    required TResult Function() fetchInvoiceInfoPdf,
    required TResult Function(Uint8List dataInvoicePdf) saveInvoicePdf,
    required TResult Function(NewPaymentMethod paymentMethodSelected)
        updatePaymentMethodSelected,
    required TResult Function(PaymentMethodOption paymentMethodOptionSelected)
        updatePaymentMethodOptionSelected,
    required TResult Function() createVirtualAccount,
    required TResult Function() getPrincipalCutoffs,
  }) {
    return pay();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult? Function()? fetchAvailablePaymentMethods,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function()? pay,
    TResult? Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult? Function()? fetchInvoiceInfoPdf,
    TResult? Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult? Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult? Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult? Function()? createVirtualAccount,
    TResult? Function()? getPrincipalCutoffs,
  }) {
    return pay?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult Function()? fetchAvailablePaymentMethods,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function()? pay,
    TResult Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult Function()? fetchInvoiceInfoPdf,
    TResult Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult Function()? createVirtualAccount,
    TResult Function()? getPrincipalCutoffs,
    required TResult orElse(),
  }) {
    if (pay != null) {
      return pay();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchAvailablePaymentMethods value)
        fetchAvailablePaymentMethods,
    required TResult Function(_SelectAllInvoices value) updateAllInvoices,
    required TResult Function(_ToggleInvoice value) toggleInvoice,
    required TResult Function(_SelectAllCredits value) updateAllCredits,
    required TResult Function(_ToggleCredit value) toggleCredit,
    required TResult Function(_Pay value) pay,
    required TResult Function(_UpdatePaymentGateway value) updatePaymentGateway,
    required TResult Function(_FetchInvoiceInfoPdf value) fetchInvoiceInfoPdf,
    required TResult Function(_SaveInvoicePdf value) saveInvoicePdf,
    required TResult Function(_UpdatePaymentMethodSelected value)
        updatePaymentMethodSelected,
    required TResult Function(_UpdatePaymentMethodOptionSelected value)
        updatePaymentMethodOptionSelected,
    required TResult Function(_CreateVirtualAccount value) createVirtualAccount,
    required TResult Function(_GetPrincipalCutoffs value) getPrincipalCutoffs,
  }) {
    return pay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult? Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult? Function(_ToggleInvoice value)? toggleInvoice,
    TResult? Function(_SelectAllCredits value)? updateAllCredits,
    TResult? Function(_ToggleCredit value)? toggleCredit,
    TResult? Function(_Pay value)? pay,
    TResult? Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult? Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult? Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult? Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult? Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult? Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult? Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
  }) {
    return pay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult Function(_ToggleInvoice value)? toggleInvoice,
    TResult Function(_SelectAllCredits value)? updateAllCredits,
    TResult Function(_ToggleCredit value)? toggleCredit,
    TResult Function(_Pay value)? pay,
    TResult Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
    required TResult orElse(),
  }) {
    if (pay != null) {
      return pay(this);
    }
    return orElse();
  }
}

abstract class _Pay implements NewPaymentEvent {
  const factory _Pay() = _$PayImpl;
}

/// @nodoc
abstract class _$$UpdatePaymentGatewayImplCopyWith<$Res> {
  factory _$$UpdatePaymentGatewayImplCopyWith(_$UpdatePaymentGatewayImpl value,
          $Res Function(_$UpdatePaymentGatewayImpl) then) =
      __$$UpdatePaymentGatewayImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentStatus paymentStatus});

  $PaymentStatusCopyWith<$Res> get paymentStatus;
}

/// @nodoc
class __$$UpdatePaymentGatewayImplCopyWithImpl<$Res>
    extends _$NewPaymentEventCopyWithImpl<$Res, _$UpdatePaymentGatewayImpl>
    implements _$$UpdatePaymentGatewayImplCopyWith<$Res> {
  __$$UpdatePaymentGatewayImplCopyWithImpl(_$UpdatePaymentGatewayImpl _value,
      $Res Function(_$UpdatePaymentGatewayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentStatus = null,
  }) {
    return _then(_$UpdatePaymentGatewayImpl(
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as PaymentStatus,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentStatusCopyWith<$Res> get paymentStatus {
    return $PaymentStatusCopyWith<$Res>(_value.paymentStatus, (value) {
      return _then(_value.copyWith(paymentStatus: value));
    });
  }
}

/// @nodoc

class _$UpdatePaymentGatewayImpl implements _UpdatePaymentGateway {
  const _$UpdatePaymentGatewayImpl({required this.paymentStatus});

  @override
  final PaymentStatus paymentStatus;

  @override
  String toString() {
    return 'NewPaymentEvent.updatePaymentGateway(paymentStatus: $paymentStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePaymentGatewayImpl &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePaymentGatewayImplCopyWith<_$UpdatePaymentGatewayImpl>
      get copyWith =>
          __$$UpdatePaymentGatewayImplCopyWithImpl<_$UpdatePaymentGatewayImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)
        initialized,
    required TResult Function() fetchAvailablePaymentMethods,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function() pay,
    required TResult Function(PaymentStatus paymentStatus) updatePaymentGateway,
    required TResult Function() fetchInvoiceInfoPdf,
    required TResult Function(Uint8List dataInvoicePdf) saveInvoicePdf,
    required TResult Function(NewPaymentMethod paymentMethodSelected)
        updatePaymentMethodSelected,
    required TResult Function(PaymentMethodOption paymentMethodOptionSelected)
        updatePaymentMethodOptionSelected,
    required TResult Function() createVirtualAccount,
    required TResult Function() getPrincipalCutoffs,
  }) {
    return updatePaymentGateway(paymentStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult? Function()? fetchAvailablePaymentMethods,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function()? pay,
    TResult? Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult? Function()? fetchInvoiceInfoPdf,
    TResult? Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult? Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult? Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult? Function()? createVirtualAccount,
    TResult? Function()? getPrincipalCutoffs,
  }) {
    return updatePaymentGateway?.call(paymentStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult Function()? fetchAvailablePaymentMethods,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function()? pay,
    TResult Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult Function()? fetchInvoiceInfoPdf,
    TResult Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult Function()? createVirtualAccount,
    TResult Function()? getPrincipalCutoffs,
    required TResult orElse(),
  }) {
    if (updatePaymentGateway != null) {
      return updatePaymentGateway(paymentStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchAvailablePaymentMethods value)
        fetchAvailablePaymentMethods,
    required TResult Function(_SelectAllInvoices value) updateAllInvoices,
    required TResult Function(_ToggleInvoice value) toggleInvoice,
    required TResult Function(_SelectAllCredits value) updateAllCredits,
    required TResult Function(_ToggleCredit value) toggleCredit,
    required TResult Function(_Pay value) pay,
    required TResult Function(_UpdatePaymentGateway value) updatePaymentGateway,
    required TResult Function(_FetchInvoiceInfoPdf value) fetchInvoiceInfoPdf,
    required TResult Function(_SaveInvoicePdf value) saveInvoicePdf,
    required TResult Function(_UpdatePaymentMethodSelected value)
        updatePaymentMethodSelected,
    required TResult Function(_UpdatePaymentMethodOptionSelected value)
        updatePaymentMethodOptionSelected,
    required TResult Function(_CreateVirtualAccount value) createVirtualAccount,
    required TResult Function(_GetPrincipalCutoffs value) getPrincipalCutoffs,
  }) {
    return updatePaymentGateway(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult? Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult? Function(_ToggleInvoice value)? toggleInvoice,
    TResult? Function(_SelectAllCredits value)? updateAllCredits,
    TResult? Function(_ToggleCredit value)? toggleCredit,
    TResult? Function(_Pay value)? pay,
    TResult? Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult? Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult? Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult? Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult? Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult? Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult? Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
  }) {
    return updatePaymentGateway?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult Function(_ToggleInvoice value)? toggleInvoice,
    TResult Function(_SelectAllCredits value)? updateAllCredits,
    TResult Function(_ToggleCredit value)? toggleCredit,
    TResult Function(_Pay value)? pay,
    TResult Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
    required TResult orElse(),
  }) {
    if (updatePaymentGateway != null) {
      return updatePaymentGateway(this);
    }
    return orElse();
  }
}

abstract class _UpdatePaymentGateway implements NewPaymentEvent {
  const factory _UpdatePaymentGateway(
          {required final PaymentStatus paymentStatus}) =
      _$UpdatePaymentGatewayImpl;

  PaymentStatus get paymentStatus;
  @JsonKey(ignore: true)
  _$$UpdatePaymentGatewayImplCopyWith<_$UpdatePaymentGatewayImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchInvoiceInfoPdfImplCopyWith<$Res> {
  factory _$$FetchInvoiceInfoPdfImplCopyWith(_$FetchInvoiceInfoPdfImpl value,
          $Res Function(_$FetchInvoiceInfoPdfImpl) then) =
      __$$FetchInvoiceInfoPdfImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchInvoiceInfoPdfImplCopyWithImpl<$Res>
    extends _$NewPaymentEventCopyWithImpl<$Res, _$FetchInvoiceInfoPdfImpl>
    implements _$$FetchInvoiceInfoPdfImplCopyWith<$Res> {
  __$$FetchInvoiceInfoPdfImplCopyWithImpl(_$FetchInvoiceInfoPdfImpl _value,
      $Res Function(_$FetchInvoiceInfoPdfImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchInvoiceInfoPdfImpl implements _FetchInvoiceInfoPdf {
  const _$FetchInvoiceInfoPdfImpl();

  @override
  String toString() {
    return 'NewPaymentEvent.fetchInvoiceInfoPdf()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchInvoiceInfoPdfImpl);
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
            bool isMarketPlace)
        initialized,
    required TResult Function() fetchAvailablePaymentMethods,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function() pay,
    required TResult Function(PaymentStatus paymentStatus) updatePaymentGateway,
    required TResult Function() fetchInvoiceInfoPdf,
    required TResult Function(Uint8List dataInvoicePdf) saveInvoicePdf,
    required TResult Function(NewPaymentMethod paymentMethodSelected)
        updatePaymentMethodSelected,
    required TResult Function(PaymentMethodOption paymentMethodOptionSelected)
        updatePaymentMethodOptionSelected,
    required TResult Function() createVirtualAccount,
    required TResult Function() getPrincipalCutoffs,
  }) {
    return fetchInvoiceInfoPdf();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult? Function()? fetchAvailablePaymentMethods,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function()? pay,
    TResult? Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult? Function()? fetchInvoiceInfoPdf,
    TResult? Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult? Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult? Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult? Function()? createVirtualAccount,
    TResult? Function()? getPrincipalCutoffs,
  }) {
    return fetchInvoiceInfoPdf?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult Function()? fetchAvailablePaymentMethods,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function()? pay,
    TResult Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult Function()? fetchInvoiceInfoPdf,
    TResult Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult Function()? createVirtualAccount,
    TResult Function()? getPrincipalCutoffs,
    required TResult orElse(),
  }) {
    if (fetchInvoiceInfoPdf != null) {
      return fetchInvoiceInfoPdf();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchAvailablePaymentMethods value)
        fetchAvailablePaymentMethods,
    required TResult Function(_SelectAllInvoices value) updateAllInvoices,
    required TResult Function(_ToggleInvoice value) toggleInvoice,
    required TResult Function(_SelectAllCredits value) updateAllCredits,
    required TResult Function(_ToggleCredit value) toggleCredit,
    required TResult Function(_Pay value) pay,
    required TResult Function(_UpdatePaymentGateway value) updatePaymentGateway,
    required TResult Function(_FetchInvoiceInfoPdf value) fetchInvoiceInfoPdf,
    required TResult Function(_SaveInvoicePdf value) saveInvoicePdf,
    required TResult Function(_UpdatePaymentMethodSelected value)
        updatePaymentMethodSelected,
    required TResult Function(_UpdatePaymentMethodOptionSelected value)
        updatePaymentMethodOptionSelected,
    required TResult Function(_CreateVirtualAccount value) createVirtualAccount,
    required TResult Function(_GetPrincipalCutoffs value) getPrincipalCutoffs,
  }) {
    return fetchInvoiceInfoPdf(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult? Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult? Function(_ToggleInvoice value)? toggleInvoice,
    TResult? Function(_SelectAllCredits value)? updateAllCredits,
    TResult? Function(_ToggleCredit value)? toggleCredit,
    TResult? Function(_Pay value)? pay,
    TResult? Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult? Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult? Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult? Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult? Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult? Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult? Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
  }) {
    return fetchInvoiceInfoPdf?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult Function(_ToggleInvoice value)? toggleInvoice,
    TResult Function(_SelectAllCredits value)? updateAllCredits,
    TResult Function(_ToggleCredit value)? toggleCredit,
    TResult Function(_Pay value)? pay,
    TResult Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
    required TResult orElse(),
  }) {
    if (fetchInvoiceInfoPdf != null) {
      return fetchInvoiceInfoPdf(this);
    }
    return orElse();
  }
}

abstract class _FetchInvoiceInfoPdf implements NewPaymentEvent {
  const factory _FetchInvoiceInfoPdf() = _$FetchInvoiceInfoPdfImpl;
}

/// @nodoc
abstract class _$$SaveInvoicePdfImplCopyWith<$Res> {
  factory _$$SaveInvoicePdfImplCopyWith(_$SaveInvoicePdfImpl value,
          $Res Function(_$SaveInvoicePdfImpl) then) =
      __$$SaveInvoicePdfImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Uint8List dataInvoicePdf});
}

/// @nodoc
class __$$SaveInvoicePdfImplCopyWithImpl<$Res>
    extends _$NewPaymentEventCopyWithImpl<$Res, _$SaveInvoicePdfImpl>
    implements _$$SaveInvoicePdfImplCopyWith<$Res> {
  __$$SaveInvoicePdfImplCopyWithImpl(
      _$SaveInvoicePdfImpl _value, $Res Function(_$SaveInvoicePdfImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataInvoicePdf = null,
  }) {
    return _then(_$SaveInvoicePdfImpl(
      dataInvoicePdf: null == dataInvoicePdf
          ? _value.dataInvoicePdf
          : dataInvoicePdf // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class _$SaveInvoicePdfImpl implements _SaveInvoicePdf {
  const _$SaveInvoicePdfImpl({required this.dataInvoicePdf});

  @override
  final Uint8List dataInvoicePdf;

  @override
  String toString() {
    return 'NewPaymentEvent.saveInvoicePdf(dataInvoicePdf: $dataInvoicePdf)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveInvoicePdfImpl &&
            const DeepCollectionEquality()
                .equals(other.dataInvoicePdf, dataInvoicePdf));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(dataInvoicePdf));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveInvoicePdfImplCopyWith<_$SaveInvoicePdfImpl> get copyWith =>
      __$$SaveInvoicePdfImplCopyWithImpl<_$SaveInvoicePdfImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)
        initialized,
    required TResult Function() fetchAvailablePaymentMethods,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function() pay,
    required TResult Function(PaymentStatus paymentStatus) updatePaymentGateway,
    required TResult Function() fetchInvoiceInfoPdf,
    required TResult Function(Uint8List dataInvoicePdf) saveInvoicePdf,
    required TResult Function(NewPaymentMethod paymentMethodSelected)
        updatePaymentMethodSelected,
    required TResult Function(PaymentMethodOption paymentMethodOptionSelected)
        updatePaymentMethodOptionSelected,
    required TResult Function() createVirtualAccount,
    required TResult Function() getPrincipalCutoffs,
  }) {
    return saveInvoicePdf(dataInvoicePdf);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult? Function()? fetchAvailablePaymentMethods,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function()? pay,
    TResult? Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult? Function()? fetchInvoiceInfoPdf,
    TResult? Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult? Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult? Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult? Function()? createVirtualAccount,
    TResult? Function()? getPrincipalCutoffs,
  }) {
    return saveInvoicePdf?.call(dataInvoicePdf);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult Function()? fetchAvailablePaymentMethods,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function()? pay,
    TResult Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult Function()? fetchInvoiceInfoPdf,
    TResult Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult Function()? createVirtualAccount,
    TResult Function()? getPrincipalCutoffs,
    required TResult orElse(),
  }) {
    if (saveInvoicePdf != null) {
      return saveInvoicePdf(dataInvoicePdf);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchAvailablePaymentMethods value)
        fetchAvailablePaymentMethods,
    required TResult Function(_SelectAllInvoices value) updateAllInvoices,
    required TResult Function(_ToggleInvoice value) toggleInvoice,
    required TResult Function(_SelectAllCredits value) updateAllCredits,
    required TResult Function(_ToggleCredit value) toggleCredit,
    required TResult Function(_Pay value) pay,
    required TResult Function(_UpdatePaymentGateway value) updatePaymentGateway,
    required TResult Function(_FetchInvoiceInfoPdf value) fetchInvoiceInfoPdf,
    required TResult Function(_SaveInvoicePdf value) saveInvoicePdf,
    required TResult Function(_UpdatePaymentMethodSelected value)
        updatePaymentMethodSelected,
    required TResult Function(_UpdatePaymentMethodOptionSelected value)
        updatePaymentMethodOptionSelected,
    required TResult Function(_CreateVirtualAccount value) createVirtualAccount,
    required TResult Function(_GetPrincipalCutoffs value) getPrincipalCutoffs,
  }) {
    return saveInvoicePdf(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult? Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult? Function(_ToggleInvoice value)? toggleInvoice,
    TResult? Function(_SelectAllCredits value)? updateAllCredits,
    TResult? Function(_ToggleCredit value)? toggleCredit,
    TResult? Function(_Pay value)? pay,
    TResult? Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult? Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult? Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult? Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult? Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult? Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult? Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
  }) {
    return saveInvoicePdf?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult Function(_ToggleInvoice value)? toggleInvoice,
    TResult Function(_SelectAllCredits value)? updateAllCredits,
    TResult Function(_ToggleCredit value)? toggleCredit,
    TResult Function(_Pay value)? pay,
    TResult Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
    required TResult orElse(),
  }) {
    if (saveInvoicePdf != null) {
      return saveInvoicePdf(this);
    }
    return orElse();
  }
}

abstract class _SaveInvoicePdf implements NewPaymentEvent {
  const factory _SaveInvoicePdf({required final Uint8List dataInvoicePdf}) =
      _$SaveInvoicePdfImpl;

  Uint8List get dataInvoicePdf;
  @JsonKey(ignore: true)
  _$$SaveInvoicePdfImplCopyWith<_$SaveInvoicePdfImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePaymentMethodSelectedImplCopyWith<$Res> {
  factory _$$UpdatePaymentMethodSelectedImplCopyWith(
          _$UpdatePaymentMethodSelectedImpl value,
          $Res Function(_$UpdatePaymentMethodSelectedImpl) then) =
      __$$UpdatePaymentMethodSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NewPaymentMethod paymentMethodSelected});

  $NewPaymentMethodCopyWith<$Res> get paymentMethodSelected;
}

/// @nodoc
class __$$UpdatePaymentMethodSelectedImplCopyWithImpl<$Res>
    extends _$NewPaymentEventCopyWithImpl<$Res,
        _$UpdatePaymentMethodSelectedImpl>
    implements _$$UpdatePaymentMethodSelectedImplCopyWith<$Res> {
  __$$UpdatePaymentMethodSelectedImplCopyWithImpl(
      _$UpdatePaymentMethodSelectedImpl _value,
      $Res Function(_$UpdatePaymentMethodSelectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethodSelected = null,
  }) {
    return _then(_$UpdatePaymentMethodSelectedImpl(
      paymentMethodSelected: null == paymentMethodSelected
          ? _value.paymentMethodSelected
          : paymentMethodSelected // ignore: cast_nullable_to_non_nullable
              as NewPaymentMethod,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $NewPaymentMethodCopyWith<$Res> get paymentMethodSelected {
    return $NewPaymentMethodCopyWith<$Res>(_value.paymentMethodSelected,
        (value) {
      return _then(_value.copyWith(paymentMethodSelected: value));
    });
  }
}

/// @nodoc

class _$UpdatePaymentMethodSelectedImpl
    implements _UpdatePaymentMethodSelected {
  const _$UpdatePaymentMethodSelectedImpl(
      {required this.paymentMethodSelected});

  @override
  final NewPaymentMethod paymentMethodSelected;

  @override
  String toString() {
    return 'NewPaymentEvent.updatePaymentMethodSelected(paymentMethodSelected: $paymentMethodSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePaymentMethodSelectedImpl &&
            (identical(other.paymentMethodSelected, paymentMethodSelected) ||
                other.paymentMethodSelected == paymentMethodSelected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentMethodSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePaymentMethodSelectedImplCopyWith<_$UpdatePaymentMethodSelectedImpl>
      get copyWith => __$$UpdatePaymentMethodSelectedImplCopyWithImpl<
          _$UpdatePaymentMethodSelectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)
        initialized,
    required TResult Function() fetchAvailablePaymentMethods,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function() pay,
    required TResult Function(PaymentStatus paymentStatus) updatePaymentGateway,
    required TResult Function() fetchInvoiceInfoPdf,
    required TResult Function(Uint8List dataInvoicePdf) saveInvoicePdf,
    required TResult Function(NewPaymentMethod paymentMethodSelected)
        updatePaymentMethodSelected,
    required TResult Function(PaymentMethodOption paymentMethodOptionSelected)
        updatePaymentMethodOptionSelected,
    required TResult Function() createVirtualAccount,
    required TResult Function() getPrincipalCutoffs,
  }) {
    return updatePaymentMethodSelected(paymentMethodSelected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult? Function()? fetchAvailablePaymentMethods,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function()? pay,
    TResult? Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult? Function()? fetchInvoiceInfoPdf,
    TResult? Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult? Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult? Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult? Function()? createVirtualAccount,
    TResult? Function()? getPrincipalCutoffs,
  }) {
    return updatePaymentMethodSelected?.call(paymentMethodSelected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult Function()? fetchAvailablePaymentMethods,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function()? pay,
    TResult Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult Function()? fetchInvoiceInfoPdf,
    TResult Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult Function()? createVirtualAccount,
    TResult Function()? getPrincipalCutoffs,
    required TResult orElse(),
  }) {
    if (updatePaymentMethodSelected != null) {
      return updatePaymentMethodSelected(paymentMethodSelected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchAvailablePaymentMethods value)
        fetchAvailablePaymentMethods,
    required TResult Function(_SelectAllInvoices value) updateAllInvoices,
    required TResult Function(_ToggleInvoice value) toggleInvoice,
    required TResult Function(_SelectAllCredits value) updateAllCredits,
    required TResult Function(_ToggleCredit value) toggleCredit,
    required TResult Function(_Pay value) pay,
    required TResult Function(_UpdatePaymentGateway value) updatePaymentGateway,
    required TResult Function(_FetchInvoiceInfoPdf value) fetchInvoiceInfoPdf,
    required TResult Function(_SaveInvoicePdf value) saveInvoicePdf,
    required TResult Function(_UpdatePaymentMethodSelected value)
        updatePaymentMethodSelected,
    required TResult Function(_UpdatePaymentMethodOptionSelected value)
        updatePaymentMethodOptionSelected,
    required TResult Function(_CreateVirtualAccount value) createVirtualAccount,
    required TResult Function(_GetPrincipalCutoffs value) getPrincipalCutoffs,
  }) {
    return updatePaymentMethodSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult? Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult? Function(_ToggleInvoice value)? toggleInvoice,
    TResult? Function(_SelectAllCredits value)? updateAllCredits,
    TResult? Function(_ToggleCredit value)? toggleCredit,
    TResult? Function(_Pay value)? pay,
    TResult? Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult? Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult? Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult? Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult? Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult? Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult? Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
  }) {
    return updatePaymentMethodSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult Function(_ToggleInvoice value)? toggleInvoice,
    TResult Function(_SelectAllCredits value)? updateAllCredits,
    TResult Function(_ToggleCredit value)? toggleCredit,
    TResult Function(_Pay value)? pay,
    TResult Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
    required TResult orElse(),
  }) {
    if (updatePaymentMethodSelected != null) {
      return updatePaymentMethodSelected(this);
    }
    return orElse();
  }
}

abstract class _UpdatePaymentMethodSelected implements NewPaymentEvent {
  const factory _UpdatePaymentMethodSelected(
          {required final NewPaymentMethod paymentMethodSelected}) =
      _$UpdatePaymentMethodSelectedImpl;

  NewPaymentMethod get paymentMethodSelected;
  @JsonKey(ignore: true)
  _$$UpdatePaymentMethodSelectedImplCopyWith<_$UpdatePaymentMethodSelectedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePaymentMethodOptionSelectedImplCopyWith<$Res> {
  factory _$$UpdatePaymentMethodOptionSelectedImplCopyWith(
          _$UpdatePaymentMethodOptionSelectedImpl value,
          $Res Function(_$UpdatePaymentMethodOptionSelectedImpl) then) =
      __$$UpdatePaymentMethodOptionSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentMethodOption paymentMethodOptionSelected});

  $PaymentMethodOptionCopyWith<$Res> get paymentMethodOptionSelected;
}

/// @nodoc
class __$$UpdatePaymentMethodOptionSelectedImplCopyWithImpl<$Res>
    extends _$NewPaymentEventCopyWithImpl<$Res,
        _$UpdatePaymentMethodOptionSelectedImpl>
    implements _$$UpdatePaymentMethodOptionSelectedImplCopyWith<$Res> {
  __$$UpdatePaymentMethodOptionSelectedImplCopyWithImpl(
      _$UpdatePaymentMethodOptionSelectedImpl _value,
      $Res Function(_$UpdatePaymentMethodOptionSelectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethodOptionSelected = null,
  }) {
    return _then(_$UpdatePaymentMethodOptionSelectedImpl(
      paymentMethodOptionSelected: null == paymentMethodOptionSelected
          ? _value.paymentMethodOptionSelected
          : paymentMethodOptionSelected // ignore: cast_nullable_to_non_nullable
              as PaymentMethodOption,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentMethodOptionCopyWith<$Res> get paymentMethodOptionSelected {
    return $PaymentMethodOptionCopyWith<$Res>(
        _value.paymentMethodOptionSelected, (value) {
      return _then(_value.copyWith(paymentMethodOptionSelected: value));
    });
  }
}

/// @nodoc

class _$UpdatePaymentMethodOptionSelectedImpl
    implements _UpdatePaymentMethodOptionSelected {
  const _$UpdatePaymentMethodOptionSelectedImpl(
      {required this.paymentMethodOptionSelected});

  @override
  final PaymentMethodOption paymentMethodOptionSelected;

  @override
  String toString() {
    return 'NewPaymentEvent.updatePaymentMethodOptionSelected(paymentMethodOptionSelected: $paymentMethodOptionSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePaymentMethodOptionSelectedImpl &&
            (identical(other.paymentMethodOptionSelected,
                    paymentMethodOptionSelected) ||
                other.paymentMethodOptionSelected ==
                    paymentMethodOptionSelected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentMethodOptionSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePaymentMethodOptionSelectedImplCopyWith<
          _$UpdatePaymentMethodOptionSelectedImpl>
      get copyWith => __$$UpdatePaymentMethodOptionSelectedImplCopyWithImpl<
          _$UpdatePaymentMethodOptionSelectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)
        initialized,
    required TResult Function() fetchAvailablePaymentMethods,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function() pay,
    required TResult Function(PaymentStatus paymentStatus) updatePaymentGateway,
    required TResult Function() fetchInvoiceInfoPdf,
    required TResult Function(Uint8List dataInvoicePdf) saveInvoicePdf,
    required TResult Function(NewPaymentMethod paymentMethodSelected)
        updatePaymentMethodSelected,
    required TResult Function(PaymentMethodOption paymentMethodOptionSelected)
        updatePaymentMethodOptionSelected,
    required TResult Function() createVirtualAccount,
    required TResult Function() getPrincipalCutoffs,
  }) {
    return updatePaymentMethodOptionSelected(paymentMethodOptionSelected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult? Function()? fetchAvailablePaymentMethods,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function()? pay,
    TResult? Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult? Function()? fetchInvoiceInfoPdf,
    TResult? Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult? Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult? Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult? Function()? createVirtualAccount,
    TResult? Function()? getPrincipalCutoffs,
  }) {
    return updatePaymentMethodOptionSelected?.call(paymentMethodOptionSelected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult Function()? fetchAvailablePaymentMethods,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function()? pay,
    TResult Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult Function()? fetchInvoiceInfoPdf,
    TResult Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult Function()? createVirtualAccount,
    TResult Function()? getPrincipalCutoffs,
    required TResult orElse(),
  }) {
    if (updatePaymentMethodOptionSelected != null) {
      return updatePaymentMethodOptionSelected(paymentMethodOptionSelected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchAvailablePaymentMethods value)
        fetchAvailablePaymentMethods,
    required TResult Function(_SelectAllInvoices value) updateAllInvoices,
    required TResult Function(_ToggleInvoice value) toggleInvoice,
    required TResult Function(_SelectAllCredits value) updateAllCredits,
    required TResult Function(_ToggleCredit value) toggleCredit,
    required TResult Function(_Pay value) pay,
    required TResult Function(_UpdatePaymentGateway value) updatePaymentGateway,
    required TResult Function(_FetchInvoiceInfoPdf value) fetchInvoiceInfoPdf,
    required TResult Function(_SaveInvoicePdf value) saveInvoicePdf,
    required TResult Function(_UpdatePaymentMethodSelected value)
        updatePaymentMethodSelected,
    required TResult Function(_UpdatePaymentMethodOptionSelected value)
        updatePaymentMethodOptionSelected,
    required TResult Function(_CreateVirtualAccount value) createVirtualAccount,
    required TResult Function(_GetPrincipalCutoffs value) getPrincipalCutoffs,
  }) {
    return updatePaymentMethodOptionSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult? Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult? Function(_ToggleInvoice value)? toggleInvoice,
    TResult? Function(_SelectAllCredits value)? updateAllCredits,
    TResult? Function(_ToggleCredit value)? toggleCredit,
    TResult? Function(_Pay value)? pay,
    TResult? Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult? Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult? Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult? Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult? Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult? Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult? Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
  }) {
    return updatePaymentMethodOptionSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult Function(_ToggleInvoice value)? toggleInvoice,
    TResult Function(_SelectAllCredits value)? updateAllCredits,
    TResult Function(_ToggleCredit value)? toggleCredit,
    TResult Function(_Pay value)? pay,
    TResult Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
    required TResult orElse(),
  }) {
    if (updatePaymentMethodOptionSelected != null) {
      return updatePaymentMethodOptionSelected(this);
    }
    return orElse();
  }
}

abstract class _UpdatePaymentMethodOptionSelected implements NewPaymentEvent {
  const factory _UpdatePaymentMethodOptionSelected(
          {required final PaymentMethodOption paymentMethodOptionSelected}) =
      _$UpdatePaymentMethodOptionSelectedImpl;

  PaymentMethodOption get paymentMethodOptionSelected;
  @JsonKey(ignore: true)
  _$$UpdatePaymentMethodOptionSelectedImplCopyWith<
          _$UpdatePaymentMethodOptionSelectedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateVirtualAccountImplCopyWith<$Res> {
  factory _$$CreateVirtualAccountImplCopyWith(_$CreateVirtualAccountImpl value,
          $Res Function(_$CreateVirtualAccountImpl) then) =
      __$$CreateVirtualAccountImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateVirtualAccountImplCopyWithImpl<$Res>
    extends _$NewPaymentEventCopyWithImpl<$Res, _$CreateVirtualAccountImpl>
    implements _$$CreateVirtualAccountImplCopyWith<$Res> {
  __$$CreateVirtualAccountImplCopyWithImpl(_$CreateVirtualAccountImpl _value,
      $Res Function(_$CreateVirtualAccountImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateVirtualAccountImpl implements _CreateVirtualAccount {
  const _$CreateVirtualAccountImpl();

  @override
  String toString() {
    return 'NewPaymentEvent.createVirtualAccount()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateVirtualAccountImpl);
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
            bool isMarketPlace)
        initialized,
    required TResult Function() fetchAvailablePaymentMethods,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function() pay,
    required TResult Function(PaymentStatus paymentStatus) updatePaymentGateway,
    required TResult Function() fetchInvoiceInfoPdf,
    required TResult Function(Uint8List dataInvoicePdf) saveInvoicePdf,
    required TResult Function(NewPaymentMethod paymentMethodSelected)
        updatePaymentMethodSelected,
    required TResult Function(PaymentMethodOption paymentMethodOptionSelected)
        updatePaymentMethodOptionSelected,
    required TResult Function() createVirtualAccount,
    required TResult Function() getPrincipalCutoffs,
  }) {
    return createVirtualAccount();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult? Function()? fetchAvailablePaymentMethods,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function()? pay,
    TResult? Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult? Function()? fetchInvoiceInfoPdf,
    TResult? Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult? Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult? Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult? Function()? createVirtualAccount,
    TResult? Function()? getPrincipalCutoffs,
  }) {
    return createVirtualAccount?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult Function()? fetchAvailablePaymentMethods,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function()? pay,
    TResult Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult Function()? fetchInvoiceInfoPdf,
    TResult Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult Function()? createVirtualAccount,
    TResult Function()? getPrincipalCutoffs,
    required TResult orElse(),
  }) {
    if (createVirtualAccount != null) {
      return createVirtualAccount();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchAvailablePaymentMethods value)
        fetchAvailablePaymentMethods,
    required TResult Function(_SelectAllInvoices value) updateAllInvoices,
    required TResult Function(_ToggleInvoice value) toggleInvoice,
    required TResult Function(_SelectAllCredits value) updateAllCredits,
    required TResult Function(_ToggleCredit value) toggleCredit,
    required TResult Function(_Pay value) pay,
    required TResult Function(_UpdatePaymentGateway value) updatePaymentGateway,
    required TResult Function(_FetchInvoiceInfoPdf value) fetchInvoiceInfoPdf,
    required TResult Function(_SaveInvoicePdf value) saveInvoicePdf,
    required TResult Function(_UpdatePaymentMethodSelected value)
        updatePaymentMethodSelected,
    required TResult Function(_UpdatePaymentMethodOptionSelected value)
        updatePaymentMethodOptionSelected,
    required TResult Function(_CreateVirtualAccount value) createVirtualAccount,
    required TResult Function(_GetPrincipalCutoffs value) getPrincipalCutoffs,
  }) {
    return createVirtualAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult? Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult? Function(_ToggleInvoice value)? toggleInvoice,
    TResult? Function(_SelectAllCredits value)? updateAllCredits,
    TResult? Function(_ToggleCredit value)? toggleCredit,
    TResult? Function(_Pay value)? pay,
    TResult? Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult? Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult? Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult? Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult? Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult? Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult? Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
  }) {
    return createVirtualAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult Function(_ToggleInvoice value)? toggleInvoice,
    TResult Function(_SelectAllCredits value)? updateAllCredits,
    TResult Function(_ToggleCredit value)? toggleCredit,
    TResult Function(_Pay value)? pay,
    TResult Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
    required TResult orElse(),
  }) {
    if (createVirtualAccount != null) {
      return createVirtualAccount(this);
    }
    return orElse();
  }
}

abstract class _CreateVirtualAccount implements NewPaymentEvent {
  const factory _CreateVirtualAccount() = _$CreateVirtualAccountImpl;
}

/// @nodoc
abstract class _$$GetPrincipalCutoffsImplCopyWith<$Res> {
  factory _$$GetPrincipalCutoffsImplCopyWith(_$GetPrincipalCutoffsImpl value,
          $Res Function(_$GetPrincipalCutoffsImpl) then) =
      __$$GetPrincipalCutoffsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetPrincipalCutoffsImplCopyWithImpl<$Res>
    extends _$NewPaymentEventCopyWithImpl<$Res, _$GetPrincipalCutoffsImpl>
    implements _$$GetPrincipalCutoffsImplCopyWith<$Res> {
  __$$GetPrincipalCutoffsImplCopyWithImpl(_$GetPrincipalCutoffsImpl _value,
      $Res Function(_$GetPrincipalCutoffsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetPrincipalCutoffsImpl implements _GetPrincipalCutoffs {
  const _$GetPrincipalCutoffsImpl();

  @override
  String toString() {
    return 'NewPaymentEvent.getPrincipalCutoffs()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPrincipalCutoffsImpl);
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
            bool isMarketPlace)
        initialized,
    required TResult Function() fetchAvailablePaymentMethods,
    required TResult Function(List<CustomerOpenItem> items) updateAllInvoices,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleInvoice,
    required TResult Function(List<CustomerOpenItem> items) updateAllCredits,
    required TResult Function(CustomerOpenItem item, bool selected)
        toggleCredit,
    required TResult Function() pay,
    required TResult Function(PaymentStatus paymentStatus) updatePaymentGateway,
    required TResult Function() fetchInvoiceInfoPdf,
    required TResult Function(Uint8List dataInvoicePdf) saveInvoicePdf,
    required TResult Function(NewPaymentMethod paymentMethodSelected)
        updatePaymentMethodSelected,
    required TResult Function(PaymentMethodOption paymentMethodOptionSelected)
        updatePaymentMethodOptionSelected,
    required TResult Function() createVirtualAccount,
    required TResult Function() getPrincipalCutoffs,
  }) {
    return getPrincipalCutoffs();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult? Function()? fetchAvailablePaymentMethods,
    TResult? Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult? Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult? Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult? Function()? pay,
    TResult? Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult? Function()? fetchInvoiceInfoPdf,
    TResult? Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult? Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult? Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult? Function()? createVirtualAccount,
    TResult? Function()? getPrincipalCutoffs,
  }) {
    return getPrincipalCutoffs?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            User user,
            bool isMarketPlace)?
        initialized,
    TResult Function()? fetchAvailablePaymentMethods,
    TResult Function(List<CustomerOpenItem> items)? updateAllInvoices,
    TResult Function(CustomerOpenItem item, bool selected)? toggleInvoice,
    TResult Function(List<CustomerOpenItem> items)? updateAllCredits,
    TResult Function(CustomerOpenItem item, bool selected)? toggleCredit,
    TResult Function()? pay,
    TResult Function(PaymentStatus paymentStatus)? updatePaymentGateway,
    TResult Function()? fetchInvoiceInfoPdf,
    TResult Function(Uint8List dataInvoicePdf)? saveInvoicePdf,
    TResult Function(NewPaymentMethod paymentMethodSelected)?
        updatePaymentMethodSelected,
    TResult Function(PaymentMethodOption paymentMethodOptionSelected)?
        updatePaymentMethodOptionSelected,
    TResult Function()? createVirtualAccount,
    TResult Function()? getPrincipalCutoffs,
    required TResult orElse(),
  }) {
    if (getPrincipalCutoffs != null) {
      return getPrincipalCutoffs();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchAvailablePaymentMethods value)
        fetchAvailablePaymentMethods,
    required TResult Function(_SelectAllInvoices value) updateAllInvoices,
    required TResult Function(_ToggleInvoice value) toggleInvoice,
    required TResult Function(_SelectAllCredits value) updateAllCredits,
    required TResult Function(_ToggleCredit value) toggleCredit,
    required TResult Function(_Pay value) pay,
    required TResult Function(_UpdatePaymentGateway value) updatePaymentGateway,
    required TResult Function(_FetchInvoiceInfoPdf value) fetchInvoiceInfoPdf,
    required TResult Function(_SaveInvoicePdf value) saveInvoicePdf,
    required TResult Function(_UpdatePaymentMethodSelected value)
        updatePaymentMethodSelected,
    required TResult Function(_UpdatePaymentMethodOptionSelected value)
        updatePaymentMethodOptionSelected,
    required TResult Function(_CreateVirtualAccount value) createVirtualAccount,
    required TResult Function(_GetPrincipalCutoffs value) getPrincipalCutoffs,
  }) {
    return getPrincipalCutoffs(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult? Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult? Function(_ToggleInvoice value)? toggleInvoice,
    TResult? Function(_SelectAllCredits value)? updateAllCredits,
    TResult? Function(_ToggleCredit value)? toggleCredit,
    TResult? Function(_Pay value)? pay,
    TResult? Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult? Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult? Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult? Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult? Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult? Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult? Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
  }) {
    return getPrincipalCutoffs?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchAvailablePaymentMethods value)?
        fetchAvailablePaymentMethods,
    TResult Function(_SelectAllInvoices value)? updateAllInvoices,
    TResult Function(_ToggleInvoice value)? toggleInvoice,
    TResult Function(_SelectAllCredits value)? updateAllCredits,
    TResult Function(_ToggleCredit value)? toggleCredit,
    TResult Function(_Pay value)? pay,
    TResult Function(_UpdatePaymentGateway value)? updatePaymentGateway,
    TResult Function(_FetchInvoiceInfoPdf value)? fetchInvoiceInfoPdf,
    TResult Function(_SaveInvoicePdf value)? saveInvoicePdf,
    TResult Function(_UpdatePaymentMethodSelected value)?
        updatePaymentMethodSelected,
    TResult Function(_UpdatePaymentMethodOptionSelected value)?
        updatePaymentMethodOptionSelected,
    TResult Function(_CreateVirtualAccount value)? createVirtualAccount,
    TResult Function(_GetPrincipalCutoffs value)? getPrincipalCutoffs,
    required TResult orElse(),
  }) {
    if (getPrincipalCutoffs != null) {
      return getPrincipalCutoffs(this);
    }
    return orElse();
  }
}

abstract class _GetPrincipalCutoffs implements NewPaymentEvent {
  const factory _GetPrincipalCutoffs() = _$GetPrincipalCutoffsImpl;
}

/// @nodoc
mixin _$NewPaymentState {
  PaymentInfo get paymentInfo => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  List<CustomerOpenItem> get selectedInvoices =>
      throw _privateConstructorUsedError;
  List<CustomerOpenItem> get selectedCredits =>
      throw _privateConstructorUsedError;
  bool get isFetchingInvoiceInfoPdf => throw _privateConstructorUsedError;
  PaymentInvoiceInfoPdf get paymentInvoiceInfoPdf =>
      throw _privateConstructorUsedError;
  bool get isSavingInvoicePdf => throw _privateConstructorUsedError;
  bool get isFetchingPaymentMethod => throw _privateConstructorUsedError;
  List<NewPaymentMethod> get paymentMethods =>
      throw _privateConstructorUsedError;
  NewPaymentMethod get selectedPaymentMethod =>
      throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  ShipToInfo get shipToInfo => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  bool get isCreatingVirtualAccount => throw _privateConstructorUsedError;
  bool get createVirtualAccountFailed => throw _privateConstructorUsedError;
  CreateVirtualAccount get createVirtualAccount =>
      throw _privateConstructorUsedError;
  bool get isFetchingPrincipalCutoffs => throw _privateConstructorUsedError;
  PrincipalCutoffs get principalCutoffs => throw _privateConstructorUsedError;
  bool get isMarketPlace => throw _privateConstructorUsedError;
  bool get isUpdatePaymentGateway => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewPaymentStateCopyWith<NewPaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewPaymentStateCopyWith<$Res> {
  factory $NewPaymentStateCopyWith(
          NewPaymentState value, $Res Function(NewPaymentState) then) =
      _$NewPaymentStateCopyWithImpl<$Res, NewPaymentState>;
  @useResult
  $Res call(
      {PaymentInfo paymentInfo,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isLoading,
      List<CustomerOpenItem> selectedInvoices,
      List<CustomerOpenItem> selectedCredits,
      bool isFetchingInvoiceInfoPdf,
      PaymentInvoiceInfoPdf paymentInvoiceInfoPdf,
      bool isSavingInvoicePdf,
      bool isFetchingPaymentMethod,
      List<NewPaymentMethod> paymentMethods,
      NewPaymentMethod selectedPaymentMethod,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      User user,
      bool isCreatingVirtualAccount,
      bool createVirtualAccountFailed,
      CreateVirtualAccount createVirtualAccount,
      bool isFetchingPrincipalCutoffs,
      PrincipalCutoffs principalCutoffs,
      bool isMarketPlace,
      bool isUpdatePaymentGateway});

  $PaymentInfoCopyWith<$Res> get paymentInfo;
  $PaymentInvoiceInfoPdfCopyWith<$Res> get paymentInvoiceInfoPdf;
  $NewPaymentMethodCopyWith<$Res> get selectedPaymentMethod;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $UserCopyWith<$Res> get user;
  $CreateVirtualAccountCopyWith<$Res> get createVirtualAccount;
  $PrincipalCutoffsCopyWith<$Res> get principalCutoffs;
}

/// @nodoc
class _$NewPaymentStateCopyWithImpl<$Res, $Val extends NewPaymentState>
    implements $NewPaymentStateCopyWith<$Res> {
  _$NewPaymentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentInfo = null,
    Object? failureOrSuccessOption = null,
    Object? isLoading = null,
    Object? selectedInvoices = null,
    Object? selectedCredits = null,
    Object? isFetchingInvoiceInfoPdf = null,
    Object? paymentInvoiceInfoPdf = null,
    Object? isSavingInvoicePdf = null,
    Object? isFetchingPaymentMethod = null,
    Object? paymentMethods = null,
    Object? selectedPaymentMethod = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? user = null,
    Object? isCreatingVirtualAccount = null,
    Object? createVirtualAccountFailed = null,
    Object? createVirtualAccount = null,
    Object? isFetchingPrincipalCutoffs = null,
    Object? principalCutoffs = null,
    Object? isMarketPlace = null,
    Object? isUpdatePaymentGateway = null,
  }) {
    return _then(_value.copyWith(
      paymentInfo: null == paymentInfo
          ? _value.paymentInfo
          : paymentInfo // ignore: cast_nullable_to_non_nullable
              as PaymentInfo,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedInvoices: null == selectedInvoices
          ? _value.selectedInvoices
          : selectedInvoices // ignore: cast_nullable_to_non_nullable
              as List<CustomerOpenItem>,
      selectedCredits: null == selectedCredits
          ? _value.selectedCredits
          : selectedCredits // ignore: cast_nullable_to_non_nullable
              as List<CustomerOpenItem>,
      isFetchingInvoiceInfoPdf: null == isFetchingInvoiceInfoPdf
          ? _value.isFetchingInvoiceInfoPdf
          : isFetchingInvoiceInfoPdf // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentInvoiceInfoPdf: null == paymentInvoiceInfoPdf
          ? _value.paymentInvoiceInfoPdf
          : paymentInvoiceInfoPdf // ignore: cast_nullable_to_non_nullable
              as PaymentInvoiceInfoPdf,
      isSavingInvoicePdf: null == isSavingInvoicePdf
          ? _value.isSavingInvoicePdf
          : isSavingInvoicePdf // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingPaymentMethod: null == isFetchingPaymentMethod
          ? _value.isFetchingPaymentMethod
          : isFetchingPaymentMethod // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentMethods: null == paymentMethods
          ? _value.paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<NewPaymentMethod>,
      selectedPaymentMethod: null == selectedPaymentMethod
          ? _value.selectedPaymentMethod
          : selectedPaymentMethod // ignore: cast_nullable_to_non_nullable
              as NewPaymentMethod,
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
      isCreatingVirtualAccount: null == isCreatingVirtualAccount
          ? _value.isCreatingVirtualAccount
          : isCreatingVirtualAccount // ignore: cast_nullable_to_non_nullable
              as bool,
      createVirtualAccountFailed: null == createVirtualAccountFailed
          ? _value.createVirtualAccountFailed
          : createVirtualAccountFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      createVirtualAccount: null == createVirtualAccount
          ? _value.createVirtualAccount
          : createVirtualAccount // ignore: cast_nullable_to_non_nullable
              as CreateVirtualAccount,
      isFetchingPrincipalCutoffs: null == isFetchingPrincipalCutoffs
          ? _value.isFetchingPrincipalCutoffs
          : isFetchingPrincipalCutoffs // ignore: cast_nullable_to_non_nullable
              as bool,
      principalCutoffs: null == principalCutoffs
          ? _value.principalCutoffs
          : principalCutoffs // ignore: cast_nullable_to_non_nullable
              as PrincipalCutoffs,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdatePaymentGateway: null == isUpdatePaymentGateway
          ? _value.isUpdatePaymentGateway
          : isUpdatePaymentGateway // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentInfoCopyWith<$Res> get paymentInfo {
    return $PaymentInfoCopyWith<$Res>(_value.paymentInfo, (value) {
      return _then(_value.copyWith(paymentInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentInvoiceInfoPdfCopyWith<$Res> get paymentInvoiceInfoPdf {
    return $PaymentInvoiceInfoPdfCopyWith<$Res>(_value.paymentInvoiceInfoPdf,
        (value) {
      return _then(_value.copyWith(paymentInvoiceInfoPdf: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NewPaymentMethodCopyWith<$Res> get selectedPaymentMethod {
    return $NewPaymentMethodCopyWith<$Res>(_value.selectedPaymentMethod,
        (value) {
      return _then(_value.copyWith(selectedPaymentMethod: value) as $Val);
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
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CreateVirtualAccountCopyWith<$Res> get createVirtualAccount {
    return $CreateVirtualAccountCopyWith<$Res>(_value.createVirtualAccount,
        (value) {
      return _then(_value.copyWith(createVirtualAccount: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PrincipalCutoffsCopyWith<$Res> get principalCutoffs {
    return $PrincipalCutoffsCopyWith<$Res>(_value.principalCutoffs, (value) {
      return _then(_value.copyWith(principalCutoffs: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NewPaymentStateImplCopyWith<$Res>
    implements $NewPaymentStateCopyWith<$Res> {
  factory _$$NewPaymentStateImplCopyWith(_$NewPaymentStateImpl value,
          $Res Function(_$NewPaymentStateImpl) then) =
      __$$NewPaymentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PaymentInfo paymentInfo,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isLoading,
      List<CustomerOpenItem> selectedInvoices,
      List<CustomerOpenItem> selectedCredits,
      bool isFetchingInvoiceInfoPdf,
      PaymentInvoiceInfoPdf paymentInvoiceInfoPdf,
      bool isSavingInvoicePdf,
      bool isFetchingPaymentMethod,
      List<NewPaymentMethod> paymentMethods,
      NewPaymentMethod selectedPaymentMethod,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      User user,
      bool isCreatingVirtualAccount,
      bool createVirtualAccountFailed,
      CreateVirtualAccount createVirtualAccount,
      bool isFetchingPrincipalCutoffs,
      PrincipalCutoffs principalCutoffs,
      bool isMarketPlace,
      bool isUpdatePaymentGateway});

  @override
  $PaymentInfoCopyWith<$Res> get paymentInfo;
  @override
  $PaymentInvoiceInfoPdfCopyWith<$Res> get paymentInvoiceInfoPdf;
  @override
  $NewPaymentMethodCopyWith<$Res> get selectedPaymentMethod;
  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  @override
  $UserCopyWith<$Res> get user;
  @override
  $CreateVirtualAccountCopyWith<$Res> get createVirtualAccount;
  @override
  $PrincipalCutoffsCopyWith<$Res> get principalCutoffs;
}

/// @nodoc
class __$$NewPaymentStateImplCopyWithImpl<$Res>
    extends _$NewPaymentStateCopyWithImpl<$Res, _$NewPaymentStateImpl>
    implements _$$NewPaymentStateImplCopyWith<$Res> {
  __$$NewPaymentStateImplCopyWithImpl(
      _$NewPaymentStateImpl _value, $Res Function(_$NewPaymentStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentInfo = null,
    Object? failureOrSuccessOption = null,
    Object? isLoading = null,
    Object? selectedInvoices = null,
    Object? selectedCredits = null,
    Object? isFetchingInvoiceInfoPdf = null,
    Object? paymentInvoiceInfoPdf = null,
    Object? isSavingInvoicePdf = null,
    Object? isFetchingPaymentMethod = null,
    Object? paymentMethods = null,
    Object? selectedPaymentMethod = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? user = null,
    Object? isCreatingVirtualAccount = null,
    Object? createVirtualAccountFailed = null,
    Object? createVirtualAccount = null,
    Object? isFetchingPrincipalCutoffs = null,
    Object? principalCutoffs = null,
    Object? isMarketPlace = null,
    Object? isUpdatePaymentGateway = null,
  }) {
    return _then(_$NewPaymentStateImpl(
      paymentInfo: null == paymentInfo
          ? _value.paymentInfo
          : paymentInfo // ignore: cast_nullable_to_non_nullable
              as PaymentInfo,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedInvoices: null == selectedInvoices
          ? _value._selectedInvoices
          : selectedInvoices // ignore: cast_nullable_to_non_nullable
              as List<CustomerOpenItem>,
      selectedCredits: null == selectedCredits
          ? _value._selectedCredits
          : selectedCredits // ignore: cast_nullable_to_non_nullable
              as List<CustomerOpenItem>,
      isFetchingInvoiceInfoPdf: null == isFetchingInvoiceInfoPdf
          ? _value.isFetchingInvoiceInfoPdf
          : isFetchingInvoiceInfoPdf // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentInvoiceInfoPdf: null == paymentInvoiceInfoPdf
          ? _value.paymentInvoiceInfoPdf
          : paymentInvoiceInfoPdf // ignore: cast_nullable_to_non_nullable
              as PaymentInvoiceInfoPdf,
      isSavingInvoicePdf: null == isSavingInvoicePdf
          ? _value.isSavingInvoicePdf
          : isSavingInvoicePdf // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingPaymentMethod: null == isFetchingPaymentMethod
          ? _value.isFetchingPaymentMethod
          : isFetchingPaymentMethod // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentMethods: null == paymentMethods
          ? _value._paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<NewPaymentMethod>,
      selectedPaymentMethod: null == selectedPaymentMethod
          ? _value.selectedPaymentMethod
          : selectedPaymentMethod // ignore: cast_nullable_to_non_nullable
              as NewPaymentMethod,
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
      isCreatingVirtualAccount: null == isCreatingVirtualAccount
          ? _value.isCreatingVirtualAccount
          : isCreatingVirtualAccount // ignore: cast_nullable_to_non_nullable
              as bool,
      createVirtualAccountFailed: null == createVirtualAccountFailed
          ? _value.createVirtualAccountFailed
          : createVirtualAccountFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      createVirtualAccount: null == createVirtualAccount
          ? _value.createVirtualAccount
          : createVirtualAccount // ignore: cast_nullable_to_non_nullable
              as CreateVirtualAccount,
      isFetchingPrincipalCutoffs: null == isFetchingPrincipalCutoffs
          ? _value.isFetchingPrincipalCutoffs
          : isFetchingPrincipalCutoffs // ignore: cast_nullable_to_non_nullable
              as bool,
      principalCutoffs: null == principalCutoffs
          ? _value.principalCutoffs
          : principalCutoffs // ignore: cast_nullable_to_non_nullable
              as PrincipalCutoffs,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdatePaymentGateway: null == isUpdatePaymentGateway
          ? _value.isUpdatePaymentGateway
          : isUpdatePaymentGateway // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$NewPaymentStateImpl extends _NewPaymentState {
  const _$NewPaymentStateImpl(
      {required this.paymentInfo,
      required this.failureOrSuccessOption,
      required this.isLoading,
      required final List<CustomerOpenItem> selectedInvoices,
      required final List<CustomerOpenItem> selectedCredits,
      required this.isFetchingInvoiceInfoPdf,
      required this.paymentInvoiceInfoPdf,
      required this.isSavingInvoicePdf,
      required this.isFetchingPaymentMethod,
      required final List<NewPaymentMethod> paymentMethods,
      required this.selectedPaymentMethod,
      required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.user,
      required this.isCreatingVirtualAccount,
      required this.createVirtualAccountFailed,
      required this.createVirtualAccount,
      required this.isFetchingPrincipalCutoffs,
      required this.principalCutoffs,
      required this.isMarketPlace,
      required this.isUpdatePaymentGateway})
      : _selectedInvoices = selectedInvoices,
        _selectedCredits = selectedCredits,
        _paymentMethods = paymentMethods,
        super._();

  @override
  final PaymentInfo paymentInfo;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  @override
  final bool isLoading;
  final List<CustomerOpenItem> _selectedInvoices;
  @override
  List<CustomerOpenItem> get selectedInvoices {
    if (_selectedInvoices is EqualUnmodifiableListView)
      return _selectedInvoices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedInvoices);
  }

  final List<CustomerOpenItem> _selectedCredits;
  @override
  List<CustomerOpenItem> get selectedCredits {
    if (_selectedCredits is EqualUnmodifiableListView) return _selectedCredits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedCredits);
  }

  @override
  final bool isFetchingInvoiceInfoPdf;
  @override
  final PaymentInvoiceInfoPdf paymentInvoiceInfoPdf;
  @override
  final bool isSavingInvoicePdf;
  @override
  final bool isFetchingPaymentMethod;
  final List<NewPaymentMethod> _paymentMethods;
  @override
  List<NewPaymentMethod> get paymentMethods {
    if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentMethods);
  }

  @override
  final NewPaymentMethod selectedPaymentMethod;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final User user;
  @override
  final bool isCreatingVirtualAccount;
  @override
  final bool createVirtualAccountFailed;
  @override
  final CreateVirtualAccount createVirtualAccount;
  @override
  final bool isFetchingPrincipalCutoffs;
  @override
  final PrincipalCutoffs principalCutoffs;
  @override
  final bool isMarketPlace;
  @override
  final bool isUpdatePaymentGateway;

  @override
  String toString() {
    return 'NewPaymentState(paymentInfo: $paymentInfo, failureOrSuccessOption: $failureOrSuccessOption, isLoading: $isLoading, selectedInvoices: $selectedInvoices, selectedCredits: $selectedCredits, isFetchingInvoiceInfoPdf: $isFetchingInvoiceInfoPdf, paymentInvoiceInfoPdf: $paymentInvoiceInfoPdf, isSavingInvoicePdf: $isSavingInvoicePdf, isFetchingPaymentMethod: $isFetchingPaymentMethod, paymentMethods: $paymentMethods, selectedPaymentMethod: $selectedPaymentMethod, salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, user: $user, isCreatingVirtualAccount: $isCreatingVirtualAccount, createVirtualAccountFailed: $createVirtualAccountFailed, createVirtualAccount: $createVirtualAccount, isFetchingPrincipalCutoffs: $isFetchingPrincipalCutoffs, principalCutoffs: $principalCutoffs, isMarketPlace: $isMarketPlace, isUpdatePaymentGateway: $isUpdatePaymentGateway)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewPaymentStateImpl &&
            (identical(other.paymentInfo, paymentInfo) ||
                other.paymentInfo == paymentInfo) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._selectedInvoices, _selectedInvoices) &&
            const DeepCollectionEquality()
                .equals(other._selectedCredits, _selectedCredits) &&
            (identical(other.isFetchingInvoiceInfoPdf, isFetchingInvoiceInfoPdf) ||
                other.isFetchingInvoiceInfoPdf == isFetchingInvoiceInfoPdf) &&
            (identical(other.paymentInvoiceInfoPdf, paymentInvoiceInfoPdf) ||
                other.paymentInvoiceInfoPdf == paymentInvoiceInfoPdf) &&
            (identical(other.isSavingInvoicePdf, isSavingInvoicePdf) ||
                other.isSavingInvoicePdf == isSavingInvoicePdf) &&
            (identical(other.isFetchingPaymentMethod, isFetchingPaymentMethod) ||
                other.isFetchingPaymentMethod == isFetchingPaymentMethod) &&
            const DeepCollectionEquality()
                .equals(other._paymentMethods, _paymentMethods) &&
            (identical(other.selectedPaymentMethod, selectedPaymentMethod) ||
                other.selectedPaymentMethod == selectedPaymentMethod) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(
                    other.isCreatingVirtualAccount, isCreatingVirtualAccount) ||
                other.isCreatingVirtualAccount == isCreatingVirtualAccount) &&
            (identical(other.createVirtualAccountFailed, createVirtualAccountFailed) ||
                other.createVirtualAccountFailed ==
                    createVirtualAccountFailed) &&
            (identical(other.createVirtualAccount, createVirtualAccount) ||
                other.createVirtualAccount == createVirtualAccount) &&
            (identical(other.isFetchingPrincipalCutoffs,
                    isFetchingPrincipalCutoffs) ||
                other.isFetchingPrincipalCutoffs ==
                    isFetchingPrincipalCutoffs) &&
            (identical(other.principalCutoffs, principalCutoffs) ||
                other.principalCutoffs == principalCutoffs) &&
            (identical(other.isMarketPlace, isMarketPlace) ||
                other.isMarketPlace == isMarketPlace) &&
            (identical(other.isUpdatePaymentGateway, isUpdatePaymentGateway) ||
                other.isUpdatePaymentGateway == isUpdatePaymentGateway));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        paymentInfo,
        failureOrSuccessOption,
        isLoading,
        const DeepCollectionEquality().hash(_selectedInvoices),
        const DeepCollectionEquality().hash(_selectedCredits),
        isFetchingInvoiceInfoPdf,
        paymentInvoiceInfoPdf,
        isSavingInvoicePdf,
        isFetchingPaymentMethod,
        const DeepCollectionEquality().hash(_paymentMethods),
        selectedPaymentMethod,
        salesOrganisation,
        customerCodeInfo,
        shipToInfo,
        user,
        isCreatingVirtualAccount,
        createVirtualAccountFailed,
        createVirtualAccount,
        isFetchingPrincipalCutoffs,
        principalCutoffs,
        isMarketPlace,
        isUpdatePaymentGateway
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewPaymentStateImplCopyWith<_$NewPaymentStateImpl> get copyWith =>
      __$$NewPaymentStateImplCopyWithImpl<_$NewPaymentStateImpl>(
          this, _$identity);
}

abstract class _NewPaymentState extends NewPaymentState {
  const factory _NewPaymentState(
      {required final PaymentInfo paymentInfo,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final bool isLoading,
      required final List<CustomerOpenItem> selectedInvoices,
      required final List<CustomerOpenItem> selectedCredits,
      required final bool isFetchingInvoiceInfoPdf,
      required final PaymentInvoiceInfoPdf paymentInvoiceInfoPdf,
      required final bool isSavingInvoicePdf,
      required final bool isFetchingPaymentMethod,
      required final List<NewPaymentMethod> paymentMethods,
      required final NewPaymentMethod selectedPaymentMethod,
      required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final ShipToInfo shipToInfo,
      required final User user,
      required final bool isCreatingVirtualAccount,
      required final bool createVirtualAccountFailed,
      required final CreateVirtualAccount createVirtualAccount,
      required final bool isFetchingPrincipalCutoffs,
      required final PrincipalCutoffs principalCutoffs,
      required final bool isMarketPlace,
      required final bool isUpdatePaymentGateway}) = _$NewPaymentStateImpl;
  const _NewPaymentState._() : super._();

  @override
  PaymentInfo get paymentInfo;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  bool get isLoading;
  @override
  List<CustomerOpenItem> get selectedInvoices;
  @override
  List<CustomerOpenItem> get selectedCredits;
  @override
  bool get isFetchingInvoiceInfoPdf;
  @override
  PaymentInvoiceInfoPdf get paymentInvoiceInfoPdf;
  @override
  bool get isSavingInvoicePdf;
  @override
  bool get isFetchingPaymentMethod;
  @override
  List<NewPaymentMethod> get paymentMethods;
  @override
  NewPaymentMethod get selectedPaymentMethod;
  @override
  SalesOrganisation get salesOrganisation;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  ShipToInfo get shipToInfo;
  @override
  User get user;
  @override
  bool get isCreatingVirtualAccount;
  @override
  bool get createVirtualAccountFailed;
  @override
  CreateVirtualAccount get createVirtualAccount;
  @override
  bool get isFetchingPrincipalCutoffs;
  @override
  PrincipalCutoffs get principalCutoffs;
  @override
  bool get isMarketPlace;
  @override
  bool get isUpdatePaymentGateway;
  @override
  @JsonKey(ignore: true)
  _$$NewPaymentStateImplCopyWith<_$NewPaymentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

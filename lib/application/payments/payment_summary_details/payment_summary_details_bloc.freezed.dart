// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_summary_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentSummaryDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, User user, ShipToInfo shipToInfo)
        initialized,
    required TResult Function(PaymentSummaryDetails details, bool isMarketPlace)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function(bool isMarketPlace) fetchPaymentSummaryList,
    required TResult Function() fetchBankInstruction,
    required TResult Function(bool isMarketPlace) fetchAdvice,
    required TResult Function() saveAdvice,
    required TResult Function(bool isMarketPlace) deleteAdvice,
    required TResult Function() cancelAdvice,
    required TResult Function() viewSavedAdvice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(PaymentSummaryDetails details, bool isMarketPlace)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function(bool isMarketPlace)? fetchPaymentSummaryList,
    TResult? Function()? fetchBankInstruction,
    TResult? Function(bool isMarketPlace)? fetchAdvice,
    TResult? Function()? saveAdvice,
    TResult? Function(bool isMarketPlace)? deleteAdvice,
    TResult? Function()? cancelAdvice,
    TResult? Function()? viewSavedAdvice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(PaymentSummaryDetails details, bool isMarketPlace)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function(bool isMarketPlace)? fetchPaymentSummaryList,
    TResult Function()? fetchBankInstruction,
    TResult Function(bool isMarketPlace)? fetchAdvice,
    TResult Function()? saveAdvice,
    TResult Function(bool isMarketPlace)? deleteAdvice,
    TResult Function()? cancelAdvice,
    TResult Function()? viewSavedAdvice,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchPaymentSummaryDetailsEvent value)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function(_FetchPaymentSummaryListEvent value)
        fetchPaymentSummaryList,
    required TResult Function(_FetchBankInstruction value) fetchBankInstruction,
    required TResult Function(_FetchAdvice value) fetchAdvice,
    required TResult Function(_SaveAdvice value) saveAdvice,
    required TResult Function(_DeleteAdvice value) deleteAdvice,
    required TResult Function(_CancelAdvice value) cancelAdvice,
    required TResult Function(_ViewSavedAdvice value) viewSavedAdvice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult? Function(_FetchBankInstruction value)? fetchBankInstruction,
    TResult? Function(_FetchAdvice value)? fetchAdvice,
    TResult? Function(_SaveAdvice value)? saveAdvice,
    TResult? Function(_DeleteAdvice value)? deleteAdvice,
    TResult? Function(_CancelAdvice value)? cancelAdvice,
    TResult? Function(_ViewSavedAdvice value)? viewSavedAdvice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult Function(_FetchBankInstruction value)? fetchBankInstruction,
    TResult Function(_FetchAdvice value)? fetchAdvice,
    TResult Function(_SaveAdvice value)? saveAdvice,
    TResult Function(_DeleteAdvice value)? deleteAdvice,
    TResult Function(_CancelAdvice value)? cancelAdvice,
    TResult Function(_ViewSavedAdvice value)? viewSavedAdvice,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentSummaryDetailsEventCopyWith<$Res> {
  factory $PaymentSummaryDetailsEventCopyWith(PaymentSummaryDetailsEvent value,
          $Res Function(PaymentSummaryDetailsEvent) then) =
      _$PaymentSummaryDetailsEventCopyWithImpl<$Res,
          PaymentSummaryDetailsEvent>;
}

/// @nodoc
class _$PaymentSummaryDetailsEventCopyWithImpl<$Res,
        $Val extends PaymentSummaryDetailsEvent>
    implements $PaymentSummaryDetailsEventCopyWith<$Res> {
  _$PaymentSummaryDetailsEventCopyWithImpl(this._value, this._then);

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
      CustomerCodeInfo customerCodeInfo,
      User user,
      ShipToInfo shipToInfo});

  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $UserCopyWith<$Res> get user;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$PaymentSummaryDetailsEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganization = null,
    Object? customerCodeInfo = null,
    Object? user = null,
    Object? shipToInfo = null,
  }) {
    return _then(_$InitializedImpl(
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
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
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value));
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
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value));
    });
  }
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl(
      {required this.salesOrganization,
      required this.customerCodeInfo,
      required this.user,
      required this.shipToInfo});

  @override
  final SalesOrganisation salesOrganization;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final User user;
  @override
  final ShipToInfo shipToInfo;

  @override
  String toString() {
    return 'PaymentSummaryDetailsEvent.initialized(salesOrganization: $salesOrganization, customerCodeInfo: $customerCodeInfo, user: $user, shipToInfo: $shipToInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializedImpl &&
            (identical(other.salesOrganization, salesOrganization) ||
                other.salesOrganization == salesOrganization) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, salesOrganization, customerCodeInfo, user, shipToInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      __$$InitializedImplCopyWithImpl<_$InitializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, User user, ShipToInfo shipToInfo)
        initialized,
    required TResult Function(PaymentSummaryDetails details, bool isMarketPlace)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function(bool isMarketPlace) fetchPaymentSummaryList,
    required TResult Function() fetchBankInstruction,
    required TResult Function(bool isMarketPlace) fetchAdvice,
    required TResult Function() saveAdvice,
    required TResult Function(bool isMarketPlace) deleteAdvice,
    required TResult Function() cancelAdvice,
    required TResult Function() viewSavedAdvice,
  }) {
    return initialized(salesOrganization, customerCodeInfo, user, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(PaymentSummaryDetails details, bool isMarketPlace)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function(bool isMarketPlace)? fetchPaymentSummaryList,
    TResult? Function()? fetchBankInstruction,
    TResult? Function(bool isMarketPlace)? fetchAdvice,
    TResult? Function()? saveAdvice,
    TResult? Function(bool isMarketPlace)? deleteAdvice,
    TResult? Function()? cancelAdvice,
    TResult? Function()? viewSavedAdvice,
  }) {
    return initialized?.call(
        salesOrganization, customerCodeInfo, user, shipToInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(PaymentSummaryDetails details, bool isMarketPlace)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function(bool isMarketPlace)? fetchPaymentSummaryList,
    TResult Function()? fetchBankInstruction,
    TResult Function(bool isMarketPlace)? fetchAdvice,
    TResult Function()? saveAdvice,
    TResult Function(bool isMarketPlace)? deleteAdvice,
    TResult Function()? cancelAdvice,
    TResult Function()? viewSavedAdvice,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(salesOrganization, customerCodeInfo, user, shipToInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchPaymentSummaryDetailsEvent value)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function(_FetchPaymentSummaryListEvent value)
        fetchPaymentSummaryList,
    required TResult Function(_FetchBankInstruction value) fetchBankInstruction,
    required TResult Function(_FetchAdvice value) fetchAdvice,
    required TResult Function(_SaveAdvice value) saveAdvice,
    required TResult Function(_DeleteAdvice value) deleteAdvice,
    required TResult Function(_CancelAdvice value) cancelAdvice,
    required TResult Function(_ViewSavedAdvice value) viewSavedAdvice,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult? Function(_FetchBankInstruction value)? fetchBankInstruction,
    TResult? Function(_FetchAdvice value)? fetchAdvice,
    TResult? Function(_SaveAdvice value)? saveAdvice,
    TResult? Function(_DeleteAdvice value)? deleteAdvice,
    TResult? Function(_CancelAdvice value)? cancelAdvice,
    TResult? Function(_ViewSavedAdvice value)? viewSavedAdvice,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult Function(_FetchBankInstruction value)? fetchBankInstruction,
    TResult Function(_FetchAdvice value)? fetchAdvice,
    TResult Function(_SaveAdvice value)? saveAdvice,
    TResult Function(_DeleteAdvice value)? deleteAdvice,
    TResult Function(_CancelAdvice value)? cancelAdvice,
    TResult Function(_ViewSavedAdvice value)? viewSavedAdvice,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements PaymentSummaryDetailsEvent {
  const factory _Initialized(
      {required final SalesOrganisation salesOrganization,
      required final CustomerCodeInfo customerCodeInfo,
      required final User user,
      required final ShipToInfo shipToInfo}) = _$InitializedImpl;

  SalesOrganisation get salesOrganization;
  CustomerCodeInfo get customerCodeInfo;
  User get user;
  ShipToInfo get shipToInfo;
  @JsonKey(ignore: true)
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchPaymentSummaryDetailsEventImplCopyWith<$Res> {
  factory _$$FetchPaymentSummaryDetailsEventImplCopyWith(
          _$FetchPaymentSummaryDetailsEventImpl value,
          $Res Function(_$FetchPaymentSummaryDetailsEventImpl) then) =
      __$$FetchPaymentSummaryDetailsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentSummaryDetails details, bool isMarketPlace});

  $PaymentSummaryDetailsCopyWith<$Res> get details;
}

/// @nodoc
class __$$FetchPaymentSummaryDetailsEventImplCopyWithImpl<$Res>
    extends _$PaymentSummaryDetailsEventCopyWithImpl<$Res,
        _$FetchPaymentSummaryDetailsEventImpl>
    implements _$$FetchPaymentSummaryDetailsEventImplCopyWith<$Res> {
  __$$FetchPaymentSummaryDetailsEventImplCopyWithImpl(
      _$FetchPaymentSummaryDetailsEventImpl _value,
      $Res Function(_$FetchPaymentSummaryDetailsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
    Object? isMarketPlace = null,
  }) {
    return _then(_$FetchPaymentSummaryDetailsEventImpl(
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as PaymentSummaryDetails,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentSummaryDetailsCopyWith<$Res> get details {
    return $PaymentSummaryDetailsCopyWith<$Res>(_value.details, (value) {
      return _then(_value.copyWith(details: value));
    });
  }
}

/// @nodoc

class _$FetchPaymentSummaryDetailsEventImpl
    implements _FetchPaymentSummaryDetailsEvent {
  const _$FetchPaymentSummaryDetailsEventImpl(
      {required this.details, required this.isMarketPlace});

  @override
  final PaymentSummaryDetails details;
  @override
  final bool isMarketPlace;

  @override
  String toString() {
    return 'PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(details: $details, isMarketPlace: $isMarketPlace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchPaymentSummaryDetailsEventImpl &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.isMarketPlace, isMarketPlace) ||
                other.isMarketPlace == isMarketPlace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, details, isMarketPlace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchPaymentSummaryDetailsEventImplCopyWith<
          _$FetchPaymentSummaryDetailsEventImpl>
      get copyWith => __$$FetchPaymentSummaryDetailsEventImplCopyWithImpl<
          _$FetchPaymentSummaryDetailsEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, User user, ShipToInfo shipToInfo)
        initialized,
    required TResult Function(PaymentSummaryDetails details, bool isMarketPlace)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function(bool isMarketPlace) fetchPaymentSummaryList,
    required TResult Function() fetchBankInstruction,
    required TResult Function(bool isMarketPlace) fetchAdvice,
    required TResult Function() saveAdvice,
    required TResult Function(bool isMarketPlace) deleteAdvice,
    required TResult Function() cancelAdvice,
    required TResult Function() viewSavedAdvice,
  }) {
    return fetchPaymentSummaryDetailsInfo(details, isMarketPlace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(PaymentSummaryDetails details, bool isMarketPlace)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function(bool isMarketPlace)? fetchPaymentSummaryList,
    TResult? Function()? fetchBankInstruction,
    TResult? Function(bool isMarketPlace)? fetchAdvice,
    TResult? Function()? saveAdvice,
    TResult? Function(bool isMarketPlace)? deleteAdvice,
    TResult? Function()? cancelAdvice,
    TResult? Function()? viewSavedAdvice,
  }) {
    return fetchPaymentSummaryDetailsInfo?.call(details, isMarketPlace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(PaymentSummaryDetails details, bool isMarketPlace)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function(bool isMarketPlace)? fetchPaymentSummaryList,
    TResult Function()? fetchBankInstruction,
    TResult Function(bool isMarketPlace)? fetchAdvice,
    TResult Function()? saveAdvice,
    TResult Function(bool isMarketPlace)? deleteAdvice,
    TResult Function()? cancelAdvice,
    TResult Function()? viewSavedAdvice,
    required TResult orElse(),
  }) {
    if (fetchPaymentSummaryDetailsInfo != null) {
      return fetchPaymentSummaryDetailsInfo(details, isMarketPlace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchPaymentSummaryDetailsEvent value)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function(_FetchPaymentSummaryListEvent value)
        fetchPaymentSummaryList,
    required TResult Function(_FetchBankInstruction value) fetchBankInstruction,
    required TResult Function(_FetchAdvice value) fetchAdvice,
    required TResult Function(_SaveAdvice value) saveAdvice,
    required TResult Function(_DeleteAdvice value) deleteAdvice,
    required TResult Function(_CancelAdvice value) cancelAdvice,
    required TResult Function(_ViewSavedAdvice value) viewSavedAdvice,
  }) {
    return fetchPaymentSummaryDetailsInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult? Function(_FetchBankInstruction value)? fetchBankInstruction,
    TResult? Function(_FetchAdvice value)? fetchAdvice,
    TResult? Function(_SaveAdvice value)? saveAdvice,
    TResult? Function(_DeleteAdvice value)? deleteAdvice,
    TResult? Function(_CancelAdvice value)? cancelAdvice,
    TResult? Function(_ViewSavedAdvice value)? viewSavedAdvice,
  }) {
    return fetchPaymentSummaryDetailsInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult Function(_FetchBankInstruction value)? fetchBankInstruction,
    TResult Function(_FetchAdvice value)? fetchAdvice,
    TResult Function(_SaveAdvice value)? saveAdvice,
    TResult Function(_DeleteAdvice value)? deleteAdvice,
    TResult Function(_CancelAdvice value)? cancelAdvice,
    TResult Function(_ViewSavedAdvice value)? viewSavedAdvice,
    required TResult orElse(),
  }) {
    if (fetchPaymentSummaryDetailsInfo != null) {
      return fetchPaymentSummaryDetailsInfo(this);
    }
    return orElse();
  }
}

abstract class _FetchPaymentSummaryDetailsEvent
    implements PaymentSummaryDetailsEvent {
  const factory _FetchPaymentSummaryDetailsEvent(
          {required final PaymentSummaryDetails details,
          required final bool isMarketPlace}) =
      _$FetchPaymentSummaryDetailsEventImpl;

  PaymentSummaryDetails get details;
  bool get isMarketPlace;
  @JsonKey(ignore: true)
  _$$FetchPaymentSummaryDetailsEventImplCopyWith<
          _$FetchPaymentSummaryDetailsEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchPaymentSummaryListEventImplCopyWith<$Res> {
  factory _$$FetchPaymentSummaryListEventImplCopyWith(
          _$FetchPaymentSummaryListEventImpl value,
          $Res Function(_$FetchPaymentSummaryListEventImpl) then) =
      __$$FetchPaymentSummaryListEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isMarketPlace});
}

/// @nodoc
class __$$FetchPaymentSummaryListEventImplCopyWithImpl<$Res>
    extends _$PaymentSummaryDetailsEventCopyWithImpl<$Res,
        _$FetchPaymentSummaryListEventImpl>
    implements _$$FetchPaymentSummaryListEventImplCopyWith<$Res> {
  __$$FetchPaymentSummaryListEventImplCopyWithImpl(
      _$FetchPaymentSummaryListEventImpl _value,
      $Res Function(_$FetchPaymentSummaryListEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isMarketPlace = null,
  }) {
    return _then(_$FetchPaymentSummaryListEventImpl(
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FetchPaymentSummaryListEventImpl
    implements _FetchPaymentSummaryListEvent {
  const _$FetchPaymentSummaryListEventImpl({required this.isMarketPlace});

  @override
  final bool isMarketPlace;

  @override
  String toString() {
    return 'PaymentSummaryDetailsEvent.fetchPaymentSummaryList(isMarketPlace: $isMarketPlace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchPaymentSummaryListEventImpl &&
            (identical(other.isMarketPlace, isMarketPlace) ||
                other.isMarketPlace == isMarketPlace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isMarketPlace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchPaymentSummaryListEventImplCopyWith<
          _$FetchPaymentSummaryListEventImpl>
      get copyWith => __$$FetchPaymentSummaryListEventImplCopyWithImpl<
          _$FetchPaymentSummaryListEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, User user, ShipToInfo shipToInfo)
        initialized,
    required TResult Function(PaymentSummaryDetails details, bool isMarketPlace)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function(bool isMarketPlace) fetchPaymentSummaryList,
    required TResult Function() fetchBankInstruction,
    required TResult Function(bool isMarketPlace) fetchAdvice,
    required TResult Function() saveAdvice,
    required TResult Function(bool isMarketPlace) deleteAdvice,
    required TResult Function() cancelAdvice,
    required TResult Function() viewSavedAdvice,
  }) {
    return fetchPaymentSummaryList(isMarketPlace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(PaymentSummaryDetails details, bool isMarketPlace)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function(bool isMarketPlace)? fetchPaymentSummaryList,
    TResult? Function()? fetchBankInstruction,
    TResult? Function(bool isMarketPlace)? fetchAdvice,
    TResult? Function()? saveAdvice,
    TResult? Function(bool isMarketPlace)? deleteAdvice,
    TResult? Function()? cancelAdvice,
    TResult? Function()? viewSavedAdvice,
  }) {
    return fetchPaymentSummaryList?.call(isMarketPlace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(PaymentSummaryDetails details, bool isMarketPlace)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function(bool isMarketPlace)? fetchPaymentSummaryList,
    TResult Function()? fetchBankInstruction,
    TResult Function(bool isMarketPlace)? fetchAdvice,
    TResult Function()? saveAdvice,
    TResult Function(bool isMarketPlace)? deleteAdvice,
    TResult Function()? cancelAdvice,
    TResult Function()? viewSavedAdvice,
    required TResult orElse(),
  }) {
    if (fetchPaymentSummaryList != null) {
      return fetchPaymentSummaryList(isMarketPlace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchPaymentSummaryDetailsEvent value)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function(_FetchPaymentSummaryListEvent value)
        fetchPaymentSummaryList,
    required TResult Function(_FetchBankInstruction value) fetchBankInstruction,
    required TResult Function(_FetchAdvice value) fetchAdvice,
    required TResult Function(_SaveAdvice value) saveAdvice,
    required TResult Function(_DeleteAdvice value) deleteAdvice,
    required TResult Function(_CancelAdvice value) cancelAdvice,
    required TResult Function(_ViewSavedAdvice value) viewSavedAdvice,
  }) {
    return fetchPaymentSummaryList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult? Function(_FetchBankInstruction value)? fetchBankInstruction,
    TResult? Function(_FetchAdvice value)? fetchAdvice,
    TResult? Function(_SaveAdvice value)? saveAdvice,
    TResult? Function(_DeleteAdvice value)? deleteAdvice,
    TResult? Function(_CancelAdvice value)? cancelAdvice,
    TResult? Function(_ViewSavedAdvice value)? viewSavedAdvice,
  }) {
    return fetchPaymentSummaryList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult Function(_FetchBankInstruction value)? fetchBankInstruction,
    TResult Function(_FetchAdvice value)? fetchAdvice,
    TResult Function(_SaveAdvice value)? saveAdvice,
    TResult Function(_DeleteAdvice value)? deleteAdvice,
    TResult Function(_CancelAdvice value)? cancelAdvice,
    TResult Function(_ViewSavedAdvice value)? viewSavedAdvice,
    required TResult orElse(),
  }) {
    if (fetchPaymentSummaryList != null) {
      return fetchPaymentSummaryList(this);
    }
    return orElse();
  }
}

abstract class _FetchPaymentSummaryListEvent
    implements PaymentSummaryDetailsEvent {
  const factory _FetchPaymentSummaryListEvent(
      {required final bool isMarketPlace}) = _$FetchPaymentSummaryListEventImpl;

  bool get isMarketPlace;
  @JsonKey(ignore: true)
  _$$FetchPaymentSummaryListEventImplCopyWith<
          _$FetchPaymentSummaryListEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchBankInstructionImplCopyWith<$Res> {
  factory _$$FetchBankInstructionImplCopyWith(_$FetchBankInstructionImpl value,
          $Res Function(_$FetchBankInstructionImpl) then) =
      __$$FetchBankInstructionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchBankInstructionImplCopyWithImpl<$Res>
    extends _$PaymentSummaryDetailsEventCopyWithImpl<$Res,
        _$FetchBankInstructionImpl>
    implements _$$FetchBankInstructionImplCopyWith<$Res> {
  __$$FetchBankInstructionImplCopyWithImpl(_$FetchBankInstructionImpl _value,
      $Res Function(_$FetchBankInstructionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchBankInstructionImpl implements _FetchBankInstruction {
  const _$FetchBankInstructionImpl();

  @override
  String toString() {
    return 'PaymentSummaryDetailsEvent.fetchBankInstruction()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchBankInstructionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, User user, ShipToInfo shipToInfo)
        initialized,
    required TResult Function(PaymentSummaryDetails details, bool isMarketPlace)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function(bool isMarketPlace) fetchPaymentSummaryList,
    required TResult Function() fetchBankInstruction,
    required TResult Function(bool isMarketPlace) fetchAdvice,
    required TResult Function() saveAdvice,
    required TResult Function(bool isMarketPlace) deleteAdvice,
    required TResult Function() cancelAdvice,
    required TResult Function() viewSavedAdvice,
  }) {
    return fetchBankInstruction();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(PaymentSummaryDetails details, bool isMarketPlace)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function(bool isMarketPlace)? fetchPaymentSummaryList,
    TResult? Function()? fetchBankInstruction,
    TResult? Function(bool isMarketPlace)? fetchAdvice,
    TResult? Function()? saveAdvice,
    TResult? Function(bool isMarketPlace)? deleteAdvice,
    TResult? Function()? cancelAdvice,
    TResult? Function()? viewSavedAdvice,
  }) {
    return fetchBankInstruction?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(PaymentSummaryDetails details, bool isMarketPlace)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function(bool isMarketPlace)? fetchPaymentSummaryList,
    TResult Function()? fetchBankInstruction,
    TResult Function(bool isMarketPlace)? fetchAdvice,
    TResult Function()? saveAdvice,
    TResult Function(bool isMarketPlace)? deleteAdvice,
    TResult Function()? cancelAdvice,
    TResult Function()? viewSavedAdvice,
    required TResult orElse(),
  }) {
    if (fetchBankInstruction != null) {
      return fetchBankInstruction();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchPaymentSummaryDetailsEvent value)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function(_FetchPaymentSummaryListEvent value)
        fetchPaymentSummaryList,
    required TResult Function(_FetchBankInstruction value) fetchBankInstruction,
    required TResult Function(_FetchAdvice value) fetchAdvice,
    required TResult Function(_SaveAdvice value) saveAdvice,
    required TResult Function(_DeleteAdvice value) deleteAdvice,
    required TResult Function(_CancelAdvice value) cancelAdvice,
    required TResult Function(_ViewSavedAdvice value) viewSavedAdvice,
  }) {
    return fetchBankInstruction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult? Function(_FetchBankInstruction value)? fetchBankInstruction,
    TResult? Function(_FetchAdvice value)? fetchAdvice,
    TResult? Function(_SaveAdvice value)? saveAdvice,
    TResult? Function(_DeleteAdvice value)? deleteAdvice,
    TResult? Function(_CancelAdvice value)? cancelAdvice,
    TResult? Function(_ViewSavedAdvice value)? viewSavedAdvice,
  }) {
    return fetchBankInstruction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult Function(_FetchBankInstruction value)? fetchBankInstruction,
    TResult Function(_FetchAdvice value)? fetchAdvice,
    TResult Function(_SaveAdvice value)? saveAdvice,
    TResult Function(_DeleteAdvice value)? deleteAdvice,
    TResult Function(_CancelAdvice value)? cancelAdvice,
    TResult Function(_ViewSavedAdvice value)? viewSavedAdvice,
    required TResult orElse(),
  }) {
    if (fetchBankInstruction != null) {
      return fetchBankInstruction(this);
    }
    return orElse();
  }
}

abstract class _FetchBankInstruction implements PaymentSummaryDetailsEvent {
  const factory _FetchBankInstruction() = _$FetchBankInstructionImpl;
}

/// @nodoc
abstract class _$$FetchAdviceImplCopyWith<$Res> {
  factory _$$FetchAdviceImplCopyWith(
          _$FetchAdviceImpl value, $Res Function(_$FetchAdviceImpl) then) =
      __$$FetchAdviceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isMarketPlace});
}

/// @nodoc
class __$$FetchAdviceImplCopyWithImpl<$Res>
    extends _$PaymentSummaryDetailsEventCopyWithImpl<$Res, _$FetchAdviceImpl>
    implements _$$FetchAdviceImplCopyWith<$Res> {
  __$$FetchAdviceImplCopyWithImpl(
      _$FetchAdviceImpl _value, $Res Function(_$FetchAdviceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isMarketPlace = null,
  }) {
    return _then(_$FetchAdviceImpl(
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FetchAdviceImpl implements _FetchAdvice {
  const _$FetchAdviceImpl({required this.isMarketPlace});

  @override
  final bool isMarketPlace;

  @override
  String toString() {
    return 'PaymentSummaryDetailsEvent.fetchAdvice(isMarketPlace: $isMarketPlace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAdviceImpl &&
            (identical(other.isMarketPlace, isMarketPlace) ||
                other.isMarketPlace == isMarketPlace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isMarketPlace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchAdviceImplCopyWith<_$FetchAdviceImpl> get copyWith =>
      __$$FetchAdviceImplCopyWithImpl<_$FetchAdviceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, User user, ShipToInfo shipToInfo)
        initialized,
    required TResult Function(PaymentSummaryDetails details, bool isMarketPlace)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function(bool isMarketPlace) fetchPaymentSummaryList,
    required TResult Function() fetchBankInstruction,
    required TResult Function(bool isMarketPlace) fetchAdvice,
    required TResult Function() saveAdvice,
    required TResult Function(bool isMarketPlace) deleteAdvice,
    required TResult Function() cancelAdvice,
    required TResult Function() viewSavedAdvice,
  }) {
    return fetchAdvice(isMarketPlace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(PaymentSummaryDetails details, bool isMarketPlace)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function(bool isMarketPlace)? fetchPaymentSummaryList,
    TResult? Function()? fetchBankInstruction,
    TResult? Function(bool isMarketPlace)? fetchAdvice,
    TResult? Function()? saveAdvice,
    TResult? Function(bool isMarketPlace)? deleteAdvice,
    TResult? Function()? cancelAdvice,
    TResult? Function()? viewSavedAdvice,
  }) {
    return fetchAdvice?.call(isMarketPlace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(PaymentSummaryDetails details, bool isMarketPlace)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function(bool isMarketPlace)? fetchPaymentSummaryList,
    TResult Function()? fetchBankInstruction,
    TResult Function(bool isMarketPlace)? fetchAdvice,
    TResult Function()? saveAdvice,
    TResult Function(bool isMarketPlace)? deleteAdvice,
    TResult Function()? cancelAdvice,
    TResult Function()? viewSavedAdvice,
    required TResult orElse(),
  }) {
    if (fetchAdvice != null) {
      return fetchAdvice(isMarketPlace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchPaymentSummaryDetailsEvent value)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function(_FetchPaymentSummaryListEvent value)
        fetchPaymentSummaryList,
    required TResult Function(_FetchBankInstruction value) fetchBankInstruction,
    required TResult Function(_FetchAdvice value) fetchAdvice,
    required TResult Function(_SaveAdvice value) saveAdvice,
    required TResult Function(_DeleteAdvice value) deleteAdvice,
    required TResult Function(_CancelAdvice value) cancelAdvice,
    required TResult Function(_ViewSavedAdvice value) viewSavedAdvice,
  }) {
    return fetchAdvice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult? Function(_FetchBankInstruction value)? fetchBankInstruction,
    TResult? Function(_FetchAdvice value)? fetchAdvice,
    TResult? Function(_SaveAdvice value)? saveAdvice,
    TResult? Function(_DeleteAdvice value)? deleteAdvice,
    TResult? Function(_CancelAdvice value)? cancelAdvice,
    TResult? Function(_ViewSavedAdvice value)? viewSavedAdvice,
  }) {
    return fetchAdvice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult Function(_FetchBankInstruction value)? fetchBankInstruction,
    TResult Function(_FetchAdvice value)? fetchAdvice,
    TResult Function(_SaveAdvice value)? saveAdvice,
    TResult Function(_DeleteAdvice value)? deleteAdvice,
    TResult Function(_CancelAdvice value)? cancelAdvice,
    TResult Function(_ViewSavedAdvice value)? viewSavedAdvice,
    required TResult orElse(),
  }) {
    if (fetchAdvice != null) {
      return fetchAdvice(this);
    }
    return orElse();
  }
}

abstract class _FetchAdvice implements PaymentSummaryDetailsEvent {
  const factory _FetchAdvice({required final bool isMarketPlace}) =
      _$FetchAdviceImpl;

  bool get isMarketPlace;
  @JsonKey(ignore: true)
  _$$FetchAdviceImplCopyWith<_$FetchAdviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveAdviceImplCopyWith<$Res> {
  factory _$$SaveAdviceImplCopyWith(
          _$SaveAdviceImpl value, $Res Function(_$SaveAdviceImpl) then) =
      __$$SaveAdviceImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SaveAdviceImplCopyWithImpl<$Res>
    extends _$PaymentSummaryDetailsEventCopyWithImpl<$Res, _$SaveAdviceImpl>
    implements _$$SaveAdviceImplCopyWith<$Res> {
  __$$SaveAdviceImplCopyWithImpl(
      _$SaveAdviceImpl _value, $Res Function(_$SaveAdviceImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SaveAdviceImpl implements _SaveAdvice {
  const _$SaveAdviceImpl();

  @override
  String toString() {
    return 'PaymentSummaryDetailsEvent.saveAdvice()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SaveAdviceImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, User user, ShipToInfo shipToInfo)
        initialized,
    required TResult Function(PaymentSummaryDetails details, bool isMarketPlace)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function(bool isMarketPlace) fetchPaymentSummaryList,
    required TResult Function() fetchBankInstruction,
    required TResult Function(bool isMarketPlace) fetchAdvice,
    required TResult Function() saveAdvice,
    required TResult Function(bool isMarketPlace) deleteAdvice,
    required TResult Function() cancelAdvice,
    required TResult Function() viewSavedAdvice,
  }) {
    return saveAdvice();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(PaymentSummaryDetails details, bool isMarketPlace)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function(bool isMarketPlace)? fetchPaymentSummaryList,
    TResult? Function()? fetchBankInstruction,
    TResult? Function(bool isMarketPlace)? fetchAdvice,
    TResult? Function()? saveAdvice,
    TResult? Function(bool isMarketPlace)? deleteAdvice,
    TResult? Function()? cancelAdvice,
    TResult? Function()? viewSavedAdvice,
  }) {
    return saveAdvice?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(PaymentSummaryDetails details, bool isMarketPlace)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function(bool isMarketPlace)? fetchPaymentSummaryList,
    TResult Function()? fetchBankInstruction,
    TResult Function(bool isMarketPlace)? fetchAdvice,
    TResult Function()? saveAdvice,
    TResult Function(bool isMarketPlace)? deleteAdvice,
    TResult Function()? cancelAdvice,
    TResult Function()? viewSavedAdvice,
    required TResult orElse(),
  }) {
    if (saveAdvice != null) {
      return saveAdvice();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchPaymentSummaryDetailsEvent value)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function(_FetchPaymentSummaryListEvent value)
        fetchPaymentSummaryList,
    required TResult Function(_FetchBankInstruction value) fetchBankInstruction,
    required TResult Function(_FetchAdvice value) fetchAdvice,
    required TResult Function(_SaveAdvice value) saveAdvice,
    required TResult Function(_DeleteAdvice value) deleteAdvice,
    required TResult Function(_CancelAdvice value) cancelAdvice,
    required TResult Function(_ViewSavedAdvice value) viewSavedAdvice,
  }) {
    return saveAdvice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult? Function(_FetchBankInstruction value)? fetchBankInstruction,
    TResult? Function(_FetchAdvice value)? fetchAdvice,
    TResult? Function(_SaveAdvice value)? saveAdvice,
    TResult? Function(_DeleteAdvice value)? deleteAdvice,
    TResult? Function(_CancelAdvice value)? cancelAdvice,
    TResult? Function(_ViewSavedAdvice value)? viewSavedAdvice,
  }) {
    return saveAdvice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult Function(_FetchBankInstruction value)? fetchBankInstruction,
    TResult Function(_FetchAdvice value)? fetchAdvice,
    TResult Function(_SaveAdvice value)? saveAdvice,
    TResult Function(_DeleteAdvice value)? deleteAdvice,
    TResult Function(_CancelAdvice value)? cancelAdvice,
    TResult Function(_ViewSavedAdvice value)? viewSavedAdvice,
    required TResult orElse(),
  }) {
    if (saveAdvice != null) {
      return saveAdvice(this);
    }
    return orElse();
  }
}

abstract class _SaveAdvice implements PaymentSummaryDetailsEvent {
  const factory _SaveAdvice() = _$SaveAdviceImpl;
}

/// @nodoc
abstract class _$$DeleteAdviceImplCopyWith<$Res> {
  factory _$$DeleteAdviceImplCopyWith(
          _$DeleteAdviceImpl value, $Res Function(_$DeleteAdviceImpl) then) =
      __$$DeleteAdviceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isMarketPlace});
}

/// @nodoc
class __$$DeleteAdviceImplCopyWithImpl<$Res>
    extends _$PaymentSummaryDetailsEventCopyWithImpl<$Res, _$DeleteAdviceImpl>
    implements _$$DeleteAdviceImplCopyWith<$Res> {
  __$$DeleteAdviceImplCopyWithImpl(
      _$DeleteAdviceImpl _value, $Res Function(_$DeleteAdviceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isMarketPlace = null,
  }) {
    return _then(_$DeleteAdviceImpl(
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DeleteAdviceImpl implements _DeleteAdvice {
  const _$DeleteAdviceImpl({required this.isMarketPlace});

  @override
  final bool isMarketPlace;

  @override
  String toString() {
    return 'PaymentSummaryDetailsEvent.deleteAdvice(isMarketPlace: $isMarketPlace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteAdviceImpl &&
            (identical(other.isMarketPlace, isMarketPlace) ||
                other.isMarketPlace == isMarketPlace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isMarketPlace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteAdviceImplCopyWith<_$DeleteAdviceImpl> get copyWith =>
      __$$DeleteAdviceImplCopyWithImpl<_$DeleteAdviceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, User user, ShipToInfo shipToInfo)
        initialized,
    required TResult Function(PaymentSummaryDetails details, bool isMarketPlace)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function(bool isMarketPlace) fetchPaymentSummaryList,
    required TResult Function() fetchBankInstruction,
    required TResult Function(bool isMarketPlace) fetchAdvice,
    required TResult Function() saveAdvice,
    required TResult Function(bool isMarketPlace) deleteAdvice,
    required TResult Function() cancelAdvice,
    required TResult Function() viewSavedAdvice,
  }) {
    return deleteAdvice(isMarketPlace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(PaymentSummaryDetails details, bool isMarketPlace)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function(bool isMarketPlace)? fetchPaymentSummaryList,
    TResult? Function()? fetchBankInstruction,
    TResult? Function(bool isMarketPlace)? fetchAdvice,
    TResult? Function()? saveAdvice,
    TResult? Function(bool isMarketPlace)? deleteAdvice,
    TResult? Function()? cancelAdvice,
    TResult? Function()? viewSavedAdvice,
  }) {
    return deleteAdvice?.call(isMarketPlace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(PaymentSummaryDetails details, bool isMarketPlace)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function(bool isMarketPlace)? fetchPaymentSummaryList,
    TResult Function()? fetchBankInstruction,
    TResult Function(bool isMarketPlace)? fetchAdvice,
    TResult Function()? saveAdvice,
    TResult Function(bool isMarketPlace)? deleteAdvice,
    TResult Function()? cancelAdvice,
    TResult Function()? viewSavedAdvice,
    required TResult orElse(),
  }) {
    if (deleteAdvice != null) {
      return deleteAdvice(isMarketPlace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchPaymentSummaryDetailsEvent value)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function(_FetchPaymentSummaryListEvent value)
        fetchPaymentSummaryList,
    required TResult Function(_FetchBankInstruction value) fetchBankInstruction,
    required TResult Function(_FetchAdvice value) fetchAdvice,
    required TResult Function(_SaveAdvice value) saveAdvice,
    required TResult Function(_DeleteAdvice value) deleteAdvice,
    required TResult Function(_CancelAdvice value) cancelAdvice,
    required TResult Function(_ViewSavedAdvice value) viewSavedAdvice,
  }) {
    return deleteAdvice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult? Function(_FetchBankInstruction value)? fetchBankInstruction,
    TResult? Function(_FetchAdvice value)? fetchAdvice,
    TResult? Function(_SaveAdvice value)? saveAdvice,
    TResult? Function(_DeleteAdvice value)? deleteAdvice,
    TResult? Function(_CancelAdvice value)? cancelAdvice,
    TResult? Function(_ViewSavedAdvice value)? viewSavedAdvice,
  }) {
    return deleteAdvice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult Function(_FetchBankInstruction value)? fetchBankInstruction,
    TResult Function(_FetchAdvice value)? fetchAdvice,
    TResult Function(_SaveAdvice value)? saveAdvice,
    TResult Function(_DeleteAdvice value)? deleteAdvice,
    TResult Function(_CancelAdvice value)? cancelAdvice,
    TResult Function(_ViewSavedAdvice value)? viewSavedAdvice,
    required TResult orElse(),
  }) {
    if (deleteAdvice != null) {
      return deleteAdvice(this);
    }
    return orElse();
  }
}

abstract class _DeleteAdvice implements PaymentSummaryDetailsEvent {
  const factory _DeleteAdvice({required final bool isMarketPlace}) =
      _$DeleteAdviceImpl;

  bool get isMarketPlace;
  @JsonKey(ignore: true)
  _$$DeleteAdviceImplCopyWith<_$DeleteAdviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelAdviceImplCopyWith<$Res> {
  factory _$$CancelAdviceImplCopyWith(
          _$CancelAdviceImpl value, $Res Function(_$CancelAdviceImpl) then) =
      __$$CancelAdviceImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CancelAdviceImplCopyWithImpl<$Res>
    extends _$PaymentSummaryDetailsEventCopyWithImpl<$Res, _$CancelAdviceImpl>
    implements _$$CancelAdviceImplCopyWith<$Res> {
  __$$CancelAdviceImplCopyWithImpl(
      _$CancelAdviceImpl _value, $Res Function(_$CancelAdviceImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CancelAdviceImpl implements _CancelAdvice {
  const _$CancelAdviceImpl();

  @override
  String toString() {
    return 'PaymentSummaryDetailsEvent.cancelAdvice()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CancelAdviceImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, User user, ShipToInfo shipToInfo)
        initialized,
    required TResult Function(PaymentSummaryDetails details, bool isMarketPlace)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function(bool isMarketPlace) fetchPaymentSummaryList,
    required TResult Function() fetchBankInstruction,
    required TResult Function(bool isMarketPlace) fetchAdvice,
    required TResult Function() saveAdvice,
    required TResult Function(bool isMarketPlace) deleteAdvice,
    required TResult Function() cancelAdvice,
    required TResult Function() viewSavedAdvice,
  }) {
    return cancelAdvice();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(PaymentSummaryDetails details, bool isMarketPlace)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function(bool isMarketPlace)? fetchPaymentSummaryList,
    TResult? Function()? fetchBankInstruction,
    TResult? Function(bool isMarketPlace)? fetchAdvice,
    TResult? Function()? saveAdvice,
    TResult? Function(bool isMarketPlace)? deleteAdvice,
    TResult? Function()? cancelAdvice,
    TResult? Function()? viewSavedAdvice,
  }) {
    return cancelAdvice?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(PaymentSummaryDetails details, bool isMarketPlace)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function(bool isMarketPlace)? fetchPaymentSummaryList,
    TResult Function()? fetchBankInstruction,
    TResult Function(bool isMarketPlace)? fetchAdvice,
    TResult Function()? saveAdvice,
    TResult Function(bool isMarketPlace)? deleteAdvice,
    TResult Function()? cancelAdvice,
    TResult Function()? viewSavedAdvice,
    required TResult orElse(),
  }) {
    if (cancelAdvice != null) {
      return cancelAdvice();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchPaymentSummaryDetailsEvent value)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function(_FetchPaymentSummaryListEvent value)
        fetchPaymentSummaryList,
    required TResult Function(_FetchBankInstruction value) fetchBankInstruction,
    required TResult Function(_FetchAdvice value) fetchAdvice,
    required TResult Function(_SaveAdvice value) saveAdvice,
    required TResult Function(_DeleteAdvice value) deleteAdvice,
    required TResult Function(_CancelAdvice value) cancelAdvice,
    required TResult Function(_ViewSavedAdvice value) viewSavedAdvice,
  }) {
    return cancelAdvice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult? Function(_FetchBankInstruction value)? fetchBankInstruction,
    TResult? Function(_FetchAdvice value)? fetchAdvice,
    TResult? Function(_SaveAdvice value)? saveAdvice,
    TResult? Function(_DeleteAdvice value)? deleteAdvice,
    TResult? Function(_CancelAdvice value)? cancelAdvice,
    TResult? Function(_ViewSavedAdvice value)? viewSavedAdvice,
  }) {
    return cancelAdvice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult Function(_FetchBankInstruction value)? fetchBankInstruction,
    TResult Function(_FetchAdvice value)? fetchAdvice,
    TResult Function(_SaveAdvice value)? saveAdvice,
    TResult Function(_DeleteAdvice value)? deleteAdvice,
    TResult Function(_CancelAdvice value)? cancelAdvice,
    TResult Function(_ViewSavedAdvice value)? viewSavedAdvice,
    required TResult orElse(),
  }) {
    if (cancelAdvice != null) {
      return cancelAdvice(this);
    }
    return orElse();
  }
}

abstract class _CancelAdvice implements PaymentSummaryDetailsEvent {
  const factory _CancelAdvice() = _$CancelAdviceImpl;
}

/// @nodoc
abstract class _$$ViewSavedAdviceImplCopyWith<$Res> {
  factory _$$ViewSavedAdviceImplCopyWith(_$ViewSavedAdviceImpl value,
          $Res Function(_$ViewSavedAdviceImpl) then) =
      __$$ViewSavedAdviceImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ViewSavedAdviceImplCopyWithImpl<$Res>
    extends _$PaymentSummaryDetailsEventCopyWithImpl<$Res,
        _$ViewSavedAdviceImpl> implements _$$ViewSavedAdviceImplCopyWith<$Res> {
  __$$ViewSavedAdviceImplCopyWithImpl(
      _$ViewSavedAdviceImpl _value, $Res Function(_$ViewSavedAdviceImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ViewSavedAdviceImpl implements _ViewSavedAdvice {
  const _$ViewSavedAdviceImpl();

  @override
  String toString() {
    return 'PaymentSummaryDetailsEvent.viewSavedAdvice()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ViewSavedAdviceImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo, User user, ShipToInfo shipToInfo)
        initialized,
    required TResult Function(PaymentSummaryDetails details, bool isMarketPlace)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function(bool isMarketPlace) fetchPaymentSummaryList,
    required TResult Function() fetchBankInstruction,
    required TResult Function(bool isMarketPlace) fetchAdvice,
    required TResult Function() saveAdvice,
    required TResult Function(bool isMarketPlace) deleteAdvice,
    required TResult Function() cancelAdvice,
    required TResult Function() viewSavedAdvice,
  }) {
    return viewSavedAdvice();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult? Function(PaymentSummaryDetails details, bool isMarketPlace)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function(bool isMarketPlace)? fetchPaymentSummaryList,
    TResult? Function()? fetchBankInstruction,
    TResult? Function(bool isMarketPlace)? fetchAdvice,
    TResult? Function()? saveAdvice,
    TResult? Function(bool isMarketPlace)? deleteAdvice,
    TResult? Function()? cancelAdvice,
    TResult? Function()? viewSavedAdvice,
  }) {
    return viewSavedAdvice?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            SalesOrganisation salesOrganization,
            CustomerCodeInfo customerCodeInfo,
            User user,
            ShipToInfo shipToInfo)?
        initialized,
    TResult Function(PaymentSummaryDetails details, bool isMarketPlace)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function(bool isMarketPlace)? fetchPaymentSummaryList,
    TResult Function()? fetchBankInstruction,
    TResult Function(bool isMarketPlace)? fetchAdvice,
    TResult Function()? saveAdvice,
    TResult Function(bool isMarketPlace)? deleteAdvice,
    TResult Function()? cancelAdvice,
    TResult Function()? viewSavedAdvice,
    required TResult orElse(),
  }) {
    if (viewSavedAdvice != null) {
      return viewSavedAdvice();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_FetchPaymentSummaryDetailsEvent value)
        fetchPaymentSummaryDetailsInfo,
    required TResult Function(_FetchPaymentSummaryListEvent value)
        fetchPaymentSummaryList,
    required TResult Function(_FetchBankInstruction value) fetchBankInstruction,
    required TResult Function(_FetchAdvice value) fetchAdvice,
    required TResult Function(_SaveAdvice value) saveAdvice,
    required TResult Function(_DeleteAdvice value) deleteAdvice,
    required TResult Function(_CancelAdvice value) cancelAdvice,
    required TResult Function(_ViewSavedAdvice value) viewSavedAdvice,
  }) {
    return viewSavedAdvice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult? Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult? Function(_FetchBankInstruction value)? fetchBankInstruction,
    TResult? Function(_FetchAdvice value)? fetchAdvice,
    TResult? Function(_SaveAdvice value)? saveAdvice,
    TResult? Function(_DeleteAdvice value)? deleteAdvice,
    TResult? Function(_CancelAdvice value)? cancelAdvice,
    TResult? Function(_ViewSavedAdvice value)? viewSavedAdvice,
  }) {
    return viewSavedAdvice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_FetchPaymentSummaryDetailsEvent value)?
        fetchPaymentSummaryDetailsInfo,
    TResult Function(_FetchPaymentSummaryListEvent value)?
        fetchPaymentSummaryList,
    TResult Function(_FetchBankInstruction value)? fetchBankInstruction,
    TResult Function(_FetchAdvice value)? fetchAdvice,
    TResult Function(_SaveAdvice value)? saveAdvice,
    TResult Function(_DeleteAdvice value)? deleteAdvice,
    TResult Function(_CancelAdvice value)? cancelAdvice,
    TResult Function(_ViewSavedAdvice value)? viewSavedAdvice,
    required TResult orElse(),
  }) {
    if (viewSavedAdvice != null) {
      return viewSavedAdvice(this);
    }
    return orElse();
  }
}

abstract class _ViewSavedAdvice implements PaymentSummaryDetailsEvent {
  const factory _ViewSavedAdvice() = _$ViewSavedAdviceImpl;
}

/// @nodoc
mixin _$PaymentSummaryDetailsState {
  PaymentSummaryDetails get details => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganization => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  bool get isDetailFetching => throw _privateConstructorUsedError;
  bool get isListLoading => throw _privateConstructorUsedError;
  bool get isFetchingAdvice => throw _privateConstructorUsedError;
  bool get isSavingAdvice => throw _privateConstructorUsedError;
  ShipToInfo get shipToInfo => throw _privateConstructorUsedError;
  PaymentInvoiceInfoPdf get paymentInvoiceInfoPdf =>
      throw _privateConstructorUsedError;
  bool get isDeletingPayment => throw _privateConstructorUsedError;
  bool get isCancelingAdvice => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  BankInstruction get bankInstruction => throw _privateConstructorUsedError;
  AttachmentFileBuffer get savedAdvice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentSummaryDetailsStateCopyWith<PaymentSummaryDetailsState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentSummaryDetailsStateCopyWith<$Res> {
  factory $PaymentSummaryDetailsStateCopyWith(PaymentSummaryDetailsState value,
          $Res Function(PaymentSummaryDetailsState) then) =
      _$PaymentSummaryDetailsStateCopyWithImpl<$Res,
          PaymentSummaryDetailsState>;
  @useResult
  $Res call(
      {PaymentSummaryDetails details,
      SalesOrganisation salesOrganization,
      CustomerCodeInfo customerCodeInfo,
      User user,
      bool isDetailFetching,
      bool isListLoading,
      bool isFetchingAdvice,
      bool isSavingAdvice,
      ShipToInfo shipToInfo,
      PaymentInvoiceInfoPdf paymentInvoiceInfoPdf,
      bool isDeletingPayment,
      bool isCancelingAdvice,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      BankInstruction bankInstruction,
      AttachmentFileBuffer savedAdvice});

  $PaymentSummaryDetailsCopyWith<$Res> get details;
  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $UserCopyWith<$Res> get user;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $PaymentInvoiceInfoPdfCopyWith<$Res> get paymentInvoiceInfoPdf;
  $BankInstructionCopyWith<$Res> get bankInstruction;
  $AttachmentFileBufferCopyWith<$Res> get savedAdvice;
}

/// @nodoc
class _$PaymentSummaryDetailsStateCopyWithImpl<$Res,
        $Val extends PaymentSummaryDetailsState>
    implements $PaymentSummaryDetailsStateCopyWith<$Res> {
  _$PaymentSummaryDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
    Object? salesOrganization = null,
    Object? customerCodeInfo = null,
    Object? user = null,
    Object? isDetailFetching = null,
    Object? isListLoading = null,
    Object? isFetchingAdvice = null,
    Object? isSavingAdvice = null,
    Object? shipToInfo = null,
    Object? paymentInvoiceInfoPdf = null,
    Object? isDeletingPayment = null,
    Object? isCancelingAdvice = null,
    Object? failureOrSuccessOption = null,
    Object? bankInstruction = null,
    Object? savedAdvice = null,
  }) {
    return _then(_value.copyWith(
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as PaymentSummaryDetails,
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      isDetailFetching: null == isDetailFetching
          ? _value.isDetailFetching
          : isDetailFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isListLoading: null == isListLoading
          ? _value.isListLoading
          : isListLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingAdvice: null == isFetchingAdvice
          ? _value.isFetchingAdvice
          : isFetchingAdvice // ignore: cast_nullable_to_non_nullable
              as bool,
      isSavingAdvice: null == isSavingAdvice
          ? _value.isSavingAdvice
          : isSavingAdvice // ignore: cast_nullable_to_non_nullable
              as bool,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      paymentInvoiceInfoPdf: null == paymentInvoiceInfoPdf
          ? _value.paymentInvoiceInfoPdf
          : paymentInvoiceInfoPdf // ignore: cast_nullable_to_non_nullable
              as PaymentInvoiceInfoPdf,
      isDeletingPayment: null == isDeletingPayment
          ? _value.isDeletingPayment
          : isDeletingPayment // ignore: cast_nullable_to_non_nullable
              as bool,
      isCancelingAdvice: null == isCancelingAdvice
          ? _value.isCancelingAdvice
          : isCancelingAdvice // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      bankInstruction: null == bankInstruction
          ? _value.bankInstruction
          : bankInstruction // ignore: cast_nullable_to_non_nullable
              as BankInstruction,
      savedAdvice: null == savedAdvice
          ? _value.savedAdvice
          : savedAdvice // ignore: cast_nullable_to_non_nullable
              as AttachmentFileBuffer,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentSummaryDetailsCopyWith<$Res> get details {
    return $PaymentSummaryDetailsCopyWith<$Res>(_value.details, (value) {
      return _then(_value.copyWith(details: value) as $Val);
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
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value) as $Val);
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
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value) as $Val);
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
  $BankInstructionCopyWith<$Res> get bankInstruction {
    return $BankInstructionCopyWith<$Res>(_value.bankInstruction, (value) {
      return _then(_value.copyWith(bankInstruction: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AttachmentFileBufferCopyWith<$Res> get savedAdvice {
    return $AttachmentFileBufferCopyWith<$Res>(_value.savedAdvice, (value) {
      return _then(_value.copyWith(savedAdvice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentSummaryDetailsStateImplCopyWith<$Res>
    implements $PaymentSummaryDetailsStateCopyWith<$Res> {
  factory _$$PaymentSummaryDetailsStateImplCopyWith(
          _$PaymentSummaryDetailsStateImpl value,
          $Res Function(_$PaymentSummaryDetailsStateImpl) then) =
      __$$PaymentSummaryDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PaymentSummaryDetails details,
      SalesOrganisation salesOrganization,
      CustomerCodeInfo customerCodeInfo,
      User user,
      bool isDetailFetching,
      bool isListLoading,
      bool isFetchingAdvice,
      bool isSavingAdvice,
      ShipToInfo shipToInfo,
      PaymentInvoiceInfoPdf paymentInvoiceInfoPdf,
      bool isDeletingPayment,
      bool isCancelingAdvice,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      BankInstruction bankInstruction,
      AttachmentFileBuffer savedAdvice});

  @override
  $PaymentSummaryDetailsCopyWith<$Res> get details;
  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganization;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $UserCopyWith<$Res> get user;
  @override
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  @override
  $PaymentInvoiceInfoPdfCopyWith<$Res> get paymentInvoiceInfoPdf;
  @override
  $BankInstructionCopyWith<$Res> get bankInstruction;
  @override
  $AttachmentFileBufferCopyWith<$Res> get savedAdvice;
}

/// @nodoc
class __$$PaymentSummaryDetailsStateImplCopyWithImpl<$Res>
    extends _$PaymentSummaryDetailsStateCopyWithImpl<$Res,
        _$PaymentSummaryDetailsStateImpl>
    implements _$$PaymentSummaryDetailsStateImplCopyWith<$Res> {
  __$$PaymentSummaryDetailsStateImplCopyWithImpl(
      _$PaymentSummaryDetailsStateImpl _value,
      $Res Function(_$PaymentSummaryDetailsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
    Object? salesOrganization = null,
    Object? customerCodeInfo = null,
    Object? user = null,
    Object? isDetailFetching = null,
    Object? isListLoading = null,
    Object? isFetchingAdvice = null,
    Object? isSavingAdvice = null,
    Object? shipToInfo = null,
    Object? paymentInvoiceInfoPdf = null,
    Object? isDeletingPayment = null,
    Object? isCancelingAdvice = null,
    Object? failureOrSuccessOption = null,
    Object? bankInstruction = null,
    Object? savedAdvice = null,
  }) {
    return _then(_$PaymentSummaryDetailsStateImpl(
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as PaymentSummaryDetails,
      salesOrganization: null == salesOrganization
          ? _value.salesOrganization
          : salesOrganization // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      isDetailFetching: null == isDetailFetching
          ? _value.isDetailFetching
          : isDetailFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      isListLoading: null == isListLoading
          ? _value.isListLoading
          : isListLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingAdvice: null == isFetchingAdvice
          ? _value.isFetchingAdvice
          : isFetchingAdvice // ignore: cast_nullable_to_non_nullable
              as bool,
      isSavingAdvice: null == isSavingAdvice
          ? _value.isSavingAdvice
          : isSavingAdvice // ignore: cast_nullable_to_non_nullable
              as bool,
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      paymentInvoiceInfoPdf: null == paymentInvoiceInfoPdf
          ? _value.paymentInvoiceInfoPdf
          : paymentInvoiceInfoPdf // ignore: cast_nullable_to_non_nullable
              as PaymentInvoiceInfoPdf,
      isDeletingPayment: null == isDeletingPayment
          ? _value.isDeletingPayment
          : isDeletingPayment // ignore: cast_nullable_to_non_nullable
              as bool,
      isCancelingAdvice: null == isCancelingAdvice
          ? _value.isCancelingAdvice
          : isCancelingAdvice // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      bankInstruction: null == bankInstruction
          ? _value.bankInstruction
          : bankInstruction // ignore: cast_nullable_to_non_nullable
              as BankInstruction,
      savedAdvice: null == savedAdvice
          ? _value.savedAdvice
          : savedAdvice // ignore: cast_nullable_to_non_nullable
              as AttachmentFileBuffer,
    ));
  }
}

/// @nodoc

class _$PaymentSummaryDetailsStateImpl extends _PaymentSummaryDetailsState {
  const _$PaymentSummaryDetailsStateImpl(
      {required this.details,
      required this.salesOrganization,
      required this.customerCodeInfo,
      required this.user,
      required this.isDetailFetching,
      required this.isListLoading,
      required this.isFetchingAdvice,
      required this.isSavingAdvice,
      required this.shipToInfo,
      required this.paymentInvoiceInfoPdf,
      required this.isDeletingPayment,
      required this.isCancelingAdvice,
      required this.failureOrSuccessOption,
      required this.bankInstruction,
      required this.savedAdvice})
      : super._();

  @override
  final PaymentSummaryDetails details;
  @override
  final SalesOrganisation salesOrganization;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final User user;
  @override
  final bool isDetailFetching;
  @override
  final bool isListLoading;
  @override
  final bool isFetchingAdvice;
  @override
  final bool isSavingAdvice;
  @override
  final ShipToInfo shipToInfo;
  @override
  final PaymentInvoiceInfoPdf paymentInvoiceInfoPdf;
  @override
  final bool isDeletingPayment;
  @override
  final bool isCancelingAdvice;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  @override
  final BankInstruction bankInstruction;
  @override
  final AttachmentFileBuffer savedAdvice;

  @override
  String toString() {
    return 'PaymentSummaryDetailsState(details: $details, salesOrganization: $salesOrganization, customerCodeInfo: $customerCodeInfo, user: $user, isDetailFetching: $isDetailFetching, isListLoading: $isListLoading, isFetchingAdvice: $isFetchingAdvice, isSavingAdvice: $isSavingAdvice, shipToInfo: $shipToInfo, paymentInvoiceInfoPdf: $paymentInvoiceInfoPdf, isDeletingPayment: $isDeletingPayment, isCancelingAdvice: $isCancelingAdvice, failureOrSuccessOption: $failureOrSuccessOption, bankInstruction: $bankInstruction, savedAdvice: $savedAdvice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentSummaryDetailsStateImpl &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.salesOrganization, salesOrganization) ||
                other.salesOrganization == salesOrganization) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isDetailFetching, isDetailFetching) ||
                other.isDetailFetching == isDetailFetching) &&
            (identical(other.isListLoading, isListLoading) ||
                other.isListLoading == isListLoading) &&
            (identical(other.isFetchingAdvice, isFetchingAdvice) ||
                other.isFetchingAdvice == isFetchingAdvice) &&
            (identical(other.isSavingAdvice, isSavingAdvice) ||
                other.isSavingAdvice == isSavingAdvice) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.paymentInvoiceInfoPdf, paymentInvoiceInfoPdf) ||
                other.paymentInvoiceInfoPdf == paymentInvoiceInfoPdf) &&
            (identical(other.isDeletingPayment, isDeletingPayment) ||
                other.isDeletingPayment == isDeletingPayment) &&
            (identical(other.isCancelingAdvice, isCancelingAdvice) ||
                other.isCancelingAdvice == isCancelingAdvice) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.bankInstruction, bankInstruction) ||
                other.bankInstruction == bankInstruction) &&
            (identical(other.savedAdvice, savedAdvice) ||
                other.savedAdvice == savedAdvice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      details,
      salesOrganization,
      customerCodeInfo,
      user,
      isDetailFetching,
      isListLoading,
      isFetchingAdvice,
      isSavingAdvice,
      shipToInfo,
      paymentInvoiceInfoPdf,
      isDeletingPayment,
      isCancelingAdvice,
      failureOrSuccessOption,
      bankInstruction,
      savedAdvice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentSummaryDetailsStateImplCopyWith<_$PaymentSummaryDetailsStateImpl>
      get copyWith => __$$PaymentSummaryDetailsStateImplCopyWithImpl<
          _$PaymentSummaryDetailsStateImpl>(this, _$identity);
}

abstract class _PaymentSummaryDetailsState extends PaymentSummaryDetailsState {
  const factory _PaymentSummaryDetailsState(
      {required final PaymentSummaryDetails details,
      required final SalesOrganisation salesOrganization,
      required final CustomerCodeInfo customerCodeInfo,
      required final User user,
      required final bool isDetailFetching,
      required final bool isListLoading,
      required final bool isFetchingAdvice,
      required final bool isSavingAdvice,
      required final ShipToInfo shipToInfo,
      required final PaymentInvoiceInfoPdf paymentInvoiceInfoPdf,
      required final bool isDeletingPayment,
      required final bool isCancelingAdvice,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final BankInstruction bankInstruction,
      required final AttachmentFileBuffer
          savedAdvice}) = _$PaymentSummaryDetailsStateImpl;
  const _PaymentSummaryDetailsState._() : super._();

  @override
  PaymentSummaryDetails get details;
  @override
  SalesOrganisation get salesOrganization;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  User get user;
  @override
  bool get isDetailFetching;
  @override
  bool get isListLoading;
  @override
  bool get isFetchingAdvice;
  @override
  bool get isSavingAdvice;
  @override
  ShipToInfo get shipToInfo;
  @override
  PaymentInvoiceInfoPdf get paymentInvoiceInfoPdf;
  @override
  bool get isDeletingPayment;
  @override
  bool get isCancelingAdvice;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  BankInstruction get bankInstruction;
  @override
  AttachmentFileBuffer get savedAdvice;
  @override
  @JsonKey(ignore: true)
  _$$PaymentSummaryDetailsStateImplCopyWith<_$PaymentSummaryDetailsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

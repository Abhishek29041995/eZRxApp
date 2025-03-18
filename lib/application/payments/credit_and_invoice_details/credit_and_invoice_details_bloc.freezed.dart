// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_and_invoice_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreditAndInvoiceDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function(
            CreditAndInvoiceItem creditAndInvoiceItem, bool isMarketPlace)
        fetch,
    required TResult Function(String invoiceId, bool isMarketPlace)
        fetchInvoiceById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(
            CreditAndInvoiceItem creditAndInvoiceItem, bool isMarketPlace)?
        fetch,
    TResult? Function(String invoiceId, bool isMarketPlace)? fetchInvoiceById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(
            CreditAndInvoiceItem creditAndInvoiceItem, bool isMarketPlace)?
        fetch,
    TResult Function(String invoiceId, bool isMarketPlace)? fetchInvoiceById,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchInvoiceById value) fetchInvoiceById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchInvoiceById value)? fetchInvoiceById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchInvoiceById value)? fetchInvoiceById,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditAndInvoiceDetailsEventCopyWith<$Res> {
  factory $CreditAndInvoiceDetailsEventCopyWith(
          CreditAndInvoiceDetailsEvent value,
          $Res Function(CreditAndInvoiceDetailsEvent) then) =
      _$CreditAndInvoiceDetailsEventCopyWithImpl<$Res,
          CreditAndInvoiceDetailsEvent>;
}

/// @nodoc
class _$CreditAndInvoiceDetailsEventCopyWithImpl<$Res,
        $Val extends CreditAndInvoiceDetailsEvent>
    implements $CreditAndInvoiceDetailsEventCopyWith<$Res> {
  _$CreditAndInvoiceDetailsEventCopyWithImpl(this._value, this._then);

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
      {SalesOrganisation salesOrganisation, CustomerCodeInfo customerCodeInfo});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$CreditAndInvoiceDetailsEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
  }) {
    return _then(_$InitializedImpl(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
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
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl(
      {required this.salesOrganisation, required this.customerCodeInfo});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;

  @override
  String toString() {
    return 'CreditAndInvoiceDetailsEvent.initialized(salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializedImpl &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, salesOrganisation, customerCodeInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      __$$InitializedImplCopyWithImpl<_$InitializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function(
            CreditAndInvoiceItem creditAndInvoiceItem, bool isMarketPlace)
        fetch,
    required TResult Function(String invoiceId, bool isMarketPlace)
        fetchInvoiceById,
  }) {
    return initialized(salesOrganisation, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(
            CreditAndInvoiceItem creditAndInvoiceItem, bool isMarketPlace)?
        fetch,
    TResult? Function(String invoiceId, bool isMarketPlace)? fetchInvoiceById,
  }) {
    return initialized?.call(salesOrganisation, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(
            CreditAndInvoiceItem creditAndInvoiceItem, bool isMarketPlace)?
        fetch,
    TResult Function(String invoiceId, bool isMarketPlace)? fetchInvoiceById,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(salesOrganisation, customerCodeInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchInvoiceById value) fetchInvoiceById,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchInvoiceById value)? fetchInvoiceById,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchInvoiceById value)? fetchInvoiceById,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements CreditAndInvoiceDetailsEvent {
  const factory _Initialized(
      {required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo}) = _$InitializedImpl;

  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
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
  $Res call({CreditAndInvoiceItem creditAndInvoiceItem, bool isMarketPlace});

  $CreditAndInvoiceItemCopyWith<$Res> get creditAndInvoiceItem;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$CreditAndInvoiceDetailsEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? creditAndInvoiceItem = null,
    Object? isMarketPlace = null,
  }) {
    return _then(_$FetchImpl(
      creditAndInvoiceItem: null == creditAndInvoiceItem
          ? _value.creditAndInvoiceItem
          : creditAndInvoiceItem // ignore: cast_nullable_to_non_nullable
              as CreditAndInvoiceItem,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CreditAndInvoiceItemCopyWith<$Res> get creditAndInvoiceItem {
    return $CreditAndInvoiceItemCopyWith<$Res>(_value.creditAndInvoiceItem,
        (value) {
      return _then(_value.copyWith(creditAndInvoiceItem: value));
    });
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl(
      {required this.creditAndInvoiceItem, required this.isMarketPlace});

  @override
  final CreditAndInvoiceItem creditAndInvoiceItem;
  @override
  final bool isMarketPlace;

  @override
  String toString() {
    return 'CreditAndInvoiceDetailsEvent.fetch(creditAndInvoiceItem: $creditAndInvoiceItem, isMarketPlace: $isMarketPlace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.creditAndInvoiceItem, creditAndInvoiceItem) ||
                other.creditAndInvoiceItem == creditAndInvoiceItem) &&
            (identical(other.isMarketPlace, isMarketPlace) ||
                other.isMarketPlace == isMarketPlace));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, creditAndInvoiceItem, isMarketPlace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function(
            CreditAndInvoiceItem creditAndInvoiceItem, bool isMarketPlace)
        fetch,
    required TResult Function(String invoiceId, bool isMarketPlace)
        fetchInvoiceById,
  }) {
    return fetch(creditAndInvoiceItem, isMarketPlace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(
            CreditAndInvoiceItem creditAndInvoiceItem, bool isMarketPlace)?
        fetch,
    TResult? Function(String invoiceId, bool isMarketPlace)? fetchInvoiceById,
  }) {
    return fetch?.call(creditAndInvoiceItem, isMarketPlace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(
            CreditAndInvoiceItem creditAndInvoiceItem, bool isMarketPlace)?
        fetch,
    TResult Function(String invoiceId, bool isMarketPlace)? fetchInvoiceById,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(creditAndInvoiceItem, isMarketPlace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchInvoiceById value) fetchInvoiceById,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchInvoiceById value)? fetchInvoiceById,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchInvoiceById value)? fetchInvoiceById,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements CreditAndInvoiceDetailsEvent {
  const factory _Fetch(
      {required final CreditAndInvoiceItem creditAndInvoiceItem,
      required final bool isMarketPlace}) = _$FetchImpl;

  CreditAndInvoiceItem get creditAndInvoiceItem;
  bool get isMarketPlace;
  @JsonKey(ignore: true)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchInvoiceByIdImplCopyWith<$Res> {
  factory _$$FetchInvoiceByIdImplCopyWith(_$FetchInvoiceByIdImpl value,
          $Res Function(_$FetchInvoiceByIdImpl) then) =
      __$$FetchInvoiceByIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String invoiceId, bool isMarketPlace});
}

/// @nodoc
class __$$FetchInvoiceByIdImplCopyWithImpl<$Res>
    extends _$CreditAndInvoiceDetailsEventCopyWithImpl<$Res,
        _$FetchInvoiceByIdImpl>
    implements _$$FetchInvoiceByIdImplCopyWith<$Res> {
  __$$FetchInvoiceByIdImplCopyWithImpl(_$FetchInvoiceByIdImpl _value,
      $Res Function(_$FetchInvoiceByIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceId = null,
    Object? isMarketPlace = null,
  }) {
    return _then(_$FetchInvoiceByIdImpl(
      invoiceId: null == invoiceId
          ? _value.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as String,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FetchInvoiceByIdImpl implements _FetchInvoiceById {
  const _$FetchInvoiceByIdImpl(
      {required this.invoiceId, required this.isMarketPlace});

  @override
  final String invoiceId;
  @override
  final bool isMarketPlace;

  @override
  String toString() {
    return 'CreditAndInvoiceDetailsEvent.fetchInvoiceById(invoiceId: $invoiceId, isMarketPlace: $isMarketPlace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchInvoiceByIdImpl &&
            (identical(other.invoiceId, invoiceId) ||
                other.invoiceId == invoiceId) &&
            (identical(other.isMarketPlace, isMarketPlace) ||
                other.isMarketPlace == isMarketPlace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, invoiceId, isMarketPlace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchInvoiceByIdImplCopyWith<_$FetchInvoiceByIdImpl> get copyWith =>
      __$$FetchInvoiceByIdImplCopyWithImpl<_$FetchInvoiceByIdImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function(
            CreditAndInvoiceItem creditAndInvoiceItem, bool isMarketPlace)
        fetch,
    required TResult Function(String invoiceId, bool isMarketPlace)
        fetchInvoiceById,
  }) {
    return fetchInvoiceById(invoiceId, isMarketPlace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function(
            CreditAndInvoiceItem creditAndInvoiceItem, bool isMarketPlace)?
        fetch,
    TResult? Function(String invoiceId, bool isMarketPlace)? fetchInvoiceById,
  }) {
    return fetchInvoiceById?.call(invoiceId, isMarketPlace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function(
            CreditAndInvoiceItem creditAndInvoiceItem, bool isMarketPlace)?
        fetch,
    TResult Function(String invoiceId, bool isMarketPlace)? fetchInvoiceById,
    required TResult orElse(),
  }) {
    if (fetchInvoiceById != null) {
      return fetchInvoiceById(invoiceId, isMarketPlace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchInvoiceById value) fetchInvoiceById,
  }) {
    return fetchInvoiceById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchInvoiceById value)? fetchInvoiceById,
  }) {
    return fetchInvoiceById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchInvoiceById value)? fetchInvoiceById,
    required TResult orElse(),
  }) {
    if (fetchInvoiceById != null) {
      return fetchInvoiceById(this);
    }
    return orElse();
  }
}

abstract class _FetchInvoiceById implements CreditAndInvoiceDetailsEvent {
  const factory _FetchInvoiceById(
      {required final String invoiceId,
      required final bool isMarketPlace}) = _$FetchInvoiceByIdImpl;

  String get invoiceId;
  bool get isMarketPlace;
  @JsonKey(ignore: true)
  _$$FetchInvoiceByIdImplCopyWith<_$FetchInvoiceByIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreditAndInvoiceDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  List<CustomerDocumentDetail> get itemsInfo =>
      throw _privateConstructorUsedError;
  CreditAndInvoiceItem get basicInfo => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreditAndInvoiceDetailsStateCopyWith<CreditAndInvoiceDetailsState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditAndInvoiceDetailsStateCopyWith<$Res> {
  factory $CreditAndInvoiceDetailsStateCopyWith(
          CreditAndInvoiceDetailsState value,
          $Res Function(CreditAndInvoiceDetailsState) then) =
      _$CreditAndInvoiceDetailsStateCopyWithImpl<$Res,
          CreditAndInvoiceDetailsState>;
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      List<CustomerDocumentDetail> itemsInfo,
      CreditAndInvoiceItem basicInfo,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo});

  $CreditAndInvoiceItemCopyWith<$Res> get basicInfo;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class _$CreditAndInvoiceDetailsStateCopyWithImpl<$Res,
        $Val extends CreditAndInvoiceDetailsState>
    implements $CreditAndInvoiceDetailsStateCopyWith<$Res> {
  _$CreditAndInvoiceDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? failureOrSuccessOption = null,
    Object? itemsInfo = null,
    Object? basicInfo = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      itemsInfo: null == itemsInfo
          ? _value.itemsInfo
          : itemsInfo // ignore: cast_nullable_to_non_nullable
              as List<CustomerDocumentDetail>,
      basicInfo: null == basicInfo
          ? _value.basicInfo
          : basicInfo // ignore: cast_nullable_to_non_nullable
              as CreditAndInvoiceItem,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CreditAndInvoiceItemCopyWith<$Res> get basicInfo {
    return $CreditAndInvoiceItemCopyWith<$Res>(_value.basicInfo, (value) {
      return _then(_value.copyWith(basicInfo: value) as $Val);
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
}

/// @nodoc
abstract class _$$CreditAndInvoiceDetailsStateImplCopyWith<$Res>
    implements $CreditAndInvoiceDetailsStateCopyWith<$Res> {
  factory _$$CreditAndInvoiceDetailsStateImplCopyWith(
          _$CreditAndInvoiceDetailsStateImpl value,
          $Res Function(_$CreditAndInvoiceDetailsStateImpl) then) =
      __$$CreditAndInvoiceDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      List<CustomerDocumentDetail> itemsInfo,
      CreditAndInvoiceItem basicInfo,
      SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo});

  @override
  $CreditAndInvoiceItemCopyWith<$Res> get basicInfo;
  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$CreditAndInvoiceDetailsStateImplCopyWithImpl<$Res>
    extends _$CreditAndInvoiceDetailsStateCopyWithImpl<$Res,
        _$CreditAndInvoiceDetailsStateImpl>
    implements _$$CreditAndInvoiceDetailsStateImplCopyWith<$Res> {
  __$$CreditAndInvoiceDetailsStateImplCopyWithImpl(
      _$CreditAndInvoiceDetailsStateImpl _value,
      $Res Function(_$CreditAndInvoiceDetailsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? failureOrSuccessOption = null,
    Object? itemsInfo = null,
    Object? basicInfo = null,
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
  }) {
    return _then(_$CreditAndInvoiceDetailsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      itemsInfo: null == itemsInfo
          ? _value._itemsInfo
          : itemsInfo // ignore: cast_nullable_to_non_nullable
              as List<CustomerDocumentDetail>,
      basicInfo: null == basicInfo
          ? _value.basicInfo
          : basicInfo // ignore: cast_nullable_to_non_nullable
              as CreditAndInvoiceItem,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
    ));
  }
}

/// @nodoc

class _$CreditAndInvoiceDetailsStateImpl extends _CreditAndInvoiceDetailsState {
  const _$CreditAndInvoiceDetailsStateImpl(
      {required this.isLoading,
      required this.failureOrSuccessOption,
      required final List<CustomerDocumentDetail> itemsInfo,
      required this.basicInfo,
      required this.salesOrganisation,
      required this.customerCodeInfo})
      : _itemsInfo = itemsInfo,
        super._();

  @override
  final bool isLoading;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  final List<CustomerDocumentDetail> _itemsInfo;
  @override
  List<CustomerDocumentDetail> get itemsInfo {
    if (_itemsInfo is EqualUnmodifiableListView) return _itemsInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_itemsInfo);
  }

  @override
  final CreditAndInvoiceItem basicInfo;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;

  @override
  String toString() {
    return 'CreditAndInvoiceDetailsState(isLoading: $isLoading, failureOrSuccessOption: $failureOrSuccessOption, itemsInfo: $itemsInfo, basicInfo: $basicInfo, salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreditAndInvoiceDetailsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            const DeepCollectionEquality()
                .equals(other._itemsInfo, _itemsInfo) &&
            (identical(other.basicInfo, basicInfo) ||
                other.basicInfo == basicInfo) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      failureOrSuccessOption,
      const DeepCollectionEquality().hash(_itemsInfo),
      basicInfo,
      salesOrganisation,
      customerCodeInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreditAndInvoiceDetailsStateImplCopyWith<
          _$CreditAndInvoiceDetailsStateImpl>
      get copyWith => __$$CreditAndInvoiceDetailsStateImplCopyWithImpl<
          _$CreditAndInvoiceDetailsStateImpl>(this, _$identity);
}

abstract class _CreditAndInvoiceDetailsState
    extends CreditAndInvoiceDetailsState {
  const factory _CreditAndInvoiceDetailsState(
      {required final bool isLoading,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final List<CustomerDocumentDetail> itemsInfo,
      required final CreditAndInvoiceItem basicInfo,
      required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo
          customerCodeInfo}) = _$CreditAndInvoiceDetailsStateImpl;
  const _CreditAndInvoiceDetailsState._() : super._();

  @override
  bool get isLoading;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  List<CustomerDocumentDetail> get itemsInfo;
  @override
  CreditAndInvoiceItem get basicInfo;
  @override
  SalesOrganisation get salesOrganisation;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  @JsonKey(ignore: true)
  _$$CreditAndInvoiceDetailsStateImplCopyWith<
          _$CreditAndInvoiceDetailsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_term_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentTermEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customeCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesRepresentativeInfo salesRepresentativeInfo,
            PaymentCustomerInformation paymentCustomerInformation,
            User user)
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customeCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesRepresentativeInfo salesRepresentativeInfo,
            PaymentCustomerInformation paymentCustomerInformation,
            User user)?
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customeCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesRepresentativeInfo salesRepresentativeInfo,
            PaymentCustomerInformation paymentCustomerInformation,
            User user)?
        fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentTermEventCopyWith<$Res> {
  factory $PaymentTermEventCopyWith(
          PaymentTermEvent value, $Res Function(PaymentTermEvent) then) =
      _$PaymentTermEventCopyWithImpl<$Res, PaymentTermEvent>;
}

/// @nodoc
class _$PaymentTermEventCopyWithImpl<$Res, $Val extends PaymentTermEvent>
    implements $PaymentTermEventCopyWith<$Res> {
  _$PaymentTermEventCopyWithImpl(this._value, this._then);

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
    extends _$PaymentTermEventCopyWithImpl<$Res, _$InitializedImpl>
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
    return 'PaymentTermEvent.initialized()';
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
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customeCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesRepresentativeInfo salesRepresentativeInfo,
            PaymentCustomerInformation paymentCustomerInformation,
            User user)
        fetch,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customeCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesRepresentativeInfo salesRepresentativeInfo,
            PaymentCustomerInformation paymentCustomerInformation,
            User user)?
        fetch,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customeCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesRepresentativeInfo salesRepresentativeInfo,
            PaymentCustomerInformation paymentCustomerInformation,
            User user)?
        fetch,
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
    required TResult Function(_Fetch value) fetch,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements PaymentTermEvent {
  const factory _Initialized() = _$InitializedImpl;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      CustomerCodeInfo customeCodeInfo,
      SalesOrganisationConfigs salesOrganisationConfigs,
      SalesRepresentativeInfo salesRepresentativeInfo,
      PaymentCustomerInformation paymentCustomerInformation,
      User user});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customeCodeInfo;
  $SalesOrganisationConfigsCopyWith<$Res> get salesOrganisationConfigs;
  $SalesRepresentativeInfoCopyWith<$Res> get salesRepresentativeInfo;
  $PaymentCustomerInformationCopyWith<$Res> get paymentCustomerInformation;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$PaymentTermEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? customeCodeInfo = null,
    Object? salesOrganisationConfigs = null,
    Object? salesRepresentativeInfo = null,
    Object? paymentCustomerInformation = null,
    Object? user = null,
  }) {
    return _then(_$FetchImpl(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customeCodeInfo: null == customeCodeInfo
          ? _value.customeCodeInfo
          : customeCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrganisationConfigs: null == salesOrganisationConfigs
          ? _value.salesOrganisationConfigs
          : salesOrganisationConfigs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      salesRepresentativeInfo: null == salesRepresentativeInfo
          ? _value.salesRepresentativeInfo
          : salesRepresentativeInfo // ignore: cast_nullable_to_non_nullable
              as SalesRepresentativeInfo,
      paymentCustomerInformation: null == paymentCustomerInformation
          ? _value.paymentCustomerInformation
          : paymentCustomerInformation // ignore: cast_nullable_to_non_nullable
              as PaymentCustomerInformation,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
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
  $CustomerCodeInfoCopyWith<$Res> get customeCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customeCodeInfo, (value) {
      return _then(_value.copyWith(customeCodeInfo: value));
    });
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
  $SalesRepresentativeInfoCopyWith<$Res> get salesRepresentativeInfo {
    return $SalesRepresentativeInfoCopyWith<$Res>(
        _value.salesRepresentativeInfo, (value) {
      return _then(_value.copyWith(salesRepresentativeInfo: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentCustomerInformationCopyWith<$Res> get paymentCustomerInformation {
    return $PaymentCustomerInformationCopyWith<$Res>(
        _value.paymentCustomerInformation, (value) {
      return _then(_value.copyWith(paymentCustomerInformation: value));
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

class _$FetchImpl implements _Fetch {
  const _$FetchImpl(
      {required this.salesOrganisation,
      required this.customeCodeInfo,
      required this.salesOrganisationConfigs,
      required this.salesRepresentativeInfo,
      required this.paymentCustomerInformation,
      required this.user});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customeCodeInfo;
  @override
  final SalesOrganisationConfigs salesOrganisationConfigs;
  @override
  final SalesRepresentativeInfo salesRepresentativeInfo;
  @override
  final PaymentCustomerInformation paymentCustomerInformation;
  @override
  final User user;

  @override
  String toString() {
    return 'PaymentTermEvent.fetch(salesOrganisation: $salesOrganisation, customeCodeInfo: $customeCodeInfo, salesOrganisationConfigs: $salesOrganisationConfigs, salesRepresentativeInfo: $salesRepresentativeInfo, paymentCustomerInformation: $paymentCustomerInformation, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customeCodeInfo, customeCodeInfo) ||
                other.customeCodeInfo == customeCodeInfo) &&
            (identical(
                    other.salesOrganisationConfigs, salesOrganisationConfigs) ||
                other.salesOrganisationConfigs == salesOrganisationConfigs) &&
            (identical(
                    other.salesRepresentativeInfo, salesRepresentativeInfo) ||
                other.salesRepresentativeInfo == salesRepresentativeInfo) &&
            (identical(other.paymentCustomerInformation,
                    paymentCustomerInformation) ||
                other.paymentCustomerInformation ==
                    paymentCustomerInformation) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      salesOrganisation,
      customeCodeInfo,
      salesOrganisationConfigs,
      salesRepresentativeInfo,
      paymentCustomerInformation,
      user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customeCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesRepresentativeInfo salesRepresentativeInfo,
            PaymentCustomerInformation paymentCustomerInformation,
            User user)
        fetch,
  }) {
    return fetch(salesOrganisation, customeCodeInfo, salesOrganisationConfigs,
        salesRepresentativeInfo, paymentCustomerInformation, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customeCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesRepresentativeInfo salesRepresentativeInfo,
            PaymentCustomerInformation paymentCustomerInformation,
            User user)?
        fetch,
  }) {
    return fetch?.call(
        salesOrganisation,
        customeCodeInfo,
        salesOrganisationConfigs,
        salesRepresentativeInfo,
        paymentCustomerInformation,
        user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customeCodeInfo,
            SalesOrganisationConfigs salesOrganisationConfigs,
            SalesRepresentativeInfo salesRepresentativeInfo,
            PaymentCustomerInformation paymentCustomerInformation,
            User user)?
        fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(salesOrganisation, customeCodeInfo, salesOrganisationConfigs,
          salesRepresentativeInfo, paymentCustomerInformation, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements PaymentTermEvent {
  const factory _Fetch(
      {required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customeCodeInfo,
      required final SalesOrganisationConfigs salesOrganisationConfigs,
      required final SalesRepresentativeInfo salesRepresentativeInfo,
      required final PaymentCustomerInformation paymentCustomerInformation,
      required final User user}) = _$FetchImpl;

  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customeCodeInfo;
  SalesOrganisationConfigs get salesOrganisationConfigs;
  SalesRepresentativeInfo get salesRepresentativeInfo;
  PaymentCustomerInformation get paymentCustomerInformation;
  User get user;
  @JsonKey(ignore: true)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PaymentTermState {
  List<PaymentTerm> get paymentTerms => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get paymentTermsFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentTermStateCopyWith<PaymentTermState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentTermStateCopyWith<$Res> {
  factory $PaymentTermStateCopyWith(
          PaymentTermState value, $Res Function(PaymentTermState) then) =
      _$PaymentTermStateCopyWithImpl<$Res, PaymentTermState>;
  @useResult
  $Res call(
      {List<PaymentTerm> paymentTerms,
      bool isFetching,
      Option<Either<ApiFailure, dynamic>> paymentTermsFailureOrSuccessOption});
}

/// @nodoc
class _$PaymentTermStateCopyWithImpl<$Res, $Val extends PaymentTermState>
    implements $PaymentTermStateCopyWith<$Res> {
  _$PaymentTermStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentTerms = null,
    Object? isFetching = null,
    Object? paymentTermsFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      paymentTerms: null == paymentTerms
          ? _value.paymentTerms
          : paymentTerms // ignore: cast_nullable_to_non_nullable
              as List<PaymentTerm>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentTermsFailureOrSuccessOption: null ==
              paymentTermsFailureOrSuccessOption
          ? _value.paymentTermsFailureOrSuccessOption
          : paymentTermsFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentTermStateImplCopyWith<$Res>
    implements $PaymentTermStateCopyWith<$Res> {
  factory _$$PaymentTermStateImplCopyWith(_$PaymentTermStateImpl value,
          $Res Function(_$PaymentTermStateImpl) then) =
      __$$PaymentTermStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PaymentTerm> paymentTerms,
      bool isFetching,
      Option<Either<ApiFailure, dynamic>> paymentTermsFailureOrSuccessOption});
}

/// @nodoc
class __$$PaymentTermStateImplCopyWithImpl<$Res>
    extends _$PaymentTermStateCopyWithImpl<$Res, _$PaymentTermStateImpl>
    implements _$$PaymentTermStateImplCopyWith<$Res> {
  __$$PaymentTermStateImplCopyWithImpl(_$PaymentTermStateImpl _value,
      $Res Function(_$PaymentTermStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentTerms = null,
    Object? isFetching = null,
    Object? paymentTermsFailureOrSuccessOption = null,
  }) {
    return _then(_$PaymentTermStateImpl(
      paymentTerms: null == paymentTerms
          ? _value._paymentTerms
          : paymentTerms // ignore: cast_nullable_to_non_nullable
              as List<PaymentTerm>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentTermsFailureOrSuccessOption: null ==
              paymentTermsFailureOrSuccessOption
          ? _value.paymentTermsFailureOrSuccessOption
          : paymentTermsFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$PaymentTermStateImpl extends _PaymentTermState {
  const _$PaymentTermStateImpl(
      {required final List<PaymentTerm> paymentTerms,
      required this.isFetching,
      required this.paymentTermsFailureOrSuccessOption})
      : _paymentTerms = paymentTerms,
        super._();

  final List<PaymentTerm> _paymentTerms;
  @override
  List<PaymentTerm> get paymentTerms {
    if (_paymentTerms is EqualUnmodifiableListView) return _paymentTerms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentTerms);
  }

  @override
  final bool isFetching;
  @override
  final Option<Either<ApiFailure, dynamic>> paymentTermsFailureOrSuccessOption;

  @override
  String toString() {
    return 'PaymentTermState(paymentTerms: $paymentTerms, isFetching: $isFetching, paymentTermsFailureOrSuccessOption: $paymentTermsFailureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentTermStateImpl &&
            const DeepCollectionEquality()
                .equals(other._paymentTerms, _paymentTerms) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.paymentTermsFailureOrSuccessOption,
                    paymentTermsFailureOrSuccessOption) ||
                other.paymentTermsFailureOrSuccessOption ==
                    paymentTermsFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_paymentTerms),
      isFetching,
      paymentTermsFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentTermStateImplCopyWith<_$PaymentTermStateImpl> get copyWith =>
      __$$PaymentTermStateImplCopyWithImpl<_$PaymentTermStateImpl>(
          this, _$identity);
}

abstract class _PaymentTermState extends PaymentTermState {
  const factory _PaymentTermState(
      {required final List<PaymentTerm> paymentTerms,
      required final bool isFetching,
      required final Option<Either<ApiFailure, dynamic>>
          paymentTermsFailureOrSuccessOption}) = _$PaymentTermStateImpl;
  const _PaymentTermState._() : super._();

  @override
  List<PaymentTerm> get paymentTerms;
  @override
  bool get isFetching;
  @override
  Option<Either<ApiFailure, dynamic>> get paymentTermsFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$PaymentTermStateImplCopyWith<_$PaymentTermStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

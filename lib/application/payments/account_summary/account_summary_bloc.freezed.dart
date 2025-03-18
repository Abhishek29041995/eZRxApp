// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_summary_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountSummaryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String custCode, SalesOrg salesOrg)
        fetchInvoiceSummary,
    required TResult Function(String custCode, SalesOrg salesOrg)
        fetchCreditSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String custCode, SalesOrg salesOrg)? fetchInvoiceSummary,
    TResult? Function(String custCode, SalesOrg salesOrg)? fetchCreditSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String custCode, SalesOrg salesOrg)? fetchInvoiceSummary,
    TResult Function(String custCode, SalesOrg salesOrg)? fetchCreditSummary,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_FetchInvoiceSummary value) fetchInvoiceSummary,
    required TResult Function(_FetchCreditSummary value) fetchCreditSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_FetchInvoiceSummary value)? fetchInvoiceSummary,
    TResult? Function(_FetchCreditSummary value)? fetchCreditSummary,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_FetchInvoiceSummary value)? fetchInvoiceSummary,
    TResult Function(_FetchCreditSummary value)? fetchCreditSummary,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountSummaryEventCopyWith<$Res> {
  factory $AccountSummaryEventCopyWith(
          AccountSummaryEvent value, $Res Function(AccountSummaryEvent) then) =
      _$AccountSummaryEventCopyWithImpl<$Res, AccountSummaryEvent>;
}

/// @nodoc
class _$AccountSummaryEventCopyWithImpl<$Res, $Val extends AccountSummaryEvent>
    implements $AccountSummaryEventCopyWith<$Res> {
  _$AccountSummaryEventCopyWithImpl(this._value, this._then);

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
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$AccountSummaryEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl();

  @override
  String toString() {
    return 'AccountSummaryEvent.initialize()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String custCode, SalesOrg salesOrg)
        fetchInvoiceSummary,
    required TResult Function(String custCode, SalesOrg salesOrg)
        fetchCreditSummary,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String custCode, SalesOrg salesOrg)? fetchInvoiceSummary,
    TResult? Function(String custCode, SalesOrg salesOrg)? fetchCreditSummary,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String custCode, SalesOrg salesOrg)? fetchInvoiceSummary,
    TResult Function(String custCode, SalesOrg salesOrg)? fetchCreditSummary,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_FetchInvoiceSummary value) fetchInvoiceSummary,
    required TResult Function(_FetchCreditSummary value) fetchCreditSummary,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_FetchInvoiceSummary value)? fetchInvoiceSummary,
    TResult? Function(_FetchCreditSummary value)? fetchCreditSummary,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_FetchInvoiceSummary value)? fetchInvoiceSummary,
    TResult Function(_FetchCreditSummary value)? fetchCreditSummary,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements AccountSummaryEvent {
  const factory _Initialize() = _$InitializeImpl;
}

/// @nodoc
abstract class _$$FetchInvoiceSummaryImplCopyWith<$Res> {
  factory _$$FetchInvoiceSummaryImplCopyWith(_$FetchInvoiceSummaryImpl value,
          $Res Function(_$FetchInvoiceSummaryImpl) then) =
      __$$FetchInvoiceSummaryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String custCode, SalesOrg salesOrg});
}

/// @nodoc
class __$$FetchInvoiceSummaryImplCopyWithImpl<$Res>
    extends _$AccountSummaryEventCopyWithImpl<$Res, _$FetchInvoiceSummaryImpl>
    implements _$$FetchInvoiceSummaryImplCopyWith<$Res> {
  __$$FetchInvoiceSummaryImplCopyWithImpl(_$FetchInvoiceSummaryImpl _value,
      $Res Function(_$FetchInvoiceSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? custCode = null,
    Object? salesOrg = null,
  }) {
    return _then(_$FetchInvoiceSummaryImpl(
      custCode: null == custCode
          ? _value.custCode
          : custCode // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ));
  }
}

/// @nodoc

class _$FetchInvoiceSummaryImpl implements _FetchInvoiceSummary {
  const _$FetchInvoiceSummaryImpl(
      {required this.custCode, required this.salesOrg});

  @override
  final String custCode;
  @override
  final SalesOrg salesOrg;

  @override
  String toString() {
    return 'AccountSummaryEvent.fetchInvoiceSummary(custCode: $custCode, salesOrg: $salesOrg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchInvoiceSummaryImpl &&
            (identical(other.custCode, custCode) ||
                other.custCode == custCode) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, custCode, salesOrg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchInvoiceSummaryImplCopyWith<_$FetchInvoiceSummaryImpl> get copyWith =>
      __$$FetchInvoiceSummaryImplCopyWithImpl<_$FetchInvoiceSummaryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String custCode, SalesOrg salesOrg)
        fetchInvoiceSummary,
    required TResult Function(String custCode, SalesOrg salesOrg)
        fetchCreditSummary,
  }) {
    return fetchInvoiceSummary(custCode, salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String custCode, SalesOrg salesOrg)? fetchInvoiceSummary,
    TResult? Function(String custCode, SalesOrg salesOrg)? fetchCreditSummary,
  }) {
    return fetchInvoiceSummary?.call(custCode, salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String custCode, SalesOrg salesOrg)? fetchInvoiceSummary,
    TResult Function(String custCode, SalesOrg salesOrg)? fetchCreditSummary,
    required TResult orElse(),
  }) {
    if (fetchInvoiceSummary != null) {
      return fetchInvoiceSummary(custCode, salesOrg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_FetchInvoiceSummary value) fetchInvoiceSummary,
    required TResult Function(_FetchCreditSummary value) fetchCreditSummary,
  }) {
    return fetchInvoiceSummary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_FetchInvoiceSummary value)? fetchInvoiceSummary,
    TResult? Function(_FetchCreditSummary value)? fetchCreditSummary,
  }) {
    return fetchInvoiceSummary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_FetchInvoiceSummary value)? fetchInvoiceSummary,
    TResult Function(_FetchCreditSummary value)? fetchCreditSummary,
    required TResult orElse(),
  }) {
    if (fetchInvoiceSummary != null) {
      return fetchInvoiceSummary(this);
    }
    return orElse();
  }
}

abstract class _FetchInvoiceSummary implements AccountSummaryEvent {
  const factory _FetchInvoiceSummary(
      {required final String custCode,
      required final SalesOrg salesOrg}) = _$FetchInvoiceSummaryImpl;

  String get custCode;
  SalesOrg get salesOrg;
  @JsonKey(ignore: true)
  _$$FetchInvoiceSummaryImplCopyWith<_$FetchInvoiceSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchCreditSummaryImplCopyWith<$Res> {
  factory _$$FetchCreditSummaryImplCopyWith(_$FetchCreditSummaryImpl value,
          $Res Function(_$FetchCreditSummaryImpl) then) =
      __$$FetchCreditSummaryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String custCode, SalesOrg salesOrg});
}

/// @nodoc
class __$$FetchCreditSummaryImplCopyWithImpl<$Res>
    extends _$AccountSummaryEventCopyWithImpl<$Res, _$FetchCreditSummaryImpl>
    implements _$$FetchCreditSummaryImplCopyWith<$Res> {
  __$$FetchCreditSummaryImplCopyWithImpl(_$FetchCreditSummaryImpl _value,
      $Res Function(_$FetchCreditSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? custCode = null,
    Object? salesOrg = null,
  }) {
    return _then(_$FetchCreditSummaryImpl(
      custCode: null == custCode
          ? _value.custCode
          : custCode // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ));
  }
}

/// @nodoc

class _$FetchCreditSummaryImpl implements _FetchCreditSummary {
  const _$FetchCreditSummaryImpl(
      {required this.custCode, required this.salesOrg});

  @override
  final String custCode;
  @override
  final SalesOrg salesOrg;

  @override
  String toString() {
    return 'AccountSummaryEvent.fetchCreditSummary(custCode: $custCode, salesOrg: $salesOrg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchCreditSummaryImpl &&
            (identical(other.custCode, custCode) ||
                other.custCode == custCode) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, custCode, salesOrg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchCreditSummaryImplCopyWith<_$FetchCreditSummaryImpl> get copyWith =>
      __$$FetchCreditSummaryImplCopyWithImpl<_$FetchCreditSummaryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String custCode, SalesOrg salesOrg)
        fetchInvoiceSummary,
    required TResult Function(String custCode, SalesOrg salesOrg)
        fetchCreditSummary,
  }) {
    return fetchCreditSummary(custCode, salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String custCode, SalesOrg salesOrg)? fetchInvoiceSummary,
    TResult? Function(String custCode, SalesOrg salesOrg)? fetchCreditSummary,
  }) {
    return fetchCreditSummary?.call(custCode, salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String custCode, SalesOrg salesOrg)? fetchInvoiceSummary,
    TResult Function(String custCode, SalesOrg salesOrg)? fetchCreditSummary,
    required TResult orElse(),
  }) {
    if (fetchCreditSummary != null) {
      return fetchCreditSummary(custCode, salesOrg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_FetchInvoiceSummary value) fetchInvoiceSummary,
    required TResult Function(_FetchCreditSummary value) fetchCreditSummary,
  }) {
    return fetchCreditSummary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_FetchInvoiceSummary value)? fetchInvoiceSummary,
    TResult? Function(_FetchCreditSummary value)? fetchCreditSummary,
  }) {
    return fetchCreditSummary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_FetchInvoiceSummary value)? fetchInvoiceSummary,
    TResult Function(_FetchCreditSummary value)? fetchCreditSummary,
    required TResult orElse(),
  }) {
    if (fetchCreditSummary != null) {
      return fetchCreditSummary(this);
    }
    return orElse();
  }
}

abstract class _FetchCreditSummary implements AccountSummaryEvent {
  const factory _FetchCreditSummary(
      {required final String custCode,
      required final SalesOrg salesOrg}) = _$FetchCreditSummaryImpl;

  String get custCode;
  SalesOrg get salesOrg;
  @JsonKey(ignore: true)
  _$$FetchCreditSummaryImplCopyWith<_$FetchCreditSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AccountSummaryState {
  OutstandingBalance get outstandingBalance =>
      throw _privateConstructorUsedError;
  CreditLimit get creditLimit => throw _privateConstructorUsedError;
  bool get isFetchingOutstandingBalance => throw _privateConstructorUsedError;
  bool get isFetchingCreditLimit => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountSummaryStateCopyWith<AccountSummaryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountSummaryStateCopyWith<$Res> {
  factory $AccountSummaryStateCopyWith(
          AccountSummaryState value, $Res Function(AccountSummaryState) then) =
      _$AccountSummaryStateCopyWithImpl<$Res, AccountSummaryState>;
  @useResult
  $Res call(
      {OutstandingBalance outstandingBalance,
      CreditLimit creditLimit,
      bool isFetchingOutstandingBalance,
      bool isFetchingCreditLimit,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});

  $OutstandingBalanceCopyWith<$Res> get outstandingBalance;
  $CreditLimitCopyWith<$Res> get creditLimit;
}

/// @nodoc
class _$AccountSummaryStateCopyWithImpl<$Res, $Val extends AccountSummaryState>
    implements $AccountSummaryStateCopyWith<$Res> {
  _$AccountSummaryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outstandingBalance = null,
    Object? creditLimit = null,
    Object? isFetchingOutstandingBalance = null,
    Object? isFetchingCreditLimit = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      outstandingBalance: null == outstandingBalance
          ? _value.outstandingBalance
          : outstandingBalance // ignore: cast_nullable_to_non_nullable
              as OutstandingBalance,
      creditLimit: null == creditLimit
          ? _value.creditLimit
          : creditLimit // ignore: cast_nullable_to_non_nullable
              as CreditLimit,
      isFetchingOutstandingBalance: null == isFetchingOutstandingBalance
          ? _value.isFetchingOutstandingBalance
          : isFetchingOutstandingBalance // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingCreditLimit: null == isFetchingCreditLimit
          ? _value.isFetchingCreditLimit
          : isFetchingCreditLimit // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OutstandingBalanceCopyWith<$Res> get outstandingBalance {
    return $OutstandingBalanceCopyWith<$Res>(_value.outstandingBalance,
        (value) {
      return _then(_value.copyWith(outstandingBalance: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CreditLimitCopyWith<$Res> get creditLimit {
    return $CreditLimitCopyWith<$Res>(_value.creditLimit, (value) {
      return _then(_value.copyWith(creditLimit: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AccountSummaryStateImplCopyWith<$Res>
    implements $AccountSummaryStateCopyWith<$Res> {
  factory _$$AccountSummaryStateImplCopyWith(_$AccountSummaryStateImpl value,
          $Res Function(_$AccountSummaryStateImpl) then) =
      __$$AccountSummaryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OutstandingBalance outstandingBalance,
      CreditLimit creditLimit,
      bool isFetchingOutstandingBalance,
      bool isFetchingCreditLimit,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});

  @override
  $OutstandingBalanceCopyWith<$Res> get outstandingBalance;
  @override
  $CreditLimitCopyWith<$Res> get creditLimit;
}

/// @nodoc
class __$$AccountSummaryStateImplCopyWithImpl<$Res>
    extends _$AccountSummaryStateCopyWithImpl<$Res, _$AccountSummaryStateImpl>
    implements _$$AccountSummaryStateImplCopyWith<$Res> {
  __$$AccountSummaryStateImplCopyWithImpl(_$AccountSummaryStateImpl _value,
      $Res Function(_$AccountSummaryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outstandingBalance = null,
    Object? creditLimit = null,
    Object? isFetchingOutstandingBalance = null,
    Object? isFetchingCreditLimit = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_$AccountSummaryStateImpl(
      outstandingBalance: null == outstandingBalance
          ? _value.outstandingBalance
          : outstandingBalance // ignore: cast_nullable_to_non_nullable
              as OutstandingBalance,
      creditLimit: null == creditLimit
          ? _value.creditLimit
          : creditLimit // ignore: cast_nullable_to_non_nullable
              as CreditLimit,
      isFetchingOutstandingBalance: null == isFetchingOutstandingBalance
          ? _value.isFetchingOutstandingBalance
          : isFetchingOutstandingBalance // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingCreditLimit: null == isFetchingCreditLimit
          ? _value.isFetchingCreditLimit
          : isFetchingCreditLimit // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$AccountSummaryStateImpl extends _AccountSummaryState {
  const _$AccountSummaryStateImpl(
      {required this.outstandingBalance,
      required this.creditLimit,
      required this.isFetchingOutstandingBalance,
      required this.isFetchingCreditLimit,
      required this.failureOrSuccessOption})
      : super._();

  @override
  final OutstandingBalance outstandingBalance;
  @override
  final CreditLimit creditLimit;
  @override
  final bool isFetchingOutstandingBalance;
  @override
  final bool isFetchingCreditLimit;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;

  @override
  String toString() {
    return 'AccountSummaryState(outstandingBalance: $outstandingBalance, creditLimit: $creditLimit, isFetchingOutstandingBalance: $isFetchingOutstandingBalance, isFetchingCreditLimit: $isFetchingCreditLimit, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountSummaryStateImpl &&
            (identical(other.outstandingBalance, outstandingBalance) ||
                other.outstandingBalance == outstandingBalance) &&
            (identical(other.creditLimit, creditLimit) ||
                other.creditLimit == creditLimit) &&
            (identical(other.isFetchingOutstandingBalance,
                    isFetchingOutstandingBalance) ||
                other.isFetchingOutstandingBalance ==
                    isFetchingOutstandingBalance) &&
            (identical(other.isFetchingCreditLimit, isFetchingCreditLimit) ||
                other.isFetchingCreditLimit == isFetchingCreditLimit) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      outstandingBalance,
      creditLimit,
      isFetchingOutstandingBalance,
      isFetchingCreditLimit,
      failureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountSummaryStateImplCopyWith<_$AccountSummaryStateImpl> get copyWith =>
      __$$AccountSummaryStateImplCopyWithImpl<_$AccountSummaryStateImpl>(
          this, _$identity);
}

abstract class _AccountSummaryState extends AccountSummaryState {
  const factory _AccountSummaryState(
      {required final OutstandingBalance outstandingBalance,
      required final CreditLimit creditLimit,
      required final bool isFetchingOutstandingBalance,
      required final bool isFetchingCreditLimit,
      required final Option<Either<ApiFailure, dynamic>>
          failureOrSuccessOption}) = _$AccountSummaryStateImpl;
  const _AccountSummaryState._() : super._();

  @override
  OutstandingBalance get outstandingBalance;
  @override
  CreditLimit get creditLimit;
  @override
  bool get isFetchingOutstandingBalance;
  @override
  bool get isFetchingCreditLimit;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$AccountSummaryStateImplCopyWith<_$AccountSummaryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

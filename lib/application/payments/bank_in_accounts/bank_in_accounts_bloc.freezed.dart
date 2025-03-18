// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_in_accounts_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BankInAccountsEvent {
  SalesOrg get salesOrg => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) bankInFetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? bankInFetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? bankInFetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BankInFetch value) bankInFetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BankInFetch value)? bankInFetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BankInFetch value)? bankInFetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BankInAccountsEventCopyWith<BankInAccountsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankInAccountsEventCopyWith<$Res> {
  factory $BankInAccountsEventCopyWith(
          BankInAccountsEvent value, $Res Function(BankInAccountsEvent) then) =
      _$BankInAccountsEventCopyWithImpl<$Res, BankInAccountsEvent>;
  @useResult
  $Res call({SalesOrg salesOrg});
}

/// @nodoc
class _$BankInAccountsEventCopyWithImpl<$Res, $Val extends BankInAccountsEvent>
    implements $BankInAccountsEventCopyWith<$Res> {
  _$BankInAccountsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
  }) {
    return _then(_value.copyWith(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankInFetchImplCopyWith<$Res>
    implements $BankInAccountsEventCopyWith<$Res> {
  factory _$$BankInFetchImplCopyWith(
          _$BankInFetchImpl value, $Res Function(_$BankInFetchImpl) then) =
      __$$BankInFetchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SalesOrg salesOrg});
}

/// @nodoc
class __$$BankInFetchImplCopyWithImpl<$Res>
    extends _$BankInAccountsEventCopyWithImpl<$Res, _$BankInFetchImpl>
    implements _$$BankInFetchImplCopyWith<$Res> {
  __$$BankInFetchImplCopyWithImpl(
      _$BankInFetchImpl _value, $Res Function(_$BankInFetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
  }) {
    return _then(_$BankInFetchImpl(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ));
  }
}

/// @nodoc

class _$BankInFetchImpl implements _BankInFetch {
  const _$BankInFetchImpl({required this.salesOrg});

  @override
  final SalesOrg salesOrg;

  @override
  String toString() {
    return 'BankInAccountsEvent.bankInFetch(salesOrg: $salesOrg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankInFetchImpl &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BankInFetchImplCopyWith<_$BankInFetchImpl> get copyWith =>
      __$$BankInFetchImplCopyWithImpl<_$BankInFetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) bankInFetch,
  }) {
    return bankInFetch(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? bankInFetch,
  }) {
    return bankInFetch?.call(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? bankInFetch,
    required TResult orElse(),
  }) {
    if (bankInFetch != null) {
      return bankInFetch(salesOrg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BankInFetch value) bankInFetch,
  }) {
    return bankInFetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BankInFetch value)? bankInFetch,
  }) {
    return bankInFetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BankInFetch value)? bankInFetch,
    required TResult orElse(),
  }) {
    if (bankInFetch != null) {
      return bankInFetch(this);
    }
    return orElse();
  }
}

abstract class _BankInFetch implements BankInAccountsEvent {
  const factory _BankInFetch({required final SalesOrg salesOrg}) =
      _$BankInFetchImpl;

  @override
  SalesOrg get salesOrg;
  @override
  @JsonKey(ignore: true)
  _$$BankInFetchImplCopyWith<_$BankInFetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BankInAccountsState {
  List<BankBeneficiary> get bankInAccounts =>
      throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BankInAccountsStateCopyWith<BankInAccountsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankInAccountsStateCopyWith<$Res> {
  factory $BankInAccountsStateCopyWith(
          BankInAccountsState value, $Res Function(BankInAccountsState) then) =
      _$BankInAccountsStateCopyWithImpl<$Res, BankInAccountsState>;
  @useResult
  $Res call(
      {List<BankBeneficiary> bankInAccounts,
      bool isFetching,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});
}

/// @nodoc
class _$BankInAccountsStateCopyWithImpl<$Res, $Val extends BankInAccountsState>
    implements $BankInAccountsStateCopyWith<$Res> {
  _$BankInAccountsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankInAccounts = null,
    Object? isFetching = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      bankInAccounts: null == bankInAccounts
          ? _value.bankInAccounts
          : bankInAccounts // ignore: cast_nullable_to_non_nullable
              as List<BankBeneficiary>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ManageBankBeneficiaryStateImplCopyWith<$Res>
    implements $BankInAccountsStateCopyWith<$Res> {
  factory _$$ManageBankBeneficiaryStateImplCopyWith(
          _$ManageBankBeneficiaryStateImpl value,
          $Res Function(_$ManageBankBeneficiaryStateImpl) then) =
      __$$ManageBankBeneficiaryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BankBeneficiary> bankInAccounts,
      bool isFetching,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption});
}

/// @nodoc
class __$$ManageBankBeneficiaryStateImplCopyWithImpl<$Res>
    extends _$BankInAccountsStateCopyWithImpl<$Res,
        _$ManageBankBeneficiaryStateImpl>
    implements _$$ManageBankBeneficiaryStateImplCopyWith<$Res> {
  __$$ManageBankBeneficiaryStateImplCopyWithImpl(
      _$ManageBankBeneficiaryStateImpl _value,
      $Res Function(_$ManageBankBeneficiaryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankInAccounts = null,
    Object? isFetching = null,
    Object? failureOrSuccessOption = null,
  }) {
    return _then(_$ManageBankBeneficiaryStateImpl(
      bankInAccounts: null == bankInAccounts
          ? _value._bankInAccounts
          : bankInAccounts // ignore: cast_nullable_to_non_nullable
              as List<BankBeneficiary>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$ManageBankBeneficiaryStateImpl extends _ManageBankBeneficiaryState {
  const _$ManageBankBeneficiaryStateImpl(
      {required final List<BankBeneficiary> bankInAccounts,
      required this.isFetching,
      required this.failureOrSuccessOption})
      : _bankInAccounts = bankInAccounts,
        super._();

  final List<BankBeneficiary> _bankInAccounts;
  @override
  List<BankBeneficiary> get bankInAccounts {
    if (_bankInAccounts is EqualUnmodifiableListView) return _bankInAccounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bankInAccounts);
  }

  @override
  final bool isFetching;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;

  @override
  String toString() {
    return 'BankInAccountsState(bankInAccounts: $bankInAccounts, isFetching: $isFetching, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManageBankBeneficiaryStateImpl &&
            const DeepCollectionEquality()
                .equals(other._bankInAccounts, _bankInAccounts) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_bankInAccounts),
      isFetching,
      failureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ManageBankBeneficiaryStateImplCopyWith<_$ManageBankBeneficiaryStateImpl>
      get copyWith => __$$ManageBankBeneficiaryStateImplCopyWithImpl<
          _$ManageBankBeneficiaryStateImpl>(this, _$identity);
}

abstract class _ManageBankBeneficiaryState extends BankInAccountsState {
  const factory _ManageBankBeneficiaryState(
      {required final List<BankBeneficiary> bankInAccounts,
      required final bool isFetching,
      required final Option<Either<ApiFailure, dynamic>>
          failureOrSuccessOption}) = _$ManageBankBeneficiaryStateImpl;
  const _ManageBankBeneficiaryState._() : super._();

  @override
  List<BankBeneficiary> get bankInAccounts;
  @override
  bool get isFetching;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$ManageBankBeneficiaryStateImplCopyWith<_$ManageBankBeneficiaryStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'soa_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SoaEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            CustomerCodeInfo customerCodeInfo, SalesOrg salesOrg)
        fetch,
    required TResult Function(SoaFilter soaFilter) updateFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(CustomerCodeInfo customerCodeInfo, SalesOrg salesOrg)?
        fetch,
    TResult? Function(SoaFilter soaFilter)? updateFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customerCodeInfo, SalesOrg salesOrg)?
        fetch,
    TResult Function(SoaFilter soaFilter)? updateFilter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_UpdateFilter value) updateFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_UpdateFilter value)? updateFilter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_UpdateFilter value)? updateFilter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SoaEventCopyWith<$Res> {
  factory $SoaEventCopyWith(SoaEvent value, $Res Function(SoaEvent) then) =
      _$SoaEventCopyWithImpl<$Res, SoaEvent>;
}

/// @nodoc
class _$SoaEventCopyWithImpl<$Res, $Val extends SoaEvent>
    implements $SoaEventCopyWith<$Res> {
  _$SoaEventCopyWithImpl(this._value, this._then);

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
}

/// @nodoc
class __$$initializedImplCopyWithImpl<$Res>
    extends _$SoaEventCopyWithImpl<$Res, _$initializedImpl>
    implements _$$initializedImplCopyWith<$Res> {
  __$$initializedImplCopyWithImpl(
      _$initializedImpl _value, $Res Function(_$initializedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$initializedImpl implements _initialized {
  const _$initializedImpl();

  @override
  String toString() {
    return 'SoaEvent.initialized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$initializedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            CustomerCodeInfo customerCodeInfo, SalesOrg salesOrg)
        fetch,
    required TResult Function(SoaFilter soaFilter) updateFilter,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(CustomerCodeInfo customerCodeInfo, SalesOrg salesOrg)?
        fetch,
    TResult? Function(SoaFilter soaFilter)? updateFilter,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customerCodeInfo, SalesOrg salesOrg)?
        fetch,
    TResult Function(SoaFilter soaFilter)? updateFilter,
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
    required TResult Function(_initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_UpdateFilter value) updateFilter,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_UpdateFilter value)? updateFilter,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_UpdateFilter value)? updateFilter,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _initialized implements SoaEvent {
  const factory _initialized() = _$initializedImpl;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CustomerCodeInfo customerCodeInfo, SalesOrg salesOrg});

  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$SoaEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeInfo = null,
    Object? salesOrg = null,
  }) {
    return _then(_$FetchImpl(
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ));
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

class _$FetchImpl implements _Fetch {
  const _$FetchImpl({required this.customerCodeInfo, required this.salesOrg});

  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final SalesOrg salesOrg;

  @override
  String toString() {
    return 'SoaEvent.fetch(customerCodeInfo: $customerCodeInfo, salesOrg: $salesOrg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerCodeInfo, salesOrg);

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
            CustomerCodeInfo customerCodeInfo, SalesOrg salesOrg)
        fetch,
    required TResult Function(SoaFilter soaFilter) updateFilter,
  }) {
    return fetch(customerCodeInfo, salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(CustomerCodeInfo customerCodeInfo, SalesOrg salesOrg)?
        fetch,
    TResult? Function(SoaFilter soaFilter)? updateFilter,
  }) {
    return fetch?.call(customerCodeInfo, salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customerCodeInfo, SalesOrg salesOrg)?
        fetch,
    TResult Function(SoaFilter soaFilter)? updateFilter,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(customerCodeInfo, salesOrg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_UpdateFilter value) updateFilter,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_UpdateFilter value)? updateFilter,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_UpdateFilter value)? updateFilter,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements SoaEvent {
  const factory _Fetch(
      {required final CustomerCodeInfo customerCodeInfo,
      required final SalesOrg salesOrg}) = _$FetchImpl;

  CustomerCodeInfo get customerCodeInfo;
  SalesOrg get salesOrg;
  @JsonKey(ignore: true)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateFilterImplCopyWith<$Res> {
  factory _$$UpdateFilterImplCopyWith(
          _$UpdateFilterImpl value, $Res Function(_$UpdateFilterImpl) then) =
      __$$UpdateFilterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SoaFilter soaFilter});

  $SoaFilterCopyWith<$Res> get soaFilter;
}

/// @nodoc
class __$$UpdateFilterImplCopyWithImpl<$Res>
    extends _$SoaEventCopyWithImpl<$Res, _$UpdateFilterImpl>
    implements _$$UpdateFilterImplCopyWith<$Res> {
  __$$UpdateFilterImplCopyWithImpl(
      _$UpdateFilterImpl _value, $Res Function(_$UpdateFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soaFilter = null,
  }) {
    return _then(_$UpdateFilterImpl(
      soaFilter: null == soaFilter
          ? _value.soaFilter
          : soaFilter // ignore: cast_nullable_to_non_nullable
              as SoaFilter,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SoaFilterCopyWith<$Res> get soaFilter {
    return $SoaFilterCopyWith<$Res>(_value.soaFilter, (value) {
      return _then(_value.copyWith(soaFilter: value));
    });
  }
}

/// @nodoc

class _$UpdateFilterImpl implements _UpdateFilter {
  const _$UpdateFilterImpl({required this.soaFilter});

  @override
  final SoaFilter soaFilter;

  @override
  String toString() {
    return 'SoaEvent.updateFilter(soaFilter: $soaFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateFilterImpl &&
            (identical(other.soaFilter, soaFilter) ||
                other.soaFilter == soaFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, soaFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateFilterImplCopyWith<_$UpdateFilterImpl> get copyWith =>
      __$$UpdateFilterImplCopyWithImpl<_$UpdateFilterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            CustomerCodeInfo customerCodeInfo, SalesOrg salesOrg)
        fetch,
    required TResult Function(SoaFilter soaFilter) updateFilter,
  }) {
    return updateFilter(soaFilter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(CustomerCodeInfo customerCodeInfo, SalesOrg salesOrg)?
        fetch,
    TResult? Function(SoaFilter soaFilter)? updateFilter,
  }) {
    return updateFilter?.call(soaFilter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customerCodeInfo, SalesOrg salesOrg)?
        fetch,
    TResult Function(SoaFilter soaFilter)? updateFilter,
    required TResult orElse(),
  }) {
    if (updateFilter != null) {
      return updateFilter(soaFilter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_UpdateFilter value) updateFilter,
  }) {
    return updateFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_UpdateFilter value)? updateFilter,
  }) {
    return updateFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_UpdateFilter value)? updateFilter,
    required TResult orElse(),
  }) {
    if (updateFilter != null) {
      return updateFilter(this);
    }
    return orElse();
  }
}

abstract class _UpdateFilter implements SoaEvent {
  const factory _UpdateFilter({required final SoaFilter soaFilter}) =
      _$UpdateFilterImpl;

  SoaFilter get soaFilter;
  @JsonKey(ignore: true)
  _$$UpdateFilterImplCopyWith<_$UpdateFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SoaState {
  bool get isFetching => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  List<Soa> get soaList => throw _privateConstructorUsedError;
  SoaFilter get appliedFilter => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SoaStateCopyWith<SoaState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SoaStateCopyWith<$Res> {
  factory $SoaStateCopyWith(SoaState value, $Res Function(SoaState) then) =
      _$SoaStateCopyWithImpl<$Res, SoaState>;
  @useResult
  $Res call(
      {bool isFetching,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      List<Soa> soaList,
      SoaFilter appliedFilter});

  $SoaFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class _$SoaStateCopyWithImpl<$Res, $Val extends SoaState>
    implements $SoaStateCopyWith<$Res> {
  _$SoaStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? failureOrSuccessOption = null,
    Object? soaList = null,
    Object? appliedFilter = null,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      soaList: null == soaList
          ? _value.soaList
          : soaList // ignore: cast_nullable_to_non_nullable
              as List<Soa>,
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as SoaFilter,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SoaFilterCopyWith<$Res> get appliedFilter {
    return $SoaFilterCopyWith<$Res>(_value.appliedFilter, (value) {
      return _then(_value.copyWith(appliedFilter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SoaStateImplCopyWith<$Res>
    implements $SoaStateCopyWith<$Res> {
  factory _$$SoaStateImplCopyWith(
          _$SoaStateImpl value, $Res Function(_$SoaStateImpl) then) =
      __$$SoaStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isFetching,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      List<Soa> soaList,
      SoaFilter appliedFilter});

  @override
  $SoaFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class __$$SoaStateImplCopyWithImpl<$Res>
    extends _$SoaStateCopyWithImpl<$Res, _$SoaStateImpl>
    implements _$$SoaStateImplCopyWith<$Res> {
  __$$SoaStateImplCopyWithImpl(
      _$SoaStateImpl _value, $Res Function(_$SoaStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
    Object? failureOrSuccessOption = null,
    Object? soaList = null,
    Object? appliedFilter = null,
  }) {
    return _then(_$SoaStateImpl(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      soaList: null == soaList
          ? _value._soaList
          : soaList // ignore: cast_nullable_to_non_nullable
              as List<Soa>,
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as SoaFilter,
    ));
  }
}

/// @nodoc

class _$SoaStateImpl extends _SoaState {
  const _$SoaStateImpl(
      {required this.isFetching,
      required this.failureOrSuccessOption,
      required final List<Soa> soaList,
      required this.appliedFilter})
      : _soaList = soaList,
        super._();

  @override
  final bool isFetching;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  final List<Soa> _soaList;
  @override
  List<Soa> get soaList {
    if (_soaList is EqualUnmodifiableListView) return _soaList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_soaList);
  }

  @override
  final SoaFilter appliedFilter;

  @override
  String toString() {
    return 'SoaState(isFetching: $isFetching, failureOrSuccessOption: $failureOrSuccessOption, soaList: $soaList, appliedFilter: $appliedFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SoaStateImpl &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            const DeepCollectionEquality().equals(other._soaList, _soaList) &&
            (identical(other.appliedFilter, appliedFilter) ||
                other.appliedFilter == appliedFilter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isFetching,
      failureOrSuccessOption,
      const DeepCollectionEquality().hash(_soaList),
      appliedFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SoaStateImplCopyWith<_$SoaStateImpl> get copyWith =>
      __$$SoaStateImplCopyWithImpl<_$SoaStateImpl>(this, _$identity);
}

abstract class _SoaState extends SoaState {
  const factory _SoaState(
      {required final bool isFetching,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final List<Soa> soaList,
      required final SoaFilter appliedFilter}) = _$SoaStateImpl;
  const _SoaState._() : super._();

  @override
  bool get isFetching;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  List<Soa> get soaList;
  @override
  SoaFilter get appliedFilter;
  @override
  @JsonKey(ignore: true)
  _$$SoaStateImplCopyWith<_$SoaStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

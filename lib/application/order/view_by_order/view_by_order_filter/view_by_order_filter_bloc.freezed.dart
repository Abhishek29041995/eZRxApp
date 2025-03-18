// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_by_order_filter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ViewByOrderFilterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) initialized,
    required TResult Function(ViewByOrdersFilter currentFilter)
        updateCurrentFilter,
    required TResult Function(DateTimeRange dateRange) setDateRange,
    required TResult Function(StatusType status, bool value) setOrderStatus,
    required TResult Function(MaterialOriginFilter type) setOrderHistoryType,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? initialized,
    TResult? Function(ViewByOrdersFilter currentFilter)? updateCurrentFilter,
    TResult? Function(DateTimeRange dateRange)? setDateRange,
    TResult? Function(StatusType status, bool value)? setOrderStatus,
    TResult? Function(MaterialOriginFilter type)? setOrderHistoryType,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? initialized,
    TResult Function(ViewByOrdersFilter currentFilter)? updateCurrentFilter,
    TResult Function(DateTimeRange dateRange)? setDateRange,
    TResult Function(StatusType status, bool value)? setOrderStatus,
    TResult Function(MaterialOriginFilter type)? setOrderHistoryType,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_UpdateCurrentFilter value) updateCurrentFilter,
    required TResult Function(_SetDateRange value) setDateRange,
    required TResult Function(_SetOrderStatus value) setOrderStatus,
    required TResult Function(_SetOrderHistoryType value) setOrderHistoryType,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_UpdateCurrentFilter value)? updateCurrentFilter,
    TResult? Function(_SetDateRange value)? setDateRange,
    TResult? Function(_SetOrderStatus value)? setOrderStatus,
    TResult? Function(_SetOrderHistoryType value)? setOrderHistoryType,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_UpdateCurrentFilter value)? updateCurrentFilter,
    TResult Function(_SetDateRange value)? setDateRange,
    TResult Function(_SetOrderStatus value)? setOrderStatus,
    TResult Function(_SetOrderHistoryType value)? setOrderHistoryType,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByOrderFilterEventCopyWith<$Res> {
  factory $ViewByOrderFilterEventCopyWith(ViewByOrderFilterEvent value,
          $Res Function(ViewByOrderFilterEvent) then) =
      _$ViewByOrderFilterEventCopyWithImpl<$Res, ViewByOrderFilterEvent>;
}

/// @nodoc
class _$ViewByOrderFilterEventCopyWithImpl<$Res,
        $Val extends ViewByOrderFilterEvent>
    implements $ViewByOrderFilterEventCopyWith<$Res> {
  _$ViewByOrderFilterEventCopyWithImpl(this._value, this._then);

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
  $Res call({SalesOrganisation salesOrganisation});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$ViewByOrderFilterEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
  }) {
    return _then(_$InitializedImpl(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value));
    });
  }
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl({required this.salesOrganisation});

  @override
  final SalesOrganisation salesOrganisation;

  @override
  String toString() {
    return 'ViewByOrderFilterEvent.initialized(salesOrganisation: $salesOrganisation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializedImpl &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrganisation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      __$$InitializedImplCopyWithImpl<_$InitializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) initialized,
    required TResult Function(ViewByOrdersFilter currentFilter)
        updateCurrentFilter,
    required TResult Function(DateTimeRange dateRange) setDateRange,
    required TResult Function(StatusType status, bool value) setOrderStatus,
    required TResult Function(MaterialOriginFilter type) setOrderHistoryType,
  }) {
    return initialized(salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? initialized,
    TResult? Function(ViewByOrdersFilter currentFilter)? updateCurrentFilter,
    TResult? Function(DateTimeRange dateRange)? setDateRange,
    TResult? Function(StatusType status, bool value)? setOrderStatus,
    TResult? Function(MaterialOriginFilter type)? setOrderHistoryType,
  }) {
    return initialized?.call(salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? initialized,
    TResult Function(ViewByOrdersFilter currentFilter)? updateCurrentFilter,
    TResult Function(DateTimeRange dateRange)? setDateRange,
    TResult Function(StatusType status, bool value)? setOrderStatus,
    TResult Function(MaterialOriginFilter type)? setOrderHistoryType,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(salesOrganisation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_UpdateCurrentFilter value) updateCurrentFilter,
    required TResult Function(_SetDateRange value) setDateRange,
    required TResult Function(_SetOrderStatus value) setOrderStatus,
    required TResult Function(_SetOrderHistoryType value) setOrderHistoryType,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_UpdateCurrentFilter value)? updateCurrentFilter,
    TResult? Function(_SetDateRange value)? setDateRange,
    TResult? Function(_SetOrderStatus value)? setOrderStatus,
    TResult? Function(_SetOrderHistoryType value)? setOrderHistoryType,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_UpdateCurrentFilter value)? updateCurrentFilter,
    TResult Function(_SetDateRange value)? setDateRange,
    TResult Function(_SetOrderStatus value)? setOrderStatus,
    TResult Function(_SetOrderHistoryType value)? setOrderHistoryType,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements ViewByOrderFilterEvent {
  const factory _Initialized(
      {required final SalesOrganisation salesOrganisation}) = _$InitializedImpl;

  SalesOrganisation get salesOrganisation;
  @JsonKey(ignore: true)
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateCurrentFilterImplCopyWith<$Res> {
  factory _$$UpdateCurrentFilterImplCopyWith(_$UpdateCurrentFilterImpl value,
          $Res Function(_$UpdateCurrentFilterImpl) then) =
      __$$UpdateCurrentFilterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ViewByOrdersFilter currentFilter});

  $ViewByOrdersFilterCopyWith<$Res> get currentFilter;
}

/// @nodoc
class __$$UpdateCurrentFilterImplCopyWithImpl<$Res>
    extends _$ViewByOrderFilterEventCopyWithImpl<$Res,
        _$UpdateCurrentFilterImpl>
    implements _$$UpdateCurrentFilterImplCopyWith<$Res> {
  __$$UpdateCurrentFilterImplCopyWithImpl(_$UpdateCurrentFilterImpl _value,
      $Res Function(_$UpdateCurrentFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentFilter = null,
  }) {
    return _then(_$UpdateCurrentFilterImpl(
      currentFilter: null == currentFilter
          ? _value.currentFilter
          : currentFilter // ignore: cast_nullable_to_non_nullable
              as ViewByOrdersFilter,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ViewByOrdersFilterCopyWith<$Res> get currentFilter {
    return $ViewByOrdersFilterCopyWith<$Res>(_value.currentFilter, (value) {
      return _then(_value.copyWith(currentFilter: value));
    });
  }
}

/// @nodoc

class _$UpdateCurrentFilterImpl implements _UpdateCurrentFilter {
  const _$UpdateCurrentFilterImpl({required this.currentFilter});

  @override
  final ViewByOrdersFilter currentFilter;

  @override
  String toString() {
    return 'ViewByOrderFilterEvent.updateCurrentFilter(currentFilter: $currentFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateCurrentFilterImpl &&
            (identical(other.currentFilter, currentFilter) ||
                other.currentFilter == currentFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateCurrentFilterImplCopyWith<_$UpdateCurrentFilterImpl> get copyWith =>
      __$$UpdateCurrentFilterImplCopyWithImpl<_$UpdateCurrentFilterImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) initialized,
    required TResult Function(ViewByOrdersFilter currentFilter)
        updateCurrentFilter,
    required TResult Function(DateTimeRange dateRange) setDateRange,
    required TResult Function(StatusType status, bool value) setOrderStatus,
    required TResult Function(MaterialOriginFilter type) setOrderHistoryType,
  }) {
    return updateCurrentFilter(currentFilter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? initialized,
    TResult? Function(ViewByOrdersFilter currentFilter)? updateCurrentFilter,
    TResult? Function(DateTimeRange dateRange)? setDateRange,
    TResult? Function(StatusType status, bool value)? setOrderStatus,
    TResult? Function(MaterialOriginFilter type)? setOrderHistoryType,
  }) {
    return updateCurrentFilter?.call(currentFilter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? initialized,
    TResult Function(ViewByOrdersFilter currentFilter)? updateCurrentFilter,
    TResult Function(DateTimeRange dateRange)? setDateRange,
    TResult Function(StatusType status, bool value)? setOrderStatus,
    TResult Function(MaterialOriginFilter type)? setOrderHistoryType,
    required TResult orElse(),
  }) {
    if (updateCurrentFilter != null) {
      return updateCurrentFilter(currentFilter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_UpdateCurrentFilter value) updateCurrentFilter,
    required TResult Function(_SetDateRange value) setDateRange,
    required TResult Function(_SetOrderStatus value) setOrderStatus,
    required TResult Function(_SetOrderHistoryType value) setOrderHistoryType,
  }) {
    return updateCurrentFilter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_UpdateCurrentFilter value)? updateCurrentFilter,
    TResult? Function(_SetDateRange value)? setDateRange,
    TResult? Function(_SetOrderStatus value)? setOrderStatus,
    TResult? Function(_SetOrderHistoryType value)? setOrderHistoryType,
  }) {
    return updateCurrentFilter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_UpdateCurrentFilter value)? updateCurrentFilter,
    TResult Function(_SetDateRange value)? setDateRange,
    TResult Function(_SetOrderStatus value)? setOrderStatus,
    TResult Function(_SetOrderHistoryType value)? setOrderHistoryType,
    required TResult orElse(),
  }) {
    if (updateCurrentFilter != null) {
      return updateCurrentFilter(this);
    }
    return orElse();
  }
}

abstract class _UpdateCurrentFilter implements ViewByOrderFilterEvent {
  const factory _UpdateCurrentFilter(
          {required final ViewByOrdersFilter currentFilter}) =
      _$UpdateCurrentFilterImpl;

  ViewByOrdersFilter get currentFilter;
  @JsonKey(ignore: true)
  _$$UpdateCurrentFilterImplCopyWith<_$UpdateCurrentFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetDateRangeImplCopyWith<$Res> {
  factory _$$SetDateRangeImplCopyWith(
          _$SetDateRangeImpl value, $Res Function(_$SetDateRangeImpl) then) =
      __$$SetDateRangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTimeRange dateRange});
}

/// @nodoc
class __$$SetDateRangeImplCopyWithImpl<$Res>
    extends _$ViewByOrderFilterEventCopyWithImpl<$Res, _$SetDateRangeImpl>
    implements _$$SetDateRangeImplCopyWith<$Res> {
  __$$SetDateRangeImplCopyWithImpl(
      _$SetDateRangeImpl _value, $Res Function(_$SetDateRangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateRange = null,
  }) {
    return _then(_$SetDateRangeImpl(
      null == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as DateTimeRange,
    ));
  }
}

/// @nodoc

class _$SetDateRangeImpl implements _SetDateRange {
  const _$SetDateRangeImpl(this.dateRange);

  @override
  final DateTimeRange dateRange;

  @override
  String toString() {
    return 'ViewByOrderFilterEvent.setDateRange(dateRange: $dateRange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetDateRangeImpl &&
            (identical(other.dateRange, dateRange) ||
                other.dateRange == dateRange));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateRange);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetDateRangeImplCopyWith<_$SetDateRangeImpl> get copyWith =>
      __$$SetDateRangeImplCopyWithImpl<_$SetDateRangeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) initialized,
    required TResult Function(ViewByOrdersFilter currentFilter)
        updateCurrentFilter,
    required TResult Function(DateTimeRange dateRange) setDateRange,
    required TResult Function(StatusType status, bool value) setOrderStatus,
    required TResult Function(MaterialOriginFilter type) setOrderHistoryType,
  }) {
    return setDateRange(dateRange);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? initialized,
    TResult? Function(ViewByOrdersFilter currentFilter)? updateCurrentFilter,
    TResult? Function(DateTimeRange dateRange)? setDateRange,
    TResult? Function(StatusType status, bool value)? setOrderStatus,
    TResult? Function(MaterialOriginFilter type)? setOrderHistoryType,
  }) {
    return setDateRange?.call(dateRange);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? initialized,
    TResult Function(ViewByOrdersFilter currentFilter)? updateCurrentFilter,
    TResult Function(DateTimeRange dateRange)? setDateRange,
    TResult Function(StatusType status, bool value)? setOrderStatus,
    TResult Function(MaterialOriginFilter type)? setOrderHistoryType,
    required TResult orElse(),
  }) {
    if (setDateRange != null) {
      return setDateRange(dateRange);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_UpdateCurrentFilter value) updateCurrentFilter,
    required TResult Function(_SetDateRange value) setDateRange,
    required TResult Function(_SetOrderStatus value) setOrderStatus,
    required TResult Function(_SetOrderHistoryType value) setOrderHistoryType,
  }) {
    return setDateRange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_UpdateCurrentFilter value)? updateCurrentFilter,
    TResult? Function(_SetDateRange value)? setDateRange,
    TResult? Function(_SetOrderStatus value)? setOrderStatus,
    TResult? Function(_SetOrderHistoryType value)? setOrderHistoryType,
  }) {
    return setDateRange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_UpdateCurrentFilter value)? updateCurrentFilter,
    TResult Function(_SetDateRange value)? setDateRange,
    TResult Function(_SetOrderStatus value)? setOrderStatus,
    TResult Function(_SetOrderHistoryType value)? setOrderHistoryType,
    required TResult orElse(),
  }) {
    if (setDateRange != null) {
      return setDateRange(this);
    }
    return orElse();
  }
}

abstract class _SetDateRange implements ViewByOrderFilterEvent {
  const factory _SetDateRange(final DateTimeRange dateRange) =
      _$SetDateRangeImpl;

  DateTimeRange get dateRange;
  @JsonKey(ignore: true)
  _$$SetDateRangeImplCopyWith<_$SetDateRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetOrderStatusImplCopyWith<$Res> {
  factory _$$SetOrderStatusImplCopyWith(_$SetOrderStatusImpl value,
          $Res Function(_$SetOrderStatusImpl) then) =
      __$$SetOrderStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StatusType status, bool value});
}

/// @nodoc
class __$$SetOrderStatusImplCopyWithImpl<$Res>
    extends _$ViewByOrderFilterEventCopyWithImpl<$Res, _$SetOrderStatusImpl>
    implements _$$SetOrderStatusImplCopyWith<$Res> {
  __$$SetOrderStatusImplCopyWithImpl(
      _$SetOrderStatusImpl _value, $Res Function(_$SetOrderStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? value = null,
  }) {
    return _then(_$SetOrderStatusImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusType,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SetOrderStatusImpl implements _SetOrderStatus {
  const _$SetOrderStatusImpl({required this.status, required this.value});

  @override
  final StatusType status;
  @override
  final bool value;

  @override
  String toString() {
    return 'ViewByOrderFilterEvent.setOrderStatus(status: $status, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetOrderStatusImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetOrderStatusImplCopyWith<_$SetOrderStatusImpl> get copyWith =>
      __$$SetOrderStatusImplCopyWithImpl<_$SetOrderStatusImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) initialized,
    required TResult Function(ViewByOrdersFilter currentFilter)
        updateCurrentFilter,
    required TResult Function(DateTimeRange dateRange) setDateRange,
    required TResult Function(StatusType status, bool value) setOrderStatus,
    required TResult Function(MaterialOriginFilter type) setOrderHistoryType,
  }) {
    return setOrderStatus(status, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? initialized,
    TResult? Function(ViewByOrdersFilter currentFilter)? updateCurrentFilter,
    TResult? Function(DateTimeRange dateRange)? setDateRange,
    TResult? Function(StatusType status, bool value)? setOrderStatus,
    TResult? Function(MaterialOriginFilter type)? setOrderHistoryType,
  }) {
    return setOrderStatus?.call(status, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? initialized,
    TResult Function(ViewByOrdersFilter currentFilter)? updateCurrentFilter,
    TResult Function(DateTimeRange dateRange)? setDateRange,
    TResult Function(StatusType status, bool value)? setOrderStatus,
    TResult Function(MaterialOriginFilter type)? setOrderHistoryType,
    required TResult orElse(),
  }) {
    if (setOrderStatus != null) {
      return setOrderStatus(status, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_UpdateCurrentFilter value) updateCurrentFilter,
    required TResult Function(_SetDateRange value) setDateRange,
    required TResult Function(_SetOrderStatus value) setOrderStatus,
    required TResult Function(_SetOrderHistoryType value) setOrderHistoryType,
  }) {
    return setOrderStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_UpdateCurrentFilter value)? updateCurrentFilter,
    TResult? Function(_SetDateRange value)? setDateRange,
    TResult? Function(_SetOrderStatus value)? setOrderStatus,
    TResult? Function(_SetOrderHistoryType value)? setOrderHistoryType,
  }) {
    return setOrderStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_UpdateCurrentFilter value)? updateCurrentFilter,
    TResult Function(_SetDateRange value)? setDateRange,
    TResult Function(_SetOrderStatus value)? setOrderStatus,
    TResult Function(_SetOrderHistoryType value)? setOrderHistoryType,
    required TResult orElse(),
  }) {
    if (setOrderStatus != null) {
      return setOrderStatus(this);
    }
    return orElse();
  }
}

abstract class _SetOrderStatus implements ViewByOrderFilterEvent {
  const factory _SetOrderStatus(
      {required final StatusType status,
      required final bool value}) = _$SetOrderStatusImpl;

  StatusType get status;
  bool get value;
  @JsonKey(ignore: true)
  _$$SetOrderStatusImplCopyWith<_$SetOrderStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetOrderHistoryTypeImplCopyWith<$Res> {
  factory _$$SetOrderHistoryTypeImplCopyWith(_$SetOrderHistoryTypeImpl value,
          $Res Function(_$SetOrderHistoryTypeImpl) then) =
      __$$SetOrderHistoryTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MaterialOriginFilter type});
}

/// @nodoc
class __$$SetOrderHistoryTypeImplCopyWithImpl<$Res>
    extends _$ViewByOrderFilterEventCopyWithImpl<$Res,
        _$SetOrderHistoryTypeImpl>
    implements _$$SetOrderHistoryTypeImplCopyWith<$Res> {
  __$$SetOrderHistoryTypeImplCopyWithImpl(_$SetOrderHistoryTypeImpl _value,
      $Res Function(_$SetOrderHistoryTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$SetOrderHistoryTypeImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MaterialOriginFilter,
    ));
  }
}

/// @nodoc

class _$SetOrderHistoryTypeImpl implements _SetOrderHistoryType {
  const _$SetOrderHistoryTypeImpl({required this.type});

  @override
  final MaterialOriginFilter type;

  @override
  String toString() {
    return 'ViewByOrderFilterEvent.setOrderHistoryType(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetOrderHistoryTypeImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetOrderHistoryTypeImplCopyWith<_$SetOrderHistoryTypeImpl> get copyWith =>
      __$$SetOrderHistoryTypeImplCopyWithImpl<_$SetOrderHistoryTypeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation) initialized,
    required TResult Function(ViewByOrdersFilter currentFilter)
        updateCurrentFilter,
    required TResult Function(DateTimeRange dateRange) setDateRange,
    required TResult Function(StatusType status, bool value) setOrderStatus,
    required TResult Function(MaterialOriginFilter type) setOrderHistoryType,
  }) {
    return setOrderHistoryType(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation)? initialized,
    TResult? Function(ViewByOrdersFilter currentFilter)? updateCurrentFilter,
    TResult? Function(DateTimeRange dateRange)? setDateRange,
    TResult? Function(StatusType status, bool value)? setOrderStatus,
    TResult? Function(MaterialOriginFilter type)? setOrderHistoryType,
  }) {
    return setOrderHistoryType?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation)? initialized,
    TResult Function(ViewByOrdersFilter currentFilter)? updateCurrentFilter,
    TResult Function(DateTimeRange dateRange)? setDateRange,
    TResult Function(StatusType status, bool value)? setOrderStatus,
    TResult Function(MaterialOriginFilter type)? setOrderHistoryType,
    required TResult orElse(),
  }) {
    if (setOrderHistoryType != null) {
      return setOrderHistoryType(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_UpdateCurrentFilter value) updateCurrentFilter,
    required TResult Function(_SetDateRange value) setDateRange,
    required TResult Function(_SetOrderStatus value) setOrderStatus,
    required TResult Function(_SetOrderHistoryType value) setOrderHistoryType,
  }) {
    return setOrderHistoryType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_UpdateCurrentFilter value)? updateCurrentFilter,
    TResult? Function(_SetDateRange value)? setDateRange,
    TResult? Function(_SetOrderStatus value)? setOrderStatus,
    TResult? Function(_SetOrderHistoryType value)? setOrderHistoryType,
  }) {
    return setOrderHistoryType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_UpdateCurrentFilter value)? updateCurrentFilter,
    TResult Function(_SetDateRange value)? setDateRange,
    TResult Function(_SetOrderStatus value)? setOrderStatus,
    TResult Function(_SetOrderHistoryType value)? setOrderHistoryType,
    required TResult orElse(),
  }) {
    if (setOrderHistoryType != null) {
      return setOrderHistoryType(this);
    }
    return orElse();
  }
}

abstract class _SetOrderHistoryType implements ViewByOrderFilterEvent {
  const factory _SetOrderHistoryType(
      {required final MaterialOriginFilter type}) = _$SetOrderHistoryTypeImpl;

  MaterialOriginFilter get type;
  @JsonKey(ignore: true)
  _$$SetOrderHistoryTypeImplCopyWith<_$SetOrderHistoryTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ViewByOrderFilterState {
  ViewByOrdersFilter get filter => throw _privateConstructorUsedError;
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewByOrderFilterStateCopyWith<ViewByOrderFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewByOrderFilterStateCopyWith<$Res> {
  factory $ViewByOrderFilterStateCopyWith(ViewByOrderFilterState value,
          $Res Function(ViewByOrderFilterState) then) =
      _$ViewByOrderFilterStateCopyWithImpl<$Res, ViewByOrderFilterState>;
  @useResult
  $Res call({ViewByOrdersFilter filter, SalesOrganisation salesOrganisation});

  $ViewByOrdersFilterCopyWith<$Res> get filter;
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
}

/// @nodoc
class _$ViewByOrderFilterStateCopyWithImpl<$Res,
        $Val extends ViewByOrderFilterState>
    implements $ViewByOrderFilterStateCopyWith<$Res> {
  _$ViewByOrderFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
    Object? salesOrganisation = null,
  }) {
    return _then(_value.copyWith(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as ViewByOrdersFilter,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ViewByOrdersFilterCopyWith<$Res> get filter {
    return $ViewByOrdersFilterCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ViewByOrderFilterStateImplCopyWith<$Res>
    implements $ViewByOrderFilterStateCopyWith<$Res> {
  factory _$$ViewByOrderFilterStateImplCopyWith(
          _$ViewByOrderFilterStateImpl value,
          $Res Function(_$ViewByOrderFilterStateImpl) then) =
      __$$ViewByOrderFilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ViewByOrdersFilter filter, SalesOrganisation salesOrganisation});

  @override
  $ViewByOrdersFilterCopyWith<$Res> get filter;
  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
}

/// @nodoc
class __$$ViewByOrderFilterStateImplCopyWithImpl<$Res>
    extends _$ViewByOrderFilterStateCopyWithImpl<$Res,
        _$ViewByOrderFilterStateImpl>
    implements _$$ViewByOrderFilterStateImplCopyWith<$Res> {
  __$$ViewByOrderFilterStateImplCopyWithImpl(
      _$ViewByOrderFilterStateImpl _value,
      $Res Function(_$ViewByOrderFilterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
    Object? salesOrganisation = null,
  }) {
    return _then(_$ViewByOrderFilterStateImpl(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as ViewByOrdersFilter,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
    ));
  }
}

/// @nodoc

class _$ViewByOrderFilterStateImpl extends _ViewByOrderFilterState {
  const _$ViewByOrderFilterStateImpl(
      {required this.filter, required this.salesOrganisation})
      : super._();

  @override
  final ViewByOrdersFilter filter;
  @override
  final SalesOrganisation salesOrganisation;

  @override
  String toString() {
    return 'ViewByOrderFilterState(filter: $filter, salesOrganisation: $salesOrganisation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewByOrderFilterStateImpl &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter, salesOrganisation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewByOrderFilterStateImplCopyWith<_$ViewByOrderFilterStateImpl>
      get copyWith => __$$ViewByOrderFilterStateImplCopyWithImpl<
          _$ViewByOrderFilterStateImpl>(this, _$identity);
}

abstract class _ViewByOrderFilterState extends ViewByOrderFilterState {
  const factory _ViewByOrderFilterState(
          {required final ViewByOrdersFilter filter,
          required final SalesOrganisation salesOrganisation}) =
      _$ViewByOrderFilterStateImpl;
  const _ViewByOrderFilterState._() : super._();

  @override
  ViewByOrdersFilter get filter;
  @override
  SalesOrganisation get salesOrganisation;
  @override
  @JsonKey(ignore: true)
  _$$ViewByOrderFilterStateImplCopyWith<_$ViewByOrderFilterStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

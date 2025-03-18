// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_summary_filter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentSummaryFilterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) initialized,
    required TResult Function(PaymentSummaryFilter appliedFilter)
        openFilterBottomSheet,
    required TResult Function() validateFilters,
    required TResult Function(String amountValueFrom) amountValueFromChanged,
    required TResult Function(String amountValueTo) amountValueToChanged,
    required TResult Function(FilterStatus filterStatus) statusChanged,
    required TResult Function(DateTimeRange dateRange) setCreatedDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? initialized,
    TResult? Function(PaymentSummaryFilter appliedFilter)?
        openFilterBottomSheet,
    TResult? Function()? validateFilters,
    TResult? Function(String amountValueFrom)? amountValueFromChanged,
    TResult? Function(String amountValueTo)? amountValueToChanged,
    TResult? Function(FilterStatus filterStatus)? statusChanged,
    TResult? Function(DateTimeRange dateRange)? setCreatedDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? initialized,
    TResult Function(PaymentSummaryFilter appliedFilter)? openFilterBottomSheet,
    TResult Function()? validateFilters,
    TResult Function(String amountValueFrom)? amountValueFromChanged,
    TResult Function(String amountValueTo)? amountValueToChanged,
    TResult Function(FilterStatus filterStatus)? statusChanged,
    TResult Function(DateTimeRange dateRange)? setCreatedDate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_OpenFilterBottomSheet value)
        openFilterBottomSheet,
    required TResult Function(_ValidateFilters value) validateFilters,
    required TResult Function(_AmountValueFromChanged value)
        amountValueFromChanged,
    required TResult Function(_AmountValueToChanged value) amountValueToChanged,
    required TResult Function(_StatusChanged value) statusChanged,
    required TResult Function(_SetCreatedDate value) setCreatedDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_OpenFilterBottomSheet value)? openFilterBottomSheet,
    TResult? Function(_ValidateFilters value)? validateFilters,
    TResult? Function(_AmountValueFromChanged value)? amountValueFromChanged,
    TResult? Function(_AmountValueToChanged value)? amountValueToChanged,
    TResult? Function(_StatusChanged value)? statusChanged,
    TResult? Function(_SetCreatedDate value)? setCreatedDate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_OpenFilterBottomSheet value)? openFilterBottomSheet,
    TResult Function(_ValidateFilters value)? validateFilters,
    TResult Function(_AmountValueFromChanged value)? amountValueFromChanged,
    TResult Function(_AmountValueToChanged value)? amountValueToChanged,
    TResult Function(_StatusChanged value)? statusChanged,
    TResult Function(_SetCreatedDate value)? setCreatedDate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentSummaryFilterEventCopyWith<$Res> {
  factory $PaymentSummaryFilterEventCopyWith(PaymentSummaryFilterEvent value,
          $Res Function(PaymentSummaryFilterEvent) then) =
      _$PaymentSummaryFilterEventCopyWithImpl<$Res, PaymentSummaryFilterEvent>;
}

/// @nodoc
class _$PaymentSummaryFilterEventCopyWithImpl<$Res,
        $Val extends PaymentSummaryFilterEvent>
    implements $PaymentSummaryFilterEventCopyWith<$Res> {
  _$PaymentSummaryFilterEventCopyWithImpl(this._value, this._then);

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
  $Res call({SalesOrg salesOrg});
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$PaymentSummaryFilterEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
  }) {
    return _then(_$InitializedImpl(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ));
  }
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl({required this.salesOrg});

  @override
  final SalesOrg salesOrg;

  @override
  String toString() {
    return 'PaymentSummaryFilterEvent.initialized(salesOrg: $salesOrg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializedImpl &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      __$$InitializedImplCopyWithImpl<_$InitializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) initialized,
    required TResult Function(PaymentSummaryFilter appliedFilter)
        openFilterBottomSheet,
    required TResult Function() validateFilters,
    required TResult Function(String amountValueFrom) amountValueFromChanged,
    required TResult Function(String amountValueTo) amountValueToChanged,
    required TResult Function(FilterStatus filterStatus) statusChanged,
    required TResult Function(DateTimeRange dateRange) setCreatedDate,
  }) {
    return initialized(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? initialized,
    TResult? Function(PaymentSummaryFilter appliedFilter)?
        openFilterBottomSheet,
    TResult? Function()? validateFilters,
    TResult? Function(String amountValueFrom)? amountValueFromChanged,
    TResult? Function(String amountValueTo)? amountValueToChanged,
    TResult? Function(FilterStatus filterStatus)? statusChanged,
    TResult? Function(DateTimeRange dateRange)? setCreatedDate,
  }) {
    return initialized?.call(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? initialized,
    TResult Function(PaymentSummaryFilter appliedFilter)? openFilterBottomSheet,
    TResult Function()? validateFilters,
    TResult Function(String amountValueFrom)? amountValueFromChanged,
    TResult Function(String amountValueTo)? amountValueToChanged,
    TResult Function(FilterStatus filterStatus)? statusChanged,
    TResult Function(DateTimeRange dateRange)? setCreatedDate,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(salesOrg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_OpenFilterBottomSheet value)
        openFilterBottomSheet,
    required TResult Function(_ValidateFilters value) validateFilters,
    required TResult Function(_AmountValueFromChanged value)
        amountValueFromChanged,
    required TResult Function(_AmountValueToChanged value) amountValueToChanged,
    required TResult Function(_StatusChanged value) statusChanged,
    required TResult Function(_SetCreatedDate value) setCreatedDate,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_OpenFilterBottomSheet value)? openFilterBottomSheet,
    TResult? Function(_ValidateFilters value)? validateFilters,
    TResult? Function(_AmountValueFromChanged value)? amountValueFromChanged,
    TResult? Function(_AmountValueToChanged value)? amountValueToChanged,
    TResult? Function(_StatusChanged value)? statusChanged,
    TResult? Function(_SetCreatedDate value)? setCreatedDate,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_OpenFilterBottomSheet value)? openFilterBottomSheet,
    TResult Function(_ValidateFilters value)? validateFilters,
    TResult Function(_AmountValueFromChanged value)? amountValueFromChanged,
    TResult Function(_AmountValueToChanged value)? amountValueToChanged,
    TResult Function(_StatusChanged value)? statusChanged,
    TResult Function(_SetCreatedDate value)? setCreatedDate,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements PaymentSummaryFilterEvent {
  const factory _Initialized({required final SalesOrg salesOrg}) =
      _$InitializedImpl;

  SalesOrg get salesOrg;
  @JsonKey(ignore: true)
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OpenFilterBottomSheetImplCopyWith<$Res> {
  factory _$$OpenFilterBottomSheetImplCopyWith(
          _$OpenFilterBottomSheetImpl value,
          $Res Function(_$OpenFilterBottomSheetImpl) then) =
      __$$OpenFilterBottomSheetImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentSummaryFilter appliedFilter});

  $PaymentSummaryFilterCopyWith<$Res> get appliedFilter;
}

/// @nodoc
class __$$OpenFilterBottomSheetImplCopyWithImpl<$Res>
    extends _$PaymentSummaryFilterEventCopyWithImpl<$Res,
        _$OpenFilterBottomSheetImpl>
    implements _$$OpenFilterBottomSheetImplCopyWith<$Res> {
  __$$OpenFilterBottomSheetImplCopyWithImpl(_$OpenFilterBottomSheetImpl _value,
      $Res Function(_$OpenFilterBottomSheetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appliedFilter = null,
  }) {
    return _then(_$OpenFilterBottomSheetImpl(
      appliedFilter: null == appliedFilter
          ? _value.appliedFilter
          : appliedFilter // ignore: cast_nullable_to_non_nullable
              as PaymentSummaryFilter,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentSummaryFilterCopyWith<$Res> get appliedFilter {
    return $PaymentSummaryFilterCopyWith<$Res>(_value.appliedFilter, (value) {
      return _then(_value.copyWith(appliedFilter: value));
    });
  }
}

/// @nodoc

class _$OpenFilterBottomSheetImpl implements _OpenFilterBottomSheet {
  const _$OpenFilterBottomSheetImpl({required this.appliedFilter});

  @override
  final PaymentSummaryFilter appliedFilter;

  @override
  String toString() {
    return 'PaymentSummaryFilterEvent.openFilterBottomSheet(appliedFilter: $appliedFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenFilterBottomSheetImpl &&
            (identical(other.appliedFilter, appliedFilter) ||
                other.appliedFilter == appliedFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appliedFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenFilterBottomSheetImplCopyWith<_$OpenFilterBottomSheetImpl>
      get copyWith => __$$OpenFilterBottomSheetImplCopyWithImpl<
          _$OpenFilterBottomSheetImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) initialized,
    required TResult Function(PaymentSummaryFilter appliedFilter)
        openFilterBottomSheet,
    required TResult Function() validateFilters,
    required TResult Function(String amountValueFrom) amountValueFromChanged,
    required TResult Function(String amountValueTo) amountValueToChanged,
    required TResult Function(FilterStatus filterStatus) statusChanged,
    required TResult Function(DateTimeRange dateRange) setCreatedDate,
  }) {
    return openFilterBottomSheet(appliedFilter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? initialized,
    TResult? Function(PaymentSummaryFilter appliedFilter)?
        openFilterBottomSheet,
    TResult? Function()? validateFilters,
    TResult? Function(String amountValueFrom)? amountValueFromChanged,
    TResult? Function(String amountValueTo)? amountValueToChanged,
    TResult? Function(FilterStatus filterStatus)? statusChanged,
    TResult? Function(DateTimeRange dateRange)? setCreatedDate,
  }) {
    return openFilterBottomSheet?.call(appliedFilter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? initialized,
    TResult Function(PaymentSummaryFilter appliedFilter)? openFilterBottomSheet,
    TResult Function()? validateFilters,
    TResult Function(String amountValueFrom)? amountValueFromChanged,
    TResult Function(String amountValueTo)? amountValueToChanged,
    TResult Function(FilterStatus filterStatus)? statusChanged,
    TResult Function(DateTimeRange dateRange)? setCreatedDate,
    required TResult orElse(),
  }) {
    if (openFilterBottomSheet != null) {
      return openFilterBottomSheet(appliedFilter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_OpenFilterBottomSheet value)
        openFilterBottomSheet,
    required TResult Function(_ValidateFilters value) validateFilters,
    required TResult Function(_AmountValueFromChanged value)
        amountValueFromChanged,
    required TResult Function(_AmountValueToChanged value) amountValueToChanged,
    required TResult Function(_StatusChanged value) statusChanged,
    required TResult Function(_SetCreatedDate value) setCreatedDate,
  }) {
    return openFilterBottomSheet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_OpenFilterBottomSheet value)? openFilterBottomSheet,
    TResult? Function(_ValidateFilters value)? validateFilters,
    TResult? Function(_AmountValueFromChanged value)? amountValueFromChanged,
    TResult? Function(_AmountValueToChanged value)? amountValueToChanged,
    TResult? Function(_StatusChanged value)? statusChanged,
    TResult? Function(_SetCreatedDate value)? setCreatedDate,
  }) {
    return openFilterBottomSheet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_OpenFilterBottomSheet value)? openFilterBottomSheet,
    TResult Function(_ValidateFilters value)? validateFilters,
    TResult Function(_AmountValueFromChanged value)? amountValueFromChanged,
    TResult Function(_AmountValueToChanged value)? amountValueToChanged,
    TResult Function(_StatusChanged value)? statusChanged,
    TResult Function(_SetCreatedDate value)? setCreatedDate,
    required TResult orElse(),
  }) {
    if (openFilterBottomSheet != null) {
      return openFilterBottomSheet(this);
    }
    return orElse();
  }
}

abstract class _OpenFilterBottomSheet implements PaymentSummaryFilterEvent {
  const factory _OpenFilterBottomSheet(
          {required final PaymentSummaryFilter appliedFilter}) =
      _$OpenFilterBottomSheetImpl;

  PaymentSummaryFilter get appliedFilter;
  @JsonKey(ignore: true)
  _$$OpenFilterBottomSheetImplCopyWith<_$OpenFilterBottomSheetImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidateFiltersImplCopyWith<$Res> {
  factory _$$ValidateFiltersImplCopyWith(_$ValidateFiltersImpl value,
          $Res Function(_$ValidateFiltersImpl) then) =
      __$$ValidateFiltersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ValidateFiltersImplCopyWithImpl<$Res>
    extends _$PaymentSummaryFilterEventCopyWithImpl<$Res, _$ValidateFiltersImpl>
    implements _$$ValidateFiltersImplCopyWith<$Res> {
  __$$ValidateFiltersImplCopyWithImpl(
      _$ValidateFiltersImpl _value, $Res Function(_$ValidateFiltersImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ValidateFiltersImpl implements _ValidateFilters {
  const _$ValidateFiltersImpl();

  @override
  String toString() {
    return 'PaymentSummaryFilterEvent.validateFilters()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ValidateFiltersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) initialized,
    required TResult Function(PaymentSummaryFilter appliedFilter)
        openFilterBottomSheet,
    required TResult Function() validateFilters,
    required TResult Function(String amountValueFrom) amountValueFromChanged,
    required TResult Function(String amountValueTo) amountValueToChanged,
    required TResult Function(FilterStatus filterStatus) statusChanged,
    required TResult Function(DateTimeRange dateRange) setCreatedDate,
  }) {
    return validateFilters();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? initialized,
    TResult? Function(PaymentSummaryFilter appliedFilter)?
        openFilterBottomSheet,
    TResult? Function()? validateFilters,
    TResult? Function(String amountValueFrom)? amountValueFromChanged,
    TResult? Function(String amountValueTo)? amountValueToChanged,
    TResult? Function(FilterStatus filterStatus)? statusChanged,
    TResult? Function(DateTimeRange dateRange)? setCreatedDate,
  }) {
    return validateFilters?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? initialized,
    TResult Function(PaymentSummaryFilter appliedFilter)? openFilterBottomSheet,
    TResult Function()? validateFilters,
    TResult Function(String amountValueFrom)? amountValueFromChanged,
    TResult Function(String amountValueTo)? amountValueToChanged,
    TResult Function(FilterStatus filterStatus)? statusChanged,
    TResult Function(DateTimeRange dateRange)? setCreatedDate,
    required TResult orElse(),
  }) {
    if (validateFilters != null) {
      return validateFilters();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_OpenFilterBottomSheet value)
        openFilterBottomSheet,
    required TResult Function(_ValidateFilters value) validateFilters,
    required TResult Function(_AmountValueFromChanged value)
        amountValueFromChanged,
    required TResult Function(_AmountValueToChanged value) amountValueToChanged,
    required TResult Function(_StatusChanged value) statusChanged,
    required TResult Function(_SetCreatedDate value) setCreatedDate,
  }) {
    return validateFilters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_OpenFilterBottomSheet value)? openFilterBottomSheet,
    TResult? Function(_ValidateFilters value)? validateFilters,
    TResult? Function(_AmountValueFromChanged value)? amountValueFromChanged,
    TResult? Function(_AmountValueToChanged value)? amountValueToChanged,
    TResult? Function(_StatusChanged value)? statusChanged,
    TResult? Function(_SetCreatedDate value)? setCreatedDate,
  }) {
    return validateFilters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_OpenFilterBottomSheet value)? openFilterBottomSheet,
    TResult Function(_ValidateFilters value)? validateFilters,
    TResult Function(_AmountValueFromChanged value)? amountValueFromChanged,
    TResult Function(_AmountValueToChanged value)? amountValueToChanged,
    TResult Function(_StatusChanged value)? statusChanged,
    TResult Function(_SetCreatedDate value)? setCreatedDate,
    required TResult orElse(),
  }) {
    if (validateFilters != null) {
      return validateFilters(this);
    }
    return orElse();
  }
}

abstract class _ValidateFilters implements PaymentSummaryFilterEvent {
  const factory _ValidateFilters() = _$ValidateFiltersImpl;
}

/// @nodoc
abstract class _$$AmountValueFromChangedImplCopyWith<$Res> {
  factory _$$AmountValueFromChangedImplCopyWith(
          _$AmountValueFromChangedImpl value,
          $Res Function(_$AmountValueFromChangedImpl) then) =
      __$$AmountValueFromChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String amountValueFrom});
}

/// @nodoc
class __$$AmountValueFromChangedImplCopyWithImpl<$Res>
    extends _$PaymentSummaryFilterEventCopyWithImpl<$Res,
        _$AmountValueFromChangedImpl>
    implements _$$AmountValueFromChangedImplCopyWith<$Res> {
  __$$AmountValueFromChangedImplCopyWithImpl(
      _$AmountValueFromChangedImpl _value,
      $Res Function(_$AmountValueFromChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amountValueFrom = null,
  }) {
    return _then(_$AmountValueFromChangedImpl(
      null == amountValueFrom
          ? _value.amountValueFrom
          : amountValueFrom // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AmountValueFromChangedImpl implements _AmountValueFromChanged {
  const _$AmountValueFromChangedImpl(this.amountValueFrom);

  @override
  final String amountValueFrom;

  @override
  String toString() {
    return 'PaymentSummaryFilterEvent.amountValueFromChanged(amountValueFrom: $amountValueFrom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AmountValueFromChangedImpl &&
            (identical(other.amountValueFrom, amountValueFrom) ||
                other.amountValueFrom == amountValueFrom));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amountValueFrom);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AmountValueFromChangedImplCopyWith<_$AmountValueFromChangedImpl>
      get copyWith => __$$AmountValueFromChangedImplCopyWithImpl<
          _$AmountValueFromChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) initialized,
    required TResult Function(PaymentSummaryFilter appliedFilter)
        openFilterBottomSheet,
    required TResult Function() validateFilters,
    required TResult Function(String amountValueFrom) amountValueFromChanged,
    required TResult Function(String amountValueTo) amountValueToChanged,
    required TResult Function(FilterStatus filterStatus) statusChanged,
    required TResult Function(DateTimeRange dateRange) setCreatedDate,
  }) {
    return amountValueFromChanged(amountValueFrom);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? initialized,
    TResult? Function(PaymentSummaryFilter appliedFilter)?
        openFilterBottomSheet,
    TResult? Function()? validateFilters,
    TResult? Function(String amountValueFrom)? amountValueFromChanged,
    TResult? Function(String amountValueTo)? amountValueToChanged,
    TResult? Function(FilterStatus filterStatus)? statusChanged,
    TResult? Function(DateTimeRange dateRange)? setCreatedDate,
  }) {
    return amountValueFromChanged?.call(amountValueFrom);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? initialized,
    TResult Function(PaymentSummaryFilter appliedFilter)? openFilterBottomSheet,
    TResult Function()? validateFilters,
    TResult Function(String amountValueFrom)? amountValueFromChanged,
    TResult Function(String amountValueTo)? amountValueToChanged,
    TResult Function(FilterStatus filterStatus)? statusChanged,
    TResult Function(DateTimeRange dateRange)? setCreatedDate,
    required TResult orElse(),
  }) {
    if (amountValueFromChanged != null) {
      return amountValueFromChanged(amountValueFrom);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_OpenFilterBottomSheet value)
        openFilterBottomSheet,
    required TResult Function(_ValidateFilters value) validateFilters,
    required TResult Function(_AmountValueFromChanged value)
        amountValueFromChanged,
    required TResult Function(_AmountValueToChanged value) amountValueToChanged,
    required TResult Function(_StatusChanged value) statusChanged,
    required TResult Function(_SetCreatedDate value) setCreatedDate,
  }) {
    return amountValueFromChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_OpenFilterBottomSheet value)? openFilterBottomSheet,
    TResult? Function(_ValidateFilters value)? validateFilters,
    TResult? Function(_AmountValueFromChanged value)? amountValueFromChanged,
    TResult? Function(_AmountValueToChanged value)? amountValueToChanged,
    TResult? Function(_StatusChanged value)? statusChanged,
    TResult? Function(_SetCreatedDate value)? setCreatedDate,
  }) {
    return amountValueFromChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_OpenFilterBottomSheet value)? openFilterBottomSheet,
    TResult Function(_ValidateFilters value)? validateFilters,
    TResult Function(_AmountValueFromChanged value)? amountValueFromChanged,
    TResult Function(_AmountValueToChanged value)? amountValueToChanged,
    TResult Function(_StatusChanged value)? statusChanged,
    TResult Function(_SetCreatedDate value)? setCreatedDate,
    required TResult orElse(),
  }) {
    if (amountValueFromChanged != null) {
      return amountValueFromChanged(this);
    }
    return orElse();
  }
}

abstract class _AmountValueFromChanged implements PaymentSummaryFilterEvent {
  const factory _AmountValueFromChanged(final String amountValueFrom) =
      _$AmountValueFromChangedImpl;

  String get amountValueFrom;
  @JsonKey(ignore: true)
  _$$AmountValueFromChangedImplCopyWith<_$AmountValueFromChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AmountValueToChangedImplCopyWith<$Res> {
  factory _$$AmountValueToChangedImplCopyWith(_$AmountValueToChangedImpl value,
          $Res Function(_$AmountValueToChangedImpl) then) =
      __$$AmountValueToChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String amountValueTo});
}

/// @nodoc
class __$$AmountValueToChangedImplCopyWithImpl<$Res>
    extends _$PaymentSummaryFilterEventCopyWithImpl<$Res,
        _$AmountValueToChangedImpl>
    implements _$$AmountValueToChangedImplCopyWith<$Res> {
  __$$AmountValueToChangedImplCopyWithImpl(_$AmountValueToChangedImpl _value,
      $Res Function(_$AmountValueToChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amountValueTo = null,
  }) {
    return _then(_$AmountValueToChangedImpl(
      null == amountValueTo
          ? _value.amountValueTo
          : amountValueTo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AmountValueToChangedImpl implements _AmountValueToChanged {
  const _$AmountValueToChangedImpl(this.amountValueTo);

  @override
  final String amountValueTo;

  @override
  String toString() {
    return 'PaymentSummaryFilterEvent.amountValueToChanged(amountValueTo: $amountValueTo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AmountValueToChangedImpl &&
            (identical(other.amountValueTo, amountValueTo) ||
                other.amountValueTo == amountValueTo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amountValueTo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AmountValueToChangedImplCopyWith<_$AmountValueToChangedImpl>
      get copyWith =>
          __$$AmountValueToChangedImplCopyWithImpl<_$AmountValueToChangedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) initialized,
    required TResult Function(PaymentSummaryFilter appliedFilter)
        openFilterBottomSheet,
    required TResult Function() validateFilters,
    required TResult Function(String amountValueFrom) amountValueFromChanged,
    required TResult Function(String amountValueTo) amountValueToChanged,
    required TResult Function(FilterStatus filterStatus) statusChanged,
    required TResult Function(DateTimeRange dateRange) setCreatedDate,
  }) {
    return amountValueToChanged(amountValueTo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? initialized,
    TResult? Function(PaymentSummaryFilter appliedFilter)?
        openFilterBottomSheet,
    TResult? Function()? validateFilters,
    TResult? Function(String amountValueFrom)? amountValueFromChanged,
    TResult? Function(String amountValueTo)? amountValueToChanged,
    TResult? Function(FilterStatus filterStatus)? statusChanged,
    TResult? Function(DateTimeRange dateRange)? setCreatedDate,
  }) {
    return amountValueToChanged?.call(amountValueTo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? initialized,
    TResult Function(PaymentSummaryFilter appliedFilter)? openFilterBottomSheet,
    TResult Function()? validateFilters,
    TResult Function(String amountValueFrom)? amountValueFromChanged,
    TResult Function(String amountValueTo)? amountValueToChanged,
    TResult Function(FilterStatus filterStatus)? statusChanged,
    TResult Function(DateTimeRange dateRange)? setCreatedDate,
    required TResult orElse(),
  }) {
    if (amountValueToChanged != null) {
      return amountValueToChanged(amountValueTo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_OpenFilterBottomSheet value)
        openFilterBottomSheet,
    required TResult Function(_ValidateFilters value) validateFilters,
    required TResult Function(_AmountValueFromChanged value)
        amountValueFromChanged,
    required TResult Function(_AmountValueToChanged value) amountValueToChanged,
    required TResult Function(_StatusChanged value) statusChanged,
    required TResult Function(_SetCreatedDate value) setCreatedDate,
  }) {
    return amountValueToChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_OpenFilterBottomSheet value)? openFilterBottomSheet,
    TResult? Function(_ValidateFilters value)? validateFilters,
    TResult? Function(_AmountValueFromChanged value)? amountValueFromChanged,
    TResult? Function(_AmountValueToChanged value)? amountValueToChanged,
    TResult? Function(_StatusChanged value)? statusChanged,
    TResult? Function(_SetCreatedDate value)? setCreatedDate,
  }) {
    return amountValueToChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_OpenFilterBottomSheet value)? openFilterBottomSheet,
    TResult Function(_ValidateFilters value)? validateFilters,
    TResult Function(_AmountValueFromChanged value)? amountValueFromChanged,
    TResult Function(_AmountValueToChanged value)? amountValueToChanged,
    TResult Function(_StatusChanged value)? statusChanged,
    TResult Function(_SetCreatedDate value)? setCreatedDate,
    required TResult orElse(),
  }) {
    if (amountValueToChanged != null) {
      return amountValueToChanged(this);
    }
    return orElse();
  }
}

abstract class _AmountValueToChanged implements PaymentSummaryFilterEvent {
  const factory _AmountValueToChanged(final String amountValueTo) =
      _$AmountValueToChangedImpl;

  String get amountValueTo;
  @JsonKey(ignore: true)
  _$$AmountValueToChangedImplCopyWith<_$AmountValueToChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StatusChangedImplCopyWith<$Res> {
  factory _$$StatusChangedImplCopyWith(
          _$StatusChangedImpl value, $Res Function(_$StatusChangedImpl) then) =
      __$$StatusChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FilterStatus filterStatus});
}

/// @nodoc
class __$$StatusChangedImplCopyWithImpl<$Res>
    extends _$PaymentSummaryFilterEventCopyWithImpl<$Res, _$StatusChangedImpl>
    implements _$$StatusChangedImplCopyWith<$Res> {
  __$$StatusChangedImplCopyWithImpl(
      _$StatusChangedImpl _value, $Res Function(_$StatusChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterStatus = null,
  }) {
    return _then(_$StatusChangedImpl(
      null == filterStatus
          ? _value.filterStatus
          : filterStatus // ignore: cast_nullable_to_non_nullable
              as FilterStatus,
    ));
  }
}

/// @nodoc

class _$StatusChangedImpl implements _StatusChanged {
  const _$StatusChangedImpl(this.filterStatus);

  @override
  final FilterStatus filterStatus;

  @override
  String toString() {
    return 'PaymentSummaryFilterEvent.statusChanged(filterStatus: $filterStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusChangedImpl &&
            (identical(other.filterStatus, filterStatus) ||
                other.filterStatus == filterStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filterStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusChangedImplCopyWith<_$StatusChangedImpl> get copyWith =>
      __$$StatusChangedImplCopyWithImpl<_$StatusChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) initialized,
    required TResult Function(PaymentSummaryFilter appliedFilter)
        openFilterBottomSheet,
    required TResult Function() validateFilters,
    required TResult Function(String amountValueFrom) amountValueFromChanged,
    required TResult Function(String amountValueTo) amountValueToChanged,
    required TResult Function(FilterStatus filterStatus) statusChanged,
    required TResult Function(DateTimeRange dateRange) setCreatedDate,
  }) {
    return statusChanged(filterStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? initialized,
    TResult? Function(PaymentSummaryFilter appliedFilter)?
        openFilterBottomSheet,
    TResult? Function()? validateFilters,
    TResult? Function(String amountValueFrom)? amountValueFromChanged,
    TResult? Function(String amountValueTo)? amountValueToChanged,
    TResult? Function(FilterStatus filterStatus)? statusChanged,
    TResult? Function(DateTimeRange dateRange)? setCreatedDate,
  }) {
    return statusChanged?.call(filterStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? initialized,
    TResult Function(PaymentSummaryFilter appliedFilter)? openFilterBottomSheet,
    TResult Function()? validateFilters,
    TResult Function(String amountValueFrom)? amountValueFromChanged,
    TResult Function(String amountValueTo)? amountValueToChanged,
    TResult Function(FilterStatus filterStatus)? statusChanged,
    TResult Function(DateTimeRange dateRange)? setCreatedDate,
    required TResult orElse(),
  }) {
    if (statusChanged != null) {
      return statusChanged(filterStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_OpenFilterBottomSheet value)
        openFilterBottomSheet,
    required TResult Function(_ValidateFilters value) validateFilters,
    required TResult Function(_AmountValueFromChanged value)
        amountValueFromChanged,
    required TResult Function(_AmountValueToChanged value) amountValueToChanged,
    required TResult Function(_StatusChanged value) statusChanged,
    required TResult Function(_SetCreatedDate value) setCreatedDate,
  }) {
    return statusChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_OpenFilterBottomSheet value)? openFilterBottomSheet,
    TResult? Function(_ValidateFilters value)? validateFilters,
    TResult? Function(_AmountValueFromChanged value)? amountValueFromChanged,
    TResult? Function(_AmountValueToChanged value)? amountValueToChanged,
    TResult? Function(_StatusChanged value)? statusChanged,
    TResult? Function(_SetCreatedDate value)? setCreatedDate,
  }) {
    return statusChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_OpenFilterBottomSheet value)? openFilterBottomSheet,
    TResult Function(_ValidateFilters value)? validateFilters,
    TResult Function(_AmountValueFromChanged value)? amountValueFromChanged,
    TResult Function(_AmountValueToChanged value)? amountValueToChanged,
    TResult Function(_StatusChanged value)? statusChanged,
    TResult Function(_SetCreatedDate value)? setCreatedDate,
    required TResult orElse(),
  }) {
    if (statusChanged != null) {
      return statusChanged(this);
    }
    return orElse();
  }
}

abstract class _StatusChanged implements PaymentSummaryFilterEvent {
  const factory _StatusChanged(final FilterStatus filterStatus) =
      _$StatusChangedImpl;

  FilterStatus get filterStatus;
  @JsonKey(ignore: true)
  _$$StatusChangedImplCopyWith<_$StatusChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetCreatedDateImplCopyWith<$Res> {
  factory _$$SetCreatedDateImplCopyWith(_$SetCreatedDateImpl value,
          $Res Function(_$SetCreatedDateImpl) then) =
      __$$SetCreatedDateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTimeRange dateRange});
}

/// @nodoc
class __$$SetCreatedDateImplCopyWithImpl<$Res>
    extends _$PaymentSummaryFilterEventCopyWithImpl<$Res, _$SetCreatedDateImpl>
    implements _$$SetCreatedDateImplCopyWith<$Res> {
  __$$SetCreatedDateImplCopyWithImpl(
      _$SetCreatedDateImpl _value, $Res Function(_$SetCreatedDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateRange = null,
  }) {
    return _then(_$SetCreatedDateImpl(
      null == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as DateTimeRange,
    ));
  }
}

/// @nodoc

class _$SetCreatedDateImpl implements _SetCreatedDate {
  const _$SetCreatedDateImpl(this.dateRange);

  @override
  final DateTimeRange dateRange;

  @override
  String toString() {
    return 'PaymentSummaryFilterEvent.setCreatedDate(dateRange: $dateRange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetCreatedDateImpl &&
            (identical(other.dateRange, dateRange) ||
                other.dateRange == dateRange));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateRange);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetCreatedDateImplCopyWith<_$SetCreatedDateImpl> get copyWith =>
      __$$SetCreatedDateImplCopyWithImpl<_$SetCreatedDateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) initialized,
    required TResult Function(PaymentSummaryFilter appliedFilter)
        openFilterBottomSheet,
    required TResult Function() validateFilters,
    required TResult Function(String amountValueFrom) amountValueFromChanged,
    required TResult Function(String amountValueTo) amountValueToChanged,
    required TResult Function(FilterStatus filterStatus) statusChanged,
    required TResult Function(DateTimeRange dateRange) setCreatedDate,
  }) {
    return setCreatedDate(dateRange);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? initialized,
    TResult? Function(PaymentSummaryFilter appliedFilter)?
        openFilterBottomSheet,
    TResult? Function()? validateFilters,
    TResult? Function(String amountValueFrom)? amountValueFromChanged,
    TResult? Function(String amountValueTo)? amountValueToChanged,
    TResult? Function(FilterStatus filterStatus)? statusChanged,
    TResult? Function(DateTimeRange dateRange)? setCreatedDate,
  }) {
    return setCreatedDate?.call(dateRange);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? initialized,
    TResult Function(PaymentSummaryFilter appliedFilter)? openFilterBottomSheet,
    TResult Function()? validateFilters,
    TResult Function(String amountValueFrom)? amountValueFromChanged,
    TResult Function(String amountValueTo)? amountValueToChanged,
    TResult Function(FilterStatus filterStatus)? statusChanged,
    TResult Function(DateTimeRange dateRange)? setCreatedDate,
    required TResult orElse(),
  }) {
    if (setCreatedDate != null) {
      return setCreatedDate(dateRange);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_OpenFilterBottomSheet value)
        openFilterBottomSheet,
    required TResult Function(_ValidateFilters value) validateFilters,
    required TResult Function(_AmountValueFromChanged value)
        amountValueFromChanged,
    required TResult Function(_AmountValueToChanged value) amountValueToChanged,
    required TResult Function(_StatusChanged value) statusChanged,
    required TResult Function(_SetCreatedDate value) setCreatedDate,
  }) {
    return setCreatedDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_OpenFilterBottomSheet value)? openFilterBottomSheet,
    TResult? Function(_ValidateFilters value)? validateFilters,
    TResult? Function(_AmountValueFromChanged value)? amountValueFromChanged,
    TResult? Function(_AmountValueToChanged value)? amountValueToChanged,
    TResult? Function(_StatusChanged value)? statusChanged,
    TResult? Function(_SetCreatedDate value)? setCreatedDate,
  }) {
    return setCreatedDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_OpenFilterBottomSheet value)? openFilterBottomSheet,
    TResult Function(_ValidateFilters value)? validateFilters,
    TResult Function(_AmountValueFromChanged value)? amountValueFromChanged,
    TResult Function(_AmountValueToChanged value)? amountValueToChanged,
    TResult Function(_StatusChanged value)? statusChanged,
    TResult Function(_SetCreatedDate value)? setCreatedDate,
    required TResult orElse(),
  }) {
    if (setCreatedDate != null) {
      return setCreatedDate(this);
    }
    return orElse();
  }
}

abstract class _SetCreatedDate implements PaymentSummaryFilterEvent {
  const factory _SetCreatedDate(final DateTimeRange dateRange) =
      _$SetCreatedDateImpl;

  DateTimeRange get dateRange;
  @JsonKey(ignore: true)
  _$$SetCreatedDateImplCopyWith<_$SetCreatedDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PaymentSummaryFilterState {
  SalesOrg get salesOrg => throw _privateConstructorUsedError;
  PaymentSummaryFilter get filter => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentSummaryFilterStateCopyWith<PaymentSummaryFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentSummaryFilterStateCopyWith<$Res> {
  factory $PaymentSummaryFilterStateCopyWith(PaymentSummaryFilterState value,
          $Res Function(PaymentSummaryFilterState) then) =
      _$PaymentSummaryFilterStateCopyWithImpl<$Res, PaymentSummaryFilterState>;
  @useResult
  $Res call(
      {SalesOrg salesOrg, PaymentSummaryFilter filter, bool showErrorMessages});

  $PaymentSummaryFilterCopyWith<$Res> get filter;
}

/// @nodoc
class _$PaymentSummaryFilterStateCopyWithImpl<$Res,
        $Val extends PaymentSummaryFilterState>
    implements $PaymentSummaryFilterStateCopyWith<$Res> {
  _$PaymentSummaryFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? filter = null,
    Object? showErrorMessages = null,
  }) {
    return _then(_value.copyWith(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as PaymentSummaryFilter,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentSummaryFilterCopyWith<$Res> get filter {
    return $PaymentSummaryFilterCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentSummaryFilterStateImplCopyWith<$Res>
    implements $PaymentSummaryFilterStateCopyWith<$Res> {
  factory _$$PaymentSummaryFilterStateImplCopyWith(
          _$PaymentSummaryFilterStateImpl value,
          $Res Function(_$PaymentSummaryFilterStateImpl) then) =
      __$$PaymentSummaryFilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SalesOrg salesOrg, PaymentSummaryFilter filter, bool showErrorMessages});

  @override
  $PaymentSummaryFilterCopyWith<$Res> get filter;
}

/// @nodoc
class __$$PaymentSummaryFilterStateImplCopyWithImpl<$Res>
    extends _$PaymentSummaryFilterStateCopyWithImpl<$Res,
        _$PaymentSummaryFilterStateImpl>
    implements _$$PaymentSummaryFilterStateImplCopyWith<$Res> {
  __$$PaymentSummaryFilterStateImplCopyWithImpl(
      _$PaymentSummaryFilterStateImpl _value,
      $Res Function(_$PaymentSummaryFilterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? filter = null,
    Object? showErrorMessages = null,
  }) {
    return _then(_$PaymentSummaryFilterStateImpl(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as PaymentSummaryFilter,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PaymentSummaryFilterStateImpl extends _PaymentSummaryFilterState {
  const _$PaymentSummaryFilterStateImpl(
      {required this.salesOrg,
      required this.filter,
      required this.showErrorMessages})
      : super._();

  @override
  final SalesOrg salesOrg;
  @override
  final PaymentSummaryFilter filter;
  @override
  final bool showErrorMessages;

  @override
  String toString() {
    return 'PaymentSummaryFilterState(salesOrg: $salesOrg, filter: $filter, showErrorMessages: $showErrorMessages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentSummaryFilterStateImpl &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, salesOrg, filter, showErrorMessages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentSummaryFilterStateImplCopyWith<_$PaymentSummaryFilterStateImpl>
      get copyWith => __$$PaymentSummaryFilterStateImplCopyWithImpl<
          _$PaymentSummaryFilterStateImpl>(this, _$identity);
}

abstract class _PaymentSummaryFilterState extends PaymentSummaryFilterState {
  const factory _PaymentSummaryFilterState(
      {required final SalesOrg salesOrg,
      required final PaymentSummaryFilter filter,
      required final bool showErrorMessages}) = _$PaymentSummaryFilterStateImpl;
  const _PaymentSummaryFilterState._() : super._();

  @override
  SalesOrg get salesOrg;
  @override
  PaymentSummaryFilter get filter;
  @override
  bool get showErrorMessages;
  @override
  @JsonKey(ignore: true)
  _$$PaymentSummaryFilterStateImplCopyWith<_$PaymentSummaryFilterStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

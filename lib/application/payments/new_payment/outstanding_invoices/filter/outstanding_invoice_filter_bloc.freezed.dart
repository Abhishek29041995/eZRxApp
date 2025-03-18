// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outstanding_invoice_filter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OutstandingInvoiceFilterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(OutstandingInvoiceFilter lastAppliedFilter)
        updateFilterToLastApplied,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(String amountFrom) setAmountFrom,
    required TResult Function(String amountTo) setAmountTo,
    required TResult Function(StatusType status, bool value)
        setOutstandingInvoiceStatus,
    required TResult Function() setValidationFailure,
    required TResult Function() resetFilters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(String amountFrom)? setAmountFrom,
    TResult? Function(String amountTo)? setAmountTo,
    TResult? Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult? Function()? setValidationFailure,
    TResult? Function()? resetFilters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(String amountFrom)? setAmountFrom,
    TResult Function(String amountTo)? setAmountTo,
    TResult Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult Function()? setValidationFailure,
    TResult Function()? resetFilters,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_UpdateFiltersToLastApplied value)
        updateFilterToLastApplied,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetAmountFrom value) setAmountFrom,
    required TResult Function(_SetAmountTo value) setAmountTo,
    required TResult Function(_SetOutstandingInvoiceStatus value)
        setOutstandingInvoiceStatus,
    required TResult Function(_SetValidationFailure value) setValidationFailure,
    required TResult Function(_ResetFilters value) resetFilters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetAmountFrom value)? setAmountFrom,
    TResult? Function(_SetAmountTo value)? setAmountTo,
    TResult? Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult? Function(_SetValidationFailure value)? setValidationFailure,
    TResult? Function(_ResetFilters value)? resetFilters,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetAmountFrom value)? setAmountFrom,
    TResult Function(_SetAmountTo value)? setAmountTo,
    TResult Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult Function(_SetValidationFailure value)? setValidationFailure,
    TResult Function(_ResetFilters value)? resetFilters,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutstandingInvoiceFilterEventCopyWith<$Res> {
  factory $OutstandingInvoiceFilterEventCopyWith(
          OutstandingInvoiceFilterEvent value,
          $Res Function(OutstandingInvoiceFilterEvent) then) =
      _$OutstandingInvoiceFilterEventCopyWithImpl<$Res,
          OutstandingInvoiceFilterEvent>;
}

/// @nodoc
class _$OutstandingInvoiceFilterEventCopyWithImpl<$Res,
        $Val extends OutstandingInvoiceFilterEvent>
    implements $OutstandingInvoiceFilterEventCopyWith<$Res> {
  _$OutstandingInvoiceFilterEventCopyWithImpl(this._value, this._then);

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
    extends _$OutstandingInvoiceFilterEventCopyWithImpl<$Res, _$InitializeImpl>
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
    return 'OutstandingInvoiceFilterEvent.initialize()';
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
    required TResult Function(OutstandingInvoiceFilter lastAppliedFilter)
        updateFilterToLastApplied,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(String amountFrom) setAmountFrom,
    required TResult Function(String amountTo) setAmountTo,
    required TResult Function(StatusType status, bool value)
        setOutstandingInvoiceStatus,
    required TResult Function() setValidationFailure,
    required TResult Function() resetFilters,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(String amountFrom)? setAmountFrom,
    TResult? Function(String amountTo)? setAmountTo,
    TResult? Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult? Function()? setValidationFailure,
    TResult? Function()? resetFilters,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(String amountFrom)? setAmountFrom,
    TResult Function(String amountTo)? setAmountTo,
    TResult Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult Function()? setValidationFailure,
    TResult Function()? resetFilters,
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
    required TResult Function(_UpdateFiltersToLastApplied value)
        updateFilterToLastApplied,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetAmountFrom value) setAmountFrom,
    required TResult Function(_SetAmountTo value) setAmountTo,
    required TResult Function(_SetOutstandingInvoiceStatus value)
        setOutstandingInvoiceStatus,
    required TResult Function(_SetValidationFailure value) setValidationFailure,
    required TResult Function(_ResetFilters value) resetFilters,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetAmountFrom value)? setAmountFrom,
    TResult? Function(_SetAmountTo value)? setAmountTo,
    TResult? Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult? Function(_SetValidationFailure value)? setValidationFailure,
    TResult? Function(_ResetFilters value)? resetFilters,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetAmountFrom value)? setAmountFrom,
    TResult Function(_SetAmountTo value)? setAmountTo,
    TResult Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult Function(_SetValidationFailure value)? setValidationFailure,
    TResult Function(_ResetFilters value)? resetFilters,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements OutstandingInvoiceFilterEvent {
  const factory _Initialize() = _$InitializeImpl;
}

/// @nodoc
abstract class _$$UpdateFiltersToLastAppliedImplCopyWith<$Res> {
  factory _$$UpdateFiltersToLastAppliedImplCopyWith(
          _$UpdateFiltersToLastAppliedImpl value,
          $Res Function(_$UpdateFiltersToLastAppliedImpl) then) =
      __$$UpdateFiltersToLastAppliedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OutstandingInvoiceFilter lastAppliedFilter});

  $OutstandingInvoiceFilterCopyWith<$Res> get lastAppliedFilter;
}

/// @nodoc
class __$$UpdateFiltersToLastAppliedImplCopyWithImpl<$Res>
    extends _$OutstandingInvoiceFilterEventCopyWithImpl<$Res,
        _$UpdateFiltersToLastAppliedImpl>
    implements _$$UpdateFiltersToLastAppliedImplCopyWith<$Res> {
  __$$UpdateFiltersToLastAppliedImplCopyWithImpl(
      _$UpdateFiltersToLastAppliedImpl _value,
      $Res Function(_$UpdateFiltersToLastAppliedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastAppliedFilter = null,
  }) {
    return _then(_$UpdateFiltersToLastAppliedImpl(
      lastAppliedFilter: null == lastAppliedFilter
          ? _value.lastAppliedFilter
          : lastAppliedFilter // ignore: cast_nullable_to_non_nullable
              as OutstandingInvoiceFilter,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $OutstandingInvoiceFilterCopyWith<$Res> get lastAppliedFilter {
    return $OutstandingInvoiceFilterCopyWith<$Res>(_value.lastAppliedFilter,
        (value) {
      return _then(_value.copyWith(lastAppliedFilter: value));
    });
  }
}

/// @nodoc

class _$UpdateFiltersToLastAppliedImpl implements _UpdateFiltersToLastApplied {
  const _$UpdateFiltersToLastAppliedImpl({required this.lastAppliedFilter});

  @override
  final OutstandingInvoiceFilter lastAppliedFilter;

  @override
  String toString() {
    return 'OutstandingInvoiceFilterEvent.updateFilterToLastApplied(lastAppliedFilter: $lastAppliedFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateFiltersToLastAppliedImpl &&
            (identical(other.lastAppliedFilter, lastAppliedFilter) ||
                other.lastAppliedFilter == lastAppliedFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lastAppliedFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateFiltersToLastAppliedImplCopyWith<_$UpdateFiltersToLastAppliedImpl>
      get copyWith => __$$UpdateFiltersToLastAppliedImplCopyWithImpl<
          _$UpdateFiltersToLastAppliedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(OutstandingInvoiceFilter lastAppliedFilter)
        updateFilterToLastApplied,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(String amountFrom) setAmountFrom,
    required TResult Function(String amountTo) setAmountTo,
    required TResult Function(StatusType status, bool value)
        setOutstandingInvoiceStatus,
    required TResult Function() setValidationFailure,
    required TResult Function() resetFilters,
  }) {
    return updateFilterToLastApplied(lastAppliedFilter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(String amountFrom)? setAmountFrom,
    TResult? Function(String amountTo)? setAmountTo,
    TResult? Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult? Function()? setValidationFailure,
    TResult? Function()? resetFilters,
  }) {
    return updateFilterToLastApplied?.call(lastAppliedFilter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(String amountFrom)? setAmountFrom,
    TResult Function(String amountTo)? setAmountTo,
    TResult Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult Function()? setValidationFailure,
    TResult Function()? resetFilters,
    required TResult orElse(),
  }) {
    if (updateFilterToLastApplied != null) {
      return updateFilterToLastApplied(lastAppliedFilter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_UpdateFiltersToLastApplied value)
        updateFilterToLastApplied,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetAmountFrom value) setAmountFrom,
    required TResult Function(_SetAmountTo value) setAmountTo,
    required TResult Function(_SetOutstandingInvoiceStatus value)
        setOutstandingInvoiceStatus,
    required TResult Function(_SetValidationFailure value) setValidationFailure,
    required TResult Function(_ResetFilters value) resetFilters,
  }) {
    return updateFilterToLastApplied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetAmountFrom value)? setAmountFrom,
    TResult? Function(_SetAmountTo value)? setAmountTo,
    TResult? Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult? Function(_SetValidationFailure value)? setValidationFailure,
    TResult? Function(_ResetFilters value)? resetFilters,
  }) {
    return updateFilterToLastApplied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetAmountFrom value)? setAmountFrom,
    TResult Function(_SetAmountTo value)? setAmountTo,
    TResult Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult Function(_SetValidationFailure value)? setValidationFailure,
    TResult Function(_ResetFilters value)? resetFilters,
    required TResult orElse(),
  }) {
    if (updateFilterToLastApplied != null) {
      return updateFilterToLastApplied(this);
    }
    return orElse();
  }
}

abstract class _UpdateFiltersToLastApplied
    implements OutstandingInvoiceFilterEvent {
  const factory _UpdateFiltersToLastApplied(
          {required final OutstandingInvoiceFilter lastAppliedFilter}) =
      _$UpdateFiltersToLastAppliedImpl;

  OutstandingInvoiceFilter get lastAppliedFilter;
  @JsonKey(ignore: true)
  _$$UpdateFiltersToLastAppliedImplCopyWith<_$UpdateFiltersToLastAppliedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetDocumentDateImplCopyWith<$Res> {
  factory _$$SetDocumentDateImplCopyWith(_$SetDocumentDateImpl value,
          $Res Function(_$SetDocumentDateImpl) then) =
      __$$SetDocumentDateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTimeRange documentDateRange});
}

/// @nodoc
class __$$SetDocumentDateImplCopyWithImpl<$Res>
    extends _$OutstandingInvoiceFilterEventCopyWithImpl<$Res,
        _$SetDocumentDateImpl> implements _$$SetDocumentDateImplCopyWith<$Res> {
  __$$SetDocumentDateImplCopyWithImpl(
      _$SetDocumentDateImpl _value, $Res Function(_$SetDocumentDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? documentDateRange = null,
  }) {
    return _then(_$SetDocumentDateImpl(
      documentDateRange: null == documentDateRange
          ? _value.documentDateRange
          : documentDateRange // ignore: cast_nullable_to_non_nullable
              as DateTimeRange,
    ));
  }
}

/// @nodoc

class _$SetDocumentDateImpl implements _SetDocumentDate {
  const _$SetDocumentDateImpl({required this.documentDateRange});

  @override
  final DateTimeRange documentDateRange;

  @override
  String toString() {
    return 'OutstandingInvoiceFilterEvent.setDocumentDate(documentDateRange: $documentDateRange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetDocumentDateImpl &&
            (identical(other.documentDateRange, documentDateRange) ||
                other.documentDateRange == documentDateRange));
  }

  @override
  int get hashCode => Object.hash(runtimeType, documentDateRange);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetDocumentDateImplCopyWith<_$SetDocumentDateImpl> get copyWith =>
      __$$SetDocumentDateImplCopyWithImpl<_$SetDocumentDateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(OutstandingInvoiceFilter lastAppliedFilter)
        updateFilterToLastApplied,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(String amountFrom) setAmountFrom,
    required TResult Function(String amountTo) setAmountTo,
    required TResult Function(StatusType status, bool value)
        setOutstandingInvoiceStatus,
    required TResult Function() setValidationFailure,
    required TResult Function() resetFilters,
  }) {
    return setDocumentDate(documentDateRange);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(String amountFrom)? setAmountFrom,
    TResult? Function(String amountTo)? setAmountTo,
    TResult? Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult? Function()? setValidationFailure,
    TResult? Function()? resetFilters,
  }) {
    return setDocumentDate?.call(documentDateRange);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(String amountFrom)? setAmountFrom,
    TResult Function(String amountTo)? setAmountTo,
    TResult Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult Function()? setValidationFailure,
    TResult Function()? resetFilters,
    required TResult orElse(),
  }) {
    if (setDocumentDate != null) {
      return setDocumentDate(documentDateRange);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_UpdateFiltersToLastApplied value)
        updateFilterToLastApplied,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetAmountFrom value) setAmountFrom,
    required TResult Function(_SetAmountTo value) setAmountTo,
    required TResult Function(_SetOutstandingInvoiceStatus value)
        setOutstandingInvoiceStatus,
    required TResult Function(_SetValidationFailure value) setValidationFailure,
    required TResult Function(_ResetFilters value) resetFilters,
  }) {
    return setDocumentDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetAmountFrom value)? setAmountFrom,
    TResult? Function(_SetAmountTo value)? setAmountTo,
    TResult? Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult? Function(_SetValidationFailure value)? setValidationFailure,
    TResult? Function(_ResetFilters value)? resetFilters,
  }) {
    return setDocumentDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetAmountFrom value)? setAmountFrom,
    TResult Function(_SetAmountTo value)? setAmountTo,
    TResult Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult Function(_SetValidationFailure value)? setValidationFailure,
    TResult Function(_ResetFilters value)? resetFilters,
    required TResult orElse(),
  }) {
    if (setDocumentDate != null) {
      return setDocumentDate(this);
    }
    return orElse();
  }
}

abstract class _SetDocumentDate implements OutstandingInvoiceFilterEvent {
  const factory _SetDocumentDate(
      {required final DateTimeRange documentDateRange}) = _$SetDocumentDateImpl;

  DateTimeRange get documentDateRange;
  @JsonKey(ignore: true)
  _$$SetDocumentDateImplCopyWith<_$SetDocumentDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetDueDateImplCopyWith<$Res> {
  factory _$$SetDueDateImplCopyWith(
          _$SetDueDateImpl value, $Res Function(_$SetDueDateImpl) then) =
      __$$SetDueDateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTimeRange dueDateRange});
}

/// @nodoc
class __$$SetDueDateImplCopyWithImpl<$Res>
    extends _$OutstandingInvoiceFilterEventCopyWithImpl<$Res, _$SetDueDateImpl>
    implements _$$SetDueDateImplCopyWith<$Res> {
  __$$SetDueDateImplCopyWithImpl(
      _$SetDueDateImpl _value, $Res Function(_$SetDueDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dueDateRange = null,
  }) {
    return _then(_$SetDueDateImpl(
      dueDateRange: null == dueDateRange
          ? _value.dueDateRange
          : dueDateRange // ignore: cast_nullable_to_non_nullable
              as DateTimeRange,
    ));
  }
}

/// @nodoc

class _$SetDueDateImpl implements _SetDueDate {
  const _$SetDueDateImpl({required this.dueDateRange});

  @override
  final DateTimeRange dueDateRange;

  @override
  String toString() {
    return 'OutstandingInvoiceFilterEvent.setDueDate(dueDateRange: $dueDateRange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetDueDateImpl &&
            (identical(other.dueDateRange, dueDateRange) ||
                other.dueDateRange == dueDateRange));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dueDateRange);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetDueDateImplCopyWith<_$SetDueDateImpl> get copyWith =>
      __$$SetDueDateImplCopyWithImpl<_$SetDueDateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(OutstandingInvoiceFilter lastAppliedFilter)
        updateFilterToLastApplied,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(String amountFrom) setAmountFrom,
    required TResult Function(String amountTo) setAmountTo,
    required TResult Function(StatusType status, bool value)
        setOutstandingInvoiceStatus,
    required TResult Function() setValidationFailure,
    required TResult Function() resetFilters,
  }) {
    return setDueDate(dueDateRange);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(String amountFrom)? setAmountFrom,
    TResult? Function(String amountTo)? setAmountTo,
    TResult? Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult? Function()? setValidationFailure,
    TResult? Function()? resetFilters,
  }) {
    return setDueDate?.call(dueDateRange);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(String amountFrom)? setAmountFrom,
    TResult Function(String amountTo)? setAmountTo,
    TResult Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult Function()? setValidationFailure,
    TResult Function()? resetFilters,
    required TResult orElse(),
  }) {
    if (setDueDate != null) {
      return setDueDate(dueDateRange);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_UpdateFiltersToLastApplied value)
        updateFilterToLastApplied,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetAmountFrom value) setAmountFrom,
    required TResult Function(_SetAmountTo value) setAmountTo,
    required TResult Function(_SetOutstandingInvoiceStatus value)
        setOutstandingInvoiceStatus,
    required TResult Function(_SetValidationFailure value) setValidationFailure,
    required TResult Function(_ResetFilters value) resetFilters,
  }) {
    return setDueDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetAmountFrom value)? setAmountFrom,
    TResult? Function(_SetAmountTo value)? setAmountTo,
    TResult? Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult? Function(_SetValidationFailure value)? setValidationFailure,
    TResult? Function(_ResetFilters value)? resetFilters,
  }) {
    return setDueDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetAmountFrom value)? setAmountFrom,
    TResult Function(_SetAmountTo value)? setAmountTo,
    TResult Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult Function(_SetValidationFailure value)? setValidationFailure,
    TResult Function(_ResetFilters value)? resetFilters,
    required TResult orElse(),
  }) {
    if (setDueDate != null) {
      return setDueDate(this);
    }
    return orElse();
  }
}

abstract class _SetDueDate implements OutstandingInvoiceFilterEvent {
  const factory _SetDueDate({required final DateTimeRange dueDateRange}) =
      _$SetDueDateImpl;

  DateTimeRange get dueDateRange;
  @JsonKey(ignore: true)
  _$$SetDueDateImplCopyWith<_$SetDueDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetAmountFromImplCopyWith<$Res> {
  factory _$$SetAmountFromImplCopyWith(
          _$SetAmountFromImpl value, $Res Function(_$SetAmountFromImpl) then) =
      __$$SetAmountFromImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String amountFrom});
}

/// @nodoc
class __$$SetAmountFromImplCopyWithImpl<$Res>
    extends _$OutstandingInvoiceFilterEventCopyWithImpl<$Res,
        _$SetAmountFromImpl> implements _$$SetAmountFromImplCopyWith<$Res> {
  __$$SetAmountFromImplCopyWithImpl(
      _$SetAmountFromImpl _value, $Res Function(_$SetAmountFromImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amountFrom = null,
  }) {
    return _then(_$SetAmountFromImpl(
      amountFrom: null == amountFrom
          ? _value.amountFrom
          : amountFrom // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SetAmountFromImpl implements _SetAmountFrom {
  const _$SetAmountFromImpl({required this.amountFrom});

  @override
  final String amountFrom;

  @override
  String toString() {
    return 'OutstandingInvoiceFilterEvent.setAmountFrom(amountFrom: $amountFrom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetAmountFromImpl &&
            (identical(other.amountFrom, amountFrom) ||
                other.amountFrom == amountFrom));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amountFrom);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetAmountFromImplCopyWith<_$SetAmountFromImpl> get copyWith =>
      __$$SetAmountFromImplCopyWithImpl<_$SetAmountFromImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(OutstandingInvoiceFilter lastAppliedFilter)
        updateFilterToLastApplied,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(String amountFrom) setAmountFrom,
    required TResult Function(String amountTo) setAmountTo,
    required TResult Function(StatusType status, bool value)
        setOutstandingInvoiceStatus,
    required TResult Function() setValidationFailure,
    required TResult Function() resetFilters,
  }) {
    return setAmountFrom(amountFrom);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(String amountFrom)? setAmountFrom,
    TResult? Function(String amountTo)? setAmountTo,
    TResult? Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult? Function()? setValidationFailure,
    TResult? Function()? resetFilters,
  }) {
    return setAmountFrom?.call(amountFrom);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(String amountFrom)? setAmountFrom,
    TResult Function(String amountTo)? setAmountTo,
    TResult Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult Function()? setValidationFailure,
    TResult Function()? resetFilters,
    required TResult orElse(),
  }) {
    if (setAmountFrom != null) {
      return setAmountFrom(amountFrom);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_UpdateFiltersToLastApplied value)
        updateFilterToLastApplied,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetAmountFrom value) setAmountFrom,
    required TResult Function(_SetAmountTo value) setAmountTo,
    required TResult Function(_SetOutstandingInvoiceStatus value)
        setOutstandingInvoiceStatus,
    required TResult Function(_SetValidationFailure value) setValidationFailure,
    required TResult Function(_ResetFilters value) resetFilters,
  }) {
    return setAmountFrom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetAmountFrom value)? setAmountFrom,
    TResult? Function(_SetAmountTo value)? setAmountTo,
    TResult? Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult? Function(_SetValidationFailure value)? setValidationFailure,
    TResult? Function(_ResetFilters value)? resetFilters,
  }) {
    return setAmountFrom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetAmountFrom value)? setAmountFrom,
    TResult Function(_SetAmountTo value)? setAmountTo,
    TResult Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult Function(_SetValidationFailure value)? setValidationFailure,
    TResult Function(_ResetFilters value)? resetFilters,
    required TResult orElse(),
  }) {
    if (setAmountFrom != null) {
      return setAmountFrom(this);
    }
    return orElse();
  }
}

abstract class _SetAmountFrom implements OutstandingInvoiceFilterEvent {
  const factory _SetAmountFrom({required final String amountFrom}) =
      _$SetAmountFromImpl;

  String get amountFrom;
  @JsonKey(ignore: true)
  _$$SetAmountFromImplCopyWith<_$SetAmountFromImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetAmountToImplCopyWith<$Res> {
  factory _$$SetAmountToImplCopyWith(
          _$SetAmountToImpl value, $Res Function(_$SetAmountToImpl) then) =
      __$$SetAmountToImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String amountTo});
}

/// @nodoc
class __$$SetAmountToImplCopyWithImpl<$Res>
    extends _$OutstandingInvoiceFilterEventCopyWithImpl<$Res, _$SetAmountToImpl>
    implements _$$SetAmountToImplCopyWith<$Res> {
  __$$SetAmountToImplCopyWithImpl(
      _$SetAmountToImpl _value, $Res Function(_$SetAmountToImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amountTo = null,
  }) {
    return _then(_$SetAmountToImpl(
      amountTo: null == amountTo
          ? _value.amountTo
          : amountTo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SetAmountToImpl implements _SetAmountTo {
  const _$SetAmountToImpl({required this.amountTo});

  @override
  final String amountTo;

  @override
  String toString() {
    return 'OutstandingInvoiceFilterEvent.setAmountTo(amountTo: $amountTo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetAmountToImpl &&
            (identical(other.amountTo, amountTo) ||
                other.amountTo == amountTo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amountTo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetAmountToImplCopyWith<_$SetAmountToImpl> get copyWith =>
      __$$SetAmountToImplCopyWithImpl<_$SetAmountToImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(OutstandingInvoiceFilter lastAppliedFilter)
        updateFilterToLastApplied,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(String amountFrom) setAmountFrom,
    required TResult Function(String amountTo) setAmountTo,
    required TResult Function(StatusType status, bool value)
        setOutstandingInvoiceStatus,
    required TResult Function() setValidationFailure,
    required TResult Function() resetFilters,
  }) {
    return setAmountTo(amountTo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(String amountFrom)? setAmountFrom,
    TResult? Function(String amountTo)? setAmountTo,
    TResult? Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult? Function()? setValidationFailure,
    TResult? Function()? resetFilters,
  }) {
    return setAmountTo?.call(amountTo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(String amountFrom)? setAmountFrom,
    TResult Function(String amountTo)? setAmountTo,
    TResult Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult Function()? setValidationFailure,
    TResult Function()? resetFilters,
    required TResult orElse(),
  }) {
    if (setAmountTo != null) {
      return setAmountTo(amountTo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_UpdateFiltersToLastApplied value)
        updateFilterToLastApplied,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetAmountFrom value) setAmountFrom,
    required TResult Function(_SetAmountTo value) setAmountTo,
    required TResult Function(_SetOutstandingInvoiceStatus value)
        setOutstandingInvoiceStatus,
    required TResult Function(_SetValidationFailure value) setValidationFailure,
    required TResult Function(_ResetFilters value) resetFilters,
  }) {
    return setAmountTo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetAmountFrom value)? setAmountFrom,
    TResult? Function(_SetAmountTo value)? setAmountTo,
    TResult? Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult? Function(_SetValidationFailure value)? setValidationFailure,
    TResult? Function(_ResetFilters value)? resetFilters,
  }) {
    return setAmountTo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetAmountFrom value)? setAmountFrom,
    TResult Function(_SetAmountTo value)? setAmountTo,
    TResult Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult Function(_SetValidationFailure value)? setValidationFailure,
    TResult Function(_ResetFilters value)? resetFilters,
    required TResult orElse(),
  }) {
    if (setAmountTo != null) {
      return setAmountTo(this);
    }
    return orElse();
  }
}

abstract class _SetAmountTo implements OutstandingInvoiceFilterEvent {
  const factory _SetAmountTo({required final String amountTo}) =
      _$SetAmountToImpl;

  String get amountTo;
  @JsonKey(ignore: true)
  _$$SetAmountToImplCopyWith<_$SetAmountToImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetOutstandingInvoiceStatusImplCopyWith<$Res> {
  factory _$$SetOutstandingInvoiceStatusImplCopyWith(
          _$SetOutstandingInvoiceStatusImpl value,
          $Res Function(_$SetOutstandingInvoiceStatusImpl) then) =
      __$$SetOutstandingInvoiceStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StatusType status, bool value});
}

/// @nodoc
class __$$SetOutstandingInvoiceStatusImplCopyWithImpl<$Res>
    extends _$OutstandingInvoiceFilterEventCopyWithImpl<$Res,
        _$SetOutstandingInvoiceStatusImpl>
    implements _$$SetOutstandingInvoiceStatusImplCopyWith<$Res> {
  __$$SetOutstandingInvoiceStatusImplCopyWithImpl(
      _$SetOutstandingInvoiceStatusImpl _value,
      $Res Function(_$SetOutstandingInvoiceStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? value = null,
  }) {
    return _then(_$SetOutstandingInvoiceStatusImpl(
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

class _$SetOutstandingInvoiceStatusImpl
    implements _SetOutstandingInvoiceStatus {
  const _$SetOutstandingInvoiceStatusImpl(
      {required this.status, required this.value});

  @override
  final StatusType status;
  @override
  final bool value;

  @override
  String toString() {
    return 'OutstandingInvoiceFilterEvent.setOutstandingInvoiceStatus(status: $status, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetOutstandingInvoiceStatusImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetOutstandingInvoiceStatusImplCopyWith<_$SetOutstandingInvoiceStatusImpl>
      get copyWith => __$$SetOutstandingInvoiceStatusImplCopyWithImpl<
          _$SetOutstandingInvoiceStatusImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(OutstandingInvoiceFilter lastAppliedFilter)
        updateFilterToLastApplied,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(String amountFrom) setAmountFrom,
    required TResult Function(String amountTo) setAmountTo,
    required TResult Function(StatusType status, bool value)
        setOutstandingInvoiceStatus,
    required TResult Function() setValidationFailure,
    required TResult Function() resetFilters,
  }) {
    return setOutstandingInvoiceStatus(status, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(String amountFrom)? setAmountFrom,
    TResult? Function(String amountTo)? setAmountTo,
    TResult? Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult? Function()? setValidationFailure,
    TResult? Function()? resetFilters,
  }) {
    return setOutstandingInvoiceStatus?.call(status, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(String amountFrom)? setAmountFrom,
    TResult Function(String amountTo)? setAmountTo,
    TResult Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult Function()? setValidationFailure,
    TResult Function()? resetFilters,
    required TResult orElse(),
  }) {
    if (setOutstandingInvoiceStatus != null) {
      return setOutstandingInvoiceStatus(status, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_UpdateFiltersToLastApplied value)
        updateFilterToLastApplied,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetAmountFrom value) setAmountFrom,
    required TResult Function(_SetAmountTo value) setAmountTo,
    required TResult Function(_SetOutstandingInvoiceStatus value)
        setOutstandingInvoiceStatus,
    required TResult Function(_SetValidationFailure value) setValidationFailure,
    required TResult Function(_ResetFilters value) resetFilters,
  }) {
    return setOutstandingInvoiceStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetAmountFrom value)? setAmountFrom,
    TResult? Function(_SetAmountTo value)? setAmountTo,
    TResult? Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult? Function(_SetValidationFailure value)? setValidationFailure,
    TResult? Function(_ResetFilters value)? resetFilters,
  }) {
    return setOutstandingInvoiceStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetAmountFrom value)? setAmountFrom,
    TResult Function(_SetAmountTo value)? setAmountTo,
    TResult Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult Function(_SetValidationFailure value)? setValidationFailure,
    TResult Function(_ResetFilters value)? resetFilters,
    required TResult orElse(),
  }) {
    if (setOutstandingInvoiceStatus != null) {
      return setOutstandingInvoiceStatus(this);
    }
    return orElse();
  }
}

abstract class _SetOutstandingInvoiceStatus
    implements OutstandingInvoiceFilterEvent {
  const factory _SetOutstandingInvoiceStatus(
      {required final StatusType status,
      required final bool value}) = _$SetOutstandingInvoiceStatusImpl;

  StatusType get status;
  bool get value;
  @JsonKey(ignore: true)
  _$$SetOutstandingInvoiceStatusImplCopyWith<_$SetOutstandingInvoiceStatusImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetValidationFailureImplCopyWith<$Res> {
  factory _$$SetValidationFailureImplCopyWith(_$SetValidationFailureImpl value,
          $Res Function(_$SetValidationFailureImpl) then) =
      __$$SetValidationFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SetValidationFailureImplCopyWithImpl<$Res>
    extends _$OutstandingInvoiceFilterEventCopyWithImpl<$Res,
        _$SetValidationFailureImpl>
    implements _$$SetValidationFailureImplCopyWith<$Res> {
  __$$SetValidationFailureImplCopyWithImpl(_$SetValidationFailureImpl _value,
      $Res Function(_$SetValidationFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SetValidationFailureImpl implements _SetValidationFailure {
  const _$SetValidationFailureImpl();

  @override
  String toString() {
    return 'OutstandingInvoiceFilterEvent.setValidationFailure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetValidationFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(OutstandingInvoiceFilter lastAppliedFilter)
        updateFilterToLastApplied,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(String amountFrom) setAmountFrom,
    required TResult Function(String amountTo) setAmountTo,
    required TResult Function(StatusType status, bool value)
        setOutstandingInvoiceStatus,
    required TResult Function() setValidationFailure,
    required TResult Function() resetFilters,
  }) {
    return setValidationFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(String amountFrom)? setAmountFrom,
    TResult? Function(String amountTo)? setAmountTo,
    TResult? Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult? Function()? setValidationFailure,
    TResult? Function()? resetFilters,
  }) {
    return setValidationFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(String amountFrom)? setAmountFrom,
    TResult Function(String amountTo)? setAmountTo,
    TResult Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult Function()? setValidationFailure,
    TResult Function()? resetFilters,
    required TResult orElse(),
  }) {
    if (setValidationFailure != null) {
      return setValidationFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_UpdateFiltersToLastApplied value)
        updateFilterToLastApplied,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetAmountFrom value) setAmountFrom,
    required TResult Function(_SetAmountTo value) setAmountTo,
    required TResult Function(_SetOutstandingInvoiceStatus value)
        setOutstandingInvoiceStatus,
    required TResult Function(_SetValidationFailure value) setValidationFailure,
    required TResult Function(_ResetFilters value) resetFilters,
  }) {
    return setValidationFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetAmountFrom value)? setAmountFrom,
    TResult? Function(_SetAmountTo value)? setAmountTo,
    TResult? Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult? Function(_SetValidationFailure value)? setValidationFailure,
    TResult? Function(_ResetFilters value)? resetFilters,
  }) {
    return setValidationFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetAmountFrom value)? setAmountFrom,
    TResult Function(_SetAmountTo value)? setAmountTo,
    TResult Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult Function(_SetValidationFailure value)? setValidationFailure,
    TResult Function(_ResetFilters value)? resetFilters,
    required TResult orElse(),
  }) {
    if (setValidationFailure != null) {
      return setValidationFailure(this);
    }
    return orElse();
  }
}

abstract class _SetValidationFailure implements OutstandingInvoiceFilterEvent {
  const factory _SetValidationFailure() = _$SetValidationFailureImpl;
}

/// @nodoc
abstract class _$$ResetFiltersImplCopyWith<$Res> {
  factory _$$ResetFiltersImplCopyWith(
          _$ResetFiltersImpl value, $Res Function(_$ResetFiltersImpl) then) =
      __$$ResetFiltersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetFiltersImplCopyWithImpl<$Res>
    extends _$OutstandingInvoiceFilterEventCopyWithImpl<$Res,
        _$ResetFiltersImpl> implements _$$ResetFiltersImplCopyWith<$Res> {
  __$$ResetFiltersImplCopyWithImpl(
      _$ResetFiltersImpl _value, $Res Function(_$ResetFiltersImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetFiltersImpl implements _ResetFilters {
  const _$ResetFiltersImpl();

  @override
  String toString() {
    return 'OutstandingInvoiceFilterEvent.resetFilters()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetFiltersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(OutstandingInvoiceFilter lastAppliedFilter)
        updateFilterToLastApplied,
    required TResult Function(DateTimeRange documentDateRange) setDocumentDate,
    required TResult Function(DateTimeRange dueDateRange) setDueDate,
    required TResult Function(String amountFrom) setAmountFrom,
    required TResult Function(String amountTo) setAmountTo,
    required TResult Function(StatusType status, bool value)
        setOutstandingInvoiceStatus,
    required TResult Function() setValidationFailure,
    required TResult Function() resetFilters,
  }) {
    return resetFilters();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult? Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult? Function(DateTimeRange dueDateRange)? setDueDate,
    TResult? Function(String amountFrom)? setAmountFrom,
    TResult? Function(String amountTo)? setAmountTo,
    TResult? Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult? Function()? setValidationFailure,
    TResult? Function()? resetFilters,
  }) {
    return resetFilters?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(OutstandingInvoiceFilter lastAppliedFilter)?
        updateFilterToLastApplied,
    TResult Function(DateTimeRange documentDateRange)? setDocumentDate,
    TResult Function(DateTimeRange dueDateRange)? setDueDate,
    TResult Function(String amountFrom)? setAmountFrom,
    TResult Function(String amountTo)? setAmountTo,
    TResult Function(StatusType status, bool value)?
        setOutstandingInvoiceStatus,
    TResult Function()? setValidationFailure,
    TResult Function()? resetFilters,
    required TResult orElse(),
  }) {
    if (resetFilters != null) {
      return resetFilters();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_UpdateFiltersToLastApplied value)
        updateFilterToLastApplied,
    required TResult Function(_SetDocumentDate value) setDocumentDate,
    required TResult Function(_SetDueDate value) setDueDate,
    required TResult Function(_SetAmountFrom value) setAmountFrom,
    required TResult Function(_SetAmountTo value) setAmountTo,
    required TResult Function(_SetOutstandingInvoiceStatus value)
        setOutstandingInvoiceStatus,
    required TResult Function(_SetValidationFailure value) setValidationFailure,
    required TResult Function(_ResetFilters value) resetFilters,
  }) {
    return resetFilters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult? Function(_SetDocumentDate value)? setDocumentDate,
    TResult? Function(_SetDueDate value)? setDueDate,
    TResult? Function(_SetAmountFrom value)? setAmountFrom,
    TResult? Function(_SetAmountTo value)? setAmountTo,
    TResult? Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult? Function(_SetValidationFailure value)? setValidationFailure,
    TResult? Function(_ResetFilters value)? resetFilters,
  }) {
    return resetFilters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_UpdateFiltersToLastApplied value)?
        updateFilterToLastApplied,
    TResult Function(_SetDocumentDate value)? setDocumentDate,
    TResult Function(_SetDueDate value)? setDueDate,
    TResult Function(_SetAmountFrom value)? setAmountFrom,
    TResult Function(_SetAmountTo value)? setAmountTo,
    TResult Function(_SetOutstandingInvoiceStatus value)?
        setOutstandingInvoiceStatus,
    TResult Function(_SetValidationFailure value)? setValidationFailure,
    TResult Function(_ResetFilters value)? resetFilters,
    required TResult orElse(),
  }) {
    if (resetFilters != null) {
      return resetFilters(this);
    }
    return orElse();
  }
}

abstract class _ResetFilters implements OutstandingInvoiceFilterEvent {
  const factory _ResetFilters() = _$ResetFiltersImpl;
}

/// @nodoc
mixin _$OutstandingInvoiceFilterState {
  OutstandingInvoiceFilter get filter => throw _privateConstructorUsedError;
  List<StatusType> get statusList => throw _privateConstructorUsedError;
  bool get showErrorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OutstandingInvoiceFilterStateCopyWith<OutstandingInvoiceFilterState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutstandingInvoiceFilterStateCopyWith<$Res> {
  factory $OutstandingInvoiceFilterStateCopyWith(
          OutstandingInvoiceFilterState value,
          $Res Function(OutstandingInvoiceFilterState) then) =
      _$OutstandingInvoiceFilterStateCopyWithImpl<$Res,
          OutstandingInvoiceFilterState>;
  @useResult
  $Res call(
      {OutstandingInvoiceFilter filter,
      List<StatusType> statusList,
      bool showErrorMessage});

  $OutstandingInvoiceFilterCopyWith<$Res> get filter;
}

/// @nodoc
class _$OutstandingInvoiceFilterStateCopyWithImpl<$Res,
        $Val extends OutstandingInvoiceFilterState>
    implements $OutstandingInvoiceFilterStateCopyWith<$Res> {
  _$OutstandingInvoiceFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
    Object? statusList = null,
    Object? showErrorMessage = null,
  }) {
    return _then(_value.copyWith(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as OutstandingInvoiceFilter,
      statusList: null == statusList
          ? _value.statusList
          : statusList // ignore: cast_nullable_to_non_nullable
              as List<StatusType>,
      showErrorMessage: null == showErrorMessage
          ? _value.showErrorMessage
          : showErrorMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OutstandingInvoiceFilterCopyWith<$Res> get filter {
    return $OutstandingInvoiceFilterCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OutstandingInvoiceFilterStateImplCopyWith<$Res>
    implements $OutstandingInvoiceFilterStateCopyWith<$Res> {
  factory _$$OutstandingInvoiceFilterStateImplCopyWith(
          _$OutstandingInvoiceFilterStateImpl value,
          $Res Function(_$OutstandingInvoiceFilterStateImpl) then) =
      __$$OutstandingInvoiceFilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {OutstandingInvoiceFilter filter,
      List<StatusType> statusList,
      bool showErrorMessage});

  @override
  $OutstandingInvoiceFilterCopyWith<$Res> get filter;
}

/// @nodoc
class __$$OutstandingInvoiceFilterStateImplCopyWithImpl<$Res>
    extends _$OutstandingInvoiceFilterStateCopyWithImpl<$Res,
        _$OutstandingInvoiceFilterStateImpl>
    implements _$$OutstandingInvoiceFilterStateImplCopyWith<$Res> {
  __$$OutstandingInvoiceFilterStateImplCopyWithImpl(
      _$OutstandingInvoiceFilterStateImpl _value,
      $Res Function(_$OutstandingInvoiceFilterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
    Object? statusList = null,
    Object? showErrorMessage = null,
  }) {
    return _then(_$OutstandingInvoiceFilterStateImpl(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as OutstandingInvoiceFilter,
      statusList: null == statusList
          ? _value._statusList
          : statusList // ignore: cast_nullable_to_non_nullable
              as List<StatusType>,
      showErrorMessage: null == showErrorMessage
          ? _value.showErrorMessage
          : showErrorMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$OutstandingInvoiceFilterStateImpl
    extends _OutstandingInvoiceFilterState {
  const _$OutstandingInvoiceFilterStateImpl(
      {required this.filter,
      required final List<StatusType> statusList,
      required this.showErrorMessage})
      : _statusList = statusList,
        super._();

  @override
  final OutstandingInvoiceFilter filter;
  final List<StatusType> _statusList;
  @override
  List<StatusType> get statusList {
    if (_statusList is EqualUnmodifiableListView) return _statusList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statusList);
  }

  @override
  final bool showErrorMessage;

  @override
  String toString() {
    return 'OutstandingInvoiceFilterState(filter: $filter, statusList: $statusList, showErrorMessage: $showErrorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutstandingInvoiceFilterStateImpl &&
            (identical(other.filter, filter) || other.filter == filter) &&
            const DeepCollectionEquality()
                .equals(other._statusList, _statusList) &&
            (identical(other.showErrorMessage, showErrorMessage) ||
                other.showErrorMessage == showErrorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter,
      const DeepCollectionEquality().hash(_statusList), showErrorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OutstandingInvoiceFilterStateImplCopyWith<
          _$OutstandingInvoiceFilterStateImpl>
      get copyWith => __$$OutstandingInvoiceFilterStateImplCopyWithImpl<
          _$OutstandingInvoiceFilterStateImpl>(this, _$identity);
}

abstract class _OutstandingInvoiceFilterState
    extends OutstandingInvoiceFilterState {
  const factory _OutstandingInvoiceFilterState(
          {required final OutstandingInvoiceFilter filter,
          required final List<StatusType> statusList,
          required final bool showErrorMessage}) =
      _$OutstandingInvoiceFilterStateImpl;
  const _OutstandingInvoiceFilterState._() : super._();

  @override
  OutstandingInvoiceFilter get filter;
  @override
  List<StatusType> get statusList;
  @override
  bool get showErrorMessage;
  @override
  @JsonKey(ignore: true)
  _$$OutstandingInvoiceFilterStateImplCopyWith<
          _$OutstandingInvoiceFilterStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

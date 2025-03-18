// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_override_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PriceOverrideEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PriceAggregate item) initialized,
    required TResult Function(String newPrice) onPriceValueChange,
    required TResult Function(String newValue) onDiscountValueChanged,
    required TResult Function(String newRemarks) onRemarksValueChange,
    required TResult Function() validateInputFields,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PriceAggregate item)? initialized,
    TResult? Function(String newPrice)? onPriceValueChange,
    TResult? Function(String newValue)? onDiscountValueChanged,
    TResult? Function(String newRemarks)? onRemarksValueChange,
    TResult? Function()? validateInputFields,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PriceAggregate item)? initialized,
    TResult Function(String newPrice)? onPriceValueChange,
    TResult Function(String newValue)? onDiscountValueChanged,
    TResult Function(String newRemarks)? onRemarksValueChange,
    TResult Function()? validateInputFields,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_OnPriceValueChange value) onPriceValueChange,
    required TResult Function(_OnDiscountValueChanged value)
        onDiscountValueChanged,
    required TResult Function(_OnRemarksValueChange value) onRemarksValueChange,
    required TResult Function(_ValidateInputFields value) validateInputFields,
    required TResult Function(_Fetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_OnPriceValueChange value)? onPriceValueChange,
    TResult? Function(_OnDiscountValueChanged value)? onDiscountValueChanged,
    TResult? Function(_OnRemarksValueChange value)? onRemarksValueChange,
    TResult? Function(_ValidateInputFields value)? validateInputFields,
    TResult? Function(_Fetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_OnPriceValueChange value)? onPriceValueChange,
    TResult Function(_OnDiscountValueChanged value)? onDiscountValueChanged,
    TResult Function(_OnRemarksValueChange value)? onRemarksValueChange,
    TResult Function(_ValidateInputFields value)? validateInputFields,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceOverrideEventCopyWith<$Res> {
  factory $PriceOverrideEventCopyWith(
          PriceOverrideEvent value, $Res Function(PriceOverrideEvent) then) =
      _$PriceOverrideEventCopyWithImpl<$Res, PriceOverrideEvent>;
}

/// @nodoc
class _$PriceOverrideEventCopyWithImpl<$Res, $Val extends PriceOverrideEvent>
    implements $PriceOverrideEventCopyWith<$Res> {
  _$PriceOverrideEventCopyWithImpl(this._value, this._then);

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
  $Res call({PriceAggregate item});

  $PriceAggregateCopyWith<$Res> get item;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$PriceOverrideEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$InitializedImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceAggregateCopyWith<$Res> get item {
    return $PriceAggregateCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl({required this.item});

  @override
  final PriceAggregate item;

  @override
  String toString() {
    return 'PriceOverrideEvent.initialized(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializedImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      __$$InitializedImplCopyWithImpl<_$InitializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PriceAggregate item) initialized,
    required TResult Function(String newPrice) onPriceValueChange,
    required TResult Function(String newValue) onDiscountValueChanged,
    required TResult Function(String newRemarks) onRemarksValueChange,
    required TResult Function() validateInputFields,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        fetch,
  }) {
    return initialized(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PriceAggregate item)? initialized,
    TResult? Function(String newPrice)? onPriceValueChange,
    TResult? Function(String newValue)? onDiscountValueChanged,
    TResult? Function(String newRemarks)? onRemarksValueChange,
    TResult? Function()? validateInputFields,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
  }) {
    return initialized?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PriceAggregate item)? initialized,
    TResult Function(String newPrice)? onPriceValueChange,
    TResult Function(String newValue)? onDiscountValueChanged,
    TResult Function(String newRemarks)? onRemarksValueChange,
    TResult Function()? validateInputFields,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_OnPriceValueChange value) onPriceValueChange,
    required TResult Function(_OnDiscountValueChanged value)
        onDiscountValueChanged,
    required TResult Function(_OnRemarksValueChange value) onRemarksValueChange,
    required TResult Function(_ValidateInputFields value) validateInputFields,
    required TResult Function(_Fetch value) fetch,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_OnPriceValueChange value)? onPriceValueChange,
    TResult? Function(_OnDiscountValueChanged value)? onDiscountValueChanged,
    TResult? Function(_OnRemarksValueChange value)? onRemarksValueChange,
    TResult? Function(_ValidateInputFields value)? validateInputFields,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_OnPriceValueChange value)? onPriceValueChange,
    TResult Function(_OnDiscountValueChanged value)? onDiscountValueChanged,
    TResult Function(_OnRemarksValueChange value)? onRemarksValueChange,
    TResult Function(_ValidateInputFields value)? validateInputFields,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements PriceOverrideEvent {
  const factory _Initialized({required final PriceAggregate item}) =
      _$InitializedImpl;

  PriceAggregate get item;
  @JsonKey(ignore: true)
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnPriceValueChangeImplCopyWith<$Res> {
  factory _$$OnPriceValueChangeImplCopyWith(_$OnPriceValueChangeImpl value,
          $Res Function(_$OnPriceValueChangeImpl) then) =
      __$$OnPriceValueChangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String newPrice});
}

/// @nodoc
class __$$OnPriceValueChangeImplCopyWithImpl<$Res>
    extends _$PriceOverrideEventCopyWithImpl<$Res, _$OnPriceValueChangeImpl>
    implements _$$OnPriceValueChangeImplCopyWith<$Res> {
  __$$OnPriceValueChangeImplCopyWithImpl(_$OnPriceValueChangeImpl _value,
      $Res Function(_$OnPriceValueChangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newPrice = null,
  }) {
    return _then(_$OnPriceValueChangeImpl(
      newPrice: null == newPrice
          ? _value.newPrice
          : newPrice // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnPriceValueChangeImpl implements _OnPriceValueChange {
  const _$OnPriceValueChangeImpl({required this.newPrice});

  @override
  final String newPrice;

  @override
  String toString() {
    return 'PriceOverrideEvent.onPriceValueChange(newPrice: $newPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnPriceValueChangeImpl &&
            (identical(other.newPrice, newPrice) ||
                other.newPrice == newPrice));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnPriceValueChangeImplCopyWith<_$OnPriceValueChangeImpl> get copyWith =>
      __$$OnPriceValueChangeImplCopyWithImpl<_$OnPriceValueChangeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PriceAggregate item) initialized,
    required TResult Function(String newPrice) onPriceValueChange,
    required TResult Function(String newValue) onDiscountValueChanged,
    required TResult Function(String newRemarks) onRemarksValueChange,
    required TResult Function() validateInputFields,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        fetch,
  }) {
    return onPriceValueChange(newPrice);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PriceAggregate item)? initialized,
    TResult? Function(String newPrice)? onPriceValueChange,
    TResult? Function(String newValue)? onDiscountValueChanged,
    TResult? Function(String newRemarks)? onRemarksValueChange,
    TResult? Function()? validateInputFields,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
  }) {
    return onPriceValueChange?.call(newPrice);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PriceAggregate item)? initialized,
    TResult Function(String newPrice)? onPriceValueChange,
    TResult Function(String newValue)? onDiscountValueChanged,
    TResult Function(String newRemarks)? onRemarksValueChange,
    TResult Function()? validateInputFields,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
    required TResult orElse(),
  }) {
    if (onPriceValueChange != null) {
      return onPriceValueChange(newPrice);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_OnPriceValueChange value) onPriceValueChange,
    required TResult Function(_OnDiscountValueChanged value)
        onDiscountValueChanged,
    required TResult Function(_OnRemarksValueChange value) onRemarksValueChange,
    required TResult Function(_ValidateInputFields value) validateInputFields,
    required TResult Function(_Fetch value) fetch,
  }) {
    return onPriceValueChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_OnPriceValueChange value)? onPriceValueChange,
    TResult? Function(_OnDiscountValueChanged value)? onDiscountValueChanged,
    TResult? Function(_OnRemarksValueChange value)? onRemarksValueChange,
    TResult? Function(_ValidateInputFields value)? validateInputFields,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return onPriceValueChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_OnPriceValueChange value)? onPriceValueChange,
    TResult Function(_OnDiscountValueChanged value)? onDiscountValueChanged,
    TResult Function(_OnRemarksValueChange value)? onRemarksValueChange,
    TResult Function(_ValidateInputFields value)? validateInputFields,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (onPriceValueChange != null) {
      return onPriceValueChange(this);
    }
    return orElse();
  }
}

abstract class _OnPriceValueChange implements PriceOverrideEvent {
  const factory _OnPriceValueChange({required final String newPrice}) =
      _$OnPriceValueChangeImpl;

  String get newPrice;
  @JsonKey(ignore: true)
  _$$OnPriceValueChangeImplCopyWith<_$OnPriceValueChangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnDiscountValueChangedImplCopyWith<$Res> {
  factory _$$OnDiscountValueChangedImplCopyWith(
          _$OnDiscountValueChangedImpl value,
          $Res Function(_$OnDiscountValueChangedImpl) then) =
      __$$OnDiscountValueChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String newValue});
}

/// @nodoc
class __$$OnDiscountValueChangedImplCopyWithImpl<$Res>
    extends _$PriceOverrideEventCopyWithImpl<$Res, _$OnDiscountValueChangedImpl>
    implements _$$OnDiscountValueChangedImplCopyWith<$Res> {
  __$$OnDiscountValueChangedImplCopyWithImpl(
      _$OnDiscountValueChangedImpl _value,
      $Res Function(_$OnDiscountValueChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newValue = null,
  }) {
    return _then(_$OnDiscountValueChangedImpl(
      newValue: null == newValue
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnDiscountValueChangedImpl implements _OnDiscountValueChanged {
  const _$OnDiscountValueChangedImpl({required this.newValue});

  @override
  final String newValue;

  @override
  String toString() {
    return 'PriceOverrideEvent.onDiscountValueChanged(newValue: $newValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnDiscountValueChangedImpl &&
            (identical(other.newValue, newValue) ||
                other.newValue == newValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnDiscountValueChangedImplCopyWith<_$OnDiscountValueChangedImpl>
      get copyWith => __$$OnDiscountValueChangedImplCopyWithImpl<
          _$OnDiscountValueChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PriceAggregate item) initialized,
    required TResult Function(String newPrice) onPriceValueChange,
    required TResult Function(String newValue) onDiscountValueChanged,
    required TResult Function(String newRemarks) onRemarksValueChange,
    required TResult Function() validateInputFields,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        fetch,
  }) {
    return onDiscountValueChanged(newValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PriceAggregate item)? initialized,
    TResult? Function(String newPrice)? onPriceValueChange,
    TResult? Function(String newValue)? onDiscountValueChanged,
    TResult? Function(String newRemarks)? onRemarksValueChange,
    TResult? Function()? validateInputFields,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
  }) {
    return onDiscountValueChanged?.call(newValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PriceAggregate item)? initialized,
    TResult Function(String newPrice)? onPriceValueChange,
    TResult Function(String newValue)? onDiscountValueChanged,
    TResult Function(String newRemarks)? onRemarksValueChange,
    TResult Function()? validateInputFields,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
    required TResult orElse(),
  }) {
    if (onDiscountValueChanged != null) {
      return onDiscountValueChanged(newValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_OnPriceValueChange value) onPriceValueChange,
    required TResult Function(_OnDiscountValueChanged value)
        onDiscountValueChanged,
    required TResult Function(_OnRemarksValueChange value) onRemarksValueChange,
    required TResult Function(_ValidateInputFields value) validateInputFields,
    required TResult Function(_Fetch value) fetch,
  }) {
    return onDiscountValueChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_OnPriceValueChange value)? onPriceValueChange,
    TResult? Function(_OnDiscountValueChanged value)? onDiscountValueChanged,
    TResult? Function(_OnRemarksValueChange value)? onRemarksValueChange,
    TResult? Function(_ValidateInputFields value)? validateInputFields,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return onDiscountValueChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_OnPriceValueChange value)? onPriceValueChange,
    TResult Function(_OnDiscountValueChanged value)? onDiscountValueChanged,
    TResult Function(_OnRemarksValueChange value)? onRemarksValueChange,
    TResult Function(_ValidateInputFields value)? validateInputFields,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (onDiscountValueChanged != null) {
      return onDiscountValueChanged(this);
    }
    return orElse();
  }
}

abstract class _OnDiscountValueChanged implements PriceOverrideEvent {
  const factory _OnDiscountValueChanged({required final String newValue}) =
      _$OnDiscountValueChangedImpl;

  String get newValue;
  @JsonKey(ignore: true)
  _$$OnDiscountValueChangedImplCopyWith<_$OnDiscountValueChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnRemarksValueChangeImplCopyWith<$Res> {
  factory _$$OnRemarksValueChangeImplCopyWith(_$OnRemarksValueChangeImpl value,
          $Res Function(_$OnRemarksValueChangeImpl) then) =
      __$$OnRemarksValueChangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String newRemarks});
}

/// @nodoc
class __$$OnRemarksValueChangeImplCopyWithImpl<$Res>
    extends _$PriceOverrideEventCopyWithImpl<$Res, _$OnRemarksValueChangeImpl>
    implements _$$OnRemarksValueChangeImplCopyWith<$Res> {
  __$$OnRemarksValueChangeImplCopyWithImpl(_$OnRemarksValueChangeImpl _value,
      $Res Function(_$OnRemarksValueChangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newRemarks = null,
  }) {
    return _then(_$OnRemarksValueChangeImpl(
      newRemarks: null == newRemarks
          ? _value.newRemarks
          : newRemarks // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnRemarksValueChangeImpl implements _OnRemarksValueChange {
  const _$OnRemarksValueChangeImpl({required this.newRemarks});

  @override
  final String newRemarks;

  @override
  String toString() {
    return 'PriceOverrideEvent.onRemarksValueChange(newRemarks: $newRemarks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnRemarksValueChangeImpl &&
            (identical(other.newRemarks, newRemarks) ||
                other.newRemarks == newRemarks));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newRemarks);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnRemarksValueChangeImplCopyWith<_$OnRemarksValueChangeImpl>
      get copyWith =>
          __$$OnRemarksValueChangeImplCopyWithImpl<_$OnRemarksValueChangeImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PriceAggregate item) initialized,
    required TResult Function(String newPrice) onPriceValueChange,
    required TResult Function(String newValue) onDiscountValueChanged,
    required TResult Function(String newRemarks) onRemarksValueChange,
    required TResult Function() validateInputFields,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        fetch,
  }) {
    return onRemarksValueChange(newRemarks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PriceAggregate item)? initialized,
    TResult? Function(String newPrice)? onPriceValueChange,
    TResult? Function(String newValue)? onDiscountValueChanged,
    TResult? Function(String newRemarks)? onRemarksValueChange,
    TResult? Function()? validateInputFields,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
  }) {
    return onRemarksValueChange?.call(newRemarks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PriceAggregate item)? initialized,
    TResult Function(String newPrice)? onPriceValueChange,
    TResult Function(String newValue)? onDiscountValueChanged,
    TResult Function(String newRemarks)? onRemarksValueChange,
    TResult Function()? validateInputFields,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
    required TResult orElse(),
  }) {
    if (onRemarksValueChange != null) {
      return onRemarksValueChange(newRemarks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_OnPriceValueChange value) onPriceValueChange,
    required TResult Function(_OnDiscountValueChanged value)
        onDiscountValueChanged,
    required TResult Function(_OnRemarksValueChange value) onRemarksValueChange,
    required TResult Function(_ValidateInputFields value) validateInputFields,
    required TResult Function(_Fetch value) fetch,
  }) {
    return onRemarksValueChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_OnPriceValueChange value)? onPriceValueChange,
    TResult? Function(_OnDiscountValueChanged value)? onDiscountValueChanged,
    TResult? Function(_OnRemarksValueChange value)? onRemarksValueChange,
    TResult? Function(_ValidateInputFields value)? validateInputFields,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return onRemarksValueChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_OnPriceValueChange value)? onPriceValueChange,
    TResult Function(_OnDiscountValueChanged value)? onDiscountValueChanged,
    TResult Function(_OnRemarksValueChange value)? onRemarksValueChange,
    TResult Function(_ValidateInputFields value)? validateInputFields,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (onRemarksValueChange != null) {
      return onRemarksValueChange(this);
    }
    return orElse();
  }
}

abstract class _OnRemarksValueChange implements PriceOverrideEvent {
  const factory _OnRemarksValueChange({required final String newRemarks}) =
      _$OnRemarksValueChangeImpl;

  String get newRemarks;
  @JsonKey(ignore: true)
  _$$OnRemarksValueChangeImplCopyWith<_$OnRemarksValueChangeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidateInputFieldsImplCopyWith<$Res> {
  factory _$$ValidateInputFieldsImplCopyWith(_$ValidateInputFieldsImpl value,
          $Res Function(_$ValidateInputFieldsImpl) then) =
      __$$ValidateInputFieldsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ValidateInputFieldsImplCopyWithImpl<$Res>
    extends _$PriceOverrideEventCopyWithImpl<$Res, _$ValidateInputFieldsImpl>
    implements _$$ValidateInputFieldsImplCopyWith<$Res> {
  __$$ValidateInputFieldsImplCopyWithImpl(_$ValidateInputFieldsImpl _value,
      $Res Function(_$ValidateInputFieldsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ValidateInputFieldsImpl implements _ValidateInputFields {
  const _$ValidateInputFieldsImpl();

  @override
  String toString() {
    return 'PriceOverrideEvent.validateInputFields()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidateInputFieldsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PriceAggregate item) initialized,
    required TResult Function(String newPrice) onPriceValueChange,
    required TResult Function(String newValue) onDiscountValueChanged,
    required TResult Function(String newRemarks) onRemarksValueChange,
    required TResult Function() validateInputFields,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        fetch,
  }) {
    return validateInputFields();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PriceAggregate item)? initialized,
    TResult? Function(String newPrice)? onPriceValueChange,
    TResult? Function(String newValue)? onDiscountValueChanged,
    TResult? Function(String newRemarks)? onRemarksValueChange,
    TResult? Function()? validateInputFields,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
  }) {
    return validateInputFields?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PriceAggregate item)? initialized,
    TResult Function(String newPrice)? onPriceValueChange,
    TResult Function(String newValue)? onDiscountValueChanged,
    TResult Function(String newRemarks)? onRemarksValueChange,
    TResult Function()? validateInputFields,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
    required TResult orElse(),
  }) {
    if (validateInputFields != null) {
      return validateInputFields();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_OnPriceValueChange value) onPriceValueChange,
    required TResult Function(_OnDiscountValueChanged value)
        onDiscountValueChanged,
    required TResult Function(_OnRemarksValueChange value) onRemarksValueChange,
    required TResult Function(_ValidateInputFields value) validateInputFields,
    required TResult Function(_Fetch value) fetch,
  }) {
    return validateInputFields(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_OnPriceValueChange value)? onPriceValueChange,
    TResult? Function(_OnDiscountValueChanged value)? onDiscountValueChanged,
    TResult? Function(_OnRemarksValueChange value)? onRemarksValueChange,
    TResult? Function(_ValidateInputFields value)? validateInputFields,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return validateInputFields?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_OnPriceValueChange value)? onPriceValueChange,
    TResult Function(_OnDiscountValueChanged value)? onDiscountValueChanged,
    TResult Function(_OnRemarksValueChange value)? onRemarksValueChange,
    TResult Function(_ValidateInputFields value)? validateInputFields,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (validateInputFields != null) {
      return validateInputFields(this);
    }
    return orElse();
  }
}

abstract class _ValidateInputFields implements PriceOverrideEvent {
  const factory _ValidateInputFields() = _$ValidateInputFieldsImpl;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation, CustomerCodeInfo customerCodeInfo});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$PriceOverrideEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
  }) {
    return _then(_$FetchImpl(
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

class _$FetchImpl implements _Fetch {
  const _$FetchImpl(
      {required this.salesOrganisation, required this.customerCodeInfo});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;

  @override
  String toString() {
    return 'PriceOverrideEvent.fetch(salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
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
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PriceAggregate item) initialized,
    required TResult Function(String newPrice) onPriceValueChange,
    required TResult Function(String newValue) onDiscountValueChanged,
    required TResult Function(String newRemarks) onRemarksValueChange,
    required TResult Function() validateInputFields,
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        fetch,
  }) {
    return fetch(salesOrganisation, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PriceAggregate item)? initialized,
    TResult? Function(String newPrice)? onPriceValueChange,
    TResult? Function(String newValue)? onDiscountValueChanged,
    TResult? Function(String newRemarks)? onRemarksValueChange,
    TResult? Function()? validateInputFields,
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
  }) {
    return fetch?.call(salesOrganisation, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PriceAggregate item)? initialized,
    TResult Function(String newPrice)? onPriceValueChange,
    TResult Function(String newValue)? onDiscountValueChanged,
    TResult Function(String newRemarks)? onRemarksValueChange,
    TResult Function()? validateInputFields,
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(salesOrganisation, customerCodeInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_OnPriceValueChange value) onPriceValueChange,
    required TResult Function(_OnDiscountValueChanged value)
        onDiscountValueChanged,
    required TResult Function(_OnRemarksValueChange value) onRemarksValueChange,
    required TResult Function(_ValidateInputFields value) validateInputFields,
    required TResult Function(_Fetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_OnPriceValueChange value)? onPriceValueChange,
    TResult? Function(_OnDiscountValueChanged value)? onDiscountValueChanged,
    TResult? Function(_OnRemarksValueChange value)? onRemarksValueChange,
    TResult? Function(_ValidateInputFields value)? validateInputFields,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_OnPriceValueChange value)? onPriceValueChange,
    TResult Function(_OnDiscountValueChanged value)? onDiscountValueChanged,
    TResult Function(_OnRemarksValueChange value)? onRemarksValueChange,
    TResult Function(_ValidateInputFields value)? validateInputFields,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements PriceOverrideEvent {
  const factory _Fetch(
      {required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo}) = _$FetchImpl;

  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  @JsonKey(ignore: true)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PriceOverrideState {
  PriceAggregate get item => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PriceOverrideStateCopyWith<PriceOverrideState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceOverrideStateCopyWith<$Res> {
  factory $PriceOverrideStateCopyWith(
          PriceOverrideState value, $Res Function(PriceOverrideState) then) =
      _$PriceOverrideStateCopyWithImpl<$Res, PriceOverrideState>;
  @useResult
  $Res call(
      {PriceAggregate item,
      bool isFetching,
      bool showErrorMessages,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});

  $PriceAggregateCopyWith<$Res> get item;
}

/// @nodoc
class _$PriceOverrideStateCopyWithImpl<$Res, $Val extends PriceOverrideState>
    implements $PriceOverrideStateCopyWith<$Res> {
  _$PriceOverrideStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? isFetching = null,
    Object? showErrorMessages = null,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceAggregateCopyWith<$Res> get item {
    return $PriceAggregateCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PriceOverrideStateImplCopyWith<$Res>
    implements $PriceOverrideStateCopyWith<$Res> {
  factory _$$PriceOverrideStateImplCopyWith(_$PriceOverrideStateImpl value,
          $Res Function(_$PriceOverrideStateImpl) then) =
      __$$PriceOverrideStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PriceAggregate item,
      bool isFetching,
      bool showErrorMessages,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});

  @override
  $PriceAggregateCopyWith<$Res> get item;
}

/// @nodoc
class __$$PriceOverrideStateImplCopyWithImpl<$Res>
    extends _$PriceOverrideStateCopyWithImpl<$Res, _$PriceOverrideStateImpl>
    implements _$$PriceOverrideStateImplCopyWith<$Res> {
  __$$PriceOverrideStateImplCopyWithImpl(_$PriceOverrideStateImpl _value,
      $Res Function(_$PriceOverrideStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? isFetching = null,
    Object? showErrorMessages = null,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_$PriceOverrideStateImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as PriceAggregate,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$PriceOverrideStateImpl extends _PriceOverrideState {
  const _$PriceOverrideStateImpl(
      {required this.item,
      required this.isFetching,
      required this.showErrorMessages,
      required this.apiFailureOrSuccessOption})
      : super._();

  @override
  final PriceAggregate item;
  @override
  final bool isFetching;
  @override
  final bool showErrorMessages;
  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;

  @override
  String toString() {
    return 'PriceOverrideState(item: $item, isFetching: $isFetching, showErrorMessages: $showErrorMessages, apiFailureOrSuccessOption: $apiFailureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceOverrideStateImpl &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item, isFetching,
      showErrorMessages, apiFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceOverrideStateImplCopyWith<_$PriceOverrideStateImpl> get copyWith =>
      __$$PriceOverrideStateImplCopyWithImpl<_$PriceOverrideStateImpl>(
          this, _$identity);
}

abstract class _PriceOverrideState extends PriceOverrideState {
  const factory _PriceOverrideState(
      {required final PriceAggregate item,
      required final bool isFetching,
      required final bool showErrorMessages,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption}) = _$PriceOverrideStateImpl;
  const _PriceOverrideState._() : super._();

  @override
  PriceAggregate get item;
  @override
  bool get isFetching;
  @override
  bool get showErrorMessages;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$PriceOverrideStateImplCopyWith<_$PriceOverrideStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

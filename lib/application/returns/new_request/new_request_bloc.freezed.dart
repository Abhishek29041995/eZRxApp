// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_request_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewRequestEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) initialized,
    required TResult Function(ReturnMaterial item, bool selected)
        toggleReturnItem,
    required TResult Function(ReturnMaterial item, bool included)
        toggleBonusItem,
    required TResult Function(ReturnItemDetails additionInfo)
        additionInfoChanged,
    required TResult Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)
        updateRequestCounterOffer,
    required TResult Function(
            String uuid, List<PoDocuments> files, bool included)
        toggleFiles,
    required TResult Function(int step) validateStep,
    required TResult Function(String returnReference) returnReferenceChanged,
    required TResult Function(String specialInstructions)
        specialInstructionsChanged,
    required TResult Function(CustomerCodeInfo customerCodeInfo, User user)
        submit,
    required TResult Function(ReturnType returnType, String assignmentNumber)
        updateSelectedReturnType,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? initialized,
    TResult? Function(ReturnMaterial item, bool selected)? toggleReturnItem,
    TResult? Function(ReturnMaterial item, bool included)? toggleBonusItem,
    TResult? Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult? Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)?
        updateRequestCounterOffer,
    TResult? Function(String uuid, List<PoDocuments> files, bool included)?
        toggleFiles,
    TResult? Function(int step)? validateStep,
    TResult? Function(String returnReference)? returnReferenceChanged,
    TResult? Function(String specialInstructions)? specialInstructionsChanged,
    TResult? Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    TResult? Function(ReturnType returnType, String assignmentNumber)?
        updateSelectedReturnType,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? initialized,
    TResult Function(ReturnMaterial item, bool selected)? toggleReturnItem,
    TResult Function(ReturnMaterial item, bool included)? toggleBonusItem,
    TResult Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)?
        updateRequestCounterOffer,
    TResult Function(String uuid, List<PoDocuments> files, bool included)?
        toggleFiles,
    TResult Function(int step)? validateStep,
    TResult Function(String returnReference)? returnReferenceChanged,
    TResult Function(String specialInstructions)? specialInstructionsChanged,
    TResult Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    TResult Function(ReturnType returnType, String assignmentNumber)?
        updateSelectedReturnType,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_ToggleReturnItem value) toggleReturnItem,
    required TResult Function(_ToggleBonusItem value) toggleBonusItem,
    required TResult Function(_AdditionInfoChanged value) additionInfoChanged,
    required TResult Function(_UpdateRequestCounterOffer value)
        updateRequestCounterOffer,
    required TResult Function(_ToggleFiles value) toggleFiles,
    required TResult Function(_ValidateStep value) validateStep,
    required TResult Function(_ReturnReferenceChanged value)
        returnReferenceChanged,
    required TResult Function(_SpecialInstructionsChanged value)
        specialInstructionsChanged,
    required TResult Function(_Submit value) submit,
    required TResult Function(_updateSelectedType value)
        updateSelectedReturnType,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult? Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult? Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult? Function(_UpdateRequestCounterOffer value)?
        updateRequestCounterOffer,
    TResult? Function(_ToggleFiles value)? toggleFiles,
    TResult? Function(_ValidateStep value)? validateStep,
    TResult? Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult? Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_updateSelectedType value)? updateSelectedReturnType,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult Function(_UpdateRequestCounterOffer value)?
        updateRequestCounterOffer,
    TResult Function(_ToggleFiles value)? toggleFiles,
    TResult Function(_ValidateStep value)? validateStep,
    TResult Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult Function(_Submit value)? submit,
    TResult Function(_updateSelectedType value)? updateSelectedReturnType,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewRequestEventCopyWith<$Res> {
  factory $NewRequestEventCopyWith(
          NewRequestEvent value, $Res Function(NewRequestEvent) then) =
      _$NewRequestEventCopyWithImpl<$Res, NewRequestEvent>;
}

/// @nodoc
class _$NewRequestEventCopyWithImpl<$Res, $Val extends NewRequestEvent>
    implements $NewRequestEventCopyWith<$Res> {
  _$NewRequestEventCopyWithImpl(this._value, this._then);

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
    extends _$NewRequestEventCopyWithImpl<$Res, _$InitializedImpl>
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
    return 'NewRequestEvent.initialized(salesOrg: $salesOrg)';
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
    required TResult Function(ReturnMaterial item, bool selected)
        toggleReturnItem,
    required TResult Function(ReturnMaterial item, bool included)
        toggleBonusItem,
    required TResult Function(ReturnItemDetails additionInfo)
        additionInfoChanged,
    required TResult Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)
        updateRequestCounterOffer,
    required TResult Function(
            String uuid, List<PoDocuments> files, bool included)
        toggleFiles,
    required TResult Function(int step) validateStep,
    required TResult Function(String returnReference) returnReferenceChanged,
    required TResult Function(String specialInstructions)
        specialInstructionsChanged,
    required TResult Function(CustomerCodeInfo customerCodeInfo, User user)
        submit,
    required TResult Function(ReturnType returnType, String assignmentNumber)
        updateSelectedReturnType,
  }) {
    return initialized(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? initialized,
    TResult? Function(ReturnMaterial item, bool selected)? toggleReturnItem,
    TResult? Function(ReturnMaterial item, bool included)? toggleBonusItem,
    TResult? Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult? Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)?
        updateRequestCounterOffer,
    TResult? Function(String uuid, List<PoDocuments> files, bool included)?
        toggleFiles,
    TResult? Function(int step)? validateStep,
    TResult? Function(String returnReference)? returnReferenceChanged,
    TResult? Function(String specialInstructions)? specialInstructionsChanged,
    TResult? Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    TResult? Function(ReturnType returnType, String assignmentNumber)?
        updateSelectedReturnType,
  }) {
    return initialized?.call(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? initialized,
    TResult Function(ReturnMaterial item, bool selected)? toggleReturnItem,
    TResult Function(ReturnMaterial item, bool included)? toggleBonusItem,
    TResult Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)?
        updateRequestCounterOffer,
    TResult Function(String uuid, List<PoDocuments> files, bool included)?
        toggleFiles,
    TResult Function(int step)? validateStep,
    TResult Function(String returnReference)? returnReferenceChanged,
    TResult Function(String specialInstructions)? specialInstructionsChanged,
    TResult Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    TResult Function(ReturnType returnType, String assignmentNumber)?
        updateSelectedReturnType,
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
    required TResult Function(_ToggleReturnItem value) toggleReturnItem,
    required TResult Function(_ToggleBonusItem value) toggleBonusItem,
    required TResult Function(_AdditionInfoChanged value) additionInfoChanged,
    required TResult Function(_UpdateRequestCounterOffer value)
        updateRequestCounterOffer,
    required TResult Function(_ToggleFiles value) toggleFiles,
    required TResult Function(_ValidateStep value) validateStep,
    required TResult Function(_ReturnReferenceChanged value)
        returnReferenceChanged,
    required TResult Function(_SpecialInstructionsChanged value)
        specialInstructionsChanged,
    required TResult Function(_Submit value) submit,
    required TResult Function(_updateSelectedType value)
        updateSelectedReturnType,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult? Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult? Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult? Function(_UpdateRequestCounterOffer value)?
        updateRequestCounterOffer,
    TResult? Function(_ToggleFiles value)? toggleFiles,
    TResult? Function(_ValidateStep value)? validateStep,
    TResult? Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult? Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_updateSelectedType value)? updateSelectedReturnType,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult Function(_UpdateRequestCounterOffer value)?
        updateRequestCounterOffer,
    TResult Function(_ToggleFiles value)? toggleFiles,
    TResult Function(_ValidateStep value)? validateStep,
    TResult Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult Function(_Submit value)? submit,
    TResult Function(_updateSelectedType value)? updateSelectedReturnType,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements NewRequestEvent {
  const factory _Initialized({required final SalesOrg salesOrg}) =
      _$InitializedImpl;

  SalesOrg get salesOrg;
  @JsonKey(ignore: true)
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleReturnItemImplCopyWith<$Res> {
  factory _$$ToggleReturnItemImplCopyWith(_$ToggleReturnItemImpl value,
          $Res Function(_$ToggleReturnItemImpl) then) =
      __$$ToggleReturnItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReturnMaterial item, bool selected});

  $ReturnMaterialCopyWith<$Res> get item;
}

/// @nodoc
class __$$ToggleReturnItemImplCopyWithImpl<$Res>
    extends _$NewRequestEventCopyWithImpl<$Res, _$ToggleReturnItemImpl>
    implements _$$ToggleReturnItemImplCopyWith<$Res> {
  __$$ToggleReturnItemImplCopyWithImpl(_$ToggleReturnItemImpl _value,
      $Res Function(_$ToggleReturnItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? selected = null,
  }) {
    return _then(_$ToggleReturnItemImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ReturnMaterial,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnMaterialCopyWith<$Res> get item {
    return $ReturnMaterialCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$ToggleReturnItemImpl implements _ToggleReturnItem {
  const _$ToggleReturnItemImpl({required this.item, required this.selected});

  @override
  final ReturnMaterial item;
  @override
  final bool selected;

  @override
  String toString() {
    return 'NewRequestEvent.toggleReturnItem(item: $item, selected: $selected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleReturnItemImpl &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item, selected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleReturnItemImplCopyWith<_$ToggleReturnItemImpl> get copyWith =>
      __$$ToggleReturnItemImplCopyWithImpl<_$ToggleReturnItemImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) initialized,
    required TResult Function(ReturnMaterial item, bool selected)
        toggleReturnItem,
    required TResult Function(ReturnMaterial item, bool included)
        toggleBonusItem,
    required TResult Function(ReturnItemDetails additionInfo)
        additionInfoChanged,
    required TResult Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)
        updateRequestCounterOffer,
    required TResult Function(
            String uuid, List<PoDocuments> files, bool included)
        toggleFiles,
    required TResult Function(int step) validateStep,
    required TResult Function(String returnReference) returnReferenceChanged,
    required TResult Function(String specialInstructions)
        specialInstructionsChanged,
    required TResult Function(CustomerCodeInfo customerCodeInfo, User user)
        submit,
    required TResult Function(ReturnType returnType, String assignmentNumber)
        updateSelectedReturnType,
  }) {
    return toggleReturnItem(item, selected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? initialized,
    TResult? Function(ReturnMaterial item, bool selected)? toggleReturnItem,
    TResult? Function(ReturnMaterial item, bool included)? toggleBonusItem,
    TResult? Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult? Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)?
        updateRequestCounterOffer,
    TResult? Function(String uuid, List<PoDocuments> files, bool included)?
        toggleFiles,
    TResult? Function(int step)? validateStep,
    TResult? Function(String returnReference)? returnReferenceChanged,
    TResult? Function(String specialInstructions)? specialInstructionsChanged,
    TResult? Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    TResult? Function(ReturnType returnType, String assignmentNumber)?
        updateSelectedReturnType,
  }) {
    return toggleReturnItem?.call(item, selected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? initialized,
    TResult Function(ReturnMaterial item, bool selected)? toggleReturnItem,
    TResult Function(ReturnMaterial item, bool included)? toggleBonusItem,
    TResult Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)?
        updateRequestCounterOffer,
    TResult Function(String uuid, List<PoDocuments> files, bool included)?
        toggleFiles,
    TResult Function(int step)? validateStep,
    TResult Function(String returnReference)? returnReferenceChanged,
    TResult Function(String specialInstructions)? specialInstructionsChanged,
    TResult Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    TResult Function(ReturnType returnType, String assignmentNumber)?
        updateSelectedReturnType,
    required TResult orElse(),
  }) {
    if (toggleReturnItem != null) {
      return toggleReturnItem(item, selected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_ToggleReturnItem value) toggleReturnItem,
    required TResult Function(_ToggleBonusItem value) toggleBonusItem,
    required TResult Function(_AdditionInfoChanged value) additionInfoChanged,
    required TResult Function(_UpdateRequestCounterOffer value)
        updateRequestCounterOffer,
    required TResult Function(_ToggleFiles value) toggleFiles,
    required TResult Function(_ValidateStep value) validateStep,
    required TResult Function(_ReturnReferenceChanged value)
        returnReferenceChanged,
    required TResult Function(_SpecialInstructionsChanged value)
        specialInstructionsChanged,
    required TResult Function(_Submit value) submit,
    required TResult Function(_updateSelectedType value)
        updateSelectedReturnType,
  }) {
    return toggleReturnItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult? Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult? Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult? Function(_UpdateRequestCounterOffer value)?
        updateRequestCounterOffer,
    TResult? Function(_ToggleFiles value)? toggleFiles,
    TResult? Function(_ValidateStep value)? validateStep,
    TResult? Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult? Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_updateSelectedType value)? updateSelectedReturnType,
  }) {
    return toggleReturnItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult Function(_UpdateRequestCounterOffer value)?
        updateRequestCounterOffer,
    TResult Function(_ToggleFiles value)? toggleFiles,
    TResult Function(_ValidateStep value)? validateStep,
    TResult Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult Function(_Submit value)? submit,
    TResult Function(_updateSelectedType value)? updateSelectedReturnType,
    required TResult orElse(),
  }) {
    if (toggleReturnItem != null) {
      return toggleReturnItem(this);
    }
    return orElse();
  }
}

abstract class _ToggleReturnItem implements NewRequestEvent {
  const factory _ToggleReturnItem(
      {required final ReturnMaterial item,
      required final bool selected}) = _$ToggleReturnItemImpl;

  ReturnMaterial get item;
  bool get selected;
  @JsonKey(ignore: true)
  _$$ToggleReturnItemImplCopyWith<_$ToggleReturnItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleBonusItemImplCopyWith<$Res> {
  factory _$$ToggleBonusItemImplCopyWith(_$ToggleBonusItemImpl value,
          $Res Function(_$ToggleBonusItemImpl) then) =
      __$$ToggleBonusItemImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReturnMaterial item, bool included});

  $ReturnMaterialCopyWith<$Res> get item;
}

/// @nodoc
class __$$ToggleBonusItemImplCopyWithImpl<$Res>
    extends _$NewRequestEventCopyWithImpl<$Res, _$ToggleBonusItemImpl>
    implements _$$ToggleBonusItemImplCopyWith<$Res> {
  __$$ToggleBonusItemImplCopyWithImpl(
      _$ToggleBonusItemImpl _value, $Res Function(_$ToggleBonusItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? included = null,
  }) {
    return _then(_$ToggleBonusItemImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ReturnMaterial,
      included: null == included
          ? _value.included
          : included // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnMaterialCopyWith<$Res> get item {
    return $ReturnMaterialCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$ToggleBonusItemImpl implements _ToggleBonusItem {
  const _$ToggleBonusItemImpl({required this.item, required this.included});

  @override
  final ReturnMaterial item;
  @override
  final bool included;

  @override
  String toString() {
    return 'NewRequestEvent.toggleBonusItem(item: $item, included: $included)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleBonusItemImpl &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.included, included) ||
                other.included == included));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item, included);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleBonusItemImplCopyWith<_$ToggleBonusItemImpl> get copyWith =>
      __$$ToggleBonusItemImplCopyWithImpl<_$ToggleBonusItemImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) initialized,
    required TResult Function(ReturnMaterial item, bool selected)
        toggleReturnItem,
    required TResult Function(ReturnMaterial item, bool included)
        toggleBonusItem,
    required TResult Function(ReturnItemDetails additionInfo)
        additionInfoChanged,
    required TResult Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)
        updateRequestCounterOffer,
    required TResult Function(
            String uuid, List<PoDocuments> files, bool included)
        toggleFiles,
    required TResult Function(int step) validateStep,
    required TResult Function(String returnReference) returnReferenceChanged,
    required TResult Function(String specialInstructions)
        specialInstructionsChanged,
    required TResult Function(CustomerCodeInfo customerCodeInfo, User user)
        submit,
    required TResult Function(ReturnType returnType, String assignmentNumber)
        updateSelectedReturnType,
  }) {
    return toggleBonusItem(item, included);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? initialized,
    TResult? Function(ReturnMaterial item, bool selected)? toggleReturnItem,
    TResult? Function(ReturnMaterial item, bool included)? toggleBonusItem,
    TResult? Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult? Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)?
        updateRequestCounterOffer,
    TResult? Function(String uuid, List<PoDocuments> files, bool included)?
        toggleFiles,
    TResult? Function(int step)? validateStep,
    TResult? Function(String returnReference)? returnReferenceChanged,
    TResult? Function(String specialInstructions)? specialInstructionsChanged,
    TResult? Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    TResult? Function(ReturnType returnType, String assignmentNumber)?
        updateSelectedReturnType,
  }) {
    return toggleBonusItem?.call(item, included);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? initialized,
    TResult Function(ReturnMaterial item, bool selected)? toggleReturnItem,
    TResult Function(ReturnMaterial item, bool included)? toggleBonusItem,
    TResult Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)?
        updateRequestCounterOffer,
    TResult Function(String uuid, List<PoDocuments> files, bool included)?
        toggleFiles,
    TResult Function(int step)? validateStep,
    TResult Function(String returnReference)? returnReferenceChanged,
    TResult Function(String specialInstructions)? specialInstructionsChanged,
    TResult Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    TResult Function(ReturnType returnType, String assignmentNumber)?
        updateSelectedReturnType,
    required TResult orElse(),
  }) {
    if (toggleBonusItem != null) {
      return toggleBonusItem(item, included);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_ToggleReturnItem value) toggleReturnItem,
    required TResult Function(_ToggleBonusItem value) toggleBonusItem,
    required TResult Function(_AdditionInfoChanged value) additionInfoChanged,
    required TResult Function(_UpdateRequestCounterOffer value)
        updateRequestCounterOffer,
    required TResult Function(_ToggleFiles value) toggleFiles,
    required TResult Function(_ValidateStep value) validateStep,
    required TResult Function(_ReturnReferenceChanged value)
        returnReferenceChanged,
    required TResult Function(_SpecialInstructionsChanged value)
        specialInstructionsChanged,
    required TResult Function(_Submit value) submit,
    required TResult Function(_updateSelectedType value)
        updateSelectedReturnType,
  }) {
    return toggleBonusItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult? Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult? Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult? Function(_UpdateRequestCounterOffer value)?
        updateRequestCounterOffer,
    TResult? Function(_ToggleFiles value)? toggleFiles,
    TResult? Function(_ValidateStep value)? validateStep,
    TResult? Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult? Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_updateSelectedType value)? updateSelectedReturnType,
  }) {
    return toggleBonusItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult Function(_UpdateRequestCounterOffer value)?
        updateRequestCounterOffer,
    TResult Function(_ToggleFiles value)? toggleFiles,
    TResult Function(_ValidateStep value)? validateStep,
    TResult Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult Function(_Submit value)? submit,
    TResult Function(_updateSelectedType value)? updateSelectedReturnType,
    required TResult orElse(),
  }) {
    if (toggleBonusItem != null) {
      return toggleBonusItem(this);
    }
    return orElse();
  }
}

abstract class _ToggleBonusItem implements NewRequestEvent {
  const factory _ToggleBonusItem(
      {required final ReturnMaterial item,
      required final bool included}) = _$ToggleBonusItemImpl;

  ReturnMaterial get item;
  bool get included;
  @JsonKey(ignore: true)
  _$$ToggleBonusItemImplCopyWith<_$ToggleBonusItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AdditionInfoChangedImplCopyWith<$Res> {
  factory _$$AdditionInfoChangedImplCopyWith(_$AdditionInfoChangedImpl value,
          $Res Function(_$AdditionInfoChangedImpl) then) =
      __$$AdditionInfoChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReturnItemDetails additionInfo});

  $ReturnItemDetailsCopyWith<$Res> get additionInfo;
}

/// @nodoc
class __$$AdditionInfoChangedImplCopyWithImpl<$Res>
    extends _$NewRequestEventCopyWithImpl<$Res, _$AdditionInfoChangedImpl>
    implements _$$AdditionInfoChangedImplCopyWith<$Res> {
  __$$AdditionInfoChangedImplCopyWithImpl(_$AdditionInfoChangedImpl _value,
      $Res Function(_$AdditionInfoChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? additionInfo = null,
  }) {
    return _then(_$AdditionInfoChangedImpl(
      additionInfo: null == additionInfo
          ? _value.additionInfo
          : additionInfo // ignore: cast_nullable_to_non_nullable
              as ReturnItemDetails,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnItemDetailsCopyWith<$Res> get additionInfo {
    return $ReturnItemDetailsCopyWith<$Res>(_value.additionInfo, (value) {
      return _then(_value.copyWith(additionInfo: value));
    });
  }
}

/// @nodoc

class _$AdditionInfoChangedImpl implements _AdditionInfoChanged {
  const _$AdditionInfoChangedImpl({required this.additionInfo});

  @override
  final ReturnItemDetails additionInfo;

  @override
  String toString() {
    return 'NewRequestEvent.additionInfoChanged(additionInfo: $additionInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdditionInfoChangedImpl &&
            (identical(other.additionInfo, additionInfo) ||
                other.additionInfo == additionInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, additionInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdditionInfoChangedImplCopyWith<_$AdditionInfoChangedImpl> get copyWith =>
      __$$AdditionInfoChangedImplCopyWithImpl<_$AdditionInfoChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) initialized,
    required TResult Function(ReturnMaterial item, bool selected)
        toggleReturnItem,
    required TResult Function(ReturnMaterial item, bool included)
        toggleBonusItem,
    required TResult Function(ReturnItemDetails additionInfo)
        additionInfoChanged,
    required TResult Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)
        updateRequestCounterOffer,
    required TResult Function(
            String uuid, List<PoDocuments> files, bool included)
        toggleFiles,
    required TResult Function(int step) validateStep,
    required TResult Function(String returnReference) returnReferenceChanged,
    required TResult Function(String specialInstructions)
        specialInstructionsChanged,
    required TResult Function(CustomerCodeInfo customerCodeInfo, User user)
        submit,
    required TResult Function(ReturnType returnType, String assignmentNumber)
        updateSelectedReturnType,
  }) {
    return additionInfoChanged(additionInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? initialized,
    TResult? Function(ReturnMaterial item, bool selected)? toggleReturnItem,
    TResult? Function(ReturnMaterial item, bool included)? toggleBonusItem,
    TResult? Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult? Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)?
        updateRequestCounterOffer,
    TResult? Function(String uuid, List<PoDocuments> files, bool included)?
        toggleFiles,
    TResult? Function(int step)? validateStep,
    TResult? Function(String returnReference)? returnReferenceChanged,
    TResult? Function(String specialInstructions)? specialInstructionsChanged,
    TResult? Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    TResult? Function(ReturnType returnType, String assignmentNumber)?
        updateSelectedReturnType,
  }) {
    return additionInfoChanged?.call(additionInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? initialized,
    TResult Function(ReturnMaterial item, bool selected)? toggleReturnItem,
    TResult Function(ReturnMaterial item, bool included)? toggleBonusItem,
    TResult Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)?
        updateRequestCounterOffer,
    TResult Function(String uuid, List<PoDocuments> files, bool included)?
        toggleFiles,
    TResult Function(int step)? validateStep,
    TResult Function(String returnReference)? returnReferenceChanged,
    TResult Function(String specialInstructions)? specialInstructionsChanged,
    TResult Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    TResult Function(ReturnType returnType, String assignmentNumber)?
        updateSelectedReturnType,
    required TResult orElse(),
  }) {
    if (additionInfoChanged != null) {
      return additionInfoChanged(additionInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_ToggleReturnItem value) toggleReturnItem,
    required TResult Function(_ToggleBonusItem value) toggleBonusItem,
    required TResult Function(_AdditionInfoChanged value) additionInfoChanged,
    required TResult Function(_UpdateRequestCounterOffer value)
        updateRequestCounterOffer,
    required TResult Function(_ToggleFiles value) toggleFiles,
    required TResult Function(_ValidateStep value) validateStep,
    required TResult Function(_ReturnReferenceChanged value)
        returnReferenceChanged,
    required TResult Function(_SpecialInstructionsChanged value)
        specialInstructionsChanged,
    required TResult Function(_Submit value) submit,
    required TResult Function(_updateSelectedType value)
        updateSelectedReturnType,
  }) {
    return additionInfoChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult? Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult? Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult? Function(_UpdateRequestCounterOffer value)?
        updateRequestCounterOffer,
    TResult? Function(_ToggleFiles value)? toggleFiles,
    TResult? Function(_ValidateStep value)? validateStep,
    TResult? Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult? Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_updateSelectedType value)? updateSelectedReturnType,
  }) {
    return additionInfoChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult Function(_UpdateRequestCounterOffer value)?
        updateRequestCounterOffer,
    TResult Function(_ToggleFiles value)? toggleFiles,
    TResult Function(_ValidateStep value)? validateStep,
    TResult Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult Function(_Submit value)? submit,
    TResult Function(_updateSelectedType value)? updateSelectedReturnType,
    required TResult orElse(),
  }) {
    if (additionInfoChanged != null) {
      return additionInfoChanged(this);
    }
    return orElse();
  }
}

abstract class _AdditionInfoChanged implements NewRequestEvent {
  const factory _AdditionInfoChanged(
          {required final ReturnItemDetails additionInfo}) =
      _$AdditionInfoChangedImpl;

  ReturnItemDetails get additionInfo;
  @JsonKey(ignore: true)
  _$$AdditionInfoChangedImplCopyWith<_$AdditionInfoChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateRequestCounterOfferImplCopyWith<$Res> {
  factory _$$UpdateRequestCounterOfferImplCopyWith(
          _$UpdateRequestCounterOfferImpl value,
          $Res Function(_$UpdateRequestCounterOfferImpl) then) =
      __$$UpdateRequestCounterOfferImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {CounterOfferValue counterOfferValue,
      String uuid,
      bool isChangeMaterialCounterOffer});
}

/// @nodoc
class __$$UpdateRequestCounterOfferImplCopyWithImpl<$Res>
    extends _$NewRequestEventCopyWithImpl<$Res, _$UpdateRequestCounterOfferImpl>
    implements _$$UpdateRequestCounterOfferImplCopyWith<$Res> {
  __$$UpdateRequestCounterOfferImplCopyWithImpl(
      _$UpdateRequestCounterOfferImpl _value,
      $Res Function(_$UpdateRequestCounterOfferImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counterOfferValue = null,
    Object? uuid = null,
    Object? isChangeMaterialCounterOffer = null,
  }) {
    return _then(_$UpdateRequestCounterOfferImpl(
      counterOfferValue: null == counterOfferValue
          ? _value.counterOfferValue
          : counterOfferValue // ignore: cast_nullable_to_non_nullable
              as CounterOfferValue,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      isChangeMaterialCounterOffer: null == isChangeMaterialCounterOffer
          ? _value.isChangeMaterialCounterOffer
          : isChangeMaterialCounterOffer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UpdateRequestCounterOfferImpl implements _UpdateRequestCounterOffer {
  const _$UpdateRequestCounterOfferImpl(
      {required this.counterOfferValue,
      required this.uuid,
      required this.isChangeMaterialCounterOffer});

  @override
  final CounterOfferValue counterOfferValue;
  @override
  final String uuid;
  @override
  final bool isChangeMaterialCounterOffer;

  @override
  String toString() {
    return 'NewRequestEvent.updateRequestCounterOffer(counterOfferValue: $counterOfferValue, uuid: $uuid, isChangeMaterialCounterOffer: $isChangeMaterialCounterOffer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateRequestCounterOfferImpl &&
            (identical(other.counterOfferValue, counterOfferValue) ||
                other.counterOfferValue == counterOfferValue) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.isChangeMaterialCounterOffer,
                    isChangeMaterialCounterOffer) ||
                other.isChangeMaterialCounterOffer ==
                    isChangeMaterialCounterOffer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, counterOfferValue, uuid, isChangeMaterialCounterOffer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateRequestCounterOfferImplCopyWith<_$UpdateRequestCounterOfferImpl>
      get copyWith => __$$UpdateRequestCounterOfferImplCopyWithImpl<
          _$UpdateRequestCounterOfferImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) initialized,
    required TResult Function(ReturnMaterial item, bool selected)
        toggleReturnItem,
    required TResult Function(ReturnMaterial item, bool included)
        toggleBonusItem,
    required TResult Function(ReturnItemDetails additionInfo)
        additionInfoChanged,
    required TResult Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)
        updateRequestCounterOffer,
    required TResult Function(
            String uuid, List<PoDocuments> files, bool included)
        toggleFiles,
    required TResult Function(int step) validateStep,
    required TResult Function(String returnReference) returnReferenceChanged,
    required TResult Function(String specialInstructions)
        specialInstructionsChanged,
    required TResult Function(CustomerCodeInfo customerCodeInfo, User user)
        submit,
    required TResult Function(ReturnType returnType, String assignmentNumber)
        updateSelectedReturnType,
  }) {
    return updateRequestCounterOffer(
        counterOfferValue, uuid, isChangeMaterialCounterOffer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? initialized,
    TResult? Function(ReturnMaterial item, bool selected)? toggleReturnItem,
    TResult? Function(ReturnMaterial item, bool included)? toggleBonusItem,
    TResult? Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult? Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)?
        updateRequestCounterOffer,
    TResult? Function(String uuid, List<PoDocuments> files, bool included)?
        toggleFiles,
    TResult? Function(int step)? validateStep,
    TResult? Function(String returnReference)? returnReferenceChanged,
    TResult? Function(String specialInstructions)? specialInstructionsChanged,
    TResult? Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    TResult? Function(ReturnType returnType, String assignmentNumber)?
        updateSelectedReturnType,
  }) {
    return updateRequestCounterOffer?.call(
        counterOfferValue, uuid, isChangeMaterialCounterOffer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? initialized,
    TResult Function(ReturnMaterial item, bool selected)? toggleReturnItem,
    TResult Function(ReturnMaterial item, bool included)? toggleBonusItem,
    TResult Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)?
        updateRequestCounterOffer,
    TResult Function(String uuid, List<PoDocuments> files, bool included)?
        toggleFiles,
    TResult Function(int step)? validateStep,
    TResult Function(String returnReference)? returnReferenceChanged,
    TResult Function(String specialInstructions)? specialInstructionsChanged,
    TResult Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    TResult Function(ReturnType returnType, String assignmentNumber)?
        updateSelectedReturnType,
    required TResult orElse(),
  }) {
    if (updateRequestCounterOffer != null) {
      return updateRequestCounterOffer(
          counterOfferValue, uuid, isChangeMaterialCounterOffer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_ToggleReturnItem value) toggleReturnItem,
    required TResult Function(_ToggleBonusItem value) toggleBonusItem,
    required TResult Function(_AdditionInfoChanged value) additionInfoChanged,
    required TResult Function(_UpdateRequestCounterOffer value)
        updateRequestCounterOffer,
    required TResult Function(_ToggleFiles value) toggleFiles,
    required TResult Function(_ValidateStep value) validateStep,
    required TResult Function(_ReturnReferenceChanged value)
        returnReferenceChanged,
    required TResult Function(_SpecialInstructionsChanged value)
        specialInstructionsChanged,
    required TResult Function(_Submit value) submit,
    required TResult Function(_updateSelectedType value)
        updateSelectedReturnType,
  }) {
    return updateRequestCounterOffer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult? Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult? Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult? Function(_UpdateRequestCounterOffer value)?
        updateRequestCounterOffer,
    TResult? Function(_ToggleFiles value)? toggleFiles,
    TResult? Function(_ValidateStep value)? validateStep,
    TResult? Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult? Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_updateSelectedType value)? updateSelectedReturnType,
  }) {
    return updateRequestCounterOffer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult Function(_UpdateRequestCounterOffer value)?
        updateRequestCounterOffer,
    TResult Function(_ToggleFiles value)? toggleFiles,
    TResult Function(_ValidateStep value)? validateStep,
    TResult Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult Function(_Submit value)? submit,
    TResult Function(_updateSelectedType value)? updateSelectedReturnType,
    required TResult orElse(),
  }) {
    if (updateRequestCounterOffer != null) {
      return updateRequestCounterOffer(this);
    }
    return orElse();
  }
}

abstract class _UpdateRequestCounterOffer implements NewRequestEvent {
  const factory _UpdateRequestCounterOffer(
          {required final CounterOfferValue counterOfferValue,
          required final String uuid,
          required final bool isChangeMaterialCounterOffer}) =
      _$UpdateRequestCounterOfferImpl;

  CounterOfferValue get counterOfferValue;
  String get uuid;
  bool get isChangeMaterialCounterOffer;
  @JsonKey(ignore: true)
  _$$UpdateRequestCounterOfferImplCopyWith<_$UpdateRequestCounterOfferImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleFilesImplCopyWith<$Res> {
  factory _$$ToggleFilesImplCopyWith(
          _$ToggleFilesImpl value, $Res Function(_$ToggleFilesImpl) then) =
      __$$ToggleFilesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String uuid, List<PoDocuments> files, bool included});
}

/// @nodoc
class __$$ToggleFilesImplCopyWithImpl<$Res>
    extends _$NewRequestEventCopyWithImpl<$Res, _$ToggleFilesImpl>
    implements _$$ToggleFilesImplCopyWith<$Res> {
  __$$ToggleFilesImplCopyWithImpl(
      _$ToggleFilesImpl _value, $Res Function(_$ToggleFilesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? files = null,
    Object? included = null,
  }) {
    return _then(_$ToggleFilesImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<PoDocuments>,
      included: null == included
          ? _value.included
          : included // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ToggleFilesImpl implements _ToggleFiles {
  const _$ToggleFilesImpl(
      {required this.uuid,
      required final List<PoDocuments> files,
      required this.included})
      : _files = files;

  @override
  final String uuid;
  final List<PoDocuments> _files;
  @override
  List<PoDocuments> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  final bool included;

  @override
  String toString() {
    return 'NewRequestEvent.toggleFiles(uuid: $uuid, files: $files, included: $included)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleFilesImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.included, included) ||
                other.included == included));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, uuid, const DeepCollectionEquality().hash(_files), included);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleFilesImplCopyWith<_$ToggleFilesImpl> get copyWith =>
      __$$ToggleFilesImplCopyWithImpl<_$ToggleFilesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) initialized,
    required TResult Function(ReturnMaterial item, bool selected)
        toggleReturnItem,
    required TResult Function(ReturnMaterial item, bool included)
        toggleBonusItem,
    required TResult Function(ReturnItemDetails additionInfo)
        additionInfoChanged,
    required TResult Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)
        updateRequestCounterOffer,
    required TResult Function(
            String uuid, List<PoDocuments> files, bool included)
        toggleFiles,
    required TResult Function(int step) validateStep,
    required TResult Function(String returnReference) returnReferenceChanged,
    required TResult Function(String specialInstructions)
        specialInstructionsChanged,
    required TResult Function(CustomerCodeInfo customerCodeInfo, User user)
        submit,
    required TResult Function(ReturnType returnType, String assignmentNumber)
        updateSelectedReturnType,
  }) {
    return toggleFiles(uuid, files, included);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? initialized,
    TResult? Function(ReturnMaterial item, bool selected)? toggleReturnItem,
    TResult? Function(ReturnMaterial item, bool included)? toggleBonusItem,
    TResult? Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult? Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)?
        updateRequestCounterOffer,
    TResult? Function(String uuid, List<PoDocuments> files, bool included)?
        toggleFiles,
    TResult? Function(int step)? validateStep,
    TResult? Function(String returnReference)? returnReferenceChanged,
    TResult? Function(String specialInstructions)? specialInstructionsChanged,
    TResult? Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    TResult? Function(ReturnType returnType, String assignmentNumber)?
        updateSelectedReturnType,
  }) {
    return toggleFiles?.call(uuid, files, included);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? initialized,
    TResult Function(ReturnMaterial item, bool selected)? toggleReturnItem,
    TResult Function(ReturnMaterial item, bool included)? toggleBonusItem,
    TResult Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)?
        updateRequestCounterOffer,
    TResult Function(String uuid, List<PoDocuments> files, bool included)?
        toggleFiles,
    TResult Function(int step)? validateStep,
    TResult Function(String returnReference)? returnReferenceChanged,
    TResult Function(String specialInstructions)? specialInstructionsChanged,
    TResult Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    TResult Function(ReturnType returnType, String assignmentNumber)?
        updateSelectedReturnType,
    required TResult orElse(),
  }) {
    if (toggleFiles != null) {
      return toggleFiles(uuid, files, included);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_ToggleReturnItem value) toggleReturnItem,
    required TResult Function(_ToggleBonusItem value) toggleBonusItem,
    required TResult Function(_AdditionInfoChanged value) additionInfoChanged,
    required TResult Function(_UpdateRequestCounterOffer value)
        updateRequestCounterOffer,
    required TResult Function(_ToggleFiles value) toggleFiles,
    required TResult Function(_ValidateStep value) validateStep,
    required TResult Function(_ReturnReferenceChanged value)
        returnReferenceChanged,
    required TResult Function(_SpecialInstructionsChanged value)
        specialInstructionsChanged,
    required TResult Function(_Submit value) submit,
    required TResult Function(_updateSelectedType value)
        updateSelectedReturnType,
  }) {
    return toggleFiles(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult? Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult? Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult? Function(_UpdateRequestCounterOffer value)?
        updateRequestCounterOffer,
    TResult? Function(_ToggleFiles value)? toggleFiles,
    TResult? Function(_ValidateStep value)? validateStep,
    TResult? Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult? Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_updateSelectedType value)? updateSelectedReturnType,
  }) {
    return toggleFiles?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult Function(_UpdateRequestCounterOffer value)?
        updateRequestCounterOffer,
    TResult Function(_ToggleFiles value)? toggleFiles,
    TResult Function(_ValidateStep value)? validateStep,
    TResult Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult Function(_Submit value)? submit,
    TResult Function(_updateSelectedType value)? updateSelectedReturnType,
    required TResult orElse(),
  }) {
    if (toggleFiles != null) {
      return toggleFiles(this);
    }
    return orElse();
  }
}

abstract class _ToggleFiles implements NewRequestEvent {
  const factory _ToggleFiles(
      {required final String uuid,
      required final List<PoDocuments> files,
      required final bool included}) = _$ToggleFilesImpl;

  String get uuid;
  List<PoDocuments> get files;
  bool get included;
  @JsonKey(ignore: true)
  _$$ToggleFilesImplCopyWith<_$ToggleFilesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidateStepImplCopyWith<$Res> {
  factory _$$ValidateStepImplCopyWith(
          _$ValidateStepImpl value, $Res Function(_$ValidateStepImpl) then) =
      __$$ValidateStepImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int step});
}

/// @nodoc
class __$$ValidateStepImplCopyWithImpl<$Res>
    extends _$NewRequestEventCopyWithImpl<$Res, _$ValidateStepImpl>
    implements _$$ValidateStepImplCopyWith<$Res> {
  __$$ValidateStepImplCopyWithImpl(
      _$ValidateStepImpl _value, $Res Function(_$ValidateStepImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
  }) {
    return _then(_$ValidateStepImpl(
      step: null == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ValidateStepImpl implements _ValidateStep {
  const _$ValidateStepImpl({required this.step});

  @override
  final int step;

  @override
  String toString() {
    return 'NewRequestEvent.validateStep(step: $step)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidateStepImpl &&
            (identical(other.step, step) || other.step == step));
  }

  @override
  int get hashCode => Object.hash(runtimeType, step);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidateStepImplCopyWith<_$ValidateStepImpl> get copyWith =>
      __$$ValidateStepImplCopyWithImpl<_$ValidateStepImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) initialized,
    required TResult Function(ReturnMaterial item, bool selected)
        toggleReturnItem,
    required TResult Function(ReturnMaterial item, bool included)
        toggleBonusItem,
    required TResult Function(ReturnItemDetails additionInfo)
        additionInfoChanged,
    required TResult Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)
        updateRequestCounterOffer,
    required TResult Function(
            String uuid, List<PoDocuments> files, bool included)
        toggleFiles,
    required TResult Function(int step) validateStep,
    required TResult Function(String returnReference) returnReferenceChanged,
    required TResult Function(String specialInstructions)
        specialInstructionsChanged,
    required TResult Function(CustomerCodeInfo customerCodeInfo, User user)
        submit,
    required TResult Function(ReturnType returnType, String assignmentNumber)
        updateSelectedReturnType,
  }) {
    return validateStep(step);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? initialized,
    TResult? Function(ReturnMaterial item, bool selected)? toggleReturnItem,
    TResult? Function(ReturnMaterial item, bool included)? toggleBonusItem,
    TResult? Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult? Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)?
        updateRequestCounterOffer,
    TResult? Function(String uuid, List<PoDocuments> files, bool included)?
        toggleFiles,
    TResult? Function(int step)? validateStep,
    TResult? Function(String returnReference)? returnReferenceChanged,
    TResult? Function(String specialInstructions)? specialInstructionsChanged,
    TResult? Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    TResult? Function(ReturnType returnType, String assignmentNumber)?
        updateSelectedReturnType,
  }) {
    return validateStep?.call(step);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? initialized,
    TResult Function(ReturnMaterial item, bool selected)? toggleReturnItem,
    TResult Function(ReturnMaterial item, bool included)? toggleBonusItem,
    TResult Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)?
        updateRequestCounterOffer,
    TResult Function(String uuid, List<PoDocuments> files, bool included)?
        toggleFiles,
    TResult Function(int step)? validateStep,
    TResult Function(String returnReference)? returnReferenceChanged,
    TResult Function(String specialInstructions)? specialInstructionsChanged,
    TResult Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    TResult Function(ReturnType returnType, String assignmentNumber)?
        updateSelectedReturnType,
    required TResult orElse(),
  }) {
    if (validateStep != null) {
      return validateStep(step);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_ToggleReturnItem value) toggleReturnItem,
    required TResult Function(_ToggleBonusItem value) toggleBonusItem,
    required TResult Function(_AdditionInfoChanged value) additionInfoChanged,
    required TResult Function(_UpdateRequestCounterOffer value)
        updateRequestCounterOffer,
    required TResult Function(_ToggleFiles value) toggleFiles,
    required TResult Function(_ValidateStep value) validateStep,
    required TResult Function(_ReturnReferenceChanged value)
        returnReferenceChanged,
    required TResult Function(_SpecialInstructionsChanged value)
        specialInstructionsChanged,
    required TResult Function(_Submit value) submit,
    required TResult Function(_updateSelectedType value)
        updateSelectedReturnType,
  }) {
    return validateStep(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult? Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult? Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult? Function(_UpdateRequestCounterOffer value)?
        updateRequestCounterOffer,
    TResult? Function(_ToggleFiles value)? toggleFiles,
    TResult? Function(_ValidateStep value)? validateStep,
    TResult? Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult? Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_updateSelectedType value)? updateSelectedReturnType,
  }) {
    return validateStep?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult Function(_UpdateRequestCounterOffer value)?
        updateRequestCounterOffer,
    TResult Function(_ToggleFiles value)? toggleFiles,
    TResult Function(_ValidateStep value)? validateStep,
    TResult Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult Function(_Submit value)? submit,
    TResult Function(_updateSelectedType value)? updateSelectedReturnType,
    required TResult orElse(),
  }) {
    if (validateStep != null) {
      return validateStep(this);
    }
    return orElse();
  }
}

abstract class _ValidateStep implements NewRequestEvent {
  const factory _ValidateStep({required final int step}) = _$ValidateStepImpl;

  int get step;
  @JsonKey(ignore: true)
  _$$ValidateStepImplCopyWith<_$ValidateStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReturnReferenceChangedImplCopyWith<$Res> {
  factory _$$ReturnReferenceChangedImplCopyWith(
          _$ReturnReferenceChangedImpl value,
          $Res Function(_$ReturnReferenceChangedImpl) then) =
      __$$ReturnReferenceChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String returnReference});
}

/// @nodoc
class __$$ReturnReferenceChangedImplCopyWithImpl<$Res>
    extends _$NewRequestEventCopyWithImpl<$Res, _$ReturnReferenceChangedImpl>
    implements _$$ReturnReferenceChangedImplCopyWith<$Res> {
  __$$ReturnReferenceChangedImplCopyWithImpl(
      _$ReturnReferenceChangedImpl _value,
      $Res Function(_$ReturnReferenceChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnReference = null,
  }) {
    return _then(_$ReturnReferenceChangedImpl(
      null == returnReference
          ? _value.returnReference
          : returnReference // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ReturnReferenceChangedImpl implements _ReturnReferenceChanged {
  const _$ReturnReferenceChangedImpl(this.returnReference);

  @override
  final String returnReference;

  @override
  String toString() {
    return 'NewRequestEvent.returnReferenceChanged(returnReference: $returnReference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnReferenceChangedImpl &&
            (identical(other.returnReference, returnReference) ||
                other.returnReference == returnReference));
  }

  @override
  int get hashCode => Object.hash(runtimeType, returnReference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReturnReferenceChangedImplCopyWith<_$ReturnReferenceChangedImpl>
      get copyWith => __$$ReturnReferenceChangedImplCopyWithImpl<
          _$ReturnReferenceChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) initialized,
    required TResult Function(ReturnMaterial item, bool selected)
        toggleReturnItem,
    required TResult Function(ReturnMaterial item, bool included)
        toggleBonusItem,
    required TResult Function(ReturnItemDetails additionInfo)
        additionInfoChanged,
    required TResult Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)
        updateRequestCounterOffer,
    required TResult Function(
            String uuid, List<PoDocuments> files, bool included)
        toggleFiles,
    required TResult Function(int step) validateStep,
    required TResult Function(String returnReference) returnReferenceChanged,
    required TResult Function(String specialInstructions)
        specialInstructionsChanged,
    required TResult Function(CustomerCodeInfo customerCodeInfo, User user)
        submit,
    required TResult Function(ReturnType returnType, String assignmentNumber)
        updateSelectedReturnType,
  }) {
    return returnReferenceChanged(returnReference);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? initialized,
    TResult? Function(ReturnMaterial item, bool selected)? toggleReturnItem,
    TResult? Function(ReturnMaterial item, bool included)? toggleBonusItem,
    TResult? Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult? Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)?
        updateRequestCounterOffer,
    TResult? Function(String uuid, List<PoDocuments> files, bool included)?
        toggleFiles,
    TResult? Function(int step)? validateStep,
    TResult? Function(String returnReference)? returnReferenceChanged,
    TResult? Function(String specialInstructions)? specialInstructionsChanged,
    TResult? Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    TResult? Function(ReturnType returnType, String assignmentNumber)?
        updateSelectedReturnType,
  }) {
    return returnReferenceChanged?.call(returnReference);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? initialized,
    TResult Function(ReturnMaterial item, bool selected)? toggleReturnItem,
    TResult Function(ReturnMaterial item, bool included)? toggleBonusItem,
    TResult Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)?
        updateRequestCounterOffer,
    TResult Function(String uuid, List<PoDocuments> files, bool included)?
        toggleFiles,
    TResult Function(int step)? validateStep,
    TResult Function(String returnReference)? returnReferenceChanged,
    TResult Function(String specialInstructions)? specialInstructionsChanged,
    TResult Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    TResult Function(ReturnType returnType, String assignmentNumber)?
        updateSelectedReturnType,
    required TResult orElse(),
  }) {
    if (returnReferenceChanged != null) {
      return returnReferenceChanged(returnReference);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_ToggleReturnItem value) toggleReturnItem,
    required TResult Function(_ToggleBonusItem value) toggleBonusItem,
    required TResult Function(_AdditionInfoChanged value) additionInfoChanged,
    required TResult Function(_UpdateRequestCounterOffer value)
        updateRequestCounterOffer,
    required TResult Function(_ToggleFiles value) toggleFiles,
    required TResult Function(_ValidateStep value) validateStep,
    required TResult Function(_ReturnReferenceChanged value)
        returnReferenceChanged,
    required TResult Function(_SpecialInstructionsChanged value)
        specialInstructionsChanged,
    required TResult Function(_Submit value) submit,
    required TResult Function(_updateSelectedType value)
        updateSelectedReturnType,
  }) {
    return returnReferenceChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult? Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult? Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult? Function(_UpdateRequestCounterOffer value)?
        updateRequestCounterOffer,
    TResult? Function(_ToggleFiles value)? toggleFiles,
    TResult? Function(_ValidateStep value)? validateStep,
    TResult? Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult? Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_updateSelectedType value)? updateSelectedReturnType,
  }) {
    return returnReferenceChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult Function(_UpdateRequestCounterOffer value)?
        updateRequestCounterOffer,
    TResult Function(_ToggleFiles value)? toggleFiles,
    TResult Function(_ValidateStep value)? validateStep,
    TResult Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult Function(_Submit value)? submit,
    TResult Function(_updateSelectedType value)? updateSelectedReturnType,
    required TResult orElse(),
  }) {
    if (returnReferenceChanged != null) {
      return returnReferenceChanged(this);
    }
    return orElse();
  }
}

abstract class _ReturnReferenceChanged implements NewRequestEvent {
  const factory _ReturnReferenceChanged(final String returnReference) =
      _$ReturnReferenceChangedImpl;

  String get returnReference;
  @JsonKey(ignore: true)
  _$$ReturnReferenceChangedImplCopyWith<_$ReturnReferenceChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SpecialInstructionsChangedImplCopyWith<$Res> {
  factory _$$SpecialInstructionsChangedImplCopyWith(
          _$SpecialInstructionsChangedImpl value,
          $Res Function(_$SpecialInstructionsChangedImpl) then) =
      __$$SpecialInstructionsChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String specialInstructions});
}

/// @nodoc
class __$$SpecialInstructionsChangedImplCopyWithImpl<$Res>
    extends _$NewRequestEventCopyWithImpl<$Res,
        _$SpecialInstructionsChangedImpl>
    implements _$$SpecialInstructionsChangedImplCopyWith<$Res> {
  __$$SpecialInstructionsChangedImplCopyWithImpl(
      _$SpecialInstructionsChangedImpl _value,
      $Res Function(_$SpecialInstructionsChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? specialInstructions = null,
  }) {
    return _then(_$SpecialInstructionsChangedImpl(
      null == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SpecialInstructionsChangedImpl implements _SpecialInstructionsChanged {
  const _$SpecialInstructionsChangedImpl(this.specialInstructions);

  @override
  final String specialInstructions;

  @override
  String toString() {
    return 'NewRequestEvent.specialInstructionsChanged(specialInstructions: $specialInstructions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecialInstructionsChangedImpl &&
            (identical(other.specialInstructions, specialInstructions) ||
                other.specialInstructions == specialInstructions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, specialInstructions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecialInstructionsChangedImplCopyWith<_$SpecialInstructionsChangedImpl>
      get copyWith => __$$SpecialInstructionsChangedImplCopyWithImpl<
          _$SpecialInstructionsChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) initialized,
    required TResult Function(ReturnMaterial item, bool selected)
        toggleReturnItem,
    required TResult Function(ReturnMaterial item, bool included)
        toggleBonusItem,
    required TResult Function(ReturnItemDetails additionInfo)
        additionInfoChanged,
    required TResult Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)
        updateRequestCounterOffer,
    required TResult Function(
            String uuid, List<PoDocuments> files, bool included)
        toggleFiles,
    required TResult Function(int step) validateStep,
    required TResult Function(String returnReference) returnReferenceChanged,
    required TResult Function(String specialInstructions)
        specialInstructionsChanged,
    required TResult Function(CustomerCodeInfo customerCodeInfo, User user)
        submit,
    required TResult Function(ReturnType returnType, String assignmentNumber)
        updateSelectedReturnType,
  }) {
    return specialInstructionsChanged(specialInstructions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? initialized,
    TResult? Function(ReturnMaterial item, bool selected)? toggleReturnItem,
    TResult? Function(ReturnMaterial item, bool included)? toggleBonusItem,
    TResult? Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult? Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)?
        updateRequestCounterOffer,
    TResult? Function(String uuid, List<PoDocuments> files, bool included)?
        toggleFiles,
    TResult? Function(int step)? validateStep,
    TResult? Function(String returnReference)? returnReferenceChanged,
    TResult? Function(String specialInstructions)? specialInstructionsChanged,
    TResult? Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    TResult? Function(ReturnType returnType, String assignmentNumber)?
        updateSelectedReturnType,
  }) {
    return specialInstructionsChanged?.call(specialInstructions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? initialized,
    TResult Function(ReturnMaterial item, bool selected)? toggleReturnItem,
    TResult Function(ReturnMaterial item, bool included)? toggleBonusItem,
    TResult Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)?
        updateRequestCounterOffer,
    TResult Function(String uuid, List<PoDocuments> files, bool included)?
        toggleFiles,
    TResult Function(int step)? validateStep,
    TResult Function(String returnReference)? returnReferenceChanged,
    TResult Function(String specialInstructions)? specialInstructionsChanged,
    TResult Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    TResult Function(ReturnType returnType, String assignmentNumber)?
        updateSelectedReturnType,
    required TResult orElse(),
  }) {
    if (specialInstructionsChanged != null) {
      return specialInstructionsChanged(specialInstructions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_ToggleReturnItem value) toggleReturnItem,
    required TResult Function(_ToggleBonusItem value) toggleBonusItem,
    required TResult Function(_AdditionInfoChanged value) additionInfoChanged,
    required TResult Function(_UpdateRequestCounterOffer value)
        updateRequestCounterOffer,
    required TResult Function(_ToggleFiles value) toggleFiles,
    required TResult Function(_ValidateStep value) validateStep,
    required TResult Function(_ReturnReferenceChanged value)
        returnReferenceChanged,
    required TResult Function(_SpecialInstructionsChanged value)
        specialInstructionsChanged,
    required TResult Function(_Submit value) submit,
    required TResult Function(_updateSelectedType value)
        updateSelectedReturnType,
  }) {
    return specialInstructionsChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult? Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult? Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult? Function(_UpdateRequestCounterOffer value)?
        updateRequestCounterOffer,
    TResult? Function(_ToggleFiles value)? toggleFiles,
    TResult? Function(_ValidateStep value)? validateStep,
    TResult? Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult? Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_updateSelectedType value)? updateSelectedReturnType,
  }) {
    return specialInstructionsChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult Function(_UpdateRequestCounterOffer value)?
        updateRequestCounterOffer,
    TResult Function(_ToggleFiles value)? toggleFiles,
    TResult Function(_ValidateStep value)? validateStep,
    TResult Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult Function(_Submit value)? submit,
    TResult Function(_updateSelectedType value)? updateSelectedReturnType,
    required TResult orElse(),
  }) {
    if (specialInstructionsChanged != null) {
      return specialInstructionsChanged(this);
    }
    return orElse();
  }
}

abstract class _SpecialInstructionsChanged implements NewRequestEvent {
  const factory _SpecialInstructionsChanged(final String specialInstructions) =
      _$SpecialInstructionsChangedImpl;

  String get specialInstructions;
  @JsonKey(ignore: true)
  _$$SpecialInstructionsChangedImplCopyWith<_$SpecialInstructionsChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitImplCopyWith<$Res> {
  factory _$$SubmitImplCopyWith(
          _$SubmitImpl value, $Res Function(_$SubmitImpl) then) =
      __$$SubmitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CustomerCodeInfo customerCodeInfo, User user});

  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$SubmitImplCopyWithImpl<$Res>
    extends _$NewRequestEventCopyWithImpl<$Res, _$SubmitImpl>
    implements _$$SubmitImplCopyWith<$Res> {
  __$$SubmitImplCopyWithImpl(
      _$SubmitImpl _value, $Res Function(_$SubmitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeInfo = null,
    Object? user = null,
  }) {
    return _then(_$SubmitImpl(
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
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
}

/// @nodoc

class _$SubmitImpl implements _Submit {
  const _$SubmitImpl({required this.customerCodeInfo, required this.user});

  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final User user;

  @override
  String toString() {
    return 'NewRequestEvent.submit(customerCodeInfo: $customerCodeInfo, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitImpl &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerCodeInfo, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitImplCopyWith<_$SubmitImpl> get copyWith =>
      __$$SubmitImplCopyWithImpl<_$SubmitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) initialized,
    required TResult Function(ReturnMaterial item, bool selected)
        toggleReturnItem,
    required TResult Function(ReturnMaterial item, bool included)
        toggleBonusItem,
    required TResult Function(ReturnItemDetails additionInfo)
        additionInfoChanged,
    required TResult Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)
        updateRequestCounterOffer,
    required TResult Function(
            String uuid, List<PoDocuments> files, bool included)
        toggleFiles,
    required TResult Function(int step) validateStep,
    required TResult Function(String returnReference) returnReferenceChanged,
    required TResult Function(String specialInstructions)
        specialInstructionsChanged,
    required TResult Function(CustomerCodeInfo customerCodeInfo, User user)
        submit,
    required TResult Function(ReturnType returnType, String assignmentNumber)
        updateSelectedReturnType,
  }) {
    return submit(customerCodeInfo, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? initialized,
    TResult? Function(ReturnMaterial item, bool selected)? toggleReturnItem,
    TResult? Function(ReturnMaterial item, bool included)? toggleBonusItem,
    TResult? Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult? Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)?
        updateRequestCounterOffer,
    TResult? Function(String uuid, List<PoDocuments> files, bool included)?
        toggleFiles,
    TResult? Function(int step)? validateStep,
    TResult? Function(String returnReference)? returnReferenceChanged,
    TResult? Function(String specialInstructions)? specialInstructionsChanged,
    TResult? Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    TResult? Function(ReturnType returnType, String assignmentNumber)?
        updateSelectedReturnType,
  }) {
    return submit?.call(customerCodeInfo, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? initialized,
    TResult Function(ReturnMaterial item, bool selected)? toggleReturnItem,
    TResult Function(ReturnMaterial item, bool included)? toggleBonusItem,
    TResult Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)?
        updateRequestCounterOffer,
    TResult Function(String uuid, List<PoDocuments> files, bool included)?
        toggleFiles,
    TResult Function(int step)? validateStep,
    TResult Function(String returnReference)? returnReferenceChanged,
    TResult Function(String specialInstructions)? specialInstructionsChanged,
    TResult Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    TResult Function(ReturnType returnType, String assignmentNumber)?
        updateSelectedReturnType,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(customerCodeInfo, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_ToggleReturnItem value) toggleReturnItem,
    required TResult Function(_ToggleBonusItem value) toggleBonusItem,
    required TResult Function(_AdditionInfoChanged value) additionInfoChanged,
    required TResult Function(_UpdateRequestCounterOffer value)
        updateRequestCounterOffer,
    required TResult Function(_ToggleFiles value) toggleFiles,
    required TResult Function(_ValidateStep value) validateStep,
    required TResult Function(_ReturnReferenceChanged value)
        returnReferenceChanged,
    required TResult Function(_SpecialInstructionsChanged value)
        specialInstructionsChanged,
    required TResult Function(_Submit value) submit,
    required TResult Function(_updateSelectedType value)
        updateSelectedReturnType,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult? Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult? Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult? Function(_UpdateRequestCounterOffer value)?
        updateRequestCounterOffer,
    TResult? Function(_ToggleFiles value)? toggleFiles,
    TResult? Function(_ValidateStep value)? validateStep,
    TResult? Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult? Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_updateSelectedType value)? updateSelectedReturnType,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult Function(_UpdateRequestCounterOffer value)?
        updateRequestCounterOffer,
    TResult Function(_ToggleFiles value)? toggleFiles,
    TResult Function(_ValidateStep value)? validateStep,
    TResult Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult Function(_Submit value)? submit,
    TResult Function(_updateSelectedType value)? updateSelectedReturnType,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class _Submit implements NewRequestEvent {
  const factory _Submit(
      {required final CustomerCodeInfo customerCodeInfo,
      required final User user}) = _$SubmitImpl;

  CustomerCodeInfo get customerCodeInfo;
  User get user;
  @JsonKey(ignore: true)
  _$$SubmitImplCopyWith<_$SubmitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$updateSelectedTypeImplCopyWith<$Res> {
  factory _$$updateSelectedTypeImplCopyWith(_$updateSelectedTypeImpl value,
          $Res Function(_$updateSelectedTypeImpl) then) =
      __$$updateSelectedTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReturnType returnType, String assignmentNumber});
}

/// @nodoc
class __$$updateSelectedTypeImplCopyWithImpl<$Res>
    extends _$NewRequestEventCopyWithImpl<$Res, _$updateSelectedTypeImpl>
    implements _$$updateSelectedTypeImplCopyWith<$Res> {
  __$$updateSelectedTypeImplCopyWithImpl(_$updateSelectedTypeImpl _value,
      $Res Function(_$updateSelectedTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnType = null,
    Object? assignmentNumber = null,
  }) {
    return _then(_$updateSelectedTypeImpl(
      returnType: null == returnType
          ? _value.returnType
          : returnType // ignore: cast_nullable_to_non_nullable
              as ReturnType,
      assignmentNumber: null == assignmentNumber
          ? _value.assignmentNumber
          : assignmentNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$updateSelectedTypeImpl implements _updateSelectedType {
  const _$updateSelectedTypeImpl(
      {required this.returnType, required this.assignmentNumber});

  @override
  final ReturnType returnType;
  @override
  final String assignmentNumber;

  @override
  String toString() {
    return 'NewRequestEvent.updateSelectedReturnType(returnType: $returnType, assignmentNumber: $assignmentNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$updateSelectedTypeImpl &&
            (identical(other.returnType, returnType) ||
                other.returnType == returnType) &&
            (identical(other.assignmentNumber, assignmentNumber) ||
                other.assignmentNumber == assignmentNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, returnType, assignmentNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$updateSelectedTypeImplCopyWith<_$updateSelectedTypeImpl> get copyWith =>
      __$$updateSelectedTypeImplCopyWithImpl<_$updateSelectedTypeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) initialized,
    required TResult Function(ReturnMaterial item, bool selected)
        toggleReturnItem,
    required TResult Function(ReturnMaterial item, bool included)
        toggleBonusItem,
    required TResult Function(ReturnItemDetails additionInfo)
        additionInfoChanged,
    required TResult Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)
        updateRequestCounterOffer,
    required TResult Function(
            String uuid, List<PoDocuments> files, bool included)
        toggleFiles,
    required TResult Function(int step) validateStep,
    required TResult Function(String returnReference) returnReferenceChanged,
    required TResult Function(String specialInstructions)
        specialInstructionsChanged,
    required TResult Function(CustomerCodeInfo customerCodeInfo, User user)
        submit,
    required TResult Function(ReturnType returnType, String assignmentNumber)
        updateSelectedReturnType,
  }) {
    return updateSelectedReturnType(returnType, assignmentNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? initialized,
    TResult? Function(ReturnMaterial item, bool selected)? toggleReturnItem,
    TResult? Function(ReturnMaterial item, bool included)? toggleBonusItem,
    TResult? Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult? Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)?
        updateRequestCounterOffer,
    TResult? Function(String uuid, List<PoDocuments> files, bool included)?
        toggleFiles,
    TResult? Function(int step)? validateStep,
    TResult? Function(String returnReference)? returnReferenceChanged,
    TResult? Function(String specialInstructions)? specialInstructionsChanged,
    TResult? Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    TResult? Function(ReturnType returnType, String assignmentNumber)?
        updateSelectedReturnType,
  }) {
    return updateSelectedReturnType?.call(returnType, assignmentNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? initialized,
    TResult Function(ReturnMaterial item, bool selected)? toggleReturnItem,
    TResult Function(ReturnMaterial item, bool included)? toggleBonusItem,
    TResult Function(ReturnItemDetails additionInfo)? additionInfoChanged,
    TResult Function(CounterOfferValue counterOfferValue, String uuid,
            bool isChangeMaterialCounterOffer)?
        updateRequestCounterOffer,
    TResult Function(String uuid, List<PoDocuments> files, bool included)?
        toggleFiles,
    TResult Function(int step)? validateStep,
    TResult Function(String returnReference)? returnReferenceChanged,
    TResult Function(String specialInstructions)? specialInstructionsChanged,
    TResult Function(CustomerCodeInfo customerCodeInfo, User user)? submit,
    TResult Function(ReturnType returnType, String assignmentNumber)?
        updateSelectedReturnType,
    required TResult orElse(),
  }) {
    if (updateSelectedReturnType != null) {
      return updateSelectedReturnType(returnType, assignmentNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_ToggleReturnItem value) toggleReturnItem,
    required TResult Function(_ToggleBonusItem value) toggleBonusItem,
    required TResult Function(_AdditionInfoChanged value) additionInfoChanged,
    required TResult Function(_UpdateRequestCounterOffer value)
        updateRequestCounterOffer,
    required TResult Function(_ToggleFiles value) toggleFiles,
    required TResult Function(_ValidateStep value) validateStep,
    required TResult Function(_ReturnReferenceChanged value)
        returnReferenceChanged,
    required TResult Function(_SpecialInstructionsChanged value)
        specialInstructionsChanged,
    required TResult Function(_Submit value) submit,
    required TResult Function(_updateSelectedType value)
        updateSelectedReturnType,
  }) {
    return updateSelectedReturnType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult? Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult? Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult? Function(_UpdateRequestCounterOffer value)?
        updateRequestCounterOffer,
    TResult? Function(_ToggleFiles value)? toggleFiles,
    TResult? Function(_ValidateStep value)? validateStep,
    TResult? Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult? Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_updateSelectedType value)? updateSelectedReturnType,
  }) {
    return updateSelectedReturnType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_ToggleReturnItem value)? toggleReturnItem,
    TResult Function(_ToggleBonusItem value)? toggleBonusItem,
    TResult Function(_AdditionInfoChanged value)? additionInfoChanged,
    TResult Function(_UpdateRequestCounterOffer value)?
        updateRequestCounterOffer,
    TResult Function(_ToggleFiles value)? toggleFiles,
    TResult Function(_ValidateStep value)? validateStep,
    TResult Function(_ReturnReferenceChanged value)? returnReferenceChanged,
    TResult Function(_SpecialInstructionsChanged value)?
        specialInstructionsChanged,
    TResult Function(_Submit value)? submit,
    TResult Function(_updateSelectedType value)? updateSelectedReturnType,
    required TResult orElse(),
  }) {
    if (updateSelectedReturnType != null) {
      return updateSelectedReturnType(this);
    }
    return orElse();
  }
}

abstract class _updateSelectedType implements NewRequestEvent {
  const factory _updateSelectedType(
      {required final ReturnType returnType,
      required final String assignmentNumber}) = _$updateSelectedTypeImpl;

  ReturnType get returnType;
  String get assignmentNumber;
  @JsonKey(ignore: true)
  _$$updateSelectedTypeImplCopyWith<_$updateSelectedTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NewRequestState {
  List<ReturnMaterial> get selectedItems => throw _privateConstructorUsedError;
  List<InvoiceDetails> get invoiceDetails => throw _privateConstructorUsedError;
  String get returnReference => throw _privateConstructorUsedError;
  String get specialInstructions => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, String>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  String get returnRequestId => throw _privateConstructorUsedError;
  SalesOrg get salesOrg => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewRequestStateCopyWith<NewRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewRequestStateCopyWith<$Res> {
  factory $NewRequestStateCopyWith(
          NewRequestState value, $Res Function(NewRequestState) then) =
      _$NewRequestStateCopyWithImpl<$Res, NewRequestState>;
  @useResult
  $Res call(
      {List<ReturnMaterial> selectedItems,
      List<InvoiceDetails> invoiceDetails,
      String returnReference,
      String specialInstructions,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ApiFailure, String>> failureOrSuccessOption,
      String returnRequestId,
      SalesOrg salesOrg});
}

/// @nodoc
class _$NewRequestStateCopyWithImpl<$Res, $Val extends NewRequestState>
    implements $NewRequestStateCopyWith<$Res> {
  _$NewRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedItems = null,
    Object? invoiceDetails = null,
    Object? returnReference = null,
    Object? specialInstructions = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? failureOrSuccessOption = null,
    Object? returnRequestId = null,
    Object? salesOrg = null,
  }) {
    return _then(_value.copyWith(
      selectedItems: null == selectedItems
          ? _value.selectedItems
          : selectedItems // ignore: cast_nullable_to_non_nullable
              as List<ReturnMaterial>,
      invoiceDetails: null == invoiceDetails
          ? _value.invoiceDetails
          : invoiceDetails // ignore: cast_nullable_to_non_nullable
              as List<InvoiceDetails>,
      returnReference: null == returnReference
          ? _value.returnReference
          : returnReference // ignore: cast_nullable_to_non_nullable
              as String,
      specialInstructions: null == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, String>>,
      returnRequestId: null == returnRequestId
          ? _value.returnRequestId
          : returnRequestId // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewRequestStateImplCopyWith<$Res>
    implements $NewRequestStateCopyWith<$Res> {
  factory _$$NewRequestStateImplCopyWith(_$NewRequestStateImpl value,
          $Res Function(_$NewRequestStateImpl) then) =
      __$$NewRequestStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ReturnMaterial> selectedItems,
      List<InvoiceDetails> invoiceDetails,
      String returnReference,
      String specialInstructions,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<ApiFailure, String>> failureOrSuccessOption,
      String returnRequestId,
      SalesOrg salesOrg});
}

/// @nodoc
class __$$NewRequestStateImplCopyWithImpl<$Res>
    extends _$NewRequestStateCopyWithImpl<$Res, _$NewRequestStateImpl>
    implements _$$NewRequestStateImplCopyWith<$Res> {
  __$$NewRequestStateImplCopyWithImpl(
      _$NewRequestStateImpl _value, $Res Function(_$NewRequestStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedItems = null,
    Object? invoiceDetails = null,
    Object? returnReference = null,
    Object? specialInstructions = null,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? failureOrSuccessOption = null,
    Object? returnRequestId = null,
    Object? salesOrg = null,
  }) {
    return _then(_$NewRequestStateImpl(
      selectedItems: null == selectedItems
          ? _value._selectedItems
          : selectedItems // ignore: cast_nullable_to_non_nullable
              as List<ReturnMaterial>,
      invoiceDetails: null == invoiceDetails
          ? _value._invoiceDetails
          : invoiceDetails // ignore: cast_nullable_to_non_nullable
              as List<InvoiceDetails>,
      returnReference: null == returnReference
          ? _value.returnReference
          : returnReference // ignore: cast_nullable_to_non_nullable
              as String,
      specialInstructions: null == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as String,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, String>>,
      returnRequestId: null == returnRequestId
          ? _value.returnRequestId
          : returnRequestId // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ));
  }
}

/// @nodoc

class _$NewRequestStateImpl extends _NewRequestState {
  const _$NewRequestStateImpl(
      {required final List<ReturnMaterial> selectedItems,
      required final List<InvoiceDetails> invoiceDetails,
      required this.returnReference,
      required this.specialInstructions,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.failureOrSuccessOption,
      required this.returnRequestId,
      required this.salesOrg})
      : _selectedItems = selectedItems,
        _invoiceDetails = invoiceDetails,
        super._();

  final List<ReturnMaterial> _selectedItems;
  @override
  List<ReturnMaterial> get selectedItems {
    if (_selectedItems is EqualUnmodifiableListView) return _selectedItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedItems);
  }

  final List<InvoiceDetails> _invoiceDetails;
  @override
  List<InvoiceDetails> get invoiceDetails {
    if (_invoiceDetails is EqualUnmodifiableListView) return _invoiceDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invoiceDetails);
  }

  @override
  final String returnReference;
  @override
  final String specialInstructions;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<ApiFailure, String>> failureOrSuccessOption;
  @override
  final String returnRequestId;
  @override
  final SalesOrg salesOrg;

  @override
  String toString() {
    return 'NewRequestState(selectedItems: $selectedItems, invoiceDetails: $invoiceDetails, returnReference: $returnReference, specialInstructions: $specialInstructions, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, failureOrSuccessOption: $failureOrSuccessOption, returnRequestId: $returnRequestId, salesOrg: $salesOrg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewRequestStateImpl &&
            const DeepCollectionEquality()
                .equals(other._selectedItems, _selectedItems) &&
            const DeepCollectionEquality()
                .equals(other._invoiceDetails, _invoiceDetails) &&
            (identical(other.returnReference, returnReference) ||
                other.returnReference == returnReference) &&
            (identical(other.specialInstructions, specialInstructions) ||
                other.specialInstructions == specialInstructions) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.returnRequestId, returnRequestId) ||
                other.returnRequestId == returnRequestId) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_selectedItems),
      const DeepCollectionEquality().hash(_invoiceDetails),
      returnReference,
      specialInstructions,
      showErrorMessages,
      isSubmitting,
      failureOrSuccessOption,
      returnRequestId,
      salesOrg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewRequestStateImplCopyWith<_$NewRequestStateImpl> get copyWith =>
      __$$NewRequestStateImplCopyWithImpl<_$NewRequestStateImpl>(
          this, _$identity);
}

abstract class _NewRequestState extends NewRequestState {
  const factory _NewRequestState(
      {required final List<ReturnMaterial> selectedItems,
      required final List<InvoiceDetails> invoiceDetails,
      required final String returnReference,
      required final String specialInstructions,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<ApiFailure, String>> failureOrSuccessOption,
      required final String returnRequestId,
      required final SalesOrg salesOrg}) = _$NewRequestStateImpl;
  const _NewRequestState._() : super._();

  @override
  List<ReturnMaterial> get selectedItems;
  @override
  List<InvoiceDetails> get invoiceDetails;
  @override
  String get returnReference;
  @override
  String get specialInstructions;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<ApiFailure, String>> get failureOrSuccessOption;
  @override
  String get returnRequestId;
  @override
  SalesOrg get salesOrg;
  @override
  @JsonKey(ignore: true)
  _$$NewRequestStateImplCopyWith<_$NewRequestStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

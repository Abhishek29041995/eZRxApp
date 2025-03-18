// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tender_contract_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TenderContractEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            MaterialInfo materialInfo,
            TenderContract defaultSelectedTenderContract)
        fetch,
    required TResult Function(TenderContract tenderContract) selected,
    required TResult Function() unselected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            MaterialInfo materialInfo,
            TenderContract defaultSelectedTenderContract)?
        fetch,
    TResult? Function(TenderContract tenderContract)? selected,
    TResult? Function()? unselected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            MaterialInfo materialInfo,
            TenderContract defaultSelectedTenderContract)?
        fetch,
    TResult Function(TenderContract tenderContract)? selected,
    TResult Function()? unselected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Selected value) selected,
    required TResult Function(_Unselected value) unselected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Selected value)? selected,
    TResult? Function(_Unselected value)? unselected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Selected value)? selected,
    TResult Function(_Unselected value)? unselected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TenderContractEventCopyWith<$Res> {
  factory $TenderContractEventCopyWith(
          TenderContractEvent value, $Res Function(TenderContractEvent) then) =
      _$TenderContractEventCopyWithImpl<$Res, TenderContractEvent>;
}

/// @nodoc
class _$TenderContractEventCopyWithImpl<$Res, $Val extends TenderContractEvent>
    implements $TenderContractEventCopyWith<$Res> {
  _$TenderContractEventCopyWithImpl(this._value, this._then);

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
    extends _$TenderContractEventCopyWithImpl<$Res, _$InitializedImpl>
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
    return 'TenderContractEvent.initialized()';
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
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            MaterialInfo materialInfo,
            TenderContract defaultSelectedTenderContract)
        fetch,
    required TResult Function(TenderContract tenderContract) selected,
    required TResult Function() unselected,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            MaterialInfo materialInfo,
            TenderContract defaultSelectedTenderContract)?
        fetch,
    TResult? Function(TenderContract tenderContract)? selected,
    TResult? Function()? unselected,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            MaterialInfo materialInfo,
            TenderContract defaultSelectedTenderContract)?
        fetch,
    TResult Function(TenderContract tenderContract)? selected,
    TResult Function()? unselected,
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
    required TResult Function(_Selected value) selected,
    required TResult Function(_Unselected value) unselected,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Selected value)? selected,
    TResult? Function(_Unselected value)? unselected,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Selected value)? selected,
    TResult Function(_Unselected value)? unselected,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements TenderContractEvent {
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
      CustomerCodeInfo customerCodeInfo,
      ShipToInfo shipToInfo,
      MaterialInfo materialInfo,
      TenderContract defaultSelectedTenderContract});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ShipToInfoCopyWith<$Res> get shipToInfo;
  $MaterialInfoCopyWith<$Res> get materialInfo;
  $TenderContractCopyWith<$Res> get defaultSelectedTenderContract;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$TenderContractEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? shipToInfo = null,
    Object? materialInfo = null,
    Object? defaultSelectedTenderContract = null,
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
      shipToInfo: null == shipToInfo
          ? _value.shipToInfo
          : shipToInfo // ignore: cast_nullable_to_non_nullable
              as ShipToInfo,
      materialInfo: null == materialInfo
          ? _value.materialInfo
          : materialInfo // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
      defaultSelectedTenderContract: null == defaultSelectedTenderContract
          ? _value.defaultSelectedTenderContract
          : defaultSelectedTenderContract // ignore: cast_nullable_to_non_nullable
              as TenderContract,
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

  @override
  @pragma('vm:prefer-inline')
  $ShipToInfoCopyWith<$Res> get shipToInfo {
    return $ShipToInfoCopyWith<$Res>(_value.shipToInfo, (value) {
      return _then(_value.copyWith(shipToInfo: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialInfoCopyWith<$Res> get materialInfo {
    return $MaterialInfoCopyWith<$Res>(_value.materialInfo, (value) {
      return _then(_value.copyWith(materialInfo: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TenderContractCopyWith<$Res> get defaultSelectedTenderContract {
    return $TenderContractCopyWith<$Res>(_value.defaultSelectedTenderContract,
        (value) {
      return _then(_value.copyWith(defaultSelectedTenderContract: value));
    });
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  _$FetchImpl(
      {required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.materialInfo,
      required this.defaultSelectedTenderContract});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final ShipToInfo shipToInfo;
  @override
  final MaterialInfo materialInfo;
  @override
  final TenderContract defaultSelectedTenderContract;

  @override
  String toString() {
    return 'TenderContractEvent.fetch(salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, materialInfo: $materialInfo, defaultSelectedTenderContract: $defaultSelectedTenderContract)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.shipToInfo, shipToInfo) ||
                other.shipToInfo == shipToInfo) &&
            (identical(other.materialInfo, materialInfo) ||
                other.materialInfo == materialInfo) &&
            (identical(other.defaultSelectedTenderContract,
                    defaultSelectedTenderContract) ||
                other.defaultSelectedTenderContract ==
                    defaultSelectedTenderContract));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      salesOrganisation,
      customerCodeInfo,
      shipToInfo,
      materialInfo,
      defaultSelectedTenderContract);

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
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            MaterialInfo materialInfo,
            TenderContract defaultSelectedTenderContract)
        fetch,
    required TResult Function(TenderContract tenderContract) selected,
    required TResult Function() unselected,
  }) {
    return fetch(salesOrganisation, customerCodeInfo, shipToInfo, materialInfo,
        defaultSelectedTenderContract);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            MaterialInfo materialInfo,
            TenderContract defaultSelectedTenderContract)?
        fetch,
    TResult? Function(TenderContract tenderContract)? selected,
    TResult? Function()? unselected,
  }) {
    return fetch?.call(salesOrganisation, customerCodeInfo, shipToInfo,
        materialInfo, defaultSelectedTenderContract);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            MaterialInfo materialInfo,
            TenderContract defaultSelectedTenderContract)?
        fetch,
    TResult Function(TenderContract tenderContract)? selected,
    TResult Function()? unselected,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(salesOrganisation, customerCodeInfo, shipToInfo,
          materialInfo, defaultSelectedTenderContract);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Selected value) selected,
    required TResult Function(_Unselected value) unselected,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Selected value)? selected,
    TResult? Function(_Unselected value)? unselected,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Selected value)? selected,
    TResult Function(_Unselected value)? unselected,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements TenderContractEvent {
  factory _Fetch(
          {required final SalesOrganisation salesOrganisation,
          required final CustomerCodeInfo customerCodeInfo,
          required final ShipToInfo shipToInfo,
          required final MaterialInfo materialInfo,
          required final TenderContract defaultSelectedTenderContract}) =
      _$FetchImpl;

  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  ShipToInfo get shipToInfo;
  MaterialInfo get materialInfo;
  TenderContract get defaultSelectedTenderContract;
  @JsonKey(ignore: true)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectedImplCopyWith<$Res> {
  factory _$$SelectedImplCopyWith(
          _$SelectedImpl value, $Res Function(_$SelectedImpl) then) =
      __$$SelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TenderContract tenderContract});

  $TenderContractCopyWith<$Res> get tenderContract;
}

/// @nodoc
class __$$SelectedImplCopyWithImpl<$Res>
    extends _$TenderContractEventCopyWithImpl<$Res, _$SelectedImpl>
    implements _$$SelectedImplCopyWith<$Res> {
  __$$SelectedImplCopyWithImpl(
      _$SelectedImpl _value, $Res Function(_$SelectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenderContract = null,
  }) {
    return _then(_$SelectedImpl(
      tenderContract: null == tenderContract
          ? _value.tenderContract
          : tenderContract // ignore: cast_nullable_to_non_nullable
              as TenderContract,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TenderContractCopyWith<$Res> get tenderContract {
    return $TenderContractCopyWith<$Res>(_value.tenderContract, (value) {
      return _then(_value.copyWith(tenderContract: value));
    });
  }
}

/// @nodoc

class _$SelectedImpl implements _Selected {
  const _$SelectedImpl({required this.tenderContract});

  @override
  final TenderContract tenderContract;

  @override
  String toString() {
    return 'TenderContractEvent.selected(tenderContract: $tenderContract)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedImpl &&
            (identical(other.tenderContract, tenderContract) ||
                other.tenderContract == tenderContract));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tenderContract);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedImplCopyWith<_$SelectedImpl> get copyWith =>
      __$$SelectedImplCopyWithImpl<_$SelectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            MaterialInfo materialInfo,
            TenderContract defaultSelectedTenderContract)
        fetch,
    required TResult Function(TenderContract tenderContract) selected,
    required TResult Function() unselected,
  }) {
    return selected(tenderContract);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            MaterialInfo materialInfo,
            TenderContract defaultSelectedTenderContract)?
        fetch,
    TResult? Function(TenderContract tenderContract)? selected,
    TResult? Function()? unselected,
  }) {
    return selected?.call(tenderContract);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            MaterialInfo materialInfo,
            TenderContract defaultSelectedTenderContract)?
        fetch,
    TResult Function(TenderContract tenderContract)? selected,
    TResult Function()? unselected,
    required TResult orElse(),
  }) {
    if (selected != null) {
      return selected(tenderContract);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Selected value) selected,
    required TResult Function(_Unselected value) unselected,
  }) {
    return selected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Selected value)? selected,
    TResult? Function(_Unselected value)? unselected,
  }) {
    return selected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Selected value)? selected,
    TResult Function(_Unselected value)? unselected,
    required TResult orElse(),
  }) {
    if (selected != null) {
      return selected(this);
    }
    return orElse();
  }
}

abstract class _Selected implements TenderContractEvent {
  const factory _Selected({required final TenderContract tenderContract}) =
      _$SelectedImpl;

  TenderContract get tenderContract;
  @JsonKey(ignore: true)
  _$$SelectedImplCopyWith<_$SelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnselectedImplCopyWith<$Res> {
  factory _$$UnselectedImplCopyWith(
          _$UnselectedImpl value, $Res Function(_$UnselectedImpl) then) =
      __$$UnselectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnselectedImplCopyWithImpl<$Res>
    extends _$TenderContractEventCopyWithImpl<$Res, _$UnselectedImpl>
    implements _$$UnselectedImplCopyWith<$Res> {
  __$$UnselectedImplCopyWithImpl(
      _$UnselectedImpl _value, $Res Function(_$UnselectedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnselectedImpl implements _Unselected {
  const _$UnselectedImpl();

  @override
  String toString() {
    return 'TenderContractEvent.unselected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnselectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            MaterialInfo materialInfo,
            TenderContract defaultSelectedTenderContract)
        fetch,
    required TResult Function(TenderContract tenderContract) selected,
    required TResult Function() unselected,
  }) {
    return unselected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            MaterialInfo materialInfo,
            TenderContract defaultSelectedTenderContract)?
        fetch,
    TResult? Function(TenderContract tenderContract)? selected,
    TResult? Function()? unselected,
  }) {
    return unselected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo,
            ShipToInfo shipToInfo,
            MaterialInfo materialInfo,
            TenderContract defaultSelectedTenderContract)?
        fetch,
    TResult Function(TenderContract tenderContract)? selected,
    TResult Function()? unselected,
    required TResult orElse(),
  }) {
    if (unselected != null) {
      return unselected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Selected value) selected,
    required TResult Function(_Unselected value) unselected,
  }) {
    return unselected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Selected value)? selected,
    TResult? Function(_Unselected value)? unselected,
  }) {
    return unselected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Selected value)? selected,
    TResult Function(_Unselected value)? unselected,
    required TResult orElse(),
  }) {
    if (unselected != null) {
      return unselected(this);
    }
    return orElse();
  }
}

abstract class _Unselected implements TenderContractEvent {
  const factory _Unselected() = _$UnselectedImpl;
}

/// @nodoc
mixin _$TenderContractState {
  List<TenderContract> get tenderContractList =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  TenderContract get selectedTenderContract =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TenderContractStateCopyWith<TenderContractState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TenderContractStateCopyWith<$Res> {
  factory $TenderContractStateCopyWith(
          TenderContractState value, $Res Function(TenderContractState) then) =
      _$TenderContractStateCopyWithImpl<$Res, TenderContractState>;
  @useResult
  $Res call(
      {List<TenderContract> tenderContractList,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool isFetching,
      TenderContract selectedTenderContract});

  $TenderContractCopyWith<$Res> get selectedTenderContract;
}

/// @nodoc
class _$TenderContractStateCopyWithImpl<$Res, $Val extends TenderContractState>
    implements $TenderContractStateCopyWith<$Res> {
  _$TenderContractStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenderContractList = null,
    Object? apiFailureOrSuccessOption = null,
    Object? isFetching = null,
    Object? selectedTenderContract = null,
  }) {
    return _then(_value.copyWith(
      tenderContractList: null == tenderContractList
          ? _value.tenderContractList
          : tenderContractList // ignore: cast_nullable_to_non_nullable
              as List<TenderContract>,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedTenderContract: null == selectedTenderContract
          ? _value.selectedTenderContract
          : selectedTenderContract // ignore: cast_nullable_to_non_nullable
              as TenderContract,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TenderContractCopyWith<$Res> get selectedTenderContract {
    return $TenderContractCopyWith<$Res>(_value.selectedTenderContract,
        (value) {
      return _then(_value.copyWith(selectedTenderContract: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TenderContractStateImplCopyWith<$Res>
    implements $TenderContractStateCopyWith<$Res> {
  factory _$$TenderContractStateImplCopyWith(_$TenderContractStateImpl value,
          $Res Function(_$TenderContractStateImpl) then) =
      __$$TenderContractStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TenderContract> tenderContractList,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
      bool isFetching,
      TenderContract selectedTenderContract});

  @override
  $TenderContractCopyWith<$Res> get selectedTenderContract;
}

/// @nodoc
class __$$TenderContractStateImplCopyWithImpl<$Res>
    extends _$TenderContractStateCopyWithImpl<$Res, _$TenderContractStateImpl>
    implements _$$TenderContractStateImplCopyWith<$Res> {
  __$$TenderContractStateImplCopyWithImpl(_$TenderContractStateImpl _value,
      $Res Function(_$TenderContractStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenderContractList = null,
    Object? apiFailureOrSuccessOption = null,
    Object? isFetching = null,
    Object? selectedTenderContract = null,
  }) {
    return _then(_$TenderContractStateImpl(
      tenderContractList: null == tenderContractList
          ? _value._tenderContractList
          : tenderContractList // ignore: cast_nullable_to_non_nullable
              as List<TenderContract>,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedTenderContract: null == selectedTenderContract
          ? _value.selectedTenderContract
          : selectedTenderContract // ignore: cast_nullable_to_non_nullable
              as TenderContract,
    ));
  }
}

/// @nodoc

class _$TenderContractStateImpl implements _TenderContractState {
  const _$TenderContractStateImpl(
      {required final List<TenderContract> tenderContractList,
      required this.apiFailureOrSuccessOption,
      required this.isFetching,
      required this.selectedTenderContract})
      : _tenderContractList = tenderContractList;

  final List<TenderContract> _tenderContractList;
  @override
  List<TenderContract> get tenderContractList {
    if (_tenderContractList is EqualUnmodifiableListView)
      return _tenderContractList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tenderContractList);
  }

  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;
  @override
  final bool isFetching;
  @override
  final TenderContract selectedTenderContract;

  @override
  String toString() {
    return 'TenderContractState(tenderContractList: $tenderContractList, apiFailureOrSuccessOption: $apiFailureOrSuccessOption, isFetching: $isFetching, selectedTenderContract: $selectedTenderContract)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TenderContractStateImpl &&
            const DeepCollectionEquality()
                .equals(other._tenderContractList, _tenderContractList) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.selectedTenderContract, selectedTenderContract) ||
                other.selectedTenderContract == selectedTenderContract));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tenderContractList),
      apiFailureOrSuccessOption,
      isFetching,
      selectedTenderContract);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TenderContractStateImplCopyWith<_$TenderContractStateImpl> get copyWith =>
      __$$TenderContractStateImplCopyWithImpl<_$TenderContractStateImpl>(
          this, _$identity);
}

abstract class _TenderContractState implements TenderContractState {
  const factory _TenderContractState(
          {required final List<TenderContract> tenderContractList,
          required final Option<Either<ApiFailure, dynamic>>
              apiFailureOrSuccessOption,
          required final bool isFetching,
          required final TenderContract selectedTenderContract}) =
      _$TenderContractStateImpl;

  @override
  List<TenderContract> get tenderContractList;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  bool get isFetching;
  @override
  TenderContract get selectedTenderContract;
  @override
  @JsonKey(ignore: true)
  _$$TenderContractStateImplCopyWith<_$TenderContractStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

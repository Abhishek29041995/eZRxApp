// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_org_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SalesOrgEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganisation) selected,
    required TResult Function(List<SalesOrganisation> salesOrganisations)
        loadSavedOrganisation,
    required TResult Function(List<SalesOrganisation> avialableSalesOrgList)
        fetchAvailableSalesOrg,
    required TResult Function(
            SearchKey searchKey, List<SalesOrganisation> salesOrgList)
        searchSalesOrg,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation)? selected,
    TResult? Function(List<SalesOrganisation> salesOrganisations)?
        loadSavedOrganisation,
    TResult? Function(List<SalesOrganisation> avialableSalesOrgList)?
        fetchAvailableSalesOrg,
    TResult? Function(
            SearchKey searchKey, List<SalesOrganisation> salesOrgList)?
        searchSalesOrg,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation)? selected,
    TResult Function(List<SalesOrganisation> salesOrganisations)?
        loadSavedOrganisation,
    TResult Function(List<SalesOrganisation> avialableSalesOrgList)?
        fetchAvailableSalesOrg,
    TResult Function(SearchKey searchKey, List<SalesOrganisation> salesOrgList)?
        searchSalesOrg,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Selected value) selected,
    required TResult Function(_LoadSavedOrganisation value)
        loadSavedOrganisation,
    required TResult Function(_FetchAvailableSalesOrg value)
        fetchAvailableSalesOrg,
    required TResult Function(_SearchSalesOrg value) searchSalesOrg,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Selected value)? selected,
    TResult? Function(_LoadSavedOrganisation value)? loadSavedOrganisation,
    TResult? Function(_FetchAvailableSalesOrg value)? fetchAvailableSalesOrg,
    TResult? Function(_SearchSalesOrg value)? searchSalesOrg,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Selected value)? selected,
    TResult Function(_LoadSavedOrganisation value)? loadSavedOrganisation,
    TResult Function(_FetchAvailableSalesOrg value)? fetchAvailableSalesOrg,
    TResult Function(_SearchSalesOrg value)? searchSalesOrg,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrgEventCopyWith<$Res> {
  factory $SalesOrgEventCopyWith(
          SalesOrgEvent value, $Res Function(SalesOrgEvent) then) =
      _$SalesOrgEventCopyWithImpl<$Res, SalesOrgEvent>;
}

/// @nodoc
class _$SalesOrgEventCopyWithImpl<$Res, $Val extends SalesOrgEvent>
    implements $SalesOrgEventCopyWith<$Res> {
  _$SalesOrgEventCopyWithImpl(this._value, this._then);

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
    extends _$SalesOrgEventCopyWithImpl<$Res, _$InitializedImpl>
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
    return 'SalesOrgEvent.initialized()';
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
    required TResult Function(SalesOrganisation salesOrganisation) selected,
    required TResult Function(List<SalesOrganisation> salesOrganisations)
        loadSavedOrganisation,
    required TResult Function(List<SalesOrganisation> avialableSalesOrgList)
        fetchAvailableSalesOrg,
    required TResult Function(
            SearchKey searchKey, List<SalesOrganisation> salesOrgList)
        searchSalesOrg,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation)? selected,
    TResult? Function(List<SalesOrganisation> salesOrganisations)?
        loadSavedOrganisation,
    TResult? Function(List<SalesOrganisation> avialableSalesOrgList)?
        fetchAvailableSalesOrg,
    TResult? Function(
            SearchKey searchKey, List<SalesOrganisation> salesOrgList)?
        searchSalesOrg,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation)? selected,
    TResult Function(List<SalesOrganisation> salesOrganisations)?
        loadSavedOrganisation,
    TResult Function(List<SalesOrganisation> avialableSalesOrgList)?
        fetchAvailableSalesOrg,
    TResult Function(SearchKey searchKey, List<SalesOrganisation> salesOrgList)?
        searchSalesOrg,
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
    required TResult Function(_Selected value) selected,
    required TResult Function(_LoadSavedOrganisation value)
        loadSavedOrganisation,
    required TResult Function(_FetchAvailableSalesOrg value)
        fetchAvailableSalesOrg,
    required TResult Function(_SearchSalesOrg value) searchSalesOrg,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Selected value)? selected,
    TResult? Function(_LoadSavedOrganisation value)? loadSavedOrganisation,
    TResult? Function(_FetchAvailableSalesOrg value)? fetchAvailableSalesOrg,
    TResult? Function(_SearchSalesOrg value)? searchSalesOrg,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Selected value)? selected,
    TResult Function(_LoadSavedOrganisation value)? loadSavedOrganisation,
    TResult Function(_FetchAvailableSalesOrg value)? fetchAvailableSalesOrg,
    TResult Function(_SearchSalesOrg value)? searchSalesOrg,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements SalesOrgEvent {
  const factory _Initialized() = _$InitializedImpl;
}

/// @nodoc
abstract class _$$SelectedImplCopyWith<$Res> {
  factory _$$SelectedImplCopyWith(
          _$SelectedImpl value, $Res Function(_$SelectedImpl) then) =
      __$$SelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrganisation salesOrganisation});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
}

/// @nodoc
class __$$SelectedImplCopyWithImpl<$Res>
    extends _$SalesOrgEventCopyWithImpl<$Res, _$SelectedImpl>
    implements _$$SelectedImplCopyWith<$Res> {
  __$$SelectedImplCopyWithImpl(
      _$SelectedImpl _value, $Res Function(_$SelectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
  }) {
    return _then(_$SelectedImpl(
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

class _$SelectedImpl implements _Selected {
  const _$SelectedImpl({required this.salesOrganisation});

  @override
  final SalesOrganisation salesOrganisation;

  @override
  String toString() {
    return 'SalesOrgEvent.selected(salesOrganisation: $salesOrganisation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedImpl &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrganisation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedImplCopyWith<_$SelectedImpl> get copyWith =>
      __$$SelectedImplCopyWithImpl<_$SelectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganisation) selected,
    required TResult Function(List<SalesOrganisation> salesOrganisations)
        loadSavedOrganisation,
    required TResult Function(List<SalesOrganisation> avialableSalesOrgList)
        fetchAvailableSalesOrg,
    required TResult Function(
            SearchKey searchKey, List<SalesOrganisation> salesOrgList)
        searchSalesOrg,
  }) {
    return selected(salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation)? selected,
    TResult? Function(List<SalesOrganisation> salesOrganisations)?
        loadSavedOrganisation,
    TResult? Function(List<SalesOrganisation> avialableSalesOrgList)?
        fetchAvailableSalesOrg,
    TResult? Function(
            SearchKey searchKey, List<SalesOrganisation> salesOrgList)?
        searchSalesOrg,
  }) {
    return selected?.call(salesOrganisation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation)? selected,
    TResult Function(List<SalesOrganisation> salesOrganisations)?
        loadSavedOrganisation,
    TResult Function(List<SalesOrganisation> avialableSalesOrgList)?
        fetchAvailableSalesOrg,
    TResult Function(SearchKey searchKey, List<SalesOrganisation> salesOrgList)?
        searchSalesOrg,
    required TResult orElse(),
  }) {
    if (selected != null) {
      return selected(salesOrganisation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Selected value) selected,
    required TResult Function(_LoadSavedOrganisation value)
        loadSavedOrganisation,
    required TResult Function(_FetchAvailableSalesOrg value)
        fetchAvailableSalesOrg,
    required TResult Function(_SearchSalesOrg value) searchSalesOrg,
  }) {
    return selected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Selected value)? selected,
    TResult? Function(_LoadSavedOrganisation value)? loadSavedOrganisation,
    TResult? Function(_FetchAvailableSalesOrg value)? fetchAvailableSalesOrg,
    TResult? Function(_SearchSalesOrg value)? searchSalesOrg,
  }) {
    return selected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Selected value)? selected,
    TResult Function(_LoadSavedOrganisation value)? loadSavedOrganisation,
    TResult Function(_FetchAvailableSalesOrg value)? fetchAvailableSalesOrg,
    TResult Function(_SearchSalesOrg value)? searchSalesOrg,
    required TResult orElse(),
  }) {
    if (selected != null) {
      return selected(this);
    }
    return orElse();
  }
}

abstract class _Selected implements SalesOrgEvent {
  const factory _Selected(
      {required final SalesOrganisation salesOrganisation}) = _$SelectedImpl;

  SalesOrganisation get salesOrganisation;
  @JsonKey(ignore: true)
  _$$SelectedImplCopyWith<_$SelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadSavedOrganisationImplCopyWith<$Res> {
  factory _$$LoadSavedOrganisationImplCopyWith(
          _$LoadSavedOrganisationImpl value,
          $Res Function(_$LoadSavedOrganisationImpl) then) =
      __$$LoadSavedOrganisationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SalesOrganisation> salesOrganisations});
}

/// @nodoc
class __$$LoadSavedOrganisationImplCopyWithImpl<$Res>
    extends _$SalesOrgEventCopyWithImpl<$Res, _$LoadSavedOrganisationImpl>
    implements _$$LoadSavedOrganisationImplCopyWith<$Res> {
  __$$LoadSavedOrganisationImplCopyWithImpl(_$LoadSavedOrganisationImpl _value,
      $Res Function(_$LoadSavedOrganisationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisations = null,
  }) {
    return _then(_$LoadSavedOrganisationImpl(
      salesOrganisations: null == salesOrganisations
          ? _value._salesOrganisations
          : salesOrganisations // ignore: cast_nullable_to_non_nullable
              as List<SalesOrganisation>,
    ));
  }
}

/// @nodoc

class _$LoadSavedOrganisationImpl implements _LoadSavedOrganisation {
  const _$LoadSavedOrganisationImpl(
      {required final List<SalesOrganisation> salesOrganisations})
      : _salesOrganisations = salesOrganisations;

  final List<SalesOrganisation> _salesOrganisations;
  @override
  List<SalesOrganisation> get salesOrganisations {
    if (_salesOrganisations is EqualUnmodifiableListView)
      return _salesOrganisations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_salesOrganisations);
  }

  @override
  String toString() {
    return 'SalesOrgEvent.loadSavedOrganisation(salesOrganisations: $salesOrganisations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSavedOrganisationImpl &&
            const DeepCollectionEquality()
                .equals(other._salesOrganisations, _salesOrganisations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_salesOrganisations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadSavedOrganisationImplCopyWith<_$LoadSavedOrganisationImpl>
      get copyWith => __$$LoadSavedOrganisationImplCopyWithImpl<
          _$LoadSavedOrganisationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganisation) selected,
    required TResult Function(List<SalesOrganisation> salesOrganisations)
        loadSavedOrganisation,
    required TResult Function(List<SalesOrganisation> avialableSalesOrgList)
        fetchAvailableSalesOrg,
    required TResult Function(
            SearchKey searchKey, List<SalesOrganisation> salesOrgList)
        searchSalesOrg,
  }) {
    return loadSavedOrganisation(salesOrganisations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation)? selected,
    TResult? Function(List<SalesOrganisation> salesOrganisations)?
        loadSavedOrganisation,
    TResult? Function(List<SalesOrganisation> avialableSalesOrgList)?
        fetchAvailableSalesOrg,
    TResult? Function(
            SearchKey searchKey, List<SalesOrganisation> salesOrgList)?
        searchSalesOrg,
  }) {
    return loadSavedOrganisation?.call(salesOrganisations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation)? selected,
    TResult Function(List<SalesOrganisation> salesOrganisations)?
        loadSavedOrganisation,
    TResult Function(List<SalesOrganisation> avialableSalesOrgList)?
        fetchAvailableSalesOrg,
    TResult Function(SearchKey searchKey, List<SalesOrganisation> salesOrgList)?
        searchSalesOrg,
    required TResult orElse(),
  }) {
    if (loadSavedOrganisation != null) {
      return loadSavedOrganisation(salesOrganisations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Selected value) selected,
    required TResult Function(_LoadSavedOrganisation value)
        loadSavedOrganisation,
    required TResult Function(_FetchAvailableSalesOrg value)
        fetchAvailableSalesOrg,
    required TResult Function(_SearchSalesOrg value) searchSalesOrg,
  }) {
    return loadSavedOrganisation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Selected value)? selected,
    TResult? Function(_LoadSavedOrganisation value)? loadSavedOrganisation,
    TResult? Function(_FetchAvailableSalesOrg value)? fetchAvailableSalesOrg,
    TResult? Function(_SearchSalesOrg value)? searchSalesOrg,
  }) {
    return loadSavedOrganisation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Selected value)? selected,
    TResult Function(_LoadSavedOrganisation value)? loadSavedOrganisation,
    TResult Function(_FetchAvailableSalesOrg value)? fetchAvailableSalesOrg,
    TResult Function(_SearchSalesOrg value)? searchSalesOrg,
    required TResult orElse(),
  }) {
    if (loadSavedOrganisation != null) {
      return loadSavedOrganisation(this);
    }
    return orElse();
  }
}

abstract class _LoadSavedOrganisation implements SalesOrgEvent {
  const factory _LoadSavedOrganisation(
          {required final List<SalesOrganisation> salesOrganisations}) =
      _$LoadSavedOrganisationImpl;

  List<SalesOrganisation> get salesOrganisations;
  @JsonKey(ignore: true)
  _$$LoadSavedOrganisationImplCopyWith<_$LoadSavedOrganisationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchAvailableSalesOrgImplCopyWith<$Res> {
  factory _$$FetchAvailableSalesOrgImplCopyWith(
          _$FetchAvailableSalesOrgImpl value,
          $Res Function(_$FetchAvailableSalesOrgImpl) then) =
      __$$FetchAvailableSalesOrgImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SalesOrganisation> avialableSalesOrgList});
}

/// @nodoc
class __$$FetchAvailableSalesOrgImplCopyWithImpl<$Res>
    extends _$SalesOrgEventCopyWithImpl<$Res, _$FetchAvailableSalesOrgImpl>
    implements _$$FetchAvailableSalesOrgImplCopyWith<$Res> {
  __$$FetchAvailableSalesOrgImplCopyWithImpl(
      _$FetchAvailableSalesOrgImpl _value,
      $Res Function(_$FetchAvailableSalesOrgImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avialableSalesOrgList = null,
  }) {
    return _then(_$FetchAvailableSalesOrgImpl(
      avialableSalesOrgList: null == avialableSalesOrgList
          ? _value._avialableSalesOrgList
          : avialableSalesOrgList // ignore: cast_nullable_to_non_nullable
              as List<SalesOrganisation>,
    ));
  }
}

/// @nodoc

class _$FetchAvailableSalesOrgImpl implements _FetchAvailableSalesOrg {
  const _$FetchAvailableSalesOrgImpl(
      {required final List<SalesOrganisation> avialableSalesOrgList})
      : _avialableSalesOrgList = avialableSalesOrgList;

  final List<SalesOrganisation> _avialableSalesOrgList;
  @override
  List<SalesOrganisation> get avialableSalesOrgList {
    if (_avialableSalesOrgList is EqualUnmodifiableListView)
      return _avialableSalesOrgList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_avialableSalesOrgList);
  }

  @override
  String toString() {
    return 'SalesOrgEvent.fetchAvailableSalesOrg(avialableSalesOrgList: $avialableSalesOrgList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAvailableSalesOrgImpl &&
            const DeepCollectionEquality()
                .equals(other._avialableSalesOrgList, _avialableSalesOrgList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_avialableSalesOrgList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchAvailableSalesOrgImplCopyWith<_$FetchAvailableSalesOrgImpl>
      get copyWith => __$$FetchAvailableSalesOrgImplCopyWithImpl<
          _$FetchAvailableSalesOrgImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganisation) selected,
    required TResult Function(List<SalesOrganisation> salesOrganisations)
        loadSavedOrganisation,
    required TResult Function(List<SalesOrganisation> avialableSalesOrgList)
        fetchAvailableSalesOrg,
    required TResult Function(
            SearchKey searchKey, List<SalesOrganisation> salesOrgList)
        searchSalesOrg,
  }) {
    return fetchAvailableSalesOrg(avialableSalesOrgList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation)? selected,
    TResult? Function(List<SalesOrganisation> salesOrganisations)?
        loadSavedOrganisation,
    TResult? Function(List<SalesOrganisation> avialableSalesOrgList)?
        fetchAvailableSalesOrg,
    TResult? Function(
            SearchKey searchKey, List<SalesOrganisation> salesOrgList)?
        searchSalesOrg,
  }) {
    return fetchAvailableSalesOrg?.call(avialableSalesOrgList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation)? selected,
    TResult Function(List<SalesOrganisation> salesOrganisations)?
        loadSavedOrganisation,
    TResult Function(List<SalesOrganisation> avialableSalesOrgList)?
        fetchAvailableSalesOrg,
    TResult Function(SearchKey searchKey, List<SalesOrganisation> salesOrgList)?
        searchSalesOrg,
    required TResult orElse(),
  }) {
    if (fetchAvailableSalesOrg != null) {
      return fetchAvailableSalesOrg(avialableSalesOrgList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Selected value) selected,
    required TResult Function(_LoadSavedOrganisation value)
        loadSavedOrganisation,
    required TResult Function(_FetchAvailableSalesOrg value)
        fetchAvailableSalesOrg,
    required TResult Function(_SearchSalesOrg value) searchSalesOrg,
  }) {
    return fetchAvailableSalesOrg(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Selected value)? selected,
    TResult? Function(_LoadSavedOrganisation value)? loadSavedOrganisation,
    TResult? Function(_FetchAvailableSalesOrg value)? fetchAvailableSalesOrg,
    TResult? Function(_SearchSalesOrg value)? searchSalesOrg,
  }) {
    return fetchAvailableSalesOrg?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Selected value)? selected,
    TResult Function(_LoadSavedOrganisation value)? loadSavedOrganisation,
    TResult Function(_FetchAvailableSalesOrg value)? fetchAvailableSalesOrg,
    TResult Function(_SearchSalesOrg value)? searchSalesOrg,
    required TResult orElse(),
  }) {
    if (fetchAvailableSalesOrg != null) {
      return fetchAvailableSalesOrg(this);
    }
    return orElse();
  }
}

abstract class _FetchAvailableSalesOrg implements SalesOrgEvent {
  const factory _FetchAvailableSalesOrg(
          {required final List<SalesOrganisation> avialableSalesOrgList}) =
      _$FetchAvailableSalesOrgImpl;

  List<SalesOrganisation> get avialableSalesOrgList;
  @JsonKey(ignore: true)
  _$$FetchAvailableSalesOrgImplCopyWith<_$FetchAvailableSalesOrgImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchSalesOrgImplCopyWith<$Res> {
  factory _$$SearchSalesOrgImplCopyWith(_$SearchSalesOrgImpl value,
          $Res Function(_$SearchSalesOrgImpl) then) =
      __$$SearchSalesOrgImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SearchKey searchKey, List<SalesOrganisation> salesOrgList});
}

/// @nodoc
class __$$SearchSalesOrgImplCopyWithImpl<$Res>
    extends _$SalesOrgEventCopyWithImpl<$Res, _$SearchSalesOrgImpl>
    implements _$$SearchSalesOrgImplCopyWith<$Res> {
  __$$SearchSalesOrgImplCopyWithImpl(
      _$SearchSalesOrgImpl _value, $Res Function(_$SearchSalesOrgImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchKey = null,
    Object? salesOrgList = null,
  }) {
    return _then(_$SearchSalesOrgImpl(
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
      salesOrgList: null == salesOrgList
          ? _value._salesOrgList
          : salesOrgList // ignore: cast_nullable_to_non_nullable
              as List<SalesOrganisation>,
    ));
  }
}

/// @nodoc

class _$SearchSalesOrgImpl implements _SearchSalesOrg {
  const _$SearchSalesOrgImpl(
      {required this.searchKey,
      required final List<SalesOrganisation> salesOrgList})
      : _salesOrgList = salesOrgList;

  @override
  final SearchKey searchKey;
  final List<SalesOrganisation> _salesOrgList;
  @override
  List<SalesOrganisation> get salesOrgList {
    if (_salesOrgList is EqualUnmodifiableListView) return _salesOrgList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_salesOrgList);
  }

  @override
  String toString() {
    return 'SalesOrgEvent.searchSalesOrg(searchKey: $searchKey, salesOrgList: $salesOrgList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchSalesOrgImpl &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            const DeepCollectionEquality()
                .equals(other._salesOrgList, _salesOrgList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchKey,
      const DeepCollectionEquality().hash(_salesOrgList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchSalesOrgImplCopyWith<_$SearchSalesOrgImpl> get copyWith =>
      __$$SearchSalesOrgImplCopyWithImpl<_$SearchSalesOrgImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(SalesOrganisation salesOrganisation) selected,
    required TResult Function(List<SalesOrganisation> salesOrganisations)
        loadSavedOrganisation,
    required TResult Function(List<SalesOrganisation> avialableSalesOrgList)
        fetchAvailableSalesOrg,
    required TResult Function(
            SearchKey searchKey, List<SalesOrganisation> salesOrgList)
        searchSalesOrg,
  }) {
    return searchSalesOrg(searchKey, salesOrgList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(SalesOrganisation salesOrganisation)? selected,
    TResult? Function(List<SalesOrganisation> salesOrganisations)?
        loadSavedOrganisation,
    TResult? Function(List<SalesOrganisation> avialableSalesOrgList)?
        fetchAvailableSalesOrg,
    TResult? Function(
            SearchKey searchKey, List<SalesOrganisation> salesOrgList)?
        searchSalesOrg,
  }) {
    return searchSalesOrg?.call(searchKey, salesOrgList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(SalesOrganisation salesOrganisation)? selected,
    TResult Function(List<SalesOrganisation> salesOrganisations)?
        loadSavedOrganisation,
    TResult Function(List<SalesOrganisation> avialableSalesOrgList)?
        fetchAvailableSalesOrg,
    TResult Function(SearchKey searchKey, List<SalesOrganisation> salesOrgList)?
        searchSalesOrg,
    required TResult orElse(),
  }) {
    if (searchSalesOrg != null) {
      return searchSalesOrg(searchKey, salesOrgList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Selected value) selected,
    required TResult Function(_LoadSavedOrganisation value)
        loadSavedOrganisation,
    required TResult Function(_FetchAvailableSalesOrg value)
        fetchAvailableSalesOrg,
    required TResult Function(_SearchSalesOrg value) searchSalesOrg,
  }) {
    return searchSalesOrg(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Selected value)? selected,
    TResult? Function(_LoadSavedOrganisation value)? loadSavedOrganisation,
    TResult? Function(_FetchAvailableSalesOrg value)? fetchAvailableSalesOrg,
    TResult? Function(_SearchSalesOrg value)? searchSalesOrg,
  }) {
    return searchSalesOrg?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Selected value)? selected,
    TResult Function(_LoadSavedOrganisation value)? loadSavedOrganisation,
    TResult Function(_FetchAvailableSalesOrg value)? fetchAvailableSalesOrg,
    TResult Function(_SearchSalesOrg value)? searchSalesOrg,
    required TResult orElse(),
  }) {
    if (searchSalesOrg != null) {
      return searchSalesOrg(this);
    }
    return orElse();
  }
}

abstract class _SearchSalesOrg implements SalesOrgEvent {
  const factory _SearchSalesOrg(
          {required final SearchKey searchKey,
          required final List<SalesOrganisation> salesOrgList}) =
      _$SearchSalesOrgImpl;

  SearchKey get searchKey;
  List<SalesOrganisation> get salesOrgList;
  @JsonKey(ignore: true)
  _$$SearchSalesOrgImplCopyWith<_$SearchSalesOrgImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SalesOrgState {
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  SalesOrganisationConfigs get configs => throw _privateConstructorUsedError;
  List<SalesOrganisation> get availableSalesOrg =>
      throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get salesOrgFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  SearchKey get searchKey => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SalesOrgStateCopyWith<SalesOrgState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrgStateCopyWith<$Res> {
  factory $SalesOrgStateCopyWith(
          SalesOrgState value, $Res Function(SalesOrgState) then) =
      _$SalesOrgStateCopyWithImpl<$Res, SalesOrgState>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs configs,
      List<SalesOrganisation> availableSalesOrg,
      Option<Either<ApiFailure, dynamic>> salesOrgFailureOrSuccessOption,
      bool isLoading,
      SearchKey searchKey});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $SalesOrganisationConfigsCopyWith<$Res> get configs;
}

/// @nodoc
class _$SalesOrgStateCopyWithImpl<$Res, $Val extends SalesOrgState>
    implements $SalesOrgStateCopyWith<$Res> {
  _$SalesOrgStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? configs = null,
    Object? availableSalesOrg = null,
    Object? salesOrgFailureOrSuccessOption = null,
    Object? isLoading = null,
    Object? searchKey = null,
  }) {
    return _then(_value.copyWith(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      configs: null == configs
          ? _value.configs
          : configs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      availableSalesOrg: null == availableSalesOrg
          ? _value.availableSalesOrg
          : availableSalesOrg // ignore: cast_nullable_to_non_nullable
              as List<SalesOrganisation>,
      salesOrgFailureOrSuccessOption: null == salesOrgFailureOrSuccessOption
          ? _value.salesOrgFailureOrSuccessOption
          : salesOrgFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationCopyWith<$Res> get salesOrganisation {
    return $SalesOrganisationCopyWith<$Res>(_value.salesOrganisation, (value) {
      return _then(_value.copyWith(salesOrganisation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrganisationConfigsCopyWith<$Res> get configs {
    return $SalesOrganisationConfigsCopyWith<$Res>(_value.configs, (value) {
      return _then(_value.copyWith(configs: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SalesOrgStateImplCopyWith<$Res>
    implements $SalesOrgStateCopyWith<$Res> {
  factory _$$SalesOrgStateImplCopyWith(
          _$SalesOrgStateImpl value, $Res Function(_$SalesOrgStateImpl) then) =
      __$$SalesOrgStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      SalesOrganisationConfigs configs,
      List<SalesOrganisation> availableSalesOrg,
      Option<Either<ApiFailure, dynamic>> salesOrgFailureOrSuccessOption,
      bool isLoading,
      SearchKey searchKey});

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $SalesOrganisationConfigsCopyWith<$Res> get configs;
}

/// @nodoc
class __$$SalesOrgStateImplCopyWithImpl<$Res>
    extends _$SalesOrgStateCopyWithImpl<$Res, _$SalesOrgStateImpl>
    implements _$$SalesOrgStateImplCopyWith<$Res> {
  __$$SalesOrgStateImplCopyWithImpl(
      _$SalesOrgStateImpl _value, $Res Function(_$SalesOrgStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? configs = null,
    Object? availableSalesOrg = null,
    Object? salesOrgFailureOrSuccessOption = null,
    Object? isLoading = null,
    Object? searchKey = null,
  }) {
    return _then(_$SalesOrgStateImpl(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      configs: null == configs
          ? _value.configs
          : configs // ignore: cast_nullable_to_non_nullable
              as SalesOrganisationConfigs,
      availableSalesOrg: null == availableSalesOrg
          ? _value._availableSalesOrg
          : availableSalesOrg // ignore: cast_nullable_to_non_nullable
              as List<SalesOrganisation>,
      salesOrgFailureOrSuccessOption: null == salesOrgFailureOrSuccessOption
          ? _value.salesOrgFailureOrSuccessOption
          : salesOrgFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      searchKey: null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as SearchKey,
    ));
  }
}

/// @nodoc

class _$SalesOrgStateImpl extends _SalesOrgState {
  const _$SalesOrgStateImpl(
      {required this.salesOrganisation,
      required this.configs,
      required final List<SalesOrganisation> availableSalesOrg,
      required this.salesOrgFailureOrSuccessOption,
      required this.isLoading,
      required this.searchKey})
      : _availableSalesOrg = availableSalesOrg,
        super._();

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final SalesOrganisationConfigs configs;
  final List<SalesOrganisation> _availableSalesOrg;
  @override
  List<SalesOrganisation> get availableSalesOrg {
    if (_availableSalesOrg is EqualUnmodifiableListView)
      return _availableSalesOrg;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableSalesOrg);
  }

  @override
  final Option<Either<ApiFailure, dynamic>> salesOrgFailureOrSuccessOption;
  @override
  final bool isLoading;
  @override
  final SearchKey searchKey;

  @override
  String toString() {
    return 'SalesOrgState(salesOrganisation: $salesOrganisation, configs: $configs, availableSalesOrg: $availableSalesOrg, salesOrgFailureOrSuccessOption: $salesOrgFailureOrSuccessOption, isLoading: $isLoading, searchKey: $searchKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesOrgStateImpl &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.configs, configs) || other.configs == configs) &&
            const DeepCollectionEquality()
                .equals(other._availableSalesOrg, _availableSalesOrg) &&
            (identical(other.salesOrgFailureOrSuccessOption,
                    salesOrgFailureOrSuccessOption) ||
                other.salesOrgFailureOrSuccessOption ==
                    salesOrgFailureOrSuccessOption) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      salesOrganisation,
      configs,
      const DeepCollectionEquality().hash(_availableSalesOrg),
      salesOrgFailureOrSuccessOption,
      isLoading,
      searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesOrgStateImplCopyWith<_$SalesOrgStateImpl> get copyWith =>
      __$$SalesOrgStateImplCopyWithImpl<_$SalesOrgStateImpl>(this, _$identity);
}

abstract class _SalesOrgState extends SalesOrgState {
  const factory _SalesOrgState(
      {required final SalesOrganisation salesOrganisation,
      required final SalesOrganisationConfigs configs,
      required final List<SalesOrganisation> availableSalesOrg,
      required final Option<Either<ApiFailure, dynamic>>
          salesOrgFailureOrSuccessOption,
      required final bool isLoading,
      required final SearchKey searchKey}) = _$SalesOrgStateImpl;
  const _SalesOrgState._() : super._();

  @override
  SalesOrganisation get salesOrganisation;
  @override
  SalesOrganisationConfigs get configs;
  @override
  List<SalesOrganisation> get availableSalesOrg;
  @override
  Option<Either<ApiFailure, dynamic>> get salesOrgFailureOrSuccessOption;
  @override
  bool get isLoading;
  @override
  SearchKey get searchKey;
  @override
  @JsonKey(ignore: true)
  _$$SalesOrgStateImplCopyWith<_$SalesOrgStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

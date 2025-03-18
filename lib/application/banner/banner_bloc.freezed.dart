// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banner_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BannerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(
            bool isPreSalesOrg,
            SalesOrganisation salesOrganisation,
            String country,
            String role,
            String bannerType,
            String branchCode,
            String targetCustomerType)
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            bool isPreSalesOrg,
            SalesOrganisation salesOrganisation,
            String country,
            String role,
            String bannerType,
            String branchCode,
            String targetCustomerType)?
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            bool isPreSalesOrg,
            SalesOrganisation salesOrganisation,
            String country,
            String role,
            String bannerType,
            String branchCode,
            String targetCustomerType)?
        fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerEventCopyWith<$Res> {
  factory $BannerEventCopyWith(
          BannerEvent value, $Res Function(BannerEvent) then) =
      _$BannerEventCopyWithImpl<$Res, BannerEvent>;
}

/// @nodoc
class _$BannerEventCopyWithImpl<$Res, $Val extends BannerEvent>
    implements $BannerEventCopyWith<$Res> {
  _$BannerEventCopyWithImpl(this._value, this._then);

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
    extends _$BannerEventCopyWithImpl<$Res, _$InitializedImpl>
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
    return 'BannerEvent.initialized()';
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
            bool isPreSalesOrg,
            SalesOrganisation salesOrganisation,
            String country,
            String role,
            String bannerType,
            String branchCode,
            String targetCustomerType)
        fetch,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            bool isPreSalesOrg,
            SalesOrganisation salesOrganisation,
            String country,
            String role,
            String bannerType,
            String branchCode,
            String targetCustomerType)?
        fetch,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            bool isPreSalesOrg,
            SalesOrganisation salesOrganisation,
            String country,
            String role,
            String bannerType,
            String branchCode,
            String targetCustomerType)?
        fetch,
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
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements BannerEvent {
  const factory _Initialized() = _$InitializedImpl;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {bool isPreSalesOrg,
      SalesOrganisation salesOrganisation,
      String country,
      String role,
      String bannerType,
      String branchCode,
      String targetCustomerType});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$BannerEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPreSalesOrg = null,
    Object? salesOrganisation = null,
    Object? country = null,
    Object? role = null,
    Object? bannerType = null,
    Object? branchCode = null,
    Object? targetCustomerType = null,
  }) {
    return _then(_$FetchImpl(
      isPreSalesOrg: null == isPreSalesOrg
          ? _value.isPreSalesOrg
          : isPreSalesOrg // ignore: cast_nullable_to_non_nullable
              as bool,
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      bannerType: null == bannerType
          ? _value.bannerType
          : bannerType // ignore: cast_nullable_to_non_nullable
              as String,
      branchCode: null == branchCode
          ? _value.branchCode
          : branchCode // ignore: cast_nullable_to_non_nullable
              as String,
      targetCustomerType: null == targetCustomerType
          ? _value.targetCustomerType
          : targetCustomerType // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$FetchImpl implements _Fetch {
  const _$FetchImpl(
      {required this.isPreSalesOrg,
      required this.salesOrganisation,
      required this.country,
      required this.role,
      required this.bannerType,
      required this.branchCode,
      required this.targetCustomerType});

  @override
  final bool isPreSalesOrg;
  @override
  final SalesOrganisation salesOrganisation;
  @override
  final String country;
  @override
  final String role;
  @override
  final String bannerType;
  @override
  final String branchCode;
  @override
  final String targetCustomerType;

  @override
  String toString() {
    return 'BannerEvent.fetch(isPreSalesOrg: $isPreSalesOrg, salesOrganisation: $salesOrganisation, country: $country, role: $role, bannerType: $bannerType, branchCode: $branchCode, targetCustomerType: $targetCustomerType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.isPreSalesOrg, isPreSalesOrg) ||
                other.isPreSalesOrg == isPreSalesOrg) &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.bannerType, bannerType) ||
                other.bannerType == bannerType) &&
            (identical(other.branchCode, branchCode) ||
                other.branchCode == branchCode) &&
            (identical(other.targetCustomerType, targetCustomerType) ||
                other.targetCustomerType == targetCustomerType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isPreSalesOrg, salesOrganisation,
      country, role, bannerType, branchCode, targetCustomerType);

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
            bool isPreSalesOrg,
            SalesOrganisation salesOrganisation,
            String country,
            String role,
            String bannerType,
            String branchCode,
            String targetCustomerType)
        fetch,
  }) {
    return fetch(isPreSalesOrg, salesOrganisation, country, role, bannerType,
        branchCode, targetCustomerType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(
            bool isPreSalesOrg,
            SalesOrganisation salesOrganisation,
            String country,
            String role,
            String bannerType,
            String branchCode,
            String targetCustomerType)?
        fetch,
  }) {
    return fetch?.call(isPreSalesOrg, salesOrganisation, country, role,
        bannerType, branchCode, targetCustomerType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(
            bool isPreSalesOrg,
            SalesOrganisation salesOrganisation,
            String country,
            String role,
            String bannerType,
            String branchCode,
            String targetCustomerType)?
        fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(isPreSalesOrg, salesOrganisation, country, role, bannerType,
          branchCode, targetCustomerType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements BannerEvent {
  const factory _Fetch(
      {required final bool isPreSalesOrg,
      required final SalesOrganisation salesOrganisation,
      required final String country,
      required final String role,
      required final String bannerType,
      required final String branchCode,
      required final String targetCustomerType}) = _$FetchImpl;

  bool get isPreSalesOrg;
  SalesOrganisation get salesOrganisation;
  String get country;
  String get role;
  String get bannerType;
  String get branchCode;
  String get targetCustomerType;
  @JsonKey(ignore: true)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BannerState {
  List<EZReachBanner> get banner => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get bannerFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BannerStateCopyWith<BannerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerStateCopyWith<$Res> {
  factory $BannerStateCopyWith(
          BannerState value, $Res Function(BannerState) then) =
      _$BannerStateCopyWithImpl<$Res, BannerState>;
  @useResult
  $Res call(
      {List<EZReachBanner> banner,
      Option<Either<ApiFailure, dynamic>> bannerFailureOrSuccessOption,
      bool isLoading});
}

/// @nodoc
class _$BannerStateCopyWithImpl<$Res, $Val extends BannerState>
    implements $BannerStateCopyWith<$Res> {
  _$BannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? banner = null,
    Object? bannerFailureOrSuccessOption = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      banner: null == banner
          ? _value.banner
          : banner // ignore: cast_nullable_to_non_nullable
              as List<EZReachBanner>,
      bannerFailureOrSuccessOption: null == bannerFailureOrSuccessOption
          ? _value.bannerFailureOrSuccessOption
          : bannerFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BannerStateImplCopyWith<$Res>
    implements $BannerStateCopyWith<$Res> {
  factory _$$BannerStateImplCopyWith(
          _$BannerStateImpl value, $Res Function(_$BannerStateImpl) then) =
      __$$BannerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<EZReachBanner> banner,
      Option<Either<ApiFailure, dynamic>> bannerFailureOrSuccessOption,
      bool isLoading});
}

/// @nodoc
class __$$BannerStateImplCopyWithImpl<$Res>
    extends _$BannerStateCopyWithImpl<$Res, _$BannerStateImpl>
    implements _$$BannerStateImplCopyWith<$Res> {
  __$$BannerStateImplCopyWithImpl(
      _$BannerStateImpl _value, $Res Function(_$BannerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? banner = null,
    Object? bannerFailureOrSuccessOption = null,
    Object? isLoading = null,
  }) {
    return _then(_$BannerStateImpl(
      banner: null == banner
          ? _value._banner
          : banner // ignore: cast_nullable_to_non_nullable
              as List<EZReachBanner>,
      bannerFailureOrSuccessOption: null == bannerFailureOrSuccessOption
          ? _value.bannerFailureOrSuccessOption
          : bannerFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BannerStateImpl extends _BannerState {
  const _$BannerStateImpl(
      {required final List<EZReachBanner> banner,
      required this.bannerFailureOrSuccessOption,
      required this.isLoading})
      : _banner = banner,
        super._();

  final List<EZReachBanner> _banner;
  @override
  List<EZReachBanner> get banner {
    if (_banner is EqualUnmodifiableListView) return _banner;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banner);
  }

  @override
  final Option<Either<ApiFailure, dynamic>> bannerFailureOrSuccessOption;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'BannerState(banner: $banner, bannerFailureOrSuccessOption: $bannerFailureOrSuccessOption, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannerStateImpl &&
            const DeepCollectionEquality().equals(other._banner, _banner) &&
            (identical(other.bannerFailureOrSuccessOption,
                    bannerFailureOrSuccessOption) ||
                other.bannerFailureOrSuccessOption ==
                    bannerFailureOrSuccessOption) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_banner),
      bannerFailureOrSuccessOption,
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BannerStateImplCopyWith<_$BannerStateImpl> get copyWith =>
      __$$BannerStateImplCopyWithImpl<_$BannerStateImpl>(this, _$identity);
}

abstract class _BannerState extends BannerState {
  const factory _BannerState(
      {required final List<EZReachBanner> banner,
      required final Option<Either<ApiFailure, dynamic>>
          bannerFailureOrSuccessOption,
      required final bool isLoading}) = _$BannerStateImpl;
  const _BannerState._() : super._();

  @override
  List<EZReachBanner> get banner;
  @override
  Option<Either<ApiFailure, dynamic>> get bannerFailureOrSuccessOption;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$BannerStateImplCopyWith<_$BannerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_claim_submission_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewClaimSubmissionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function() fetchPrincipalList,
    required TResult Function(PrincipalData principal) onSelectPrincipal,
    required TResult Function(ClaimType claimType) onSelectClaimType,
    required TResult Function(double amount) onClaimAmountChange,
    required TResult Function(String claimDetails) onClaimDetailsChange,
    required TResult Function(List<PlatformFile> poDocuments) addPoDocument,
    required TResult Function(PlatformFile poDocument) removePoDocument,
    required TResult Function(User user, CustomerCodeInfo customerCodeInfo)
        submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function()? fetchPrincipalList,
    TResult? Function(PrincipalData principal)? onSelectPrincipal,
    TResult? Function(ClaimType claimType)? onSelectClaimType,
    TResult? Function(double amount)? onClaimAmountChange,
    TResult? Function(String claimDetails)? onClaimDetailsChange,
    TResult? Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult? Function(PlatformFile poDocument)? removePoDocument,
    TResult? Function(User user, CustomerCodeInfo customerCodeInfo)? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function()? fetchPrincipalList,
    TResult Function(PrincipalData principal)? onSelectPrincipal,
    TResult Function(ClaimType claimType)? onSelectClaimType,
    TResult Function(double amount)? onClaimAmountChange,
    TResult Function(String claimDetails)? onClaimDetailsChange,
    TResult Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult Function(PlatformFile poDocument)? removePoDocument,
    TResult Function(User user, CustomerCodeInfo customerCodeInfo)? submit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchPrincipalList value) fetchPrincipalList,
    required TResult Function(_OnSelectPrincipal value) onSelectPrincipal,
    required TResult Function(_OnSelectClaimType value) onSelectClaimType,
    required TResult Function(_OnClaimAmountChange value) onClaimAmountChange,
    required TResult Function(_OnClaimDetailsChange value) onClaimDetailsChange,
    required TResult Function(_AddPoDocument value) addPoDocument,
    required TResult Function(_RemovePoDocument value) removePoDocument,
    required TResult Function(_Submit value) submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchPrincipalList value)? fetchPrincipalList,
    TResult? Function(_OnSelectPrincipal value)? onSelectPrincipal,
    TResult? Function(_OnSelectClaimType value)? onSelectClaimType,
    TResult? Function(_OnClaimAmountChange value)? onClaimAmountChange,
    TResult? Function(_OnClaimDetailsChange value)? onClaimDetailsChange,
    TResult? Function(_AddPoDocument value)? addPoDocument,
    TResult? Function(_RemovePoDocument value)? removePoDocument,
    TResult? Function(_Submit value)? submit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchPrincipalList value)? fetchPrincipalList,
    TResult Function(_OnSelectPrincipal value)? onSelectPrincipal,
    TResult Function(_OnSelectClaimType value)? onSelectClaimType,
    TResult Function(_OnClaimAmountChange value)? onClaimAmountChange,
    TResult Function(_OnClaimDetailsChange value)? onClaimDetailsChange,
    TResult Function(_AddPoDocument value)? addPoDocument,
    TResult Function(_RemovePoDocument value)? removePoDocument,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewClaimSubmissionEventCopyWith<$Res> {
  factory $NewClaimSubmissionEventCopyWith(NewClaimSubmissionEvent value,
          $Res Function(NewClaimSubmissionEvent) then) =
      _$NewClaimSubmissionEventCopyWithImpl<$Res, NewClaimSubmissionEvent>;
}

/// @nodoc
class _$NewClaimSubmissionEventCopyWithImpl<$Res,
        $Val extends NewClaimSubmissionEvent>
    implements $NewClaimSubmissionEventCopyWith<$Res> {
  _$NewClaimSubmissionEventCopyWithImpl(this._value, this._then);

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
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation, CustomerCodeInfo customerCodeInfo});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$initializedImplCopyWithImpl<$Res>
    extends _$NewClaimSubmissionEventCopyWithImpl<$Res, _$initializedImpl>
    implements _$$initializedImplCopyWith<$Res> {
  __$$initializedImplCopyWithImpl(
      _$initializedImpl _value, $Res Function(_$initializedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
  }) {
    return _then(_$initializedImpl(
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

class _$initializedImpl implements _initialized {
  const _$initializedImpl(
      {required this.salesOrganisation, required this.customerCodeInfo});

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;

  @override
  String toString() {
    return 'NewClaimSubmissionEvent.initialized(salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$initializedImpl &&
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
  _$$initializedImplCopyWith<_$initializedImpl> get copyWith =>
      __$$initializedImplCopyWithImpl<_$initializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function() fetchPrincipalList,
    required TResult Function(PrincipalData principal) onSelectPrincipal,
    required TResult Function(ClaimType claimType) onSelectClaimType,
    required TResult Function(double amount) onClaimAmountChange,
    required TResult Function(String claimDetails) onClaimDetailsChange,
    required TResult Function(List<PlatformFile> poDocuments) addPoDocument,
    required TResult Function(PlatformFile poDocument) removePoDocument,
    required TResult Function(User user, CustomerCodeInfo customerCodeInfo)
        submit,
  }) {
    return initialized(salesOrganisation, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function()? fetchPrincipalList,
    TResult? Function(PrincipalData principal)? onSelectPrincipal,
    TResult? Function(ClaimType claimType)? onSelectClaimType,
    TResult? Function(double amount)? onClaimAmountChange,
    TResult? Function(String claimDetails)? onClaimDetailsChange,
    TResult? Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult? Function(PlatformFile poDocument)? removePoDocument,
    TResult? Function(User user, CustomerCodeInfo customerCodeInfo)? submit,
  }) {
    return initialized?.call(salesOrganisation, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function()? fetchPrincipalList,
    TResult Function(PrincipalData principal)? onSelectPrincipal,
    TResult Function(ClaimType claimType)? onSelectClaimType,
    TResult Function(double amount)? onClaimAmountChange,
    TResult Function(String claimDetails)? onClaimDetailsChange,
    TResult Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult Function(PlatformFile poDocument)? removePoDocument,
    TResult Function(User user, CustomerCodeInfo customerCodeInfo)? submit,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(salesOrganisation, customerCodeInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchPrincipalList value) fetchPrincipalList,
    required TResult Function(_OnSelectPrincipal value) onSelectPrincipal,
    required TResult Function(_OnSelectClaimType value) onSelectClaimType,
    required TResult Function(_OnClaimAmountChange value) onClaimAmountChange,
    required TResult Function(_OnClaimDetailsChange value) onClaimDetailsChange,
    required TResult Function(_AddPoDocument value) addPoDocument,
    required TResult Function(_RemovePoDocument value) removePoDocument,
    required TResult Function(_Submit value) submit,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchPrincipalList value)? fetchPrincipalList,
    TResult? Function(_OnSelectPrincipal value)? onSelectPrincipal,
    TResult? Function(_OnSelectClaimType value)? onSelectClaimType,
    TResult? Function(_OnClaimAmountChange value)? onClaimAmountChange,
    TResult? Function(_OnClaimDetailsChange value)? onClaimDetailsChange,
    TResult? Function(_AddPoDocument value)? addPoDocument,
    TResult? Function(_RemovePoDocument value)? removePoDocument,
    TResult? Function(_Submit value)? submit,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchPrincipalList value)? fetchPrincipalList,
    TResult Function(_OnSelectPrincipal value)? onSelectPrincipal,
    TResult Function(_OnSelectClaimType value)? onSelectClaimType,
    TResult Function(_OnClaimAmountChange value)? onClaimAmountChange,
    TResult Function(_OnClaimDetailsChange value)? onClaimDetailsChange,
    TResult Function(_AddPoDocument value)? addPoDocument,
    TResult Function(_RemovePoDocument value)? removePoDocument,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _initialized implements NewClaimSubmissionEvent {
  const factory _initialized(
      {required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo}) = _$initializedImpl;

  SalesOrganisation get salesOrganisation;
  CustomerCodeInfo get customerCodeInfo;
  @JsonKey(ignore: true)
  _$$initializedImplCopyWith<_$initializedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchPrincipalListImplCopyWith<$Res> {
  factory _$$FetchPrincipalListImplCopyWith(_$FetchPrincipalListImpl value,
          $Res Function(_$FetchPrincipalListImpl) then) =
      __$$FetchPrincipalListImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchPrincipalListImplCopyWithImpl<$Res>
    extends _$NewClaimSubmissionEventCopyWithImpl<$Res,
        _$FetchPrincipalListImpl>
    implements _$$FetchPrincipalListImplCopyWith<$Res> {
  __$$FetchPrincipalListImplCopyWithImpl(_$FetchPrincipalListImpl _value,
      $Res Function(_$FetchPrincipalListImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchPrincipalListImpl implements _FetchPrincipalList {
  const _$FetchPrincipalListImpl();

  @override
  String toString() {
    return 'NewClaimSubmissionEvent.fetchPrincipalList()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchPrincipalListImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function() fetchPrincipalList,
    required TResult Function(PrincipalData principal) onSelectPrincipal,
    required TResult Function(ClaimType claimType) onSelectClaimType,
    required TResult Function(double amount) onClaimAmountChange,
    required TResult Function(String claimDetails) onClaimDetailsChange,
    required TResult Function(List<PlatformFile> poDocuments) addPoDocument,
    required TResult Function(PlatformFile poDocument) removePoDocument,
    required TResult Function(User user, CustomerCodeInfo customerCodeInfo)
        submit,
  }) {
    return fetchPrincipalList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function()? fetchPrincipalList,
    TResult? Function(PrincipalData principal)? onSelectPrincipal,
    TResult? Function(ClaimType claimType)? onSelectClaimType,
    TResult? Function(double amount)? onClaimAmountChange,
    TResult? Function(String claimDetails)? onClaimDetailsChange,
    TResult? Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult? Function(PlatformFile poDocument)? removePoDocument,
    TResult? Function(User user, CustomerCodeInfo customerCodeInfo)? submit,
  }) {
    return fetchPrincipalList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function()? fetchPrincipalList,
    TResult Function(PrincipalData principal)? onSelectPrincipal,
    TResult Function(ClaimType claimType)? onSelectClaimType,
    TResult Function(double amount)? onClaimAmountChange,
    TResult Function(String claimDetails)? onClaimDetailsChange,
    TResult Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult Function(PlatformFile poDocument)? removePoDocument,
    TResult Function(User user, CustomerCodeInfo customerCodeInfo)? submit,
    required TResult orElse(),
  }) {
    if (fetchPrincipalList != null) {
      return fetchPrincipalList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchPrincipalList value) fetchPrincipalList,
    required TResult Function(_OnSelectPrincipal value) onSelectPrincipal,
    required TResult Function(_OnSelectClaimType value) onSelectClaimType,
    required TResult Function(_OnClaimAmountChange value) onClaimAmountChange,
    required TResult Function(_OnClaimDetailsChange value) onClaimDetailsChange,
    required TResult Function(_AddPoDocument value) addPoDocument,
    required TResult Function(_RemovePoDocument value) removePoDocument,
    required TResult Function(_Submit value) submit,
  }) {
    return fetchPrincipalList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchPrincipalList value)? fetchPrincipalList,
    TResult? Function(_OnSelectPrincipal value)? onSelectPrincipal,
    TResult? Function(_OnSelectClaimType value)? onSelectClaimType,
    TResult? Function(_OnClaimAmountChange value)? onClaimAmountChange,
    TResult? Function(_OnClaimDetailsChange value)? onClaimDetailsChange,
    TResult? Function(_AddPoDocument value)? addPoDocument,
    TResult? Function(_RemovePoDocument value)? removePoDocument,
    TResult? Function(_Submit value)? submit,
  }) {
    return fetchPrincipalList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchPrincipalList value)? fetchPrincipalList,
    TResult Function(_OnSelectPrincipal value)? onSelectPrincipal,
    TResult Function(_OnSelectClaimType value)? onSelectClaimType,
    TResult Function(_OnClaimAmountChange value)? onClaimAmountChange,
    TResult Function(_OnClaimDetailsChange value)? onClaimDetailsChange,
    TResult Function(_AddPoDocument value)? addPoDocument,
    TResult Function(_RemovePoDocument value)? removePoDocument,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (fetchPrincipalList != null) {
      return fetchPrincipalList(this);
    }
    return orElse();
  }
}

abstract class _FetchPrincipalList implements NewClaimSubmissionEvent {
  const factory _FetchPrincipalList() = _$FetchPrincipalListImpl;
}

/// @nodoc
abstract class _$$OnSelectPrincipalImplCopyWith<$Res> {
  factory _$$OnSelectPrincipalImplCopyWith(_$OnSelectPrincipalImpl value,
          $Res Function(_$OnSelectPrincipalImpl) then) =
      __$$OnSelectPrincipalImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PrincipalData principal});

  $PrincipalDataCopyWith<$Res> get principal;
}

/// @nodoc
class __$$OnSelectPrincipalImplCopyWithImpl<$Res>
    extends _$NewClaimSubmissionEventCopyWithImpl<$Res, _$OnSelectPrincipalImpl>
    implements _$$OnSelectPrincipalImplCopyWith<$Res> {
  __$$OnSelectPrincipalImplCopyWithImpl(_$OnSelectPrincipalImpl _value,
      $Res Function(_$OnSelectPrincipalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? principal = null,
  }) {
    return _then(_$OnSelectPrincipalImpl(
      principal: null == principal
          ? _value.principal
          : principal // ignore: cast_nullable_to_non_nullable
              as PrincipalData,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PrincipalDataCopyWith<$Res> get principal {
    return $PrincipalDataCopyWith<$Res>(_value.principal, (value) {
      return _then(_value.copyWith(principal: value));
    });
  }
}

/// @nodoc

class _$OnSelectPrincipalImpl implements _OnSelectPrincipal {
  const _$OnSelectPrincipalImpl({required this.principal});

  @override
  final PrincipalData principal;

  @override
  String toString() {
    return 'NewClaimSubmissionEvent.onSelectPrincipal(principal: $principal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnSelectPrincipalImpl &&
            (identical(other.principal, principal) ||
                other.principal == principal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, principal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnSelectPrincipalImplCopyWith<_$OnSelectPrincipalImpl> get copyWith =>
      __$$OnSelectPrincipalImplCopyWithImpl<_$OnSelectPrincipalImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function() fetchPrincipalList,
    required TResult Function(PrincipalData principal) onSelectPrincipal,
    required TResult Function(ClaimType claimType) onSelectClaimType,
    required TResult Function(double amount) onClaimAmountChange,
    required TResult Function(String claimDetails) onClaimDetailsChange,
    required TResult Function(List<PlatformFile> poDocuments) addPoDocument,
    required TResult Function(PlatformFile poDocument) removePoDocument,
    required TResult Function(User user, CustomerCodeInfo customerCodeInfo)
        submit,
  }) {
    return onSelectPrincipal(principal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function()? fetchPrincipalList,
    TResult? Function(PrincipalData principal)? onSelectPrincipal,
    TResult? Function(ClaimType claimType)? onSelectClaimType,
    TResult? Function(double amount)? onClaimAmountChange,
    TResult? Function(String claimDetails)? onClaimDetailsChange,
    TResult? Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult? Function(PlatformFile poDocument)? removePoDocument,
    TResult? Function(User user, CustomerCodeInfo customerCodeInfo)? submit,
  }) {
    return onSelectPrincipal?.call(principal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function()? fetchPrincipalList,
    TResult Function(PrincipalData principal)? onSelectPrincipal,
    TResult Function(ClaimType claimType)? onSelectClaimType,
    TResult Function(double amount)? onClaimAmountChange,
    TResult Function(String claimDetails)? onClaimDetailsChange,
    TResult Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult Function(PlatformFile poDocument)? removePoDocument,
    TResult Function(User user, CustomerCodeInfo customerCodeInfo)? submit,
    required TResult orElse(),
  }) {
    if (onSelectPrincipal != null) {
      return onSelectPrincipal(principal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchPrincipalList value) fetchPrincipalList,
    required TResult Function(_OnSelectPrincipal value) onSelectPrincipal,
    required TResult Function(_OnSelectClaimType value) onSelectClaimType,
    required TResult Function(_OnClaimAmountChange value) onClaimAmountChange,
    required TResult Function(_OnClaimDetailsChange value) onClaimDetailsChange,
    required TResult Function(_AddPoDocument value) addPoDocument,
    required TResult Function(_RemovePoDocument value) removePoDocument,
    required TResult Function(_Submit value) submit,
  }) {
    return onSelectPrincipal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchPrincipalList value)? fetchPrincipalList,
    TResult? Function(_OnSelectPrincipal value)? onSelectPrincipal,
    TResult? Function(_OnSelectClaimType value)? onSelectClaimType,
    TResult? Function(_OnClaimAmountChange value)? onClaimAmountChange,
    TResult? Function(_OnClaimDetailsChange value)? onClaimDetailsChange,
    TResult? Function(_AddPoDocument value)? addPoDocument,
    TResult? Function(_RemovePoDocument value)? removePoDocument,
    TResult? Function(_Submit value)? submit,
  }) {
    return onSelectPrincipal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchPrincipalList value)? fetchPrincipalList,
    TResult Function(_OnSelectPrincipal value)? onSelectPrincipal,
    TResult Function(_OnSelectClaimType value)? onSelectClaimType,
    TResult Function(_OnClaimAmountChange value)? onClaimAmountChange,
    TResult Function(_OnClaimDetailsChange value)? onClaimDetailsChange,
    TResult Function(_AddPoDocument value)? addPoDocument,
    TResult Function(_RemovePoDocument value)? removePoDocument,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (onSelectPrincipal != null) {
      return onSelectPrincipal(this);
    }
    return orElse();
  }
}

abstract class _OnSelectPrincipal implements NewClaimSubmissionEvent {
  const factory _OnSelectPrincipal({required final PrincipalData principal}) =
      _$OnSelectPrincipalImpl;

  PrincipalData get principal;
  @JsonKey(ignore: true)
  _$$OnSelectPrincipalImplCopyWith<_$OnSelectPrincipalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnSelectClaimTypeImplCopyWith<$Res> {
  factory _$$OnSelectClaimTypeImplCopyWith(_$OnSelectClaimTypeImpl value,
          $Res Function(_$OnSelectClaimTypeImpl) then) =
      __$$OnSelectClaimTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ClaimType claimType});
}

/// @nodoc
class __$$OnSelectClaimTypeImplCopyWithImpl<$Res>
    extends _$NewClaimSubmissionEventCopyWithImpl<$Res, _$OnSelectClaimTypeImpl>
    implements _$$OnSelectClaimTypeImplCopyWith<$Res> {
  __$$OnSelectClaimTypeImplCopyWithImpl(_$OnSelectClaimTypeImpl _value,
      $Res Function(_$OnSelectClaimTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? claimType = null,
  }) {
    return _then(_$OnSelectClaimTypeImpl(
      claimType: null == claimType
          ? _value.claimType
          : claimType // ignore: cast_nullable_to_non_nullable
              as ClaimType,
    ));
  }
}

/// @nodoc

class _$OnSelectClaimTypeImpl implements _OnSelectClaimType {
  const _$OnSelectClaimTypeImpl({required this.claimType});

  @override
  final ClaimType claimType;

  @override
  String toString() {
    return 'NewClaimSubmissionEvent.onSelectClaimType(claimType: $claimType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnSelectClaimTypeImpl &&
            (identical(other.claimType, claimType) ||
                other.claimType == claimType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, claimType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnSelectClaimTypeImplCopyWith<_$OnSelectClaimTypeImpl> get copyWith =>
      __$$OnSelectClaimTypeImplCopyWithImpl<_$OnSelectClaimTypeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function() fetchPrincipalList,
    required TResult Function(PrincipalData principal) onSelectPrincipal,
    required TResult Function(ClaimType claimType) onSelectClaimType,
    required TResult Function(double amount) onClaimAmountChange,
    required TResult Function(String claimDetails) onClaimDetailsChange,
    required TResult Function(List<PlatformFile> poDocuments) addPoDocument,
    required TResult Function(PlatformFile poDocument) removePoDocument,
    required TResult Function(User user, CustomerCodeInfo customerCodeInfo)
        submit,
  }) {
    return onSelectClaimType(claimType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function()? fetchPrincipalList,
    TResult? Function(PrincipalData principal)? onSelectPrincipal,
    TResult? Function(ClaimType claimType)? onSelectClaimType,
    TResult? Function(double amount)? onClaimAmountChange,
    TResult? Function(String claimDetails)? onClaimDetailsChange,
    TResult? Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult? Function(PlatformFile poDocument)? removePoDocument,
    TResult? Function(User user, CustomerCodeInfo customerCodeInfo)? submit,
  }) {
    return onSelectClaimType?.call(claimType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function()? fetchPrincipalList,
    TResult Function(PrincipalData principal)? onSelectPrincipal,
    TResult Function(ClaimType claimType)? onSelectClaimType,
    TResult Function(double amount)? onClaimAmountChange,
    TResult Function(String claimDetails)? onClaimDetailsChange,
    TResult Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult Function(PlatformFile poDocument)? removePoDocument,
    TResult Function(User user, CustomerCodeInfo customerCodeInfo)? submit,
    required TResult orElse(),
  }) {
    if (onSelectClaimType != null) {
      return onSelectClaimType(claimType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchPrincipalList value) fetchPrincipalList,
    required TResult Function(_OnSelectPrincipal value) onSelectPrincipal,
    required TResult Function(_OnSelectClaimType value) onSelectClaimType,
    required TResult Function(_OnClaimAmountChange value) onClaimAmountChange,
    required TResult Function(_OnClaimDetailsChange value) onClaimDetailsChange,
    required TResult Function(_AddPoDocument value) addPoDocument,
    required TResult Function(_RemovePoDocument value) removePoDocument,
    required TResult Function(_Submit value) submit,
  }) {
    return onSelectClaimType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchPrincipalList value)? fetchPrincipalList,
    TResult? Function(_OnSelectPrincipal value)? onSelectPrincipal,
    TResult? Function(_OnSelectClaimType value)? onSelectClaimType,
    TResult? Function(_OnClaimAmountChange value)? onClaimAmountChange,
    TResult? Function(_OnClaimDetailsChange value)? onClaimDetailsChange,
    TResult? Function(_AddPoDocument value)? addPoDocument,
    TResult? Function(_RemovePoDocument value)? removePoDocument,
    TResult? Function(_Submit value)? submit,
  }) {
    return onSelectClaimType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchPrincipalList value)? fetchPrincipalList,
    TResult Function(_OnSelectPrincipal value)? onSelectPrincipal,
    TResult Function(_OnSelectClaimType value)? onSelectClaimType,
    TResult Function(_OnClaimAmountChange value)? onClaimAmountChange,
    TResult Function(_OnClaimDetailsChange value)? onClaimDetailsChange,
    TResult Function(_AddPoDocument value)? addPoDocument,
    TResult Function(_RemovePoDocument value)? removePoDocument,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (onSelectClaimType != null) {
      return onSelectClaimType(this);
    }
    return orElse();
  }
}

abstract class _OnSelectClaimType implements NewClaimSubmissionEvent {
  const factory _OnSelectClaimType({required final ClaimType claimType}) =
      _$OnSelectClaimTypeImpl;

  ClaimType get claimType;
  @JsonKey(ignore: true)
  _$$OnSelectClaimTypeImplCopyWith<_$OnSelectClaimTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnClaimAmountChangeImplCopyWith<$Res> {
  factory _$$OnClaimAmountChangeImplCopyWith(_$OnClaimAmountChangeImpl value,
          $Res Function(_$OnClaimAmountChangeImpl) then) =
      __$$OnClaimAmountChangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double amount});
}

/// @nodoc
class __$$OnClaimAmountChangeImplCopyWithImpl<$Res>
    extends _$NewClaimSubmissionEventCopyWithImpl<$Res,
        _$OnClaimAmountChangeImpl>
    implements _$$OnClaimAmountChangeImplCopyWith<$Res> {
  __$$OnClaimAmountChangeImplCopyWithImpl(_$OnClaimAmountChangeImpl _value,
      $Res Function(_$OnClaimAmountChangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_$OnClaimAmountChangeImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$OnClaimAmountChangeImpl implements _OnClaimAmountChange {
  const _$OnClaimAmountChangeImpl({required this.amount});

  @override
  final double amount;

  @override
  String toString() {
    return 'NewClaimSubmissionEvent.onClaimAmountChange(amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnClaimAmountChangeImpl &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnClaimAmountChangeImplCopyWith<_$OnClaimAmountChangeImpl> get copyWith =>
      __$$OnClaimAmountChangeImplCopyWithImpl<_$OnClaimAmountChangeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function() fetchPrincipalList,
    required TResult Function(PrincipalData principal) onSelectPrincipal,
    required TResult Function(ClaimType claimType) onSelectClaimType,
    required TResult Function(double amount) onClaimAmountChange,
    required TResult Function(String claimDetails) onClaimDetailsChange,
    required TResult Function(List<PlatformFile> poDocuments) addPoDocument,
    required TResult Function(PlatformFile poDocument) removePoDocument,
    required TResult Function(User user, CustomerCodeInfo customerCodeInfo)
        submit,
  }) {
    return onClaimAmountChange(amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function()? fetchPrincipalList,
    TResult? Function(PrincipalData principal)? onSelectPrincipal,
    TResult? Function(ClaimType claimType)? onSelectClaimType,
    TResult? Function(double amount)? onClaimAmountChange,
    TResult? Function(String claimDetails)? onClaimDetailsChange,
    TResult? Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult? Function(PlatformFile poDocument)? removePoDocument,
    TResult? Function(User user, CustomerCodeInfo customerCodeInfo)? submit,
  }) {
    return onClaimAmountChange?.call(amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function()? fetchPrincipalList,
    TResult Function(PrincipalData principal)? onSelectPrincipal,
    TResult Function(ClaimType claimType)? onSelectClaimType,
    TResult Function(double amount)? onClaimAmountChange,
    TResult Function(String claimDetails)? onClaimDetailsChange,
    TResult Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult Function(PlatformFile poDocument)? removePoDocument,
    TResult Function(User user, CustomerCodeInfo customerCodeInfo)? submit,
    required TResult orElse(),
  }) {
    if (onClaimAmountChange != null) {
      return onClaimAmountChange(amount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchPrincipalList value) fetchPrincipalList,
    required TResult Function(_OnSelectPrincipal value) onSelectPrincipal,
    required TResult Function(_OnSelectClaimType value) onSelectClaimType,
    required TResult Function(_OnClaimAmountChange value) onClaimAmountChange,
    required TResult Function(_OnClaimDetailsChange value) onClaimDetailsChange,
    required TResult Function(_AddPoDocument value) addPoDocument,
    required TResult Function(_RemovePoDocument value) removePoDocument,
    required TResult Function(_Submit value) submit,
  }) {
    return onClaimAmountChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchPrincipalList value)? fetchPrincipalList,
    TResult? Function(_OnSelectPrincipal value)? onSelectPrincipal,
    TResult? Function(_OnSelectClaimType value)? onSelectClaimType,
    TResult? Function(_OnClaimAmountChange value)? onClaimAmountChange,
    TResult? Function(_OnClaimDetailsChange value)? onClaimDetailsChange,
    TResult? Function(_AddPoDocument value)? addPoDocument,
    TResult? Function(_RemovePoDocument value)? removePoDocument,
    TResult? Function(_Submit value)? submit,
  }) {
    return onClaimAmountChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchPrincipalList value)? fetchPrincipalList,
    TResult Function(_OnSelectPrincipal value)? onSelectPrincipal,
    TResult Function(_OnSelectClaimType value)? onSelectClaimType,
    TResult Function(_OnClaimAmountChange value)? onClaimAmountChange,
    TResult Function(_OnClaimDetailsChange value)? onClaimDetailsChange,
    TResult Function(_AddPoDocument value)? addPoDocument,
    TResult Function(_RemovePoDocument value)? removePoDocument,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (onClaimAmountChange != null) {
      return onClaimAmountChange(this);
    }
    return orElse();
  }
}

abstract class _OnClaimAmountChange implements NewClaimSubmissionEvent {
  const factory _OnClaimAmountChange({required final double amount}) =
      _$OnClaimAmountChangeImpl;

  double get amount;
  @JsonKey(ignore: true)
  _$$OnClaimAmountChangeImplCopyWith<_$OnClaimAmountChangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnClaimDetailsChangeImplCopyWith<$Res> {
  factory _$$OnClaimDetailsChangeImplCopyWith(_$OnClaimDetailsChangeImpl value,
          $Res Function(_$OnClaimDetailsChangeImpl) then) =
      __$$OnClaimDetailsChangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String claimDetails});
}

/// @nodoc
class __$$OnClaimDetailsChangeImplCopyWithImpl<$Res>
    extends _$NewClaimSubmissionEventCopyWithImpl<$Res,
        _$OnClaimDetailsChangeImpl>
    implements _$$OnClaimDetailsChangeImplCopyWith<$Res> {
  __$$OnClaimDetailsChangeImplCopyWithImpl(_$OnClaimDetailsChangeImpl _value,
      $Res Function(_$OnClaimDetailsChangeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? claimDetails = null,
  }) {
    return _then(_$OnClaimDetailsChangeImpl(
      claimDetails: null == claimDetails
          ? _value.claimDetails
          : claimDetails // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnClaimDetailsChangeImpl implements _OnClaimDetailsChange {
  const _$OnClaimDetailsChangeImpl({required this.claimDetails});

  @override
  final String claimDetails;

  @override
  String toString() {
    return 'NewClaimSubmissionEvent.onClaimDetailsChange(claimDetails: $claimDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnClaimDetailsChangeImpl &&
            (identical(other.claimDetails, claimDetails) ||
                other.claimDetails == claimDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, claimDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnClaimDetailsChangeImplCopyWith<_$OnClaimDetailsChangeImpl>
      get copyWith =>
          __$$OnClaimDetailsChangeImplCopyWithImpl<_$OnClaimDetailsChangeImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function() fetchPrincipalList,
    required TResult Function(PrincipalData principal) onSelectPrincipal,
    required TResult Function(ClaimType claimType) onSelectClaimType,
    required TResult Function(double amount) onClaimAmountChange,
    required TResult Function(String claimDetails) onClaimDetailsChange,
    required TResult Function(List<PlatformFile> poDocuments) addPoDocument,
    required TResult Function(PlatformFile poDocument) removePoDocument,
    required TResult Function(User user, CustomerCodeInfo customerCodeInfo)
        submit,
  }) {
    return onClaimDetailsChange(claimDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function()? fetchPrincipalList,
    TResult? Function(PrincipalData principal)? onSelectPrincipal,
    TResult? Function(ClaimType claimType)? onSelectClaimType,
    TResult? Function(double amount)? onClaimAmountChange,
    TResult? Function(String claimDetails)? onClaimDetailsChange,
    TResult? Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult? Function(PlatformFile poDocument)? removePoDocument,
    TResult? Function(User user, CustomerCodeInfo customerCodeInfo)? submit,
  }) {
    return onClaimDetailsChange?.call(claimDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function()? fetchPrincipalList,
    TResult Function(PrincipalData principal)? onSelectPrincipal,
    TResult Function(ClaimType claimType)? onSelectClaimType,
    TResult Function(double amount)? onClaimAmountChange,
    TResult Function(String claimDetails)? onClaimDetailsChange,
    TResult Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult Function(PlatformFile poDocument)? removePoDocument,
    TResult Function(User user, CustomerCodeInfo customerCodeInfo)? submit,
    required TResult orElse(),
  }) {
    if (onClaimDetailsChange != null) {
      return onClaimDetailsChange(claimDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchPrincipalList value) fetchPrincipalList,
    required TResult Function(_OnSelectPrincipal value) onSelectPrincipal,
    required TResult Function(_OnSelectClaimType value) onSelectClaimType,
    required TResult Function(_OnClaimAmountChange value) onClaimAmountChange,
    required TResult Function(_OnClaimDetailsChange value) onClaimDetailsChange,
    required TResult Function(_AddPoDocument value) addPoDocument,
    required TResult Function(_RemovePoDocument value) removePoDocument,
    required TResult Function(_Submit value) submit,
  }) {
    return onClaimDetailsChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchPrincipalList value)? fetchPrincipalList,
    TResult? Function(_OnSelectPrincipal value)? onSelectPrincipal,
    TResult? Function(_OnSelectClaimType value)? onSelectClaimType,
    TResult? Function(_OnClaimAmountChange value)? onClaimAmountChange,
    TResult? Function(_OnClaimDetailsChange value)? onClaimDetailsChange,
    TResult? Function(_AddPoDocument value)? addPoDocument,
    TResult? Function(_RemovePoDocument value)? removePoDocument,
    TResult? Function(_Submit value)? submit,
  }) {
    return onClaimDetailsChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchPrincipalList value)? fetchPrincipalList,
    TResult Function(_OnSelectPrincipal value)? onSelectPrincipal,
    TResult Function(_OnSelectClaimType value)? onSelectClaimType,
    TResult Function(_OnClaimAmountChange value)? onClaimAmountChange,
    TResult Function(_OnClaimDetailsChange value)? onClaimDetailsChange,
    TResult Function(_AddPoDocument value)? addPoDocument,
    TResult Function(_RemovePoDocument value)? removePoDocument,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (onClaimDetailsChange != null) {
      return onClaimDetailsChange(this);
    }
    return orElse();
  }
}

abstract class _OnClaimDetailsChange implements NewClaimSubmissionEvent {
  const factory _OnClaimDetailsChange({required final String claimDetails}) =
      _$OnClaimDetailsChangeImpl;

  String get claimDetails;
  @JsonKey(ignore: true)
  _$$OnClaimDetailsChangeImplCopyWith<_$OnClaimDetailsChangeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddPoDocumentImplCopyWith<$Res> {
  factory _$$AddPoDocumentImplCopyWith(
          _$AddPoDocumentImpl value, $Res Function(_$AddPoDocumentImpl) then) =
      __$$AddPoDocumentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PlatformFile> poDocuments});
}

/// @nodoc
class __$$AddPoDocumentImplCopyWithImpl<$Res>
    extends _$NewClaimSubmissionEventCopyWithImpl<$Res, _$AddPoDocumentImpl>
    implements _$$AddPoDocumentImplCopyWith<$Res> {
  __$$AddPoDocumentImplCopyWithImpl(
      _$AddPoDocumentImpl _value, $Res Function(_$AddPoDocumentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poDocuments = null,
  }) {
    return _then(_$AddPoDocumentImpl(
      poDocuments: null == poDocuments
          ? _value._poDocuments
          : poDocuments // ignore: cast_nullable_to_non_nullable
              as List<PlatformFile>,
    ));
  }
}

/// @nodoc

class _$AddPoDocumentImpl implements _AddPoDocument {
  const _$AddPoDocumentImpl({required final List<PlatformFile> poDocuments})
      : _poDocuments = poDocuments;

  final List<PlatformFile> _poDocuments;
  @override
  List<PlatformFile> get poDocuments {
    if (_poDocuments is EqualUnmodifiableListView) return _poDocuments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_poDocuments);
  }

  @override
  String toString() {
    return 'NewClaimSubmissionEvent.addPoDocument(poDocuments: $poDocuments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPoDocumentImpl &&
            const DeepCollectionEquality()
                .equals(other._poDocuments, _poDocuments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_poDocuments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPoDocumentImplCopyWith<_$AddPoDocumentImpl> get copyWith =>
      __$$AddPoDocumentImplCopyWithImpl<_$AddPoDocumentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function() fetchPrincipalList,
    required TResult Function(PrincipalData principal) onSelectPrincipal,
    required TResult Function(ClaimType claimType) onSelectClaimType,
    required TResult Function(double amount) onClaimAmountChange,
    required TResult Function(String claimDetails) onClaimDetailsChange,
    required TResult Function(List<PlatformFile> poDocuments) addPoDocument,
    required TResult Function(PlatformFile poDocument) removePoDocument,
    required TResult Function(User user, CustomerCodeInfo customerCodeInfo)
        submit,
  }) {
    return addPoDocument(poDocuments);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function()? fetchPrincipalList,
    TResult? Function(PrincipalData principal)? onSelectPrincipal,
    TResult? Function(ClaimType claimType)? onSelectClaimType,
    TResult? Function(double amount)? onClaimAmountChange,
    TResult? Function(String claimDetails)? onClaimDetailsChange,
    TResult? Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult? Function(PlatformFile poDocument)? removePoDocument,
    TResult? Function(User user, CustomerCodeInfo customerCodeInfo)? submit,
  }) {
    return addPoDocument?.call(poDocuments);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function()? fetchPrincipalList,
    TResult Function(PrincipalData principal)? onSelectPrincipal,
    TResult Function(ClaimType claimType)? onSelectClaimType,
    TResult Function(double amount)? onClaimAmountChange,
    TResult Function(String claimDetails)? onClaimDetailsChange,
    TResult Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult Function(PlatformFile poDocument)? removePoDocument,
    TResult Function(User user, CustomerCodeInfo customerCodeInfo)? submit,
    required TResult orElse(),
  }) {
    if (addPoDocument != null) {
      return addPoDocument(poDocuments);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchPrincipalList value) fetchPrincipalList,
    required TResult Function(_OnSelectPrincipal value) onSelectPrincipal,
    required TResult Function(_OnSelectClaimType value) onSelectClaimType,
    required TResult Function(_OnClaimAmountChange value) onClaimAmountChange,
    required TResult Function(_OnClaimDetailsChange value) onClaimDetailsChange,
    required TResult Function(_AddPoDocument value) addPoDocument,
    required TResult Function(_RemovePoDocument value) removePoDocument,
    required TResult Function(_Submit value) submit,
  }) {
    return addPoDocument(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchPrincipalList value)? fetchPrincipalList,
    TResult? Function(_OnSelectPrincipal value)? onSelectPrincipal,
    TResult? Function(_OnSelectClaimType value)? onSelectClaimType,
    TResult? Function(_OnClaimAmountChange value)? onClaimAmountChange,
    TResult? Function(_OnClaimDetailsChange value)? onClaimDetailsChange,
    TResult? Function(_AddPoDocument value)? addPoDocument,
    TResult? Function(_RemovePoDocument value)? removePoDocument,
    TResult? Function(_Submit value)? submit,
  }) {
    return addPoDocument?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchPrincipalList value)? fetchPrincipalList,
    TResult Function(_OnSelectPrincipal value)? onSelectPrincipal,
    TResult Function(_OnSelectClaimType value)? onSelectClaimType,
    TResult Function(_OnClaimAmountChange value)? onClaimAmountChange,
    TResult Function(_OnClaimDetailsChange value)? onClaimDetailsChange,
    TResult Function(_AddPoDocument value)? addPoDocument,
    TResult Function(_RemovePoDocument value)? removePoDocument,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (addPoDocument != null) {
      return addPoDocument(this);
    }
    return orElse();
  }
}

abstract class _AddPoDocument implements NewClaimSubmissionEvent {
  const factory _AddPoDocument(
      {required final List<PlatformFile> poDocuments}) = _$AddPoDocumentImpl;

  List<PlatformFile> get poDocuments;
  @JsonKey(ignore: true)
  _$$AddPoDocumentImplCopyWith<_$AddPoDocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemovePoDocumentImplCopyWith<$Res> {
  factory _$$RemovePoDocumentImplCopyWith(_$RemovePoDocumentImpl value,
          $Res Function(_$RemovePoDocumentImpl) then) =
      __$$RemovePoDocumentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PlatformFile poDocument});
}

/// @nodoc
class __$$RemovePoDocumentImplCopyWithImpl<$Res>
    extends _$NewClaimSubmissionEventCopyWithImpl<$Res, _$RemovePoDocumentImpl>
    implements _$$RemovePoDocumentImplCopyWith<$Res> {
  __$$RemovePoDocumentImplCopyWithImpl(_$RemovePoDocumentImpl _value,
      $Res Function(_$RemovePoDocumentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poDocument = null,
  }) {
    return _then(_$RemovePoDocumentImpl(
      poDocument: null == poDocument
          ? _value.poDocument
          : poDocument // ignore: cast_nullable_to_non_nullable
              as PlatformFile,
    ));
  }
}

/// @nodoc

class _$RemovePoDocumentImpl implements _RemovePoDocument {
  const _$RemovePoDocumentImpl({required this.poDocument});

  @override
  final PlatformFile poDocument;

  @override
  String toString() {
    return 'NewClaimSubmissionEvent.removePoDocument(poDocument: $poDocument)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemovePoDocumentImpl &&
            (identical(other.poDocument, poDocument) ||
                other.poDocument == poDocument));
  }

  @override
  int get hashCode => Object.hash(runtimeType, poDocument);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemovePoDocumentImplCopyWith<_$RemovePoDocumentImpl> get copyWith =>
      __$$RemovePoDocumentImplCopyWithImpl<_$RemovePoDocumentImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function() fetchPrincipalList,
    required TResult Function(PrincipalData principal) onSelectPrincipal,
    required TResult Function(ClaimType claimType) onSelectClaimType,
    required TResult Function(double amount) onClaimAmountChange,
    required TResult Function(String claimDetails) onClaimDetailsChange,
    required TResult Function(List<PlatformFile> poDocuments) addPoDocument,
    required TResult Function(PlatformFile poDocument) removePoDocument,
    required TResult Function(User user, CustomerCodeInfo customerCodeInfo)
        submit,
  }) {
    return removePoDocument(poDocument);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function()? fetchPrincipalList,
    TResult? Function(PrincipalData principal)? onSelectPrincipal,
    TResult? Function(ClaimType claimType)? onSelectClaimType,
    TResult? Function(double amount)? onClaimAmountChange,
    TResult? Function(String claimDetails)? onClaimDetailsChange,
    TResult? Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult? Function(PlatformFile poDocument)? removePoDocument,
    TResult? Function(User user, CustomerCodeInfo customerCodeInfo)? submit,
  }) {
    return removePoDocument?.call(poDocument);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function()? fetchPrincipalList,
    TResult Function(PrincipalData principal)? onSelectPrincipal,
    TResult Function(ClaimType claimType)? onSelectClaimType,
    TResult Function(double amount)? onClaimAmountChange,
    TResult Function(String claimDetails)? onClaimDetailsChange,
    TResult Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult Function(PlatformFile poDocument)? removePoDocument,
    TResult Function(User user, CustomerCodeInfo customerCodeInfo)? submit,
    required TResult orElse(),
  }) {
    if (removePoDocument != null) {
      return removePoDocument(poDocument);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchPrincipalList value) fetchPrincipalList,
    required TResult Function(_OnSelectPrincipal value) onSelectPrincipal,
    required TResult Function(_OnSelectClaimType value) onSelectClaimType,
    required TResult Function(_OnClaimAmountChange value) onClaimAmountChange,
    required TResult Function(_OnClaimDetailsChange value) onClaimDetailsChange,
    required TResult Function(_AddPoDocument value) addPoDocument,
    required TResult Function(_RemovePoDocument value) removePoDocument,
    required TResult Function(_Submit value) submit,
  }) {
    return removePoDocument(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchPrincipalList value)? fetchPrincipalList,
    TResult? Function(_OnSelectPrincipal value)? onSelectPrincipal,
    TResult? Function(_OnSelectClaimType value)? onSelectClaimType,
    TResult? Function(_OnClaimAmountChange value)? onClaimAmountChange,
    TResult? Function(_OnClaimDetailsChange value)? onClaimDetailsChange,
    TResult? Function(_AddPoDocument value)? addPoDocument,
    TResult? Function(_RemovePoDocument value)? removePoDocument,
    TResult? Function(_Submit value)? submit,
  }) {
    return removePoDocument?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchPrincipalList value)? fetchPrincipalList,
    TResult Function(_OnSelectPrincipal value)? onSelectPrincipal,
    TResult Function(_OnSelectClaimType value)? onSelectClaimType,
    TResult Function(_OnClaimAmountChange value)? onClaimAmountChange,
    TResult Function(_OnClaimDetailsChange value)? onClaimDetailsChange,
    TResult Function(_AddPoDocument value)? addPoDocument,
    TResult Function(_RemovePoDocument value)? removePoDocument,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (removePoDocument != null) {
      return removePoDocument(this);
    }
    return orElse();
  }
}

abstract class _RemovePoDocument implements NewClaimSubmissionEvent {
  const factory _RemovePoDocument({required final PlatformFile poDocument}) =
      _$RemovePoDocumentImpl;

  PlatformFile get poDocument;
  @JsonKey(ignore: true)
  _$$RemovePoDocumentImplCopyWith<_$RemovePoDocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitImplCopyWith<$Res> {
  factory _$$SubmitImplCopyWith(
          _$SubmitImpl value, $Res Function(_$SubmitImpl) then) =
      __$$SubmitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user, CustomerCodeInfo customerCodeInfo});

  $UserCopyWith<$Res> get user;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$SubmitImplCopyWithImpl<$Res>
    extends _$NewClaimSubmissionEventCopyWithImpl<$Res, _$SubmitImpl>
    implements _$$SubmitImplCopyWith<$Res> {
  __$$SubmitImplCopyWithImpl(
      _$SubmitImpl _value, $Res Function(_$SubmitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? customerCodeInfo = null,
  }) {
    return _then(_$SubmitImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
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

class _$SubmitImpl implements _Submit {
  const _$SubmitImpl({required this.user, required this.customerCodeInfo});

  @override
  final User user;
  @override
  final CustomerCodeInfo customerCodeInfo;

  @override
  String toString() {
    return 'NewClaimSubmissionEvent.submit(user: $user, customerCodeInfo: $customerCodeInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, customerCodeInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitImplCopyWith<_$SubmitImpl> get copyWith =>
      __$$SubmitImplCopyWithImpl<_$SubmitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)
        initialized,
    required TResult Function() fetchPrincipalList,
    required TResult Function(PrincipalData principal) onSelectPrincipal,
    required TResult Function(ClaimType claimType) onSelectClaimType,
    required TResult Function(double amount) onClaimAmountChange,
    required TResult Function(String claimDetails) onClaimDetailsChange,
    required TResult Function(List<PlatformFile> poDocuments) addPoDocument,
    required TResult Function(PlatformFile poDocument) removePoDocument,
    required TResult Function(User user, CustomerCodeInfo customerCodeInfo)
        submit,
  }) {
    return submit(user, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult? Function()? fetchPrincipalList,
    TResult? Function(PrincipalData principal)? onSelectPrincipal,
    TResult? Function(ClaimType claimType)? onSelectClaimType,
    TResult? Function(double amount)? onClaimAmountChange,
    TResult? Function(String claimDetails)? onClaimDetailsChange,
    TResult? Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult? Function(PlatformFile poDocument)? removePoDocument,
    TResult? Function(User user, CustomerCodeInfo customerCodeInfo)? submit,
  }) {
    return submit?.call(user, customerCodeInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrganisation salesOrganisation,
            CustomerCodeInfo customerCodeInfo)?
        initialized,
    TResult Function()? fetchPrincipalList,
    TResult Function(PrincipalData principal)? onSelectPrincipal,
    TResult Function(ClaimType claimType)? onSelectClaimType,
    TResult Function(double amount)? onClaimAmountChange,
    TResult Function(String claimDetails)? onClaimDetailsChange,
    TResult Function(List<PlatformFile> poDocuments)? addPoDocument,
    TResult Function(PlatformFile poDocument)? removePoDocument,
    TResult Function(User user, CustomerCodeInfo customerCodeInfo)? submit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(user, customerCodeInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchPrincipalList value) fetchPrincipalList,
    required TResult Function(_OnSelectPrincipal value) onSelectPrincipal,
    required TResult Function(_OnSelectClaimType value) onSelectClaimType,
    required TResult Function(_OnClaimAmountChange value) onClaimAmountChange,
    required TResult Function(_OnClaimDetailsChange value) onClaimDetailsChange,
    required TResult Function(_AddPoDocument value) addPoDocument,
    required TResult Function(_RemovePoDocument value) removePoDocument,
    required TResult Function(_Submit value) submit,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchPrincipalList value)? fetchPrincipalList,
    TResult? Function(_OnSelectPrincipal value)? onSelectPrincipal,
    TResult? Function(_OnSelectClaimType value)? onSelectClaimType,
    TResult? Function(_OnClaimAmountChange value)? onClaimAmountChange,
    TResult? Function(_OnClaimDetailsChange value)? onClaimDetailsChange,
    TResult? Function(_AddPoDocument value)? addPoDocument,
    TResult? Function(_RemovePoDocument value)? removePoDocument,
    TResult? Function(_Submit value)? submit,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchPrincipalList value)? fetchPrincipalList,
    TResult Function(_OnSelectPrincipal value)? onSelectPrincipal,
    TResult Function(_OnSelectClaimType value)? onSelectClaimType,
    TResult Function(_OnClaimAmountChange value)? onClaimAmountChange,
    TResult Function(_OnClaimDetailsChange value)? onClaimDetailsChange,
    TResult Function(_AddPoDocument value)? addPoDocument,
    TResult Function(_RemovePoDocument value)? removePoDocument,
    TResult Function(_Submit value)? submit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class _Submit implements NewClaimSubmissionEvent {
  const factory _Submit(
      {required final User user,
      required final CustomerCodeInfo customerCodeInfo}) = _$SubmitImpl;

  User get user;
  CustomerCodeInfo get customerCodeInfo;
  @JsonKey(ignore: true)
  _$$SubmitImplCopyWith<_$SubmitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NewClaimSubmissionState {
  SalesOrganisation get salesOrganisation => throw _privateConstructorUsedError;
  CustomerCodeInfo get customerCodeInfo => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isPrincipalLoading => throw _privateConstructorUsedError;
  bool get showUploadExeedMessage => throw _privateConstructorUsedError;
  ClaimSubmission get claimSubmission => throw _privateConstructorUsedError;
  List<PrincipalData> get principalList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewClaimSubmissionStateCopyWith<NewClaimSubmissionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewClaimSubmissionStateCopyWith<$Res> {
  factory $NewClaimSubmissionStateCopyWith(NewClaimSubmissionState value,
          $Res Function(NewClaimSubmissionState) then) =
      _$NewClaimSubmissionStateCopyWithImpl<$Res, NewClaimSubmissionState>;
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isLoading,
      bool isPrincipalLoading,
      bool showUploadExeedMessage,
      ClaimSubmission claimSubmission,
      List<PrincipalData> principalList});

  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  $ClaimSubmissionCopyWith<$Res> get claimSubmission;
}

/// @nodoc
class _$NewClaimSubmissionStateCopyWithImpl<$Res,
        $Val extends NewClaimSubmissionState>
    implements $NewClaimSubmissionStateCopyWith<$Res> {
  _$NewClaimSubmissionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? failureOrSuccessOption = null,
    Object? isLoading = null,
    Object? isPrincipalLoading = null,
    Object? showUploadExeedMessage = null,
    Object? claimSubmission = null,
    Object? principalList = null,
  }) {
    return _then(_value.copyWith(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrincipalLoading: null == isPrincipalLoading
          ? _value.isPrincipalLoading
          : isPrincipalLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      showUploadExeedMessage: null == showUploadExeedMessage
          ? _value.showUploadExeedMessage
          : showUploadExeedMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      claimSubmission: null == claimSubmission
          ? _value.claimSubmission
          : claimSubmission // ignore: cast_nullable_to_non_nullable
              as ClaimSubmission,
      principalList: null == principalList
          ? _value.principalList
          : principalList // ignore: cast_nullable_to_non_nullable
              as List<PrincipalData>,
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
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo {
    return $CustomerCodeInfoCopyWith<$Res>(_value.customerCodeInfo, (value) {
      return _then(_value.copyWith(customerCodeInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ClaimSubmissionCopyWith<$Res> get claimSubmission {
    return $ClaimSubmissionCopyWith<$Res>(_value.claimSubmission, (value) {
      return _then(_value.copyWith(claimSubmission: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NewClaimSubmissionStateImplCopyWith<$Res>
    implements $NewClaimSubmissionStateCopyWith<$Res> {
  factory _$$NewClaimSubmissionStateImplCopyWith(
          _$NewClaimSubmissionStateImpl value,
          $Res Function(_$NewClaimSubmissionStateImpl) then) =
      __$$NewClaimSubmissionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SalesOrganisation salesOrganisation,
      CustomerCodeInfo customerCodeInfo,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isLoading,
      bool isPrincipalLoading,
      bool showUploadExeedMessage,
      ClaimSubmission claimSubmission,
      List<PrincipalData> principalList});

  @override
  $SalesOrganisationCopyWith<$Res> get salesOrganisation;
  @override
  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
  @override
  $ClaimSubmissionCopyWith<$Res> get claimSubmission;
}

/// @nodoc
class __$$NewClaimSubmissionStateImplCopyWithImpl<$Res>
    extends _$NewClaimSubmissionStateCopyWithImpl<$Res,
        _$NewClaimSubmissionStateImpl>
    implements _$$NewClaimSubmissionStateImplCopyWith<$Res> {
  __$$NewClaimSubmissionStateImplCopyWithImpl(
      _$NewClaimSubmissionStateImpl _value,
      $Res Function(_$NewClaimSubmissionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrganisation = null,
    Object? customerCodeInfo = null,
    Object? failureOrSuccessOption = null,
    Object? isLoading = null,
    Object? isPrincipalLoading = null,
    Object? showUploadExeedMessage = null,
    Object? claimSubmission = null,
    Object? principalList = null,
  }) {
    return _then(_$NewClaimSubmissionStateImpl(
      salesOrganisation: null == salesOrganisation
          ? _value.salesOrganisation
          : salesOrganisation // ignore: cast_nullable_to_non_nullable
              as SalesOrganisation,
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrincipalLoading: null == isPrincipalLoading
          ? _value.isPrincipalLoading
          : isPrincipalLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      showUploadExeedMessage: null == showUploadExeedMessage
          ? _value.showUploadExeedMessage
          : showUploadExeedMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      claimSubmission: null == claimSubmission
          ? _value.claimSubmission
          : claimSubmission // ignore: cast_nullable_to_non_nullable
              as ClaimSubmission,
      principalList: null == principalList
          ? _value._principalList
          : principalList // ignore: cast_nullable_to_non_nullable
              as List<PrincipalData>,
    ));
  }
}

/// @nodoc

class _$NewClaimSubmissionStateImpl extends _NewClaimSubmissionState {
  const _$NewClaimSubmissionStateImpl(
      {required this.salesOrganisation,
      required this.customerCodeInfo,
      required this.failureOrSuccessOption,
      required this.isLoading,
      required this.isPrincipalLoading,
      required this.showUploadExeedMessage,
      required this.claimSubmission,
      required final List<PrincipalData> principalList})
      : _principalList = principalList,
        super._();

  @override
  final SalesOrganisation salesOrganisation;
  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  @override
  final bool isLoading;
  @override
  final bool isPrincipalLoading;
  @override
  final bool showUploadExeedMessage;
  @override
  final ClaimSubmission claimSubmission;
  final List<PrincipalData> _principalList;
  @override
  List<PrincipalData> get principalList {
    if (_principalList is EqualUnmodifiableListView) return _principalList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_principalList);
  }

  @override
  String toString() {
    return 'NewClaimSubmissionState(salesOrganisation: $salesOrganisation, customerCodeInfo: $customerCodeInfo, failureOrSuccessOption: $failureOrSuccessOption, isLoading: $isLoading, isPrincipalLoading: $isPrincipalLoading, showUploadExeedMessage: $showUploadExeedMessage, claimSubmission: $claimSubmission, principalList: $principalList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewClaimSubmissionStateImpl &&
            (identical(other.salesOrganisation, salesOrganisation) ||
                other.salesOrganisation == salesOrganisation) &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isPrincipalLoading, isPrincipalLoading) ||
                other.isPrincipalLoading == isPrincipalLoading) &&
            (identical(other.showUploadExeedMessage, showUploadExeedMessage) ||
                other.showUploadExeedMessage == showUploadExeedMessage) &&
            (identical(other.claimSubmission, claimSubmission) ||
                other.claimSubmission == claimSubmission) &&
            const DeepCollectionEquality()
                .equals(other._principalList, _principalList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      salesOrganisation,
      customerCodeInfo,
      failureOrSuccessOption,
      isLoading,
      isPrincipalLoading,
      showUploadExeedMessage,
      claimSubmission,
      const DeepCollectionEquality().hash(_principalList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewClaimSubmissionStateImplCopyWith<_$NewClaimSubmissionStateImpl>
      get copyWith => __$$NewClaimSubmissionStateImplCopyWithImpl<
          _$NewClaimSubmissionStateImpl>(this, _$identity);
}

abstract class _NewClaimSubmissionState extends NewClaimSubmissionState {
  const factory _NewClaimSubmissionState(
      {required final SalesOrganisation salesOrganisation,
      required final CustomerCodeInfo customerCodeInfo,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final bool isLoading,
      required final bool isPrincipalLoading,
      required final bool showUploadExeedMessage,
      required final ClaimSubmission claimSubmission,
      required final List<PrincipalData>
          principalList}) = _$NewClaimSubmissionStateImpl;
  const _NewClaimSubmissionState._() : super._();

  @override
  SalesOrganisation get salesOrganisation;
  @override
  CustomerCodeInfo get customerCodeInfo;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  bool get isLoading;
  @override
  bool get isPrincipalLoading;
  @override
  bool get showUploadExeedMessage;
  @override
  ClaimSubmission get claimSubmission;
  @override
  List<PrincipalData> get principalList;
  @override
  @JsonKey(ignore: true)
  _$$NewClaimSubmissionStateImplCopyWith<_$NewClaimSubmissionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about_us_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AboutUsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) initialize,
    required TResult Function() fetchAboutUsInfo,
    required TResult Function() fetchAboutUsStaticInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? initialize,
    TResult? Function()? fetchAboutUsInfo,
    TResult? Function()? fetchAboutUsStaticInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? initialize,
    TResult Function()? fetchAboutUsInfo,
    TResult Function()? fetchAboutUsStaticInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_FetchAboutUsInfo value) fetchAboutUsInfo,
    required TResult Function(_FetchAboutUsStaticInfo value)
        fetchAboutUsStaticInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_FetchAboutUsInfo value)? fetchAboutUsInfo,
    TResult? Function(_FetchAboutUsStaticInfo value)? fetchAboutUsStaticInfo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_FetchAboutUsInfo value)? fetchAboutUsInfo,
    TResult Function(_FetchAboutUsStaticInfo value)? fetchAboutUsStaticInfo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutUsEventCopyWith<$Res> {
  factory $AboutUsEventCopyWith(
          AboutUsEvent value, $Res Function(AboutUsEvent) then) =
      _$AboutUsEventCopyWithImpl<$Res, AboutUsEvent>;
}

/// @nodoc
class _$AboutUsEventCopyWithImpl<$Res, $Val extends AboutUsEvent>
    implements $AboutUsEventCopyWith<$Res> {
  _$AboutUsEventCopyWithImpl(this._value, this._then);

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
  @useResult
  $Res call({SalesOrg salesOrg});
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$AboutUsEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
  }) {
    return _then(_$InitializeImpl(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
    ));
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl({required this.salesOrg});

  @override
  final SalesOrg salesOrg;

  @override
  String toString() {
    return 'AboutUsEvent.initialize(salesOrg: $salesOrg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) initialize,
    required TResult Function() fetchAboutUsInfo,
    required TResult Function() fetchAboutUsStaticInfo,
  }) {
    return initialize(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? initialize,
    TResult? Function()? fetchAboutUsInfo,
    TResult? Function()? fetchAboutUsStaticInfo,
  }) {
    return initialize?.call(salesOrg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? initialize,
    TResult Function()? fetchAboutUsInfo,
    TResult Function()? fetchAboutUsStaticInfo,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(salesOrg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_FetchAboutUsInfo value) fetchAboutUsInfo,
    required TResult Function(_FetchAboutUsStaticInfo value)
        fetchAboutUsStaticInfo,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_FetchAboutUsInfo value)? fetchAboutUsInfo,
    TResult? Function(_FetchAboutUsStaticInfo value)? fetchAboutUsStaticInfo,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_FetchAboutUsInfo value)? fetchAboutUsInfo,
    TResult Function(_FetchAboutUsStaticInfo value)? fetchAboutUsStaticInfo,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements AboutUsEvent {
  const factory _Initialize({required final SalesOrg salesOrg}) =
      _$InitializeImpl;

  SalesOrg get salesOrg;
  @JsonKey(ignore: true)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchAboutUsInfoImplCopyWith<$Res> {
  factory _$$FetchAboutUsInfoImplCopyWith(_$FetchAboutUsInfoImpl value,
          $Res Function(_$FetchAboutUsInfoImpl) then) =
      __$$FetchAboutUsInfoImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchAboutUsInfoImplCopyWithImpl<$Res>
    extends _$AboutUsEventCopyWithImpl<$Res, _$FetchAboutUsInfoImpl>
    implements _$$FetchAboutUsInfoImplCopyWith<$Res> {
  __$$FetchAboutUsInfoImplCopyWithImpl(_$FetchAboutUsInfoImpl _value,
      $Res Function(_$FetchAboutUsInfoImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchAboutUsInfoImpl implements _FetchAboutUsInfo {
  const _$FetchAboutUsInfoImpl();

  @override
  String toString() {
    return 'AboutUsEvent.fetchAboutUsInfo()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchAboutUsInfoImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) initialize,
    required TResult Function() fetchAboutUsInfo,
    required TResult Function() fetchAboutUsStaticInfo,
  }) {
    return fetchAboutUsInfo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? initialize,
    TResult? Function()? fetchAboutUsInfo,
    TResult? Function()? fetchAboutUsStaticInfo,
  }) {
    return fetchAboutUsInfo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? initialize,
    TResult Function()? fetchAboutUsInfo,
    TResult Function()? fetchAboutUsStaticInfo,
    required TResult orElse(),
  }) {
    if (fetchAboutUsInfo != null) {
      return fetchAboutUsInfo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_FetchAboutUsInfo value) fetchAboutUsInfo,
    required TResult Function(_FetchAboutUsStaticInfo value)
        fetchAboutUsStaticInfo,
  }) {
    return fetchAboutUsInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_FetchAboutUsInfo value)? fetchAboutUsInfo,
    TResult? Function(_FetchAboutUsStaticInfo value)? fetchAboutUsStaticInfo,
  }) {
    return fetchAboutUsInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_FetchAboutUsInfo value)? fetchAboutUsInfo,
    TResult Function(_FetchAboutUsStaticInfo value)? fetchAboutUsStaticInfo,
    required TResult orElse(),
  }) {
    if (fetchAboutUsInfo != null) {
      return fetchAboutUsInfo(this);
    }
    return orElse();
  }
}

abstract class _FetchAboutUsInfo implements AboutUsEvent {
  const factory _FetchAboutUsInfo() = _$FetchAboutUsInfoImpl;
}

/// @nodoc
abstract class _$$FetchAboutUsStaticInfoImplCopyWith<$Res> {
  factory _$$FetchAboutUsStaticInfoImplCopyWith(
          _$FetchAboutUsStaticInfoImpl value,
          $Res Function(_$FetchAboutUsStaticInfoImpl) then) =
      __$$FetchAboutUsStaticInfoImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchAboutUsStaticInfoImplCopyWithImpl<$Res>
    extends _$AboutUsEventCopyWithImpl<$Res, _$FetchAboutUsStaticInfoImpl>
    implements _$$FetchAboutUsStaticInfoImplCopyWith<$Res> {
  __$$FetchAboutUsStaticInfoImplCopyWithImpl(
      _$FetchAboutUsStaticInfoImpl _value,
      $Res Function(_$FetchAboutUsStaticInfoImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchAboutUsStaticInfoImpl implements _FetchAboutUsStaticInfo {
  const _$FetchAboutUsStaticInfoImpl();

  @override
  String toString() {
    return 'AboutUsEvent.fetchAboutUsStaticInfo()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAboutUsStaticInfoImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrg salesOrg) initialize,
    required TResult Function() fetchAboutUsInfo,
    required TResult Function() fetchAboutUsStaticInfo,
  }) {
    return fetchAboutUsStaticInfo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrg salesOrg)? initialize,
    TResult? Function()? fetchAboutUsInfo,
    TResult? Function()? fetchAboutUsStaticInfo,
  }) {
    return fetchAboutUsStaticInfo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrg salesOrg)? initialize,
    TResult Function()? fetchAboutUsInfo,
    TResult Function()? fetchAboutUsStaticInfo,
    required TResult orElse(),
  }) {
    if (fetchAboutUsStaticInfo != null) {
      return fetchAboutUsStaticInfo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_FetchAboutUsInfo value) fetchAboutUsInfo,
    required TResult Function(_FetchAboutUsStaticInfo value)
        fetchAboutUsStaticInfo,
  }) {
    return fetchAboutUsStaticInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_FetchAboutUsInfo value)? fetchAboutUsInfo,
    TResult? Function(_FetchAboutUsStaticInfo value)? fetchAboutUsStaticInfo,
  }) {
    return fetchAboutUsStaticInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_FetchAboutUsInfo value)? fetchAboutUsInfo,
    TResult Function(_FetchAboutUsStaticInfo value)? fetchAboutUsStaticInfo,
    required TResult orElse(),
  }) {
    if (fetchAboutUsStaticInfo != null) {
      return fetchAboutUsStaticInfo(this);
    }
    return orElse();
  }
}

abstract class _FetchAboutUsStaticInfo implements AboutUsEvent {
  const factory _FetchAboutUsStaticInfo() = _$FetchAboutUsStaticInfoImpl;
}

/// @nodoc
mixin _$AboutUsState {
  SalesOrg get salesOrg => throw _privateConstructorUsedError;
  bool get isFetching => throw _privateConstructorUsedError;
  AboutUs get aboutUsInfo => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AboutUsStateCopyWith<AboutUsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutUsStateCopyWith<$Res> {
  factory $AboutUsStateCopyWith(
          AboutUsState value, $Res Function(AboutUsState) then) =
      _$AboutUsStateCopyWithImpl<$Res, AboutUsState>;
  @useResult
  $Res call(
      {SalesOrg salesOrg,
      bool isFetching,
      AboutUs aboutUsInfo,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});

  $AboutUsCopyWith<$Res> get aboutUsInfo;
}

/// @nodoc
class _$AboutUsStateCopyWithImpl<$Res, $Val extends AboutUsState>
    implements $AboutUsStateCopyWith<$Res> {
  _$AboutUsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? isFetching = null,
    Object? aboutUsInfo = null,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      aboutUsInfo: null == aboutUsInfo
          ? _value.aboutUsInfo
          : aboutUsInfo // ignore: cast_nullable_to_non_nullable
              as AboutUs,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AboutUsCopyWith<$Res> get aboutUsInfo {
    return $AboutUsCopyWith<$Res>(_value.aboutUsInfo, (value) {
      return _then(_value.copyWith(aboutUsInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AboutUsStateImplCopyWith<$Res>
    implements $AboutUsStateCopyWith<$Res> {
  factory _$$AboutUsStateImplCopyWith(
          _$AboutUsStateImpl value, $Res Function(_$AboutUsStateImpl) then) =
      __$$AboutUsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SalesOrg salesOrg,
      bool isFetching,
      AboutUs aboutUsInfo,
      Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption});

  @override
  $AboutUsCopyWith<$Res> get aboutUsInfo;
}

/// @nodoc
class __$$AboutUsStateImplCopyWithImpl<$Res>
    extends _$AboutUsStateCopyWithImpl<$Res, _$AboutUsStateImpl>
    implements _$$AboutUsStateImplCopyWith<$Res> {
  __$$AboutUsStateImplCopyWithImpl(
      _$AboutUsStateImpl _value, $Res Function(_$AboutUsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? isFetching = null,
    Object? aboutUsInfo = null,
    Object? apiFailureOrSuccessOption = null,
  }) {
    return _then(_$AboutUsStateImpl(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
      aboutUsInfo: null == aboutUsInfo
          ? _value.aboutUsInfo
          : aboutUsInfo // ignore: cast_nullable_to_non_nullable
              as AboutUs,
      apiFailureOrSuccessOption: null == apiFailureOrSuccessOption
          ? _value.apiFailureOrSuccessOption
          : apiFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$AboutUsStateImpl implements _AboutUsState {
  const _$AboutUsStateImpl(
      {required this.salesOrg,
      required this.isFetching,
      required this.aboutUsInfo,
      required this.apiFailureOrSuccessOption});

  @override
  final SalesOrg salesOrg;
  @override
  final bool isFetching;
  @override
  final AboutUs aboutUsInfo;
  @override
  final Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption;

  @override
  String toString() {
    return 'AboutUsState(salesOrg: $salesOrg, isFetching: $isFetching, aboutUsInfo: $aboutUsInfo, apiFailureOrSuccessOption: $apiFailureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AboutUsStateImpl &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.aboutUsInfo, aboutUsInfo) ||
                other.aboutUsInfo == aboutUsInfo) &&
            (identical(other.apiFailureOrSuccessOption,
                    apiFailureOrSuccessOption) ||
                other.apiFailureOrSuccessOption == apiFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrg, isFetching,
      aboutUsInfo, apiFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AboutUsStateImplCopyWith<_$AboutUsStateImpl> get copyWith =>
      __$$AboutUsStateImplCopyWithImpl<_$AboutUsStateImpl>(this, _$identity);
}

abstract class _AboutUsState implements AboutUsState {
  const factory _AboutUsState(
      {required final SalesOrg salesOrg,
      required final bool isFetching,
      required final AboutUs aboutUsInfo,
      required final Option<Either<ApiFailure, dynamic>>
          apiFailureOrSuccessOption}) = _$AboutUsStateImpl;

  @override
  SalesOrg get salesOrg;
  @override
  bool get isFetching;
  @override
  AboutUs get aboutUsInfo;
  @override
  Option<Either<ApiFailure, dynamic>> get apiFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$AboutUsStateImplCopyWith<_$AboutUsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

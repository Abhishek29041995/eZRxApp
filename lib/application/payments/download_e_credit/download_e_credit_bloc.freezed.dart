// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_e_credit_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DownloadECreditEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eCredit) fetchECreditDownloadUrl,
    required TResult Function() downloadECredit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eCredit)? fetchECreditDownloadUrl,
    TResult? Function()? downloadECredit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eCredit)? fetchECreditDownloadUrl,
    TResult Function()? downloadECredit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchECreditDownloadUrl value)
        fetchECreditDownloadUrl,
    required TResult Function(_DownloadECredit value) downloadECredit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchECreditDownloadUrl value)? fetchECreditDownloadUrl,
    TResult? Function(_DownloadECredit value)? downloadECredit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchECreditDownloadUrl value)? fetchECreditDownloadUrl,
    TResult Function(_DownloadECredit value)? downloadECredit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadECreditEventCopyWith<$Res> {
  factory $DownloadECreditEventCopyWith(DownloadECreditEvent value,
          $Res Function(DownloadECreditEvent) then) =
      _$DownloadECreditEventCopyWithImpl<$Res, DownloadECreditEvent>;
}

/// @nodoc
class _$DownloadECreditEventCopyWithImpl<$Res,
        $Val extends DownloadECreditEvent>
    implements $DownloadECreditEventCopyWith<$Res> {
  _$DownloadECreditEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchECreditDownloadUrlImplCopyWith<$Res> {
  factory _$$FetchECreditDownloadUrlImplCopyWith(
          _$FetchECreditDownloadUrlImpl value,
          $Res Function(_$FetchECreditDownloadUrlImpl) then) =
      __$$FetchECreditDownloadUrlImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String eCredit});
}

/// @nodoc
class __$$FetchECreditDownloadUrlImplCopyWithImpl<$Res>
    extends _$DownloadECreditEventCopyWithImpl<$Res,
        _$FetchECreditDownloadUrlImpl>
    implements _$$FetchECreditDownloadUrlImplCopyWith<$Res> {
  __$$FetchECreditDownloadUrlImplCopyWithImpl(
      _$FetchECreditDownloadUrlImpl _value,
      $Res Function(_$FetchECreditDownloadUrlImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eCredit = null,
  }) {
    return _then(_$FetchECreditDownloadUrlImpl(
      eCredit: null == eCredit
          ? _value.eCredit
          : eCredit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchECreditDownloadUrlImpl implements _FetchECreditDownloadUrl {
  const _$FetchECreditDownloadUrlImpl({required this.eCredit});

  @override
  final String eCredit;

  @override
  String toString() {
    return 'DownloadECreditEvent.fetchECreditDownloadUrl(eCredit: $eCredit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchECreditDownloadUrlImpl &&
            (identical(other.eCredit, eCredit) || other.eCredit == eCredit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eCredit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchECreditDownloadUrlImplCopyWith<_$FetchECreditDownloadUrlImpl>
      get copyWith => __$$FetchECreditDownloadUrlImplCopyWithImpl<
          _$FetchECreditDownloadUrlImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eCredit) fetchECreditDownloadUrl,
    required TResult Function() downloadECredit,
  }) {
    return fetchECreditDownloadUrl(eCredit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eCredit)? fetchECreditDownloadUrl,
    TResult? Function()? downloadECredit,
  }) {
    return fetchECreditDownloadUrl?.call(eCredit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eCredit)? fetchECreditDownloadUrl,
    TResult Function()? downloadECredit,
    required TResult orElse(),
  }) {
    if (fetchECreditDownloadUrl != null) {
      return fetchECreditDownloadUrl(eCredit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchECreditDownloadUrl value)
        fetchECreditDownloadUrl,
    required TResult Function(_DownloadECredit value) downloadECredit,
  }) {
    return fetchECreditDownloadUrl(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchECreditDownloadUrl value)? fetchECreditDownloadUrl,
    TResult? Function(_DownloadECredit value)? downloadECredit,
  }) {
    return fetchECreditDownloadUrl?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchECreditDownloadUrl value)? fetchECreditDownloadUrl,
    TResult Function(_DownloadECredit value)? downloadECredit,
    required TResult orElse(),
  }) {
    if (fetchECreditDownloadUrl != null) {
      return fetchECreditDownloadUrl(this);
    }
    return orElse();
  }
}

abstract class _FetchECreditDownloadUrl implements DownloadECreditEvent {
  const factory _FetchECreditDownloadUrl({required final String eCredit}) =
      _$FetchECreditDownloadUrlImpl;

  String get eCredit;
  @JsonKey(ignore: true)
  _$$FetchECreditDownloadUrlImplCopyWith<_$FetchECreditDownloadUrlImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DownloadECreditImplCopyWith<$Res> {
  factory _$$DownloadECreditImplCopyWith(_$DownloadECreditImpl value,
          $Res Function(_$DownloadECreditImpl) then) =
      __$$DownloadECreditImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownloadECreditImplCopyWithImpl<$Res>
    extends _$DownloadECreditEventCopyWithImpl<$Res, _$DownloadECreditImpl>
    implements _$$DownloadECreditImplCopyWith<$Res> {
  __$$DownloadECreditImplCopyWithImpl(
      _$DownloadECreditImpl _value, $Res Function(_$DownloadECreditImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DownloadECreditImpl implements _DownloadECredit {
  const _$DownloadECreditImpl();

  @override
  String toString() {
    return 'DownloadECreditEvent.downloadECredit()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DownloadECreditImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eCredit) fetchECreditDownloadUrl,
    required TResult Function() downloadECredit,
  }) {
    return downloadECredit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eCredit)? fetchECreditDownloadUrl,
    TResult? Function()? downloadECredit,
  }) {
    return downloadECredit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eCredit)? fetchECreditDownloadUrl,
    TResult Function()? downloadECredit,
    required TResult orElse(),
  }) {
    if (downloadECredit != null) {
      return downloadECredit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchECreditDownloadUrl value)
        fetchECreditDownloadUrl,
    required TResult Function(_DownloadECredit value) downloadECredit,
  }) {
    return downloadECredit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchECreditDownloadUrl value)? fetchECreditDownloadUrl,
    TResult? Function(_DownloadECredit value)? downloadECredit,
  }) {
    return downloadECredit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchECreditDownloadUrl value)? fetchECreditDownloadUrl,
    TResult Function(_DownloadECredit value)? downloadECredit,
    required TResult orElse(),
  }) {
    if (downloadECredit != null) {
      return downloadECredit(this);
    }
    return orElse();
  }
}

abstract class _DownloadECredit implements DownloadECreditEvent {
  const factory _DownloadECredit() = _$DownloadECreditImpl;
}

/// @nodoc
mixin _$DownloadECreditState {
  DownloadPaymentAttachment get fileUrl => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  bool get isDownloading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DownloadECreditStateCopyWith<DownloadECreditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadECreditStateCopyWith<$Res> {
  factory $DownloadECreditStateCopyWith(DownloadECreditState value,
          $Res Function(DownloadECreditState) then) =
      _$DownloadECreditStateCopyWithImpl<$Res, DownloadECreditState>;
  @useResult
  $Res call(
      {DownloadPaymentAttachment fileUrl,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isDownloading});

  $DownloadPaymentAttachmentCopyWith<$Res> get fileUrl;
}

/// @nodoc
class _$DownloadECreditStateCopyWithImpl<$Res,
        $Val extends DownloadECreditState>
    implements $DownloadECreditStateCopyWith<$Res> {
  _$DownloadECreditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileUrl = null,
    Object? failureOrSuccessOption = null,
    Object? isDownloading = null,
  }) {
    return _then(_value.copyWith(
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as DownloadPaymentAttachment,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isDownloading: null == isDownloading
          ? _value.isDownloading
          : isDownloading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DownloadPaymentAttachmentCopyWith<$Res> get fileUrl {
    return $DownloadPaymentAttachmentCopyWith<$Res>(_value.fileUrl, (value) {
      return _then(_value.copyWith(fileUrl: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DownloadECreditStateImplCopyWith<$Res>
    implements $DownloadECreditStateCopyWith<$Res> {
  factory _$$DownloadECreditStateImplCopyWith(_$DownloadECreditStateImpl value,
          $Res Function(_$DownloadECreditStateImpl) then) =
      __$$DownloadECreditStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DownloadPaymentAttachment fileUrl,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      bool isDownloading});

  @override
  $DownloadPaymentAttachmentCopyWith<$Res> get fileUrl;
}

/// @nodoc
class __$$DownloadECreditStateImplCopyWithImpl<$Res>
    extends _$DownloadECreditStateCopyWithImpl<$Res, _$DownloadECreditStateImpl>
    implements _$$DownloadECreditStateImplCopyWith<$Res> {
  __$$DownloadECreditStateImplCopyWithImpl(_$DownloadECreditStateImpl _value,
      $Res Function(_$DownloadECreditStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileUrl = null,
    Object? failureOrSuccessOption = null,
    Object? isDownloading = null,
  }) {
    return _then(_$DownloadECreditStateImpl(
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as DownloadPaymentAttachment,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      isDownloading: null == isDownloading
          ? _value.isDownloading
          : isDownloading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DownloadECreditStateImpl implements _DownloadECreditState {
  const _$DownloadECreditStateImpl(
      {required this.fileUrl,
      required this.failureOrSuccessOption,
      required this.isDownloading});

  @override
  final DownloadPaymentAttachment fileUrl;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  @override
  final bool isDownloading;

  @override
  String toString() {
    return 'DownloadECreditState(fileUrl: $fileUrl, failureOrSuccessOption: $failureOrSuccessOption, isDownloading: $isDownloading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadECreditStateImpl &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.isDownloading, isDownloading) ||
                other.isDownloading == isDownloading));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, fileUrl, failureOrSuccessOption, isDownloading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadECreditStateImplCopyWith<_$DownloadECreditStateImpl>
      get copyWith =>
          __$$DownloadECreditStateImplCopyWithImpl<_$DownloadECreditStateImpl>(
              this, _$identity);
}

abstract class _DownloadECreditState implements DownloadECreditState {
  const factory _DownloadECreditState(
      {required final DownloadPaymentAttachment fileUrl,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final bool isDownloading}) = _$DownloadECreditStateImpl;

  @override
  DownloadPaymentAttachment get fileUrl;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  bool get isDownloading;
  @override
  @JsonKey(ignore: true)
  _$$DownloadECreditStateImplCopyWith<_$DownloadECreditStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

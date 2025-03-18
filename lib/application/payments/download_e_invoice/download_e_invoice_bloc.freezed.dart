// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_e_invoice_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DownloadEInvoiceEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrg salesOrg, String invoiceNumber)
        fetchUrl,
    required TResult Function() download,
    required TResult Function() openFile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(CustomerCodeInfo customerCodeInfo, SalesOrg salesOrg,
            String invoiceNumber)?
        fetchUrl,
    TResult? Function()? download,
    TResult? Function()? openFile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customerCodeInfo, SalesOrg salesOrg,
            String invoiceNumber)?
        fetchUrl,
    TResult Function()? download,
    TResult Function()? openFile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchUrl value) fetchUrl,
    required TResult Function(_Download value) download,
    required TResult Function(_OpenFile value) openFile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchUrl value)? fetchUrl,
    TResult? Function(_Download value)? download,
    TResult? Function(_OpenFile value)? openFile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchUrl value)? fetchUrl,
    TResult Function(_Download value)? download,
    TResult Function(_OpenFile value)? openFile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadEInvoiceEventCopyWith<$Res> {
  factory $DownloadEInvoiceEventCopyWith(DownloadEInvoiceEvent value,
          $Res Function(DownloadEInvoiceEvent) then) =
      _$DownloadEInvoiceEventCopyWithImpl<$Res, DownloadEInvoiceEvent>;
}

/// @nodoc
class _$DownloadEInvoiceEventCopyWithImpl<$Res,
        $Val extends DownloadEInvoiceEvent>
    implements $DownloadEInvoiceEventCopyWith<$Res> {
  _$DownloadEInvoiceEventCopyWithImpl(this._value, this._then);

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
}

/// @nodoc
class __$$initializedImplCopyWithImpl<$Res>
    extends _$DownloadEInvoiceEventCopyWithImpl<$Res, _$initializedImpl>
    implements _$$initializedImplCopyWith<$Res> {
  __$$initializedImplCopyWithImpl(
      _$initializedImpl _value, $Res Function(_$initializedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$initializedImpl implements _initialized {
  const _$initializedImpl();

  @override
  String toString() {
    return 'DownloadEInvoiceEvent.initialized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$initializedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrg salesOrg, String invoiceNumber)
        fetchUrl,
    required TResult Function() download,
    required TResult Function() openFile,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(CustomerCodeInfo customerCodeInfo, SalesOrg salesOrg,
            String invoiceNumber)?
        fetchUrl,
    TResult? Function()? download,
    TResult? Function()? openFile,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customerCodeInfo, SalesOrg salesOrg,
            String invoiceNumber)?
        fetchUrl,
    TResult Function()? download,
    TResult Function()? openFile,
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
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchUrl value) fetchUrl,
    required TResult Function(_Download value) download,
    required TResult Function(_OpenFile value) openFile,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchUrl value)? fetchUrl,
    TResult? Function(_Download value)? download,
    TResult? Function(_OpenFile value)? openFile,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchUrl value)? fetchUrl,
    TResult Function(_Download value)? download,
    TResult Function(_OpenFile value)? openFile,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _initialized implements DownloadEInvoiceEvent {
  const factory _initialized() = _$initializedImpl;
}

/// @nodoc
abstract class _$$FetchUrlImplCopyWith<$Res> {
  factory _$$FetchUrlImplCopyWith(
          _$FetchUrlImpl value, $Res Function(_$FetchUrlImpl) then) =
      __$$FetchUrlImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {CustomerCodeInfo customerCodeInfo,
      SalesOrg salesOrg,
      String invoiceNumber});

  $CustomerCodeInfoCopyWith<$Res> get customerCodeInfo;
}

/// @nodoc
class __$$FetchUrlImplCopyWithImpl<$Res>
    extends _$DownloadEInvoiceEventCopyWithImpl<$Res, _$FetchUrlImpl>
    implements _$$FetchUrlImplCopyWith<$Res> {
  __$$FetchUrlImplCopyWithImpl(
      _$FetchUrlImpl _value, $Res Function(_$FetchUrlImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeInfo = null,
    Object? salesOrg = null,
    Object? invoiceNumber = null,
  }) {
    return _then(_$FetchUrlImpl(
      customerCodeInfo: null == customerCodeInfo
          ? _value.customerCodeInfo
          : customerCodeInfo // ignore: cast_nullable_to_non_nullable
              as CustomerCodeInfo,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      invoiceNumber: null == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
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

class _$FetchUrlImpl implements _FetchUrl {
  const _$FetchUrlImpl(
      {required this.customerCodeInfo,
      required this.salesOrg,
      required this.invoiceNumber});

  @override
  final CustomerCodeInfo customerCodeInfo;
  @override
  final SalesOrg salesOrg;
  @override
  final String invoiceNumber;

  @override
  String toString() {
    return 'DownloadEInvoiceEvent.fetchUrl(customerCodeInfo: $customerCodeInfo, salesOrg: $salesOrg, invoiceNumber: $invoiceNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchUrlImpl &&
            (identical(other.customerCodeInfo, customerCodeInfo) ||
                other.customerCodeInfo == customerCodeInfo) &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.invoiceNumber, invoiceNumber) ||
                other.invoiceNumber == invoiceNumber));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, customerCodeInfo, salesOrg, invoiceNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchUrlImplCopyWith<_$FetchUrlImpl> get copyWith =>
      __$$FetchUrlImplCopyWithImpl<_$FetchUrlImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrg salesOrg, String invoiceNumber)
        fetchUrl,
    required TResult Function() download,
    required TResult Function() openFile,
  }) {
    return fetchUrl(customerCodeInfo, salesOrg, invoiceNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(CustomerCodeInfo customerCodeInfo, SalesOrg salesOrg,
            String invoiceNumber)?
        fetchUrl,
    TResult? Function()? download,
    TResult? Function()? openFile,
  }) {
    return fetchUrl?.call(customerCodeInfo, salesOrg, invoiceNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customerCodeInfo, SalesOrg salesOrg,
            String invoiceNumber)?
        fetchUrl,
    TResult Function()? download,
    TResult Function()? openFile,
    required TResult orElse(),
  }) {
    if (fetchUrl != null) {
      return fetchUrl(customerCodeInfo, salesOrg, invoiceNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchUrl value) fetchUrl,
    required TResult Function(_Download value) download,
    required TResult Function(_OpenFile value) openFile,
  }) {
    return fetchUrl(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchUrl value)? fetchUrl,
    TResult? Function(_Download value)? download,
    TResult? Function(_OpenFile value)? openFile,
  }) {
    return fetchUrl?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchUrl value)? fetchUrl,
    TResult Function(_Download value)? download,
    TResult Function(_OpenFile value)? openFile,
    required TResult orElse(),
  }) {
    if (fetchUrl != null) {
      return fetchUrl(this);
    }
    return orElse();
  }
}

abstract class _FetchUrl implements DownloadEInvoiceEvent {
  const factory _FetchUrl(
      {required final CustomerCodeInfo customerCodeInfo,
      required final SalesOrg salesOrg,
      required final String invoiceNumber}) = _$FetchUrlImpl;

  CustomerCodeInfo get customerCodeInfo;
  SalesOrg get salesOrg;
  String get invoiceNumber;
  @JsonKey(ignore: true)
  _$$FetchUrlImplCopyWith<_$FetchUrlImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DownloadImplCopyWith<$Res> {
  factory _$$DownloadImplCopyWith(
          _$DownloadImpl value, $Res Function(_$DownloadImpl) then) =
      __$$DownloadImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownloadImplCopyWithImpl<$Res>
    extends _$DownloadEInvoiceEventCopyWithImpl<$Res, _$DownloadImpl>
    implements _$$DownloadImplCopyWith<$Res> {
  __$$DownloadImplCopyWithImpl(
      _$DownloadImpl _value, $Res Function(_$DownloadImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DownloadImpl implements _Download {
  const _$DownloadImpl();

  @override
  String toString() {
    return 'DownloadEInvoiceEvent.download()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DownloadImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrg salesOrg, String invoiceNumber)
        fetchUrl,
    required TResult Function() download,
    required TResult Function() openFile,
  }) {
    return download();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(CustomerCodeInfo customerCodeInfo, SalesOrg salesOrg,
            String invoiceNumber)?
        fetchUrl,
    TResult? Function()? download,
    TResult? Function()? openFile,
  }) {
    return download?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customerCodeInfo, SalesOrg salesOrg,
            String invoiceNumber)?
        fetchUrl,
    TResult Function()? download,
    TResult Function()? openFile,
    required TResult orElse(),
  }) {
    if (download != null) {
      return download();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchUrl value) fetchUrl,
    required TResult Function(_Download value) download,
    required TResult Function(_OpenFile value) openFile,
  }) {
    return download(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchUrl value)? fetchUrl,
    TResult? Function(_Download value)? download,
    TResult? Function(_OpenFile value)? openFile,
  }) {
    return download?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchUrl value)? fetchUrl,
    TResult Function(_Download value)? download,
    TResult Function(_OpenFile value)? openFile,
    required TResult orElse(),
  }) {
    if (download != null) {
      return download(this);
    }
    return orElse();
  }
}

abstract class _Download implements DownloadEInvoiceEvent {
  const factory _Download() = _$DownloadImpl;
}

/// @nodoc
abstract class _$$OpenFileImplCopyWith<$Res> {
  factory _$$OpenFileImplCopyWith(
          _$OpenFileImpl value, $Res Function(_$OpenFileImpl) then) =
      __$$OpenFileImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OpenFileImplCopyWithImpl<$Res>
    extends _$DownloadEInvoiceEventCopyWithImpl<$Res, _$OpenFileImpl>
    implements _$$OpenFileImplCopyWith<$Res> {
  __$$OpenFileImplCopyWithImpl(
      _$OpenFileImpl _value, $Res Function(_$OpenFileImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$OpenFileImpl implements _OpenFile {
  const _$OpenFileImpl();

  @override
  String toString() {
    return 'DownloadEInvoiceEvent.openFile()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OpenFileImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(CustomerCodeInfo customerCodeInfo,
            SalesOrg salesOrg, String invoiceNumber)
        fetchUrl,
    required TResult Function() download,
    required TResult Function() openFile,
  }) {
    return openFile();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(CustomerCodeInfo customerCodeInfo, SalesOrg salesOrg,
            String invoiceNumber)?
        fetchUrl,
    TResult? Function()? download,
    TResult? Function()? openFile,
  }) {
    return openFile?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(CustomerCodeInfo customerCodeInfo, SalesOrg salesOrg,
            String invoiceNumber)?
        fetchUrl,
    TResult Function()? download,
    TResult Function()? openFile,
    required TResult orElse(),
  }) {
    if (openFile != null) {
      return openFile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_initialized value) initialized,
    required TResult Function(_FetchUrl value) fetchUrl,
    required TResult Function(_Download value) download,
    required TResult Function(_OpenFile value) openFile,
  }) {
    return openFile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_initialized value)? initialized,
    TResult? Function(_FetchUrl value)? fetchUrl,
    TResult? Function(_Download value)? download,
    TResult? Function(_OpenFile value)? openFile,
  }) {
    return openFile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_initialized value)? initialized,
    TResult Function(_FetchUrl value)? fetchUrl,
    TResult Function(_Download value)? download,
    TResult Function(_OpenFile value)? openFile,
    required TResult orElse(),
  }) {
    if (openFile != null) {
      return openFile(this);
    }
    return orElse();
  }
}

abstract class _OpenFile implements DownloadEInvoiceEvent {
  const factory _OpenFile() = _$OpenFileImpl;
}

/// @nodoc
mixin _$DownloadEInvoiceState {
  bool get isDownloading => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  DownloadPaymentAttachment get eInvoiceUrl =>
      throw _privateConstructorUsedError;
  AttachmentFileBuffer get eInvoice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DownloadEInvoiceStateCopyWith<DownloadEInvoiceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadEInvoiceStateCopyWith<$Res> {
  factory $DownloadEInvoiceStateCopyWith(DownloadEInvoiceState value,
          $Res Function(DownloadEInvoiceState) then) =
      _$DownloadEInvoiceStateCopyWithImpl<$Res, DownloadEInvoiceState>;
  @useResult
  $Res call(
      {bool isDownloading,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      DownloadPaymentAttachment eInvoiceUrl,
      AttachmentFileBuffer eInvoice});

  $DownloadPaymentAttachmentCopyWith<$Res> get eInvoiceUrl;
  $AttachmentFileBufferCopyWith<$Res> get eInvoice;
}

/// @nodoc
class _$DownloadEInvoiceStateCopyWithImpl<$Res,
        $Val extends DownloadEInvoiceState>
    implements $DownloadEInvoiceStateCopyWith<$Res> {
  _$DownloadEInvoiceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDownloading = null,
    Object? failureOrSuccessOption = null,
    Object? eInvoiceUrl = null,
    Object? eInvoice = null,
  }) {
    return _then(_value.copyWith(
      isDownloading: null == isDownloading
          ? _value.isDownloading
          : isDownloading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      eInvoiceUrl: null == eInvoiceUrl
          ? _value.eInvoiceUrl
          : eInvoiceUrl // ignore: cast_nullable_to_non_nullable
              as DownloadPaymentAttachment,
      eInvoice: null == eInvoice
          ? _value.eInvoice
          : eInvoice // ignore: cast_nullable_to_non_nullable
              as AttachmentFileBuffer,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DownloadPaymentAttachmentCopyWith<$Res> get eInvoiceUrl {
    return $DownloadPaymentAttachmentCopyWith<$Res>(_value.eInvoiceUrl,
        (value) {
      return _then(_value.copyWith(eInvoiceUrl: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AttachmentFileBufferCopyWith<$Res> get eInvoice {
    return $AttachmentFileBufferCopyWith<$Res>(_value.eInvoice, (value) {
      return _then(_value.copyWith(eInvoice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DownloadEInvoiceStateImplCopyWith<$Res>
    implements $DownloadEInvoiceStateCopyWith<$Res> {
  factory _$$DownloadEInvoiceStateImplCopyWith(
          _$DownloadEInvoiceStateImpl value,
          $Res Function(_$DownloadEInvoiceStateImpl) then) =
      __$$DownloadEInvoiceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isDownloading,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      DownloadPaymentAttachment eInvoiceUrl,
      AttachmentFileBuffer eInvoice});

  @override
  $DownloadPaymentAttachmentCopyWith<$Res> get eInvoiceUrl;
  @override
  $AttachmentFileBufferCopyWith<$Res> get eInvoice;
}

/// @nodoc
class __$$DownloadEInvoiceStateImplCopyWithImpl<$Res>
    extends _$DownloadEInvoiceStateCopyWithImpl<$Res,
        _$DownloadEInvoiceStateImpl>
    implements _$$DownloadEInvoiceStateImplCopyWith<$Res> {
  __$$DownloadEInvoiceStateImplCopyWithImpl(_$DownloadEInvoiceStateImpl _value,
      $Res Function(_$DownloadEInvoiceStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDownloading = null,
    Object? failureOrSuccessOption = null,
    Object? eInvoiceUrl = null,
    Object? eInvoice = null,
  }) {
    return _then(_$DownloadEInvoiceStateImpl(
      isDownloading: null == isDownloading
          ? _value.isDownloading
          : isDownloading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      eInvoiceUrl: null == eInvoiceUrl
          ? _value.eInvoiceUrl
          : eInvoiceUrl // ignore: cast_nullable_to_non_nullable
              as DownloadPaymentAttachment,
      eInvoice: null == eInvoice
          ? _value.eInvoice
          : eInvoice // ignore: cast_nullable_to_non_nullable
              as AttachmentFileBuffer,
    ));
  }
}

/// @nodoc

class _$DownloadEInvoiceStateImpl extends _DownloadEInvoiceState {
  const _$DownloadEInvoiceStateImpl(
      {required this.isDownloading,
      required this.failureOrSuccessOption,
      required this.eInvoiceUrl,
      required this.eInvoice})
      : super._();

  @override
  final bool isDownloading;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  @override
  final DownloadPaymentAttachment eInvoiceUrl;
  @override
  final AttachmentFileBuffer eInvoice;

  @override
  String toString() {
    return 'DownloadEInvoiceState(isDownloading: $isDownloading, failureOrSuccessOption: $failureOrSuccessOption, eInvoiceUrl: $eInvoiceUrl, eInvoice: $eInvoice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadEInvoiceStateImpl &&
            (identical(other.isDownloading, isDownloading) ||
                other.isDownloading == isDownloading) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.eInvoiceUrl, eInvoiceUrl) ||
                other.eInvoiceUrl == eInvoiceUrl) &&
            (identical(other.eInvoice, eInvoice) ||
                other.eInvoice == eInvoice));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDownloading,
      failureOrSuccessOption, eInvoiceUrl, eInvoice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadEInvoiceStateImplCopyWith<_$DownloadEInvoiceStateImpl>
      get copyWith => __$$DownloadEInvoiceStateImplCopyWithImpl<
          _$DownloadEInvoiceStateImpl>(this, _$identity);
}

abstract class _DownloadEInvoiceState extends DownloadEInvoiceState {
  const factory _DownloadEInvoiceState(
      {required final bool isDownloading,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final DownloadPaymentAttachment eInvoiceUrl,
      required final AttachmentFileBuffer
          eInvoice}) = _$DownloadEInvoiceStateImpl;
  const _DownloadEInvoiceState._() : super._();

  @override
  bool get isDownloading;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  DownloadPaymentAttachment get eInvoiceUrl;
  @override
  AttachmentFileBuffer get eInvoice;
  @override
  @JsonKey(ignore: true)
  _$$DownloadEInvoiceStateImplCopyWith<_$DownloadEInvoiceStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

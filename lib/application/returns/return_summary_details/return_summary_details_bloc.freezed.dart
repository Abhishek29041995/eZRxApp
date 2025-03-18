// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_summary_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReturnSummaryDetailsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(ReturnItem returnItem) fetch,
    required TResult Function(PoDocuments file) downloadFile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(ReturnItem returnItem)? fetch,
    TResult? Function(PoDocuments file)? downloadFile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(ReturnItem returnItem)? fetch,
    TResult Function(PoDocuments file)? downloadFile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_DownloadFile value) downloadFile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_DownloadFile value)? downloadFile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_DownloadFile value)? downloadFile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnSummaryDetailsEventCopyWith<$Res> {
  factory $ReturnSummaryDetailsEventCopyWith(ReturnSummaryDetailsEvent value,
          $Res Function(ReturnSummaryDetailsEvent) then) =
      _$ReturnSummaryDetailsEventCopyWithImpl<$Res, ReturnSummaryDetailsEvent>;
}

/// @nodoc
class _$ReturnSummaryDetailsEventCopyWithImpl<$Res,
        $Val extends ReturnSummaryDetailsEvent>
    implements $ReturnSummaryDetailsEventCopyWith<$Res> {
  _$ReturnSummaryDetailsEventCopyWithImpl(this._value, this._then);

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
    extends _$ReturnSummaryDetailsEventCopyWithImpl<$Res, _$InitializedImpl>
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
    return 'ReturnSummaryDetailsEvent.initialized()';
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
    required TResult Function(ReturnItem returnItem) fetch,
    required TResult Function(PoDocuments file) downloadFile,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(ReturnItem returnItem)? fetch,
    TResult? Function(PoDocuments file)? downloadFile,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(ReturnItem returnItem)? fetch,
    TResult Function(PoDocuments file)? downloadFile,
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
    required TResult Function(_DownloadFile value) downloadFile,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_DownloadFile value)? downloadFile,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_DownloadFile value)? downloadFile,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements ReturnSummaryDetailsEvent {
  const factory _Initialized() = _$InitializedImpl;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReturnItem returnItem});

  $ReturnItemCopyWith<$Res> get returnItem;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$ReturnSummaryDetailsEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnItem = null,
  }) {
    return _then(_$FetchImpl(
      returnItem: null == returnItem
          ? _value.returnItem
          : returnItem // ignore: cast_nullable_to_non_nullable
              as ReturnItem,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnItemCopyWith<$Res> get returnItem {
    return $ReturnItemCopyWith<$Res>(_value.returnItem, (value) {
      return _then(_value.copyWith(returnItem: value));
    });
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl({required this.returnItem});

  @override
  final ReturnItem returnItem;

  @override
  String toString() {
    return 'ReturnSummaryDetailsEvent.fetch(returnItem: $returnItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.returnItem, returnItem) ||
                other.returnItem == returnItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, returnItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(ReturnItem returnItem) fetch,
    required TResult Function(PoDocuments file) downloadFile,
  }) {
    return fetch(returnItem);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(ReturnItem returnItem)? fetch,
    TResult? Function(PoDocuments file)? downloadFile,
  }) {
    return fetch?.call(returnItem);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(ReturnItem returnItem)? fetch,
    TResult Function(PoDocuments file)? downloadFile,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(returnItem);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_DownloadFile value) downloadFile,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_DownloadFile value)? downloadFile,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_DownloadFile value)? downloadFile,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements ReturnSummaryDetailsEvent {
  const factory _Fetch({required final ReturnItem returnItem}) = _$FetchImpl;

  ReturnItem get returnItem;
  @JsonKey(ignore: true)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DownloadFileImplCopyWith<$Res> {
  factory _$$DownloadFileImplCopyWith(
          _$DownloadFileImpl value, $Res Function(_$DownloadFileImpl) then) =
      __$$DownloadFileImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PoDocuments file});

  $PoDocumentsCopyWith<$Res> get file;
}

/// @nodoc
class __$$DownloadFileImplCopyWithImpl<$Res>
    extends _$ReturnSummaryDetailsEventCopyWithImpl<$Res, _$DownloadFileImpl>
    implements _$$DownloadFileImplCopyWith<$Res> {
  __$$DownloadFileImplCopyWithImpl(
      _$DownloadFileImpl _value, $Res Function(_$DownloadFileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_$DownloadFileImpl(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as PoDocuments,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PoDocumentsCopyWith<$Res> get file {
    return $PoDocumentsCopyWith<$Res>(_value.file, (value) {
      return _then(_value.copyWith(file: value));
    });
  }
}

/// @nodoc

class _$DownloadFileImpl implements _DownloadFile {
  const _$DownloadFileImpl({required this.file});

  @override
  final PoDocuments file;

  @override
  String toString() {
    return 'ReturnSummaryDetailsEvent.downloadFile(file: $file)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadFileImpl &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadFileImplCopyWith<_$DownloadFileImpl> get copyWith =>
      __$$DownloadFileImplCopyWithImpl<_$DownloadFileImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(ReturnItem returnItem) fetch,
    required TResult Function(PoDocuments file) downloadFile,
  }) {
    return downloadFile(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(ReturnItem returnItem)? fetch,
    TResult? Function(PoDocuments file)? downloadFile,
  }) {
    return downloadFile?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(ReturnItem returnItem)? fetch,
    TResult Function(PoDocuments file)? downloadFile,
    required TResult orElse(),
  }) {
    if (downloadFile != null) {
      return downloadFile(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_DownloadFile value) downloadFile,
  }) {
    return downloadFile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_DownloadFile value)? downloadFile,
  }) {
    return downloadFile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_DownloadFile value)? downloadFile,
    required TResult orElse(),
  }) {
    if (downloadFile != null) {
      return downloadFile(this);
    }
    return orElse();
  }
}

abstract class _DownloadFile implements ReturnSummaryDetailsEvent {
  const factory _DownloadFile({required final PoDocuments file}) =
      _$DownloadFileImpl;

  PoDocuments get file;
  @JsonKey(ignore: true)
  _$$DownloadFileImplCopyWith<_$DownloadFileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReturnSummaryDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;
  ReturnRequestInformation get requestInformation =>
      throw _privateConstructorUsedError;
  ReturnRequestInformationHeader get requestInformationHeader =>
      throw _privateConstructorUsedError;
  List<PoDocuments> get downloadingAttachments =>
      throw _privateConstructorUsedError;
  PoDocuments get downloadedAttachment => throw _privateConstructorUsedError;
  Option<Either<ApiFailure, dynamic>> get downloadFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnSummaryDetailsStateCopyWith<ReturnSummaryDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnSummaryDetailsStateCopyWith<$Res> {
  factory $ReturnSummaryDetailsStateCopyWith(ReturnSummaryDetailsState value,
          $Res Function(ReturnSummaryDetailsState) then) =
      _$ReturnSummaryDetailsStateCopyWithImpl<$Res, ReturnSummaryDetailsState>;
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      ReturnRequestInformation requestInformation,
      ReturnRequestInformationHeader requestInformationHeader,
      List<PoDocuments> downloadingAttachments,
      PoDocuments downloadedAttachment,
      Option<Either<ApiFailure, dynamic>> downloadFailureOrSuccessOption});

  $ReturnRequestInformationCopyWith<$Res> get requestInformation;
  $ReturnRequestInformationHeaderCopyWith<$Res> get requestInformationHeader;
  $PoDocumentsCopyWith<$Res> get downloadedAttachment;
}

/// @nodoc
class _$ReturnSummaryDetailsStateCopyWithImpl<$Res,
        $Val extends ReturnSummaryDetailsState>
    implements $ReturnSummaryDetailsStateCopyWith<$Res> {
  _$ReturnSummaryDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? failureOrSuccessOption = null,
    Object? requestInformation = null,
    Object? requestInformationHeader = null,
    Object? downloadingAttachments = null,
    Object? downloadedAttachment = null,
    Object? downloadFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      requestInformation: null == requestInformation
          ? _value.requestInformation
          : requestInformation // ignore: cast_nullable_to_non_nullable
              as ReturnRequestInformation,
      requestInformationHeader: null == requestInformationHeader
          ? _value.requestInformationHeader
          : requestInformationHeader // ignore: cast_nullable_to_non_nullable
              as ReturnRequestInformationHeader,
      downloadingAttachments: null == downloadingAttachments
          ? _value.downloadingAttachments
          : downloadingAttachments // ignore: cast_nullable_to_non_nullable
              as List<PoDocuments>,
      downloadedAttachment: null == downloadedAttachment
          ? _value.downloadedAttachment
          : downloadedAttachment // ignore: cast_nullable_to_non_nullable
              as PoDocuments,
      downloadFailureOrSuccessOption: null == downloadFailureOrSuccessOption
          ? _value.downloadFailureOrSuccessOption
          : downloadFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnRequestInformationCopyWith<$Res> get requestInformation {
    return $ReturnRequestInformationCopyWith<$Res>(_value.requestInformation,
        (value) {
      return _then(_value.copyWith(requestInformation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReturnRequestInformationHeaderCopyWith<$Res> get requestInformationHeader {
    return $ReturnRequestInformationHeaderCopyWith<$Res>(
        _value.requestInformationHeader, (value) {
      return _then(_value.copyWith(requestInformationHeader: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PoDocumentsCopyWith<$Res> get downloadedAttachment {
    return $PoDocumentsCopyWith<$Res>(_value.downloadedAttachment, (value) {
      return _then(_value.copyWith(downloadedAttachment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReturnSummaryDetailsStateImplCopyWith<$Res>
    implements $ReturnSummaryDetailsStateCopyWith<$Res> {
  factory _$$ReturnSummaryDetailsStateImplCopyWith(
          _$ReturnSummaryDetailsStateImpl value,
          $Res Function(_$ReturnSummaryDetailsStateImpl) then) =
      __$$ReturnSummaryDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      ReturnRequestInformation requestInformation,
      ReturnRequestInformationHeader requestInformationHeader,
      List<PoDocuments> downloadingAttachments,
      PoDocuments downloadedAttachment,
      Option<Either<ApiFailure, dynamic>> downloadFailureOrSuccessOption});

  @override
  $ReturnRequestInformationCopyWith<$Res> get requestInformation;
  @override
  $ReturnRequestInformationHeaderCopyWith<$Res> get requestInformationHeader;
  @override
  $PoDocumentsCopyWith<$Res> get downloadedAttachment;
}

/// @nodoc
class __$$ReturnSummaryDetailsStateImplCopyWithImpl<$Res>
    extends _$ReturnSummaryDetailsStateCopyWithImpl<$Res,
        _$ReturnSummaryDetailsStateImpl>
    implements _$$ReturnSummaryDetailsStateImplCopyWith<$Res> {
  __$$ReturnSummaryDetailsStateImplCopyWithImpl(
      _$ReturnSummaryDetailsStateImpl _value,
      $Res Function(_$ReturnSummaryDetailsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? failureOrSuccessOption = null,
    Object? requestInformation = null,
    Object? requestInformationHeader = null,
    Object? downloadingAttachments = null,
    Object? downloadedAttachment = null,
    Object? downloadFailureOrSuccessOption = null,
  }) {
    return _then(_$ReturnSummaryDetailsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: null == failureOrSuccessOption
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
      requestInformation: null == requestInformation
          ? _value.requestInformation
          : requestInformation // ignore: cast_nullable_to_non_nullable
              as ReturnRequestInformation,
      requestInformationHeader: null == requestInformationHeader
          ? _value.requestInformationHeader
          : requestInformationHeader // ignore: cast_nullable_to_non_nullable
              as ReturnRequestInformationHeader,
      downloadingAttachments: null == downloadingAttachments
          ? _value._downloadingAttachments
          : downloadingAttachments // ignore: cast_nullable_to_non_nullable
              as List<PoDocuments>,
      downloadedAttachment: null == downloadedAttachment
          ? _value.downloadedAttachment
          : downloadedAttachment // ignore: cast_nullable_to_non_nullable
              as PoDocuments,
      downloadFailureOrSuccessOption: null == downloadFailureOrSuccessOption
          ? _value.downloadFailureOrSuccessOption
          : downloadFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ApiFailure, dynamic>>,
    ));
  }
}

/// @nodoc

class _$ReturnSummaryDetailsStateImpl implements _ReturnSummaryDetailsState {
  const _$ReturnSummaryDetailsStateImpl(
      {required this.isLoading,
      required this.failureOrSuccessOption,
      required this.requestInformation,
      required this.requestInformationHeader,
      required final List<PoDocuments> downloadingAttachments,
      required this.downloadedAttachment,
      required this.downloadFailureOrSuccessOption})
      : _downloadingAttachments = downloadingAttachments;

  @override
  final bool isLoading;
  @override
  final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption;
  @override
  final ReturnRequestInformation requestInformation;
  @override
  final ReturnRequestInformationHeader requestInformationHeader;
  final List<PoDocuments> _downloadingAttachments;
  @override
  List<PoDocuments> get downloadingAttachments {
    if (_downloadingAttachments is EqualUnmodifiableListView)
      return _downloadingAttachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_downloadingAttachments);
  }

  @override
  final PoDocuments downloadedAttachment;
  @override
  final Option<Either<ApiFailure, dynamic>> downloadFailureOrSuccessOption;

  @override
  String toString() {
    return 'ReturnSummaryDetailsState(isLoading: $isLoading, failureOrSuccessOption: $failureOrSuccessOption, requestInformation: $requestInformation, requestInformationHeader: $requestInformationHeader, downloadingAttachments: $downloadingAttachments, downloadedAttachment: $downloadedAttachment, downloadFailureOrSuccessOption: $downloadFailureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnSummaryDetailsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.failureOrSuccessOption, failureOrSuccessOption) ||
                other.failureOrSuccessOption == failureOrSuccessOption) &&
            (identical(other.requestInformation, requestInformation) ||
                other.requestInformation == requestInformation) &&
            (identical(
                    other.requestInformationHeader, requestInformationHeader) ||
                other.requestInformationHeader == requestInformationHeader) &&
            const DeepCollectionEquality().equals(
                other._downloadingAttachments, _downloadingAttachments) &&
            (identical(other.downloadedAttachment, downloadedAttachment) ||
                other.downloadedAttachment == downloadedAttachment) &&
            (identical(other.downloadFailureOrSuccessOption,
                    downloadFailureOrSuccessOption) ||
                other.downloadFailureOrSuccessOption ==
                    downloadFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      failureOrSuccessOption,
      requestInformation,
      requestInformationHeader,
      const DeepCollectionEquality().hash(_downloadingAttachments),
      downloadedAttachment,
      downloadFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReturnSummaryDetailsStateImplCopyWith<_$ReturnSummaryDetailsStateImpl>
      get copyWith => __$$ReturnSummaryDetailsStateImplCopyWithImpl<
          _$ReturnSummaryDetailsStateImpl>(this, _$identity);
}

abstract class _ReturnSummaryDetailsState implements ReturnSummaryDetailsState {
  const factory _ReturnSummaryDetailsState(
      {required final bool isLoading,
      required final Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
      required final ReturnRequestInformation requestInformation,
      required final ReturnRequestInformationHeader requestInformationHeader,
      required final List<PoDocuments> downloadingAttachments,
      required final PoDocuments downloadedAttachment,
      required final Option<Either<ApiFailure, dynamic>>
          downloadFailureOrSuccessOption}) = _$ReturnSummaryDetailsStateImpl;

  @override
  bool get isLoading;
  @override
  Option<Either<ApiFailure, dynamic>> get failureOrSuccessOption;
  @override
  ReturnRequestInformation get requestInformation;
  @override
  ReturnRequestInformationHeader get requestInformationHeader;
  @override
  List<PoDocuments> get downloadingAttachments;
  @override
  PoDocuments get downloadedAttachment;
  @override
  Option<Either<ApiFailure, dynamic>> get downloadFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$ReturnSummaryDetailsStateImplCopyWith<_$ReturnSummaryDetailsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

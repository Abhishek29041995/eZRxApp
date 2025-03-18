// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_payment_attachments.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DownloadPaymentAttachment {
  String get url => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DownloadPaymentAttachmentCopyWith<DownloadPaymentAttachment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadPaymentAttachmentCopyWith<$Res> {
  factory $DownloadPaymentAttachmentCopyWith(DownloadPaymentAttachment value,
          $Res Function(DownloadPaymentAttachment) then) =
      _$DownloadPaymentAttachmentCopyWithImpl<$Res, DownloadPaymentAttachment>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class _$DownloadPaymentAttachmentCopyWithImpl<$Res,
        $Val extends DownloadPaymentAttachment>
    implements $DownloadPaymentAttachmentCopyWith<$Res> {
  _$DownloadPaymentAttachmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DownloadPaymentAttachmentImplCopyWith<$Res>
    implements $DownloadPaymentAttachmentCopyWith<$Res> {
  factory _$$DownloadPaymentAttachmentImplCopyWith(
          _$DownloadPaymentAttachmentImpl value,
          $Res Function(_$DownloadPaymentAttachmentImpl) then) =
      __$$DownloadPaymentAttachmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$DownloadPaymentAttachmentImplCopyWithImpl<$Res>
    extends _$DownloadPaymentAttachmentCopyWithImpl<$Res,
        _$DownloadPaymentAttachmentImpl>
    implements _$$DownloadPaymentAttachmentImplCopyWith<$Res> {
  __$$DownloadPaymentAttachmentImplCopyWithImpl(
      _$DownloadPaymentAttachmentImpl _value,
      $Res Function(_$DownloadPaymentAttachmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$DownloadPaymentAttachmentImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DownloadPaymentAttachmentImpl extends _DownloadPaymentAttachment {
  const _$DownloadPaymentAttachmentImpl({required this.url}) : super._();

  @override
  final String url;

  @override
  String toString() {
    return 'DownloadPaymentAttachment(url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadPaymentAttachmentImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadPaymentAttachmentImplCopyWith<_$DownloadPaymentAttachmentImpl>
      get copyWith => __$$DownloadPaymentAttachmentImplCopyWithImpl<
          _$DownloadPaymentAttachmentImpl>(this, _$identity);
}

abstract class _DownloadPaymentAttachment extends DownloadPaymentAttachment {
  const factory _DownloadPaymentAttachment({required final String url}) =
      _$DownloadPaymentAttachmentImpl;
  const _DownloadPaymentAttachment._() : super._();

  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$DownloadPaymentAttachmentImplCopyWith<_$DownloadPaymentAttachmentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

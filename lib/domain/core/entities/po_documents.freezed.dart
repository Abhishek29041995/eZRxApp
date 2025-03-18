// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'po_documents.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PoDocuments {
  String get url => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  FileSize get size => throw _privateConstructorUsedError;
  bool get isPoison => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PoDocumentsCopyWith<PoDocuments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoDocumentsCopyWith<$Res> {
  factory $PoDocumentsCopyWith(
          PoDocuments value, $Res Function(PoDocuments) then) =
      _$PoDocumentsCopyWithImpl<$Res, PoDocuments>;
  @useResult
  $Res call({String url, String name, FileSize size, bool isPoison});
}

/// @nodoc
class _$PoDocumentsCopyWithImpl<$Res, $Val extends PoDocuments>
    implements $PoDocumentsCopyWith<$Res> {
  _$PoDocumentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? name = null,
    Object? size = null,
    Object? isPoison = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as FileSize,
      isPoison: null == isPoison
          ? _value.isPoison
          : isPoison // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PoDocumentsImplCopyWith<$Res>
    implements $PoDocumentsCopyWith<$Res> {
  factory _$$PoDocumentsImplCopyWith(
          _$PoDocumentsImpl value, $Res Function(_$PoDocumentsImpl) then) =
      __$$PoDocumentsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url, String name, FileSize size, bool isPoison});
}

/// @nodoc
class __$$PoDocumentsImplCopyWithImpl<$Res>
    extends _$PoDocumentsCopyWithImpl<$Res, _$PoDocumentsImpl>
    implements _$$PoDocumentsImplCopyWith<$Res> {
  __$$PoDocumentsImplCopyWithImpl(
      _$PoDocumentsImpl _value, $Res Function(_$PoDocumentsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? name = null,
    Object? size = null,
    Object? isPoison = null,
  }) {
    return _then(_$PoDocumentsImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as FileSize,
      isPoison: null == isPoison
          ? _value.isPoison
          : isPoison // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PoDocumentsImpl extends _PoDocuments {
  _$PoDocumentsImpl(
      {required this.url,
      required this.name,
      required this.size,
      required this.isPoison})
      : super._();

  @override
  final String url;
  @override
  final String name;
  @override
  final FileSize size;
  @override
  final bool isPoison;

  @override
  String toString() {
    return 'PoDocuments(url: $url, name: $name, size: $size, isPoison: $isPoison)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PoDocumentsImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.isPoison, isPoison) ||
                other.isPoison == isPoison));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url, name, size, isPoison);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PoDocumentsImplCopyWith<_$PoDocumentsImpl> get copyWith =>
      __$$PoDocumentsImplCopyWithImpl<_$PoDocumentsImpl>(this, _$identity);
}

abstract class _PoDocuments extends PoDocuments {
  factory _PoDocuments(
      {required final String url,
      required final String name,
      required final FileSize size,
      required final bool isPoison}) = _$PoDocumentsImpl;
  _PoDocuments._() : super._();

  @override
  String get url;
  @override
  String get name;
  @override
  FileSize get size;
  @override
  bool get isPoison;
  @override
  @JsonKey(ignore: true)
  _$$PoDocumentsImplCopyWith<_$PoDocumentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_us_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ContactUsDetails {
  HtmlContent get content => throw _privateConstructorUsedError;
  String get preloginSendToEmail => throw _privateConstructorUsedError;
  String get postloginSendToEmail => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContactUsDetailsCopyWith<ContactUsDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactUsDetailsCopyWith<$Res> {
  factory $ContactUsDetailsCopyWith(
          ContactUsDetails value, $Res Function(ContactUsDetails) then) =
      _$ContactUsDetailsCopyWithImpl<$Res, ContactUsDetails>;
  @useResult
  $Res call(
      {HtmlContent content,
      String preloginSendToEmail,
      String postloginSendToEmail});
}

/// @nodoc
class _$ContactUsDetailsCopyWithImpl<$Res, $Val extends ContactUsDetails>
    implements $ContactUsDetailsCopyWith<$Res> {
  _$ContactUsDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? preloginSendToEmail = null,
    Object? postloginSendToEmail = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as HtmlContent,
      preloginSendToEmail: null == preloginSendToEmail
          ? _value.preloginSendToEmail
          : preloginSendToEmail // ignore: cast_nullable_to_non_nullable
              as String,
      postloginSendToEmail: null == postloginSendToEmail
          ? _value.postloginSendToEmail
          : postloginSendToEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactUsDetailsImplCopyWith<$Res>
    implements $ContactUsDetailsCopyWith<$Res> {
  factory _$$ContactUsDetailsImplCopyWith(_$ContactUsDetailsImpl value,
          $Res Function(_$ContactUsDetailsImpl) then) =
      __$$ContactUsDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HtmlContent content,
      String preloginSendToEmail,
      String postloginSendToEmail});
}

/// @nodoc
class __$$ContactUsDetailsImplCopyWithImpl<$Res>
    extends _$ContactUsDetailsCopyWithImpl<$Res, _$ContactUsDetailsImpl>
    implements _$$ContactUsDetailsImplCopyWith<$Res> {
  __$$ContactUsDetailsImplCopyWithImpl(_$ContactUsDetailsImpl _value,
      $Res Function(_$ContactUsDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? preloginSendToEmail = null,
    Object? postloginSendToEmail = null,
  }) {
    return _then(_$ContactUsDetailsImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as HtmlContent,
      preloginSendToEmail: null == preloginSendToEmail
          ? _value.preloginSendToEmail
          : preloginSendToEmail // ignore: cast_nullable_to_non_nullable
              as String,
      postloginSendToEmail: null == postloginSendToEmail
          ? _value.postloginSendToEmail
          : postloginSendToEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ContactUsDetailsImpl extends _ContactUsDetails {
  const _$ContactUsDetailsImpl(
      {required this.content,
      required this.preloginSendToEmail,
      required this.postloginSendToEmail})
      : super._();

  @override
  final HtmlContent content;
  @override
  final String preloginSendToEmail;
  @override
  final String postloginSendToEmail;

  @override
  String toString() {
    return 'ContactUsDetails(content: $content, preloginSendToEmail: $preloginSendToEmail, postloginSendToEmail: $postloginSendToEmail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactUsDetailsImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.preloginSendToEmail, preloginSendToEmail) ||
                other.preloginSendToEmail == preloginSendToEmail) &&
            (identical(other.postloginSendToEmail, postloginSendToEmail) ||
                other.postloginSendToEmail == postloginSendToEmail));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, content, preloginSendToEmail, postloginSendToEmail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactUsDetailsImplCopyWith<_$ContactUsDetailsImpl> get copyWith =>
      __$$ContactUsDetailsImplCopyWithImpl<_$ContactUsDetailsImpl>(
          this, _$identity);
}

abstract class _ContactUsDetails extends ContactUsDetails {
  const factory _ContactUsDetails(
      {required final HtmlContent content,
      required final String preloginSendToEmail,
      required final String postloginSendToEmail}) = _$ContactUsDetailsImpl;
  const _ContactUsDetails._() : super._();

  @override
  HtmlContent get content;
  @override
  String get preloginSendToEmail;
  @override
  String get postloginSendToEmail;
  @override
  @JsonKey(ignore: true)
  _$$ContactUsDetailsImplCopyWith<_$ContactUsDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

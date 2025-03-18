// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_us_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContactUsDetailsDto _$ContactUsDetailsDtoFromJson(Map<String, dynamic> json) {
  return _ContactUsDetailsDto.fromJson(json);
}

/// @nodoc
mixin _$ContactUsDetailsDto {
  @JsonKey(
      name: 'content',
      readValue: JsonReadValueHelper.readValueString,
      defaultValue: '')
  String get content => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'preloginSendToEmail',
      readValue: JsonReadValueHelper.readValueString,
      defaultValue: '')
  String get preloginSendToEmail => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'postloginSendToEmail',
      readValue: JsonReadValueHelper.readValueString,
      defaultValue: '')
  String get postloginSendToEmail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactUsDetailsDtoCopyWith<ContactUsDetailsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactUsDetailsDtoCopyWith<$Res> {
  factory $ContactUsDetailsDtoCopyWith(
          ContactUsDetailsDto value, $Res Function(ContactUsDetailsDto) then) =
      _$ContactUsDetailsDtoCopyWithImpl<$Res, ContactUsDetailsDto>;
  @useResult
  $Res call(
      {@JsonKey(
          name: 'content',
          readValue: JsonReadValueHelper.readValueString,
          defaultValue: '')
      String content,
      @JsonKey(
          name: 'preloginSendToEmail',
          readValue: JsonReadValueHelper.readValueString,
          defaultValue: '')
      String preloginSendToEmail,
      @JsonKey(
          name: 'postloginSendToEmail',
          readValue: JsonReadValueHelper.readValueString,
          defaultValue: '')
      String postloginSendToEmail});
}

/// @nodoc
class _$ContactUsDetailsDtoCopyWithImpl<$Res, $Val extends ContactUsDetailsDto>
    implements $ContactUsDetailsDtoCopyWith<$Res> {
  _$ContactUsDetailsDtoCopyWithImpl(this._value, this._then);

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
              as String,
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
abstract class _$$ContactUsDetailsDtoImplCopyWith<$Res>
    implements $ContactUsDetailsDtoCopyWith<$Res> {
  factory _$$ContactUsDetailsDtoImplCopyWith(_$ContactUsDetailsDtoImpl value,
          $Res Function(_$ContactUsDetailsDtoImpl) then) =
      __$$ContactUsDetailsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: 'content',
          readValue: JsonReadValueHelper.readValueString,
          defaultValue: '')
      String content,
      @JsonKey(
          name: 'preloginSendToEmail',
          readValue: JsonReadValueHelper.readValueString,
          defaultValue: '')
      String preloginSendToEmail,
      @JsonKey(
          name: 'postloginSendToEmail',
          readValue: JsonReadValueHelper.readValueString,
          defaultValue: '')
      String postloginSendToEmail});
}

/// @nodoc
class __$$ContactUsDetailsDtoImplCopyWithImpl<$Res>
    extends _$ContactUsDetailsDtoCopyWithImpl<$Res, _$ContactUsDetailsDtoImpl>
    implements _$$ContactUsDetailsDtoImplCopyWith<$Res> {
  __$$ContactUsDetailsDtoImplCopyWithImpl(_$ContactUsDetailsDtoImpl _value,
      $Res Function(_$ContactUsDetailsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? preloginSendToEmail = null,
    Object? postloginSendToEmail = null,
  }) {
    return _then(_$ContactUsDetailsDtoImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
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
@JsonSerializable()
class _$ContactUsDetailsDtoImpl extends _ContactUsDetailsDto {
  const _$ContactUsDetailsDtoImpl(
      {@JsonKey(
          name: 'content',
          readValue: JsonReadValueHelper.readValueString,
          defaultValue: '')
      required this.content,
      @JsonKey(
          name: 'preloginSendToEmail',
          readValue: JsonReadValueHelper.readValueString,
          defaultValue: '')
      required this.preloginSendToEmail,
      @JsonKey(
          name: 'postloginSendToEmail',
          readValue: JsonReadValueHelper.readValueString,
          defaultValue: '')
      required this.postloginSendToEmail})
      : super._();

  factory _$ContactUsDetailsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactUsDetailsDtoImplFromJson(json);

  @override
  @JsonKey(
      name: 'content',
      readValue: JsonReadValueHelper.readValueString,
      defaultValue: '')
  final String content;
  @override
  @JsonKey(
      name: 'preloginSendToEmail',
      readValue: JsonReadValueHelper.readValueString,
      defaultValue: '')
  final String preloginSendToEmail;
  @override
  @JsonKey(
      name: 'postloginSendToEmail',
      readValue: JsonReadValueHelper.readValueString,
      defaultValue: '')
  final String postloginSendToEmail;

  @override
  String toString() {
    return 'ContactUsDetailsDto(content: $content, preloginSendToEmail: $preloginSendToEmail, postloginSendToEmail: $postloginSendToEmail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactUsDetailsDtoImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.preloginSendToEmail, preloginSendToEmail) ||
                other.preloginSendToEmail == preloginSendToEmail) &&
            (identical(other.postloginSendToEmail, postloginSendToEmail) ||
                other.postloginSendToEmail == postloginSendToEmail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, content, preloginSendToEmail, postloginSendToEmail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactUsDetailsDtoImplCopyWith<_$ContactUsDetailsDtoImpl> get copyWith =>
      __$$ContactUsDetailsDtoImplCopyWithImpl<_$ContactUsDetailsDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactUsDetailsDtoImplToJson(
      this,
    );
  }
}

abstract class _ContactUsDetailsDto extends ContactUsDetailsDto {
  const factory _ContactUsDetailsDto(
      {@JsonKey(
          name: 'content',
          readValue: JsonReadValueHelper.readValueString,
          defaultValue: '')
      required final String content,
      @JsonKey(
          name: 'preloginSendToEmail',
          readValue: JsonReadValueHelper.readValueString,
          defaultValue: '')
      required final String preloginSendToEmail,
      @JsonKey(
          name: 'postloginSendToEmail',
          readValue: JsonReadValueHelper.readValueString,
          defaultValue: '')
      required final String postloginSendToEmail}) = _$ContactUsDetailsDtoImpl;
  const _ContactUsDetailsDto._() : super._();

  factory _ContactUsDetailsDto.fromJson(Map<String, dynamic> json) =
      _$ContactUsDetailsDtoImpl.fromJson;

  @override
  @JsonKey(
      name: 'content',
      readValue: JsonReadValueHelper.readValueString,
      defaultValue: '')
  String get content;
  @override
  @JsonKey(
      name: 'preloginSendToEmail',
      readValue: JsonReadValueHelper.readValueString,
      defaultValue: '')
  String get preloginSendToEmail;
  @override
  @JsonKey(
      name: 'postloginSendToEmail',
      readValue: JsonReadValueHelper.readValueString,
      defaultValue: '')
  String get postloginSendToEmail;
  @override
  @JsonKey(ignore: true)
  _$$ContactUsDetailsDtoImplCopyWith<_$ContactUsDetailsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

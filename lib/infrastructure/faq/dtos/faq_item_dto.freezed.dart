// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FAQItemDto _$FAQItemDtoFromJson(Map<String, dynamic> json) {
  return _FAQItemDto.fromJson(json);
}

/// @nodoc
mixin _$FAQItemDto {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'answer', readValue: JsonReadValueHelper.readValueString)
  String get answer => throw _privateConstructorUsedError;
  @JsonKey(name: 'question', readValue: JsonReadValueHelper.readValueString)
  String get question => throw _privateConstructorUsedError;
  @JsonKey(name: 'category', readValue: JsonReadValueHelper.readCategory)
  String get displayName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FAQItemDtoCopyWith<FAQItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FAQItemDtoCopyWith<$Res> {
  factory $FAQItemDtoCopyWith(
          FAQItemDto value, $Res Function(FAQItemDto) then) =
      _$FAQItemDtoCopyWithImpl<$Res, FAQItemDto>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'answer', readValue: JsonReadValueHelper.readValueString)
      String answer,
      @JsonKey(name: 'question', readValue: JsonReadValueHelper.readValueString)
      String question,
      @JsonKey(name: 'category', readValue: JsonReadValueHelper.readCategory)
      String displayName});
}

/// @nodoc
class _$FAQItemDtoCopyWithImpl<$Res, $Val extends FAQItemDto>
    implements $FAQItemDtoCopyWith<$Res> {
  _$FAQItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? answer = null,
    Object? question = null,
    Object? displayName = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FAQItemDtoImplCopyWith<$Res>
    implements $FAQItemDtoCopyWith<$Res> {
  factory _$$FAQItemDtoImplCopyWith(
          _$FAQItemDtoImpl value, $Res Function(_$FAQItemDtoImpl) then) =
      __$$FAQItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: 'answer', readValue: JsonReadValueHelper.readValueString)
      String answer,
      @JsonKey(name: 'question', readValue: JsonReadValueHelper.readValueString)
      String question,
      @JsonKey(name: 'category', readValue: JsonReadValueHelper.readCategory)
      String displayName});
}

/// @nodoc
class __$$FAQItemDtoImplCopyWithImpl<$Res>
    extends _$FAQItemDtoCopyWithImpl<$Res, _$FAQItemDtoImpl>
    implements _$$FAQItemDtoImplCopyWith<$Res> {
  __$$FAQItemDtoImplCopyWithImpl(
      _$FAQItemDtoImpl _value, $Res Function(_$FAQItemDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? answer = null,
    Object? question = null,
    Object? displayName = null,
  }) {
    return _then(_$FAQItemDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FAQItemDtoImpl extends _FAQItemDto {
  const _$FAQItemDtoImpl(
      {required this.name,
      @JsonKey(name: 'answer', readValue: JsonReadValueHelper.readValueString)
      required this.answer,
      @JsonKey(name: 'question', readValue: JsonReadValueHelper.readValueString)
      required this.question,
      @JsonKey(name: 'category', readValue: JsonReadValueHelper.readCategory)
      required this.displayName})
      : super._();

  factory _$FAQItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FAQItemDtoImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'answer', readValue: JsonReadValueHelper.readValueString)
  final String answer;
  @override
  @JsonKey(name: 'question', readValue: JsonReadValueHelper.readValueString)
  final String question;
  @override
  @JsonKey(name: 'category', readValue: JsonReadValueHelper.readCategory)
  final String displayName;

  @override
  String toString() {
    return 'FAQItemDto(name: $name, answer: $answer, question: $question, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FAQItemDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, answer, question, displayName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FAQItemDtoImplCopyWith<_$FAQItemDtoImpl> get copyWith =>
      __$$FAQItemDtoImplCopyWithImpl<_$FAQItemDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FAQItemDtoImplToJson(
      this,
    );
  }
}

abstract class _FAQItemDto extends FAQItemDto {
  const factory _FAQItemDto(
      {required final String name,
      @JsonKey(name: 'answer', readValue: JsonReadValueHelper.readValueString)
      required final String answer,
      @JsonKey(name: 'question', readValue: JsonReadValueHelper.readValueString)
      required final String question,
      @JsonKey(name: 'category', readValue: JsonReadValueHelper.readCategory)
      required final String displayName}) = _$FAQItemDtoImpl;
  const _FAQItemDto._() : super._();

  factory _FAQItemDto.fromJson(Map<String, dynamic> json) =
      _$FAQItemDtoImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'answer', readValue: JsonReadValueHelper.readValueString)
  String get answer;
  @override
  @JsonKey(name: 'question', readValue: JsonReadValueHelper.readValueString)
  String get question;
  @override
  @JsonKey(name: 'category', readValue: JsonReadValueHelper.readCategory)
  String get displayName;
  @override
  @JsonKey(ignore: true)
  _$$FAQItemDtoImplCopyWith<_$FAQItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FAQItem {
  String get question => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  FAQCategory get category => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FAQItemCopyWith<FAQItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FAQItemCopyWith<$Res> {
  factory $FAQItemCopyWith(FAQItem value, $Res Function(FAQItem) then) =
      _$FAQItemCopyWithImpl<$Res, FAQItem>;
  @useResult
  $Res call({String question, String answer, FAQCategory category});
}

/// @nodoc
class _$FAQItemCopyWithImpl<$Res, $Val extends FAQItem>
    implements $FAQItemCopyWith<$Res> {
  _$FAQItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answer = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as FAQCategory,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FAQItemImplCopyWith<$Res> implements $FAQItemCopyWith<$Res> {
  factory _$$FAQItemImplCopyWith(
          _$FAQItemImpl value, $Res Function(_$FAQItemImpl) then) =
      __$$FAQItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String question, String answer, FAQCategory category});
}

/// @nodoc
class __$$FAQItemImplCopyWithImpl<$Res>
    extends _$FAQItemCopyWithImpl<$Res, _$FAQItemImpl>
    implements _$$FAQItemImplCopyWith<$Res> {
  __$$FAQItemImplCopyWithImpl(
      _$FAQItemImpl _value, $Res Function(_$FAQItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answer = null,
    Object? category = null,
  }) {
    return _then(_$FAQItemImpl(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as FAQCategory,
    ));
  }
}

/// @nodoc

class _$FAQItemImpl extends _FAQItem {
  const _$FAQItemImpl(
      {required this.question, required this.answer, required this.category})
      : super._();

  @override
  final String question;
  @override
  final String answer;
  @override
  final FAQCategory category;

  @override
  String toString() {
    return 'FAQItem(question: $question, answer: $answer, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FAQItemImpl &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, question, answer, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FAQItemImplCopyWith<_$FAQItemImpl> get copyWith =>
      __$$FAQItemImplCopyWithImpl<_$FAQItemImpl>(this, _$identity);
}

abstract class _FAQItem extends FAQItem {
  const factory _FAQItem(
      {required final String question,
      required final String answer,
      required final FAQCategory category}) = _$FAQItemImpl;
  const _FAQItem._() : super._();

  @override
  String get question;
  @override
  String get answer;
  @override
  FAQCategory get category;
  @override
  @JsonKey(ignore: true)
  _$$FAQItemImplCopyWith<_$FAQItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

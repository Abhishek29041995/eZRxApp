// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq_category_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FAQCategoryGroup {
  String get displayName => throw _privateConstructorUsedError;
  List<FAQItem> get faqItem => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FAQCategoryGroupCopyWith<FAQCategoryGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FAQCategoryGroupCopyWith<$Res> {
  factory $FAQCategoryGroupCopyWith(
          FAQCategoryGroup value, $Res Function(FAQCategoryGroup) then) =
      _$FAQCategoryGroupCopyWithImpl<$Res, FAQCategoryGroup>;
  @useResult
  $Res call({String displayName, List<FAQItem> faqItem});
}

/// @nodoc
class _$FAQCategoryGroupCopyWithImpl<$Res, $Val extends FAQCategoryGroup>
    implements $FAQCategoryGroupCopyWith<$Res> {
  _$FAQCategoryGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? faqItem = null,
  }) {
    return _then(_value.copyWith(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      faqItem: null == faqItem
          ? _value.faqItem
          : faqItem // ignore: cast_nullable_to_non_nullable
              as List<FAQItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FAQCategoryGroupImplCopyWith<$Res>
    implements $FAQCategoryGroupCopyWith<$Res> {
  factory _$$FAQCategoryGroupImplCopyWith(_$FAQCategoryGroupImpl value,
          $Res Function(_$FAQCategoryGroupImpl) then) =
      __$$FAQCategoryGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String displayName, List<FAQItem> faqItem});
}

/// @nodoc
class __$$FAQCategoryGroupImplCopyWithImpl<$Res>
    extends _$FAQCategoryGroupCopyWithImpl<$Res, _$FAQCategoryGroupImpl>
    implements _$$FAQCategoryGroupImplCopyWith<$Res> {
  __$$FAQCategoryGroupImplCopyWithImpl(_$FAQCategoryGroupImpl _value,
      $Res Function(_$FAQCategoryGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? faqItem = null,
  }) {
    return _then(_$FAQCategoryGroupImpl(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      faqItem: null == faqItem
          ? _value._faqItem
          : faqItem // ignore: cast_nullable_to_non_nullable
              as List<FAQItem>,
    ));
  }
}

/// @nodoc

class _$FAQCategoryGroupImpl implements _FAQCategoryGroup {
  _$FAQCategoryGroupImpl(
      {required this.displayName, required final List<FAQItem> faqItem})
      : _faqItem = faqItem;

  @override
  final String displayName;
  final List<FAQItem> _faqItem;
  @override
  List<FAQItem> get faqItem {
    if (_faqItem is EqualUnmodifiableListView) return _faqItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_faqItem);
  }

  @override
  String toString() {
    return 'FAQCategoryGroup(displayName: $displayName, faqItem: $faqItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FAQCategoryGroupImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            const DeepCollectionEquality().equals(other._faqItem, _faqItem));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, displayName, const DeepCollectionEquality().hash(_faqItem));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FAQCategoryGroupImplCopyWith<_$FAQCategoryGroupImpl> get copyWith =>
      __$$FAQCategoryGroupImplCopyWithImpl<_$FAQCategoryGroupImpl>(
          this, _$identity);
}

abstract class _FAQCategoryGroup implements FAQCategoryGroup {
  factory _FAQCategoryGroup(
      {required final String displayName,
      required final List<FAQItem> faqItem}) = _$FAQCategoryGroupImpl;

  @override
  String get displayName;
  @override
  List<FAQItem> get faqItem;
  @override
  @JsonKey(ignore: true)
  _$$FAQCategoryGroupImplCopyWith<_$FAQCategoryGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

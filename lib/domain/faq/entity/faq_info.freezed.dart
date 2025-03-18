// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FAQInfo {
  String get endCursor => throw _privateConstructorUsedError;
  List<FAQItem> get faqList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FAQInfoCopyWith<FAQInfo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FAQInfoCopyWith<$Res> {
  factory $FAQInfoCopyWith(FAQInfo value, $Res Function(FAQInfo) then) =
      _$FAQInfoCopyWithImpl<$Res, FAQInfo>;
  @useResult
  $Res call({String endCursor, List<FAQItem> faqList});
}

/// @nodoc
class _$FAQInfoCopyWithImpl<$Res, $Val extends FAQInfo>
    implements $FAQInfoCopyWith<$Res> {
  _$FAQInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endCursor = null,
    Object? faqList = null,
  }) {
    return _then(_value.copyWith(
      endCursor: null == endCursor
          ? _value.endCursor
          : endCursor // ignore: cast_nullable_to_non_nullable
              as String,
      faqList: null == faqList
          ? _value.faqList
          : faqList // ignore: cast_nullable_to_non_nullable
              as List<FAQItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FAQInfoImplCopyWith<$Res> implements $FAQInfoCopyWith<$Res> {
  factory _$$FAQInfoImplCopyWith(
          _$FAQInfoImpl value, $Res Function(_$FAQInfoImpl) then) =
      __$$FAQInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String endCursor, List<FAQItem> faqList});
}

/// @nodoc
class __$$FAQInfoImplCopyWithImpl<$Res>
    extends _$FAQInfoCopyWithImpl<$Res, _$FAQInfoImpl>
    implements _$$FAQInfoImplCopyWith<$Res> {
  __$$FAQInfoImplCopyWithImpl(
      _$FAQInfoImpl _value, $Res Function(_$FAQInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endCursor = null,
    Object? faqList = null,
  }) {
    return _then(_$FAQInfoImpl(
      endCursor: null == endCursor
          ? _value.endCursor
          : endCursor // ignore: cast_nullable_to_non_nullable
              as String,
      faqList: null == faqList
          ? _value._faqList
          : faqList // ignore: cast_nullable_to_non_nullable
              as List<FAQItem>,
    ));
  }
}

/// @nodoc

class _$FAQInfoImpl extends _FAQInfo {
  const _$FAQInfoImpl(
      {required this.endCursor, required final List<FAQItem> faqList})
      : _faqList = faqList,
        super._();

  @override
  final String endCursor;
  final List<FAQItem> _faqList;
  @override
  List<FAQItem> get faqList {
    if (_faqList is EqualUnmodifiableListView) return _faqList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_faqList);
  }

  @override
  String toString() {
    return 'FAQInfo(endCursor: $endCursor, faqList: $faqList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FAQInfoImpl &&
            (identical(other.endCursor, endCursor) ||
                other.endCursor == endCursor) &&
            const DeepCollectionEquality().equals(other._faqList, _faqList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, endCursor, const DeepCollectionEquality().hash(_faqList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FAQInfoImplCopyWith<_$FAQInfoImpl> get copyWith =>
      __$$FAQInfoImplCopyWithImpl<_$FAQInfoImpl>(this, _$identity);
}

abstract class _FAQInfo extends FAQInfo {
  const factory _FAQInfo(
      {required final String endCursor,
      required final List<FAQItem> faqList}) = _$FAQInfoImpl;
  const _FAQInfo._() : super._();

  @override
  String get endCursor;
  @override
  List<FAQItem> get faqList;
  @override
  @JsonKey(ignore: true)
  _$$FAQInfoImplCopyWith<_$FAQInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faq_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FAQInfoDto _$FAQInfoDtoFromJson(Map<String, dynamic> json) {
  return _FAQInfoDto.fromJson(json);
}

/// @nodoc
mixin _$FAQInfoDto {
  @JsonKey(
      name: 'pageInfo',
      defaultValue: '',
      readValue: JsonReadValueHelper.readEndCursorValue)
  String get endCursor => throw _privateConstructorUsedError;
  @JsonKey(name: 'results', defaultValue: <FAQItemDto>[])
  List<FAQItemDto> get faqList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FAQInfoDtoCopyWith<FAQInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FAQInfoDtoCopyWith<$Res> {
  factory $FAQInfoDtoCopyWith(
          FAQInfoDto value, $Res Function(FAQInfoDto) then) =
      _$FAQInfoDtoCopyWithImpl<$Res, FAQInfoDto>;
  @useResult
  $Res call(
      {@JsonKey(
          name: 'pageInfo',
          defaultValue: '',
          readValue: JsonReadValueHelper.readEndCursorValue)
      String endCursor,
      @JsonKey(name: 'results', defaultValue: <FAQItemDto>[])
      List<FAQItemDto> faqList});
}

/// @nodoc
class _$FAQInfoDtoCopyWithImpl<$Res, $Val extends FAQInfoDto>
    implements $FAQInfoDtoCopyWith<$Res> {
  _$FAQInfoDtoCopyWithImpl(this._value, this._then);

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
              as List<FAQItemDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FAQInfoDtoImplCopyWith<$Res>
    implements $FAQInfoDtoCopyWith<$Res> {
  factory _$$FAQInfoDtoImplCopyWith(
          _$FAQInfoDtoImpl value, $Res Function(_$FAQInfoDtoImpl) then) =
      __$$FAQInfoDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: 'pageInfo',
          defaultValue: '',
          readValue: JsonReadValueHelper.readEndCursorValue)
      String endCursor,
      @JsonKey(name: 'results', defaultValue: <FAQItemDto>[])
      List<FAQItemDto> faqList});
}

/// @nodoc
class __$$FAQInfoDtoImplCopyWithImpl<$Res>
    extends _$FAQInfoDtoCopyWithImpl<$Res, _$FAQInfoDtoImpl>
    implements _$$FAQInfoDtoImplCopyWith<$Res> {
  __$$FAQInfoDtoImplCopyWithImpl(
      _$FAQInfoDtoImpl _value, $Res Function(_$FAQInfoDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endCursor = null,
    Object? faqList = null,
  }) {
    return _then(_$FAQInfoDtoImpl(
      endCursor: null == endCursor
          ? _value.endCursor
          : endCursor // ignore: cast_nullable_to_non_nullable
              as String,
      faqList: null == faqList
          ? _value._faqList
          : faqList // ignore: cast_nullable_to_non_nullable
              as List<FAQItemDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FAQInfoDtoImpl extends _FAQInfoDto {
  const _$FAQInfoDtoImpl(
      {@JsonKey(
          name: 'pageInfo',
          defaultValue: '',
          readValue: JsonReadValueHelper.readEndCursorValue)
      required this.endCursor,
      @JsonKey(name: 'results', defaultValue: <FAQItemDto>[])
      required final List<FAQItemDto> faqList})
      : _faqList = faqList,
        super._();

  factory _$FAQInfoDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FAQInfoDtoImplFromJson(json);

  @override
  @JsonKey(
      name: 'pageInfo',
      defaultValue: '',
      readValue: JsonReadValueHelper.readEndCursorValue)
  final String endCursor;
  final List<FAQItemDto> _faqList;
  @override
  @JsonKey(name: 'results', defaultValue: <FAQItemDto>[])
  List<FAQItemDto> get faqList {
    if (_faqList is EqualUnmodifiableListView) return _faqList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_faqList);
  }

  @override
  String toString() {
    return 'FAQInfoDto(endCursor: $endCursor, faqList: $faqList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FAQInfoDtoImpl &&
            (identical(other.endCursor, endCursor) ||
                other.endCursor == endCursor) &&
            const DeepCollectionEquality().equals(other._faqList, _faqList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, endCursor, const DeepCollectionEquality().hash(_faqList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FAQInfoDtoImplCopyWith<_$FAQInfoDtoImpl> get copyWith =>
      __$$FAQInfoDtoImplCopyWithImpl<_$FAQInfoDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FAQInfoDtoImplToJson(
      this,
    );
  }
}

abstract class _FAQInfoDto extends FAQInfoDto {
  const factory _FAQInfoDto(
      {@JsonKey(
          name: 'pageInfo',
          defaultValue: '',
          readValue: JsonReadValueHelper.readEndCursorValue)
      required final String endCursor,
      @JsonKey(name: 'results', defaultValue: <FAQItemDto>[])
      required final List<FAQItemDto> faqList}) = _$FAQInfoDtoImpl;
  const _FAQInfoDto._() : super._();

  factory _FAQInfoDto.fromJson(Map<String, dynamic> json) =
      _$FAQInfoDtoImpl.fromJson;

  @override
  @JsonKey(
      name: 'pageInfo',
      defaultValue: '',
      readValue: JsonReadValueHelper.readEndCursorValue)
  String get endCursor;
  @override
  @JsonKey(name: 'results', defaultValue: <FAQItemDto>[])
  List<FAQItemDto> get faqList;
  @override
  @JsonKey(ignore: true)
  _$$FAQInfoDtoImplCopyWith<_$FAQInfoDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

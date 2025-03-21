// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_restriction_list_raw_meta_data_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserRestrictionListRawMetaDataDto _$UserRestrictionListRawMetaDataDtoFromJson(
    Map<String, dynamic> json) {
  return _UserRestrictionRawMetaDataDto.fromJson(json);
}

/// @nodoc
mixin _$UserRestrictionListRawMetaDataDto {
  List<String> get usernames => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRestrictionListRawMetaDataDtoCopyWith<UserRestrictionListRawMetaDataDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRestrictionListRawMetaDataDtoCopyWith<$Res> {
  factory $UserRestrictionListRawMetaDataDtoCopyWith(
          UserRestrictionListRawMetaDataDto value,
          $Res Function(UserRestrictionListRawMetaDataDto) then) =
      _$UserRestrictionListRawMetaDataDtoCopyWithImpl<$Res,
          UserRestrictionListRawMetaDataDto>;
  @useResult
  $Res call({List<String> usernames});
}

/// @nodoc
class _$UserRestrictionListRawMetaDataDtoCopyWithImpl<$Res,
        $Val extends UserRestrictionListRawMetaDataDto>
    implements $UserRestrictionListRawMetaDataDtoCopyWith<$Res> {
  _$UserRestrictionListRawMetaDataDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernames = null,
  }) {
    return _then(_value.copyWith(
      usernames: null == usernames
          ? _value.usernames
          : usernames // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRestrictionRawMetaDataDtoImplCopyWith<$Res>
    implements $UserRestrictionListRawMetaDataDtoCopyWith<$Res> {
  factory _$$UserRestrictionRawMetaDataDtoImplCopyWith(
          _$UserRestrictionRawMetaDataDtoImpl value,
          $Res Function(_$UserRestrictionRawMetaDataDtoImpl) then) =
      __$$UserRestrictionRawMetaDataDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> usernames});
}

/// @nodoc
class __$$UserRestrictionRawMetaDataDtoImplCopyWithImpl<$Res>
    extends _$UserRestrictionListRawMetaDataDtoCopyWithImpl<$Res,
        _$UserRestrictionRawMetaDataDtoImpl>
    implements _$$UserRestrictionRawMetaDataDtoImplCopyWith<$Res> {
  __$$UserRestrictionRawMetaDataDtoImplCopyWithImpl(
      _$UserRestrictionRawMetaDataDtoImpl _value,
      $Res Function(_$UserRestrictionRawMetaDataDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernames = null,
  }) {
    return _then(_$UserRestrictionRawMetaDataDtoImpl(
      usernames: null == usernames
          ? _value._usernames
          : usernames // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRestrictionRawMetaDataDtoImpl
    extends _UserRestrictionRawMetaDataDto {
  _$UserRestrictionRawMetaDataDtoImpl({required final List<String> usernames})
      : _usernames = usernames,
        super._();

  factory _$UserRestrictionRawMetaDataDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UserRestrictionRawMetaDataDtoImplFromJson(json);

  final List<String> _usernames;
  @override
  List<String> get usernames {
    if (_usernames is EqualUnmodifiableListView) return _usernames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usernames);
  }

  @override
  String toString() {
    return 'UserRestrictionListRawMetaDataDto(usernames: $usernames)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRestrictionRawMetaDataDtoImpl &&
            const DeepCollectionEquality()
                .equals(other._usernames, _usernames));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_usernames));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRestrictionRawMetaDataDtoImplCopyWith<
          _$UserRestrictionRawMetaDataDtoImpl>
      get copyWith => __$$UserRestrictionRawMetaDataDtoImplCopyWithImpl<
          _$UserRestrictionRawMetaDataDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRestrictionRawMetaDataDtoImplToJson(
      this,
    );
  }
}

abstract class _UserRestrictionRawMetaDataDto
    extends UserRestrictionListRawMetaDataDto {
  factory _UserRestrictionRawMetaDataDto(
          {required final List<String> usernames}) =
      _$UserRestrictionRawMetaDataDtoImpl;
  _UserRestrictionRawMetaDataDto._() : super._();

  factory _UserRestrictionRawMetaDataDto.fromJson(Map<String, dynamic> json) =
      _$UserRestrictionRawMetaDataDtoImpl.fromJson;

  @override
  List<String> get usernames;
  @override
  @JsonKey(ignore: true)
  _$$UserRestrictionRawMetaDataDtoImplCopyWith<
          _$UserRestrictionRawMetaDataDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

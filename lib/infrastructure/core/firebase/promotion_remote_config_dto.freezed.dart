// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promotion_remote_config_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PromotionRemoteConfigDto _$PromotionRemoteConfigDtoFromJson(
    Map<String, dynamic> json) {
  return _PromotionRemoteConfigDto.fromJson(json);
}

/// @nodoc
mixin _$PromotionRemoteConfigDto {
  @JsonKey(name: 'blacklist')
  List<String> get blacklist => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PromotionRemoteConfigDtoCopyWith<PromotionRemoteConfigDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromotionRemoteConfigDtoCopyWith<$Res> {
  factory $PromotionRemoteConfigDtoCopyWith(PromotionRemoteConfigDto value,
          $Res Function(PromotionRemoteConfigDto) then) =
      _$PromotionRemoteConfigDtoCopyWithImpl<$Res, PromotionRemoteConfigDto>;
  @useResult
  $Res call({@JsonKey(name: 'blacklist') List<String> blacklist});
}

/// @nodoc
class _$PromotionRemoteConfigDtoCopyWithImpl<$Res,
        $Val extends PromotionRemoteConfigDto>
    implements $PromotionRemoteConfigDtoCopyWith<$Res> {
  _$PromotionRemoteConfigDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blacklist = null,
  }) {
    return _then(_value.copyWith(
      blacklist: null == blacklist
          ? _value.blacklist
          : blacklist // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PromotionRemoteConfigDtoImplCopyWith<$Res>
    implements $PromotionRemoteConfigDtoCopyWith<$Res> {
  factory _$$PromotionRemoteConfigDtoImplCopyWith(
          _$PromotionRemoteConfigDtoImpl value,
          $Res Function(_$PromotionRemoteConfigDtoImpl) then) =
      __$$PromotionRemoteConfigDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'blacklist') List<String> blacklist});
}

/// @nodoc
class __$$PromotionRemoteConfigDtoImplCopyWithImpl<$Res>
    extends _$PromotionRemoteConfigDtoCopyWithImpl<$Res,
        _$PromotionRemoteConfigDtoImpl>
    implements _$$PromotionRemoteConfigDtoImplCopyWith<$Res> {
  __$$PromotionRemoteConfigDtoImplCopyWithImpl(
      _$PromotionRemoteConfigDtoImpl _value,
      $Res Function(_$PromotionRemoteConfigDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blacklist = null,
  }) {
    return _then(_$PromotionRemoteConfigDtoImpl(
      blacklist: null == blacklist
          ? _value._blacklist
          : blacklist // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PromotionRemoteConfigDtoImpl extends _PromotionRemoteConfigDto {
  const _$PromotionRemoteConfigDtoImpl(
      {@JsonKey(name: 'blacklist') required final List<String> blacklist})
      : _blacklist = blacklist,
        super._();

  factory _$PromotionRemoteConfigDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromotionRemoteConfigDtoImplFromJson(json);

  final List<String> _blacklist;
  @override
  @JsonKey(name: 'blacklist')
  List<String> get blacklist {
    if (_blacklist is EqualUnmodifiableListView) return _blacklist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blacklist);
  }

  @override
  String toString() {
    return 'PromotionRemoteConfigDto(blacklist: $blacklist)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromotionRemoteConfigDtoImpl &&
            const DeepCollectionEquality()
                .equals(other._blacklist, _blacklist));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_blacklist));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PromotionRemoteConfigDtoImplCopyWith<_$PromotionRemoteConfigDtoImpl>
      get copyWith => __$$PromotionRemoteConfigDtoImplCopyWithImpl<
          _$PromotionRemoteConfigDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromotionRemoteConfigDtoImplToJson(
      this,
    );
  }
}

abstract class _PromotionRemoteConfigDto extends PromotionRemoteConfigDto {
  const factory _PromotionRemoteConfigDto(
          {@JsonKey(name: 'blacklist') required final List<String> blacklist}) =
      _$PromotionRemoteConfigDtoImpl;
  const _PromotionRemoteConfigDto._() : super._();

  factory _PromotionRemoteConfigDto.fromJson(Map<String, dynamic> json) =
      _$PromotionRemoteConfigDtoImpl.fromJson;

  @override
  @JsonKey(name: 'blacklist')
  List<String> get blacklist;
  @override
  @JsonKey(ignore: true)
  _$$PromotionRemoteConfigDtoImplCopyWith<_$PromotionRemoteConfigDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mp_remote_config_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MPRemoteConfigDto _$MPRemoteConfigDtoFromJson(Map<String, dynamic> json) {
  return _MPRemoteConfigDto.fromJson(json);
}

/// @nodoc
mixin _$MPRemoteConfigDto {
  @JsonKey(name: 'marketplaceConfig')
  MPRemoteConfigValueDto get marketplaceConfig =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MPRemoteConfigDtoCopyWith<MPRemoteConfigDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MPRemoteConfigDtoCopyWith<$Res> {
  factory $MPRemoteConfigDtoCopyWith(
          MPRemoteConfigDto value, $Res Function(MPRemoteConfigDto) then) =
      _$MPRemoteConfigDtoCopyWithImpl<$Res, MPRemoteConfigDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'marketplaceConfig')
      MPRemoteConfigValueDto marketplaceConfig});

  $MPRemoteConfigValueDtoCopyWith<$Res> get marketplaceConfig;
}

/// @nodoc
class _$MPRemoteConfigDtoCopyWithImpl<$Res, $Val extends MPRemoteConfigDto>
    implements $MPRemoteConfigDtoCopyWith<$Res> {
  _$MPRemoteConfigDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marketplaceConfig = null,
  }) {
    return _then(_value.copyWith(
      marketplaceConfig: null == marketplaceConfig
          ? _value.marketplaceConfig
          : marketplaceConfig // ignore: cast_nullable_to_non_nullable
              as MPRemoteConfigValueDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MPRemoteConfigValueDtoCopyWith<$Res> get marketplaceConfig {
    return $MPRemoteConfigValueDtoCopyWith<$Res>(_value.marketplaceConfig,
        (value) {
      return _then(_value.copyWith(marketplaceConfig: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MPRemoteConfigDtoImplCopyWith<$Res>
    implements $MPRemoteConfigDtoCopyWith<$Res> {
  factory _$$MPRemoteConfigDtoImplCopyWith(_$MPRemoteConfigDtoImpl value,
          $Res Function(_$MPRemoteConfigDtoImpl) then) =
      __$$MPRemoteConfigDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'marketplaceConfig')
      MPRemoteConfigValueDto marketplaceConfig});

  @override
  $MPRemoteConfigValueDtoCopyWith<$Res> get marketplaceConfig;
}

/// @nodoc
class __$$MPRemoteConfigDtoImplCopyWithImpl<$Res>
    extends _$MPRemoteConfigDtoCopyWithImpl<$Res, _$MPRemoteConfigDtoImpl>
    implements _$$MPRemoteConfigDtoImplCopyWith<$Res> {
  __$$MPRemoteConfigDtoImplCopyWithImpl(_$MPRemoteConfigDtoImpl _value,
      $Res Function(_$MPRemoteConfigDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marketplaceConfig = null,
  }) {
    return _then(_$MPRemoteConfigDtoImpl(
      marketplaceConfig: null == marketplaceConfig
          ? _value.marketplaceConfig
          : marketplaceConfig // ignore: cast_nullable_to_non_nullable
              as MPRemoteConfigValueDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MPRemoteConfigDtoImpl extends _MPRemoteConfigDto {
  const _$MPRemoteConfigDtoImpl(
      {@JsonKey(name: 'marketplaceConfig') required this.marketplaceConfig})
      : super._();

  factory _$MPRemoteConfigDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MPRemoteConfigDtoImplFromJson(json);

  @override
  @JsonKey(name: 'marketplaceConfig')
  final MPRemoteConfigValueDto marketplaceConfig;

  @override
  String toString() {
    return 'MPRemoteConfigDto(marketplaceConfig: $marketplaceConfig)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MPRemoteConfigDtoImpl &&
            (identical(other.marketplaceConfig, marketplaceConfig) ||
                other.marketplaceConfig == marketplaceConfig));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, marketplaceConfig);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MPRemoteConfigDtoImplCopyWith<_$MPRemoteConfigDtoImpl> get copyWith =>
      __$$MPRemoteConfigDtoImplCopyWithImpl<_$MPRemoteConfigDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MPRemoteConfigDtoImplToJson(
      this,
    );
  }
}

abstract class _MPRemoteConfigDto extends MPRemoteConfigDto {
  const factory _MPRemoteConfigDto(
          {@JsonKey(name: 'marketplaceConfig')
          required final MPRemoteConfigValueDto marketplaceConfig}) =
      _$MPRemoteConfigDtoImpl;
  const _MPRemoteConfigDto._() : super._();

  factory _MPRemoteConfigDto.fromJson(Map<String, dynamic> json) =
      _$MPRemoteConfigDtoImpl.fromJson;

  @override
  @JsonKey(name: 'marketplaceConfig')
  MPRemoteConfigValueDto get marketplaceConfig;
  @override
  @JsonKey(ignore: true)
  _$$MPRemoteConfigDtoImplCopyWith<_$MPRemoteConfigDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MPRemoteConfigValueDto _$MPRemoteConfigValueDtoFromJson(
    Map<String, dynamic> json) {
  return _MPRemoteConfigValueDto.fromJson(json);
}

/// @nodoc
mixin _$MPRemoteConfigValueDto {
  @JsonKey(name: 'whitelist')
  List<String> get whiteList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MPRemoteConfigValueDtoCopyWith<MPRemoteConfigValueDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MPRemoteConfigValueDtoCopyWith<$Res> {
  factory $MPRemoteConfigValueDtoCopyWith(MPRemoteConfigValueDto value,
          $Res Function(MPRemoteConfigValueDto) then) =
      _$MPRemoteConfigValueDtoCopyWithImpl<$Res, MPRemoteConfigValueDto>;
  @useResult
  $Res call({@JsonKey(name: 'whitelist') List<String> whiteList});
}

/// @nodoc
class _$MPRemoteConfigValueDtoCopyWithImpl<$Res,
        $Val extends MPRemoteConfigValueDto>
    implements $MPRemoteConfigValueDtoCopyWith<$Res> {
  _$MPRemoteConfigValueDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? whiteList = null,
  }) {
    return _then(_value.copyWith(
      whiteList: null == whiteList
          ? _value.whiteList
          : whiteList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MPRemoteConfigValueDtoImplCopyWith<$Res>
    implements $MPRemoteConfigValueDtoCopyWith<$Res> {
  factory _$$MPRemoteConfigValueDtoImplCopyWith(
          _$MPRemoteConfigValueDtoImpl value,
          $Res Function(_$MPRemoteConfigValueDtoImpl) then) =
      __$$MPRemoteConfigValueDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'whitelist') List<String> whiteList});
}

/// @nodoc
class __$$MPRemoteConfigValueDtoImplCopyWithImpl<$Res>
    extends _$MPRemoteConfigValueDtoCopyWithImpl<$Res,
        _$MPRemoteConfigValueDtoImpl>
    implements _$$MPRemoteConfigValueDtoImplCopyWith<$Res> {
  __$$MPRemoteConfigValueDtoImplCopyWithImpl(
      _$MPRemoteConfigValueDtoImpl _value,
      $Res Function(_$MPRemoteConfigValueDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? whiteList = null,
  }) {
    return _then(_$MPRemoteConfigValueDtoImpl(
      whiteList: null == whiteList
          ? _value._whiteList
          : whiteList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MPRemoteConfigValueDtoImpl extends _MPRemoteConfigValueDto {
  const _$MPRemoteConfigValueDtoImpl(
      {@JsonKey(name: 'whitelist') required final List<String> whiteList})
      : _whiteList = whiteList,
        super._();

  factory _$MPRemoteConfigValueDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MPRemoteConfigValueDtoImplFromJson(json);

  final List<String> _whiteList;
  @override
  @JsonKey(name: 'whitelist')
  List<String> get whiteList {
    if (_whiteList is EqualUnmodifiableListView) return _whiteList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_whiteList);
  }

  @override
  String toString() {
    return 'MPRemoteConfigValueDto(whiteList: $whiteList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MPRemoteConfigValueDtoImpl &&
            const DeepCollectionEquality()
                .equals(other._whiteList, _whiteList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_whiteList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MPRemoteConfigValueDtoImplCopyWith<_$MPRemoteConfigValueDtoImpl>
      get copyWith => __$$MPRemoteConfigValueDtoImplCopyWithImpl<
          _$MPRemoteConfigValueDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MPRemoteConfigValueDtoImplToJson(
      this,
    );
  }
}

abstract class _MPRemoteConfigValueDto extends MPRemoteConfigValueDto {
  const factory _MPRemoteConfigValueDto(
          {@JsonKey(name: 'whitelist') required final List<String> whiteList}) =
      _$MPRemoteConfigValueDtoImpl;
  const _MPRemoteConfigValueDto._() : super._();

  factory _MPRemoteConfigValueDto.fromJson(Map<String, dynamic> json) =
      _$MPRemoteConfigValueDtoImpl.fromJson;

  @override
  @JsonKey(name: 'whitelist')
  List<String> get whiteList;
  @override
  @JsonKey(ignore: true)
  _$$MPRemoteConfigValueDtoImplCopyWith<_$MPRemoteConfigValueDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

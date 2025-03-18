// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bundle_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BundleDto _$BundleDtoFromJson(Map<String, dynamic> json) {
  return _BundleDto.fromJson(json);
}

/// @nodoc
mixin _$BundleDto {
  @JsonKey(name: 'bundleName', defaultValue: '')
  String get bundleName => throw _privateConstructorUsedError;
  @JsonKey(name: 'bundleCode', defaultValue: '')
  String get bundleCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
  List<BundleInfoDto> get bundleInformation =>
      throw _privateConstructorUsedError;
  @JsonKey(
      name: 'materials', readValue: JsonReadValueHelper.handleEmptyMaterialList)
  List<MaterialDto> get materials => throw _privateConstructorUsedError;
  @JsonKey(name: 'conditions', defaultValue: '')
  String get conditions => throw _privateConstructorUsedError;
  @JsonKey(name: 'bonusEligible', defaultValue: false)
  bool get bonusEligible => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BundleDtoCopyWith<BundleDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BundleDtoCopyWith<$Res> {
  factory $BundleDtoCopyWith(BundleDto value, $Res Function(BundleDto) then) =
      _$BundleDtoCopyWithImpl<$Res, BundleDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'bundleName', defaultValue: '') String bundleName,
      @JsonKey(name: 'bundleCode', defaultValue: '') String bundleCode,
      @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
      List<BundleInfoDto> bundleInformation,
      @JsonKey(
          name: 'materials',
          readValue: JsonReadValueHelper.handleEmptyMaterialList)
      List<MaterialDto> materials,
      @JsonKey(name: 'conditions', defaultValue: '') String conditions,
      @JsonKey(name: 'bonusEligible', defaultValue: false) bool bonusEligible});
}

/// @nodoc
class _$BundleDtoCopyWithImpl<$Res, $Val extends BundleDto>
    implements $BundleDtoCopyWith<$Res> {
  _$BundleDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bundleName = null,
    Object? bundleCode = null,
    Object? bundleInformation = null,
    Object? materials = null,
    Object? conditions = null,
    Object? bonusEligible = null,
  }) {
    return _then(_value.copyWith(
      bundleName: null == bundleName
          ? _value.bundleName
          : bundleName // ignore: cast_nullable_to_non_nullable
              as String,
      bundleCode: null == bundleCode
          ? _value.bundleCode
          : bundleCode // ignore: cast_nullable_to_non_nullable
              as String,
      bundleInformation: null == bundleInformation
          ? _value.bundleInformation
          : bundleInformation // ignore: cast_nullable_to_non_nullable
              as List<BundleInfoDto>,
      materials: null == materials
          ? _value.materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<MaterialDto>,
      conditions: null == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as String,
      bonusEligible: null == bonusEligible
          ? _value.bonusEligible
          : bonusEligible // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BundleDtoImplCopyWith<$Res>
    implements $BundleDtoCopyWith<$Res> {
  factory _$$BundleDtoImplCopyWith(
          _$BundleDtoImpl value, $Res Function(_$BundleDtoImpl) then) =
      __$$BundleDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'bundleName', defaultValue: '') String bundleName,
      @JsonKey(name: 'bundleCode', defaultValue: '') String bundleCode,
      @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
      List<BundleInfoDto> bundleInformation,
      @JsonKey(
          name: 'materials',
          readValue: JsonReadValueHelper.handleEmptyMaterialList)
      List<MaterialDto> materials,
      @JsonKey(name: 'conditions', defaultValue: '') String conditions,
      @JsonKey(name: 'bonusEligible', defaultValue: false) bool bonusEligible});
}

/// @nodoc
class __$$BundleDtoImplCopyWithImpl<$Res>
    extends _$BundleDtoCopyWithImpl<$Res, _$BundleDtoImpl>
    implements _$$BundleDtoImplCopyWith<$Res> {
  __$$BundleDtoImplCopyWithImpl(
      _$BundleDtoImpl _value, $Res Function(_$BundleDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bundleName = null,
    Object? bundleCode = null,
    Object? bundleInformation = null,
    Object? materials = null,
    Object? conditions = null,
    Object? bonusEligible = null,
  }) {
    return _then(_$BundleDtoImpl(
      bundleName: null == bundleName
          ? _value.bundleName
          : bundleName // ignore: cast_nullable_to_non_nullable
              as String,
      bundleCode: null == bundleCode
          ? _value.bundleCode
          : bundleCode // ignore: cast_nullable_to_non_nullable
              as String,
      bundleInformation: null == bundleInformation
          ? _value._bundleInformation
          : bundleInformation // ignore: cast_nullable_to_non_nullable
              as List<BundleInfoDto>,
      materials: null == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<MaterialDto>,
      conditions: null == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as String,
      bonusEligible: null == bonusEligible
          ? _value.bonusEligible
          : bonusEligible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BundleDtoImpl extends _BundleDto {
  const _$BundleDtoImpl(
      {@JsonKey(name: 'bundleName', defaultValue: '') required this.bundleName,
      @JsonKey(name: 'bundleCode', defaultValue: '') required this.bundleCode,
      @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
      required final List<BundleInfoDto> bundleInformation,
      @JsonKey(
          name: 'materials',
          readValue: JsonReadValueHelper.handleEmptyMaterialList)
      required final List<MaterialDto> materials,
      @JsonKey(name: 'conditions', defaultValue: '') required this.conditions,
      @JsonKey(name: 'bonusEligible', defaultValue: false)
      required this.bonusEligible})
      : _bundleInformation = bundleInformation,
        _materials = materials,
        super._();

  factory _$BundleDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BundleDtoImplFromJson(json);

  @override
  @JsonKey(name: 'bundleName', defaultValue: '')
  final String bundleName;
  @override
  @JsonKey(name: 'bundleCode', defaultValue: '')
  final String bundleCode;
  final List<BundleInfoDto> _bundleInformation;
  @override
  @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
  List<BundleInfoDto> get bundleInformation {
    if (_bundleInformation is EqualUnmodifiableListView)
      return _bundleInformation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bundleInformation);
  }

  final List<MaterialDto> _materials;
  @override
  @JsonKey(
      name: 'materials', readValue: JsonReadValueHelper.handleEmptyMaterialList)
  List<MaterialDto> get materials {
    if (_materials is EqualUnmodifiableListView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materials);
  }

  @override
  @JsonKey(name: 'conditions', defaultValue: '')
  final String conditions;
  @override
  @JsonKey(name: 'bonusEligible', defaultValue: false)
  final bool bonusEligible;

  @override
  String toString() {
    return 'BundleDto(bundleName: $bundleName, bundleCode: $bundleCode, bundleInformation: $bundleInformation, materials: $materials, conditions: $conditions, bonusEligible: $bonusEligible)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BundleDtoImpl &&
            (identical(other.bundleName, bundleName) ||
                other.bundleName == bundleName) &&
            (identical(other.bundleCode, bundleCode) ||
                other.bundleCode == bundleCode) &&
            const DeepCollectionEquality()
                .equals(other._bundleInformation, _bundleInformation) &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials) &&
            (identical(other.conditions, conditions) ||
                other.conditions == conditions) &&
            (identical(other.bonusEligible, bonusEligible) ||
                other.bonusEligible == bonusEligible));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bundleName,
      bundleCode,
      const DeepCollectionEquality().hash(_bundleInformation),
      const DeepCollectionEquality().hash(_materials),
      conditions,
      bonusEligible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BundleDtoImplCopyWith<_$BundleDtoImpl> get copyWith =>
      __$$BundleDtoImplCopyWithImpl<_$BundleDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BundleDtoImplToJson(
      this,
    );
  }
}

abstract class _BundleDto extends BundleDto {
  const factory _BundleDto(
      {@JsonKey(name: 'bundleName', defaultValue: '')
      required final String bundleName,
      @JsonKey(name: 'bundleCode', defaultValue: '')
      required final String bundleCode,
      @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
      required final List<BundleInfoDto> bundleInformation,
      @JsonKey(
          name: 'materials',
          readValue: JsonReadValueHelper.handleEmptyMaterialList)
      required final List<MaterialDto> materials,
      @JsonKey(name: 'conditions', defaultValue: '')
      required final String conditions,
      @JsonKey(name: 'bonusEligible', defaultValue: false)
      required final bool bonusEligible}) = _$BundleDtoImpl;
  const _BundleDto._() : super._();

  factory _BundleDto.fromJson(Map<String, dynamic> json) =
      _$BundleDtoImpl.fromJson;

  @override
  @JsonKey(name: 'bundleName', defaultValue: '')
  String get bundleName;
  @override
  @JsonKey(name: 'bundleCode', defaultValue: '')
  String get bundleCode;
  @override
  @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
  List<BundleInfoDto> get bundleInformation;
  @override
  @JsonKey(
      name: 'materials', readValue: JsonReadValueHelper.handleEmptyMaterialList)
  List<MaterialDto> get materials;
  @override
  @JsonKey(name: 'conditions', defaultValue: '')
  String get conditions;
  @override
  @JsonKey(name: 'bonusEligible', defaultValue: false)
  bool get bonusEligible;
  @override
  @JsonKey(ignore: true)
  _$$BundleDtoImplCopyWith<_$BundleDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

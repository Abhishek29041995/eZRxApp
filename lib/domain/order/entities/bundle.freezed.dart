// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bundle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Bundle {
  BundleName get bundleName => throw _privateConstructorUsedError;
  List<MaterialInfo> get materials => throw _privateConstructorUsedError;
  String get bundleCode => throw _privateConstructorUsedError;
  List<BundleInfo> get bundleInformation => throw _privateConstructorUsedError;
  String get conditions => throw _privateConstructorUsedError;
  bool get bonusEligible => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BundleCopyWith<Bundle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BundleCopyWith<$Res> {
  factory $BundleCopyWith(Bundle value, $Res Function(Bundle) then) =
      _$BundleCopyWithImpl<$Res, Bundle>;
  @useResult
  $Res call(
      {BundleName bundleName,
      List<MaterialInfo> materials,
      String bundleCode,
      List<BundleInfo> bundleInformation,
      String conditions,
      bool bonusEligible});
}

/// @nodoc
class _$BundleCopyWithImpl<$Res, $Val extends Bundle>
    implements $BundleCopyWith<$Res> {
  _$BundleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bundleName = null,
    Object? materials = null,
    Object? bundleCode = null,
    Object? bundleInformation = null,
    Object? conditions = null,
    Object? bonusEligible = null,
  }) {
    return _then(_value.copyWith(
      bundleName: null == bundleName
          ? _value.bundleName
          : bundleName // ignore: cast_nullable_to_non_nullable
              as BundleName,
      materials: null == materials
          ? _value.materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
      bundleCode: null == bundleCode
          ? _value.bundleCode
          : bundleCode // ignore: cast_nullable_to_non_nullable
              as String,
      bundleInformation: null == bundleInformation
          ? _value.bundleInformation
          : bundleInformation // ignore: cast_nullable_to_non_nullable
              as List<BundleInfo>,
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
abstract class _$$BundleImplCopyWith<$Res> implements $BundleCopyWith<$Res> {
  factory _$$BundleImplCopyWith(
          _$BundleImpl value, $Res Function(_$BundleImpl) then) =
      __$$BundleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BundleName bundleName,
      List<MaterialInfo> materials,
      String bundleCode,
      List<BundleInfo> bundleInformation,
      String conditions,
      bool bonusEligible});
}

/// @nodoc
class __$$BundleImplCopyWithImpl<$Res>
    extends _$BundleCopyWithImpl<$Res, _$BundleImpl>
    implements _$$BundleImplCopyWith<$Res> {
  __$$BundleImplCopyWithImpl(
      _$BundleImpl _value, $Res Function(_$BundleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bundleName = null,
    Object? materials = null,
    Object? bundleCode = null,
    Object? bundleInformation = null,
    Object? conditions = null,
    Object? bonusEligible = null,
  }) {
    return _then(_$BundleImpl(
      bundleName: null == bundleName
          ? _value.bundleName
          : bundleName // ignore: cast_nullable_to_non_nullable
              as BundleName,
      materials: null == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<MaterialInfo>,
      bundleCode: null == bundleCode
          ? _value.bundleCode
          : bundleCode // ignore: cast_nullable_to_non_nullable
              as String,
      bundleInformation: null == bundleInformation
          ? _value._bundleInformation
          : bundleInformation // ignore: cast_nullable_to_non_nullable
              as List<BundleInfo>,
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

class _$BundleImpl extends _Bundle {
  const _$BundleImpl(
      {required this.bundleName,
      required final List<MaterialInfo> materials,
      required this.bundleCode,
      required final List<BundleInfo> bundleInformation,
      required this.conditions,
      required this.bonusEligible})
      : _materials = materials,
        _bundleInformation = bundleInformation,
        super._();

  @override
  final BundleName bundleName;
  final List<MaterialInfo> _materials;
  @override
  List<MaterialInfo> get materials {
    if (_materials is EqualUnmodifiableListView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materials);
  }

  @override
  final String bundleCode;
  final List<BundleInfo> _bundleInformation;
  @override
  List<BundleInfo> get bundleInformation {
    if (_bundleInformation is EqualUnmodifiableListView)
      return _bundleInformation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bundleInformation);
  }

  @override
  final String conditions;
  @override
  final bool bonusEligible;

  @override
  String toString() {
    return 'Bundle(bundleName: $bundleName, materials: $materials, bundleCode: $bundleCode, bundleInformation: $bundleInformation, conditions: $conditions, bonusEligible: $bonusEligible)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BundleImpl &&
            (identical(other.bundleName, bundleName) ||
                other.bundleName == bundleName) &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials) &&
            (identical(other.bundleCode, bundleCode) ||
                other.bundleCode == bundleCode) &&
            const DeepCollectionEquality()
                .equals(other._bundleInformation, _bundleInformation) &&
            (identical(other.conditions, conditions) ||
                other.conditions == conditions) &&
            (identical(other.bonusEligible, bonusEligible) ||
                other.bonusEligible == bonusEligible));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      bundleName,
      const DeepCollectionEquality().hash(_materials),
      bundleCode,
      const DeepCollectionEquality().hash(_bundleInformation),
      conditions,
      bonusEligible);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BundleImplCopyWith<_$BundleImpl> get copyWith =>
      __$$BundleImplCopyWithImpl<_$BundleImpl>(this, _$identity);
}

abstract class _Bundle extends Bundle {
  const factory _Bundle(
      {required final BundleName bundleName,
      required final List<MaterialInfo> materials,
      required final String bundleCode,
      required final List<BundleInfo> bundleInformation,
      required final String conditions,
      required final bool bonusEligible}) = _$BundleImpl;
  const _Bundle._() : super._();

  @override
  BundleName get bundleName;
  @override
  List<MaterialInfo> get materials;
  @override
  String get bundleCode;
  @override
  List<BundleInfo> get bundleInformation;
  @override
  String get conditions;
  @override
  bool get bonusEligible;
  @override
  @JsonKey(ignore: true)
  _$$BundleImplCopyWith<_$BundleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

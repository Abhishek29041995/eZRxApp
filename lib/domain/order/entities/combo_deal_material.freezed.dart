// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'combo_deal_material.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ComboDealMaterialSet {
  String get setNo => throw _privateConstructorUsedError;
  List<ComboDealMaterial> get materials => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ComboDealMaterialSetCopyWith<ComboDealMaterialSet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComboDealMaterialSetCopyWith<$Res> {
  factory $ComboDealMaterialSetCopyWith(ComboDealMaterialSet value,
          $Res Function(ComboDealMaterialSet) then) =
      _$ComboDealMaterialSetCopyWithImpl<$Res, ComboDealMaterialSet>;
  @useResult
  $Res call({String setNo, List<ComboDealMaterial> materials});
}

/// @nodoc
class _$ComboDealMaterialSetCopyWithImpl<$Res,
        $Val extends ComboDealMaterialSet>
    implements $ComboDealMaterialSetCopyWith<$Res> {
  _$ComboDealMaterialSetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? setNo = null,
    Object? materials = null,
  }) {
    return _then(_value.copyWith(
      setNo: null == setNo
          ? _value.setNo
          : setNo // ignore: cast_nullable_to_non_nullable
              as String,
      materials: null == materials
          ? _value.materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<ComboDealMaterial>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ComboDealMaterialSetImplCopyWith<$Res>
    implements $ComboDealMaterialSetCopyWith<$Res> {
  factory _$$ComboDealMaterialSetImplCopyWith(_$ComboDealMaterialSetImpl value,
          $Res Function(_$ComboDealMaterialSetImpl) then) =
      __$$ComboDealMaterialSetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String setNo, List<ComboDealMaterial> materials});
}

/// @nodoc
class __$$ComboDealMaterialSetImplCopyWithImpl<$Res>
    extends _$ComboDealMaterialSetCopyWithImpl<$Res, _$ComboDealMaterialSetImpl>
    implements _$$ComboDealMaterialSetImplCopyWith<$Res> {
  __$$ComboDealMaterialSetImplCopyWithImpl(_$ComboDealMaterialSetImpl _value,
      $Res Function(_$ComboDealMaterialSetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? setNo = null,
    Object? materials = null,
  }) {
    return _then(_$ComboDealMaterialSetImpl(
      setNo: null == setNo
          ? _value.setNo
          : setNo // ignore: cast_nullable_to_non_nullable
              as String,
      materials: null == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<ComboDealMaterial>,
    ));
  }
}

/// @nodoc

class _$ComboDealMaterialSetImpl extends _ComboDealMaterialSet {
  const _$ComboDealMaterialSetImpl(
      {required this.setNo, required final List<ComboDealMaterial> materials})
      : _materials = materials,
        super._();

  @override
  final String setNo;
  final List<ComboDealMaterial> _materials;
  @override
  List<ComboDealMaterial> get materials {
    if (_materials is EqualUnmodifiableListView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materials);
  }

  @override
  String toString() {
    return 'ComboDealMaterialSet(setNo: $setNo, materials: $materials)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComboDealMaterialSetImpl &&
            (identical(other.setNo, setNo) || other.setNo == setNo) &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, setNo, const DeepCollectionEquality().hash(_materials));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComboDealMaterialSetImplCopyWith<_$ComboDealMaterialSetImpl>
      get copyWith =>
          __$$ComboDealMaterialSetImplCopyWithImpl<_$ComboDealMaterialSetImpl>(
              this, _$identity);
}

abstract class _ComboDealMaterialSet extends ComboDealMaterialSet {
  const factory _ComboDealMaterialSet(
          {required final String setNo,
          required final List<ComboDealMaterial> materials}) =
      _$ComboDealMaterialSetImpl;
  const _ComboDealMaterialSet._() : super._();

  @override
  String get setNo;
  @override
  List<ComboDealMaterial> get materials;
  @override
  @JsonKey(ignore: true)
  _$$ComboDealMaterialSetImplCopyWith<_$ComboDealMaterialSetImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ComboDealMaterial {
  int get minQty => throw _privateConstructorUsedError;
  MaterialNumber get materialNumber => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  DiscountType get type => throw _privateConstructorUsedError;
  String get conditionNumber => throw _privateConstructorUsedError;
  bool get mandatory => throw _privateConstructorUsedError;
  ComboSuffix get suffix => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ComboDealMaterialCopyWith<ComboDealMaterial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComboDealMaterialCopyWith<$Res> {
  factory $ComboDealMaterialCopyWith(
          ComboDealMaterial value, $Res Function(ComboDealMaterial) then) =
      _$ComboDealMaterialCopyWithImpl<$Res, ComboDealMaterial>;
  @useResult
  $Res call(
      {int minQty,
      MaterialNumber materialNumber,
      double rate,
      DiscountType type,
      String conditionNumber,
      bool mandatory,
      ComboSuffix suffix});
}

/// @nodoc
class _$ComboDealMaterialCopyWithImpl<$Res, $Val extends ComboDealMaterial>
    implements $ComboDealMaterialCopyWith<$Res> {
  _$ComboDealMaterialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minQty = null,
    Object? materialNumber = null,
    Object? rate = null,
    Object? type = null,
    Object? conditionNumber = null,
    Object? mandatory = null,
    Object? suffix = null,
  }) {
    return _then(_value.copyWith(
      minQty: null == minQty
          ? _value.minQty
          : minQty // ignore: cast_nullable_to_non_nullable
              as int,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DiscountType,
      conditionNumber: null == conditionNumber
          ? _value.conditionNumber
          : conditionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      mandatory: null == mandatory
          ? _value.mandatory
          : mandatory // ignore: cast_nullable_to_non_nullable
              as bool,
      suffix: null == suffix
          ? _value.suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as ComboSuffix,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ComboDealMaterialImplCopyWith<$Res>
    implements $ComboDealMaterialCopyWith<$Res> {
  factory _$$ComboDealMaterialImplCopyWith(_$ComboDealMaterialImpl value,
          $Res Function(_$ComboDealMaterialImpl) then) =
      __$$ComboDealMaterialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int minQty,
      MaterialNumber materialNumber,
      double rate,
      DiscountType type,
      String conditionNumber,
      bool mandatory,
      ComboSuffix suffix});
}

/// @nodoc
class __$$ComboDealMaterialImplCopyWithImpl<$Res>
    extends _$ComboDealMaterialCopyWithImpl<$Res, _$ComboDealMaterialImpl>
    implements _$$ComboDealMaterialImplCopyWith<$Res> {
  __$$ComboDealMaterialImplCopyWithImpl(_$ComboDealMaterialImpl _value,
      $Res Function(_$ComboDealMaterialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minQty = null,
    Object? materialNumber = null,
    Object? rate = null,
    Object? type = null,
    Object? conditionNumber = null,
    Object? mandatory = null,
    Object? suffix = null,
  }) {
    return _then(_$ComboDealMaterialImpl(
      minQty: null == minQty
          ? _value.minQty
          : minQty // ignore: cast_nullable_to_non_nullable
              as int,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DiscountType,
      conditionNumber: null == conditionNumber
          ? _value.conditionNumber
          : conditionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      mandatory: null == mandatory
          ? _value.mandatory
          : mandatory // ignore: cast_nullable_to_non_nullable
              as bool,
      suffix: null == suffix
          ? _value.suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as ComboSuffix,
    ));
  }
}

/// @nodoc

class _$ComboDealMaterialImpl extends _ComboDealMaterial {
  const _$ComboDealMaterialImpl(
      {required this.minQty,
      required this.materialNumber,
      required this.rate,
      required this.type,
      required this.conditionNumber,
      required this.mandatory,
      required this.suffix})
      : super._();

  @override
  final int minQty;
  @override
  final MaterialNumber materialNumber;
  @override
  final double rate;
  @override
  final DiscountType type;
  @override
  final String conditionNumber;
  @override
  final bool mandatory;
  @override
  final ComboSuffix suffix;

  @override
  String toString() {
    return 'ComboDealMaterial(minQty: $minQty, materialNumber: $materialNumber, rate: $rate, type: $type, conditionNumber: $conditionNumber, mandatory: $mandatory, suffix: $suffix)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComboDealMaterialImpl &&
            (identical(other.minQty, minQty) || other.minQty == minQty) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.conditionNumber, conditionNumber) ||
                other.conditionNumber == conditionNumber) &&
            (identical(other.mandatory, mandatory) ||
                other.mandatory == mandatory) &&
            (identical(other.suffix, suffix) || other.suffix == suffix));
  }

  @override
  int get hashCode => Object.hash(runtimeType, minQty, materialNumber, rate,
      type, conditionNumber, mandatory, suffix);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ComboDealMaterialImplCopyWith<_$ComboDealMaterialImpl> get copyWith =>
      __$$ComboDealMaterialImplCopyWithImpl<_$ComboDealMaterialImpl>(
          this, _$identity);
}

abstract class _ComboDealMaterial extends ComboDealMaterial {
  const factory _ComboDealMaterial(
      {required final int minQty,
      required final MaterialNumber materialNumber,
      required final double rate,
      required final DiscountType type,
      required final String conditionNumber,
      required final bool mandatory,
      required final ComboSuffix suffix}) = _$ComboDealMaterialImpl;
  const _ComboDealMaterial._() : super._();

  @override
  int get minQty;
  @override
  MaterialNumber get materialNumber;
  @override
  double get rate;
  @override
  DiscountType get type;
  @override
  String get conditionNumber;
  @override
  bool get mandatory;
  @override
  ComboSuffix get suffix;
  @override
  @JsonKey(ignore: true)
  _$$ComboDealMaterialImplCopyWith<_$ComboDealMaterialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

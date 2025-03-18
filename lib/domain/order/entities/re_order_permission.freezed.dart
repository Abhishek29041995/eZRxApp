// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 're_order_permission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReOrderPermission {
  List<ValidMaterial> get validMaterials => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReOrderPermissionCopyWith<ReOrderPermission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReOrderPermissionCopyWith<$Res> {
  factory $ReOrderPermissionCopyWith(
          ReOrderPermission value, $Res Function(ReOrderPermission) then) =
      _$ReOrderPermissionCopyWithImpl<$Res, ReOrderPermission>;
  @useResult
  $Res call({List<ValidMaterial> validMaterials});
}

/// @nodoc
class _$ReOrderPermissionCopyWithImpl<$Res, $Val extends ReOrderPermission>
    implements $ReOrderPermissionCopyWith<$Res> {
  _$ReOrderPermissionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validMaterials = null,
  }) {
    return _then(_value.copyWith(
      validMaterials: null == validMaterials
          ? _value.validMaterials
          : validMaterials // ignore: cast_nullable_to_non_nullable
              as List<ValidMaterial>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReOrderPermissionImplCopyWith<$Res>
    implements $ReOrderPermissionCopyWith<$Res> {
  factory _$$ReOrderPermissionImplCopyWith(_$ReOrderPermissionImpl value,
          $Res Function(_$ReOrderPermissionImpl) then) =
      __$$ReOrderPermissionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ValidMaterial> validMaterials});
}

/// @nodoc
class __$$ReOrderPermissionImplCopyWithImpl<$Res>
    extends _$ReOrderPermissionCopyWithImpl<$Res, _$ReOrderPermissionImpl>
    implements _$$ReOrderPermissionImplCopyWith<$Res> {
  __$$ReOrderPermissionImplCopyWithImpl(_$ReOrderPermissionImpl _value,
      $Res Function(_$ReOrderPermissionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validMaterials = null,
  }) {
    return _then(_$ReOrderPermissionImpl(
      validMaterials: null == validMaterials
          ? _value._validMaterials
          : validMaterials // ignore: cast_nullable_to_non_nullable
              as List<ValidMaterial>,
    ));
  }
}

/// @nodoc

class _$ReOrderPermissionImpl implements _ReOrderPermission {
  _$ReOrderPermissionImpl({required final List<ValidMaterial> validMaterials})
      : _validMaterials = validMaterials;

  final List<ValidMaterial> _validMaterials;
  @override
  List<ValidMaterial> get validMaterials {
    if (_validMaterials is EqualUnmodifiableListView) return _validMaterials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_validMaterials);
  }

  @override
  String toString() {
    return 'ReOrderPermission(validMaterials: $validMaterials)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReOrderPermissionImpl &&
            const DeepCollectionEquality()
                .equals(other._validMaterials, _validMaterials));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_validMaterials));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReOrderPermissionImplCopyWith<_$ReOrderPermissionImpl> get copyWith =>
      __$$ReOrderPermissionImplCopyWithImpl<_$ReOrderPermissionImpl>(
          this, _$identity);
}

abstract class _ReOrderPermission implements ReOrderPermission {
  factory _ReOrderPermission(
          {required final List<ValidMaterial> validMaterials}) =
      _$ReOrderPermissionImpl;

  @override
  List<ValidMaterial> get validMaterials;
  @override
  @JsonKey(ignore: true)
  _$$ReOrderPermissionImplCopyWith<_$ReOrderPermissionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ValidMaterial {
  bool get hidePrice => throw _privateConstructorUsedError;
  MaterialNumber get materialNumber => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValidMaterialCopyWith<ValidMaterial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidMaterialCopyWith<$Res> {
  factory $ValidMaterialCopyWith(
          ValidMaterial value, $Res Function(ValidMaterial) then) =
      _$ValidMaterialCopyWithImpl<$Res, ValidMaterial>;
  @useResult
  $Res call({bool hidePrice, MaterialNumber materialNumber, bool isValid});
}

/// @nodoc
class _$ValidMaterialCopyWithImpl<$Res, $Val extends ValidMaterial>
    implements $ValidMaterialCopyWith<$Res> {
  _$ValidMaterialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hidePrice = null,
    Object? materialNumber = null,
    Object? isValid = null,
  }) {
    return _then(_value.copyWith(
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ValidMaterialImplCopyWith<$Res>
    implements $ValidMaterialCopyWith<$Res> {
  factory _$$ValidMaterialImplCopyWith(
          _$ValidMaterialImpl value, $Res Function(_$ValidMaterialImpl) then) =
      __$$ValidMaterialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool hidePrice, MaterialNumber materialNumber, bool isValid});
}

/// @nodoc
class __$$ValidMaterialImplCopyWithImpl<$Res>
    extends _$ValidMaterialCopyWithImpl<$Res, _$ValidMaterialImpl>
    implements _$$ValidMaterialImplCopyWith<$Res> {
  __$$ValidMaterialImplCopyWithImpl(
      _$ValidMaterialImpl _value, $Res Function(_$ValidMaterialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hidePrice = null,
    Object? materialNumber = null,
    Object? isValid = null,
  }) {
    return _then(_$ValidMaterialImpl(
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ValidMaterialImpl implements _ValidMaterial {
  _$ValidMaterialImpl(
      {required this.hidePrice,
      required this.materialNumber,
      required this.isValid});

  @override
  final bool hidePrice;
  @override
  final MaterialNumber materialNumber;
  @override
  final bool isValid;

  @override
  String toString() {
    return 'ValidMaterial(hidePrice: $hidePrice, materialNumber: $materialNumber, isValid: $isValid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidMaterialImpl &&
            (identical(other.hidePrice, hidePrice) ||
                other.hidePrice == hidePrice) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, hidePrice, materialNumber, isValid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidMaterialImplCopyWith<_$ValidMaterialImpl> get copyWith =>
      __$$ValidMaterialImplCopyWithImpl<_$ValidMaterialImpl>(this, _$identity);
}

abstract class _ValidMaterial implements ValidMaterial {
  factory _ValidMaterial(
      {required final bool hidePrice,
      required final MaterialNumber materialNumber,
      required final bool isValid}) = _$ValidMaterialImpl;

  @override
  bool get hidePrice;
  @override
  MaterialNumber get materialNumber;
  @override
  bool get isValid;
  @override
  @JsonKey(ignore: true)
  _$$ValidMaterialImplCopyWith<_$ValidMaterialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

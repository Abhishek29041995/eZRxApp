// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_material_item_bonus.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubmitMaterialItemBonus {
  MaterialNumber get materialNumber => throw _privateConstructorUsedError;
  int get qty => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubmitMaterialItemBonusCopyWith<SubmitMaterialItemBonus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitMaterialItemBonusCopyWith<$Res> {
  factory $SubmitMaterialItemBonusCopyWith(SubmitMaterialItemBonus value,
          $Res Function(SubmitMaterialItemBonus) then) =
      _$SubmitMaterialItemBonusCopyWithImpl<$Res, SubmitMaterialItemBonus>;
  @useResult
  $Res call({MaterialNumber materialNumber, int qty});
}

/// @nodoc
class _$SubmitMaterialItemBonusCopyWithImpl<$Res,
        $Val extends SubmitMaterialItemBonus>
    implements $SubmitMaterialItemBonusCopyWith<$Res> {
  _$SubmitMaterialItemBonusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? qty = null,
  }) {
    return _then(_value.copyWith(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubmitMaterialItemBonusImplCopyWith<$Res>
    implements $SubmitMaterialItemBonusCopyWith<$Res> {
  factory _$$SubmitMaterialItemBonusImplCopyWith(
          _$SubmitMaterialItemBonusImpl value,
          $Res Function(_$SubmitMaterialItemBonusImpl) then) =
      __$$SubmitMaterialItemBonusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MaterialNumber materialNumber, int qty});
}

/// @nodoc
class __$$SubmitMaterialItemBonusImplCopyWithImpl<$Res>
    extends _$SubmitMaterialItemBonusCopyWithImpl<$Res,
        _$SubmitMaterialItemBonusImpl>
    implements _$$SubmitMaterialItemBonusImplCopyWith<$Res> {
  __$$SubmitMaterialItemBonusImplCopyWithImpl(
      _$SubmitMaterialItemBonusImpl _value,
      $Res Function(_$SubmitMaterialItemBonusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? qty = null,
  }) {
    return _then(_$SubmitMaterialItemBonusImpl(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SubmitMaterialItemBonusImpl implements _SubmitMaterialItemBonus {
  _$SubmitMaterialItemBonusImpl(
      {required this.materialNumber, required this.qty});

  @override
  final MaterialNumber materialNumber;
  @override
  final int qty;

  @override
  String toString() {
    return 'SubmitMaterialItemBonus(materialNumber: $materialNumber, qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitMaterialItemBonusImpl &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.qty, qty) || other.qty == qty));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialNumber, qty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitMaterialItemBonusImplCopyWith<_$SubmitMaterialItemBonusImpl>
      get copyWith => __$$SubmitMaterialItemBonusImplCopyWithImpl<
          _$SubmitMaterialItemBonusImpl>(this, _$identity);
}

abstract class _SubmitMaterialItemBonus implements SubmitMaterialItemBonus {
  factory _SubmitMaterialItemBonus(
      {required final MaterialNumber materialNumber,
      required final int qty}) = _$SubmitMaterialItemBonusImpl;

  @override
  MaterialNumber get materialNumber;
  @override
  int get qty;
  @override
  @JsonKey(ignore: true)
  _$$SubmitMaterialItemBonusImplCopyWith<_$SubmitMaterialItemBonusImpl>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_material_item_bonus_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubmitMaterialItemBonusDto _$SubmitMaterialItemBonusDtoFromJson(
    Map<String, dynamic> json) {
  return _SubmitMaterialItemBonusDto.fromJson(json);
}

/// @nodoc
mixin _$SubmitMaterialItemBonusDto {
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty', defaultValue: 0)
  int get qty => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubmitMaterialItemBonusDtoCopyWith<SubmitMaterialItemBonusDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitMaterialItemBonusDtoCopyWith<$Res> {
  factory $SubmitMaterialItemBonusDtoCopyWith(SubmitMaterialItemBonusDto value,
          $Res Function(SubmitMaterialItemBonusDto) then) =
      _$SubmitMaterialItemBonusDtoCopyWithImpl<$Res,
          SubmitMaterialItemBonusDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'materialNumber', defaultValue: '') String materialNumber,
      @JsonKey(name: 'qty', defaultValue: 0) int qty});
}

/// @nodoc
class _$SubmitMaterialItemBonusDtoCopyWithImpl<$Res,
        $Val extends SubmitMaterialItemBonusDto>
    implements $SubmitMaterialItemBonusDtoCopyWith<$Res> {
  _$SubmitMaterialItemBonusDtoCopyWithImpl(this._value, this._then);

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
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubmitMaterialItemBonusDtoImplCopyWith<$Res>
    implements $SubmitMaterialItemBonusDtoCopyWith<$Res> {
  factory _$$SubmitMaterialItemBonusDtoImplCopyWith(
          _$SubmitMaterialItemBonusDtoImpl value,
          $Res Function(_$SubmitMaterialItemBonusDtoImpl) then) =
      __$$SubmitMaterialItemBonusDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'materialNumber', defaultValue: '') String materialNumber,
      @JsonKey(name: 'qty', defaultValue: 0) int qty});
}

/// @nodoc
class __$$SubmitMaterialItemBonusDtoImplCopyWithImpl<$Res>
    extends _$SubmitMaterialItemBonusDtoCopyWithImpl<$Res,
        _$SubmitMaterialItemBonusDtoImpl>
    implements _$$SubmitMaterialItemBonusDtoImplCopyWith<$Res> {
  __$$SubmitMaterialItemBonusDtoImplCopyWithImpl(
      _$SubmitMaterialItemBonusDtoImpl _value,
      $Res Function(_$SubmitMaterialItemBonusDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? qty = null,
  }) {
    return _then(_$SubmitMaterialItemBonusDtoImpl(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubmitMaterialItemBonusDtoImpl extends _SubmitMaterialItemBonusDto {
  _$SubmitMaterialItemBonusDtoImpl(
      {@JsonKey(name: 'materialNumber', defaultValue: '')
      required this.materialNumber,
      @JsonKey(name: 'qty', defaultValue: 0) required this.qty})
      : super._();

  factory _$SubmitMaterialItemBonusDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SubmitMaterialItemBonusDtoImplFromJson(json);

  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  final String materialNumber;
  @override
  @JsonKey(name: 'qty', defaultValue: 0)
  final int qty;

  @override
  String toString() {
    return 'SubmitMaterialItemBonusDto(materialNumber: $materialNumber, qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitMaterialItemBonusDtoImpl &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.qty, qty) || other.qty == qty));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, materialNumber, qty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitMaterialItemBonusDtoImplCopyWith<_$SubmitMaterialItemBonusDtoImpl>
      get copyWith => __$$SubmitMaterialItemBonusDtoImplCopyWithImpl<
          _$SubmitMaterialItemBonusDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubmitMaterialItemBonusDtoImplToJson(
      this,
    );
  }
}

abstract class _SubmitMaterialItemBonusDto extends SubmitMaterialItemBonusDto {
  factory _SubmitMaterialItemBonusDto(
          {@JsonKey(name: 'materialNumber', defaultValue: '')
          required final String materialNumber,
          @JsonKey(name: 'qty', defaultValue: 0) required final int qty}) =
      _$SubmitMaterialItemBonusDtoImpl;
  _SubmitMaterialItemBonusDto._() : super._();

  factory _SubmitMaterialItemBonusDto.fromJson(Map<String, dynamic> json) =
      _$SubmitMaterialItemBonusDtoImpl.fromJson;

  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'qty', defaultValue: 0)
  int get qty;
  @override
  @JsonKey(ignore: true)
  _$$SubmitMaterialItemBonusDtoImplCopyWith<_$SubmitMaterialItemBonusDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

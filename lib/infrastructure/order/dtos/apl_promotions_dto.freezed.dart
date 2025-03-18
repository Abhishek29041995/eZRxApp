// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apl_promotions_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AplPromotionsDto _$AplPromotionsDtoFromJson(Map<String, dynamic> json) {
  return _AplPromotionsDto.fromJson(json);
}

/// @nodoc
mixin _$AplPromotionsDto {
  @JsonKey(name: 'discountValue', defaultValue: 0)
  double get discountValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'discountTypeValue', defaultValue: '')
  String get discountTypeValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AplPromotionsDtoCopyWith<AplPromotionsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AplPromotionsDtoCopyWith<$Res> {
  factory $AplPromotionsDtoCopyWith(
          AplPromotionsDto value, $Res Function(AplPromotionsDto) then) =
      _$AplPromotionsDtoCopyWithImpl<$Res, AplPromotionsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'discountValue', defaultValue: 0) double discountValue,
      @JsonKey(name: 'discountTypeValue', defaultValue: '')
      String discountTypeValue});
}

/// @nodoc
class _$AplPromotionsDtoCopyWithImpl<$Res, $Val extends AplPromotionsDto>
    implements $AplPromotionsDtoCopyWith<$Res> {
  _$AplPromotionsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discountValue = null,
    Object? discountTypeValue = null,
  }) {
    return _then(_value.copyWith(
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double,
      discountTypeValue: null == discountTypeValue
          ? _value.discountTypeValue
          : discountTypeValue // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AplPromotionsDtoImplCopyWith<$Res>
    implements $AplPromotionsDtoCopyWith<$Res> {
  factory _$$AplPromotionsDtoImplCopyWith(_$AplPromotionsDtoImpl value,
          $Res Function(_$AplPromotionsDtoImpl) then) =
      __$$AplPromotionsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'discountValue', defaultValue: 0) double discountValue,
      @JsonKey(name: 'discountTypeValue', defaultValue: '')
      String discountTypeValue});
}

/// @nodoc
class __$$AplPromotionsDtoImplCopyWithImpl<$Res>
    extends _$AplPromotionsDtoCopyWithImpl<$Res, _$AplPromotionsDtoImpl>
    implements _$$AplPromotionsDtoImplCopyWith<$Res> {
  __$$AplPromotionsDtoImplCopyWithImpl(_$AplPromotionsDtoImpl _value,
      $Res Function(_$AplPromotionsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discountValue = null,
    Object? discountTypeValue = null,
  }) {
    return _then(_$AplPromotionsDtoImpl(
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double,
      discountTypeValue: null == discountTypeValue
          ? _value.discountTypeValue
          : discountTypeValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AplPromotionsDtoImpl extends _AplPromotionsDto {
  const _$AplPromotionsDtoImpl(
      {@JsonKey(name: 'discountValue', defaultValue: 0)
      required this.discountValue,
      @JsonKey(name: 'discountTypeValue', defaultValue: '')
      required this.discountTypeValue})
      : super._();

  factory _$AplPromotionsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AplPromotionsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'discountValue', defaultValue: 0)
  final double discountValue;
  @override
  @JsonKey(name: 'discountTypeValue', defaultValue: '')
  final String discountTypeValue;

  @override
  String toString() {
    return 'AplPromotionsDto(discountValue: $discountValue, discountTypeValue: $discountTypeValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AplPromotionsDtoImpl &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.discountTypeValue, discountTypeValue) ||
                other.discountTypeValue == discountTypeValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, discountValue, discountTypeValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AplPromotionsDtoImplCopyWith<_$AplPromotionsDtoImpl> get copyWith =>
      __$$AplPromotionsDtoImplCopyWithImpl<_$AplPromotionsDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AplPromotionsDtoImplToJson(
      this,
    );
  }
}

abstract class _AplPromotionsDto extends AplPromotionsDto {
  const factory _AplPromotionsDto(
      {@JsonKey(name: 'discountValue', defaultValue: 0)
      required final double discountValue,
      @JsonKey(name: 'discountTypeValue', defaultValue: '')
      required final String discountTypeValue}) = _$AplPromotionsDtoImpl;
  const _AplPromotionsDto._() : super._();

  factory _AplPromotionsDto.fromJson(Map<String, dynamic> json) =
      _$AplPromotionsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'discountValue', defaultValue: 0)
  double get discountValue;
  @override
  @JsonKey(name: 'discountTypeValue', defaultValue: '')
  String get discountTypeValue;
  @override
  @JsonKey(ignore: true)
  _$$AplPromotionsDtoImplCopyWith<_$AplPromotionsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

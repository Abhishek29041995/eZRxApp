// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apl_get_total_price_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AplGetTotalPriceDto _$AplGetTotalPriceDtoFromJson(Map<String, dynamic> json) {
  return _AplGetTotalPriceDto.fromJson(json);
}

/// @nodoc
mixin _$AplGetTotalPriceDto {
  @JsonKey(name: 'TotalPrice', defaultValue: 0)
  int get grandTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'Tax', defaultValue: 0)
  int get tax => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeliveryFee', defaultValue: 0)
  int get deliveryFee => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AplGetTotalPriceDtoCopyWith<AplGetTotalPriceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AplGetTotalPriceDtoCopyWith<$Res> {
  factory $AplGetTotalPriceDtoCopyWith(
          AplGetTotalPriceDto value, $Res Function(AplGetTotalPriceDto) then) =
      _$AplGetTotalPriceDtoCopyWithImpl<$Res, AplGetTotalPriceDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'TotalPrice', defaultValue: 0) int grandTotal,
      @JsonKey(name: 'Tax', defaultValue: 0) int tax,
      @JsonKey(name: 'DeliveryFee', defaultValue: 0) int deliveryFee});
}

/// @nodoc
class _$AplGetTotalPriceDtoCopyWithImpl<$Res, $Val extends AplGetTotalPriceDto>
    implements $AplGetTotalPriceDtoCopyWith<$Res> {
  _$AplGetTotalPriceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grandTotal = null,
    Object? tax = null,
    Object? deliveryFee = null,
  }) {
    return _then(_value.copyWith(
      grandTotal: null == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as int,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AplGetTotalPriceDtoImplCopyWith<$Res>
    implements $AplGetTotalPriceDtoCopyWith<$Res> {
  factory _$$AplGetTotalPriceDtoImplCopyWith(_$AplGetTotalPriceDtoImpl value,
          $Res Function(_$AplGetTotalPriceDtoImpl) then) =
      __$$AplGetTotalPriceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'TotalPrice', defaultValue: 0) int grandTotal,
      @JsonKey(name: 'Tax', defaultValue: 0) int tax,
      @JsonKey(name: 'DeliveryFee', defaultValue: 0) int deliveryFee});
}

/// @nodoc
class __$$AplGetTotalPriceDtoImplCopyWithImpl<$Res>
    extends _$AplGetTotalPriceDtoCopyWithImpl<$Res, _$AplGetTotalPriceDtoImpl>
    implements _$$AplGetTotalPriceDtoImplCopyWith<$Res> {
  __$$AplGetTotalPriceDtoImplCopyWithImpl(_$AplGetTotalPriceDtoImpl _value,
      $Res Function(_$AplGetTotalPriceDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grandTotal = null,
    Object? tax = null,
    Object? deliveryFee = null,
  }) {
    return _then(_$AplGetTotalPriceDtoImpl(
      grandTotal: null == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as int,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AplGetTotalPriceDtoImpl extends _AplGetTotalPriceDto {
  const _$AplGetTotalPriceDtoImpl(
      {@JsonKey(name: 'TotalPrice', defaultValue: 0) required this.grandTotal,
      @JsonKey(name: 'Tax', defaultValue: 0) required this.tax,
      @JsonKey(name: 'DeliveryFee', defaultValue: 0) required this.deliveryFee})
      : super._();

  factory _$AplGetTotalPriceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AplGetTotalPriceDtoImplFromJson(json);

  @override
  @JsonKey(name: 'TotalPrice', defaultValue: 0)
  final int grandTotal;
  @override
  @JsonKey(name: 'Tax', defaultValue: 0)
  final int tax;
  @override
  @JsonKey(name: 'DeliveryFee', defaultValue: 0)
  final int deliveryFee;

  @override
  String toString() {
    return 'AplGetTotalPriceDto(grandTotal: $grandTotal, tax: $tax, deliveryFee: $deliveryFee)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AplGetTotalPriceDtoImpl &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, grandTotal, tax, deliveryFee);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AplGetTotalPriceDtoImplCopyWith<_$AplGetTotalPriceDtoImpl> get copyWith =>
      __$$AplGetTotalPriceDtoImplCopyWithImpl<_$AplGetTotalPriceDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AplGetTotalPriceDtoImplToJson(
      this,
    );
  }
}

abstract class _AplGetTotalPriceDto extends AplGetTotalPriceDto {
  const factory _AplGetTotalPriceDto(
      {@JsonKey(name: 'TotalPrice', defaultValue: 0)
      required final int grandTotal,
      @JsonKey(name: 'Tax', defaultValue: 0) required final int tax,
      @JsonKey(name: 'DeliveryFee', defaultValue: 0)
      required final int deliveryFee}) = _$AplGetTotalPriceDtoImpl;
  const _AplGetTotalPriceDto._() : super._();

  factory _AplGetTotalPriceDto.fromJson(Map<String, dynamic> json) =
      _$AplGetTotalPriceDtoImpl.fromJson;

  @override
  @JsonKey(name: 'TotalPrice', defaultValue: 0)
  int get grandTotal;
  @override
  @JsonKey(name: 'Tax', defaultValue: 0)
  int get tax;
  @override
  @JsonKey(name: 'DeliveryFee', defaultValue: 0)
  int get deliveryFee;
  @override
  @JsonKey(ignore: true)
  _$$AplGetTotalPriceDtoImplCopyWith<_$AplGetTotalPriceDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

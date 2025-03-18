// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apl_simulator_order_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AplSimulatorOrderDto _$AplSimulatorOrderDtoFromJson(Map<String, dynamic> json) {
  return _AplSimulatorOrderDto.fromJson(json);
}

/// @nodoc
mixin _$AplSimulatorOrderDto {
  @JsonKey(name: 'beforeTax', defaultValue: 0)
  double get totalPriceWithoutTax =>
      throw _privateConstructorUsedError; //total price without tax
  @JsonKey(name: 'deliveryFee', defaultValue: 0)
  double get smallOrderFee =>
      throw _privateConstructorUsedError; //small order fee
  @JsonKey(name: 'netTotalValue', defaultValue: 0)
  double get grandTotal =>
      throw _privateConstructorUsedError; //grand total price
  @JsonKey(name: 'tax', defaultValue: 0)
  double get totalTax => throw _privateConstructorUsedError; //tax price
  @JsonKey(name: 'totalDiscValue', defaultValue: 0)
  double get totalDiscountValue =>
      throw _privateConstructorUsedError; //total savings
  @JsonKey(name: 'products', defaultValue: <AplProductDto>[])
  List<AplProductDto> get aplProductList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AplSimulatorOrderDtoCopyWith<AplSimulatorOrderDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AplSimulatorOrderDtoCopyWith<$Res> {
  factory $AplSimulatorOrderDtoCopyWith(AplSimulatorOrderDto value,
          $Res Function(AplSimulatorOrderDto) then) =
      _$AplSimulatorOrderDtoCopyWithImpl<$Res, AplSimulatorOrderDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'beforeTax', defaultValue: 0) double totalPriceWithoutTax,
      @JsonKey(name: 'deliveryFee', defaultValue: 0) double smallOrderFee,
      @JsonKey(name: 'netTotalValue', defaultValue: 0) double grandTotal,
      @JsonKey(name: 'tax', defaultValue: 0) double totalTax,
      @JsonKey(name: 'totalDiscValue', defaultValue: 0)
      double totalDiscountValue,
      @JsonKey(name: 'products', defaultValue: <AplProductDto>[])
      List<AplProductDto> aplProductList});
}

/// @nodoc
class _$AplSimulatorOrderDtoCopyWithImpl<$Res,
        $Val extends AplSimulatorOrderDto>
    implements $AplSimulatorOrderDtoCopyWith<$Res> {
  _$AplSimulatorOrderDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPriceWithoutTax = null,
    Object? smallOrderFee = null,
    Object? grandTotal = null,
    Object? totalTax = null,
    Object? totalDiscountValue = null,
    Object? aplProductList = null,
  }) {
    return _then(_value.copyWith(
      totalPriceWithoutTax: null == totalPriceWithoutTax
          ? _value.totalPriceWithoutTax
          : totalPriceWithoutTax // ignore: cast_nullable_to_non_nullable
              as double,
      smallOrderFee: null == smallOrderFee
          ? _value.smallOrderFee
          : smallOrderFee // ignore: cast_nullable_to_non_nullable
              as double,
      grandTotal: null == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as double,
      totalDiscountValue: null == totalDiscountValue
          ? _value.totalDiscountValue
          : totalDiscountValue // ignore: cast_nullable_to_non_nullable
              as double,
      aplProductList: null == aplProductList
          ? _value.aplProductList
          : aplProductList // ignore: cast_nullable_to_non_nullable
              as List<AplProductDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AplSimulatorOrderDtoImplCopyWith<$Res>
    implements $AplSimulatorOrderDtoCopyWith<$Res> {
  factory _$$AplSimulatorOrderDtoImplCopyWith(_$AplSimulatorOrderDtoImpl value,
          $Res Function(_$AplSimulatorOrderDtoImpl) then) =
      __$$AplSimulatorOrderDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'beforeTax', defaultValue: 0) double totalPriceWithoutTax,
      @JsonKey(name: 'deliveryFee', defaultValue: 0) double smallOrderFee,
      @JsonKey(name: 'netTotalValue', defaultValue: 0) double grandTotal,
      @JsonKey(name: 'tax', defaultValue: 0) double totalTax,
      @JsonKey(name: 'totalDiscValue', defaultValue: 0)
      double totalDiscountValue,
      @JsonKey(name: 'products', defaultValue: <AplProductDto>[])
      List<AplProductDto> aplProductList});
}

/// @nodoc
class __$$AplSimulatorOrderDtoImplCopyWithImpl<$Res>
    extends _$AplSimulatorOrderDtoCopyWithImpl<$Res, _$AplSimulatorOrderDtoImpl>
    implements _$$AplSimulatorOrderDtoImplCopyWith<$Res> {
  __$$AplSimulatorOrderDtoImplCopyWithImpl(_$AplSimulatorOrderDtoImpl _value,
      $Res Function(_$AplSimulatorOrderDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPriceWithoutTax = null,
    Object? smallOrderFee = null,
    Object? grandTotal = null,
    Object? totalTax = null,
    Object? totalDiscountValue = null,
    Object? aplProductList = null,
  }) {
    return _then(_$AplSimulatorOrderDtoImpl(
      totalPriceWithoutTax: null == totalPriceWithoutTax
          ? _value.totalPriceWithoutTax
          : totalPriceWithoutTax // ignore: cast_nullable_to_non_nullable
              as double,
      smallOrderFee: null == smallOrderFee
          ? _value.smallOrderFee
          : smallOrderFee // ignore: cast_nullable_to_non_nullable
              as double,
      grandTotal: null == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
      totalTax: null == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as double,
      totalDiscountValue: null == totalDiscountValue
          ? _value.totalDiscountValue
          : totalDiscountValue // ignore: cast_nullable_to_non_nullable
              as double,
      aplProductList: null == aplProductList
          ? _value._aplProductList
          : aplProductList // ignore: cast_nullable_to_non_nullable
              as List<AplProductDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AplSimulatorOrderDtoImpl extends _AplSimulatorOrderDto {
  const _$AplSimulatorOrderDtoImpl(
      {@JsonKey(name: 'beforeTax', defaultValue: 0)
      required this.totalPriceWithoutTax,
      @JsonKey(name: 'deliveryFee', defaultValue: 0)
      required this.smallOrderFee,
      @JsonKey(name: 'netTotalValue', defaultValue: 0) required this.grandTotal,
      @JsonKey(name: 'tax', defaultValue: 0) required this.totalTax,
      @JsonKey(name: 'totalDiscValue', defaultValue: 0)
      required this.totalDiscountValue,
      @JsonKey(name: 'products', defaultValue: <AplProductDto>[])
      required final List<AplProductDto> aplProductList})
      : _aplProductList = aplProductList,
        super._();

  factory _$AplSimulatorOrderDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AplSimulatorOrderDtoImplFromJson(json);

  @override
  @JsonKey(name: 'beforeTax', defaultValue: 0)
  final double totalPriceWithoutTax;
//total price without tax
  @override
  @JsonKey(name: 'deliveryFee', defaultValue: 0)
  final double smallOrderFee;
//small order fee
  @override
  @JsonKey(name: 'netTotalValue', defaultValue: 0)
  final double grandTotal;
//grand total price
  @override
  @JsonKey(name: 'tax', defaultValue: 0)
  final double totalTax;
//tax price
  @override
  @JsonKey(name: 'totalDiscValue', defaultValue: 0)
  final double totalDiscountValue;
//total savings
  final List<AplProductDto> _aplProductList;
//total savings
  @override
  @JsonKey(name: 'products', defaultValue: <AplProductDto>[])
  List<AplProductDto> get aplProductList {
    if (_aplProductList is EqualUnmodifiableListView) return _aplProductList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_aplProductList);
  }

  @override
  String toString() {
    return 'AplSimulatorOrderDto(totalPriceWithoutTax: $totalPriceWithoutTax, smallOrderFee: $smallOrderFee, grandTotal: $grandTotal, totalTax: $totalTax, totalDiscountValue: $totalDiscountValue, aplProductList: $aplProductList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AplSimulatorOrderDtoImpl &&
            (identical(other.totalPriceWithoutTax, totalPriceWithoutTax) ||
                other.totalPriceWithoutTax == totalPriceWithoutTax) &&
            (identical(other.smallOrderFee, smallOrderFee) ||
                other.smallOrderFee == smallOrderFee) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal) &&
            (identical(other.totalTax, totalTax) ||
                other.totalTax == totalTax) &&
            (identical(other.totalDiscountValue, totalDiscountValue) ||
                other.totalDiscountValue == totalDiscountValue) &&
            const DeepCollectionEquality()
                .equals(other._aplProductList, _aplProductList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalPriceWithoutTax,
      smallOrderFee,
      grandTotal,
      totalTax,
      totalDiscountValue,
      const DeepCollectionEquality().hash(_aplProductList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AplSimulatorOrderDtoImplCopyWith<_$AplSimulatorOrderDtoImpl>
      get copyWith =>
          __$$AplSimulatorOrderDtoImplCopyWithImpl<_$AplSimulatorOrderDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AplSimulatorOrderDtoImplToJson(
      this,
    );
  }
}

abstract class _AplSimulatorOrderDto extends AplSimulatorOrderDto {
  const factory _AplSimulatorOrderDto(
          {@JsonKey(name: 'beforeTax', defaultValue: 0)
          required final double totalPriceWithoutTax,
          @JsonKey(name: 'deliveryFee', defaultValue: 0)
          required final double smallOrderFee,
          @JsonKey(name: 'netTotalValue', defaultValue: 0)
          required final double grandTotal,
          @JsonKey(name: 'tax', defaultValue: 0) required final double totalTax,
          @JsonKey(name: 'totalDiscValue', defaultValue: 0)
          required final double totalDiscountValue,
          @JsonKey(name: 'products', defaultValue: <AplProductDto>[])
          required final List<AplProductDto> aplProductList}) =
      _$AplSimulatorOrderDtoImpl;
  const _AplSimulatorOrderDto._() : super._();

  factory _AplSimulatorOrderDto.fromJson(Map<String, dynamic> json) =
      _$AplSimulatorOrderDtoImpl.fromJson;

  @override
  @JsonKey(name: 'beforeTax', defaultValue: 0)
  double get totalPriceWithoutTax;
  @override //total price without tax
  @JsonKey(name: 'deliveryFee', defaultValue: 0)
  double get smallOrderFee;
  @override //small order fee
  @JsonKey(name: 'netTotalValue', defaultValue: 0)
  double get grandTotal;
  @override //grand total price
  @JsonKey(name: 'tax', defaultValue: 0)
  double get totalTax;
  @override //tax price
  @JsonKey(name: 'totalDiscValue', defaultValue: 0)
  double get totalDiscountValue;
  @override //total savings
  @JsonKey(name: 'products', defaultValue: <AplProductDto>[])
  List<AplProductDto> get aplProductList;
  @override
  @JsonKey(ignore: true)
  _$$AplSimulatorOrderDtoImplCopyWith<_$AplSimulatorOrderDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

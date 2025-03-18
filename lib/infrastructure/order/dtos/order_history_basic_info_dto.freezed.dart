// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_basic_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderHistoryBasicInfoDto _$OrderHistoryBasicInfoDtoFromJson(
    Map<String, dynamic> json) {
  return _OrderHistoryBasicInfoDto.fromJson(json);
}

/// @nodoc
mixin _$OrderHistoryBasicInfoDto {
  @JsonKey(name: 'soldTo')
  String get soldTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipTo')
  String get shipTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'companyName')
  String get companyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentTerm')
  PaymentTermDto get paymentTerm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderHistoryBasicInfoDtoCopyWith<OrderHistoryBasicInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryBasicInfoDtoCopyWith<$Res> {
  factory $OrderHistoryBasicInfoDtoCopyWith(OrderHistoryBasicInfoDto value,
          $Res Function(OrderHistoryBasicInfoDto) then) =
      _$OrderHistoryBasicInfoDtoCopyWithImpl<$Res, OrderHistoryBasicInfoDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'soldTo') String soldTo,
      @JsonKey(name: 'shipTo') String shipTo,
      @JsonKey(name: 'companyName') String companyName,
      @JsonKey(name: 'paymentTerm') PaymentTermDto paymentTerm});

  $PaymentTermDtoCopyWith<$Res> get paymentTerm;
}

/// @nodoc
class _$OrderHistoryBasicInfoDtoCopyWithImpl<$Res,
        $Val extends OrderHistoryBasicInfoDto>
    implements $OrderHistoryBasicInfoDtoCopyWith<$Res> {
  _$OrderHistoryBasicInfoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soldTo = null,
    Object? shipTo = null,
    Object? companyName = null,
    Object? paymentTerm = null,
  }) {
    return _then(_value.copyWith(
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      shipTo: null == shipTo
          ? _value.shipTo
          : shipTo // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTerm: null == paymentTerm
          ? _value.paymentTerm
          : paymentTerm // ignore: cast_nullable_to_non_nullable
              as PaymentTermDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentTermDtoCopyWith<$Res> get paymentTerm {
    return $PaymentTermDtoCopyWith<$Res>(_value.paymentTerm, (value) {
      return _then(_value.copyWith(paymentTerm: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderHistoryBasicInfoDtoImplCopyWith<$Res>
    implements $OrderHistoryBasicInfoDtoCopyWith<$Res> {
  factory _$$OrderHistoryBasicInfoDtoImplCopyWith(
          _$OrderHistoryBasicInfoDtoImpl value,
          $Res Function(_$OrderHistoryBasicInfoDtoImpl) then) =
      __$$OrderHistoryBasicInfoDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'soldTo') String soldTo,
      @JsonKey(name: 'shipTo') String shipTo,
      @JsonKey(name: 'companyName') String companyName,
      @JsonKey(name: 'paymentTerm') PaymentTermDto paymentTerm});

  @override
  $PaymentTermDtoCopyWith<$Res> get paymentTerm;
}

/// @nodoc
class __$$OrderHistoryBasicInfoDtoImplCopyWithImpl<$Res>
    extends _$OrderHistoryBasicInfoDtoCopyWithImpl<$Res,
        _$OrderHistoryBasicInfoDtoImpl>
    implements _$$OrderHistoryBasicInfoDtoImplCopyWith<$Res> {
  __$$OrderHistoryBasicInfoDtoImplCopyWithImpl(
      _$OrderHistoryBasicInfoDtoImpl _value,
      $Res Function(_$OrderHistoryBasicInfoDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soldTo = null,
    Object? shipTo = null,
    Object? companyName = null,
    Object? paymentTerm = null,
  }) {
    return _then(_$OrderHistoryBasicInfoDtoImpl(
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      shipTo: null == shipTo
          ? _value.shipTo
          : shipTo // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTerm: null == paymentTerm
          ? _value.paymentTerm
          : paymentTerm // ignore: cast_nullable_to_non_nullable
              as PaymentTermDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderHistoryBasicInfoDtoImpl extends _OrderHistoryBasicInfoDto {
  const _$OrderHistoryBasicInfoDtoImpl(
      {@JsonKey(name: 'soldTo') required this.soldTo,
      @JsonKey(name: 'shipTo') required this.shipTo,
      @JsonKey(name: 'companyName') required this.companyName,
      @JsonKey(name: 'paymentTerm') required this.paymentTerm})
      : super._();

  factory _$OrderHistoryBasicInfoDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderHistoryBasicInfoDtoImplFromJson(json);

  @override
  @JsonKey(name: 'soldTo')
  final String soldTo;
  @override
  @JsonKey(name: 'shipTo')
  final String shipTo;
  @override
  @JsonKey(name: 'companyName')
  final String companyName;
  @override
  @JsonKey(name: 'paymentTerm')
  final PaymentTermDto paymentTerm;

  @override
  String toString() {
    return 'OrderHistoryBasicInfoDto(soldTo: $soldTo, shipTo: $shipTo, companyName: $companyName, paymentTerm: $paymentTerm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderHistoryBasicInfoDtoImpl &&
            (identical(other.soldTo, soldTo) || other.soldTo == soldTo) &&
            (identical(other.shipTo, shipTo) || other.shipTo == shipTo) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.paymentTerm, paymentTerm) ||
                other.paymentTerm == paymentTerm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, soldTo, shipTo, companyName, paymentTerm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderHistoryBasicInfoDtoImplCopyWith<_$OrderHistoryBasicInfoDtoImpl>
      get copyWith => __$$OrderHistoryBasicInfoDtoImplCopyWithImpl<
          _$OrderHistoryBasicInfoDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderHistoryBasicInfoDtoImplToJson(
      this,
    );
  }
}

abstract class _OrderHistoryBasicInfoDto extends OrderHistoryBasicInfoDto {
  const factory _OrderHistoryBasicInfoDto(
          {@JsonKey(name: 'soldTo') required final String soldTo,
          @JsonKey(name: 'shipTo') required final String shipTo,
          @JsonKey(name: 'companyName') required final String companyName,
          @JsonKey(name: 'paymentTerm')
          required final PaymentTermDto paymentTerm}) =
      _$OrderHistoryBasicInfoDtoImpl;
  const _OrderHistoryBasicInfoDto._() : super._();

  factory _OrderHistoryBasicInfoDto.fromJson(Map<String, dynamic> json) =
      _$OrderHistoryBasicInfoDtoImpl.fromJson;

  @override
  @JsonKey(name: 'soldTo')
  String get soldTo;
  @override
  @JsonKey(name: 'shipTo')
  String get shipTo;
  @override
  @JsonKey(name: 'companyName')
  String get companyName;
  @override
  @JsonKey(name: 'paymentTerm')
  PaymentTermDto get paymentTerm;
  @override
  @JsonKey(ignore: true)
  _$$OrderHistoryBasicInfoDtoImplCopyWith<_$OrderHistoryBasicInfoDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_details_order_items_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderHistoryDetailsOrderItemDetailsDto
    _$OrderHistoryDetailsOrderItemDetailsDtoFromJson(
        Map<String, dynamic> json) {
  return _OrderHistoryDetailsOrderItemDetailsDto.fromJson(json);
}

/// @nodoc
mixin _$OrderHistoryDetailsOrderItemDetailsDto {
  @JsonKey(name: 'discountCode', defaultValue: '')
  String get discountCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'discountDescription', defaultValue: '')
  String get discountDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'rate', defaultValue: '')
  String get rate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderHistoryDetailsOrderItemDetailsDtoCopyWith<
          OrderHistoryDetailsOrderItemDetailsDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDetailsOrderItemDetailsDtoCopyWith<$Res> {
  factory $OrderHistoryDetailsOrderItemDetailsDtoCopyWith(
          OrderHistoryDetailsOrderItemDetailsDto value,
          $Res Function(OrderHistoryDetailsOrderItemDetailsDto) then) =
      _$OrderHistoryDetailsOrderItemDetailsDtoCopyWithImpl<$Res,
          OrderHistoryDetailsOrderItemDetailsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'discountCode', defaultValue: '') String discountCode,
      @JsonKey(name: 'discountDescription', defaultValue: '')
      String discountDescription,
      @JsonKey(name: 'rate', defaultValue: '') String rate});
}

/// @nodoc
class _$OrderHistoryDetailsOrderItemDetailsDtoCopyWithImpl<$Res,
        $Val extends OrderHistoryDetailsOrderItemDetailsDto>
    implements $OrderHistoryDetailsOrderItemDetailsDtoCopyWith<$Res> {
  _$OrderHistoryDetailsOrderItemDetailsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discountCode = null,
    Object? discountDescription = null,
    Object? rate = null,
  }) {
    return _then(_value.copyWith(
      discountCode: null == discountCode
          ? _value.discountCode
          : discountCode // ignore: cast_nullable_to_non_nullable
              as String,
      discountDescription: null == discountDescription
          ? _value.discountDescription
          : discountDescription // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderHistoryDetailsOrderItemDetailsDtoImplCopyWith<$Res>
    implements $OrderHistoryDetailsOrderItemDetailsDtoCopyWith<$Res> {
  factory _$$OrderHistoryDetailsOrderItemDetailsDtoImplCopyWith(
          _$OrderHistoryDetailsOrderItemDetailsDtoImpl value,
          $Res Function(_$OrderHistoryDetailsOrderItemDetailsDtoImpl) then) =
      __$$OrderHistoryDetailsOrderItemDetailsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'discountCode', defaultValue: '') String discountCode,
      @JsonKey(name: 'discountDescription', defaultValue: '')
      String discountDescription,
      @JsonKey(name: 'rate', defaultValue: '') String rate});
}

/// @nodoc
class __$$OrderHistoryDetailsOrderItemDetailsDtoImplCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsOrderItemDetailsDtoCopyWithImpl<$Res,
        _$OrderHistoryDetailsOrderItemDetailsDtoImpl>
    implements _$$OrderHistoryDetailsOrderItemDetailsDtoImplCopyWith<$Res> {
  __$$OrderHistoryDetailsOrderItemDetailsDtoImplCopyWithImpl(
      _$OrderHistoryDetailsOrderItemDetailsDtoImpl _value,
      $Res Function(_$OrderHistoryDetailsOrderItemDetailsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discountCode = null,
    Object? discountDescription = null,
    Object? rate = null,
  }) {
    return _then(_$OrderHistoryDetailsOrderItemDetailsDtoImpl(
      discountCode: null == discountCode
          ? _value.discountCode
          : discountCode // ignore: cast_nullable_to_non_nullable
              as String,
      discountDescription: null == discountDescription
          ? _value.discountDescription
          : discountDescription // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderHistoryDetailsOrderItemDetailsDtoImpl
    extends _OrderHistoryDetailsOrderItemDetailsDto {
  const _$OrderHistoryDetailsOrderItemDetailsDtoImpl(
      {@JsonKey(name: 'discountCode', defaultValue: '')
      required this.discountCode,
      @JsonKey(name: 'discountDescription', defaultValue: '')
      required this.discountDescription,
      @JsonKey(name: 'rate', defaultValue: '') required this.rate})
      : super._();

  factory _$OrderHistoryDetailsOrderItemDetailsDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$OrderHistoryDetailsOrderItemDetailsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'discountCode', defaultValue: '')
  final String discountCode;
  @override
  @JsonKey(name: 'discountDescription', defaultValue: '')
  final String discountDescription;
  @override
  @JsonKey(name: 'rate', defaultValue: '')
  final String rate;

  @override
  String toString() {
    return 'OrderHistoryDetailsOrderItemDetailsDto(discountCode: $discountCode, discountDescription: $discountDescription, rate: $rate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderHistoryDetailsOrderItemDetailsDtoImpl &&
            (identical(other.discountCode, discountCode) ||
                other.discountCode == discountCode) &&
            (identical(other.discountDescription, discountDescription) ||
                other.discountDescription == discountDescription) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, discountCode, discountDescription, rate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderHistoryDetailsOrderItemDetailsDtoImplCopyWith<
          _$OrderHistoryDetailsOrderItemDetailsDtoImpl>
      get copyWith =>
          __$$OrderHistoryDetailsOrderItemDetailsDtoImplCopyWithImpl<
              _$OrderHistoryDetailsOrderItemDetailsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderHistoryDetailsOrderItemDetailsDtoImplToJson(
      this,
    );
  }
}

abstract class _OrderHistoryDetailsOrderItemDetailsDto
    extends OrderHistoryDetailsOrderItemDetailsDto {
  const factory _OrderHistoryDetailsOrderItemDetailsDto(
          {@JsonKey(name: 'discountCode', defaultValue: '')
          required final String discountCode,
          @JsonKey(name: 'discountDescription', defaultValue: '')
          required final String discountDescription,
          @JsonKey(name: 'rate', defaultValue: '')
          required final String rate}) =
      _$OrderHistoryDetailsOrderItemDetailsDtoImpl;
  const _OrderHistoryDetailsOrderItemDetailsDto._() : super._();

  factory _OrderHistoryDetailsOrderItemDetailsDto.fromJson(
          Map<String, dynamic> json) =
      _$OrderHistoryDetailsOrderItemDetailsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'discountCode', defaultValue: '')
  String get discountCode;
  @override
  @JsonKey(name: 'discountDescription', defaultValue: '')
  String get discountDescription;
  @override
  @JsonKey(name: 'rate', defaultValue: '')
  String get rate;
  @override
  @JsonKey(ignore: true)
  _$$OrderHistoryDetailsOrderItemDetailsDtoImplCopyWith<
          _$OrderHistoryDetailsOrderItemDetailsDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

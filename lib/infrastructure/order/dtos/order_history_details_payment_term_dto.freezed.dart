// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_details_payment_term_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderHistoryDetailsPaymentTermDto _$OrderHistoryDetailsPaymentTermDtoFromJson(
    Map<String, dynamic> json) {
  return _OrderHistoryDetailsPaymentTermDto.fromJson(json);
}

/// @nodoc
mixin _$OrderHistoryDetailsPaymentTermDto {
  @JsonKey(name: 'paymentTermCode', defaultValue: '')
  String get paymentTermCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentTermDescription', defaultValue: '')
  String get paymentTermDescription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderHistoryDetailsPaymentTermDtoCopyWith<OrderHistoryDetailsPaymentTermDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDetailsPaymentTermDtoCopyWith<$Res> {
  factory $OrderHistoryDetailsPaymentTermDtoCopyWith(
          OrderHistoryDetailsPaymentTermDto value,
          $Res Function(OrderHistoryDetailsPaymentTermDto) then) =
      _$OrderHistoryDetailsPaymentTermDtoCopyWithImpl<$Res,
          OrderHistoryDetailsPaymentTermDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'paymentTermCode', defaultValue: '')
      String paymentTermCode,
      @JsonKey(name: 'paymentTermDescription', defaultValue: '')
      String paymentTermDescription});
}

/// @nodoc
class _$OrderHistoryDetailsPaymentTermDtoCopyWithImpl<$Res,
        $Val extends OrderHistoryDetailsPaymentTermDto>
    implements $OrderHistoryDetailsPaymentTermDtoCopyWith<$Res> {
  _$OrderHistoryDetailsPaymentTermDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentTermCode = null,
    Object? paymentTermDescription = null,
  }) {
    return _then(_value.copyWith(
      paymentTermCode: null == paymentTermCode
          ? _value.paymentTermCode
          : paymentTermCode // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTermDescription: null == paymentTermDescription
          ? _value.paymentTermDescription
          : paymentTermDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderHistoryDetailsPaymentTermDtoImplCopyWith<$Res>
    implements $OrderHistoryDetailsPaymentTermDtoCopyWith<$Res> {
  factory _$$OrderHistoryDetailsPaymentTermDtoImplCopyWith(
          _$OrderHistoryDetailsPaymentTermDtoImpl value,
          $Res Function(_$OrderHistoryDetailsPaymentTermDtoImpl) then) =
      __$$OrderHistoryDetailsPaymentTermDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'paymentTermCode', defaultValue: '')
      String paymentTermCode,
      @JsonKey(name: 'paymentTermDescription', defaultValue: '')
      String paymentTermDescription});
}

/// @nodoc
class __$$OrderHistoryDetailsPaymentTermDtoImplCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsPaymentTermDtoCopyWithImpl<$Res,
        _$OrderHistoryDetailsPaymentTermDtoImpl>
    implements _$$OrderHistoryDetailsPaymentTermDtoImplCopyWith<$Res> {
  __$$OrderHistoryDetailsPaymentTermDtoImplCopyWithImpl(
      _$OrderHistoryDetailsPaymentTermDtoImpl _value,
      $Res Function(_$OrderHistoryDetailsPaymentTermDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentTermCode = null,
    Object? paymentTermDescription = null,
  }) {
    return _then(_$OrderHistoryDetailsPaymentTermDtoImpl(
      paymentTermCode: null == paymentTermCode
          ? _value.paymentTermCode
          : paymentTermCode // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTermDescription: null == paymentTermDescription
          ? _value.paymentTermDescription
          : paymentTermDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderHistoryDetailsPaymentTermDtoImpl
    extends _OrderHistoryDetailsPaymentTermDto {
  const _$OrderHistoryDetailsPaymentTermDtoImpl(
      {@JsonKey(name: 'paymentTermCode', defaultValue: '')
      required this.paymentTermCode,
      @JsonKey(name: 'paymentTermDescription', defaultValue: '')
      required this.paymentTermDescription})
      : super._();

  factory _$OrderHistoryDetailsPaymentTermDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$OrderHistoryDetailsPaymentTermDtoImplFromJson(json);

  @override
  @JsonKey(name: 'paymentTermCode', defaultValue: '')
  final String paymentTermCode;
  @override
  @JsonKey(name: 'paymentTermDescription', defaultValue: '')
  final String paymentTermDescription;

  @override
  String toString() {
    return 'OrderHistoryDetailsPaymentTermDto(paymentTermCode: $paymentTermCode, paymentTermDescription: $paymentTermDescription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderHistoryDetailsPaymentTermDtoImpl &&
            (identical(other.paymentTermCode, paymentTermCode) ||
                other.paymentTermCode == paymentTermCode) &&
            (identical(other.paymentTermDescription, paymentTermDescription) ||
                other.paymentTermDescription == paymentTermDescription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, paymentTermCode, paymentTermDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderHistoryDetailsPaymentTermDtoImplCopyWith<
          _$OrderHistoryDetailsPaymentTermDtoImpl>
      get copyWith => __$$OrderHistoryDetailsPaymentTermDtoImplCopyWithImpl<
          _$OrderHistoryDetailsPaymentTermDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderHistoryDetailsPaymentTermDtoImplToJson(
      this,
    );
  }
}

abstract class _OrderHistoryDetailsPaymentTermDto
    extends OrderHistoryDetailsPaymentTermDto {
  const factory _OrderHistoryDetailsPaymentTermDto(
          {@JsonKey(name: 'paymentTermCode', defaultValue: '')
          required final String paymentTermCode,
          @JsonKey(name: 'paymentTermDescription', defaultValue: '')
          required final String paymentTermDescription}) =
      _$OrderHistoryDetailsPaymentTermDtoImpl;
  const _OrderHistoryDetailsPaymentTermDto._() : super._();

  factory _OrderHistoryDetailsPaymentTermDto.fromJson(
          Map<String, dynamic> json) =
      _$OrderHistoryDetailsPaymentTermDtoImpl.fromJson;

  @override
  @JsonKey(name: 'paymentTermCode', defaultValue: '')
  String get paymentTermCode;
  @override
  @JsonKey(name: 'paymentTermDescription', defaultValue: '')
  String get paymentTermDescription;
  @override
  @JsonKey(ignore: true)
  _$$OrderHistoryDetailsPaymentTermDtoImplCopyWith<
          _$OrderHistoryDetailsPaymentTermDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_payment_filter_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerPaymentFilterDto _$CustomerPaymentFilterDtoFromJson(
    Map<String, dynamic> json) {
  return _CustomerPaymentFilterDto.fromJson(json);
}

/// @nodoc
mixin _$CustomerPaymentFilterDto {
  @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
  String get paymentBatchAdditionalInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdDateToday', defaultValue: '')
  String get createdDateToday => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdDateYesterday', defaultValue: '')
  String get createdDateYesterday => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerPaymentFilterDtoCopyWith<CustomerPaymentFilterDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerPaymentFilterDtoCopyWith<$Res> {
  factory $CustomerPaymentFilterDtoCopyWith(CustomerPaymentFilterDto value,
          $Res Function(CustomerPaymentFilterDto) then) =
      _$CustomerPaymentFilterDtoCopyWithImpl<$Res, CustomerPaymentFilterDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
      String paymentBatchAdditionalInfo,
      @JsonKey(name: 'createdDateToday', defaultValue: '')
      String createdDateToday,
      @JsonKey(name: 'createdDateYesterday', defaultValue: '')
      String createdDateYesterday});
}

/// @nodoc
class _$CustomerPaymentFilterDtoCopyWithImpl<$Res,
        $Val extends CustomerPaymentFilterDto>
    implements $CustomerPaymentFilterDtoCopyWith<$Res> {
  _$CustomerPaymentFilterDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentBatchAdditionalInfo = null,
    Object? createdDateToday = null,
    Object? createdDateYesterday = null,
  }) {
    return _then(_value.copyWith(
      paymentBatchAdditionalInfo: null == paymentBatchAdditionalInfo
          ? _value.paymentBatchAdditionalInfo
          : paymentBatchAdditionalInfo // ignore: cast_nullable_to_non_nullable
              as String,
      createdDateToday: null == createdDateToday
          ? _value.createdDateToday
          : createdDateToday // ignore: cast_nullable_to_non_nullable
              as String,
      createdDateYesterday: null == createdDateYesterday
          ? _value.createdDateYesterday
          : createdDateYesterday // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerPaymentFilterDtoImplCopyWith<$Res>
    implements $CustomerPaymentFilterDtoCopyWith<$Res> {
  factory _$$CustomerPaymentFilterDtoImplCopyWith(
          _$CustomerPaymentFilterDtoImpl value,
          $Res Function(_$CustomerPaymentFilterDtoImpl) then) =
      __$$CustomerPaymentFilterDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
      String paymentBatchAdditionalInfo,
      @JsonKey(name: 'createdDateToday', defaultValue: '')
      String createdDateToday,
      @JsonKey(name: 'createdDateYesterday', defaultValue: '')
      String createdDateYesterday});
}

/// @nodoc
class __$$CustomerPaymentFilterDtoImplCopyWithImpl<$Res>
    extends _$CustomerPaymentFilterDtoCopyWithImpl<$Res,
        _$CustomerPaymentFilterDtoImpl>
    implements _$$CustomerPaymentFilterDtoImplCopyWith<$Res> {
  __$$CustomerPaymentFilterDtoImplCopyWithImpl(
      _$CustomerPaymentFilterDtoImpl _value,
      $Res Function(_$CustomerPaymentFilterDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentBatchAdditionalInfo = null,
    Object? createdDateToday = null,
    Object? createdDateYesterday = null,
  }) {
    return _then(_$CustomerPaymentFilterDtoImpl(
      paymentBatchAdditionalInfo: null == paymentBatchAdditionalInfo
          ? _value.paymentBatchAdditionalInfo
          : paymentBatchAdditionalInfo // ignore: cast_nullable_to_non_nullable
              as String,
      createdDateToday: null == createdDateToday
          ? _value.createdDateToday
          : createdDateToday // ignore: cast_nullable_to_non_nullable
              as String,
      createdDateYesterday: null == createdDateYesterday
          ? _value.createdDateYesterday
          : createdDateYesterday // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerPaymentFilterDtoImpl extends _CustomerPaymentFilterDto {
  const _$CustomerPaymentFilterDtoImpl(
      {@JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
      required this.paymentBatchAdditionalInfo,
      @JsonKey(name: 'createdDateToday', defaultValue: '')
      required this.createdDateToday,
      @JsonKey(name: 'createdDateYesterday', defaultValue: '')
      required this.createdDateYesterday})
      : super._();

  factory _$CustomerPaymentFilterDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerPaymentFilterDtoImplFromJson(json);

  @override
  @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
  final String paymentBatchAdditionalInfo;
  @override
  @JsonKey(name: 'createdDateToday', defaultValue: '')
  final String createdDateToday;
  @override
  @JsonKey(name: 'createdDateYesterday', defaultValue: '')
  final String createdDateYesterday;

  @override
  String toString() {
    return 'CustomerPaymentFilterDto(paymentBatchAdditionalInfo: $paymentBatchAdditionalInfo, createdDateToday: $createdDateToday, createdDateYesterday: $createdDateYesterday)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerPaymentFilterDtoImpl &&
            (identical(other.paymentBatchAdditionalInfo,
                    paymentBatchAdditionalInfo) ||
                other.paymentBatchAdditionalInfo ==
                    paymentBatchAdditionalInfo) &&
            (identical(other.createdDateToday, createdDateToday) ||
                other.createdDateToday == createdDateToday) &&
            (identical(other.createdDateYesterday, createdDateYesterday) ||
                other.createdDateYesterday == createdDateYesterday));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, paymentBatchAdditionalInfo,
      createdDateToday, createdDateYesterday);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerPaymentFilterDtoImplCopyWith<_$CustomerPaymentFilterDtoImpl>
      get copyWith => __$$CustomerPaymentFilterDtoImplCopyWithImpl<
          _$CustomerPaymentFilterDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerPaymentFilterDtoImplToJson(
      this,
    );
  }
}

abstract class _CustomerPaymentFilterDto extends CustomerPaymentFilterDto {
  const factory _CustomerPaymentFilterDto(
          {@JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
          required final String paymentBatchAdditionalInfo,
          @JsonKey(name: 'createdDateToday', defaultValue: '')
          required final String createdDateToday,
          @JsonKey(name: 'createdDateYesterday', defaultValue: '')
          required final String createdDateYesterday}) =
      _$CustomerPaymentFilterDtoImpl;
  const _CustomerPaymentFilterDto._() : super._();

  factory _CustomerPaymentFilterDto.fromJson(Map<String, dynamic> json) =
      _$CustomerPaymentFilterDtoImpl.fromJson;

  @override
  @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
  String get paymentBatchAdditionalInfo;
  @override
  @JsonKey(name: 'createdDateToday', defaultValue: '')
  String get createdDateToday;
  @override
  @JsonKey(name: 'createdDateYesterday', defaultValue: '')
  String get createdDateYesterday;
  @override
  @JsonKey(ignore: true)
  _$$CustomerPaymentFilterDtoImplCopyWith<_$CustomerPaymentFilterDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

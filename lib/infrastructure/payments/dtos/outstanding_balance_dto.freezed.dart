// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outstanding_balance_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OutstandingBalanceDto _$OutstandingBalanceDtoFromJson(
    Map<String, dynamic> json) {
  return _OutstandingBalanceDto.fromJson(json);
}

/// @nodoc
mixin _$OutstandingBalanceDto {
  @JsonKey(name: 'customerCode', defaultValue: '')
  String get customerCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency', defaultValue: '')
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount', defaultValue: '')
  String get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'overdue', defaultValue: '')
  String get overdue => throw _privateConstructorUsedError;
  @JsonKey(name: 'checkDate', defaultValue: '')
  String get checkDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OutstandingBalanceDtoCopyWith<OutstandingBalanceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutstandingBalanceDtoCopyWith<$Res> {
  factory $OutstandingBalanceDtoCopyWith(OutstandingBalanceDto value,
          $Res Function(OutstandingBalanceDto) then) =
      _$OutstandingBalanceDtoCopyWithImpl<$Res, OutstandingBalanceDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'customerCode', defaultValue: '') String customerCode,
      @JsonKey(name: 'currency', defaultValue: '') String currency,
      @JsonKey(name: 'amount', defaultValue: '') String amount,
      @JsonKey(name: 'overdue', defaultValue: '') String overdue,
      @JsonKey(name: 'checkDate', defaultValue: '') String checkDate});
}

/// @nodoc
class _$OutstandingBalanceDtoCopyWithImpl<$Res,
        $Val extends OutstandingBalanceDto>
    implements $OutstandingBalanceDtoCopyWith<$Res> {
  _$OutstandingBalanceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCode = null,
    Object? currency = null,
    Object? amount = null,
    Object? overdue = null,
    Object? checkDate = null,
  }) {
    return _then(_value.copyWith(
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      overdue: null == overdue
          ? _value.overdue
          : overdue // ignore: cast_nullable_to_non_nullable
              as String,
      checkDate: null == checkDate
          ? _value.checkDate
          : checkDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OutstandingBalanceDtoImplCopyWith<$Res>
    implements $OutstandingBalanceDtoCopyWith<$Res> {
  factory _$$OutstandingBalanceDtoImplCopyWith(
          _$OutstandingBalanceDtoImpl value,
          $Res Function(_$OutstandingBalanceDtoImpl) then) =
      __$$OutstandingBalanceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'customerCode', defaultValue: '') String customerCode,
      @JsonKey(name: 'currency', defaultValue: '') String currency,
      @JsonKey(name: 'amount', defaultValue: '') String amount,
      @JsonKey(name: 'overdue', defaultValue: '') String overdue,
      @JsonKey(name: 'checkDate', defaultValue: '') String checkDate});
}

/// @nodoc
class __$$OutstandingBalanceDtoImplCopyWithImpl<$Res>
    extends _$OutstandingBalanceDtoCopyWithImpl<$Res,
        _$OutstandingBalanceDtoImpl>
    implements _$$OutstandingBalanceDtoImplCopyWith<$Res> {
  __$$OutstandingBalanceDtoImplCopyWithImpl(_$OutstandingBalanceDtoImpl _value,
      $Res Function(_$OutstandingBalanceDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCode = null,
    Object? currency = null,
    Object? amount = null,
    Object? overdue = null,
    Object? checkDate = null,
  }) {
    return _then(_$OutstandingBalanceDtoImpl(
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      overdue: null == overdue
          ? _value.overdue
          : overdue // ignore: cast_nullable_to_non_nullable
              as String,
      checkDate: null == checkDate
          ? _value.checkDate
          : checkDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OutstandingBalanceDtoImpl extends _OutstandingBalanceDto {
  const _$OutstandingBalanceDtoImpl(
      {@JsonKey(name: 'customerCode', defaultValue: '')
      required this.customerCode,
      @JsonKey(name: 'currency', defaultValue: '') required this.currency,
      @JsonKey(name: 'amount', defaultValue: '') required this.amount,
      @JsonKey(name: 'overdue', defaultValue: '') required this.overdue,
      @JsonKey(name: 'checkDate', defaultValue: '') required this.checkDate})
      : super._();

  factory _$OutstandingBalanceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OutstandingBalanceDtoImplFromJson(json);

  @override
  @JsonKey(name: 'customerCode', defaultValue: '')
  final String customerCode;
  @override
  @JsonKey(name: 'currency', defaultValue: '')
  final String currency;
  @override
  @JsonKey(name: 'amount', defaultValue: '')
  final String amount;
  @override
  @JsonKey(name: 'overdue', defaultValue: '')
  final String overdue;
  @override
  @JsonKey(name: 'checkDate', defaultValue: '')
  final String checkDate;

  @override
  String toString() {
    return 'OutstandingBalanceDto(customerCode: $customerCode, currency: $currency, amount: $amount, overdue: $overdue, checkDate: $checkDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutstandingBalanceDtoImpl &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.overdue, overdue) || other.overdue == overdue) &&
            (identical(other.checkDate, checkDate) ||
                other.checkDate == checkDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, customerCode, currency, amount, overdue, checkDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OutstandingBalanceDtoImplCopyWith<_$OutstandingBalanceDtoImpl>
      get copyWith => __$$OutstandingBalanceDtoImplCopyWithImpl<
          _$OutstandingBalanceDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OutstandingBalanceDtoImplToJson(
      this,
    );
  }
}

abstract class _OutstandingBalanceDto extends OutstandingBalanceDto {
  const factory _OutstandingBalanceDto(
      {@JsonKey(name: 'customerCode', defaultValue: '')
      required final String customerCode,
      @JsonKey(name: 'currency', defaultValue: '')
      required final String currency,
      @JsonKey(name: 'amount', defaultValue: '') required final String amount,
      @JsonKey(name: 'overdue', defaultValue: '') required final String overdue,
      @JsonKey(name: 'checkDate', defaultValue: '')
      required final String checkDate}) = _$OutstandingBalanceDtoImpl;
  const _OutstandingBalanceDto._() : super._();

  factory _OutstandingBalanceDto.fromJson(Map<String, dynamic> json) =
      _$OutstandingBalanceDtoImpl.fromJson;

  @override
  @JsonKey(name: 'customerCode', defaultValue: '')
  String get customerCode;
  @override
  @JsonKey(name: 'currency', defaultValue: '')
  String get currency;
  @override
  @JsonKey(name: 'amount', defaultValue: '')
  String get amount;
  @override
  @JsonKey(name: 'overdue', defaultValue: '')
  String get overdue;
  @override
  @JsonKey(name: 'checkDate', defaultValue: '')
  String get checkDate;
  @override
  @JsonKey(ignore: true)
  _$$OutstandingBalanceDtoImplCopyWith<_$OutstandingBalanceDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

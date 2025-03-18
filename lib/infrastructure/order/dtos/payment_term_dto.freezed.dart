// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_term_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentTermDto _$PaymentTermDtoFromJson(Map<String, dynamic> json) {
  return _PaymentTermDto.fromJson(json);
}

/// @nodoc
mixin _$PaymentTermDto {
  @JsonKey(name: 'paymentTermCode', defaultValue: '')
  String get paymentTermCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentTermRanking', defaultValue: 0)
  int get paymentTermRanking => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentTermDescription', defaultValue: '')
  String get paymentTermDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'paymentTermSubranking', defaultValue: 0)
  int get paymentTermSubranking => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentTermDtoCopyWith<PaymentTermDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentTermDtoCopyWith<$Res> {
  factory $PaymentTermDtoCopyWith(
          PaymentTermDto value, $Res Function(PaymentTermDto) then) =
      _$PaymentTermDtoCopyWithImpl<$Res, PaymentTermDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'paymentTermCode', defaultValue: '')
      String paymentTermCode,
      @JsonKey(name: 'paymentTermRanking', defaultValue: 0)
      int paymentTermRanking,
      @JsonKey(name: 'paymentTermDescription', defaultValue: '')
      String paymentTermDescription,
      @JsonKey(name: 'paymentTermSubranking', defaultValue: 0)
      int paymentTermSubranking});
}

/// @nodoc
class _$PaymentTermDtoCopyWithImpl<$Res, $Val extends PaymentTermDto>
    implements $PaymentTermDtoCopyWith<$Res> {
  _$PaymentTermDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentTermCode = null,
    Object? paymentTermRanking = null,
    Object? paymentTermDescription = null,
    Object? paymentTermSubranking = null,
  }) {
    return _then(_value.copyWith(
      paymentTermCode: null == paymentTermCode
          ? _value.paymentTermCode
          : paymentTermCode // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTermRanking: null == paymentTermRanking
          ? _value.paymentTermRanking
          : paymentTermRanking // ignore: cast_nullable_to_non_nullable
              as int,
      paymentTermDescription: null == paymentTermDescription
          ? _value.paymentTermDescription
          : paymentTermDescription // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTermSubranking: null == paymentTermSubranking
          ? _value.paymentTermSubranking
          : paymentTermSubranking // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentTermDtoImplCopyWith<$Res>
    implements $PaymentTermDtoCopyWith<$Res> {
  factory _$$PaymentTermDtoImplCopyWith(_$PaymentTermDtoImpl value,
          $Res Function(_$PaymentTermDtoImpl) then) =
      __$$PaymentTermDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'paymentTermCode', defaultValue: '')
      String paymentTermCode,
      @JsonKey(name: 'paymentTermRanking', defaultValue: 0)
      int paymentTermRanking,
      @JsonKey(name: 'paymentTermDescription', defaultValue: '')
      String paymentTermDescription,
      @JsonKey(name: 'paymentTermSubranking', defaultValue: 0)
      int paymentTermSubranking});
}

/// @nodoc
class __$$PaymentTermDtoImplCopyWithImpl<$Res>
    extends _$PaymentTermDtoCopyWithImpl<$Res, _$PaymentTermDtoImpl>
    implements _$$PaymentTermDtoImplCopyWith<$Res> {
  __$$PaymentTermDtoImplCopyWithImpl(
      _$PaymentTermDtoImpl _value, $Res Function(_$PaymentTermDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentTermCode = null,
    Object? paymentTermRanking = null,
    Object? paymentTermDescription = null,
    Object? paymentTermSubranking = null,
  }) {
    return _then(_$PaymentTermDtoImpl(
      paymentTermCode: null == paymentTermCode
          ? _value.paymentTermCode
          : paymentTermCode // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTermRanking: null == paymentTermRanking
          ? _value.paymentTermRanking
          : paymentTermRanking // ignore: cast_nullable_to_non_nullable
              as int,
      paymentTermDescription: null == paymentTermDescription
          ? _value.paymentTermDescription
          : paymentTermDescription // ignore: cast_nullable_to_non_nullable
              as String,
      paymentTermSubranking: null == paymentTermSubranking
          ? _value.paymentTermSubranking
          : paymentTermSubranking // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentTermDtoImpl extends _PaymentTermDto {
  const _$PaymentTermDtoImpl(
      {@JsonKey(name: 'paymentTermCode', defaultValue: '')
      required this.paymentTermCode,
      @JsonKey(name: 'paymentTermRanking', defaultValue: 0)
      required this.paymentTermRanking,
      @JsonKey(name: 'paymentTermDescription', defaultValue: '')
      required this.paymentTermDescription,
      @JsonKey(name: 'paymentTermSubranking', defaultValue: 0)
      required this.paymentTermSubranking})
      : super._();

  factory _$PaymentTermDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentTermDtoImplFromJson(json);

  @override
  @JsonKey(name: 'paymentTermCode', defaultValue: '')
  final String paymentTermCode;
  @override
  @JsonKey(name: 'paymentTermRanking', defaultValue: 0)
  final int paymentTermRanking;
  @override
  @JsonKey(name: 'paymentTermDescription', defaultValue: '')
  final String paymentTermDescription;
  @override
  @JsonKey(name: 'paymentTermSubranking', defaultValue: 0)
  final int paymentTermSubranking;

  @override
  String toString() {
    return 'PaymentTermDto(paymentTermCode: $paymentTermCode, paymentTermRanking: $paymentTermRanking, paymentTermDescription: $paymentTermDescription, paymentTermSubranking: $paymentTermSubranking)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentTermDtoImpl &&
            (identical(other.paymentTermCode, paymentTermCode) ||
                other.paymentTermCode == paymentTermCode) &&
            (identical(other.paymentTermRanking, paymentTermRanking) ||
                other.paymentTermRanking == paymentTermRanking) &&
            (identical(other.paymentTermDescription, paymentTermDescription) ||
                other.paymentTermDescription == paymentTermDescription) &&
            (identical(other.paymentTermSubranking, paymentTermSubranking) ||
                other.paymentTermSubranking == paymentTermSubranking));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, paymentTermCode,
      paymentTermRanking, paymentTermDescription, paymentTermSubranking);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentTermDtoImplCopyWith<_$PaymentTermDtoImpl> get copyWith =>
      __$$PaymentTermDtoImplCopyWithImpl<_$PaymentTermDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentTermDtoImplToJson(
      this,
    );
  }
}

abstract class _PaymentTermDto extends PaymentTermDto {
  const factory _PaymentTermDto(
      {@JsonKey(name: 'paymentTermCode', defaultValue: '')
      required final String paymentTermCode,
      @JsonKey(name: 'paymentTermRanking', defaultValue: 0)
      required final int paymentTermRanking,
      @JsonKey(name: 'paymentTermDescription', defaultValue: '')
      required final String paymentTermDescription,
      @JsonKey(name: 'paymentTermSubranking', defaultValue: 0)
      required final int paymentTermSubranking}) = _$PaymentTermDtoImpl;
  const _PaymentTermDto._() : super._();

  factory _PaymentTermDto.fromJson(Map<String, dynamic> json) =
      _$PaymentTermDtoImpl.fromJson;

  @override
  @JsonKey(name: 'paymentTermCode', defaultValue: '')
  String get paymentTermCode;
  @override
  @JsonKey(name: 'paymentTermRanking', defaultValue: 0)
  int get paymentTermRanking;
  @override
  @JsonKey(name: 'paymentTermDescription', defaultValue: '')
  String get paymentTermDescription;
  @override
  @JsonKey(name: 'paymentTermSubranking', defaultValue: 0)
  int get paymentTermSubranking;
  @override
  @JsonKey(ignore: true)
  _$$PaymentTermDtoImplCopyWith<_$PaymentTermDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

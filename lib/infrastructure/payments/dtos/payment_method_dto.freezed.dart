// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_method_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentMethodDto _$PaymentMethodDtoFromJson(Map<String, dynamic> json) {
  return _PaymentMethodDto.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethodDto {
  @JsonKey(name: 'paymentMethods', defaultValue: '')
  String get paymentMethods => throw _privateConstructorUsedError;
  @JsonKey(name: 'options', defaultValue: [])
  List<PaymentMethodOptionDto> get options =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentMethodDtoCopyWith<PaymentMethodDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodDtoCopyWith<$Res> {
  factory $PaymentMethodDtoCopyWith(
          PaymentMethodDto value, $Res Function(PaymentMethodDto) then) =
      _$PaymentMethodDtoCopyWithImpl<$Res, PaymentMethodDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'paymentMethods', defaultValue: '') String paymentMethods,
      @JsonKey(name: 'options', defaultValue: [])
      List<PaymentMethodOptionDto> options});
}

/// @nodoc
class _$PaymentMethodDtoCopyWithImpl<$Res, $Val extends PaymentMethodDto>
    implements $PaymentMethodDtoCopyWith<$Res> {
  _$PaymentMethodDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethods = null,
    Object? options = null,
  }) {
    return _then(_value.copyWith(
      paymentMethods: null == paymentMethods
          ? _value.paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethodOptionDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentMethodDtoImplCopyWith<$Res>
    implements $PaymentMethodDtoCopyWith<$Res> {
  factory _$$PaymentMethodDtoImplCopyWith(_$PaymentMethodDtoImpl value,
          $Res Function(_$PaymentMethodDtoImpl) then) =
      __$$PaymentMethodDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'paymentMethods', defaultValue: '') String paymentMethods,
      @JsonKey(name: 'options', defaultValue: [])
      List<PaymentMethodOptionDto> options});
}

/// @nodoc
class __$$PaymentMethodDtoImplCopyWithImpl<$Res>
    extends _$PaymentMethodDtoCopyWithImpl<$Res, _$PaymentMethodDtoImpl>
    implements _$$PaymentMethodDtoImplCopyWith<$Res> {
  __$$PaymentMethodDtoImplCopyWithImpl(_$PaymentMethodDtoImpl _value,
      $Res Function(_$PaymentMethodDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethods = null,
    Object? options = null,
  }) {
    return _then(_$PaymentMethodDtoImpl(
      paymentMethods: null == paymentMethods
          ? _value.paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<PaymentMethodOptionDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMethodDtoImpl extends _PaymentMethodDto {
  const _$PaymentMethodDtoImpl(
      {@JsonKey(name: 'paymentMethods', defaultValue: '')
      required this.paymentMethods,
      @JsonKey(name: 'options', defaultValue: [])
      required final List<PaymentMethodOptionDto> options})
      : _options = options,
        super._();

  factory _$PaymentMethodDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodDtoImplFromJson(json);

  @override
  @JsonKey(name: 'paymentMethods', defaultValue: '')
  final String paymentMethods;
  final List<PaymentMethodOptionDto> _options;
  @override
  @JsonKey(name: 'options', defaultValue: [])
  List<PaymentMethodOptionDto> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  String toString() {
    return 'PaymentMethodDto(paymentMethods: $paymentMethods, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodDtoImpl &&
            (identical(other.paymentMethods, paymentMethods) ||
                other.paymentMethods == paymentMethods) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, paymentMethods,
      const DeepCollectionEquality().hash(_options));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodDtoImplCopyWith<_$PaymentMethodDtoImpl> get copyWith =>
      __$$PaymentMethodDtoImplCopyWithImpl<_$PaymentMethodDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodDtoImplToJson(
      this,
    );
  }
}

abstract class _PaymentMethodDto extends PaymentMethodDto {
  const factory _PaymentMethodDto(
          {@JsonKey(name: 'paymentMethods', defaultValue: '')
          required final String paymentMethods,
          @JsonKey(name: 'options', defaultValue: [])
          required final List<PaymentMethodOptionDto> options}) =
      _$PaymentMethodDtoImpl;
  const _PaymentMethodDto._() : super._();

  factory _PaymentMethodDto.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodDtoImpl.fromJson;

  @override
  @JsonKey(name: 'paymentMethods', defaultValue: '')
  String get paymentMethods;
  @override
  @JsonKey(name: 'options', defaultValue: [])
  List<PaymentMethodOptionDto> get options;
  @override
  @JsonKey(ignore: true)
  _$$PaymentMethodDtoImplCopyWith<_$PaymentMethodDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_method_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentMethodOption {
  BankOptionId get bankOptionId => throw _privateConstructorUsedError;
  StringValue get prodiver => throw _privateConstructorUsedError;
  StringValue get displayName => throw _privateConstructorUsedError;
  StringValue get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentMethodOptionCopyWith<PaymentMethodOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodOptionCopyWith<$Res> {
  factory $PaymentMethodOptionCopyWith(
          PaymentMethodOption value, $Res Function(PaymentMethodOption) then) =
      _$PaymentMethodOptionCopyWithImpl<$Res, PaymentMethodOption>;
  @useResult
  $Res call(
      {BankOptionId bankOptionId,
      StringValue prodiver,
      StringValue displayName,
      StringValue type});
}

/// @nodoc
class _$PaymentMethodOptionCopyWithImpl<$Res, $Val extends PaymentMethodOption>
    implements $PaymentMethodOptionCopyWith<$Res> {
  _$PaymentMethodOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankOptionId = null,
    Object? prodiver = null,
    Object? displayName = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      bankOptionId: null == bankOptionId
          ? _value.bankOptionId
          : bankOptionId // ignore: cast_nullable_to_non_nullable
              as BankOptionId,
      prodiver: null == prodiver
          ? _value.prodiver
          : prodiver // ignore: cast_nullable_to_non_nullable
              as StringValue,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as StringValue,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentMethodOptionImplCopyWith<$Res>
    implements $PaymentMethodOptionCopyWith<$Res> {
  factory _$$PaymentMethodOptionImplCopyWith(_$PaymentMethodOptionImpl value,
          $Res Function(_$PaymentMethodOptionImpl) then) =
      __$$PaymentMethodOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BankOptionId bankOptionId,
      StringValue prodiver,
      StringValue displayName,
      StringValue type});
}

/// @nodoc
class __$$PaymentMethodOptionImplCopyWithImpl<$Res>
    extends _$PaymentMethodOptionCopyWithImpl<$Res, _$PaymentMethodOptionImpl>
    implements _$$PaymentMethodOptionImplCopyWith<$Res> {
  __$$PaymentMethodOptionImplCopyWithImpl(_$PaymentMethodOptionImpl _value,
      $Res Function(_$PaymentMethodOptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankOptionId = null,
    Object? prodiver = null,
    Object? displayName = null,
    Object? type = null,
  }) {
    return _then(_$PaymentMethodOptionImpl(
      bankOptionId: null == bankOptionId
          ? _value.bankOptionId
          : bankOptionId // ignore: cast_nullable_to_non_nullable
              as BankOptionId,
      prodiver: null == prodiver
          ? _value.prodiver
          : prodiver // ignore: cast_nullable_to_non_nullable
              as StringValue,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as StringValue,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ));
  }
}

/// @nodoc

class _$PaymentMethodOptionImpl extends _PaymentMethodOption {
  const _$PaymentMethodOptionImpl(
      {required this.bankOptionId,
      required this.prodiver,
      required this.displayName,
      required this.type})
      : super._();

  @override
  final BankOptionId bankOptionId;
  @override
  final StringValue prodiver;
  @override
  final StringValue displayName;
  @override
  final StringValue type;

  @override
  String toString() {
    return 'PaymentMethodOption(bankOptionId: $bankOptionId, prodiver: $prodiver, displayName: $displayName, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodOptionImpl &&
            (identical(other.bankOptionId, bankOptionId) ||
                other.bankOptionId == bankOptionId) &&
            (identical(other.prodiver, prodiver) ||
                other.prodiver == prodiver) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, bankOptionId, prodiver, displayName, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodOptionImplCopyWith<_$PaymentMethodOptionImpl> get copyWith =>
      __$$PaymentMethodOptionImplCopyWithImpl<_$PaymentMethodOptionImpl>(
          this, _$identity);
}

abstract class _PaymentMethodOption extends PaymentMethodOption {
  const factory _PaymentMethodOption(
      {required final BankOptionId bankOptionId,
      required final StringValue prodiver,
      required final StringValue displayName,
      required final StringValue type}) = _$PaymentMethodOptionImpl;
  const _PaymentMethodOption._() : super._();

  @override
  BankOptionId get bankOptionId;
  @override
  StringValue get prodiver;
  @override
  StringValue get displayName;
  @override
  StringValue get type;
  @override
  @JsonKey(ignore: true)
  _$$PaymentMethodOptionImplCopyWith<_$PaymentMethodOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

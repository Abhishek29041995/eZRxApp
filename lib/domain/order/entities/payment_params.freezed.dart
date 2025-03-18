// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentParams {
  PaymentTab get tab => throw _privateConstructorUsedError;
  PaymentSubTab get subTab => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentParamsCopyWith<PaymentParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentParamsCopyWith<$Res> {
  factory $PaymentParamsCopyWith(
          PaymentParams value, $Res Function(PaymentParams) then) =
      _$PaymentParamsCopyWithImpl<$Res, PaymentParams>;
  @useResult
  $Res call({PaymentTab tab, PaymentSubTab subTab});
}

/// @nodoc
class _$PaymentParamsCopyWithImpl<$Res, $Val extends PaymentParams>
    implements $PaymentParamsCopyWith<$Res> {
  _$PaymentParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tab = null,
    Object? subTab = null,
  }) {
    return _then(_value.copyWith(
      tab: null == tab
          ? _value.tab
          : tab // ignore: cast_nullable_to_non_nullable
              as PaymentTab,
      subTab: null == subTab
          ? _value.subTab
          : subTab // ignore: cast_nullable_to_non_nullable
              as PaymentSubTab,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentParamsImplCopyWith<$Res>
    implements $PaymentParamsCopyWith<$Res> {
  factory _$$PaymentParamsImplCopyWith(
          _$PaymentParamsImpl value, $Res Function(_$PaymentParamsImpl) then) =
      __$$PaymentParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PaymentTab tab, PaymentSubTab subTab});
}

/// @nodoc
class __$$PaymentParamsImplCopyWithImpl<$Res>
    extends _$PaymentParamsCopyWithImpl<$Res, _$PaymentParamsImpl>
    implements _$$PaymentParamsImplCopyWith<$Res> {
  __$$PaymentParamsImplCopyWithImpl(
      _$PaymentParamsImpl _value, $Res Function(_$PaymentParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tab = null,
    Object? subTab = null,
  }) {
    return _then(_$PaymentParamsImpl(
      tab: null == tab
          ? _value.tab
          : tab // ignore: cast_nullable_to_non_nullable
              as PaymentTab,
      subTab: null == subTab
          ? _value.subTab
          : subTab // ignore: cast_nullable_to_non_nullable
              as PaymentSubTab,
    ));
  }
}

/// @nodoc

class _$PaymentParamsImpl extends _PaymentParams {
  _$PaymentParamsImpl({required this.tab, required this.subTab}) : super._();

  @override
  final PaymentTab tab;
  @override
  final PaymentSubTab subTab;

  @override
  String toString() {
    return 'PaymentParams(tab: $tab, subTab: $subTab)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentParamsImpl &&
            (identical(other.tab, tab) || other.tab == tab) &&
            (identical(other.subTab, subTab) || other.subTab == subTab));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tab, subTab);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentParamsImplCopyWith<_$PaymentParamsImpl> get copyWith =>
      __$$PaymentParamsImplCopyWithImpl<_$PaymentParamsImpl>(this, _$identity);
}

abstract class _PaymentParams extends PaymentParams {
  factory _PaymentParams(
      {required final PaymentTab tab,
      required final PaymentSubTab subTab}) = _$PaymentParamsImpl;
  _PaymentParams._() : super._();

  @override
  PaymentTab get tab;
  @override
  PaymentSubTab get subTab;
  @override
  @JsonKey(ignore: true)
  _$$PaymentParamsImplCopyWith<_$PaymentParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

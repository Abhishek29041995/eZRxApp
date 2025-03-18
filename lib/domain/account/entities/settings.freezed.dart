// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Settings {
  bool get emailNotifications => throw _privateConstructorUsedError;
  bool get mobileNotifications => throw _privateConstructorUsedError;
  PaymentNotification get paymentNotification =>
      throw _privateConstructorUsedError;
  Language get languagePreference => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsCopyWith<Settings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsCopyWith<$Res> {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) then) =
      _$SettingsCopyWithImpl<$Res, Settings>;
  @useResult
  $Res call(
      {bool emailNotifications,
      bool mobileNotifications,
      PaymentNotification paymentNotification,
      Language languagePreference});

  $PaymentNotificationCopyWith<$Res> get paymentNotification;
}

/// @nodoc
class _$SettingsCopyWithImpl<$Res, $Val extends Settings>
    implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailNotifications = null,
    Object? mobileNotifications = null,
    Object? paymentNotification = null,
    Object? languagePreference = null,
  }) {
    return _then(_value.copyWith(
      emailNotifications: null == emailNotifications
          ? _value.emailNotifications
          : emailNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      mobileNotifications: null == mobileNotifications
          ? _value.mobileNotifications
          : mobileNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentNotification: null == paymentNotification
          ? _value.paymentNotification
          : paymentNotification // ignore: cast_nullable_to_non_nullable
              as PaymentNotification,
      languagePreference: null == languagePreference
          ? _value.languagePreference
          : languagePreference // ignore: cast_nullable_to_non_nullable
              as Language,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentNotificationCopyWith<$Res> get paymentNotification {
    return $PaymentNotificationCopyWith<$Res>(_value.paymentNotification,
        (value) {
      return _then(_value.copyWith(paymentNotification: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SettingsImplCopyWith<$Res>
    implements $SettingsCopyWith<$Res> {
  factory _$$SettingsImplCopyWith(
          _$SettingsImpl value, $Res Function(_$SettingsImpl) then) =
      __$$SettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool emailNotifications,
      bool mobileNotifications,
      PaymentNotification paymentNotification,
      Language languagePreference});

  @override
  $PaymentNotificationCopyWith<$Res> get paymentNotification;
}

/// @nodoc
class __$$SettingsImplCopyWithImpl<$Res>
    extends _$SettingsCopyWithImpl<$Res, _$SettingsImpl>
    implements _$$SettingsImplCopyWith<$Res> {
  __$$SettingsImplCopyWithImpl(
      _$SettingsImpl _value, $Res Function(_$SettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailNotifications = null,
    Object? mobileNotifications = null,
    Object? paymentNotification = null,
    Object? languagePreference = null,
  }) {
    return _then(_$SettingsImpl(
      emailNotifications: null == emailNotifications
          ? _value.emailNotifications
          : emailNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      mobileNotifications: null == mobileNotifications
          ? _value.mobileNotifications
          : mobileNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentNotification: null == paymentNotification
          ? _value.paymentNotification
          : paymentNotification // ignore: cast_nullable_to_non_nullable
              as PaymentNotification,
      languagePreference: null == languagePreference
          ? _value.languagePreference
          : languagePreference // ignore: cast_nullable_to_non_nullable
              as Language,
    ));
  }
}

/// @nodoc

class _$SettingsImpl extends _Settings {
  const _$SettingsImpl(
      {required this.emailNotifications,
      required this.mobileNotifications,
      required this.paymentNotification,
      required this.languagePreference})
      : super._();

  @override
  final bool emailNotifications;
  @override
  final bool mobileNotifications;
  @override
  final PaymentNotification paymentNotification;
  @override
  final Language languagePreference;

  @override
  String toString() {
    return 'Settings(emailNotifications: $emailNotifications, mobileNotifications: $mobileNotifications, paymentNotification: $paymentNotification, languagePreference: $languagePreference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsImpl &&
            (identical(other.emailNotifications, emailNotifications) ||
                other.emailNotifications == emailNotifications) &&
            (identical(other.mobileNotifications, mobileNotifications) ||
                other.mobileNotifications == mobileNotifications) &&
            (identical(other.paymentNotification, paymentNotification) ||
                other.paymentNotification == paymentNotification) &&
            (identical(other.languagePreference, languagePreference) ||
                other.languagePreference == languagePreference));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailNotifications,
      mobileNotifications, paymentNotification, languagePreference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsImplCopyWith<_$SettingsImpl> get copyWith =>
      __$$SettingsImplCopyWithImpl<_$SettingsImpl>(this, _$identity);
}

abstract class _Settings extends Settings {
  const factory _Settings(
      {required final bool emailNotifications,
      required final bool mobileNotifications,
      required final PaymentNotification paymentNotification,
      required final Language languagePreference}) = _$SettingsImpl;
  const _Settings._() : super._();

  @override
  bool get emailNotifications;
  @override
  bool get mobileNotifications;
  @override
  PaymentNotification get paymentNotification;
  @override
  Language get languagePreference;
  @override
  @JsonKey(ignore: true)
  _$$SettingsImplCopyWith<_$SettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

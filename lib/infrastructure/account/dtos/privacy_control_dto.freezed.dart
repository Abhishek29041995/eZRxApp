// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'privacy_control_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrivacyControlDto _$PrivacyControlDtoFromJson(Map<String, dynamic> json) {
  return _PrivacyControlDto.fromJson(json);
}

/// @nodoc
mixin _$PrivacyControlDto {
  @JsonKey(defaultValue: false)
  bool get automatedPersonalisation => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get directMarketing => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get viaEmails => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get viaPushNotification => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false)
  bool get viaSMS => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrivacyControlDtoCopyWith<PrivacyControlDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivacyControlDtoCopyWith<$Res> {
  factory $PrivacyControlDtoCopyWith(
          PrivacyControlDto value, $Res Function(PrivacyControlDto) then) =
      _$PrivacyControlDtoCopyWithImpl<$Res, PrivacyControlDto>;
  @useResult
  $Res call(
      {@JsonKey(defaultValue: false) bool automatedPersonalisation,
      @JsonKey(defaultValue: false) bool directMarketing,
      @JsonKey(defaultValue: false) bool viaEmails,
      @JsonKey(defaultValue: false) bool viaPushNotification,
      @JsonKey(defaultValue: false) bool viaSMS});
}

/// @nodoc
class _$PrivacyControlDtoCopyWithImpl<$Res, $Val extends PrivacyControlDto>
    implements $PrivacyControlDtoCopyWith<$Res> {
  _$PrivacyControlDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? automatedPersonalisation = null,
    Object? directMarketing = null,
    Object? viaEmails = null,
    Object? viaPushNotification = null,
    Object? viaSMS = null,
  }) {
    return _then(_value.copyWith(
      automatedPersonalisation: null == automatedPersonalisation
          ? _value.automatedPersonalisation
          : automatedPersonalisation // ignore: cast_nullable_to_non_nullable
              as bool,
      directMarketing: null == directMarketing
          ? _value.directMarketing
          : directMarketing // ignore: cast_nullable_to_non_nullable
              as bool,
      viaEmails: null == viaEmails
          ? _value.viaEmails
          : viaEmails // ignore: cast_nullable_to_non_nullable
              as bool,
      viaPushNotification: null == viaPushNotification
          ? _value.viaPushNotification
          : viaPushNotification // ignore: cast_nullable_to_non_nullable
              as bool,
      viaSMS: null == viaSMS
          ? _value.viaSMS
          : viaSMS // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrivacyControlDtoImplCopyWith<$Res>
    implements $PrivacyControlDtoCopyWith<$Res> {
  factory _$$PrivacyControlDtoImplCopyWith(_$PrivacyControlDtoImpl value,
          $Res Function(_$PrivacyControlDtoImpl) then) =
      __$$PrivacyControlDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(defaultValue: false) bool automatedPersonalisation,
      @JsonKey(defaultValue: false) bool directMarketing,
      @JsonKey(defaultValue: false) bool viaEmails,
      @JsonKey(defaultValue: false) bool viaPushNotification,
      @JsonKey(defaultValue: false) bool viaSMS});
}

/// @nodoc
class __$$PrivacyControlDtoImplCopyWithImpl<$Res>
    extends _$PrivacyControlDtoCopyWithImpl<$Res, _$PrivacyControlDtoImpl>
    implements _$$PrivacyControlDtoImplCopyWith<$Res> {
  __$$PrivacyControlDtoImplCopyWithImpl(_$PrivacyControlDtoImpl _value,
      $Res Function(_$PrivacyControlDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? automatedPersonalisation = null,
    Object? directMarketing = null,
    Object? viaEmails = null,
    Object? viaPushNotification = null,
    Object? viaSMS = null,
  }) {
    return _then(_$PrivacyControlDtoImpl(
      automatedPersonalisation: null == automatedPersonalisation
          ? _value.automatedPersonalisation
          : automatedPersonalisation // ignore: cast_nullable_to_non_nullable
              as bool,
      directMarketing: null == directMarketing
          ? _value.directMarketing
          : directMarketing // ignore: cast_nullable_to_non_nullable
              as bool,
      viaEmails: null == viaEmails
          ? _value.viaEmails
          : viaEmails // ignore: cast_nullable_to_non_nullable
              as bool,
      viaPushNotification: null == viaPushNotification
          ? _value.viaPushNotification
          : viaPushNotification // ignore: cast_nullable_to_non_nullable
              as bool,
      viaSMS: null == viaSMS
          ? _value.viaSMS
          : viaSMS // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrivacyControlDtoImpl extends _PrivacyControlDto {
  const _$PrivacyControlDtoImpl(
      {@JsonKey(defaultValue: false) required this.automatedPersonalisation,
      @JsonKey(defaultValue: false) required this.directMarketing,
      @JsonKey(defaultValue: false) required this.viaEmails,
      @JsonKey(defaultValue: false) required this.viaPushNotification,
      @JsonKey(defaultValue: false) required this.viaSMS})
      : super._();

  factory _$PrivacyControlDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrivacyControlDtoImplFromJson(json);

  @override
  @JsonKey(defaultValue: false)
  final bool automatedPersonalisation;
  @override
  @JsonKey(defaultValue: false)
  final bool directMarketing;
  @override
  @JsonKey(defaultValue: false)
  final bool viaEmails;
  @override
  @JsonKey(defaultValue: false)
  final bool viaPushNotification;
  @override
  @JsonKey(defaultValue: false)
  final bool viaSMS;

  @override
  String toString() {
    return 'PrivacyControlDto(automatedPersonalisation: $automatedPersonalisation, directMarketing: $directMarketing, viaEmails: $viaEmails, viaPushNotification: $viaPushNotification, viaSMS: $viaSMS)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivacyControlDtoImpl &&
            (identical(
                    other.automatedPersonalisation, automatedPersonalisation) ||
                other.automatedPersonalisation == automatedPersonalisation) &&
            (identical(other.directMarketing, directMarketing) ||
                other.directMarketing == directMarketing) &&
            (identical(other.viaEmails, viaEmails) ||
                other.viaEmails == viaEmails) &&
            (identical(other.viaPushNotification, viaPushNotification) ||
                other.viaPushNotification == viaPushNotification) &&
            (identical(other.viaSMS, viaSMS) || other.viaSMS == viaSMS));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, automatedPersonalisation,
      directMarketing, viaEmails, viaPushNotification, viaSMS);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivacyControlDtoImplCopyWith<_$PrivacyControlDtoImpl> get copyWith =>
      __$$PrivacyControlDtoImplCopyWithImpl<_$PrivacyControlDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivacyControlDtoImplToJson(
      this,
    );
  }
}

abstract class _PrivacyControlDto extends PrivacyControlDto {
  const factory _PrivacyControlDto(
          {@JsonKey(defaultValue: false)
          required final bool automatedPersonalisation,
          @JsonKey(defaultValue: false) required final bool directMarketing,
          @JsonKey(defaultValue: false) required final bool viaEmails,
          @JsonKey(defaultValue: false) required final bool viaPushNotification,
          @JsonKey(defaultValue: false) required final bool viaSMS}) =
      _$PrivacyControlDtoImpl;
  const _PrivacyControlDto._() : super._();

  factory _PrivacyControlDto.fromJson(Map<String, dynamic> json) =
      _$PrivacyControlDtoImpl.fromJson;

  @override
  @JsonKey(defaultValue: false)
  bool get automatedPersonalisation;
  @override
  @JsonKey(defaultValue: false)
  bool get directMarketing;
  @override
  @JsonKey(defaultValue: false)
  bool get viaEmails;
  @override
  @JsonKey(defaultValue: false)
  bool get viaPushNotification;
  @override
  @JsonKey(defaultValue: false)
  bool get viaSMS;
  @override
  @JsonKey(ignore: true)
  _$$PrivacyControlDtoImplCopyWith<_$PrivacyControlDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

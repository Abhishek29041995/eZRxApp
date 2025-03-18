// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserDto _$UserDtoFromJson(Map<String, dynamic> json) {
  return _UserDto.fromJson(json);
}

/// @nodoc
mixin _$UserDto {
  @JsonKey(name: 'id', defaultValue: '')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'username', defaultValue: '')
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'email', defaultValue: '')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'firstName', defaultValue: '')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastName', defaultValue: '')
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'role')
  RoleDto get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'customerCode', defaultValue: '')
  String get customerCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'userSalesOrganisationList', defaultValue: [])
  List<SalesOrganisationDto> get userSalesOrganisations =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'salesOrganisations', defaultValue: [])
  List<String> get salesOrganisations => throw _privateConstructorUsedError;
  @JsonKey(name: 'accessRight')
  AccessRightDto get accessRight => throw _privateConstructorUsedError;
  @JsonKey(name: 'emailNotifications', defaultValue: false)
  bool get emailNotifications => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobileNotifications', defaultValue: false)
  bool get mobileNotifications => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'languagePreference',
      readValue: JsonReadValueHelper.handleEmptyLanguagePreference)
  String get languagePreference => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableOrderType', defaultValue: false)
  bool get enableOrderType => throw _privateConstructorUsedError;
  @JsonKey(name: 'acceptTC', defaultValue: true)
  bool get acceptPrivacyPolicy => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasBonusOverride', defaultValue: false)
  bool get hasBonusOverride => throw _privateConstructorUsedError;
  @JsonKey(name: 'disableCreateOrder', defaultValue: false)
  bool get disableCreateOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'disableReturns', defaultValue: false)
  bool get disableReturns => throw _privateConstructorUsedError;
  @JsonKey(name: 'disablePaymentAccess', defaultValue: false)
  bool get disablePaymentAccess => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasPriceOverride', defaultValue: false)
  bool get hasPriceOverride => throw _privateConstructorUsedError;
  @JsonKey(name: 'disablePaymentNotification', defaultValue: false)
  bool get disablePaymentNotification => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'paymentNotification',
      defaultValue: <PaymentAdviceExpiryNotificationDto>[])
  List<PaymentAdviceExpiryNotificationDto> get paymentNotification =>
      throw _privateConstructorUsedError;
  @JsonKey(
      name: 'preferredLanguage',
      readValue: JsonReadValueHelper.handleEmptyLanguagePreference)
  String get preferredLanguage => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'supportedLanguages',
      readValue: JsonReadValueHelper.handleSupportedLanguages,
      defaultValue: <String>[])
  List<String> get supportedLanguages => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobileNumber', defaultValue: '')
  String get mobileNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'countryCode', defaultValue: '')
  String get countryCode => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'acceptMPTC',
      readValue: JsonReadValueHelper.handleMarketPlaceTnCAcceptance)
  String get acceptMPTC => throw _privateConstructorUsedError;
  @JsonKey(name: 'isResetUserPassword', defaultValue: false)
  bool get isResetUserPassword => throw _privateConstructorUsedError;
  @JsonKey(name: 'isPPATriggerMaintained', defaultValue: false)
  bool get isPPATriggerMaintained => throw _privateConstructorUsedError;
  @JsonKey(name: 'privacyControls')
  PrivacyControlDto get privacyControl => throw _privateConstructorUsedError;
  @JsonKey(name: 'selectedOrderType', defaultValue: '')
  String get selectedOrderType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDtoCopyWith<UserDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) then) =
      _$UserDtoCopyWithImpl<$Res, UserDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(name: 'username', defaultValue: '') String username,
      @JsonKey(name: 'email', defaultValue: '') String email,
      @JsonKey(name: 'firstName', defaultValue: '') String firstName,
      @JsonKey(name: 'lastName', defaultValue: '') String lastName,
      @JsonKey(name: 'role') RoleDto role,
      @JsonKey(name: 'customerCode', defaultValue: '') String customerCode,
      @JsonKey(name: 'userSalesOrganisationList', defaultValue: [])
      List<SalesOrganisationDto> userSalesOrganisations,
      @JsonKey(name: 'salesOrganisations', defaultValue: [])
      List<String> salesOrganisations,
      @JsonKey(name: 'accessRight') AccessRightDto accessRight,
      @JsonKey(name: 'emailNotifications', defaultValue: false)
      bool emailNotifications,
      @JsonKey(name: 'mobileNotifications', defaultValue: false)
      bool mobileNotifications,
      @JsonKey(
          name: 'languagePreference',
          readValue: JsonReadValueHelper.handleEmptyLanguagePreference)
      String languagePreference,
      @JsonKey(name: 'enableOrderType', defaultValue: false)
      bool enableOrderType,
      @JsonKey(name: 'acceptTC', defaultValue: true) bool acceptPrivacyPolicy,
      @JsonKey(name: 'hasBonusOverride', defaultValue: false)
      bool hasBonusOverride,
      @JsonKey(name: 'disableCreateOrder', defaultValue: false)
      bool disableCreateOrder,
      @JsonKey(name: 'disableReturns', defaultValue: false) bool disableReturns,
      @JsonKey(name: 'disablePaymentAccess', defaultValue: false)
      bool disablePaymentAccess,
      @JsonKey(name: 'hasPriceOverride', defaultValue: false)
      bool hasPriceOverride,
      @JsonKey(name: 'disablePaymentNotification', defaultValue: false)
      bool disablePaymentNotification,
      @JsonKey(
          name: 'paymentNotification',
          defaultValue: <PaymentAdviceExpiryNotificationDto>[])
      List<PaymentAdviceExpiryNotificationDto> paymentNotification,
      @JsonKey(
          name: 'preferredLanguage',
          readValue: JsonReadValueHelper.handleEmptyLanguagePreference)
      String preferredLanguage,
      @JsonKey(
          name: 'supportedLanguages',
          readValue: JsonReadValueHelper.handleSupportedLanguages,
          defaultValue: <String>[])
      List<String> supportedLanguages,
      @JsonKey(name: 'mobileNumber', defaultValue: '') String mobileNumber,
      @JsonKey(name: 'countryCode', defaultValue: '') String countryCode,
      @JsonKey(
          name: 'acceptMPTC',
          readValue: JsonReadValueHelper.handleMarketPlaceTnCAcceptance)
      String acceptMPTC,
      @JsonKey(name: 'isResetUserPassword', defaultValue: false)
      bool isResetUserPassword,
      @JsonKey(name: 'isPPATriggerMaintained', defaultValue: false)
      bool isPPATriggerMaintained,
      @JsonKey(name: 'privacyControls') PrivacyControlDto privacyControl,
      @JsonKey(name: 'selectedOrderType', defaultValue: '')
      String selectedOrderType});

  $RoleDtoCopyWith<$Res> get role;
  $AccessRightDtoCopyWith<$Res> get accessRight;
  $PrivacyControlDtoCopyWith<$Res> get privacyControl;
}

/// @nodoc
class _$UserDtoCopyWithImpl<$Res, $Val extends UserDto>
    implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? role = null,
    Object? customerCode = null,
    Object? userSalesOrganisations = null,
    Object? salesOrganisations = null,
    Object? accessRight = null,
    Object? emailNotifications = null,
    Object? mobileNotifications = null,
    Object? languagePreference = null,
    Object? enableOrderType = null,
    Object? acceptPrivacyPolicy = null,
    Object? hasBonusOverride = null,
    Object? disableCreateOrder = null,
    Object? disableReturns = null,
    Object? disablePaymentAccess = null,
    Object? hasPriceOverride = null,
    Object? disablePaymentNotification = null,
    Object? paymentNotification = null,
    Object? preferredLanguage = null,
    Object? supportedLanguages = null,
    Object? mobileNumber = null,
    Object? countryCode = null,
    Object? acceptMPTC = null,
    Object? isResetUserPassword = null,
    Object? isPPATriggerMaintained = null,
    Object? privacyControl = null,
    Object? selectedOrderType = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as RoleDto,
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      userSalesOrganisations: null == userSalesOrganisations
          ? _value.userSalesOrganisations
          : userSalesOrganisations // ignore: cast_nullable_to_non_nullable
              as List<SalesOrganisationDto>,
      salesOrganisations: null == salesOrganisations
          ? _value.salesOrganisations
          : salesOrganisations // ignore: cast_nullable_to_non_nullable
              as List<String>,
      accessRight: null == accessRight
          ? _value.accessRight
          : accessRight // ignore: cast_nullable_to_non_nullable
              as AccessRightDto,
      emailNotifications: null == emailNotifications
          ? _value.emailNotifications
          : emailNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      mobileNotifications: null == mobileNotifications
          ? _value.mobileNotifications
          : mobileNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      languagePreference: null == languagePreference
          ? _value.languagePreference
          : languagePreference // ignore: cast_nullable_to_non_nullable
              as String,
      enableOrderType: null == enableOrderType
          ? _value.enableOrderType
          : enableOrderType // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptPrivacyPolicy: null == acceptPrivacyPolicy
          ? _value.acceptPrivacyPolicy
          : acceptPrivacyPolicy // ignore: cast_nullable_to_non_nullable
              as bool,
      hasBonusOverride: null == hasBonusOverride
          ? _value.hasBonusOverride
          : hasBonusOverride // ignore: cast_nullable_to_non_nullable
              as bool,
      disableCreateOrder: null == disableCreateOrder
          ? _value.disableCreateOrder
          : disableCreateOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      disableReturns: null == disableReturns
          ? _value.disableReturns
          : disableReturns // ignore: cast_nullable_to_non_nullable
              as bool,
      disablePaymentAccess: null == disablePaymentAccess
          ? _value.disablePaymentAccess
          : disablePaymentAccess // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPriceOverride: null == hasPriceOverride
          ? _value.hasPriceOverride
          : hasPriceOverride // ignore: cast_nullable_to_non_nullable
              as bool,
      disablePaymentNotification: null == disablePaymentNotification
          ? _value.disablePaymentNotification
          : disablePaymentNotification // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentNotification: null == paymentNotification
          ? _value.paymentNotification
          : paymentNotification // ignore: cast_nullable_to_non_nullable
              as List<PaymentAdviceExpiryNotificationDto>,
      preferredLanguage: null == preferredLanguage
          ? _value.preferredLanguage
          : preferredLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      supportedLanguages: null == supportedLanguages
          ? _value.supportedLanguages
          : supportedLanguages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      acceptMPTC: null == acceptMPTC
          ? _value.acceptMPTC
          : acceptMPTC // ignore: cast_nullable_to_non_nullable
              as String,
      isResetUserPassword: null == isResetUserPassword
          ? _value.isResetUserPassword
          : isResetUserPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      isPPATriggerMaintained: null == isPPATriggerMaintained
          ? _value.isPPATriggerMaintained
          : isPPATriggerMaintained // ignore: cast_nullable_to_non_nullable
              as bool,
      privacyControl: null == privacyControl
          ? _value.privacyControl
          : privacyControl // ignore: cast_nullable_to_non_nullable
              as PrivacyControlDto,
      selectedOrderType: null == selectedOrderType
          ? _value.selectedOrderType
          : selectedOrderType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RoleDtoCopyWith<$Res> get role {
    return $RoleDtoCopyWith<$Res>(_value.role, (value) {
      return _then(_value.copyWith(role: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AccessRightDtoCopyWith<$Res> get accessRight {
    return $AccessRightDtoCopyWith<$Res>(_value.accessRight, (value) {
      return _then(_value.copyWith(accessRight: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PrivacyControlDtoCopyWith<$Res> get privacyControl {
    return $PrivacyControlDtoCopyWith<$Res>(_value.privacyControl, (value) {
      return _then(_value.copyWith(privacyControl: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserDtoImplCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$$UserDtoImplCopyWith(
          _$UserDtoImpl value, $Res Function(_$UserDtoImpl) then) =
      __$$UserDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: '') String id,
      @JsonKey(name: 'username', defaultValue: '') String username,
      @JsonKey(name: 'email', defaultValue: '') String email,
      @JsonKey(name: 'firstName', defaultValue: '') String firstName,
      @JsonKey(name: 'lastName', defaultValue: '') String lastName,
      @JsonKey(name: 'role') RoleDto role,
      @JsonKey(name: 'customerCode', defaultValue: '') String customerCode,
      @JsonKey(name: 'userSalesOrganisationList', defaultValue: [])
      List<SalesOrganisationDto> userSalesOrganisations,
      @JsonKey(name: 'salesOrganisations', defaultValue: [])
      List<String> salesOrganisations,
      @JsonKey(name: 'accessRight') AccessRightDto accessRight,
      @JsonKey(name: 'emailNotifications', defaultValue: false)
      bool emailNotifications,
      @JsonKey(name: 'mobileNotifications', defaultValue: false)
      bool mobileNotifications,
      @JsonKey(
          name: 'languagePreference',
          readValue: JsonReadValueHelper.handleEmptyLanguagePreference)
      String languagePreference,
      @JsonKey(name: 'enableOrderType', defaultValue: false)
      bool enableOrderType,
      @JsonKey(name: 'acceptTC', defaultValue: true) bool acceptPrivacyPolicy,
      @JsonKey(name: 'hasBonusOverride', defaultValue: false)
      bool hasBonusOverride,
      @JsonKey(name: 'disableCreateOrder', defaultValue: false)
      bool disableCreateOrder,
      @JsonKey(name: 'disableReturns', defaultValue: false) bool disableReturns,
      @JsonKey(name: 'disablePaymentAccess', defaultValue: false)
      bool disablePaymentAccess,
      @JsonKey(name: 'hasPriceOverride', defaultValue: false)
      bool hasPriceOverride,
      @JsonKey(name: 'disablePaymentNotification', defaultValue: false)
      bool disablePaymentNotification,
      @JsonKey(
          name: 'paymentNotification',
          defaultValue: <PaymentAdviceExpiryNotificationDto>[])
      List<PaymentAdviceExpiryNotificationDto> paymentNotification,
      @JsonKey(
          name: 'preferredLanguage',
          readValue: JsonReadValueHelper.handleEmptyLanguagePreference)
      String preferredLanguage,
      @JsonKey(
          name: 'supportedLanguages',
          readValue: JsonReadValueHelper.handleSupportedLanguages,
          defaultValue: <String>[])
      List<String> supportedLanguages,
      @JsonKey(name: 'mobileNumber', defaultValue: '') String mobileNumber,
      @JsonKey(name: 'countryCode', defaultValue: '') String countryCode,
      @JsonKey(
          name: 'acceptMPTC',
          readValue: JsonReadValueHelper.handleMarketPlaceTnCAcceptance)
      String acceptMPTC,
      @JsonKey(name: 'isResetUserPassword', defaultValue: false)
      bool isResetUserPassword,
      @JsonKey(name: 'isPPATriggerMaintained', defaultValue: false)
      bool isPPATriggerMaintained,
      @JsonKey(name: 'privacyControls') PrivacyControlDto privacyControl,
      @JsonKey(name: 'selectedOrderType', defaultValue: '')
      String selectedOrderType});

  @override
  $RoleDtoCopyWith<$Res> get role;
  @override
  $AccessRightDtoCopyWith<$Res> get accessRight;
  @override
  $PrivacyControlDtoCopyWith<$Res> get privacyControl;
}

/// @nodoc
class __$$UserDtoImplCopyWithImpl<$Res>
    extends _$UserDtoCopyWithImpl<$Res, _$UserDtoImpl>
    implements _$$UserDtoImplCopyWith<$Res> {
  __$$UserDtoImplCopyWithImpl(
      _$UserDtoImpl _value, $Res Function(_$UserDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? role = null,
    Object? customerCode = null,
    Object? userSalesOrganisations = null,
    Object? salesOrganisations = null,
    Object? accessRight = null,
    Object? emailNotifications = null,
    Object? mobileNotifications = null,
    Object? languagePreference = null,
    Object? enableOrderType = null,
    Object? acceptPrivacyPolicy = null,
    Object? hasBonusOverride = null,
    Object? disableCreateOrder = null,
    Object? disableReturns = null,
    Object? disablePaymentAccess = null,
    Object? hasPriceOverride = null,
    Object? disablePaymentNotification = null,
    Object? paymentNotification = null,
    Object? preferredLanguage = null,
    Object? supportedLanguages = null,
    Object? mobileNumber = null,
    Object? countryCode = null,
    Object? acceptMPTC = null,
    Object? isResetUserPassword = null,
    Object? isPPATriggerMaintained = null,
    Object? privacyControl = null,
    Object? selectedOrderType = null,
  }) {
    return _then(_$UserDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as RoleDto,
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      userSalesOrganisations: null == userSalesOrganisations
          ? _value._userSalesOrganisations
          : userSalesOrganisations // ignore: cast_nullable_to_non_nullable
              as List<SalesOrganisationDto>,
      salesOrganisations: null == salesOrganisations
          ? _value._salesOrganisations
          : salesOrganisations // ignore: cast_nullable_to_non_nullable
              as List<String>,
      accessRight: null == accessRight
          ? _value.accessRight
          : accessRight // ignore: cast_nullable_to_non_nullable
              as AccessRightDto,
      emailNotifications: null == emailNotifications
          ? _value.emailNotifications
          : emailNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      mobileNotifications: null == mobileNotifications
          ? _value.mobileNotifications
          : mobileNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      languagePreference: null == languagePreference
          ? _value.languagePreference
          : languagePreference // ignore: cast_nullable_to_non_nullable
              as String,
      enableOrderType: null == enableOrderType
          ? _value.enableOrderType
          : enableOrderType // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptPrivacyPolicy: null == acceptPrivacyPolicy
          ? _value.acceptPrivacyPolicy
          : acceptPrivacyPolicy // ignore: cast_nullable_to_non_nullable
              as bool,
      hasBonusOverride: null == hasBonusOverride
          ? _value.hasBonusOverride
          : hasBonusOverride // ignore: cast_nullable_to_non_nullable
              as bool,
      disableCreateOrder: null == disableCreateOrder
          ? _value.disableCreateOrder
          : disableCreateOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      disableReturns: null == disableReturns
          ? _value.disableReturns
          : disableReturns // ignore: cast_nullable_to_non_nullable
              as bool,
      disablePaymentAccess: null == disablePaymentAccess
          ? _value.disablePaymentAccess
          : disablePaymentAccess // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPriceOverride: null == hasPriceOverride
          ? _value.hasPriceOverride
          : hasPriceOverride // ignore: cast_nullable_to_non_nullable
              as bool,
      disablePaymentNotification: null == disablePaymentNotification
          ? _value.disablePaymentNotification
          : disablePaymentNotification // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentNotification: null == paymentNotification
          ? _value._paymentNotification
          : paymentNotification // ignore: cast_nullable_to_non_nullable
              as List<PaymentAdviceExpiryNotificationDto>,
      preferredLanguage: null == preferredLanguage
          ? _value.preferredLanguage
          : preferredLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      supportedLanguages: null == supportedLanguages
          ? _value._supportedLanguages
          : supportedLanguages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      acceptMPTC: null == acceptMPTC
          ? _value.acceptMPTC
          : acceptMPTC // ignore: cast_nullable_to_non_nullable
              as String,
      isResetUserPassword: null == isResetUserPassword
          ? _value.isResetUserPassword
          : isResetUserPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      isPPATriggerMaintained: null == isPPATriggerMaintained
          ? _value.isPPATriggerMaintained
          : isPPATriggerMaintained // ignore: cast_nullable_to_non_nullable
              as bool,
      privacyControl: null == privacyControl
          ? _value.privacyControl
          : privacyControl // ignore: cast_nullable_to_non_nullable
              as PrivacyControlDto,
      selectedOrderType: null == selectedOrderType
          ? _value.selectedOrderType
          : selectedOrderType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDtoImpl extends _UserDto {
  const _$UserDtoImpl(
      {@JsonKey(name: 'id', defaultValue: '') required this.id,
      @JsonKey(name: 'username', defaultValue: '') required this.username,
      @JsonKey(name: 'email', defaultValue: '') required this.email,
      @JsonKey(name: 'firstName', defaultValue: '') required this.firstName,
      @JsonKey(name: 'lastName', defaultValue: '') required this.lastName,
      @JsonKey(name: 'role') this.role = RoleDto.emptyRoleDto,
      @JsonKey(name: 'customerCode', defaultValue: '')
      required this.customerCode,
      @JsonKey(name: 'userSalesOrganisationList', defaultValue: [])
      required final List<SalesOrganisationDto> userSalesOrganisations,
      @JsonKey(name: 'salesOrganisations', defaultValue: [])
      required final List<String> salesOrganisations,
      @JsonKey(name: 'accessRight')
      this.accessRight = AccessRightDto.emptyAccessRightDto,
      @JsonKey(name: 'emailNotifications', defaultValue: false)
      required this.emailNotifications,
      @JsonKey(name: 'mobileNotifications', defaultValue: false)
      required this.mobileNotifications,
      @JsonKey(
          name: 'languagePreference',
          readValue: JsonReadValueHelper.handleEmptyLanguagePreference)
      required this.languagePreference,
      @JsonKey(name: 'enableOrderType', defaultValue: false)
      required this.enableOrderType,
      @JsonKey(name: 'acceptTC', defaultValue: true)
      required this.acceptPrivacyPolicy,
      @JsonKey(name: 'hasBonusOverride', defaultValue: false)
      required this.hasBonusOverride,
      @JsonKey(name: 'disableCreateOrder', defaultValue: false)
      required this.disableCreateOrder,
      @JsonKey(name: 'disableReturns', defaultValue: false)
      required this.disableReturns,
      @JsonKey(name: 'disablePaymentAccess', defaultValue: false)
      required this.disablePaymentAccess,
      @JsonKey(name: 'hasPriceOverride', defaultValue: false)
      required this.hasPriceOverride,
      @JsonKey(name: 'disablePaymentNotification', defaultValue: false)
      required this.disablePaymentNotification,
      @JsonKey(
          name: 'paymentNotification',
          defaultValue: <PaymentAdviceExpiryNotificationDto>[])
      required final List<PaymentAdviceExpiryNotificationDto>
          paymentNotification,
      @JsonKey(
          name: 'preferredLanguage',
          readValue: JsonReadValueHelper.handleEmptyLanguagePreference)
      required this.preferredLanguage,
      @JsonKey(
          name: 'supportedLanguages',
          readValue: JsonReadValueHelper.handleSupportedLanguages,
          defaultValue: <String>[])
      required final List<String> supportedLanguages,
      @JsonKey(
          name: 'mobileNumber', defaultValue: '')
      required this.mobileNumber,
      @JsonKey(name: 'countryCode', defaultValue: '') required this.countryCode,
      @JsonKey(
          name: 'acceptMPTC',
          readValue: JsonReadValueHelper.handleMarketPlaceTnCAcceptance)
      required this.acceptMPTC,
      @JsonKey(name: 'isResetUserPassword', defaultValue: false)
      required this.isResetUserPassword,
      @JsonKey(name: 'isPPATriggerMaintained', defaultValue: false)
      required this.isPPATriggerMaintained,
      @JsonKey(name: 'privacyControls')
      this.privacyControl = PrivacyControlDto.emptyPrivacyControlDto,
      @JsonKey(name: 'selectedOrderType', defaultValue: '')
      required this.selectedOrderType})
      : _userSalesOrganisations = userSalesOrganisations,
        _salesOrganisations = salesOrganisations,
        _paymentNotification = paymentNotification,
        _supportedLanguages = supportedLanguages,
        super._();

  factory _$UserDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: '')
  final String id;
  @override
  @JsonKey(name: 'username', defaultValue: '')
  final String username;
  @override
  @JsonKey(name: 'email', defaultValue: '')
  final String email;
  @override
  @JsonKey(name: 'firstName', defaultValue: '')
  final String firstName;
  @override
  @JsonKey(name: 'lastName', defaultValue: '')
  final String lastName;
  @override
  @JsonKey(name: 'role')
  final RoleDto role;
  @override
  @JsonKey(name: 'customerCode', defaultValue: '')
  final String customerCode;
  final List<SalesOrganisationDto> _userSalesOrganisations;
  @override
  @JsonKey(name: 'userSalesOrganisationList', defaultValue: [])
  List<SalesOrganisationDto> get userSalesOrganisations {
    if (_userSalesOrganisations is EqualUnmodifiableListView)
      return _userSalesOrganisations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userSalesOrganisations);
  }

  final List<String> _salesOrganisations;
  @override
  @JsonKey(name: 'salesOrganisations', defaultValue: [])
  List<String> get salesOrganisations {
    if (_salesOrganisations is EqualUnmodifiableListView)
      return _salesOrganisations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_salesOrganisations);
  }

  @override
  @JsonKey(name: 'accessRight')
  final AccessRightDto accessRight;
  @override
  @JsonKey(name: 'emailNotifications', defaultValue: false)
  final bool emailNotifications;
  @override
  @JsonKey(name: 'mobileNotifications', defaultValue: false)
  final bool mobileNotifications;
  @override
  @JsonKey(
      name: 'languagePreference',
      readValue: JsonReadValueHelper.handleEmptyLanguagePreference)
  final String languagePreference;
  @override
  @JsonKey(name: 'enableOrderType', defaultValue: false)
  final bool enableOrderType;
  @override
  @JsonKey(name: 'acceptTC', defaultValue: true)
  final bool acceptPrivacyPolicy;
  @override
  @JsonKey(name: 'hasBonusOverride', defaultValue: false)
  final bool hasBonusOverride;
  @override
  @JsonKey(name: 'disableCreateOrder', defaultValue: false)
  final bool disableCreateOrder;
  @override
  @JsonKey(name: 'disableReturns', defaultValue: false)
  final bool disableReturns;
  @override
  @JsonKey(name: 'disablePaymentAccess', defaultValue: false)
  final bool disablePaymentAccess;
  @override
  @JsonKey(name: 'hasPriceOverride', defaultValue: false)
  final bool hasPriceOverride;
  @override
  @JsonKey(name: 'disablePaymentNotification', defaultValue: false)
  final bool disablePaymentNotification;
  final List<PaymentAdviceExpiryNotificationDto> _paymentNotification;
  @override
  @JsonKey(
      name: 'paymentNotification',
      defaultValue: <PaymentAdviceExpiryNotificationDto>[])
  List<PaymentAdviceExpiryNotificationDto> get paymentNotification {
    if (_paymentNotification is EqualUnmodifiableListView)
      return _paymentNotification;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentNotification);
  }

  @override
  @JsonKey(
      name: 'preferredLanguage',
      readValue: JsonReadValueHelper.handleEmptyLanguagePreference)
  final String preferredLanguage;
  final List<String> _supportedLanguages;
  @override
  @JsonKey(
      name: 'supportedLanguages',
      readValue: JsonReadValueHelper.handleSupportedLanguages,
      defaultValue: <String>[])
  List<String> get supportedLanguages {
    if (_supportedLanguages is EqualUnmodifiableListView)
      return _supportedLanguages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_supportedLanguages);
  }

  @override
  @JsonKey(name: 'mobileNumber', defaultValue: '')
  final String mobileNumber;
  @override
  @JsonKey(name: 'countryCode', defaultValue: '')
  final String countryCode;
  @override
  @JsonKey(
      name: 'acceptMPTC',
      readValue: JsonReadValueHelper.handleMarketPlaceTnCAcceptance)
  final String acceptMPTC;
  @override
  @JsonKey(name: 'isResetUserPassword', defaultValue: false)
  final bool isResetUserPassword;
  @override
  @JsonKey(name: 'isPPATriggerMaintained', defaultValue: false)
  final bool isPPATriggerMaintained;
  @override
  @JsonKey(name: 'privacyControls')
  final PrivacyControlDto privacyControl;
  @override
  @JsonKey(name: 'selectedOrderType', defaultValue: '')
  final String selectedOrderType;

  @override
  String toString() {
    return 'UserDto(id: $id, username: $username, email: $email, firstName: $firstName, lastName: $lastName, role: $role, customerCode: $customerCode, userSalesOrganisations: $userSalesOrganisations, salesOrganisations: $salesOrganisations, accessRight: $accessRight, emailNotifications: $emailNotifications, mobileNotifications: $mobileNotifications, languagePreference: $languagePreference, enableOrderType: $enableOrderType, acceptPrivacyPolicy: $acceptPrivacyPolicy, hasBonusOverride: $hasBonusOverride, disableCreateOrder: $disableCreateOrder, disableReturns: $disableReturns, disablePaymentAccess: $disablePaymentAccess, hasPriceOverride: $hasPriceOverride, disablePaymentNotification: $disablePaymentNotification, paymentNotification: $paymentNotification, preferredLanguage: $preferredLanguage, supportedLanguages: $supportedLanguages, mobileNumber: $mobileNumber, countryCode: $countryCode, acceptMPTC: $acceptMPTC, isResetUserPassword: $isResetUserPassword, isPPATriggerMaintained: $isPPATriggerMaintained, privacyControl: $privacyControl, selectedOrderType: $selectedOrderType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            const DeepCollectionEquality().equals(
                other._userSalesOrganisations, _userSalesOrganisations) &&
            const DeepCollectionEquality()
                .equals(other._salesOrganisations, _salesOrganisations) &&
            (identical(other.accessRight, accessRight) ||
                other.accessRight == accessRight) &&
            (identical(other.emailNotifications, emailNotifications) ||
                other.emailNotifications == emailNotifications) &&
            (identical(other.mobileNotifications, mobileNotifications) ||
                other.mobileNotifications == mobileNotifications) &&
            (identical(other.languagePreference, languagePreference) ||
                other.languagePreference == languagePreference) &&
            (identical(other.enableOrderType, enableOrderType) ||
                other.enableOrderType == enableOrderType) &&
            (identical(other.acceptPrivacyPolicy, acceptPrivacyPolicy) ||
                other.acceptPrivacyPolicy == acceptPrivacyPolicy) &&
            (identical(other.hasBonusOverride, hasBonusOverride) ||
                other.hasBonusOverride == hasBonusOverride) &&
            (identical(other.disableCreateOrder, disableCreateOrder) ||
                other.disableCreateOrder == disableCreateOrder) &&
            (identical(other.disableReturns, disableReturns) ||
                other.disableReturns == disableReturns) &&
            (identical(other.disablePaymentAccess, disablePaymentAccess) ||
                other.disablePaymentAccess == disablePaymentAccess) &&
            (identical(other.hasPriceOverride, hasPriceOverride) ||
                other.hasPriceOverride == hasPriceOverride) &&
            (identical(other.disablePaymentNotification,
                    disablePaymentNotification) ||
                other.disablePaymentNotification ==
                    disablePaymentNotification) &&
            const DeepCollectionEquality()
                .equals(other._paymentNotification, _paymentNotification) &&
            (identical(other.preferredLanguage, preferredLanguage) ||
                other.preferredLanguage == preferredLanguage) &&
            const DeepCollectionEquality()
                .equals(other._supportedLanguages, _supportedLanguages) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.acceptMPTC, acceptMPTC) ||
                other.acceptMPTC == acceptMPTC) &&
            (identical(other.isResetUserPassword, isResetUserPassword) ||
                other.isResetUserPassword == isResetUserPassword) &&
            (identical(other.isPPATriggerMaintained, isPPATriggerMaintained) ||
                other.isPPATriggerMaintained == isPPATriggerMaintained) &&
            (identical(other.privacyControl, privacyControl) ||
                other.privacyControl == privacyControl) &&
            (identical(other.selectedOrderType, selectedOrderType) ||
                other.selectedOrderType == selectedOrderType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        username,
        email,
        firstName,
        lastName,
        role,
        customerCode,
        const DeepCollectionEquality().hash(_userSalesOrganisations),
        const DeepCollectionEquality().hash(_salesOrganisations),
        accessRight,
        emailNotifications,
        mobileNotifications,
        languagePreference,
        enableOrderType,
        acceptPrivacyPolicy,
        hasBonusOverride,
        disableCreateOrder,
        disableReturns,
        disablePaymentAccess,
        hasPriceOverride,
        disablePaymentNotification,
        const DeepCollectionEquality().hash(_paymentNotification),
        preferredLanguage,
        const DeepCollectionEquality().hash(_supportedLanguages),
        mobileNumber,
        countryCode,
        acceptMPTC,
        isResetUserPassword,
        isPPATriggerMaintained,
        privacyControl,
        selectedOrderType
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDtoImplCopyWith<_$UserDtoImpl> get copyWith =>
      __$$UserDtoImplCopyWithImpl<_$UserDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDtoImplToJson(
      this,
    );
  }
}

abstract class _UserDto extends UserDto {
  const factory _UserDto(
      {@JsonKey(name: 'id', defaultValue: '') required final String id,
      @JsonKey(name: 'username', defaultValue: '')
      required final String username,
      @JsonKey(name: 'email', defaultValue: '') required final String email,
      @JsonKey(name: 'firstName', defaultValue: '')
      required final String firstName,
      @JsonKey(name: 'lastName', defaultValue: '')
      required final String lastName,
      @JsonKey(name: 'role') final RoleDto role,
      @JsonKey(name: 'customerCode', defaultValue: '')
      required final String customerCode,
      @JsonKey(name: 'userSalesOrganisationList', defaultValue: [])
      required final List<SalesOrganisationDto> userSalesOrganisations,
      @JsonKey(name: 'salesOrganisations', defaultValue: [])
      required final List<String> salesOrganisations,
      @JsonKey(name: 'accessRight') final AccessRightDto accessRight,
      @JsonKey(name: 'emailNotifications', defaultValue: false)
      required final bool emailNotifications,
      @JsonKey(name: 'mobileNotifications', defaultValue: false)
      required final bool mobileNotifications,
      @JsonKey(
          name: 'languagePreference',
          readValue: JsonReadValueHelper.handleEmptyLanguagePreference)
      required final String languagePreference,
      @JsonKey(name: 'enableOrderType', defaultValue: false)
      required final bool enableOrderType,
      @JsonKey(name: 'acceptTC', defaultValue: true)
      required final bool acceptPrivacyPolicy,
      @JsonKey(name: 'hasBonusOverride', defaultValue: false)
      required final bool hasBonusOverride,
      @JsonKey(name: 'disableCreateOrder', defaultValue: false)
      required final bool disableCreateOrder,
      @JsonKey(name: 'disableReturns', defaultValue: false)
      required final bool disableReturns,
      @JsonKey(name: 'disablePaymentAccess', defaultValue: false)
      required final bool disablePaymentAccess,
      @JsonKey(name: 'hasPriceOverride', defaultValue: false)
      required final bool hasPriceOverride,
      @JsonKey(name: 'disablePaymentNotification', defaultValue: false)
      required final bool disablePaymentNotification,
      @JsonKey(
          name: 'paymentNotification',
          defaultValue: <PaymentAdviceExpiryNotificationDto>[])
      required final List<PaymentAdviceExpiryNotificationDto>
          paymentNotification,
      @JsonKey(
          name: 'preferredLanguage',
          readValue: JsonReadValueHelper.handleEmptyLanguagePreference)
      required final String preferredLanguage,
      @JsonKey(
          name: 'supportedLanguages',
          readValue: JsonReadValueHelper.handleSupportedLanguages,
          defaultValue: <String>[])
      required final List<String> supportedLanguages,
      @JsonKey(name: 'mobileNumber', defaultValue: '')
      required final String mobileNumber,
      @JsonKey(name: 'countryCode', defaultValue: '')
      required final String countryCode,
      @JsonKey(
          name: 'acceptMPTC',
          readValue: JsonReadValueHelper.handleMarketPlaceTnCAcceptance)
      required final String acceptMPTC,
      @JsonKey(name: 'isResetUserPassword', defaultValue: false)
      required final bool isResetUserPassword,
      @JsonKey(name: 'isPPATriggerMaintained', defaultValue: false)
      required final bool isPPATriggerMaintained,
      @JsonKey(name: 'privacyControls') final PrivacyControlDto privacyControl,
      @JsonKey(name: 'selectedOrderType', defaultValue: '')
      required final String selectedOrderType}) = _$UserDtoImpl;
  const _UserDto._() : super._();

  factory _UserDto.fromJson(Map<String, dynamic> json) = _$UserDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: '')
  String get id;
  @override
  @JsonKey(name: 'username', defaultValue: '')
  String get username;
  @override
  @JsonKey(name: 'email', defaultValue: '')
  String get email;
  @override
  @JsonKey(name: 'firstName', defaultValue: '')
  String get firstName;
  @override
  @JsonKey(name: 'lastName', defaultValue: '')
  String get lastName;
  @override
  @JsonKey(name: 'role')
  RoleDto get role;
  @override
  @JsonKey(name: 'customerCode', defaultValue: '')
  String get customerCode;
  @override
  @JsonKey(name: 'userSalesOrganisationList', defaultValue: [])
  List<SalesOrganisationDto> get userSalesOrganisations;
  @override
  @JsonKey(name: 'salesOrganisations', defaultValue: [])
  List<String> get salesOrganisations;
  @override
  @JsonKey(name: 'accessRight')
  AccessRightDto get accessRight;
  @override
  @JsonKey(name: 'emailNotifications', defaultValue: false)
  bool get emailNotifications;
  @override
  @JsonKey(name: 'mobileNotifications', defaultValue: false)
  bool get mobileNotifications;
  @override
  @JsonKey(
      name: 'languagePreference',
      readValue: JsonReadValueHelper.handleEmptyLanguagePreference)
  String get languagePreference;
  @override
  @JsonKey(name: 'enableOrderType', defaultValue: false)
  bool get enableOrderType;
  @override
  @JsonKey(name: 'acceptTC', defaultValue: true)
  bool get acceptPrivacyPolicy;
  @override
  @JsonKey(name: 'hasBonusOverride', defaultValue: false)
  bool get hasBonusOverride;
  @override
  @JsonKey(name: 'disableCreateOrder', defaultValue: false)
  bool get disableCreateOrder;
  @override
  @JsonKey(name: 'disableReturns', defaultValue: false)
  bool get disableReturns;
  @override
  @JsonKey(name: 'disablePaymentAccess', defaultValue: false)
  bool get disablePaymentAccess;
  @override
  @JsonKey(name: 'hasPriceOverride', defaultValue: false)
  bool get hasPriceOverride;
  @override
  @JsonKey(name: 'disablePaymentNotification', defaultValue: false)
  bool get disablePaymentNotification;
  @override
  @JsonKey(
      name: 'paymentNotification',
      defaultValue: <PaymentAdviceExpiryNotificationDto>[])
  List<PaymentAdviceExpiryNotificationDto> get paymentNotification;
  @override
  @JsonKey(
      name: 'preferredLanguage',
      readValue: JsonReadValueHelper.handleEmptyLanguagePreference)
  String get preferredLanguage;
  @override
  @JsonKey(
      name: 'supportedLanguages',
      readValue: JsonReadValueHelper.handleSupportedLanguages,
      defaultValue: <String>[])
  List<String> get supportedLanguages;
  @override
  @JsonKey(name: 'mobileNumber', defaultValue: '')
  String get mobileNumber;
  @override
  @JsonKey(name: 'countryCode', defaultValue: '')
  String get countryCode;
  @override
  @JsonKey(
      name: 'acceptMPTC',
      readValue: JsonReadValueHelper.handleMarketPlaceTnCAcceptance)
  String get acceptMPTC;
  @override
  @JsonKey(name: 'isResetUserPassword', defaultValue: false)
  bool get isResetUserPassword;
  @override
  @JsonKey(name: 'isPPATriggerMaintained', defaultValue: false)
  bool get isPPATriggerMaintained;
  @override
  @JsonKey(name: 'privacyControls')
  PrivacyControlDto get privacyControl;
  @override
  @JsonKey(name: 'selectedOrderType', defaultValue: '')
  String get selectedOrderType;
  @override
  @JsonKey(ignore: true)
  _$$UserDtoImplCopyWith<_$UserDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

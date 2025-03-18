// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  Username get username => throw _privateConstructorUsedError;
  EmailAddress get email => throw _privateConstructorUsedError;
  FullName get fullName => throw _privateConstructorUsedError;
  Role get role => throw _privateConstructorUsedError;
  CustomerCode get customerCode => throw _privateConstructorUsedError;
  List<SalesOrganisation> get userSalesOrganisations =>
      throw _privateConstructorUsedError;
  List<SalesOrg> get salesOrganisations => throw _privateConstructorUsedError;
  AccessRight get accessRight => throw _privateConstructorUsedError;
  Settings get settings => throw _privateConstructorUsedError;
  bool get acceptPrivacyPolicy => throw _privateConstructorUsedError;
  bool get enableOrderType => throw _privateConstructorUsedError;
  DocumentType get selectedOrderType => throw _privateConstructorUsedError;
  bool get hasBonusOverride => throw _privateConstructorUsedError;
  bool get disableCreateOrder => throw _privateConstructorUsedError;
  bool get disableReturns => throw _privateConstructorUsedError;
  bool get disablePaymentAccess => throw _privateConstructorUsedError;
  bool get hasPriceOverride => throw _privateConstructorUsedError;
  Language get preferredLanguage => throw _privateConstructorUsedError;
  List<Language> get supportedLanguages => throw _privateConstructorUsedError;
  PhoneNumber get mobileNumber => throw _privateConstructorUsedError;
  CountryCode get countryCode => throw _privateConstructorUsedError;
  MarketPlaceTnCAcceptance get acceptMPTC => throw _privateConstructorUsedError;
  bool get isResetUserPassword => throw _privateConstructorUsedError;
  bool get isPPATriggerMaintained => throw _privateConstructorUsedError;
  PrivacyControl get privacyControl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String id,
      Username username,
      EmailAddress email,
      FullName fullName,
      Role role,
      CustomerCode customerCode,
      List<SalesOrganisation> userSalesOrganisations,
      List<SalesOrg> salesOrganisations,
      AccessRight accessRight,
      Settings settings,
      bool acceptPrivacyPolicy,
      bool enableOrderType,
      DocumentType selectedOrderType,
      bool hasBonusOverride,
      bool disableCreateOrder,
      bool disableReturns,
      bool disablePaymentAccess,
      bool hasPriceOverride,
      Language preferredLanguage,
      List<Language> supportedLanguages,
      PhoneNumber mobileNumber,
      CountryCode countryCode,
      MarketPlaceTnCAcceptance acceptMPTC,
      bool isResetUserPassword,
      bool isPPATriggerMaintained,
      PrivacyControl privacyControl});

  $FullNameCopyWith<$Res> get fullName;
  $RoleCopyWith<$Res> get role;
  $AccessRightCopyWith<$Res> get accessRight;
  $SettingsCopyWith<$Res> get settings;
  $PrivacyControlCopyWith<$Res> get privacyControl;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

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
    Object? fullName = null,
    Object? role = null,
    Object? customerCode = null,
    Object? userSalesOrganisations = null,
    Object? salesOrganisations = null,
    Object? accessRight = null,
    Object? settings = null,
    Object? acceptPrivacyPolicy = null,
    Object? enableOrderType = null,
    Object? selectedOrderType = null,
    Object? hasBonusOverride = null,
    Object? disableCreateOrder = null,
    Object? disableReturns = null,
    Object? disablePaymentAccess = null,
    Object? hasPriceOverride = null,
    Object? preferredLanguage = null,
    Object? supportedLanguages = null,
    Object? mobileNumber = null,
    Object? countryCode = null,
    Object? acceptMPTC = null,
    Object? isResetUserPassword = null,
    Object? isPPATriggerMaintained = null,
    Object? privacyControl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as FullName,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as CustomerCode,
      userSalesOrganisations: null == userSalesOrganisations
          ? _value.userSalesOrganisations
          : userSalesOrganisations // ignore: cast_nullable_to_non_nullable
              as List<SalesOrganisation>,
      salesOrganisations: null == salesOrganisations
          ? _value.salesOrganisations
          : salesOrganisations // ignore: cast_nullable_to_non_nullable
              as List<SalesOrg>,
      accessRight: null == accessRight
          ? _value.accessRight
          : accessRight // ignore: cast_nullable_to_non_nullable
              as AccessRight,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Settings,
      acceptPrivacyPolicy: null == acceptPrivacyPolicy
          ? _value.acceptPrivacyPolicy
          : acceptPrivacyPolicy // ignore: cast_nullable_to_non_nullable
              as bool,
      enableOrderType: null == enableOrderType
          ? _value.enableOrderType
          : enableOrderType // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedOrderType: null == selectedOrderType
          ? _value.selectedOrderType
          : selectedOrderType // ignore: cast_nullable_to_non_nullable
              as DocumentType,
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
      preferredLanguage: null == preferredLanguage
          ? _value.preferredLanguage
          : preferredLanguage // ignore: cast_nullable_to_non_nullable
              as Language,
      supportedLanguages: null == supportedLanguages
          ? _value.supportedLanguages
          : supportedLanguages // ignore: cast_nullable_to_non_nullable
              as List<Language>,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as CountryCode,
      acceptMPTC: null == acceptMPTC
          ? _value.acceptMPTC
          : acceptMPTC // ignore: cast_nullable_to_non_nullable
              as MarketPlaceTnCAcceptance,
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
              as PrivacyControl,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FullNameCopyWith<$Res> get fullName {
    return $FullNameCopyWith<$Res>(_value.fullName, (value) {
      return _then(_value.copyWith(fullName: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RoleCopyWith<$Res> get role {
    return $RoleCopyWith<$Res>(_value.role, (value) {
      return _then(_value.copyWith(role: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AccessRightCopyWith<$Res> get accessRight {
    return $AccessRightCopyWith<$Res>(_value.accessRight, (value) {
      return _then(_value.copyWith(accessRight: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SettingsCopyWith<$Res> get settings {
    return $SettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PrivacyControlCopyWith<$Res> get privacyControl {
    return $PrivacyControlCopyWith<$Res>(_value.privacyControl, (value) {
      return _then(_value.copyWith(privacyControl: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Username username,
      EmailAddress email,
      FullName fullName,
      Role role,
      CustomerCode customerCode,
      List<SalesOrganisation> userSalesOrganisations,
      List<SalesOrg> salesOrganisations,
      AccessRight accessRight,
      Settings settings,
      bool acceptPrivacyPolicy,
      bool enableOrderType,
      DocumentType selectedOrderType,
      bool hasBonusOverride,
      bool disableCreateOrder,
      bool disableReturns,
      bool disablePaymentAccess,
      bool hasPriceOverride,
      Language preferredLanguage,
      List<Language> supportedLanguages,
      PhoneNumber mobileNumber,
      CountryCode countryCode,
      MarketPlaceTnCAcceptance acceptMPTC,
      bool isResetUserPassword,
      bool isPPATriggerMaintained,
      PrivacyControl privacyControl});

  @override
  $FullNameCopyWith<$Res> get fullName;
  @override
  $RoleCopyWith<$Res> get role;
  @override
  $AccessRightCopyWith<$Res> get accessRight;
  @override
  $SettingsCopyWith<$Res> get settings;
  @override
  $PrivacyControlCopyWith<$Res> get privacyControl;
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? fullName = null,
    Object? role = null,
    Object? customerCode = null,
    Object? userSalesOrganisations = null,
    Object? salesOrganisations = null,
    Object? accessRight = null,
    Object? settings = null,
    Object? acceptPrivacyPolicy = null,
    Object? enableOrderType = null,
    Object? selectedOrderType = null,
    Object? hasBonusOverride = null,
    Object? disableCreateOrder = null,
    Object? disableReturns = null,
    Object? disablePaymentAccess = null,
    Object? hasPriceOverride = null,
    Object? preferredLanguage = null,
    Object? supportedLanguages = null,
    Object? mobileNumber = null,
    Object? countryCode = null,
    Object? acceptMPTC = null,
    Object? isResetUserPassword = null,
    Object? isPPATriggerMaintained = null,
    Object? privacyControl = null,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as Username,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as FullName,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
      customerCode: null == customerCode
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as CustomerCode,
      userSalesOrganisations: null == userSalesOrganisations
          ? _value._userSalesOrganisations
          : userSalesOrganisations // ignore: cast_nullable_to_non_nullable
              as List<SalesOrganisation>,
      salesOrganisations: null == salesOrganisations
          ? _value._salesOrganisations
          : salesOrganisations // ignore: cast_nullable_to_non_nullable
              as List<SalesOrg>,
      accessRight: null == accessRight
          ? _value.accessRight
          : accessRight // ignore: cast_nullable_to_non_nullable
              as AccessRight,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Settings,
      acceptPrivacyPolicy: null == acceptPrivacyPolicy
          ? _value.acceptPrivacyPolicy
          : acceptPrivacyPolicy // ignore: cast_nullable_to_non_nullable
              as bool,
      enableOrderType: null == enableOrderType
          ? _value.enableOrderType
          : enableOrderType // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedOrderType: null == selectedOrderType
          ? _value.selectedOrderType
          : selectedOrderType // ignore: cast_nullable_to_non_nullable
              as DocumentType,
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
      preferredLanguage: null == preferredLanguage
          ? _value.preferredLanguage
          : preferredLanguage // ignore: cast_nullable_to_non_nullable
              as Language,
      supportedLanguages: null == supportedLanguages
          ? _value._supportedLanguages
          : supportedLanguages // ignore: cast_nullable_to_non_nullable
              as List<Language>,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as CountryCode,
      acceptMPTC: null == acceptMPTC
          ? _value.acceptMPTC
          : acceptMPTC // ignore: cast_nullable_to_non_nullable
              as MarketPlaceTnCAcceptance,
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
              as PrivacyControl,
    ));
  }
}

/// @nodoc

class _$UserImpl extends _User {
  const _$UserImpl(
      {required this.id,
      required this.username,
      required this.email,
      required this.fullName,
      required this.role,
      required this.customerCode,
      required final List<SalesOrganisation> userSalesOrganisations,
      required final List<SalesOrg> salesOrganisations,
      required this.accessRight,
      required this.settings,
      required this.acceptPrivacyPolicy,
      required this.enableOrderType,
      required this.selectedOrderType,
      required this.hasBonusOverride,
      required this.disableCreateOrder,
      required this.disableReturns,
      required this.disablePaymentAccess,
      required this.hasPriceOverride,
      required this.preferredLanguage,
      required final List<Language> supportedLanguages,
      required this.mobileNumber,
      required this.countryCode,
      required this.acceptMPTC,
      required this.isResetUserPassword,
      required this.isPPATriggerMaintained,
      required this.privacyControl})
      : _userSalesOrganisations = userSalesOrganisations,
        _salesOrganisations = salesOrganisations,
        _supportedLanguages = supportedLanguages,
        super._();

  @override
  final String id;
  @override
  final Username username;
  @override
  final EmailAddress email;
  @override
  final FullName fullName;
  @override
  final Role role;
  @override
  final CustomerCode customerCode;
  final List<SalesOrganisation> _userSalesOrganisations;
  @override
  List<SalesOrganisation> get userSalesOrganisations {
    if (_userSalesOrganisations is EqualUnmodifiableListView)
      return _userSalesOrganisations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userSalesOrganisations);
  }

  final List<SalesOrg> _salesOrganisations;
  @override
  List<SalesOrg> get salesOrganisations {
    if (_salesOrganisations is EqualUnmodifiableListView)
      return _salesOrganisations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_salesOrganisations);
  }

  @override
  final AccessRight accessRight;
  @override
  final Settings settings;
  @override
  final bool acceptPrivacyPolicy;
  @override
  final bool enableOrderType;
  @override
  final DocumentType selectedOrderType;
  @override
  final bool hasBonusOverride;
  @override
  final bool disableCreateOrder;
  @override
  final bool disableReturns;
  @override
  final bool disablePaymentAccess;
  @override
  final bool hasPriceOverride;
  @override
  final Language preferredLanguage;
  final List<Language> _supportedLanguages;
  @override
  List<Language> get supportedLanguages {
    if (_supportedLanguages is EqualUnmodifiableListView)
      return _supportedLanguages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_supportedLanguages);
  }

  @override
  final PhoneNumber mobileNumber;
  @override
  final CountryCode countryCode;
  @override
  final MarketPlaceTnCAcceptance acceptMPTC;
  @override
  final bool isResetUserPassword;
  @override
  final bool isPPATriggerMaintained;
  @override
  final PrivacyControl privacyControl;

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, fullName: $fullName, role: $role, customerCode: $customerCode, userSalesOrganisations: $userSalesOrganisations, salesOrganisations: $salesOrganisations, accessRight: $accessRight, settings: $settings, acceptPrivacyPolicy: $acceptPrivacyPolicy, enableOrderType: $enableOrderType, selectedOrderType: $selectedOrderType, hasBonusOverride: $hasBonusOverride, disableCreateOrder: $disableCreateOrder, disableReturns: $disableReturns, disablePaymentAccess: $disablePaymentAccess, hasPriceOverride: $hasPriceOverride, preferredLanguage: $preferredLanguage, supportedLanguages: $supportedLanguages, mobileNumber: $mobileNumber, countryCode: $countryCode, acceptMPTC: $acceptMPTC, isResetUserPassword: $isResetUserPassword, isPPATriggerMaintained: $isPPATriggerMaintained, privacyControl: $privacyControl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            const DeepCollectionEquality().equals(
                other._userSalesOrganisations, _userSalesOrganisations) &&
            const DeepCollectionEquality()
                .equals(other._salesOrganisations, _salesOrganisations) &&
            (identical(other.accessRight, accessRight) ||
                other.accessRight == accessRight) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.acceptPrivacyPolicy, acceptPrivacyPolicy) ||
                other.acceptPrivacyPolicy == acceptPrivacyPolicy) &&
            (identical(other.enableOrderType, enableOrderType) ||
                other.enableOrderType == enableOrderType) &&
            (identical(other.selectedOrderType, selectedOrderType) ||
                other.selectedOrderType == selectedOrderType) &&
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
                other.privacyControl == privacyControl));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        username,
        email,
        fullName,
        role,
        customerCode,
        const DeepCollectionEquality().hash(_userSalesOrganisations),
        const DeepCollectionEquality().hash(_salesOrganisations),
        accessRight,
        settings,
        acceptPrivacyPolicy,
        enableOrderType,
        selectedOrderType,
        hasBonusOverride,
        disableCreateOrder,
        disableReturns,
        disablePaymentAccess,
        hasPriceOverride,
        preferredLanguage,
        const DeepCollectionEquality().hash(_supportedLanguages),
        mobileNumber,
        countryCode,
        acceptMPTC,
        isResetUserPassword,
        isPPATriggerMaintained,
        privacyControl
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);
}

abstract class _User extends User {
  const factory _User(
      {required final String id,
      required final Username username,
      required final EmailAddress email,
      required final FullName fullName,
      required final Role role,
      required final CustomerCode customerCode,
      required final List<SalesOrganisation> userSalesOrganisations,
      required final List<SalesOrg> salesOrganisations,
      required final AccessRight accessRight,
      required final Settings settings,
      required final bool acceptPrivacyPolicy,
      required final bool enableOrderType,
      required final DocumentType selectedOrderType,
      required final bool hasBonusOverride,
      required final bool disableCreateOrder,
      required final bool disableReturns,
      required final bool disablePaymentAccess,
      required final bool hasPriceOverride,
      required final Language preferredLanguage,
      required final List<Language> supportedLanguages,
      required final PhoneNumber mobileNumber,
      required final CountryCode countryCode,
      required final MarketPlaceTnCAcceptance acceptMPTC,
      required final bool isResetUserPassword,
      required final bool isPPATriggerMaintained,
      required final PrivacyControl privacyControl}) = _$UserImpl;
  const _User._() : super._();

  @override
  String get id;
  @override
  Username get username;
  @override
  EmailAddress get email;
  @override
  FullName get fullName;
  @override
  Role get role;
  @override
  CustomerCode get customerCode;
  @override
  List<SalesOrganisation> get userSalesOrganisations;
  @override
  List<SalesOrg> get salesOrganisations;
  @override
  AccessRight get accessRight;
  @override
  Settings get settings;
  @override
  bool get acceptPrivacyPolicy;
  @override
  bool get enableOrderType;
  @override
  DocumentType get selectedOrderType;
  @override
  bool get hasBonusOverride;
  @override
  bool get disableCreateOrder;
  @override
  bool get disableReturns;
  @override
  bool get disablePaymentAccess;
  @override
  bool get hasPriceOverride;
  @override
  Language get preferredLanguage;
  @override
  List<Language> get supportedLanguages;
  @override
  PhoneNumber get mobileNumber;
  @override
  CountryCode get countryCode;
  @override
  MarketPlaceTnCAcceptance get acceptMPTC;
  @override
  bool get isResetUserPassword;
  @override
  bool get isPPATriggerMaintained;
  @override
  PrivacyControl get privacyControl;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDtoImpl _$$UserDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserDtoImpl(
      id: json['id'] as String? ?? '',
      username: json['username'] as String? ?? '',
      email: json['email'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      role: json['role'] == null
          ? RoleDto.emptyRoleDto
          : RoleDto.fromJson(json['role'] as Map<String, dynamic>),
      customerCode: json['customerCode'] as String? ?? '',
      userSalesOrganisations:
          (json['userSalesOrganisationList'] as List<dynamic>?)
                  ?.map((e) =>
                      SalesOrganisationDto.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
      salesOrganisations: (json['salesOrganisations'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      accessRight: json['accessRight'] == null
          ? AccessRightDto.emptyAccessRightDto
          : AccessRightDto.fromJson(
              json['accessRight'] as Map<String, dynamic>),
      emailNotifications: json['emailNotifications'] as bool? ?? false,
      mobileNotifications: json['mobileNotifications'] as bool? ?? false,
      languagePreference: JsonReadValueHelper.handleEmptyLanguagePreference(
          json, 'languagePreference') as String,
      enableOrderType: json['enableOrderType'] as bool? ?? false,
      acceptPrivacyPolicy: json['acceptTC'] as bool? ?? true,
      hasBonusOverride: json['hasBonusOverride'] as bool? ?? false,
      disableCreateOrder: json['disableCreateOrder'] as bool? ?? false,
      disableReturns: json['disableReturns'] as bool? ?? false,
      disablePaymentAccess: json['disablePaymentAccess'] as bool? ?? false,
      hasPriceOverride: json['hasPriceOverride'] as bool? ?? false,
      disablePaymentNotification:
          json['disablePaymentNotification'] as bool? ?? false,
      paymentNotification: (json['paymentNotification'] as List<dynamic>?)
              ?.map((e) => PaymentAdviceExpiryNotificationDto.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
      preferredLanguage: JsonReadValueHelper.handleEmptyLanguagePreference(
          json, 'preferredLanguage') as String,
      supportedLanguages: (JsonReadValueHelper.handleSupportedLanguages(
                  json, 'supportedLanguages') as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      mobileNumber: json['mobileNumber'] as String? ?? '',
      countryCode: json['countryCode'] as String? ?? '',
      acceptMPTC:
          JsonReadValueHelper.handleMarketPlaceTnCAcceptance(json, 'acceptMPTC')
              as String,
      isResetUserPassword: json['isResetUserPassword'] as bool? ?? false,
      isPPATriggerMaintained: json['isPPATriggerMaintained'] as bool? ?? false,
      privacyControl: json['privacyControls'] == null
          ? PrivacyControlDto.emptyPrivacyControlDto
          : PrivacyControlDto.fromJson(
              json['privacyControls'] as Map<String, dynamic>),
      selectedOrderType: json['selectedOrderType'] as String? ?? '',
    );

Map<String, dynamic> _$$UserDtoImplToJson(_$UserDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'role': instance.role.toJson(),
      'customerCode': instance.customerCode,
      'userSalesOrganisationList':
          instance.userSalesOrganisations.map((e) => e.toJson()).toList(),
      'salesOrganisations': instance.salesOrganisations,
      'accessRight': instance.accessRight.toJson(),
      'emailNotifications': instance.emailNotifications,
      'mobileNotifications': instance.mobileNotifications,
      'languagePreference': instance.languagePreference,
      'enableOrderType': instance.enableOrderType,
      'acceptTC': instance.acceptPrivacyPolicy,
      'hasBonusOverride': instance.hasBonusOverride,
      'disableCreateOrder': instance.disableCreateOrder,
      'disableReturns': instance.disableReturns,
      'disablePaymentAccess': instance.disablePaymentAccess,
      'hasPriceOverride': instance.hasPriceOverride,
      'disablePaymentNotification': instance.disablePaymentNotification,
      'paymentNotification':
          instance.paymentNotification.map((e) => e.toJson()).toList(),
      'preferredLanguage': instance.preferredLanguage,
      'supportedLanguages': instance.supportedLanguages,
      'mobileNumber': instance.mobileNumber,
      'countryCode': instance.countryCode,
      'acceptMPTC': instance.acceptMPTC,
      'isResetUserPassword': instance.isResetUserPassword,
      'isPPATriggerMaintained': instance.isPPATriggerMaintained,
      'privacyControls': instance.privacyControl.toJson(),
      'selectedOrderType': instance.selectedOrderType,
    };

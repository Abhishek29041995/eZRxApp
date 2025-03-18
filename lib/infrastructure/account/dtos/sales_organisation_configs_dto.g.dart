// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_organisation_configs_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesOrganisationConfigsDtoImpl _$$SalesOrganisationConfigsDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$SalesOrganisationConfigsDtoImpl(
      disableProcessingStatus: json['disableProcessingStatus'] as bool,
      currency: json['currency'] as String,
      hideCustomer: json['hideCustomer'] as bool? ?? false,
      enableGimmickMaterial: json['enableGimmickMaterial'] as bool? ?? false,
      disablePrincipals: json['disablePrincipals'] as bool? ?? false,
      principalList: const _PrincipalListConverter()
          .fromJson(json['principalList'] as Map<String, dynamic>),
      disableOrderType: json['disableOrderType'] as bool? ?? false,
      enableBatchNumber: json['enableBatchNumber'] as bool? ?? false,
      disableBundles: json['disableBundles'] as bool? ?? false,
      enableZDP5: json['enableZDP5'] as bool? ?? false,
      enableTaxClassification:
          json['enableTaxClassification'] as bool? ?? false,
      enableVat: json['enableVat'] as bool? ?? false,
      vatValue: (json['vatValue'] as num?)?.toInt() ?? 0,
      materialWithoutPrice: json['materialWithoutPrice'] as bool? ?? false,
      enableSpecialInstructions:
          json['enableSpecialInstructions'] as bool? ?? false,
      enableReferenceNote: json['enableReferenceNote'] as bool? ?? false,
      enableCollectiveNumber: json['enableCollectiveNumber'] as bool? ?? false,
      enableMobileNumber: json['enableMobileNumber'] as bool? ?? false,
      enableFutureDeliveryDay:
          json['enableFutureDeliveryDay'] as bool? ?? false,
      enablePOAttachmentRequired:
          json['enablePOAttachmentRequired'] as bool? ?? false,
      enablePaymentTerms: json['enablePaymentTerms'] as bool? ?? false,
      futureDeliveryDay: json['futureDeliveryDay'] as String? ?? '',
      enableGMC: json['enableGMC'] as bool? ?? false,
      enableListPrice: json['enableListPrice'] as bool? ?? false,
      enableDefaultMD: json['enableDefaultMD'] as bool? ?? false,
      priceOverride: json['priceOverride'] as bool? ?? false,
      disablePaymentTermsDisplay:
          json['disablePaymentTermsDisplay'] as bool? ?? false,
      disableDeliveryDate: json['disableDeliveryDate'] as bool? ?? false,
      enableBillTo: json['enableBillTo'] as bool? ?? false,
      showPOAttachment: json['showPOAttachment'] as bool? ?? false,
      expiryDateDisplay: json['expiryDateDisplay'] as bool? ?? false,
      hideStockDisplay: json['hideStockDisplay'] as bool? ?? false,
      addOosMaterials: json['addOosMaterials'] as bool? ?? false,
      oosValue: (json['oosValue'] as num?)?.toInt() ?? 0,
      enableRemarks: json['enableRemarks'] as bool? ?? false,
      enableOHPrice: json['enableOHPrice'] as bool? ?? true,
      poNumberRequired: json['ponRequired'] as bool? ?? false,
      enableIRN: json['enableIRN'] as bool? ?? false,
      enableTaxDisplay: json['enableTaxDisplay'] as bool? ?? false,
      enableTenderOrders: json['enableTenderOrders'] as bool? ?? false,
      enableTaxAtTotalLevelOnly:
          json['enableTaxAtTotalLevelOnly'] as bool? ?? false,
      netPriceOverride: json['netPriceOverride'] as bool? ?? false,
      batchNumDisplay: json['batchNumDisplay'] as bool? ?? false,
      displayOrderDiscount: json['displayOrderDiscount'] as bool? ?? false,
      minOrderAmount: json['minOrderAmount'] == null
          ? 0.0
          : const StringToDoubleConverter()
              .fromJson(json['minOrderAmount'] as String),
      salesOrg: json['salesOrgCode'] as String? ?? '0',
      enableZDP8Override: json['enableZDP8Override'] as bool? ?? false,
      disableReturnsAccessSR: json['disableReturnsAccessSR'] as bool? ?? false,
      disableReturnsAccess: json['disableReturnsAccess'] as bool? ?? false,
      disableOverrideFieldCustomer:
          json['disableOverrideFieldCustomer'] as bool? ?? false,
      disableOverrideFieldSR: json['disableOverrideFieldSR'] as bool? ?? false,
      enableGreenDelivery: json['enableGreenDelivery'] as bool? ?? false,
      greenDeliveryDelayInDays:
          (json['greenDeliveryDelayInDays'] as num?)?.toInt() ?? 2,
      enableComboDeals: json['enableComboDeals'] as bool? ?? false,
      greenDeliveryUserRole:
          (json['greenDeliveryUserRole'] as num?)?.toInt() ?? 0,
      comboDealsUserRole: (json['comboDealsUserRole'] as num?)?.toInt() ?? 0,
      enableGMN: json['enableGMN'] as bool? ?? false,
      displayItemTaxBreakdown:
          json['displayItemTaxBreakdown'] as bool? ?? false,
      displaySubtotalTaxBreakdown:
          json['displaySubtotalTaxBreakdown'] as bool? ?? false,
      disablePayment: json['disablePayment'] as bool? ?? false,
      hideCredit: json['hideCredit'] as bool? ?? false,
      allowReturnsOutsidePolicy:
          json['allowReturnsOutsidePolicy'] as bool? ?? false,
      enableMarketPlace: json['enableMarketPlace'] as bool? ?? false,
      mpMinOrderAmount: json['mpMinOrderAmount'] == null
          ? 0.0
          : const StringToDoubleConverter()
              .fromJson(json['mpMinOrderAmount'] as String),
      statementOfAccountEnabled:
          json['statementOfAccountEnabled'] as bool? ?? false,
      enableSmallOrderFee: json['enableSmallOrderFee'] as bool? ?? false,
      smallOrderFeeUserRoles: (json['smallOrderFeeUserRoles'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      smallOrderFee: (json['smallOrderFee'] as num?)?.toDouble() ?? 0.0,
      movThreshold: (json['movThreshold'] as num?)?.toDouble() ?? 0.0,
      enableMPSmallOrderFee: json['enableMPSmallOrderFee'] as bool? ?? false,
      mpSmallOrderFeeUserRoles:
          (json['mpSmallOrderFeeUserRoles'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              [],
      mpSmallOrderFee: (json['mpSmallOrderFee'] as num?)?.toDouble() ?? 0.0,
      mpMovThreshold: (json['mpMovThreshold'] as num?)?.toDouble() ?? 0.0,
      orderTypes: (json['orderTypes'] as List<dynamic>?)
              ?.map((e) => SalesOrganisationConfigsOrderTypeDto.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
      authorizedExtSalesRep: (json['authorizedExtSalesRep'] as List<dynamic>?)
              ?.map((e) => ExternalSalesRepresentativeInfoDto.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
      disclaimer: json['disclaimer'] as String? ?? '',
      enableDeliveryOptions: json['enableDeliveryOptions'] as bool? ?? false,
      enableRequestDeliveryDate:
          json['enableRequestDeliveryDate'] as bool? ?? false,
      enableSaturdayUrgentDelivery:
          json['enableSaturdayUrgentDelivery'] as bool? ?? false,
      enableStandardDelivery: json['enableStandardDelivery'] as bool? ?? false,
      enableTodayUrgentDelivery:
          json['enableTodayUrgentDelivery'] as bool? ?? false,
      enableTomorrowUrgentDelivery:
          json['enableTomorrowUrgentDelivery'] as bool? ?? false,
      enableUrgentDelivery: json['enableUrgentDelivery'] as bool? ?? false,
      saturdayDeliveryFee:
          (json['saturdayDeliveryFee'] as num?)?.toDouble() ?? 0.0,
      selectableDeliveryDays:
          (json['selectableDeliveryDays'] as num?)?.toInt() ?? 0,
      standardDeliveryDays:
          (json['standardDeliveryDays'] as num?)?.toInt() ?? 0,
      todayDeliveryFee: (json['todayDeliveryFee'] as num?)?.toDouble() ?? 0.0,
      tomorrowDeliveryFee:
          (json['tomorrowDeliveryFee'] as num?)?.toDouble() ?? 0.0,
      poReferenceLength: (json['poReferenceLength'] as num?)?.toInt() ?? 0,
      referenceNoteLength: (json['referenceNoteLength'] as num?)?.toInt() ?? 0,
      showEZCSTickets: json['showEZCSTickets'] as bool? ?? false,
    );

Map<String, dynamic> _$$SalesOrganisationConfigsDtoImplToJson(
        _$SalesOrganisationConfigsDtoImpl instance) =>
    <String, dynamic>{
      'disableProcessingStatus': instance.disableProcessingStatus,
      'currency': instance.currency,
      'hideCustomer': instance.hideCustomer,
      'enableGimmickMaterial': instance.enableGimmickMaterial,
      'disablePrincipals': instance.disablePrincipals,
      'principalList':
          const _PrincipalListConverter().toJson(instance.principalList),
      'disableOrderType': instance.disableOrderType,
      'enableBatchNumber': instance.enableBatchNumber,
      'disableBundles': instance.disableBundles,
      'enableZDP5': instance.enableZDP5,
      'enableTaxClassification': instance.enableTaxClassification,
      'enableVat': instance.enableVat,
      'vatValue': instance.vatValue,
      'materialWithoutPrice': instance.materialWithoutPrice,
      'enableSpecialInstructions': instance.enableSpecialInstructions,
      'enableReferenceNote': instance.enableReferenceNote,
      'enableCollectiveNumber': instance.enableCollectiveNumber,
      'enableMobileNumber': instance.enableMobileNumber,
      'enableFutureDeliveryDay': instance.enableFutureDeliveryDay,
      'enablePOAttachmentRequired': instance.enablePOAttachmentRequired,
      'enablePaymentTerms': instance.enablePaymentTerms,
      'futureDeliveryDay': instance.futureDeliveryDay,
      'enableGMC': instance.enableGMC,
      'enableListPrice': instance.enableListPrice,
      'enableDefaultMD': instance.enableDefaultMD,
      'priceOverride': instance.priceOverride,
      'disablePaymentTermsDisplay': instance.disablePaymentTermsDisplay,
      'disableDeliveryDate': instance.disableDeliveryDate,
      'enableBillTo': instance.enableBillTo,
      'showPOAttachment': instance.showPOAttachment,
      'expiryDateDisplay': instance.expiryDateDisplay,
      'hideStockDisplay': instance.hideStockDisplay,
      'addOosMaterials': instance.addOosMaterials,
      'oosValue': instance.oosValue,
      'enableRemarks': instance.enableRemarks,
      'enableOHPrice': instance.enableOHPrice,
      'ponRequired': instance.poNumberRequired,
      'enableIRN': instance.enableIRN,
      'enableTaxDisplay': instance.enableTaxDisplay,
      'enableTenderOrders': instance.enableTenderOrders,
      'enableTaxAtTotalLevelOnly': instance.enableTaxAtTotalLevelOnly,
      'netPriceOverride': instance.netPriceOverride,
      'batchNumDisplay': instance.batchNumDisplay,
      'displayOrderDiscount': instance.displayOrderDiscount,
      'minOrderAmount':
          const StringToDoubleConverter().toJson(instance.minOrderAmount),
      'salesOrgCode': instance.salesOrg,
      'enableZDP8Override': instance.enableZDP8Override,
      'disableReturnsAccessSR': instance.disableReturnsAccessSR,
      'disableReturnsAccess': instance.disableReturnsAccess,
      'disableOverrideFieldCustomer': instance.disableOverrideFieldCustomer,
      'disableOverrideFieldSR': instance.disableOverrideFieldSR,
      'enableGreenDelivery': instance.enableGreenDelivery,
      'greenDeliveryDelayInDays': instance.greenDeliveryDelayInDays,
      'enableComboDeals': instance.enableComboDeals,
      'greenDeliveryUserRole': instance.greenDeliveryUserRole,
      'comboDealsUserRole': instance.comboDealsUserRole,
      'enableGMN': instance.enableGMN,
      'displayItemTaxBreakdown': instance.displayItemTaxBreakdown,
      'displaySubtotalTaxBreakdown': instance.displaySubtotalTaxBreakdown,
      'disablePayment': instance.disablePayment,
      'hideCredit': instance.hideCredit,
      'allowReturnsOutsidePolicy': instance.allowReturnsOutsidePolicy,
      'enableMarketPlace': instance.enableMarketPlace,
      'mpMinOrderAmount':
          const StringToDoubleConverter().toJson(instance.mpMinOrderAmount),
      'statementOfAccountEnabled': instance.statementOfAccountEnabled,
      'enableSmallOrderFee': instance.enableSmallOrderFee,
      'smallOrderFeeUserRoles': instance.smallOrderFeeUserRoles,
      'smallOrderFee': instance.smallOrderFee,
      'movThreshold': instance.movThreshold,
      'enableMPSmallOrderFee': instance.enableMPSmallOrderFee,
      'mpSmallOrderFeeUserRoles': instance.mpSmallOrderFeeUserRoles,
      'mpSmallOrderFee': instance.mpSmallOrderFee,
      'mpMovThreshold': instance.mpMovThreshold,
      'orderTypes': instance.orderTypes.map((e) => e.toJson()).toList(),
      'authorizedExtSalesRep':
          instance.authorizedExtSalesRep.map((e) => e.toJson()).toList(),
      'disclaimer': instance.disclaimer,
      'enableDeliveryOptions': instance.enableDeliveryOptions,
      'enableRequestDeliveryDate': instance.enableRequestDeliveryDate,
      'enableSaturdayUrgentDelivery': instance.enableSaturdayUrgentDelivery,
      'enableStandardDelivery': instance.enableStandardDelivery,
      'enableTodayUrgentDelivery': instance.enableTodayUrgentDelivery,
      'enableTomorrowUrgentDelivery': instance.enableTomorrowUrgentDelivery,
      'enableUrgentDelivery': instance.enableUrgentDelivery,
      'saturdayDeliveryFee': instance.saturdayDeliveryFee,
      'selectableDeliveryDays': instance.selectableDeliveryDays,
      'standardDeliveryDays': instance.standardDeliveryDays,
      'todayDeliveryFee': instance.todayDeliveryFee,
      'tomorrowDeliveryFee': instance.tomorrowDeliveryFee,
      'poReferenceLength': instance.poReferenceLength,
      'referenceNoteLength': instance.referenceNoteLength,
      'showEZCSTickets': instance.showEZCSTickets,
    };

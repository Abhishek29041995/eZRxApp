// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderHistoryItemDtoImpl _$$OrderHistoryItemDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderHistoryItemDtoImpl(
      materialNumber: json['materialCode'] as String? ?? '',
      materialDescription: json['materialDescription'] as String? ?? '',
      defaultMaterialDescription:
          json['defaultMaterialDescription'] as String? ?? '',
      qty: (json['qty'] as num?)?.toInt() ?? 0,
      unitPrice: (json['unitPrice'] as num?)?.toDouble() ?? 0.0,
      originPrice: (json['mrp'] as num?)?.toDouble() ?? 0.0,
      totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0.0,
      status: json['status'] as String? ?? '',
      deliveryDate: json['deliveryDate'] as String? ?? '',
      orderNumber: json['orderNumber'] as String? ?? '',
      createdDate:
          JsonReadValueHelper.readCreatedDateTimeValue(json, 'createdDate')
              as String,
      orderBy: json['orderBy'] as String? ?? '',
      orderType: json['orderType'] as String? ?? '',
      isBonusMaterial: json['isBonusMaterial'] as bool? ?? false,
      telephoneNumber: json['telephoneNumber'] as String? ?? '',
      invoiceNumber: json['invoiceNumber'] as String? ?? '',
      pOReference: json['pOReference'] as String? ?? '',
      manufactureName: json['manufactureName'] as String? ?? '',
      governmentMaterialCode: json['governmentMaterialCode'] as String? ?? '',
      itemRegistrationNumber: json['itemRegistrationNumber'] as String? ?? '',
      requestedDeliveryDate: json['requestedDeliveryDate'] as String? ?? '',
      specialInstruction: json['specialInstructions'] as String? ?? '',
      tax: (json['tax'] as num?)?.toDouble() ?? 0.0,
      eZRXNumber: json['eZRXNumber'] as String? ?? '',
      orderHistoryItemPoAttachments: (json['poAttachment'] as List<dynamic>?)
              ?.map((e) => PoDocumentsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      promoStatus: json['promoStatus'] as bool? ?? false,
      isCounterOffer: json['isCounterOffer'] as bool? ?? false,
      isBundle: json['isBundle'] as bool? ?? false,
      lineNumber: json['lineNumber'] as String? ?? '',
      principalCode: json['principalCode'] as String? ?? '',
      hidePrice: json['hidePrice'] as bool? ?? false,
      referenceNotes: json['referenceNotes'] as String? ?? '',
      isMarketPlace:
          JsonReadValueHelper.mappingIsMarketPlace(json, 'isMarketPlace')
                  as bool? ??
              false,
      tenderContractNumber: json['tenderContractNumber'] as String? ?? '',
      tenderContractReference: json['tenderContractReference'] as String? ?? '',
      tenderOrderReason: json['tenderOrderReason'] as String? ?? '',
      tenderPriceUnit: (json['tenderPriceUnit'] as num?)?.toInt() ?? 0,
      tenderPrice: json['tenderPrice'] == null
          ? 0.0
          : const StringToDoubleConverter()
              .fromJson(json['tenderPrice'] as String),
      isTenderExpired: json['isTenderExpire'] as bool? ?? false,
      isCovid: json['isCovid'] as bool? ?? false,
      totalUnitPrice: (json['totalUnitPrice'] as num?)?.toDouble() ?? 0.0,
      totalTax: (json['totalTax'] as num?)?.toDouble() ?? 0.0,
      taxRate:
          (JsonReadValueHelper.handleTax(json, 'taxRate') as num).toDouble(),
      batches: (json['batches'] as List<dynamic>?)
              ?.map((e) => BatchesDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$OrderHistoryItemDtoImplToJson(
        _$OrderHistoryItemDtoImpl instance) =>
    <String, dynamic>{
      'materialCode': instance.materialNumber,
      'materialDescription': instance.materialDescription,
      'defaultMaterialDescription': instance.defaultMaterialDescription,
      'qty': instance.qty,
      'unitPrice': instance.unitPrice,
      'mrp': instance.originPrice,
      'totalPrice': instance.totalPrice,
      'status': instance.status,
      'deliveryDate': instance.deliveryDate,
      'orderNumber': instance.orderNumber,
      'createdDate': instance.createdDate,
      'orderBy': instance.orderBy,
      'orderType': instance.orderType,
      'isBonusMaterial': instance.isBonusMaterial,
      'telephoneNumber': instance.telephoneNumber,
      'invoiceNumber': instance.invoiceNumber,
      'pOReference': instance.pOReference,
      'manufactureName': instance.manufactureName,
      'governmentMaterialCode': instance.governmentMaterialCode,
      'itemRegistrationNumber': instance.itemRegistrationNumber,
      'requestedDeliveryDate': instance.requestedDeliveryDate,
      'specialInstructions': instance.specialInstruction,
      'tax': instance.tax,
      'eZRXNumber': instance.eZRXNumber,
      'poAttachment': instance.orderHistoryItemPoAttachments
          .map((e) => e.toJson())
          .toList(),
      'promoStatus': instance.promoStatus,
      'isCounterOffer': instance.isCounterOffer,
      'isBundle': instance.isBundle,
      'lineNumber': instance.lineNumber,
      'principalCode': instance.principalCode,
      'hidePrice': instance.hidePrice,
      'referenceNotes': instance.referenceNotes,
      'isMarketPlace': instance.isMarketPlace,
      'tenderContractNumber': instance.tenderContractNumber,
      'tenderContractReference': instance.tenderContractReference,
      'tenderOrderReason': instance.tenderOrderReason,
      'tenderPriceUnit': instance.tenderPriceUnit,
      'tenderPrice':
          const StringToDoubleConverter().toJson(instance.tenderPrice),
      'isTenderExpire': instance.isTenderExpired,
      'isCovid': instance.isCovid,
      'totalUnitPrice': instance.totalUnitPrice,
      'totalTax': instance.totalTax,
      'taxRate': instance.taxRate,
      'batches': instance.batches.map((e) => e.toJson()).toList(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_ticket_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubmitTicketDtoImpl _$$SubmitTicketDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$SubmitTicketDtoImpl(
      email: json['email'] as String? ?? '',
      description: json['EZCSTicketDetail'] as String? ?? '',
      priority: (json['priority'] as num?)?.toInt() ?? 0,
      subject: json['subject'] as String? ?? '',
      customFields: json['customField'] == null
          ? SubmitTicketCustomFields.empty
          : SubmitTicketCustomFields.fromJson(
              json['customField'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SubmitTicketDtoImplToJson(
        _$SubmitTicketDtoImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'EZCSTicketDetail': instance.description,
      'priority': instance.priority,
      'subject': instance.subject,
      'customField': instance.customFields.toJson(),
    };

_$SubmitTicketCustomFieldsImpl _$$SubmitTicketCustomFieldsImplFromJson(
        Map<String, dynamic> json) =>
    _$SubmitTicketCustomFieldsImpl(
      soldTo: json['cf_customer_sold_to_account'] as String? ?? '',
      soldToName: json['cf_customer_sold_to_account_name'] as String? ?? '',
      shipTo: json['cf_customer_ship_to_account'] as String? ?? '',
      shipToName: json['cf_customer_ship_to_name'] as String? ?? '',
      ticketCategory: json['cf_cust_category'] as String? ?? '',
      ticketSubCategory:
          json['cf_customer_ticket_type_sub_category'] as String? ?? '',
      orderNumber:
          json['cf_document_invoice_rcn_cn_1_document_only'] as String? ?? '',
      quantityOrdered: json['cf_qty_ordered452506'] as String? ?? '',
      productName: json['cf_product_ordered_description'] as String? ?? '',
      productSku: json['cf_product_sku_codes_must_be_from_same_manufacturer']
              as String? ??
          '',
    );

Map<String, dynamic> _$$SubmitTicketCustomFieldsImplToJson(
        _$SubmitTicketCustomFieldsImpl instance) =>
    <String, dynamic>{
      'cf_customer_sold_to_account': instance.soldTo,
      'cf_customer_sold_to_account_name': instance.soldToName,
      'cf_customer_ship_to_account': instance.shipTo,
      'cf_customer_ship_to_name': instance.shipToName,
      'cf_cust_category': instance.ticketCategory,
      'cf_customer_ticket_type_sub_category': instance.ticketSubCategory,
      'cf_document_invoice_rcn_cn_1_document_only': instance.orderNumber,
      'cf_qty_ordered452506': instance.quantityOrdered,
      'cf_product_ordered_description': instance.productName,
      'cf_product_sku_codes_must_be_from_same_manufacturer':
          instance.productSku,
    };

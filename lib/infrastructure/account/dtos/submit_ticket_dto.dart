import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ezcs_ticket.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_ticket_dto.freezed.dart';
part 'submit_ticket_dto.g.dart';

@freezed
class SubmitTicketDto with _$SubmitTicketDto {
  const SubmitTicketDto._();

  const factory SubmitTicketDto({
    @JsonKey(name: 'email', defaultValue: '') required String email,
    @JsonKey(name: 'EZCSTicketDetail', defaultValue: '')
    required String description,
    @JsonKey(name: 'priority', defaultValue: 0) required int priority,
    @JsonKey(name: 'subject', defaultValue: '') required String subject,
    @Default(SubmitTicketCustomFields.empty)
    @JsonKey(
      name: 'customField',
    )
    SubmitTicketCustomFields customFields,
  }) = _SubmitTicketDto;

  factory SubmitTicketDto.fromDomain({
    required EZCSTicket ezcsTicket,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
  }) {
    return SubmitTicketDto(
      email: ezcsTicket.userEmail,
      description: '${ezcsTicket.chatUrl} ${ezcsTicket.description}',
      priority: ezcsTicket.ticketPriority.apiValue,
      subject: ezcsTicket.subject,
      customFields: SubmitTicketCustomFields(
        soldTo: customerCodeInfo.customerCodeSoldTo,
        soldToName: customerCodeInfo.fullCustomerAddress,
        shipTo: shipToInfo.shipToCustomerCode,
        shipToName: shipToInfo.fullDeliveryAddress,
        ticketCategory: ezcsTicket.customerTicketType.customerTicketTitle,
        ticketSubCategory: ezcsTicket.customerTicketType.isCreditCustomerAccount
            ? ezcsTicket
                .customerTicketSubCategory.customerTicketSubCategoryTitle
            : '',
        orderNumber: ezcsTicket.customerTicketType.isOrderRelated
            ? ezcsTicket.orderNumber
            : '',
        quantityOrdered: ezcsTicket.customerTicketType.isOrderRelated
            ? ezcsTicket.quantityOrdered
            : '',
        productName: ezcsTicket.customerTicketType.isOrderRelated
            ? ezcsTicket.productName
            : '',
        productSku: ezcsTicket.customerTicketType.isOrderRelated
            ? ezcsTicket.productSkuCode
            : '',
      ),
    );
  }
  factory SubmitTicketDto.fromJson(Map<String, dynamic> json) =>
      _$SubmitTicketDtoFromJson(json);
}

@freezed
class SubmitTicketCustomFields with _$SubmitTicketCustomFields {
  const SubmitTicketCustomFields._();

  const factory SubmitTicketCustomFields({
    @JsonKey(name: 'cf_customer_sold_to_account', defaultValue: '')
    required String soldTo,
    @JsonKey(name: 'cf_customer_sold_to_account_name', defaultValue: '')
    required String soldToName,
    @JsonKey(name: 'cf_customer_ship_to_account', defaultValue: '')
    required String shipTo,
    @JsonKey(name: 'cf_customer_ship_to_name', defaultValue: '')
    required String shipToName,
    @JsonKey(name: 'cf_cust_category', defaultValue: '')
    required String ticketCategory,
    @JsonKey(name: 'cf_customer_ticket_type_sub_category', defaultValue: '')
    required String ticketSubCategory,
    @JsonKey(
      name: 'cf_document_invoice_rcn_cn_1_document_only',
      defaultValue: '',
    )
    required String orderNumber,
    @JsonKey(name: 'cf_qty_ordered452506', defaultValue: '')
    required String quantityOrdered,
    @JsonKey(name: 'cf_product_ordered_description', defaultValue: '')
    required String productName,
    @JsonKey(
      name: 'cf_product_sku_codes_must_be_from_same_manufacturer',
      defaultValue: '',
    )
    required String productSku,
  }) = _SubmitTicketCustomFields;

  static const SubmitTicketCustomFields empty = SubmitTicketCustomFields(
    soldTo: '',
    orderNumber: '',
    quantityOrdered: '',
    productName: '',
    productSku: '',
    shipTo: '',
    shipToName: '',
    ticketCategory: '',
    ticketSubCategory: '',
    soldToName: '',
  );

  factory SubmitTicketCustomFields.fromJson(Map<String, dynamic> json) =>
      _$SubmitTicketCustomFieldsFromJson(json);
}

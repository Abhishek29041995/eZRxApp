import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ezcs_ticket.freezed.dart';

@freezed
class EZCSTicket with _$EZCSTicket {
  const EZCSTicket._();

  const factory EZCSTicket({
    required CustomerTicketType customerTicketType,
    required CustomerTicketSubCategoryType customerTicketSubCategory,
    required TicketPriority ticketPriority,
    required String description,
    required String subject,
    required String orderNumber,
    required String productName,
    required String productSkuCode,
    required String quantityOrdered,
    required List<PlatformFile> documents,
    required String userEmail,
    required String chatUrl,
  }) = _EZCSTicket;

  factory EZCSTicket.empty() => EZCSTicket(
        description: '',
        orderNumber: '',
        documents: <PlatformFile>[],
        productName: '',
        productSkuCode: '',
        quantityOrdered: '',
        subject: '',
        ticketPriority: TicketPriority(0),
        customerTicketType: CustomerTicketType(''),
        customerTicketSubCategory: CustomerTicketSubCategoryType(''),
        userEmail: '',
        chatUrl: '',
      );
}

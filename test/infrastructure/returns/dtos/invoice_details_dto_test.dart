import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/invoice_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item_details.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/invoice_details_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  final invoiceDetailsDto = InvoiceDetailsDto.fromDomain(
    InvoiceDetails.empty().copyWith(
      invoiceNumber: 'fake-number',
      returnItemDetailsList: [
        ReturnItemDetails.empty().copyWith(
          batch: '',
          itemNumber: '',
          materialNumber: MaterialNumber('123'),
          uploadedFiles: <PoDocuments>[],
          returnQuantity: ReturnQuantity('1'),
          returnReason: 'fake-reason',
        ),
      ],
      salesOrg: SalesOrg('fake-salesOrg'),
    ),
  );

  group('Invoice Details dto test', () {
    setUp(() async {
      data = {
        'invoiceNumber': 'fake-number',
        'salesOrg': 'fake-salesOrg',
        'materials': [
          {
            'returnQuantity': 1,
            'materialNumber': '123',
            'lineNumber': '',
            'batch': '',
            'returnReason': 'fake-reason',
            'url': [],
            'returnType': '500',
            'remarks': '',
            'outsidePolicy': false,
            'priceOverride': '',
          }
        ],
      };
    });
    test('=> Invoice Details  fromDomain', () {
      final invoiceDetails = invoiceDetailsDto.toJson();

      expect(invoiceDetails, data);
    });

    test('=> Invoice Details  fromJson', () {
      final invoiceDetails =
          InvoiceDetailsDto.fromJson(invoiceDetailsDto.toJson());

      expect(invoiceDetails, invoiceDetailsDto);
    });
  });
}

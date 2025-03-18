import 'dart:convert';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/customer_document_detail_dto.dart';
import 'package:flutter/services.dart';

class CreditAndInvoiceDetailsLocalDataSource {
  CreditAndInvoiceDetailsLocalDataSource();

  Future<List<CustomerDocumentDetail>> getCreditAndInvoiceDetails() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/customer_document_details/customerDocumentDetailsResponse.json',
      ),
    );
    final details = data['data']['customerDocumentDetails'];
    final result = <CustomerDocumentDetail>[];
    for (final dynamic detail in details) {
      result.add(CustomerDocumentDetailDto.fromJson(detail).toDomain());
    }

    return result;
  }
}

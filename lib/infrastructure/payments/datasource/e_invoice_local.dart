import 'dart:convert';

import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/e_credit_invoice_dto.dart';
import 'package:flutter/services.dart';

class EInvoiceLocalDataSource {
  EInvoiceLocalDataSource();

//Because DCM code duplication check code structure, but here we difference assets path so we ignore it
//ignore: code-duplication
  Future<DownloadPaymentAttachment> getEInvoice() async {
    final res = json.decode(
      await rootBundle.loadString(
        'assets/json/common/listSoaResponse.json',
      ),
    );
    final data = res['data'].first;

    return ECreditInvoiceDto.fromJson(data).toDomain();
  }
}

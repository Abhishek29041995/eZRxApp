import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';

import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';

import 'package:ezrxmobile/infrastructure/payments/datasource/download_payment_attachment_query.dart';

import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';

import 'package:ezrxmobile/infrastructure/payments/dtos/download_payment_attachment_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/e_credit_invoice_dto.dart';

class DownloadPaymentAttachmentRemoteDataSource {
  HttpService httpService;
  DownloadPaymentAttachmentQuery downloadPaymentAttachmentQuery;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;
  DownloadPaymentAttachmentRemoteDataSource({
    required this.httpService,
    required this.downloadPaymentAttachmentQuery,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<DownloadPaymentAttachment> getFileDownloadUrl({
    required String salesOrg,
    required String customerCode,
    required String excelFor,
    required List<Map<String, dynamic>> queryObject,
    required bool isMarketPlace,
  }) async {
    final queryData = downloadPaymentAttachmentQuery.getFileUrl();
    final request = {
      'salesOrg': salesOrg,
      'customerCode': customerCode,
      'filterBy': queryObject,
      'excelFor': excelFor,
      'orderBy': [
        {
          'order': 'desc',
          'field': 'documentDate',
        },
      ],
      if (isMarketPlace) 'isMarketPlace': isMarketPlace,
    };
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query': queryData,
          'variables': {
            'input': request,
          },
        },
      ),
    );
    dataSourceExceptionHandler.handleExceptionChecker(res: res);
    final data = res.data['data']['customerDocumentHeaderExcel'];

    return DownloadPaymentAttachmentDto.fromJson(data).toDomain();
  }

  Future<DownloadPaymentAttachment> getPaymentSummaryFileDownloadUrl({
    required String salesOrg,
    required String customerCode,
    required List<Map<String, dynamic>> filterBy,
    required bool isMarketPlace,
  }) async {
    final queryData = downloadPaymentAttachmentQuery.getPaymentSummaryFileUrl();
    final request = {
      'salesOrg': salesOrg,
      'customerCode': customerCode,
      'filterBy': filterBy,
      if (isMarketPlace) 'isMarketPlace': isMarketPlace,
    };
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query': queryData,
          'variables': {
            'request': request,
          },
        },
      ),
    );
    dataSourceExceptionHandler.handleExceptionChecker(res: res);
    final data = res.data['data']['customerPaymentExcel'];

    return DownloadPaymentAttachmentDto.fromJson(data).toDomain();
  }

  Future<AttachmentFileBuffer> fileDownload(
    String fileUrl,
  ) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '/api/payment/downloads',
        data: {'url': fileUrl},
        responseType: ResponseType.bytes,
      );
      dataSourceExceptionHandler.handleExceptionChecker(
        res: res,
        additionalCondition: res.data is List && res.data.isEmpty,
      );

      return AttachmentFileBuffer(
        name: Uri.parse(fileUrl).pathSegments.last,
        buffer: res.data,
      );
    });
  }

  Future<DownloadPaymentAttachment> getECreditDownloadUrl({
    required String eCreditNumber,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}payment/listEcn',
      data: jsonEncode(
        {'ecn_number': eCreditNumber},
      ),
    );
    dataSourceExceptionHandler.handleExceptionChecker(res: res);

    if (res.data['data'] == null || res.data['data'].isEmpty) {
      return DownloadPaymentAttachment.empty();
    }

    return ECreditInvoiceDto.fromJson(res.data['data'][0]).toDomain();
  }

  Future<AttachmentFileBuffer> soaDownload(
    String fileUrl,
  ) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}payment/downloadSoa',
        data: {'url': fileUrl},
        responseType: ResponseType.bytes,
      );
       dataSourceExceptionHandler.handleExceptionChecker(
        res: res,
        additionalCondition: res.data is List && res.data.isEmpty,
      );

      return AttachmentFileBuffer(
        name: Uri.parse(fileUrl).pathSegments.last,
        buffer: res.data,
      );
    });
  }

  Future<AttachmentFileBuffer> eInvoiceDownload(
    String fileUrl,
  ) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}payment/downloadEcn',
        data: {'url': fileUrl},
        responseType: ResponseType.bytes,
      );
      dataSourceExceptionHandler.handleExceptionChecker(
        res: res,
        additionalCondition: res.data is List && res.data.isEmpty,
      );

      return AttachmentFileBuffer(
        name: Uri.parse(fileUrl).pathSegments.last,
        buffer: res.data,
      );
    });
  }
}

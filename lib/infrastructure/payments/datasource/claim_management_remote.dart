import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/payments/entities/claim_item.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/claim_management_query_mutation.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/claim_item_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/principal_code_dto.dart';

class ClaimManagementRemoteDataSource {
  HttpService httpService;
  ClaimManagementQueryMutation claimManagementQueryMutation;
  DataSourceExceptionHandler dataSourceExceptionHandler;
  Config config;

  ClaimManagementRemoteDataSource({
    required this.httpService,
    required this.claimManagementQueryMutation,
    required this.dataSourceExceptionHandler,
    required this.config,
  });

  Future<List<ClaimItem>> getClaimSubmissions({required String email}) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}ezpay',
      data: jsonEncode(
        {
          'query': claimManagementQueryMutation.getClaimList(),
          'variables': {
            'input': {
              'email': email,
            },
          },
        },
      ),
    );
    dataSourceExceptionHandler.handleExceptionChecker(res: res);
    final result = <ClaimItem>[];
    final data = res.data['data']['getClaimList'];
    for (final dynamic element in data) {
      result.add(ClaimItemDto.fromJson(element).toDomain());
    }

    return result;
  }

  Future<bool> submitClaim({
    required List<MultipartFile> files,
    required String claimAmount,
    required String claimType,
    required String customerCode,
    required String claimDetail,
    required String principalCode,
    required String principalName,
    required String email,
  }) async {
    final formData = FormData();
    formData.fields.add(
      MapEntry(
        'operations',
        jsonEncode({
          'query': claimManagementQueryMutation.submitClaim(),
          'variables': {
            'submitInput': {
              'claimAmount': claimAmount,
              'claimType': claimType,
              'customerCode': customerCode,
              'claimDetail': claimDetail,
              'principalCode': principalCode,
              'principalName': principalName,
              'email': email,
              'attachments': List.generate(
                files.length,
                (_) => null,
              ),
            },
          },
        }),
      ),
    );
    final fileMap = <String, List<String>>{};

    for (var i = 0; i < files.length; i++) {
      fileMap['$i'] = ['variables.submitInput.attachments.$i'];
      formData.files.add(MapEntry('$i', files[i]));
    }
    formData.fields.add(MapEntry('map', jsonEncode(fileMap)));

    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}claims',
      data: formData,
    );
    dataSourceExceptionHandler.handleExceptionChecker(res: res);
    final data = res.data;

    return data['data']['submitClaim']['success'];
  }

  Future<List<PrincipalData>> getPrincipalForSalesOrg({
    required String salesOrg,
  }) async {
    final res = await httpService.request(
      method: 'POST',
      url: '${config.urlConstants}license',
      data: jsonEncode(
        {
          'query': claimManagementQueryMutation.getPrincipalForSalesOrg(),
          'variables': {
            'salesOrg': salesOrg,
          },
        },
      ),
    );
    dataSourceExceptionHandler.handleExceptionChecker(res: res);
    final result = <PrincipalData>[];
    final data = res.data['data']['principalForSalesOrg']['principals'];
    for (final dynamic element in data) {
      result.add(PrincipalCodeDto.fromJson(element).toDomain());
    }

    return result;
  }
}

import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/payments/entities/claim_item.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/claim_item_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/principal_code_dto.dart';
import 'package:flutter/services.dart';

class ClaimManagementLocalDataSource {
  ClaimManagementLocalDataSource();

  Future<List<ClaimItem>> getClaimSubmissions() async {
    final res = json.decode(
      await rootBundle.loadString(
        'assets/json/get_claim_submissions/getClaimSubmissionsResponse.json',
      ),
    );

    final result = <ClaimItem>[];
    final data = res['data']['getClaimList'];
    for (final dynamic item in data) {
      result.add(ClaimItemDto.fromJson(item).toDomain());
    }

    return result;
  }

  Future<List<PrincipalData>> getPrincipalForSalesOrg() async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/principal_sales_org/principalForSalesOrgResponse.json',
      ),
    );
    final res = data['data']['principalForSalesOrg']['principals'];
    final result = <PrincipalData>[];
    for (final dynamic element in res) {
      result.add(PrincipalCodeDto.fromJson(element).toDomain());
    }

    return result;
  }

  Future<bool> submitClaim() async {
    final res = json.decode(
      await rootBundle.loadString(
        'assets/json/submit_claim/submitClaimResponse.json',
      ),
    );

    return res['data']['submitClaim']['success'];
  }
}

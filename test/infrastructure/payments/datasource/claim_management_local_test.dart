import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/payments/entities/claim_item.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/claim_management_local.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/claim_item_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/principal_code_dto.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ClaimManagementLocalDataSource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = ClaimManagementLocalDataSource();
    },
  );

  group(
    'Claim management Local Datasource Test',
    () {
      test(
        'get Claim Submissions',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/get_claim_submissions/getClaimSubmissionsResponse.json',
            ),
          );
          final result = await localDataSource.getClaimSubmissions();

          final expectResult = <ClaimItem>[];
          for (final dynamic item in res['data']['getClaimList']) {
            expectResult.add(ClaimItemDto.fromJson(item).toDomain());
          }

          expect(
            result,
            expectResult,
          );
        },
      );

      test(
        'get Principal For SalesOrg',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/principal_sales_org/principalForSalesOrgResponse.json',
            ),
          );
          final result = await localDataSource.getPrincipalForSalesOrg();

          final expectResult = <PrincipalData>[];
          for (final dynamic element in (res['data']['principalForSalesOrg']
              ['principals'])) {
            expectResult.add(PrincipalCodeDto.fromJson(element).toDomain());
          }

          expect(
            result,
            expectResult,
          );
        },
      );

      test(
        'submit Claim',
        () async {
          final res = json.decode(
            await rootBundle.loadString(
              'assets/json/submit_claim/submitClaimResponse.json',
            ),
          );
          final result = await localDataSource.submitClaim();

          expect(
            result,
            res['data']['submitClaim']['success'],
          );
        },
      );
    },
  );
}

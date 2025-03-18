import 'dart:convert';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/claim_item_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;

  group('=> Claim Item dto ', () {
    setUp(() async {
      final listData = json.decode(
        await rootBundle.loadString(
          'assets/json/get_claim_submissions/getClaimSubmissionsResponse.json',
        ),
      );
      data = listData['data']['getClaimList'][0];
    });

    test('=> ClaimItemDto fromJson and toDomain', () {
      final claimItem = ClaimItemDto.fromJson(
        data,
      ).toDomain();

      expect(claimItem.createdAt, DateTimeStringValue('2024-07-18T08:27:49Z'));
      expect(claimItem.id, 66618);
      expect(claimItem.amount, 100);
      expect(claimItem.principalCode, 100415);
      expect(claimItem.principalName, 'ALLERGAN  BOTOX');
      expect(claimItem.claimType, ClaimType(7));
    });
  });
}

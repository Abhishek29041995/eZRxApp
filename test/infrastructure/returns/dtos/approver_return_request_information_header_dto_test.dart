import 'dart:convert';

import 'package:ezrxmobile/domain/returns/entities/return_request_information_header.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/request_information_header_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;

  group('Approver return request information header dto ', () {
    setUp(() async {
      data = json.decode(
        await rootBundle.loadString(
          'assets/json/return_request_information_v2/returnRequestInformationV2Response.json',
        ),
      );
    });
    test('=> Approver return request information header', () {
      final approverReturnRequestInformationHeader =
          RequestInformationHeaderDto.fromJson(
        data['data']['requestInformationV2']['requestHeader'],
      ).toDomain();
      expect(
        approverReturnRequestInformationHeader,
        isA<ReturnRequestInformationHeader>(),
      );
    });
  });
}

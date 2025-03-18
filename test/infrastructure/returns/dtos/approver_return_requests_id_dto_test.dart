import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_requests_id_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('Approver return request information header dto ', () {
    test(
        '=> Approver return request ApproverReturnRequestsIdDto fromJson valid requestId',
        () {
      final approverReturnRequestsId =
          ReturnRequestsIdDto.fromJson({'requestId': 'fake-Id'});
      expect(approverReturnRequestsId.requestId, 'fake-Id');
      expect(approverReturnRequestsId.isValidRequestId, true);
    });

    test(
        '=> Approver return request ApproverReturnRequestsIdDto fromJson not valid requestId',
        () {
      final approverReturnRequestsId =
          ReturnRequestsIdDto.fromJson({'requestId': ''});
      expect(approverReturnRequestsId.requestId, '');
      expect(approverReturnRequestsId.isValidRequestId, false);
    });

    test(
        '=> Approver return request ApproverReturnRequestsIdDto fromJson valid requestId',
        () {
      final approverReturnRequestsId =
          ReturnRequestsIdDto.fromJson({'requestId': 'fake-Id'}).toDomain();
      expect(
        approverReturnRequestsId,
        ReturnRequestsId(requestId: 'fake-Id'),
      );
    });
  });
}

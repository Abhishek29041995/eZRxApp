import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item_details.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_item_details_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late ReturnItemDetails fakeData;

  group('Test Return Item Details dto ', () {
    setUp(() {
      fakeData = ReturnItemDetails.empty().copyWith(
        materialNumber: MaterialNumber('fakeMaterialNumber'),
        itemNumber: 'fakeItemNumber',
        assignmentNumber: 'fakeAssignmentNumber',
        batch: 'fakeBatch',
        returnQuantity: ReturnQuantity('1'),
        remarks: Remarks('fakeRemarks'),
        priceOverride: CounterOfferValue('2'),
        returnReason: 'fakeReturnReason',
      );
    });

    test('=> Return Item Details fromDomain', () {
      final data = ReturnItemDetailsDto.fromDomain(
        fakeData,
      );
      expect(data.returnReason, 'fakeReturnReason');
    });
  });
}

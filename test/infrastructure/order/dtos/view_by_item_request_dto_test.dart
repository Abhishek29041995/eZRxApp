import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_request.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/view_by_item_request_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../common_mock_data/customer_code_mock.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('Test view by item dto -', () {
    group('Shipping info', () {
      test('Test fromDomain if shipTo is empty', () {
        final viewByItemsRequest = ViewByItemRequest.empty();

        final variable = ViewByItemRequestDto.fromDomain(viewByItemsRequest);

        expect(variable.shipTo, []);
      });

      test('Test fromDomain if shipTo is not empty', () {
        final viewByItemsRequest = ViewByItemRequest.empty().copyWith(
          shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
        );

        final variable = ViewByItemRequestDto.fromDomain(viewByItemsRequest);

        expect(variable.shipTo, [fakeShipToInfo.shipToCustomerCode]);
      });
    });

    group('Order type', () {
      test('fromDomain when order type is All', () {
        final request = ViewByItemRequest.empty()
            .copyWith
            .viewByItemFilter(orderHistoryType: MaterialOriginFilter.all());

        final variable = ViewByItemRequestDto.fromDomain(request);

        expect(variable.orderType, null);
      });

      test('fromDomain when order type is ZP items', () {
        final request = ViewByItemRequest.empty()
            .copyWith
            .viewByItemFilter(orderHistoryType: MaterialOriginFilter.zp());

        final variable = ViewByItemRequestDto.fromDomain(request);

        expect(variable.orderType, 2);
      });

      test('fromDomain when order type is MP items', () {
        final request = ViewByItemRequest.empty()
            .copyWith
            .viewByItemFilter(orderHistoryType: MaterialOriginFilter.mp());

        final variable = ViewByItemRequestDto.fromDomain(request);

        expect(variable.orderType, 1);
      });
    });
  });
}

import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/view_by_order_filter_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('Test view by item dto Order type -', () {
    test('fromDomain when order type is All', () {
      final request = ViewByOrdersFilter.empty()
          .copyWith(orderHistoryType: MaterialOriginFilter.all());

      final variable = ViewByOrdersFilterDto.fromDomain(request);

      expect(variable.orderType, null);
    });

    test('fromDomain when order type is MP items', () {
      final request = ViewByOrdersFilter.empty()
          .copyWith(orderHistoryType: MaterialOriginFilter.mp());

      final variable = ViewByOrdersFilterDto.fromDomain(request);

      expect(variable.orderType, 1);
    });

    test('fromDomain when order type is ZP items', () {
      final request = ViewByOrdersFilter.empty()
          .copyWith(orderHistoryType: MaterialOriginFilter.zp());

      final variable = ViewByOrdersFilterDto.fromDomain(request);

      expect(variable.orderType, 2);
    });
  });
}

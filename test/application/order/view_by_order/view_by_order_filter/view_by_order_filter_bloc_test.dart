import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_filter/view_by_order_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../common_mock_data/sales_organsiation_mock.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final currentDate = DateTime.now();
  final fakeStartDate = currentDate.subtract(const Duration(days: 60));
  final fakeEndDate = currentDate;
  final fakeStatus = StatusType('fakeStatus');

  DateTimeStringValue parsedDateTime(DateTime date) => DateTimeStringValue(
        getDateStringByDateTime(date),
      );

  group('View By Order Filter Bloc', () {
    blocTest(
      'initialized',
      build: () => ViewByOrderFilterBloc(),
      act: (ViewByOrderFilterBloc bloc) {
        bloc.add(
          ViewByOrderFilterEvent.initialized(
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        );
      },
      expect: () => [
        ViewByOrderFilterState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
        ),
      ],
    );
    blocTest(
      'Set Date Range',
      build: () => ViewByOrderFilterBloc(),
      act: (ViewByOrderFilterBloc bloc) {
        bloc.add(
          ViewByOrderFilterEvent.setDateRange(
            DateTimeRange(start: fakeStartDate, end: fakeEndDate),
          ),
        );
      },
      expect: () => [
        ViewByOrderFilterState.initial().copyWith.filter(
              orderDateFrom: parsedDateTime(fakeStartDate),
              orderDateTo: parsedDateTime(fakeEndDate),
            ),
      ],
    );

    blocTest(
      'Update current filter',
      build: () => ViewByOrderFilterBloc(),
      act: (ViewByOrderFilterBloc bloc) {
        bloc.add(
          ViewByOrderFilterEvent.updateCurrentFilter(
            currentFilter: ViewByOrdersFilter.empty()
                .copyWith(orderDateFrom: parsedDateTime(fakeStartDate)),
          ),
        );
      },
      expect: () => [
        ViewByOrderFilterState.initial().copyWith.filter(
              orderDateFrom: parsedDateTime(fakeStartDate),
            ),
      ],
    );

    blocTest<ViewByOrderFilterBloc, ViewByOrderFilterState>(
      'Test Set Order history type view by order',
      build: () => ViewByOrderFilterBloc(),
      seed: () => ViewByOrderFilterState.initial().copyWith.filter(
            orderHistoryType: MaterialOriginFilter.zp(),
          ),
      act: (bloc) => bloc.add(
        ViewByOrderFilterEvent.setOrderHistoryType(
          type: MaterialOriginFilter.mp(),
        ),
      ),
      expect: () => [
        ViewByOrderFilterState.initial().copyWith.filter(
              orderHistoryType: MaterialOriginFilter.mp(),
            ),
      ],
    );

    blocTest(
      'Add order status',
      build: () => ViewByOrderFilterBloc(),
      act: (ViewByOrderFilterBloc bloc) {
        bloc.add(
          ViewByOrderFilterEvent.setOrderStatus(
            status: fakeStatus,
            value: true,
          ),
        );
      },
      expect: () => [
        ViewByOrderFilterState.initial().copyWith.filter(
          orderStatusList: [fakeStatus],
        ),
      ],
    );

    blocTest(
      'Remove order status',
      build: () => ViewByOrderFilterBloc(),
      seed: () => ViewByOrderFilterState.initial().copyWith.filter(
        orderStatusList: [fakeStatus],
      ),
      act: (ViewByOrderFilterBloc bloc) {
        bloc.add(
          ViewByOrderFilterEvent.setOrderStatus(
            status: fakeStatus,
            value: false,
          ),
        );
      },
      expect: () => [ViewByOrderFilterState.initial()],
    );

    test('Get order status list in ID market', () {
      final eligibilityState = EligibilityState.initial().copyWith(
        salesOrganisation: fakeIDSalesOrganisation,
      );
      final idMarketStatusList = [
        StatusType('Order received'),
        StatusType('Order created'),
        StatusType('Picking in progress'),
        StatusType('Out for delivery'),
        StatusType('Delivered'),
        StatusType('Cancelled'),
      ];

      expect(
        eligibilityState.salesOrg.orderHistoryFilterStatusList,
        idMarketStatusList,
      );
    });

    test('Get order status list in other market', () {
      final eligibilityState = EligibilityState.initial().copyWith(
        salesOrganisation: fakeMYSalesOrganisation,
      );
      final myMarketStatusList = <StatusType>[
        StatusType('Order created'),
        StatusType('Picking in progress'),
        StatusType('Out for delivery'),
        StatusType('Delivered'),
        StatusType('Cancelled'),
        StatusType('Pending release'),
        StatusType('Order packed and ready for delivery'),
        StatusType('Failed'),
        StatusType('In Queue'),
      ];

      expect(
        eligibilityState.salesOrg.orderHistoryFilterStatusList,
        myMarketStatusList,
      );
    });
  });
}

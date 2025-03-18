import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_filter/view_by_item_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final fakeStartDate = DateTime.parse(
    DateFormat(DateTimeFormatString.apiDateFormat).format(
      DateTime.now().subtract(
        const Duration(days: 9),
      ),
    ),
  );
  final fakeEndDate = DateTime.parse(
    DateFormat(DateTimeFormatString.apiDateFormat).format(DateTime.now()),
  );

  final viewByItemFilterState = ViewByItemFilterState.initial();

  group(
    'Order View By Item Filter Bloc',
    () {
      blocTest<ViewByItemFilterBloc, ViewByItemFilterState>(
        'Test Initialized',
        build: () => ViewByItemFilterBloc(),
        act: (bloc) => bloc.add(
          const ViewByItemFilterEvent.initialize(),
        ),
        expect: () => [viewByItemFilterState],
      );

      blocTest<ViewByItemFilterBloc, ViewByItemFilterState>(
        'Test Set Order Date',
        build: () => ViewByItemFilterBloc(),
        act: (bloc) => bloc.add(
          ViewByItemFilterEvent.setOrderDate(
            dateRange: DateTimeRange(
              start: fakeStartDate,
              end: fakeEndDate,
            ),
          ),
        ),
        expect: () => [
          viewByItemFilterState.copyWith(
            filter: ViewByItemFilter.empty().copyWith(
              orderDateFrom: DateTimeStringValue(
                getDateStringByDateTime(fakeStartDate),
              ),
              orderDateTo: DateTimeStringValue(
                getDateStringByDateTime(fakeEndDate),
              ),
            ),
          ),
        ],
      );

      blocTest<ViewByItemFilterBloc, ViewByItemFilterState>(
        'Test Set Order Status Selections',
        build: () => ViewByItemFilterBloc(),
        act: (bloc) {
          bloc.add(
            ViewByItemFilterEvent.setOrderStatus(
              status: StatusType('Order created'),
              value: true,
            ),
          );
          bloc.add(
            ViewByItemFilterEvent.setOrderStatus(
              status: StatusType('Picking in progress'),
              value: true,
            ),
          );
        },
        expect: () => [
          viewByItemFilterState.copyWith(
            filter: ViewByItemFilter.empty().copyWith(
              orderStatusList: <StatusType>[
                StatusType('Order created'),
              ],
            ),
          ),
          viewByItemFilterState.copyWith(
            filter: ViewByItemFilter.empty().copyWith(
              orderStatusList: <StatusType>[
                StatusType('Order created'),
                StatusType('Picking in progress'),
              ],
            ),
          ),
        ],
      );

      blocTest<ViewByItemFilterBloc, ViewByItemFilterState>(
        'Test Set Order history type',
        build: () => ViewByItemFilterBloc(),
        seed: () => viewByItemFilterState.copyWith.filter(
              orderHistoryType: MaterialOriginFilter.zp(),
            ),
        act: (bloc) => bloc.add(
          ViewByItemFilterEvent.setOrderHistoryType(
            type: MaterialOriginFilter.mp(),
          ),
        ),
        expect: () => [
          viewByItemFilterState.copyWith.filter(
            orderHistoryType: MaterialOriginFilter.mp(),
          ),
        ],
      );

      blocTest<ViewByItemFilterBloc, ViewByItemFilterState>(
        'Test Set Order Status De-Selections',
        build: () => ViewByItemFilterBloc(),
        act: (bloc) {
          bloc.add(
            ViewByItemFilterEvent.setOrderStatus(
              status: StatusType('Picking in progress'),
              value: false,
            ),
          );
        },
        seed: () => viewByItemFilterState.copyWith(
          filter: ViewByItemFilter.empty().copyWith(
            orderStatusList: <StatusType>[
              StatusType('Order created'),
              StatusType('Picking in progress'),
            ],
          ),
        ),
        expect: () => [
          viewByItemFilterState.copyWith(
            filter: ViewByItemFilter.empty().copyWith(
              orderStatusList: <StatusType>[
                StatusType('Order created'),
              ],
            ),
          ),
        ],
      );

      blocTest<ViewByItemFilterBloc, ViewByItemFilterState>(
        'Test Reset Filter To Last Applied',
        build: () => ViewByItemFilterBloc(),
        act: (bloc) {
          bloc.add(
            ViewByItemFilterEvent.resetFiltersToLastApplied(
              lastAppliedFilter: ViewByItemFilter.empty().copyWith(
                orderStatusList: <StatusType>[
                  StatusType('Order created'),
                  StatusType('Picking in progress'),
                ],
                orderDateFrom: DateTimeStringValue(
                  getDateStringByDateTime(fakeStartDate),
                ),
                orderDateTo: DateTimeStringValue(
                  getDateStringByDateTime(fakeEndDate),
                ),
              ),
            ),
          );
        },
        expect: () => [
          viewByItemFilterState.copyWith(
            filter: ViewByItemFilter.empty().copyWith(
              orderStatusList: <StatusType>[
                StatusType('Order created'),
                StatusType('Picking in progress'),
              ],
              orderDateFrom: DateTimeStringValue(
                getDateStringByDateTime(fakeStartDate),
              ),
              orderDateTo: DateTimeStringValue(
                getDateStringByDateTime(fakeEndDate),
              ),
            ),
          ),
        ],
      );

      test(
        'Test emptyViewByItemFilter',
        () {
          final getEmptyViewByItemFilter =
              viewByItemFilterState.emptyViewByItemFilter;
          expect(
            getEmptyViewByItemFilter,
            ViewByItemFilter.empty(),
          );
        },
      );

      blocTest(
        'Test reset Filter',
        build: () => ViewByItemFilterBloc(),
        act: (bloc) => bloc.add(const ViewByItemFilterEvent.resetFilter()),
        expect: () => [viewByItemFilterState],
      );
    },
  );
}

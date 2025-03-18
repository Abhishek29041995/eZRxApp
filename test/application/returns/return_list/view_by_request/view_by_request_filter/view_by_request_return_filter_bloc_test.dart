import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/view_by_request_filter/view_by_request_return_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  late ReturnFilter returnFilter;
  final fakeToDate = DateTime.parse(
    DateFormat('yyyyMMdd').format(
      DateTime.now(),
    ),
  );

  final fakeFromDate = DateTime.parse(
    DateFormat('yyyyMMdd').format(
      DateTime.now().subtract(
        const Duration(days: 28),
      ),
    ),
  );
  final dateTimeRange = DateTimeRange(
    start: fakeFromDate,
    end: fakeToDate,
  );
  const amountFrom = '100';
  const amountTo = '500';

  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    returnFilter = ReturnFilter.empty().copyWith(
      returnDateFrom: DateTimeStringValue(
        getDateStringByDateTime(fakeFromDate),
      ),
      returnDateTo: DateTimeStringValue(
        getDateStringByDateTime(fakeToDate),
      ),
    );
  });

  group(
    'Return Summary Filter Bloc',
    () {
      blocTest(
        'Initialize',
        build: () => ViewByRequestReturnFilterBloc(),
        act: (ViewByRequestReturnFilterBloc bloc) => bloc.add(
          const ViewByRequestReturnFilterEvent.initialize(),
        ),
        expect: () => [
          ViewByRequestReturnFilterState.initial(),
        ],
      );

      blocTest(
        'set Return Date',
        build: () => ViewByRequestReturnFilterBloc(),
        act: (ViewByRequestReturnFilterBloc bloc) {
          bloc.add(
            ViewByRequestReturnFilterEvent.setReturnDate(
              returnDateRange: dateTimeRange,
            ),
          );
        },
        expect: () => [
          ViewByRequestReturnFilterState.initial().copyWith(
            filter: ReturnFilter.empty().copyWith(
              returnDateFrom: DateTimeStringValue(
                getDateStringByDateTime(fakeFromDate),
              ),
              returnDateTo: DateTimeStringValue(
                getDateStringByDateTime(fakeToDate),
              ),
            ),
          ),
        ],
      );

      blocTest(
        'set Amount From',
        build: () => ViewByRequestReturnFilterBloc(),
        act: (ViewByRequestReturnFilterBloc bloc) {
          bloc.add(
            const ViewByRequestReturnFilterEvent.setAmountFrom(
              amountFrom: amountFrom,
            ),
          );
        },
        expect: () => [
          ViewByRequestReturnFilterState.initial().copyWith(
            filter: ReturnFilter.empty().copyWith(
              amountValueFrom: RangeValue(amountFrom),
            ),
          ),
        ],
      );

      blocTest(
        'set Amount To',
        build: () => ViewByRequestReturnFilterBloc(),
        act: (ViewByRequestReturnFilterBloc bloc) {
          bloc.add(
            const ViewByRequestReturnFilterEvent.setAmountTo(
              amountTo: amountTo,
            ),
          );
        },
        expect: () => [
          ViewByRequestReturnFilterState.initial().copyWith(
            filter: ReturnFilter.empty().copyWith(
              amountValueTo: RangeValue(amountTo),
            ),
          ),
        ],
      );

      blocTest(
        'set return type',
        build: () => ViewByRequestReturnFilterBloc(),
        act: (ViewByRequestReturnFilterBloc bloc) {
          bloc.add(
            ViewByRequestReturnFilterEvent.setReturnType(
              type: MaterialOriginFilter.mp(),
            ),
          );
        },
        expect: () => [
          ViewByRequestReturnFilterState.initial().copyWith(
            filter: ReturnFilter.empty().copyWith(
              materialOriginFilter: MaterialOriginFilter.mp(),
            ),
          ),
        ],
      );

      blocTest(
        'set Return Status to REVIEWED',
        build: () => ViewByRequestReturnFilterBloc(),
        seed: () => ViewByRequestReturnFilterState.initial()
            .copyWith(filter: returnFilter),
        act: (ViewByRequestReturnFilterBloc bloc) {
          bloc.add(
            ViewByRequestReturnFilterEvent.setReturnStatus(
              value: true,
              status: StatusType('REVIEWED'),
            ),
          );
        },
        expect: () => [
          ViewByRequestReturnFilterState.initial().copyWith(
            filter: returnFilter
                .copyWith(returnStatusList: [StatusType('REVIEWED')]),
          ),
        ],
      );
      blocTest(
        'remove Return Status REVIEWED',
        build: () => ViewByRequestReturnFilterBloc(),
        act: (ViewByRequestReturnFilterBloc bloc) {
          bloc.add(
            ViewByRequestReturnFilterEvent.setReturnStatus(
              value: false,
              status: StatusType('REVIEWED'),
            ),
          );
        },
        expect: () => [
          ViewByRequestReturnFilterState.initial().copyWith(
            filter: ReturnFilter.empty().copyWith(returnStatusList: []),
          ),
        ],
      );

      blocTest(
        'update filter to last applied',
        build: () => ViewByRequestReturnFilterBloc(),
        seed: () => ViewByRequestReturnFilterState.initial(),
        act: (ViewByRequestReturnFilterBloc bloc) {
          bloc.add(
            ViewByRequestReturnFilterEvent.updateFilterToLastApplied(
              lastAppliedFilter: returnFilter,
            ),
          );
        },
        expect: () => [
          ViewByRequestReturnFilterState.initial().copyWith(
            filter: returnFilter,
            showErrorMessage: false,
          ),
        ],
      );

      blocTest(
        'set validation failure',
        build: () => ViewByRequestReturnFilterBloc(),
        act: (ViewByRequestReturnFilterBloc bloc) {
          bloc.add(
            const ViewByRequestReturnFilterEvent.setValidationFailure(),
          );
        },
        expect: () => [
          ViewByRequestReturnFilterState.initial().copyWith(
            showErrorMessage: false,
          ),
        ],
      );

      blocTest(
        'reset filter',
        build: () => ViewByRequestReturnFilterBloc(),
        act: (ViewByRequestReturnFilterBloc bloc) {
          bloc.add(
            const ViewByRequestReturnFilterEvent.resetFilters(),
          );
        },
        expect: () => [
          ViewByRequestReturnFilterState.initial().copyWith(
            filter: ReturnFilter.empty(),
          ),
        ],
      );
    },
  );
}

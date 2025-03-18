import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/view_by_item_filter/view_by_item_return_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ReturnFilter returnFilter;
  late ReturnFilter appliedFilter;
  late DateTime fakeToDate;
  late DateTime fakeFromDate;
  late DateTimeRange dateTimeRange;
  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
  });

  setUp(() {
    returnFilter = ReturnFilter.empty();
    fakeToDate = DateTime.parse(
      DateFormat('yyyyMMdd').format(
        DateTime.now(),
      ),
    );
    fakeFromDate = DateTime.parse(
      DateFormat('yyyyMMdd').format(
        DateTime.now().subtract(
          const Duration(days: 60),
        ),
      ),
    );
    dateTimeRange = DateTimeRange(
      start: fakeFromDate,
      end: fakeToDate,
    );

    appliedFilter = ReturnFilter.empty().copyWith(
      returnDateTo: DateTimeStringValue(
        getDateStringByDateTime(fakeToDate),
      ),
      returnDateFrom: DateTimeStringValue(
        getDateStringByDateTime(fakeFromDate),
      ),
      returnStatusList: [StatusType('APPROVED')],
    );
  });

  group('ViewByItemReturnFilterBloc', () {
    blocTest(
      ' -> initialize',
      build: () => ViewByItemReturnFilterBloc(),
      act: (ViewByItemReturnFilterBloc bloc) {
        bloc.add(
          const ViewByItemReturnFilterEvent.initialize(),
        );
      },
      expect: () => [ViewByItemReturnFilterState.initial()],
    );

    blocTest(
      ' -> updateFilterToLastApplied',
      build: () => ViewByItemReturnFilterBloc(),
      act: (ViewByItemReturnFilterBloc bloc) {
        bloc.add(
          ViewByItemReturnFilterEvent.updateFilterToLastApplied(
            lastAppliedFilter: appliedFilter,
          ),
        );
      },
      expect: () => [
        ViewByItemReturnFilterState.initial().copyWith(
          filter: appliedFilter,
        ),
      ],
    );

    blocTest(
      ' -> resetFilters',
      build: () => ViewByItemReturnFilterBloc(),
      act: (ViewByItemReturnFilterBloc bloc) {
        bloc.add(
          const ViewByItemReturnFilterEvent.resetFilters(),
        );
      },
      expect: () => [
        ViewByItemReturnFilterState.initial().copyWith(
          filter: ReturnFilter.empty(),
        ),
      ],
    );

    blocTest(
      ' -> Return Date Range Changed',
      build: () => ViewByItemReturnFilterBloc(),
      act: (ViewByItemReturnFilterBloc bloc) {
        bloc.add(
          ViewByItemReturnFilterEvent.setReturnDate(
            returnDateRange: dateTimeRange,
          ),
        );
      },
      expect: () => [
        ViewByItemReturnFilterState.initial().copyWith(
          filter: returnFilter.copyWith(
            returnDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            returnDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
          ),
        ),
      ],
    );
    blocTest(
      ' -> AmountToChanged',
      build: () => ViewByItemReturnFilterBloc(),
      seed: () => ViewByItemReturnFilterState.initial().copyWith(
        filter: returnFilter,
      ),
      act: (ViewByItemReturnFilterBloc bloc) => bloc
          .add(const ViewByItemReturnFilterEvent.setAmountTo(amountTo: '1000')),
      expect: () => [
        ViewByItemReturnFilterState.initial().copyWith(
          filter: returnFilter.copyWith(
            amountValueTo: RangeValue('1000'),
          ),
          showErrorMessage: false,
        ),
      ],
    );

    blocTest(
      ' -> AmountFromChanged',
      build: () => ViewByItemReturnFilterBloc(),
      seed: () => ViewByItemReturnFilterState.initial().copyWith(
        filter: returnFilter,
      ),
      act: (ViewByItemReturnFilterBloc bloc) => bloc.add(
        const ViewByItemReturnFilterEvent.setAmountFrom(amountFrom: '1000'),
      ),
      expect: () => [
        ViewByItemReturnFilterState.initial().copyWith(
          filter: returnFilter.copyWith(
            amountValueFrom: RangeValue('1000'),
          ),
          showErrorMessage: false,
        ),
      ],
    );

    blocTest(
      ' -> SetReturnType',
      build: () => ViewByItemReturnFilterBloc(),
      seed: () => ViewByItemReturnFilterState.initial().copyWith(
        filter: returnFilter,
      ),
      act: (ViewByItemReturnFilterBloc bloc) => bloc.add(
        ViewByItemReturnFilterEvent.setReturnType(
          type: MaterialOriginFilter.mp(),
        ),
      ),
      expect: () => [
        ViewByItemReturnFilterState.initial().copyWith(
          filter: returnFilter.copyWith(
            materialOriginFilter: MaterialOriginFilter.mp(),
          ),
        ),
      ],
    );

    group(' -> setReturnStatus Event', () {
      blocTest(
        ' -> Add more status to Status list',
        build: () => ViewByItemReturnFilterBloc(),
        seed: () => ViewByItemReturnFilterState.initial().copyWith(
          filter: returnFilter.copyWith(
            returnDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            returnDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
          ),
        ),
        act: (ViewByItemReturnFilterBloc bloc) {
          bloc.add(
            ViewByItemReturnFilterEvent.setReturnStatus(
              status: StatusType('APPROVED'),
              value: true,
            ),
          );
        },
        expect: () => [
          ViewByItemReturnFilterState.initial().copyWith(
            filter: returnFilter.copyWith(
              returnDateTo: DateTimeStringValue(
                getDateStringByDateTime(fakeToDate),
              ),
              returnDateFrom: DateTimeStringValue(
                getDateStringByDateTime(fakeFromDate),
              ),
              returnStatusList: [StatusType('APPROVED')],
            ),
          ),
        ],
      );

      blocTest(
        ' -> Remove status from Status list',
        build: () => ViewByItemReturnFilterBloc(),
        seed: () => ViewByItemReturnFilterState.initial().copyWith(
          filter: appliedFilter,
        ),
        act: (ViewByItemReturnFilterBloc bloc) {
          bloc.add(
            ViewByItemReturnFilterEvent.setReturnStatus(
              status: StatusType('APPROVED'),
              value: false,
            ),
          );
        },
        expect: () => [
          ViewByItemReturnFilterState.initial().copyWith(
            filter: returnFilter.copyWith(
              returnDateTo: DateTimeStringValue(
                getDateStringByDateTime(fakeToDate),
              ),
              returnDateFrom: DateTimeStringValue(
                getDateStringByDateTime(fakeFromDate),
              ),
              returnStatusList: [],
            ),
          ),
        ],
      );
    });

    group(' -> setValidationFailure Event', () {
      blocTest(
        ' -> validateFilters with all valid filters',
        build: () => ViewByItemReturnFilterBloc(),
        seed: () => ViewByItemReturnFilterState.initial().copyWith(
          filter: returnFilter.copyWith(
            returnDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            returnDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
            amountValueFrom: RangeValue('1'),
            amountValueTo: RangeValue('10'),
            returnStatusList: [StatusType('APPROVED')],
          ),
        ),
        act: (ViewByItemReturnFilterBloc bloc) {
          bloc.add(
            const ViewByItemReturnFilterEvent.setValidationFailure(),
          );
        },
        expect: () => [],
      );

      blocTest(
        ' -> validateFilters with invalid amount',
        build: () => ViewByItemReturnFilterBloc(),
        seed: () => ViewByItemReturnFilterState.initial().copyWith(
          filter: returnFilter.copyWith(
            amountValueFrom: RangeValue('100'),
            amountValueTo: RangeValue('10'),
          ),
        ),
        act: (ViewByItemReturnFilterBloc bloc) {
          bloc.add(
            const ViewByItemReturnFilterEvent.setValidationFailure(),
          );
        },
        expect: () => [
          ViewByItemReturnFilterState.initial().copyWith(
            showErrorMessage: true,
            filter: returnFilter.copyWith(
              amountValueFrom: RangeValue('100'),
              amountValueTo: RangeValue('10'),
            ),
          ),
        ],
      );
    });
  });
}

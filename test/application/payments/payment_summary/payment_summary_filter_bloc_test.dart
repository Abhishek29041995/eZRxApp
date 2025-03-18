import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/payments/payment_summary/filter/payment_summary_filter_bloc.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'payment_summary_bloc_test.dart';

void main() {
  late PaymentSummaryRepositoryMock repository;
  late PaymentSummaryFilter paymentSummaryFilter;
  late DateTime fakeToDate;
  late DateTime fakeFromDate;
  late DateTimeRange dateTimeRange;
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = PaymentSummaryRepositoryMock();
  });

  setUp(() {
    paymentSummaryFilter = PaymentSummaryFilter.defaultFilter();
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
  });

  group('Payment summary Filter Bloc', () {
    blocTest(
      'initialized',
      build: () =>
          PaymentSummaryFilterBloc(paymentSummaryRepository: repository),
      act: (PaymentSummaryFilterBloc bloc) {
        bloc.add(
          PaymentSummaryFilterEvent.initialized(salesOrg: SalesOrg('2001')),
        );
      },
      expect: () => [
        PaymentSummaryFilterState.initial()
            .copyWith(salesOrg: SalesOrg('2001')),
      ],
    );

    blocTest(
      'Created Date Range Changed',
      build: () =>
          PaymentSummaryFilterBloc(paymentSummaryRepository: repository),
      act: (PaymentSummaryFilterBloc bloc) {
        bloc.add(
          PaymentSummaryFilterEvent.setCreatedDate(
            dateTimeRange,
          ),
        );
      },
      expect: () => [
        PaymentSummaryFilterState.initial().copyWith(
          filter: paymentSummaryFilter.copyWith(
            createdDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            createdDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
          ),
        ),
      ],
    );
    blocTest(
      'AmountValueToChanged',
      build: () =>
          PaymentSummaryFilterBloc(paymentSummaryRepository: repository),
      seed: () => PaymentSummaryFilterState.initial().copyWith(
        filter: paymentSummaryFilter,
      ),
      act: (PaymentSummaryFilterBloc bloc) => bloc
          .add(const PaymentSummaryFilterEvent.amountValueToChanged('1000')),
      expect: () => [
        PaymentSummaryFilterState.initial().copyWith(
          filter: PaymentSummaryFilter.empty().copyWith(
            filterOption: FilterOption.amountRange(),
            amountValueFrom: paymentSummaryFilter.amountValueFrom,
            amountValueTo: RangeValue('1000'),
          ),
          showErrorMessages: false,
        ),
      ],
    );

    blocTest(
      'AmountValueFromChanged',
      build: () =>
          PaymentSummaryFilterBloc(paymentSummaryRepository: repository),
      seed: () => PaymentSummaryFilterState.initial().copyWith(
        filter: paymentSummaryFilter,
      ),
      act: (PaymentSummaryFilterBloc bloc) => bloc
          .add(const PaymentSummaryFilterEvent.amountValueFromChanged('100')),
      expect: () => [
        PaymentSummaryFilterState.initial().copyWith(
          filter: PaymentSummaryFilter.empty().copyWith(
            filterOption: FilterOption.amountRange(),
            amountValueTo: paymentSummaryFilter.amountValueTo,
            amountValueFrom: RangeValue('100'),
          ),
          showErrorMessages: false,
        ),
      ],
    );

    blocTest(
      'Status Changed - add',
      build: () =>
          PaymentSummaryFilterBloc(paymentSummaryRepository: repository),
      seed: () => PaymentSummaryFilterState.initial().copyWith(
        filter: paymentSummaryFilter.copyWith(
          createdDateTo: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
          createdDateFrom: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
        ),
      ),
      act: (PaymentSummaryFilterBloc bloc) {
        bloc.add(
          PaymentSummaryFilterEvent.statusChanged(
            FilterStatus('In Progress'),
          ),
        );
      },
      expect: () => [
        PaymentSummaryFilterState.initial().copyWith(
          filter: PaymentSummaryFilter.empty().copyWith(
            filterOption: FilterOption.status(),
            filterStatuses: [FilterStatus('In Progress')],
          ),
        ),
      ],
    );

    blocTest(
      'validateFilters with all valid filters',
      build: () =>
          PaymentSummaryFilterBloc(paymentSummaryRepository: repository),
      seed: () => PaymentSummaryFilterState.initial().copyWith(
        filter: paymentSummaryFilter.copyWith(
          createdDateTo: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
          createdDateFrom: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
          amountValueFrom: RangeValue('1'),
          amountValueTo: RangeValue('10'),
          filterStatuses: [FilterStatus('In Progress')],
        ),
      ),
      act: (PaymentSummaryFilterBloc bloc) {
        bloc.add(
          const PaymentSummaryFilterEvent.validateFilters(),
        );
      },
      expect: () => [],
    );

    blocTest(
      'validateFilters with invalid filters',
      build: () =>
          PaymentSummaryFilterBloc(paymentSummaryRepository: repository),
      seed: () => PaymentSummaryFilterState.initial().copyWith(
        filter: paymentSummaryFilter.copyWith(
          createdDateTo: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
          createdDateFrom: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
          amountValueFrom: RangeValue('100'),
          amountValueTo: RangeValue('10'),
          filterStatuses: [FilterStatus('In Progress')],
        ),
      ),
      act: (PaymentSummaryFilterBloc bloc) {
        bloc.add(
          const PaymentSummaryFilterEvent.validateFilters(),
        );
      },
      expect: () => [
        PaymentSummaryFilterState.initial().copyWith(
          showErrorMessages: true,
          filter: paymentSummaryFilter.copyWith(
            createdDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            createdDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
            amountValueFrom: RangeValue('100'),
            amountValueTo: RangeValue('10'),
            filterStatuses: [FilterStatus('In Progress')],
          ),
        ),
      ],
    );
    blocTest(
      'open Filter BottomSheet validation',
      build: () =>
          PaymentSummaryFilterBloc(paymentSummaryRepository: repository),
      act: (PaymentSummaryFilterBloc bloc) {
        bloc.add(
          PaymentSummaryFilterEvent.openFilterBottomSheet(
            appliedFilter: paymentSummaryFilter.copyWith(
              createdDateTo: DateTimeStringValue(
                getDateStringByDateTime(fakeToDate),
              ),
              createdDateFrom: DateTimeStringValue(
                getDateStringByDateTime(fakeFromDate),
              ),
              amountValueFrom: RangeValue('1'),
              amountValueTo: RangeValue('10'),
              filterStatuses: [FilterStatus('In Progress')],
            ),
          ),
        );
      },
      expect: () => [
        PaymentSummaryFilterState.initial().copyWith(
          showErrorMessages: false,
          filter: paymentSummaryFilter.copyWith(
            createdDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            createdDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
            amountValueFrom: RangeValue('1'),
            amountValueTo: RangeValue('10'),
            filterStatuses: [FilterStatus('In Progress')],
          ),
        ),
      ],
    );
  });
}

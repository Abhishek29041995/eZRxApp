import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/payments/all_invoices/filter/all_invoices_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late AllInvoicesFilter allInvoicesFilter;
  late DateTime fakeToDate;
  late DateTime fakeFromDate;
  late DateTimeRange dateTimeRange;
  final allInvoicesFilterState = AllInvoicesFilterState.initial();
  late AllInvoicesFilter fakeAppliedFilter;

  setUp(() {
    allInvoicesFilter = AllInvoicesFilter.defaultFilter();
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

    fakeAppliedFilter = allInvoicesFilter.copyWith(
      dueDateTo: DateTimeStringValue(
        getDateStringByDateTime(fakeToDate),
      ),
      dueDateFrom: DateTimeStringValue(
        getDateStringByDateTime(fakeFromDate),
      ),
      documentDateTo: DateTimeStringValue(
        getDateStringByDateTime(fakeToDate),
      ),
      documentDateFrom: DateTimeStringValue(
        getDateStringByDateTime(fakeFromDate),
      ),
      amountValueFrom: RangeValue('100'),
      amountValueTo: RangeValue('10'),
      filterStatuses: ['Cleared'],
    );
  });

  group('All invoices Filter Bloc', () {
    blocTest(
      'initialized',
      build: () => AllInvoicesFilterBloc(),
      act: (AllInvoicesFilterBloc bloc) {
        bloc.add(
          const AllInvoicesFilterEvent.initialized(),
        );
      },
      expect: () => [
        isA<AllInvoicesFilterState>(),
      ],
    );

    blocTest(
      'Due Date Range Changed',
      build: () => AllInvoicesFilterBloc(),
      act: (AllInvoicesFilterBloc bloc) {
        bloc.add(
          AllInvoicesFilterEvent.setDueDate(
            dateTimeRange,
          ),
        );
      },
      expect: () => [
        allInvoicesFilterState.copyWith(
          filter: AllInvoicesFilter.empty().copyWith(
            filterOption: FilterOption.dueDate(),
            dueDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            dueDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'Document Date Range Changed',
      build: () => AllInvoicesFilterBloc(),
      act: (AllInvoicesFilterBloc bloc) {
        bloc.add(
          AllInvoicesFilterEvent.setDocumentDate(
            dateTimeRange,
          ),
        );
      },
      expect: () => [
        allInvoicesFilterState.copyWith(
          filter: AllInvoicesFilter.empty().copyWith(
            filterOption: FilterOption.documentDate(),
            documentDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            documentDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
          ),
        ),
      ],
    );
    blocTest(
      'AmountValueToChanged',
      build: () => AllInvoicesFilterBloc(),
      seed: () => allInvoicesFilterState.copyWith(
        filter: allInvoicesFilter,
      ),
      act: (AllInvoicesFilterBloc bloc) =>
          bloc.add(const AllInvoicesFilterEvent.amountValueToChanged('1000')),
      expect: () => [
        allInvoicesFilterState.copyWith(
          filter: AllInvoicesFilter.empty().copyWith(
            amountValueTo: RangeValue('1000'),
            amountValueFrom: allInvoicesFilter.amountValueFrom,
            filterOption: FilterOption.amountRange(),
          ),
          showErrorMessages: false,
        ),
      ],
    );

    blocTest(
      'AmountValueFromChanged',
      build: () => AllInvoicesFilterBloc(),
      seed: () => allInvoicesFilterState.copyWith(
        filter: allInvoicesFilter,
      ),
      act: (AllInvoicesFilterBloc bloc) =>
          bloc.add(const AllInvoicesFilterEvent.amountValueFromChanged('100')),
      expect: () => [
        allInvoicesFilterState.copyWith(
          filter: AllInvoicesFilter.empty().copyWith(
            amountValueFrom: RangeValue('100'),
            amountValueTo: allInvoicesFilter.amountValueTo,
            filterOption: FilterOption.amountRange(),
          ),
          showErrorMessages: false,
        ),
      ],
    );

    blocTest(
      'Status Changed',
      build: () => AllInvoicesFilterBloc(),
      seed: () => allInvoicesFilterState.copyWith(
        filter: allInvoicesFilter.copyWith(
          dueDateTo: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
          dueDateFrom: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
        ),
      ),
      act: (AllInvoicesFilterBloc bloc) {
        bloc.add(
          const AllInvoicesFilterEvent.statusChanged(
            'Cleared',
            true,
          ),
        );
      },
      expect: () => [
        allInvoicesFilterState.copyWith(
          filter: AllInvoicesFilter.empty().copyWith(
            filterOption: FilterOption.status(),
            filterStatuses: ['Cleared'],
          ),
        ),
      ],
    );

    blocTest(
      'validateFilters with all valid filters',
      build: () => AllInvoicesFilterBloc(),
      seed: () => allInvoicesFilterState.copyWith(
        filter: allInvoicesFilter.copyWith(
          dueDateTo: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
          dueDateFrom: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
          documentDateTo: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
          documentDateFrom: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
          amountValueFrom: RangeValue('1'),
          amountValueTo: RangeValue('10'),
          filterStatuses: ['Cleared'],
        ),
      ),
      act: (AllInvoicesFilterBloc bloc) {
        bloc.add(
          const AllInvoicesFilterEvent.validateFilters(),
        );
      },
      expect: () => [],
    );

    blocTest(
      'validateFilters with invalid filters',
      build: () => AllInvoicesFilterBloc(),
      seed: () => allInvoicesFilterState.copyWith(
        filter: allInvoicesFilter.copyWith(
          dueDateTo: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
          dueDateFrom: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
          documentDateTo: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
          documentDateFrom: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
          amountValueFrom: RangeValue('100'),
          amountValueTo: RangeValue('10'),
          filterStatuses: ['Cleared'],
        ),
      ),
      act: (AllInvoicesFilterBloc bloc) {
        bloc.add(
          const AllInvoicesFilterEvent.validateFilters(),
        );
      },
      expect: () => [
        allInvoicesFilterState.copyWith(
          showErrorMessages: true,
          filter: allInvoicesFilter.copyWith(
            dueDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            dueDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
            documentDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            documentDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
            amountValueFrom: RangeValue('100'),
            amountValueTo: RangeValue('10'),
            filterStatuses: ['Cleared'],
          ),
        ),
      ],
    );

    blocTest(
      'Test bottomSheet value when showErrorMessages is true',
      build: () => AllInvoicesFilterBloc(),
      seed: () => allInvoicesFilterState.copyWith(
        showErrorMessages: true,
      ),
      act: (AllInvoicesFilterBloc bloc) {
        bloc.add(
          AllInvoicesFilterEvent.openFilterBottomSheet(
            appliedFilter: fakeAppliedFilter,
          ),
        );
      },
      expect: () => [
        allInvoicesFilterState.copyWith(
          showErrorMessages: false,
          filter: allInvoicesFilter.copyWith(
            dueDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            dueDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
            documentDateTo: DateTimeStringValue(
              getDateStringByDateTime(fakeToDate),
            ),
            documentDateFrom: DateTimeStringValue(
              getDateStringByDateTime(fakeFromDate),
            ),
            amountValueFrom: RangeValue('100'),
            amountValueTo: RangeValue('10'),
            filterStatuses: ['Cleared'],
          ),
        ),
      ],
    );

    blocTest(
      'Test bottomSheet value when current filter is different from old filter',
      build: () => AllInvoicesFilterBloc(),
      seed: () => allInvoicesFilterState.copyWith(
        showErrorMessages: false,
        filter: allInvoicesFilter.copyWith(
          dueDateTo: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
          dueDateFrom: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
          documentDateTo: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
          documentDateFrom: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
          amountValueFrom: RangeValue('100'),
          amountValueTo: RangeValue('10'),
          filterStatuses: ['Cleared'],
        ),
      ),
      act: (AllInvoicesFilterBloc bloc) {
        bloc.add(
          AllInvoicesFilterEvent.openFilterBottomSheet(
            appliedFilter: AllInvoicesFilter.empty(),
          ),
        );
      },
      expect: () => [
        allInvoicesFilterState.copyWith(
          showErrorMessages: false,
          filter: AllInvoicesFilter.empty(),
        ),
      ],
    );

    blocTest(
      'Test bottomSheet value when current filter is same old filter and showErrorMessages is false',
      build: () => AllInvoicesFilterBloc(),
      seed: () => allInvoicesFilterState.copyWith(
        showErrorMessages: false,
        filter: allInvoicesFilter.copyWith(
          dueDateTo: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
          dueDateFrom: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
          documentDateTo: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
          documentDateFrom: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
          amountValueFrom: RangeValue('100'),
          amountValueTo: RangeValue('10'),
          filterStatuses: ['Cleared'],
        ),
      ),
      act: (AllInvoicesFilterBloc bloc) {
        bloc.add(
          AllInvoicesFilterEvent.openFilterBottomSheet(
            appliedFilter: fakeAppliedFilter,
          ),
        );
      },
      expect: () => [],
    );
  });
}

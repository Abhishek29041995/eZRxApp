import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/payments/all_credits/filter/all_credits_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late AllCreditsFilter allCreditsFilter;
  late AllCreditsFilter fakeCreditsFilter;
  late DateTime fakeToDate;
  late DateTime fakeFromDate;
  late DateTimeRange dateTimeRange;
  final allCreditsFilterState = AllCreditsFilterState.initial();

  setUp(() {
    allCreditsFilter = AllCreditsFilter.defaultFilter();
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

    fakeCreditsFilter = allCreditsFilter.copyWith(
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

  group('All credits Filter Bloc', () {
    blocTest(
      'initialized',
      build: () => AllCreditsFilterBloc(),
      act: (AllCreditsFilterBloc bloc) {
        bloc.add(
          const AllCreditsFilterEvent.initialized(),
        );
      },
      expect: () => [
        isA<AllCreditsFilterState>(),
      ],
    );

    blocTest(
      'Document Date Range Changed',
      build: () => AllCreditsFilterBloc(),
      act: (AllCreditsFilterBloc bloc) {
        bloc.add(
          AllCreditsFilterEvent.setDocumentDate(
            dateTimeRange,
          ),
        );
      },
      expect: () => [
        allCreditsFilterState.copyWith(
          filter: AllCreditsFilter.empty().copyWith(
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
      build: () => AllCreditsFilterBloc(),
      seed: () => allCreditsFilterState.copyWith(
        filter: allCreditsFilter,
      ),
      act: (AllCreditsFilterBloc bloc) =>
          bloc.add(const AllCreditsFilterEvent.amountValueToChanged('1000')),
      expect: () => [
        allCreditsFilterState.copyWith(
          filter: AllCreditsFilter.empty().copyWith(
            amountValueTo: RangeValue('1000'),
            amountValueFrom: allCreditsFilter.amountValueFrom,
            filterOption: FilterOption.amountRange(),
          ),
          showErrorMessages: false,
        ),
      ],
    );

    blocTest(
      'AmountValueFromChanged',
      build: () => AllCreditsFilterBloc(),
      seed: () => allCreditsFilterState.copyWith(
        filter: allCreditsFilter,
      ),
      act: (AllCreditsFilterBloc bloc) =>
          bloc.add(const AllCreditsFilterEvent.amountValueFromChanged('100')),
      expect: () => [
        allCreditsFilterState.copyWith(
          filter: AllCreditsFilter.empty().copyWith(
            amountValueFrom: RangeValue('100'),
            amountValueTo: allCreditsFilter.amountValueTo,
            filterOption: FilterOption.amountRange(),
          ),
          showErrorMessages: false,
        ),
      ],
    );

    blocTest(
      'Status Changed',
      build: () => AllCreditsFilterBloc(),
      seed: () => allCreditsFilterState.copyWith(
        filter: allCreditsFilter.copyWith(
          documentDateTo: DateTimeStringValue(
            getDateStringByDateTime(fakeToDate),
          ),
          documentDateFrom: DateTimeStringValue(
            getDateStringByDateTime(fakeFromDate),
          ),
        ),
      ),
      act: (AllCreditsFilterBloc bloc) {
        bloc.add(
          const AllCreditsFilterEvent.statusChanged(
            'Cleared',
            true,
          ),
        );
      },
      expect: () => [
        allCreditsFilterState.copyWith(
          filter: AllCreditsFilter.empty().copyWith(
            filterOption: FilterOption.status(),
            filterStatuses: ['Cleared'],
          ),
        ),
      ],
    );

    blocTest(
      'validateFilters with all valid filters',
      build: () => AllCreditsFilterBloc(),
      seed: () => allCreditsFilterState.copyWith(
        filter: allCreditsFilter.copyWith(
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
      act: (AllCreditsFilterBloc bloc) {
        bloc.add(
          const AllCreditsFilterEvent.validateFilters(),
        );
      },
      expect: () => [],
    );

    blocTest(
      'validateFilters with invalid filters',
      build: () => AllCreditsFilterBloc(),
      seed: () => allCreditsFilterState.copyWith(
        filter: allCreditsFilter.copyWith(
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
      act: (AllCreditsFilterBloc bloc) {
        bloc.add(
          const AllCreditsFilterEvent.validateFilters(),
        );
      },
      expect: () => [
        allCreditsFilterState.copyWith(
          showErrorMessages: true,
          filter: fakeCreditsFilter,
        ),
      ],
    );

    blocTest(
      'Test bottomSheet value when showErrorMessages is true',
      build: () => AllCreditsFilterBloc(),
      seed: () => allCreditsFilterState.copyWith(
        showErrorMessages: true,
      ),
      act: (AllCreditsFilterBloc bloc) {
        bloc.add(
          AllCreditsFilterEvent.openFilterBottomSheet(
            appliedFilter: fakeCreditsFilter,
          ),
        );
      },
      expect: () => [
        allCreditsFilterState.copyWith(
          showErrorMessages: false,
          filter: fakeCreditsFilter,
        ),
      ],
    );

    blocTest(
      'Test bottomSheet value when current filter is different from old filter',
      build: () => AllCreditsFilterBloc(),
      seed: () => allCreditsFilterState.copyWith(
        showErrorMessages: false,
        filter: fakeCreditsFilter,
      ),
      act: (AllCreditsFilterBloc bloc) {
        bloc.add(
          AllCreditsFilterEvent.openFilterBottomSheet(
            appliedFilter: AllCreditsFilter.empty(),
          ),
        );
      },
      expect: () => [
        allCreditsFilterState.copyWith(
          showErrorMessages: false,
          filter: AllCreditsFilter.empty(),
        ),
      ],
    );

    blocTest(
      'Test bottomSheet value when current filter is same old filter and showErrorMessages is false',
      build: () => AllCreditsFilterBloc(),
      seed: () => allCreditsFilterState.copyWith(
        showErrorMessages: false,
        filter: fakeCreditsFilter,
      ),
      act: (AllCreditsFilterBloc bloc) {
        bloc.add(
          AllCreditsFilterEvent.openFilterBottomSheet(
            appliedFilter: fakeCreditsFilter,
          ),
        );
      },
      expect: () => [],
    );
  });
}

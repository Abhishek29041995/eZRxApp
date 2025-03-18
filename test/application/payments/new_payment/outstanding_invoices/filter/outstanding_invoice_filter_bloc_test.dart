import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/filter/outstanding_invoice_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late OutstandingInvoiceFilter outstandingInvoiceFilter;
  late DateTime fakeStartDate;
  late DateTime fakeEndDate;
  late StatusType selectedState;
  late DateTimeRange dateTimeRange;

  final outstandingInvoiceFilterState = OutstandingInvoiceFilterState.initial();
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
  });

  setUp(() {
    outstandingInvoiceFilter = OutstandingInvoiceFilter.defaultFilter();
    fakeEndDate = DateTime.parse(
      DateFormat('yyyyMMdd').format(
        DateTime.now(),
      ),
    );
    fakeStartDate = DateTime.parse(
      DateFormat('yyyyMMdd').format(
        DateTime.now().subtract(
          const Duration(days: 60),
        ),
      ),
    );
    selectedState = StatusType('');
    dateTimeRange = DateTimeRange(
      start: fakeStartDate,
      end: fakeEndDate,
    );
  });
  group('Outstanding Invoice Filter Bloc', () {
    ///TODO: The getter emptyOutstandingInvoiceFilter needs to be covered in the widget tests
    blocTest(
      'Initialize',
      build: () => OutstandingInvoiceFilterBloc(),
      act: (OutstandingInvoiceFilterBloc bloc) {
        bloc.add(
          const OutstandingInvoiceFilterEvent.initialize(),
        );
      },
      expect: () => [
        isA<OutstandingInvoiceFilterState>(),
      ],
    );

    blocTest(
      'Set Document Date',
      build: () => OutstandingInvoiceFilterBloc(),
      act: (OutstandingInvoiceFilterBloc bloc) {
        bloc.add(
          OutstandingInvoiceFilterEvent.setDocumentDate(
            documentDateRange: dateTimeRange,
          ),
        );
      },
      expect: () => [
        outstandingInvoiceFilterState.copyWith(
          filter: outstandingInvoiceFilter.copyWith(
            documentDateFrom: DateTimeStringValue(
              getDateStringByDateTime(dateTimeRange.start),
            ),
            documentDateTo: DateTimeStringValue(
              getDateStringByDateTime(dateTimeRange.end),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'Set Due Date Range',
      build: () => OutstandingInvoiceFilterBloc(),
      act: (OutstandingInvoiceFilterBloc bloc) {
        bloc.add(
          OutstandingInvoiceFilterEvent.setDueDate(dueDateRange: dateTimeRange),
        );
      },
      expect: () => [
        outstandingInvoiceFilterState.copyWith(
          filter: OutstandingInvoiceFilter.empty().copyWith(
            filterOption: FilterOption.dueDate(),
            dueDateFrom: DateTimeStringValue(
              getDateStringByDateTime(dateTimeRange.start),
            ),
            dueDateTo: DateTimeStringValue(
              getDateStringByDateTime(dateTimeRange.end),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'Set Amount From',
      build: () => OutstandingInvoiceFilterBloc(),
      act: (OutstandingInvoiceFilterBloc bloc) {
        bloc.add(
          OutstandingInvoiceFilterEvent.setAmountFrom(
            amountFrom: getDateStringByDateTime(dateTimeRange.start),
          ),
        );
      },
      expect: () => [
        outstandingInvoiceFilterState.copyWith(
          filter: OutstandingInvoiceFilter.empty().copyWith(
            filterOption: FilterOption.amountRange(),
            amountValueTo: outstandingInvoiceFilter.amountValueTo,
            amountValueFrom:
                RangeValue(getDateStringByDateTime(dateTimeRange.start)),
          ),
        ),
      ],
    );
    blocTest(
      'Set Amount To',
      build: () => OutstandingInvoiceFilterBloc(),
      act: (OutstandingInvoiceFilterBloc bloc) {
        bloc.add(
          OutstandingInvoiceFilterEvent.setAmountTo(
            amountTo: getDateStringByDateTime(dateTimeRange.end),
          ),
        );
      },
      expect: () => [
        outstandingInvoiceFilterState.copyWith(
          filter: OutstandingInvoiceFilter.empty().copyWith(
            filterOption: FilterOption.amountRange(),
            amountValueFrom: outstandingInvoiceFilter.amountValueFrom,
            amountValueTo:
                RangeValue(getDateStringByDateTime(dateTimeRange.end)),
          ),
        ),
      ],
    );

    blocTest(
      'Set Outstanding Invoice Status',
      build: () => OutstandingInvoiceFilterBloc(),
      act: (OutstandingInvoiceFilterBloc bloc) {
        bloc.add(
          OutstandingInvoiceFilterEvent.setOutstandingInvoiceStatus(
            status: selectedState,
            value: false,
          ),
        );
      },
      expect: () => [
        outstandingInvoiceFilterState.copyWith(
          filter: OutstandingInvoiceFilter.empty().copyWith(
            filterOption: FilterOption.status(),
            outstandingInvoiceStatus: selectedState,
          ),
        ),
      ],
    );

    blocTest(
      'Set Validation Failure',
      build: () => OutstandingInvoiceFilterBloc(),
      act: (OutstandingInvoiceFilterBloc bloc) {
        bloc.add(
          const OutstandingInvoiceFilterEvent.setValidationFailure(),
        );
      },
      expect: () => [
        outstandingInvoiceFilterState
            .copyWith(showErrorMessage: false),
      ],
    );

    blocTest(
      'Update Filter To Last Applied',
      build: () => OutstandingInvoiceFilterBloc(),
      act: (OutstandingInvoiceFilterBloc bloc) {
        bloc.add(
          OutstandingInvoiceFilterEvent.updateFilterToLastApplied(
            lastAppliedFilter: outstandingInvoiceFilter,
          ),
        );
      },
      expect: () => [
        outstandingInvoiceFilterState.copyWith(
          filter: outstandingInvoiceFilter,
          showErrorMessage: false,
        ),
      ],
    );

    blocTest(
      'for "resetFilters" event',
      build: () => OutstandingInvoiceFilterBloc(),
      act: (OutstandingInvoiceFilterBloc bloc) {
        bloc.add(const OutstandingInvoiceFilterEvent.resetFilters());
      },
      expect: () => [
        outstandingInvoiceFilterState,
      ],
    );
  });
}

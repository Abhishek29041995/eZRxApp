import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/payments/soa/soa_filter/soa_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/payments/entities/soa_filter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final fakeFromDate = DateTimeStringValue(
    getDateStringByDateTime(
      DateTime.now().subtract(const Duration(days: 365)),
    ),
  );
  final fakeToDate =
      DateTimeStringValue(getDateStringByDateTime(DateTime.now()));

  final fakeSoaFilter =
      SoaFilter.empty().copyWith(fromDate: fakeFromDate, toDate: fakeToDate);

  group('Soa Filter Bloc', () {
    blocTest(
      'Initialize',
      build: () => SoaFilterBloc(),
      act: (SoaFilterBloc bloc) => bloc.add(
        const SoaFilterEvent.initialized(),
      ),
      expect: () => [
        SoaFilterState.initial(),
      ],
    );

    blocTest(
      'Change Form Date Event when to date state is empty',
      build: () => SoaFilterBloc(),
      act: (SoaFilterBloc bloc) => bloc.add(
        SoaFilterEvent.changeFormDate(fakeFromDate),
      ),
      expect: () => [
        SoaFilterState.initial().copyWith(
          filter: SoaFilter.empty()
              .copyWith(fromDate: fakeFromDate, toDate: fakeFromDate),
        ),
      ],
    );

    blocTest(
      'Change Form Date Event when to date state is not empty',
      build: () => SoaFilterBloc(),
      seed: () => SoaFilterState.initial().copyWith(filter: fakeSoaFilter),
      act: (SoaFilterBloc bloc) => bloc.add(
        SoaFilterEvent.changeFormDate(
          DateTimeStringValue(''),
        ),
      ),
      expect: () => [
        SoaFilterState.initial().copyWith(
          filter: SoaFilter(
            toDate: fakeToDate,
            fromDate: DateTimeStringValue(''),
          ),
        ),
      ],
    );

    blocTest(
      'Change To Date Event when from date state is empty',
      build: () => SoaFilterBloc(),
      act: (SoaFilterBloc bloc) => bloc.add(
        SoaFilterEvent.changeToDate(fakeToDate),
      ),
      expect: () => [
        SoaFilterState.initial().copyWith(
          filter: SoaFilter.empty()
              .copyWith(toDate: fakeToDate, fromDate: fakeToDate),
        ),
      ],
    );

    blocTest(
      'Change To Date Event when from date state is not empty',
      build: () => SoaFilterBloc(),
      seed: () => SoaFilterState.initial().copyWith(filter: fakeSoaFilter),
      act: (SoaFilterBloc bloc) => bloc.add(
        SoaFilterEvent.changeToDate(
          DateTimeStringValue(''),
        ),
      ),
      expect: () => [
        SoaFilterState.initial().copyWith(
          filter: SoaFilter(
            toDate: DateTimeStringValue(''),
            fromDate: fakeFromDate,
          ),
        ),
      ],
    );

    blocTest(
      'Change Filter Event when filter is different',
      build: () => SoaFilterBloc(),
      seed: () => SoaFilterState.initial().copyWith(
        filter: fakeSoaFilter.copyWith(
          fromDate: DateTimeStringValue(
            getDateStringByDateTime(
              DateTime.now().subtract(const Duration(days: 65)),
            ),
          ),
        ),
      ),
      act: (SoaFilterBloc bloc) => bloc.add(
        SoaFilterEvent.setFilter(fakeSoaFilter),
      ),
      expect: () => [
        SoaFilterState.initial().copyWith(
          filter: fakeSoaFilter,
        ),
      ],
    );
    blocTest(
      'Change Filter Event when filter is Same',
      build: () => SoaFilterBloc(),
      seed: () => SoaFilterState.initial().copyWith(
        filter: fakeSoaFilter,
      ),
      act: (SoaFilterBloc bloc) => bloc.add(
        SoaFilterEvent.setFilter(fakeSoaFilter),
      ),
      expect: () => [],
    );
  });
}

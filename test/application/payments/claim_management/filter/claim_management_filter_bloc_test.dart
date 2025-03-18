import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/payments/claim_management/filter/claim_management_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/claim_management_filter.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ClaimManagementFilterBloc Test', () {
    blocTest<ClaimManagementFilterBloc, ClaimManagementFilterState>(
      'PoAttachmentBloc Initial',
      build: () => ClaimManagementFilterBloc(),
      act: (bloc) => bloc.add(
        const ClaimManagementFilterEvent.initialized(),
      ),
      expect: () => [
        ClaimManagementFilterState.initial(),
      ],
    );

    blocTest<ClaimManagementFilterBloc, ClaimManagementFilterState>(
      'PoAttachmentBloc openFilterBottomSheet',
      build: () => ClaimManagementFilterBloc(),
      act: (bloc) => bloc.add(
        ClaimManagementFilterEvent.openFilterBottomSheet(
          appliedFilter: ClaimManagementFilter.empty()
              .copyWith(searchKey: SearchKey.search('fake-search-key')),
        ),
      ),
      expect: () => [
        ClaimManagementFilterState.initial().copyWith(
          filter: ClaimManagementFilter.empty()
              .copyWith(searchKey: SearchKey.search('fake-search-key')),
        ),
      ],
    );

    blocTest<ClaimManagementFilterBloc, ClaimManagementFilterState>(
      'PoAttachmentBloc claimTypeChange add new',
      build: () => ClaimManagementFilterBloc(),
      act: (bloc) => bloc.add(
        ClaimManagementFilterEvent.claimTypeChange(
          claimType: ClaimType(1),
          selected: true,
        ),
      ),
      expect: () => [
        ClaimManagementFilterState.initial().copyWith(
          filter: ClaimManagementFilter.empty().copyWith(
            claimTypes: [
              ClaimType(1),
            ],
          ),
        ),
      ],
    );

    blocTest<ClaimManagementFilterBloc, ClaimManagementFilterState>(
      'PoAttachmentBloc claimTypeChange remove',
      build: () => ClaimManagementFilterBloc(),
      seed: () => ClaimManagementFilterState.initial().copyWith(
        filter: ClaimManagementFilter.empty().copyWith(
          claimTypes: [
            ClaimType(1),
          ],
        ),
      ),
      act: (bloc) => bloc.add(
        ClaimManagementFilterEvent.claimTypeChange(
          claimType: ClaimType(1),
          selected: false,
        ),
      ),
      expect: () => [
        ClaimManagementFilterState.initial(),
      ],
    );

    blocTest<ClaimManagementFilterBloc, ClaimManagementFilterState>(
      'PoAttachmentBloc clearAll',
      build: () => ClaimManagementFilterBloc(),
      seed: () => ClaimManagementFilterState.initial().copyWith(
        filter: ClaimManagementFilter.empty().copyWith(
          claimTypes: [
            ClaimType(1),
          ],
        ),
      ),
      act: (bloc) => bloc.add(
        const ClaimManagementFilterEvent.clearAll(),
      ),
      expect: () => [
        ClaimManagementFilterState.initial(),
      ],
    );
  });
}

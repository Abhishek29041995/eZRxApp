import 'package:ezrxmobile/domain/payments/entities/claim_management_filter.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ClaimManagementFilter Test ->', () {
    final claimManagementFilter = ClaimManagementFilter.empty().copyWith(
      claimTypes: [ClaimType(1)],
    );

    expect(
      claimManagementFilter.appliedFilterCount,
      1,
    );

    expect(
      claimManagementFilter.anyFilterApplied,
      true,
    );
  });
}

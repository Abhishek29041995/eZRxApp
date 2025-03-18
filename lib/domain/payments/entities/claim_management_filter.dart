import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'claim_management_filter.freezed.dart';

@freezed
class ClaimManagementFilter with _$ClaimManagementFilter {
  const ClaimManagementFilter._();
  factory ClaimManagementFilter({
    required List<ClaimType> claimTypes,
    required SearchKey searchKey,
  }) = _ClaimManagementFilter;

  factory ClaimManagementFilter.empty() => ClaimManagementFilter(
        claimTypes: <ClaimType>[],
        searchKey: SearchKey.empty(),
      );

  int get appliedFilterCount {
    var count = 0;
    if (claimTypes.isNotEmpty) {
      count += 1;
    }

    return count;
  }

  bool get anyFilterApplied => appliedFilterCount > 0;
}

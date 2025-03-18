import 'package:ezrxmobile/domain/order/entities/bundle_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bundle_details.freezed.dart';

@freezed
class BundleDetails with _$BundleDetails {
  const BundleDetails._();

  const factory BundleDetails({
    required String bundleName,
    required String bundleCode,
    required List<BundleInfo> bundleInformation,
  }) = _BundleDetails;

  factory BundleDetails.empty() => const BundleDetails(
        bundleName: '',
        bundleCode: '',
        bundleInformation: <BundleInfo>[],
      );
}

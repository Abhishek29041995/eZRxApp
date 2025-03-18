import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:file_picker/file_picker.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'claim_submission.freezed.dart';

@freezed
class ClaimSubmission with _$ClaimSubmission {
  const ClaimSubmission._();

  const factory ClaimSubmission({
    required PrincipalData principal,
    required ClaimType claimType,
    required double claimAmount,
    required String claimDetails,
    required List<PlatformFile> documents,
  }) = _ClaimSubmission;

  factory ClaimSubmission.empty() => ClaimSubmission(
        principal: PrincipalData.empty(),
        claimType: ClaimType.empty(),
        claimAmount: 0.0,
        claimDetails: '',
        documents: <PlatformFile>[],
      );

  bool get isValid =>
      principal.isNotEmpty &&
      claimType.isNotEmpty &&
      claimDetails.isNotEmpty &&
      claimAmount > 0 &&
      documents.length == claimType.documentTypes.length;
}

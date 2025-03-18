import 'package:freezed_annotation/freezed_annotation.dart';
part 'sales_rep_authorized_details.freezed.dart';

@freezed
class SalesRepAuthorizedDetails with _$SalesRepAuthorizedDetails {
  const SalesRepAuthorizedDetails._();
  factory SalesRepAuthorizedDetails({
    required String movApproval,
    required String movReason,
    required bool sendPayload,
  }) = _SalesRepAuthorizedDetails;
  factory SalesRepAuthorizedDetails.empty({bool sendPayload = false}) =>
      SalesRepAuthorizedDetails(
        movApproval: '',
        movReason: '',
        sendPayload: sendPayload,
      );

  factory SalesRepAuthorizedDetails.isMOVExclusion() =>
      SalesRepAuthorizedDetails(
        movApproval: 'C',
        movReason: 'MOV Exclusion',
        sendPayload: true,
      );

  factory SalesRepAuthorizedDetails.authorizedExtSalesRep(String username) =>
      SalesRepAuthorizedDetails(
        movApproval: 'A',
        movReason: username,
        sendPayload: true,
      );
}

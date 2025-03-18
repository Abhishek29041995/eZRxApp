import 'package:ezrxmobile/domain/returns/entities/return_request_information_header.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_information.freezed.dart';

@freezed
class RequestInformation with _$RequestInformation {
  const RequestInformation._();
  factory RequestInformation({
    required ReturnRequestInformationHeader requestInformationHeader,
    required List<ReturnRequestInformation> returnRequestInformationList,
  }) = _RequestInformation;

  factory RequestInformation.empty() => RequestInformation(
        requestInformationHeader: ReturnRequestInformationHeader.empty(),
        returnRequestInformationList: <ReturnRequestInformation>[],
      );
  String get returnId => requestInformationHeader.requestID;
  String get customerName => requestInformationHeader.cName1;
  String get submittedDate =>
      requestInformationHeader.createdDateTime.dateString;
  double get refundTotal => requestInformationHeader.refundTotal.refundTotal;
  String get createdBy => requestInformationHeader.createdBy;
  String get soldTo => requestInformationHeader.soldTo;
}

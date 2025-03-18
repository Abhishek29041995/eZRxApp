import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'return_request_information_header.freezed.dart';

@freezed
class ReturnRequestInformationHeader with _$ReturnRequestInformationHeader {
  const ReturnRequestInformationHeader._();
  factory ReturnRequestInformationHeader({
    required StringValue returnReference,
    required StringValue specialInstructions,
    required String requestID,
    required String cName1,
    required String soldTo,
    required String createdBy,
    required RefundTotal refundTotal,
    required DateTimeStringValue createdDateTime,
    required StatusType bapiStatus,
    required String totalItemCount,
    required bool isMarketPlace,
  }) = _ReturnRequestInformationHeader;
  factory ReturnRequestInformationHeader.empty() =>
      ReturnRequestInformationHeader(
        returnReference: StringValue(''),
        specialInstructions: StringValue(''),
        refundTotal: RefundTotal(''),
        cName1: '',
        soldTo: '',
        createdBy: '',
        requestID: '',
        createdDateTime: DateTimeStringValue(''),
        bapiStatus: StatusType(''),
        totalItemCount: '',
        isMarketPlace: false,
      );

  String get displayGrandTotalOrTotalValue =>
      isMarketPlace ? 'Total return value' : 'Grand total';
}

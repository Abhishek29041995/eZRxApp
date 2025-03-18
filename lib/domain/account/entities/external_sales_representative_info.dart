import 'package:freezed_annotation/freezed_annotation.dart';

part 'external_sales_representative_info.freezed.dart';

@freezed
class ExternalSalesRepresentativeInfo with _$ExternalSalesRepresentativeInfo {
  const ExternalSalesRepresentativeInfo._();

  const factory ExternalSalesRepresentativeInfo({
    required int userId,
    required String userName,
  }) = _ExternalSalesRepresentativeInfo;

  factory ExternalSalesRepresentativeInfo.empty() =>
      const ExternalSalesRepresentativeInfo(
        userId: 0,
        userName: '',
      );
}

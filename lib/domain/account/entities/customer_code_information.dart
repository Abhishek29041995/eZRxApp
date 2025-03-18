import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_code_information.freezed.dart';

@freezed
class CustomerInformation with _$CustomerInformation {
  const CustomerInformation._();

  const factory CustomerInformation({
    required int shipToCount,
    required List<CustomerCodeInfo> soldToInformation,
  }) = _CustomerInformation;

  factory CustomerInformation.empty() => const CustomerInformation(
        shipToCount: 0,
        soldToInformation: [],
      );
}

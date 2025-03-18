import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_code_config.freezed.dart';

@freezed
class CustomerCodeConfig with _$CustomerCodeConfig {
  const CustomerCodeConfig._();
  factory CustomerCodeConfig({
    required String customerCode,
    required bool disableReturns,
    required bool disablePayments,
  }) = _CustomerCodeConfig;

  factory CustomerCodeConfig.empty() => CustomerCodeConfig(
        customerCode: '',
        disableReturns: false,
        disablePayments: false,
      );
}

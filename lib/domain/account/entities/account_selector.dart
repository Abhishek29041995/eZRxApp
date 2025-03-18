import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_selector.freezed.dart';

@freezed
class AccountSelector with _$AccountSelector {
  const AccountSelector._();

  const factory AccountSelector({
    required String salesOrg,
    required String customerCode,
    required String shippingAddress,
  }) = _AccountSelector;

  factory AccountSelector.empty() => const AccountSelector(
        salesOrg: '',
        customerCode: '',
        shippingAddress: '',
      );
}

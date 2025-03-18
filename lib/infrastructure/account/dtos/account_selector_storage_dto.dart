import 'package:ezrxmobile/domain/account/entities/account_selector.dart';
import 'package:hive/hive.dart';

part 'account_selector_storage_dto.g.dart';

@HiveType(typeId: 4)
class AccountSelectorStorageDto {
  AccountSelectorStorageDto({
    required this.salesOrg,
    required this.customerCode,
    required this.shippingAddress,
  });

  factory AccountSelectorStorageDto.empty() => AccountSelectorStorageDto(
        salesOrg: '',
        customerCode: '',
        shippingAddress: '',
      );

  @HiveField(0)
  final String salesOrg;
  @HiveField(1)
  final String customerCode;
  @HiveField(2)
  final String shippingAddress;

  AccountSelector toDomain() {
    return AccountSelector(
      salesOrg: salesOrg,
      customerCode: customerCode,
      shippingAddress: shippingAddress,
    );
  }

  factory AccountSelectorStorageDto.fromDomain({
    required AccountSelector accountSelector,
  }) =>
      AccountSelectorStorageDto(
        salesOrg: accountSelector.salesOrg,
        customerCode: accountSelector.customerCode,
        shippingAddress: accountSelector.shippingAddress,
      );
}

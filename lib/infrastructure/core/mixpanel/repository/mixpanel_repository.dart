import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/mixpanel/repository/i_mixpanel_repository.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';

class MixpanelRepository extends IMixpanelRepository {
  final MixpanelService mixpanelService;

  MixpanelRepository({
    required this.mixpanelService,
  });

  @override
  void registerSuperProps({
    required User user,
    required SalesOrg salesOrg,
    required SalesOrganisationConfigs salesOrgConfigs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
  }) {
    mixpanelService.registerSuperProps(
      username: user.username.getOrDefaultValue(''),
      salesOrg: salesOrg.getOrDefaultValue(''),
      customerCode: customerCodeInfo.customerCodeSoldTo,
      shipToAddress: shipToInfo.shipToCustomerCode,
      userRole: user.role.name,
      currency: salesOrgConfigs.currency.getOrDefaultValue('').toUpperCase(),
      market: salesOrg.country,
    );
  }
}

import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:flutter_test/flutter_test.dart';

import 'sales_org_config_mock/fake_id_sales_org_config.dart';
import 'sales_org_config_mock/fake_kh_sales_org_config.dart';
import 'sales_org_config_mock/fake_mm_sales_org_config.dart';
import 'sales_org_config_mock/fake_my_sales_org_config.dart';
import 'sales_org_config_mock/fake_ph_sales_org_config.dart';
import 'sales_org_config_mock/fake_sg_sales_org_config.dart';
import 'sales_org_config_mock/fake_th_sales_org_config.dart';
import 'sales_org_config_mock/fake_tw_sales_org_config.dart';
import 'sales_org_config_mock/fake_vn_sales_org_config.dart';

final salesOrgConfigVariant = ValueVariant<SalesOrganisationConfigs>(
  {
    fakeIDSalesOrgConfigs,
    fakeKHSalesOrgConfigs,
    fakeMMSalesOrgConfigs,
    fakeMYSalesOrgConfigs,
    fakePHSalesOrgConfigs,
    fakeSGSalesOrgConfigs,
    fakeTHSalesOrgConfigs,
    fakeTWSalesOrgConfigs,
    fakeVNSalesOrgConfigs,
  },
);

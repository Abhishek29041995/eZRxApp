//Sales org
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:flutter_test/flutter_test.dart';

const _fakeSaleOrgId = 'fake-sale-org-id-1234';
const _fakeVNSalesOrgId = '3072';
const _fakeMYSalesOrgId = '2001';
const _fakeSGSalesOrgId = '2601';
const _fakeTWSalesOrgId = '2800';
const _fakePHSalesOrgId = '2500';
const _fakePhMDISalesOrgId = '2501';
const _fakeIDSalesOrgId = '1900';
const _fakeTHSalesOrgId = '2902';
const _fakeKHSalesOrgId = '1500';
const _fakeMMSalesOrgId = '2201';
const _fakeHKSalesOrgId = '1700';

final fakeSalesOrg = SalesOrg(_fakeSaleOrgId);
final fakePHSalesOrg = SalesOrg(_fakePHSalesOrgId);
final fakeSGSalesOrg = SalesOrg(_fakeSGSalesOrgId);
final fakeTWSalesOrg = SalesOrg(_fakeTWSalesOrgId);
final fakeVNSalesOrg = SalesOrg(_fakeVNSalesOrgId);
final fakeMYSalesOrg = SalesOrg(_fakeMYSalesOrgId);
final fakeIDSalesOrg = SalesOrg(_fakeIDSalesOrgId);
final fakeTHSalesOrg = SalesOrg(_fakeTHSalesOrgId);
final fakeKHSalesOrg = SalesOrg(_fakeKHSalesOrgId);
final fakeMMSalesOrg = SalesOrg(_fakeMMSalesOrgId);
final fakeHKSalesOrg = SalesOrg(_fakeHKSalesOrgId);
final fakePhMDISalesOrg = SalesOrg(_fakePhMDISalesOrgId);

final fakeEmptySalesOrganisation = SalesOrganisation.empty();

final fakeSalesOrganisationConfigs =
    SalesOrganisationConfigs.empty().copyWith(salesOrg: fakeSalesOrg);

final fakeSalesOrganisation =
    SalesOrganisation.empty().copyWith(salesOrg: fakeSalesOrg);

final fakeMYSalesOrganisation =
    SalesOrganisation.empty().copyWith(salesOrg: fakeMYSalesOrg);

final fakeVNSalesOrganisation =
    SalesOrganisation.empty().copyWith(salesOrg: fakeVNSalesOrg);

final fakeSGSalesOrganisation =
    SalesOrganisation.empty().copyWith(salesOrg: fakeSGSalesOrg);

final fakePHSalesOrganisation =
    SalesOrganisation.empty().copyWith(salesOrg: fakePHSalesOrg);

final fakePhMDISalesOrganisation =
    SalesOrganisation.empty().copyWith(salesOrg: fakePhMDISalesOrg);

final fakeIDSalesOrganisation =
    SalesOrganisation.empty().copyWith(salesOrg: fakeIDSalesOrg);

final fakeTHSalesOrganisation =
    SalesOrganisation.empty().copyWith(salesOrg: fakeTHSalesOrg);

final fakeKHSalesOrganisation =
    SalesOrganisation.empty().copyWith(salesOrg: fakeKHSalesOrg);

final fakeTWSalesOrganisation =
    SalesOrganisation.empty().copyWith(salesOrg: fakeTWSalesOrg);

final fakeMMSalesOrganisation =
    SalesOrganisation.empty().copyWith(salesOrg: fakeMMSalesOrg);

final fakeHKSalesOrganisation =
    SalesOrganisation.empty().copyWith(salesOrg: fakeHKSalesOrg);

final salesOrgVariant = ValueVariant<SalesOrg>(
  {
    fakePHSalesOrg,
    fakeSGSalesOrg,
    fakeVNSalesOrg,
    fakeMYSalesOrg,
    fakeIDSalesOrg,
    fakeTHSalesOrg,
    fakeKHSalesOrg,
    fakeMMSalesOrg,
    fakeTWSalesOrg,
    fakeHKSalesOrg,
  },
);

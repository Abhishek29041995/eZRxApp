import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs_principal.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';

//DO NOT MODIFY THIS FILE - This file contains sales org configs from PROD.
//https://zuelligpharma.atlassian.net/wiki/spaces/eZRxP/pages/281903463/Mobile+v3+Regression+Test

final fakeKHSalesOrgConfigs = SalesOrganisationConfigs.empty().copyWith(
  salesOrg: SalesOrg('1500'),
  poNumberRequired: PoNumberRequired(true),
  priceOverride: true,
  expiryDateDisplay: false,
  batchNumDisplay: false,
  currency: Currency('usd'),
  enableMobileNumber: false,
  enableRemarks: false,
  enableListPrice: false,
  enableTaxDisplay: false,
  addOosMaterials: OosMaterial(false),
  oosValue: OosValue(0),
  enableDefaultMD: false,
  enableZDP8Override: false,
  enableGMC: false,
  enableGMN: false,
  minOrderAmount: 20.0,
  vatValue: 10,
  netPriceOverride: false,
  enableFutureDeliveryDay: false,
  futureDeliveryDay: FutureDeliveryDay('7'),
  enablePaymentTerms: false,
  enableVat: false,
  enableZDP5: false,
  materialWithoutPrice: true,
  enableBatchNumber: false,
  enableOHPrice: true,
  enableSpecialInstructions: true,
  enableReferenceNote: false,
  displayOrderDiscount: false,
  enableIRN: false,
  enableTaxClassification: false,
  disablePrincipals: true,
  principalList: <SalesOrganisationConfigsPrincipal>[],
  disableBundles: false,
  disableProcessingStatus: false,
  disableOrderType: false,
  displayItemTaxBreakdown: false,
  displaySubtotalTaxBreakdown: true,
  enableCollectiveNumber: false,
  enableGimmickMaterial: false,
  hideCustomer: false,
  enableBillTo: true,
  disablePaymentTermsDisplay: false,
  disableReturnsAccess: false,
  disablePayment: true,
  disableReturnsAccessSR: false,
  hideStockDisplay: false,
  showPOAttachment: false,
  disableOverrideFieldSR: true,
  disableOverrideFieldCustomer: false,
  disableDeliveryDate: false,
  allowReturnsOutsidePolicy: false,
  enableTaxAtTotalLevelOnly: false,
  hideCredit: false,
  enablePOAttachmentRequired: false,
  enableComboDeals: true,
  comboDealsUserRole: ComboDealUserRole(1),
  statementOfAccountEnabled: true,
  poReferenceLength: 35,
  referenceNoteLength: 132,
);

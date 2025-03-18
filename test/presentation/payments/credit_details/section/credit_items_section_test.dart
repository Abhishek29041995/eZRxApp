import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/batches.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_details_group.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/credit_and_invoice_details_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/item_tax.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/credit_details/section/credit_items_section.dart';
import 'package:ezrxmobile/presentation/payments/widgets/payment_module.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../common_mock_data/mock_bloc.dart';
import '../../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';
import '../../../../common_mock_data/sales_org_config_mock/fake_mm_sales_org_config.dart';
import '../../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../../common_mock_data/sales_org_config_mock/fake_ph_sales_org_config.dart';
import '../../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../../common_mock_data/sales_org_config_mock/fake_th_sales_org_config.dart';
import '../../../../common_mock_data/sales_org_config_mock/fake_tw_sales_org_config.dart';
import '../../../../common_mock_data/sales_org_config_mock/fake_vn_sales_org_config.dart';
import '../../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../../utils/widget_utils.dart';

void main() {
  late AppRouter autoRouterMock;
  late ProductImageBloc productImageBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late List<CustomerDocumentDetail> fakeDetails;
  late List<CustomerDocumentDetailGroup> fakeCreditItems;

  final eligibilityStateVariant = ValueVariant<EligibilityState>(
    {
      EligibilityState.initial().copyWith(
        salesOrgConfigs: fakePHSalesOrgConfigs,
        salesOrganisation: fakePHSalesOrganisation,
      ),
      EligibilityState.initial().copyWith(
        salesOrgConfigs: fakeSGSalesOrgConfigs,
        salesOrganisation: fakeSGSalesOrganisation,
      ),
      EligibilityState.initial().copyWith(
        salesOrgConfigs: fakeVNSalesOrgConfigs,
        salesOrganisation: fakeVNSalesOrganisation,
      ),
      EligibilityState.initial().copyWith(
        salesOrgConfigs: fakeMYSalesOrgConfigs,
        salesOrganisation: fakeMYSalesOrganisation,
      ),
      EligibilityState.initial().copyWith(
        salesOrgConfigs: fakeIDSalesOrgConfigs,
        salesOrganisation: fakeIDSalesOrganisation,
      ),
      EligibilityState.initial().copyWith(
        salesOrgConfigs: fakeTHSalesOrgConfigs,
        salesOrganisation: fakeTHSalesOrganisation,
      ),
      EligibilityState.initial().copyWith(
        salesOrgConfigs: fakeKHSalesOrgConfigs,
        salesOrganisation: fakeKHSalesOrganisation,
      ),
      EligibilityState.initial().copyWith(
        salesOrgConfigs: fakeMMSalesOrgConfigs,
        salesOrganisation: fakeMMSalesOrganisation,
      ),
      EligibilityState.initial().copyWith(
        salesOrgConfigs: fakeTWSalesOrgConfigs,
        salesOrganisation: fakeTWSalesOrganisation,
      ),
    },
  );

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(
      () => MixpanelService(config: locator<Config>()),
    );
    autoRouterMock = locator<AppRouter>();
    final fakeBatch1 = StringValue('Batch1');
    final fakeExpiry1 = DateTimeStringValue('20240824');
    fakeDetails = (await CreditAndInvoiceDetailsLocalDataSource()
            .getCreditAndInvoiceDetails())
        .take(1)
        .map(
          (e) => e.copyWith(
            batches: [
              Batches(
                batchNumber: fakeBatch1,
                expiryDate: fakeExpiry1,
              ),
            ],
          ),
        )
        .toList();
    fakeCreditItems = [
      CustomerDocumentDetailGroup.empty().copyWith(
        principalName: PrincipalName('fake-PN'),
        items: [fakeDetails.first],
      ),
    ];

    eligibilityBlocMock = EligibilityBlocMock();
    productImageBlocMock = ProductImageBlocMock();
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => productImageBlocMock.state)
        .thenReturn(ProductImageState.initial());
  });

  Future getWidget(tester) async {
    return tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
          BlocProvider<ProductImageBloc>(
            create: (context) => productImageBlocMock,
          ),
        ],
        child: Scaffold(
          body: PaymentModule(
            isMarketPlace: false,
            child: CreditItemsSection(creditItems: fakeCreditItems),
          ),
        ),
      ),
    );
  }

  testWidgets(
    'credit items section ...',
    (tester) async {
      final currentEligibilityState =
          eligibilityStateVariant.currentValue ?? EligibilityState.initial();
      final currentSalesOrgConfigs = currentEligibilityState.salesOrgConfigs;
      final currentSalesOrganisation =
          currentEligibilityState.salesOrganisation;
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: currentSalesOrgConfigs,
          salesOrganisation: currentSalesOrganisation,
        ),
      );

      await getWidget(tester);
      await tester.pump();

      final principalName = find.text('fake-PN');
      expect(principalName, findsOneWidget);

      final commonTileItem = find.byType(CommonTileItem);
      expect(commonTileItem, findsNWidgets(fakeDetails.length));
      for (final e in fakeDetails) {
        expect(
          find.descendant(
            of: find.byType(CommonTileItem),
            matching: find.textContaining(
              'Batch: ${e.batches.first.batchNumber.displayNAIfEmpty} - Expires: ${e.batches.first.expiryDate.dateString}',
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
        expect(
          find.text(
            '${'Qty'.tr()}: ${e.billingQuantity.getOrDefaultValue(0)}',
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.invoiceDetailMaterialUnitPrice),
            matching: find.text(
              StringUtils.priceComponentDisplayPrice(
                currentSalesOrgConfigs,
                currentSalesOrgConfigs.displaySubtotalTaxBreakdown
                    ? e.unitNetPrice
                    : e.unitGrossPrice,
                false,
              ),
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.cartItemProductTotalPrice),
            matching: find.text(
              e.unitNetPrice == 0
                  ? 'FREE'
                  : StringUtils.priceComponentDisplayPrice(
                      currentSalesOrgConfigs,
                      currentSalesOrgConfigs.displaySubtotalTaxBreakdown
                          ? e.netAmount
                          : (e.netAmount * (1 + e.taxPercent / 100)),
                      false,
                    ),
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byType(ItemTax),
            matching: find.text(
              ' (${e.taxPercent}% ${'tax'.tr()})',
            ),
          ),
          (currentSalesOrgConfigs.displayItemTaxBreakdown && e.netAmount > 0)
              ? findsOneWidget
              : findsNothing,
        );
        expect(
          find.descendant(
            of: find.byType(ItemTax),
            matching: find.text(
              StringUtils.priceComponentDisplayPrice(
                currentSalesOrgConfigs,
                e.netAmount * (1 + e.taxPercent / 100),
                false,
              ),
              findRichText: true,
            ),
          ),
          (currentSalesOrgConfigs.displayItemTaxBreakdown && e.netAmount > 0)
              ? findsOneWidget
              : findsNothing,
        );
      }
    },
    variant: eligibilityStateVariant,
  );
}

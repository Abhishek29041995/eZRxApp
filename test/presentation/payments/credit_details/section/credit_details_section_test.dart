import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/credit_and_invoice_details_local.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/presentation/payments/credit_details/section/credit_details_section.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';

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
import '../../../account/account_tab_test.dart';

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class CreditAndInvoiceDetailsBlocMock
    extends MockBloc<CreditAndInvoiceDetailsEvent, CreditAndInvoiceDetailsState>
    implements CreditAndInvoiceDetailsBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class ProductImageBlocMock
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

void main() {
  late AppRouter autoRouterMock;
  final locator = GetIt.instance;

  late SalesOrgBloc salesOrgBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late CreditAndInvoiceDetailsBloc creditAndInvoiceDetailsBlocMock;
  late ProductImageBloc productImageBlocMock;
  late UserBloc userBlocMock;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late List<CustomerDocumentDetail> fakeItemList;

  late CreditAndInvoiceItem fakeInvoice;
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
    fakeInvoice =
        (await AllCreditsAndInvoicesLocalDataSource().getDocumentHeaderList())
            .first
            .copyWith(
              orderId: StringValue(
                'fake-id',
              ),
            );
    fakeItemList = await CreditAndInvoiceDetailsLocalDataSource()
        .getCreditAndInvoiceDetails();
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    creditAndInvoiceDetailsBlocMock = CreditAndInvoiceDetailsBlocMock();
    customerCodeBlocMock = CustomerCodeBlocMock();

    userBlocMock = UserBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    authBlocMock = AuthBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    productImageBlocMock = ProductImageBlocMock();

    when(() => creditAndInvoiceDetailsBlocMock.state)
        .thenReturn(CreditAndInvoiceDetailsState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());

    when(() => userBlocMock.state).thenReturn(UserState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
  });

  Future getWidget(
    tester, {
    required List<CustomerDocumentDetail> creditItems,
  }) async {
    return tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<ProductImageBloc>(
            create: (context) => productImageBlocMock,
          ),
          BlocProvider<CreditAndInvoiceDetailsBloc>(
            create: (context) => creditAndInvoiceDetailsBlocMock,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<UserBloc>(
            create: (context) => userBlocMock,
          ),
          BlocProvider<SalesOrgBloc>(
            create: (context) => salesOrgBlocMock,
          ),
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
        ],
        child: Scaffold(
          body: CreditDetailsSection(
            creditItem: fakeInvoice,
            creditItems: creditItems,
          ),
        ),
      ),
    );
  }

  testWidgets(
    'credit details section ...',
    (tester) async {
      final currentEligibilityState =
          eligibilityStateVariant.currentValue ?? EligibilityState.initial();
      final currentSalesOrgConfigs = currentEligibilityState.salesOrgConfigs;
      final currentSalesOrganisation =
          currentEligibilityState.salesOrganisation;
      when(() => eligibilityBlocMock.state).thenReturn(
        currentEligibilityState,
      );

      when(() => customerCodeBlocMock.state).thenReturn(
        CustomerCodeState.initial(),
      );

      await getWidget(tester, creditItems: fakeItemList);
      await tester.pump();

      final item = find.byType(CreditDetailsSection);
      expect(item, findsOneWidget);

      final textKey = find.text(
        '${fakeInvoice.postingKeyName} #${fakeInvoice.searchKey.getOrCrash()}',
      );
      expect(textKey, findsOneWidget);

      final textStatus =
          find.text(fakeInvoice.invoiceProcessingStatus.getValue());
      expect(textStatus, findsOneWidget);

      final textDocumentDate =
          find.byKey(Key('Document date${fakeInvoice.postingDate.dateString}'));
      expect(textDocumentDate, findsOneWidget);

      final textDocumentType =
          find.byKey(Key('Document type${fakeInvoice.postingKeyName}'));
      expect(textDocumentType, findsOneWidget);

      final textReferenceNumber = find.byKey(
        Key(
          'Reference Number${fakeInvoice.invoiceReference.getOrDefaultValue('NA')}',
        ),
      );
      expect(textReferenceNumber, findsOneWidget);

      final textDetail =
          find.byKey(Key('Details${fakeInvoice.postingKeyName}'));
      expect(textDetail, findsOneWidget);

      final textCreditSummary = find.text('Credit summary');
      expect(textCreditSummary, findsOneWidget);

      final creditDetailSubTotalFinder =
          find.byKey(WidgetKeys.creditDetailSubTotal);
      final creditDetailSmallOrderFeeFinder =
          find.byKey(WidgetKeys.creditDetailSmallOrderFee);
      final creditDetailManualFeeFinder =
          find.byKey(WidgetKeys.creditDetailManualFee);
      final creditDetailCreditTotalFinder =
          find.byKey(WidgetKeys.creditDetailCreditTotal);
      final creditDetailTax = find.byKey(WidgetKeys.creditDetailTax);
      expect(
        find.descendant(
          of: creditDetailSubTotalFinder,
          matching: find.text(
            'Subtotal (${currentSalesOrgConfigs.displayPrefixTax}.tax)',
          ),
        ),
        findsOneWidget,
      );

      expect(
        find.descendant(
          of: creditDetailSubTotalFinder,
          matching: find.text(
            StringUtils.priceComponentDisplayPrice(
              currentSalesOrgConfigs,
              currentSalesOrgConfigs.displaySubtotalTaxBreakdown
                  ? fakeItemList.totalNetAmount
                  : fakeItemList.totalGrossAmount,
              false,
            ),
            findRichText: true,
          ),
        ),
        findsOneWidget,
      );
      if (currentSalesOrgConfigs.displaySubtotalTaxBreakdown) {
        expect(
          find.descendant(
            of: creditDetailTax,
            matching: find.text(
              'Tax'.tr(),
            ),
          ),
          findsOneWidget,
        );

        expect(
          find.descendant(
            of: creditDetailTax,
            matching: find.text(
              StringUtils.priceComponentDisplayPrice(
                currentSalesOrgConfigs,
                fakeItemList.totalTaxAmount,
                false,
              ),
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
      }

      if (currentSalesOrganisation.salesOrg.showSmallOrderFee) {
        expect(
          find.descendant(
            of: creditDetailSmallOrderFeeFinder,
            matching: find.textContaining(
              'Small order fee'.tr(),
            ),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: creditDetailSmallOrderFeeFinder,
            matching: find.text(
              StringUtils.priceComponentDisplayPrice(
                currentSalesOrgConfigs,
                fakeInvoice.deliveryFee,
                false,
              ),
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
        expect(
          find.text(
              '${'Applies to orders less than'.tr()} ${StringUtils.formatPrice(
            currentSalesOrgConfigs,
            currentSalesOrgConfigs.salesOrg.smallOrderThreshold,
          )}'),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: creditDetailManualFeeFinder,
            matching: find.text(
              '${'Manual fee'.tr()}:',
            ),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: creditDetailManualFeeFinder,
            matching: find.text(
              StringUtils.priceComponentDisplayPrice(
                currentSalesOrgConfigs,
                fakeInvoice.manualFee,
                false,
              ),
              findRichText: true,
            ),
          ),
          findsOneWidget,
        );
      }

      expect(
        find.descendant(
          of: creditDetailCreditTotalFinder,
          matching: find.text(
            'Credit total:'.tr(),
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: creditDetailCreditTotalFinder,
          matching: find.text(
            StringUtils.priceComponentDisplayPrice(
              currentSalesOrgConfigs,
              fakeInvoice.amountInTransactionCurrency,
              false,
            ),
            findRichText: true,
          ),
        ),
        findsOneWidget,
      );
    },
    variant: eligibilityStateVariant,
  );
  testWidgets(
    'credit details section -- Display message for credit note without return items',
    (tester) async {
      final currentEligibilityState =
          eligibilityStateVariant.currentValue ?? EligibilityState.initial();
      final currentSalesOrgConfigs = currentEligibilityState.salesOrgConfigs;
      when(() => eligibilityBlocMock.state).thenReturn(
        currentEligibilityState,
      );

      when(() => customerCodeBlocMock.state).thenReturn(
        CustomerCodeState.initial(),
      );

      await getWidget(tester, creditItems: []);
      await tester.pump();

      final item = find.byType(CreditDetailsSection);
      expect(item, findsOneWidget);

      final textKey = find.text(
        '${fakeInvoice.postingKeyName} #${fakeInvoice.searchKey.getOrCrash()}',
      );
      expect(textKey, findsOneWidget);

      final textStatus =
          find.text(fakeInvoice.invoiceProcessingStatus.getValue());
      expect(textStatus, findsOneWidget);

      final textDocumentDate =
          find.byKey(Key('Document date${fakeInvoice.postingDate.dateString}'));
      expect(textDocumentDate, findsOneWidget);

      final textDocumentType =
          find.byKey(Key('Document type${fakeInvoice.postingKeyName}'));
      expect(textDocumentType, findsOneWidget);

      final textReferenceNumber = find.byKey(
        Key(
          'Reference Number${fakeInvoice.invoiceReference.getOrDefaultValue('NA')}',
        ),
      );
      expect(textReferenceNumber, findsOneWidget);

      final textDetail =
          find.byKey(Key('Details${fakeInvoice.postingKeyName}'));
      expect(textDetail, findsOneWidget);

      final textCreditSummary = find.text('Credit summary');
      expect(textCreditSummary, findsOneWidget);

      final creditDetailSubTotalFinder =
          find.byKey(WidgetKeys.creditDetailSubTotal);
      final creditDetailCreditTotalFinder =
          find.byKey(WidgetKeys.creditDetailCreditTotal);
      final creditDetailTax = find.byKey(WidgetKeys.creditDetailTax);
      final creditItemAmountAdjustmentMessageWidget =
          find.byKey(WidgetKeys.creditItemAmountAdjustmentMessageWidget);
      expect(
        find.descendant(
          of: creditDetailSubTotalFinder,
          matching: find.text(
            'Subtotal (${currentSalesOrgConfigs.displayPrefixTax}.tax)',
          ),
        ),
        findsNothing,
      );

      expect(
        find.descendant(
          of: creditDetailSubTotalFinder,
          matching: find.text(
            StringUtils.priceComponentDisplayPrice(
              currentSalesOrgConfigs,
              currentSalesOrgConfigs.displaySubtotalTaxBreakdown
                  ? fakeItemList.totalNetAmount
                  : fakeItemList.totalGrossAmount,
              false,
            ),
            findRichText: true,
          ),
        ),
        findsNothing,
      );
      if (currentSalesOrgConfigs.displaySubtotalTaxBreakdown) {
        expect(
          find.descendant(
            of: creditDetailTax,
            matching: find.text(
              'Tax'.tr(),
            ),
          ),
          findsNothing,
        );

        expect(
          find.descendant(
            of: creditDetailTax,
            matching: find.text(
              StringUtils.priceComponentDisplayPrice(
                currentSalesOrgConfigs,
                fakeItemList.totalTaxAmount,
                false,
              ),
              findRichText: true,
            ),
          ),
          findsNothing,
        );
      }
      expect(
        find.descendant(
          of: creditDetailCreditTotalFinder,
          matching: find.text(
            'Credit total:'.tr(),
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: creditDetailCreditTotalFinder,
          matching: find.text(
            StringUtils.priceComponentDisplayPrice(
              currentSalesOrgConfigs,
              fakeInvoice.amountInTransactionCurrency,
              false,
            ),
            findRichText: true,
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: creditItemAmountAdjustmentMessageWidget,
          matching: find.text(
            'Return items are not related to this credit note. The total may or may not reflect the tax amount adjustments.'
                .tr(),
          ),
        ),
        findsOneWidget,
      );
    },
    variant: eligibilityStateVariant,
  );
}

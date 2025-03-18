import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/application/payments/download_e_credit/download_e_credit_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/batches.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/credit_and_invoice_details_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_seller_title.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_title_with_logo.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/credit_details/credit_details.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late CreditAndInvoiceDetailsBloc creditAndInvoiceDetailsBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late AppRouter autoRouterMock;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late ProductImageBloc productImageBlocMock;
  late List<CreditAndInvoiceItem> customerDocumentDetails;
  late DownloadECreditBloc downloadECreditBlocMock;
  late List<CustomerDocumentDetail> fakeDetails;

  setUpAll(() async {
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => MixpanelServiceMock());

    autoRouterMock = locator<AppRouter>();
    fakeDetails = (await CreditAndInvoiceDetailsLocalDataSource()
            .getCreditAndInvoiceDetails())
        .toList();
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    creditAndInvoiceDetailsBlocMock = CreditAndInvoiceDetailsBlocMock();
    downloadECreditBlocMock = DownloadECreditBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    authBlocMock = AuthBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    productImageBlocMock = ProductImageBlocMock();
    customerDocumentDetails =
        await AllCreditsAndInvoicesLocalDataSource().getDocumentHeaderList();

    when(() => creditAndInvoiceDetailsBlocMock.state)
        .thenReturn(CreditAndInvoiceDetailsState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => downloadECreditBlocMock.state)
        .thenReturn(DownloadECreditState.initial());
    when(() => productImageBlocMock.state)
        .thenReturn(ProductImageState.initial());
  });

  Future getWidget(tester, {bool isMarketPlace = false}) async {
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
          BlocProvider<DownloadECreditBloc>(
            create: (context) => downloadECreditBlocMock,
          ),
        ],
        child: CreditDetailsPage(isMarketPlace: isMarketPlace),
      ),
    );
  }

  group('Credit Details Screen Test', () {
    final fakeBatch1 = StringValue('Batch1');
    final fakeExpiry1 = DateTimeStringValue('20240824');

    testWidgets('=> LoadingImage  Test', (tester) async {
      when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
        CreditAndInvoiceDetailsState.initial().copyWith(
          isLoading: true,
        ),
      );
      await getWidget(tester);
      await tester.pump();
      final loaderImage = find.byKey(
        WidgetKeys.loaderImage,
      );
      expect(loaderImage, findsOneWidget);
      final creditDetailsPageListView =
          find.byKey(WidgetKeys.creditDetailsPageListView);
      expect(creditDetailsPageListView, findsNothing);
    });

    testWidgets('=> Detail view  Test', (tester) async {
      when(() => productImageBlocMock.state).thenReturn(
        ProductImageState.initial(),
      );
      await getWidget(tester);
      await tester.pump();
      final loaderImage = find.byKey(
        WidgetKeys.loaderImage,
      );
      expect(loaderImage, findsNothing);

      final creditDetailsPageListView =
          find.byKey(WidgetKeys.creditDetailsPageListView);
      expect(creditDetailsPageListView, findsOneWidget);
    });

    testWidgets('Find Gov.No in Credit Details Page', (tester) async {
      when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
        CreditAndInvoiceDetailsState.initial()
            .copyWith(basicInfo: customerDocumentDetails.first),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeVNSalesOrganisation,
        ),
      );

      await getWidget(tester);
      await tester.pump();

      final documentReferenceID =
          find.byKey(WidgetKeys.balanceTextRow('Gov. no', '0810234244'));
      expect(documentReferenceID, findsOneWidget);
    });

    testWidgets('Find Tax Amount', (tester) async {
      when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
        CreditAndInvoiceDetailsState.initial().copyWith(
          basicInfo: customerDocumentDetails.first,
          itemsInfo: [
            CustomerDocumentDetail.empty().copyWith(
              taxAmount: 15,
            ),
          ],
        ),
      );
      when(() => productImageBlocMock.state).thenReturn(
        ProductImageState.initial(),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSGSalesOrganisation,
          salesOrgConfigs: fakeSGSalesOrgConfigs,
        ),
      );

      await getWidget(tester);
      await tester.pumpAndSettle();

      final tax = find.text('Tax');
      final totalTaxAmount = find.text('SGD 15.00', findRichText: true);

      expect(tax, findsOneWidget);
      expect(totalTaxAmount, findsOneWidget);
    });

    testWidgets('Find download e credit button', (tester) async {
      when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
        CreditAndInvoiceDetailsState.initial().copyWith(
          basicInfo: customerDocumentDetails.first,
        ),
      );
      when(() => downloadECreditBlocMock.state).thenReturn(
        DownloadECreditState.initial().copyWith(
          fileUrl: DownloadPaymentAttachment.empty()
              .copyWith(url: 'fake-eCredit-url'),
        ),
      );
      await getWidget(tester);
      await tester.pumpAndSettle();
      final downloadECreditButton =
          find.byKey(WidgetKeys.downloadECreditButton);
      expect(downloadECreditButton, findsOneWidget);
      await tester.tap(downloadECreditButton);
      verify(
        () => downloadECreditBlocMock.add(
          const DownloadECreditEvent.downloadECredit(),
        ),
      ).called(1);
    });

    testWidgets(
        'test download e credit button not clickable when download is in progress ',
        (tester) async {
      when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
        CreditAndInvoiceDetailsState.initial().copyWith(
          basicInfo: customerDocumentDetails.first,
        ),
      );

      when(() => downloadECreditBlocMock.state).thenReturn(
        DownloadECreditState.initial().copyWith(
          isDownloading: true,
          fileUrl: DownloadPaymentAttachment.empty()
              .copyWith(url: 'fake-eCredit-url'),
        ),
      );

      await getWidget(tester);
      await tester.pump();
      final downloadECreditLoadingAnimationWidget =
          find.byKey(WidgetKeys.downloadECreditLoadingAnimationWidget);

      expect(downloadECreditLoadingAnimationWidget, findsOneWidget);
      await tester.tap(downloadECreditLoadingAnimationWidget);
      verifyNever(
        () => downloadECreditBlocMock.add(
          const DownloadECreditEvent.downloadECredit(),
        ),
      );
      await tester.pump();
    });

    testWidgets(
      ' -> Find Account Suspended Banner when Customer Code is blocked',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeBlockedCustomerCodeInfo,
          ),
        );
        await getWidget(tester);
        await tester.pump();

        final customerBlockedBanner =
            find.byKey(WidgetKeys.customerBlockedBanner);

        expect(customerBlockedBanner, findsOneWidget);
      },
    );

    testWidgets(
      ' -> Find Account Suspended Banner when ship to Code is blocked',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            shipToInfo: fakeBlockedShipToInfo,
          ),
        );
        await getWidget(tester);
        await tester.pump();

        final customerBlockedBanner =
            find.byKey(WidgetKeys.customerBlockedBanner);

        expect(customerBlockedBanner, findsOneWidget);
      },
    );
    testWidgets(
      ' -> Verify Return Item Section in credit details screen',
      (WidgetTester tester) async {
        when(() => productImageBlocMock.state).thenReturn(
          ProductImageState.initial(),
        );
        when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
          CreditAndInvoiceDetailsState.initial().copyWith(
            itemsInfo: fakeDetails,
            // isLoading: false,
          ),
        );
        await getWidget(tester);
        await tester.pump();

        final textReturnItemCount =
            find.byKey(WidgetKeys.creditDetailsReturnItemCount);
        expect(textReturnItemCount, findsOneWidget);
        expect(
          (tester.widget(textReturnItemCount) as Text).data,
          '${'Return items'.tr()} (${fakeDetails.length})',
        );
      },
    );

    testWidgets(
        ' -> Find marketplace logo and display batch, expiry date as NA',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial()
            .copyWith(salesOrgConfigs: fakeMYSalesOrgConfigs),
      );
      when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
        CreditAndInvoiceDetailsState.initial().copyWith(
          itemsInfo: [
            fakeDetails.first.copyWith(
              batches: [
                Batches(
                  batchNumber: fakeBatch1,
                  expiryDate: fakeExpiry1,
                ),
              ],
            ),
          ],
        ),
      );
      await getWidget(tester, isMarketPlace: true);
      await tester.pumpAndSettle();
      final scrollList = find.byKey(WidgetKeys.creditDetailsPageListView);
      final mpLogo = find.byType(MarketPlaceTitleWithLogo);
      await tester.dragUntilVisible(
        mpLogo,
        scrollList,
        const Offset(0, -200),
      );
      await tester.pump();
      expect(mpLogo, findsOne);
      final invoiceTile = find.byKey(WidgetKeys.creditDetailMaterial(0, 0));
      await tester.dragUntilVisible(
        invoiceTile,
        scrollList,
        const Offset(0, -200),
      );
      await tester.pump();
      expect(
        find.descendant(
          of: find.byType(MarketPlaceSellerTitle),
          matching: find.text(
            fakeDetails.first.principalData.principalName.name,
          ),
        ),
        findsOne,
      );
      expect(
        find.descendant(
          of: invoiceTile,
          matching: find.textContaining(
            'Batch: NA - Expires: NA',
            findRichText: true,
          ),
        ),
        findsOne,
      );
    });

    testWidgets(
        ' -> Display Batch and EXP info when salesOrgConfig BatchNumDisplay is true for multiple batch and expiry',
        (tester) async {
      final fakeBatch1 = StringValue('Batch1');
      final fakeBatch2 = StringValue('Batch2');
      final fakeExpiry1 = DateTimeStringValue('20240824');
      final fakeExpiry2 = DateTimeStringValue('20250824');

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial()
            .copyWith(salesOrgConfigs: fakeMYSalesOrgConfigs),
      );
      when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
        CreditAndInvoiceDetailsState.initial().copyWith(
          itemsInfo: [
            fakeDetails.first.copyWith(
              batches: [
                Batches(
                  batchNumber: fakeBatch1,
                  expiryDate: fakeExpiry1,
                ),
                Batches(
                  batchNumber: fakeBatch2,
                  expiryDate: fakeExpiry2,
                ),
              ],
            ),
          ],
        ),
      );
      await getWidget(tester);
      await tester.pumpAndSettle();
      final scrollList = find.byKey(WidgetKeys.creditDetailsPageListView);
      final invoiceTile = find.byKey(WidgetKeys.creditDetailMaterial(0, 0));
      await tester.dragUntilVisible(
        invoiceTile,
        scrollList,
        const Offset(0, -200),
      );
      await tester.pump();
      final expectedDelivery1 = find.textContaining(
        '${'Batch'.tr()}: ${fakeBatch1.displayDashIfEmpty} - ${'Expires'.tr()}: ${fakeExpiry1.dateOrDashString}',
        findRichText: true,
      );
      final expectedDelivery2 = find.textContaining(
        '${'Batch'.tr()}: ${fakeBatch2.displayDashIfEmpty} - ${'Expires'.tr()}: ${fakeExpiry2.dateOrDashString}',
        findRichText: true,
      );
      expect(expectedDelivery1, findsOneWidget);
      expect(expectedDelivery2, findsOneWidget);
    });

    testWidgets(
        ' -> Display Batch and EXP info when salesOrgConfig BatchNumDisplay is false for multiple batch and expiry',
        (tester) async {
      final fakeBatch1 = StringValue('Batch1');
      final fakeBatch2 = StringValue('Batch2');
      final fakeExpiry1 = DateTimeStringValue('20240824');
      final fakeExpiry2 = DateTimeStringValue('20250824');

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs.copyWith(
            batchNumDisplay: false,
          ),
        ),
      );
      when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
        CreditAndInvoiceDetailsState.initial().copyWith(
          itemsInfo: [
            fakeDetails.first.copyWith(
              batches: [
                Batches(
                  batchNumber: fakeBatch1,
                  expiryDate: fakeExpiry1,
                ),
                Batches(
                  batchNumber: fakeBatch2,
                  expiryDate: fakeExpiry2,
                ),
              ],
            ),
          ],
        ),
      );
      await getWidget(tester);
      await tester.pumpAndSettle();
      final scrollList = find.byKey(WidgetKeys.creditDetailsPageListView);
      final invoiceTile = find.byKey(WidgetKeys.creditDetailMaterial(0, 0));
      await tester.dragUntilVisible(
        invoiceTile,
        scrollList,
        const Offset(0, -200),
      );
      await tester.pump();
      final expectedDelivery1 = find.textContaining(
        '${'Batch'.tr()}: ${fakeBatch1.displayDashIfEmpty} - ${'Expires'.tr()}: ${fakeExpiry1.dateOrDashString}',
        findRichText: true,
      );
      final expectedDelivery2 = find.textContaining(
        '${'Batch'.tr()}: ${fakeBatch2.displayDashIfEmpty} - ${'Expires'.tr()}: ${fakeExpiry2.dateOrDashString}',
        findRichText: true,
      );
      expect(expectedDelivery1, findsOneWidget);
      expect(expectedDelivery2, findsOneWidget);
    });
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/application/payments/download_e_invoice/download_e_invoice_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/access_right.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/batches.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/item_tax.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_seller_title.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_title_with_logo.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/credit_and_invoice_details_local.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/invoice_details/invoice_details.dart';
import 'package:ezrxmobile/presentation/payments/invoice_details/section/invoice_details_section.dart';
import 'package:ezrxmobile/presentation/payments/invoice_details/section/order_number_section.dart';
import 'package:ezrxmobile/presentation/payments/invoice_details/section/summary.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_mm_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_ph_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_th_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_tw_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_vn_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late CreditAndInvoiceDetailsBloc creditAndInvoiceDetailsBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late AppRouter autoRouterMock;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late ProductImageBlocMock productImageBlocMock;
  late ViewByOrderBlocMock viewByOrderBlocMock;
  late ViewByOrderDetailsBlocMock viewByOrderDetailsBlocMock;
  late ViewByItemDetailsBlocMock viewByItemDetailsBlocMock;
  late DownloadEInvoiceBlocMock downloadEInvoiceBlocMock;
  late CreditAndInvoiceItem fakeInvoice;
  late List<CustomerDocumentDetail> fakeInvoiceDetail;
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
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => MixpanelServiceMock());
    locator.registerFactory<ViewByOrderBloc>(() => viewByOrderBlocMock);
    locator
        .registerFactory<DownloadEInvoiceBloc>(() => downloadEInvoiceBlocMock);

    autoRouterMock = locator<AppRouter>();

    WidgetsFlutterBinding.ensureInitialized();
    creditAndInvoiceDetailsBlocMock = CreditAndInvoiceDetailsBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    authBlocMock = AuthBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    productImageBlocMock = ProductImageBlocMock();
    viewByOrderBlocMock = ViewByOrderBlocMock();
    viewByOrderDetailsBlocMock = ViewByOrderDetailsBlocMock();
    viewByItemDetailsBlocMock = ViewByItemDetailsBlocMock();
    downloadEInvoiceBlocMock = DownloadEInvoiceBlocMock();

    fakeInvoice =
        (await AllCreditsAndInvoicesLocalDataSource().getDocumentHeaderList())
            .first
            .copyWith(
              orderId: StringValue(
                'fake-id',
              ),
            );
    fakeInvoiceDetail = await CreditAndInvoiceDetailsLocalDataSource()
        .getCreditAndInvoiceDetails();
  });

  setUp(() async {
    when(() => creditAndInvoiceDetailsBlocMock.state)
        .thenReturn(CreditAndInvoiceDetailsState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => productImageBlocMock.state)
        .thenReturn(ProductImageState.initial());
    when(() => viewByOrderBlocMock.state)
        .thenReturn(ViewByOrderState.initial());
    when(() => viewByOrderDetailsBlocMock.state)
        .thenReturn(ViewByOrderDetailsState.initial());
    when(() => viewByItemDetailsBlocMock.state)
        .thenReturn(ViewByItemDetailsState.initial());
    when(() => downloadEInvoiceBlocMock.state)
        .thenReturn(DownloadEInvoiceState.initial());
  });

  Future getWidget(tester, {bool isMarketPlace = false}) async {
    return tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
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
          BlocProvider<ProductImageBloc>(
            create: (context) => productImageBlocMock,
          ),
          BlocProvider<ViewByOrderBloc>(
            create: (context) => viewByOrderBlocMock,
          ),
          BlocProvider<ViewByOrderDetailsBloc>(
            create: (context) => viewByOrderDetailsBlocMock,
          ),
          BlocProvider<ViewByItemDetailsBloc>(
            create: (context) => viewByItemDetailsBlocMock,
          ),
        ],
        child: InvoiceDetailsPage(isMarketPlace: isMarketPlace),
      ),
    );
  }

  group('Invoice Details Screen Test', () {
    final fakeBatch1 = StringValue('Batch1');
    final fakeExpiry1 = DateTimeStringValue('20240824');

    group(' => Download e-invoice button test', () {
      testWidgets(' => download e-invoice button visible', (tester) async {
        when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
          CreditAndInvoiceDetailsState.initial().copyWith(
            itemsInfo: fakeInvoiceDetail,
            basicInfo: fakeInvoice,
          ),
        );

        when(() => downloadEInvoiceBlocMock.state).thenReturn(
          DownloadEInvoiceState.initial().copyWith.eInvoiceUrl(url: 'fake-url'),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        );

        await getWidget(tester);
        await tester.pumpAndSettle();

        final downloadEInvoiceButton =
            find.byKey(WidgetKeys.downloadEInvoiceButton);
        expect(downloadEInvoiceButton, findsOneWidget);
        expect(
          find.descendant(
            of: downloadEInvoiceButton,
            matching: find.text('Download e-invoice'),
          ),
          findsOne,
        );
        await tester.tap(downloadEInvoiceButton);
        await tester.pumpAndSettle();
        verify(
          () => downloadEInvoiceBlocMock.add(
            DownloadEInvoiceEvent.fetchUrl(
              salesOrg: fakeMYSalesOrganisation.salesOrg,
              customerCodeInfo: fakeCustomerCodeInfo,
              invoiceNumber: fakeInvoice.searchKey.getOrDefaultValue(''),
            ),
          ),
        ).called(1);
        verify(
          () => downloadEInvoiceBlocMock
              .add(const DownloadEInvoiceEvent.download()),
        );
      });
      testWidgets(' => download e-invoice button invisible', (tester) async {
        await getWidget(tester);
        await tester.pumpAndSettle();

        expect(find.byKey(WidgetKeys.downloadEInvoiceButton), findsNothing);
      });

      testWidgets(' => download e-invoice button downloading state',
          (tester) async {
        when(() => downloadEInvoiceBlocMock.state).thenReturn(
          DownloadEInvoiceState.initial()
              .copyWith
              .eInvoiceUrl(url: 'fake-url')
              .copyWith(isDownloading: true),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        );

        await getWidget(tester);
        await tester.pump();

        final downloadEInvoiceButton =
            find.byKey(WidgetKeys.downloadEInvoiceButton);
        expect(downloadEInvoiceButton, findsOneWidget);
        expect(
          find.descendant(
            of: downloadEInvoiceButton,
            matching: find.text('Downloading...'),
          ),
          findsOne,
        );
        await tester.tap(downloadEInvoiceButton);
        await tester.pump();
        verifyNever(
          () => downloadEInvoiceBlocMock
              .add(const DownloadEInvoiceEvent.openFile()),
        );
      });

      testWidgets(' => open e-invoice button visible', (tester) async {
        when(() => downloadEInvoiceBlocMock.state).thenReturn(
          DownloadEInvoiceState.initial()
              .copyWith
              .eInvoiceUrl(url: 'fake-url')
              .copyWith
              .eInvoice(name: 'fake-name'),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeMYSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        );

        await getWidget(tester);
        await tester.pumpAndSettle();

        final downloadEInvoiceButton =
            find.byKey(WidgetKeys.downloadEInvoiceButton);
        expect(downloadEInvoiceButton, findsOneWidget);
        expect(
          find.descendant(
            of: downloadEInvoiceButton,
            matching: find.text('Open e-invoice'),
          ),
          findsOne,
        );
        await tester.tap(downloadEInvoiceButton);
        await tester.pumpAndSettle();
        verify(
          () => downloadEInvoiceBlocMock
              .add(const DownloadEInvoiceEvent.openFile()),
        ).called(1);
      });
    });

    testWidgets(' => LoadingImage Test', (tester) async {
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
      final viewByOrderDetailsPageListView = find.byKey(WidgetKeys.scrollList);
      expect(viewByOrderDetailsPageListView, findsNothing);
    });

    testWidgets(' => Detail page view Test', (tester) async {
      final expectedState = [
        CreditAndInvoiceDetailsState.initial().copyWith(
          isLoading: true,
          itemsInfo: fakeInvoiceDetail,
        ),
        CreditAndInvoiceDetailsState.initial().copyWith(
          itemsInfo: fakeInvoiceDetail,
        ),
      ];

      whenListen(
        creditAndInvoiceDetailsBlocMock,
        Stream.fromIterable(expectedState),
      );

      await getWidget(tester);
      await tester.pumpAndSettle();

      final loaderImage = find.byKey(
        WidgetKeys.loaderImage,
      );
      expect(loaderImage, findsNothing);

      final viewByOrderDetailsPageListView = find.byKey(WidgetKeys.scrollList);
      expect(viewByOrderDetailsPageListView, findsOneWidget);
    });

    testWidgets(' => Show loading widget when order number section is loading',
        (tester) async {
      when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
        CreditAndInvoiceDetailsState.initial().copyWith(
          itemsInfo: fakeInvoiceDetail,
          basicInfo: fakeInvoice,
        ),
      );
      when(() => viewByOrderBlocMock.state).thenReturn(
        ViewByOrderState.initial().copyWith(
          isFetching: true,
        ),
      );

      await getWidget(tester);
      await tester.pump();
      expect(find.byKey(WidgetKeys.scrollList), findsOneWidget);
      expect(find.byType(InvoiceDetailsSection), findsOneWidget);
      expect(find.byType(OrderNumberSection), findsOneWidget);
      expect(find.textContaining('Order number'), findsOneWidget);
      expect(
        find.byKey(
          WidgetKeys.invoiceDetailsOrderNumberLoading,
        ),
        findsOneWidget,
      );
    });
    testWidgets(' => Detail page order number onTap Test', (tester) async {
      when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
        CreditAndInvoiceDetailsState.initial().copyWith(
          itemsInfo: fakeInvoiceDetail,
          basicInfo: fakeInvoice,
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            accessRight: AccessRight.empty().copyWith(
              orders: true,
            ),
          ),
        ),
      );

      await getWidget(tester);
      await tester.pumpAndSettle();
      expect(find.byKey(WidgetKeys.scrollList), findsOneWidget);
      expect(find.byType(InvoiceDetailsSection), findsOneWidget);
      expect(find.byType(OrderNumberSection), findsOneWidget);
      expect(find.textContaining('Order number'), findsOneWidget);
      final invoiceDetailsOrderNumberButton =
          find.byKey(WidgetKeys.invoiceDetailsOrderNumberButton);
      expect(
        invoiceDetailsOrderNumberButton,
        findsOneWidget,
      );
      await tester.tap(invoiceDetailsOrderNumberButton);
      await tester.pump();
      verify(
        () => viewByOrderBlocMock.add(
          ViewByOrderEvent.fetch(
            filter: ViewByOrdersFilter.empty(),
            searchKey: SearchKey.search(
              'fake-id',
            ),
            isDetailsPage: true,
          ),
        ),
      ).called(1);
    });
    testWidgets(' => Order number section listen when onTap Test',
        (tester) async {
      final fakeViewByOrder = ViewByOrder.empty().copyWith(
        orderHeaders: [
          OrderHistoryDetails.empty(),
        ],
      );

      when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
        CreditAndInvoiceDetailsState.initial().copyWith(
          basicInfo: fakeInvoice,
        ),
      );
      whenListen(
        viewByOrderBlocMock,
        Stream.fromIterable([
          ViewByOrderState.initial(),
          ViewByOrderState.initial().copyWith(
            failureOrSuccessOption: optionOf(const Right(unit)),
            viewByOrderList: fakeViewByOrder,
            searchKey: SearchKey.search('test'),
          ),
        ]),
      );

      await getWidget(tester);
      await tester.pumpAndSettle();

      verify(
        () => viewByOrderDetailsBlocMock.add(
          ViewByOrderDetailsEvent.setOrderDetails(
            orderHistoryDetails: fakeViewByOrder.orderHeaders.first,
          ),
        ),
      ).called(1);
      expect(autoRouterMock.current.name, ViewByOrderDetailsPageRoute.name);
    });

    testWidgets(
        ' => Order number section listen when onTap Test - failure case',
        (tester) async {
      const failureMessage = 'fakeMessage';
      when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
        CreditAndInvoiceDetailsState.initial().copyWith(basicInfo: fakeInvoice),
      );
      whenListen(
        viewByOrderBlocMock,
        Stream.fromIterable([
          ViewByOrderState.initial().copyWith(isFetching: true),
          ViewByOrderState.initial().copyWith(
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other(failureMessage))),
            searchKey: SearchKey.search('fake_searchKey'),
          ),
        ]),
      );

      await getWidget(tester);
      await tester.pumpAndSettle();

      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byType(CustomSnackBar),
          matching: find.text(
            failureMessage,
          ),
        ),
        findsOneWidget,
      );
    });

    testWidgets(
      ' => Display invoice summary for all market',
      (tester) async {
        final currentEligibilityState =
            eligibilityStateVariant.currentValue ?? EligibilityState.initial();
        final currentSalesOrgConfigs = currentEligibilityState.salesOrgConfigs;
        final currentSalesOrganisation =
            currentEligibilityState.salesOrganisation;
        when(() => eligibilityBlocMock.state).thenReturn(
          currentEligibilityState,
        );
        when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
          CreditAndInvoiceDetailsState.initial().copyWith(
            basicInfo: fakeInvoice,
            itemsInfo: fakeInvoiceDetail,
          ),
        );

        await getWidget(tester);
        await tester.pump();
        verify(
          () => viewByOrderBlocMock.add(
            ViewByOrderEvent.initialized(
              salesOrganisation: currentSalesOrganisation,
              customerCodeInfo: currentEligibilityState.customerCodeInfo,
              salesOrgConfigs: currentSalesOrgConfigs,
              user: currentEligibilityState.user,
              sortDirection: 'desc',
              shipToInfo: currentEligibilityState.shipToInfo,
            ),
          ),
        ).called(1);
        expect(
          find.byKey(WidgetKeys.scrollList),
          findsOneWidget,
        );
        expect(find.byType(InvoiceSummary), findsOneWidget);
        expect(find.text('Total summary'.tr()), findsOneWidget);
        final invoiceDetailSubTotalFinder =
            find.byKey(WidgetKeys.invoiceDetailSubTotal);
        final invoiceDetailSmallOrderFeeFinder =
            find.byKey(WidgetKeys.invoiceDetailSmallOrderFee);
        final invoiceDetailManualFeeFinder =
            find.byKey(WidgetKeys.invoiceDetailManualFee);
        final invoiceDetailGrandTotalFinder =
            find.byKey(WidgetKeys.invoiceDetailGrandTotal);
        final invoiceDetailTax = find.byKey(WidgetKeys.invoiceDetailTax);
        final invoiceDetailTotalSaving =
            find.byKey(WidgetKeys.invoiceDetailTotalSaving);
        expect(
          find.descendant(
            of: invoiceDetailSubTotalFinder,
            matching: find.text(
              'Subtotal (${currentSalesOrgConfigs.displayPrefixTax}.tax)',
            ),
          ),
          findsOneWidget,
        );

        expect(
          find.descendant(
            of: invoiceDetailSubTotalFinder,
            matching: find.text(
              StringUtils.priceComponentDisplayPrice(
                currentSalesOrgConfigs,
                currentSalesOrgConfigs.displaySubtotalTaxBreakdown
                    ? fakeInvoiceDetail.totalNetAmount
                    : fakeInvoiceDetail.totalGrossAmount,
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
              of: invoiceDetailTax,
              matching: find.text('Tax'),
            ),
            findsOneWidget,
          );

          expect(
            find.descendant(
              of: invoiceDetailTax,
              matching: find.text(
                StringUtils.priceComponentDisplayPrice(
                  currentSalesOrgConfigs,
                  fakeInvoiceDetail.totalTaxAmount,
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
              of: invoiceDetailSmallOrderFeeFinder,
              matching: find.text(
                'Small order fee'.tr(),
              ),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: invoiceDetailSmallOrderFeeFinder,
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
              of: invoiceDetailManualFeeFinder,
              matching: find.text(
                'Manual fee'.tr(),
              ),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: invoiceDetailManualFeeFinder,
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
            of: invoiceDetailGrandTotalFinder,
            matching: find.text(
              'Grand total'.tr(),
            ),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: invoiceDetailGrandTotalFinder,
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
        if (currentSalesOrganisation.salesOrg.isID) {
          expect(
            find.descendant(
              of: invoiceDetailTotalSaving,
              matching: find.text(
                'Total savings'.tr(),
              ),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: invoiceDetailTotalSaving,
              matching: find.text(
                StringUtils.priceComponentDisplayPrice(
                  currentSalesOrgConfigs,
                  fakeInvoice.discount,
                  false,
                ),
                findRichText: true,
              ),
            ),
            findsOneWidget,
          );
        }
      },
      variant: eligibilityStateVariant,
    );

    testWidgets(
      ' => Display invoice item section for',
      (tester) async {
        final currentEligibilityState =
            eligibilityStateVariant.currentValue ?? EligibilityState.initial();
        final currentSalesOrgConfigs = currentEligibilityState.salesOrgConfigs;

        final invoiceDetail = fakeInvoiceDetail.first.copyWith(
          batches: [
            Batches(
              batchNumber: fakeBatch1,
              expiryDate: fakeExpiry1,
            ),
          ],
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          currentEligibilityState,
        );

        when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
          CreditAndInvoiceDetailsState.initial().copyWith(
            itemsInfo: [invoiceDetail],
          ),
        );

        await getWidget(tester);
        await tester.pump();

        await tester.dragUntilVisible(
          find.byKey(
            Key(invoiceDetail.batches.first.batchNumber.getOrDefaultValue('')),
          ),
          find.byKey(
            WidgetKeys.scrollList,
          ),
          const Offset(0.0, -500),
        );
        await tester.pumpAndSettle();

        expect(
          find.textContaining(
            'Batch: ${invoiceDetail.batches.first.batchNumber.getOrDefaultValue('')} - Expires: ${invoiceDetail.batches.first.expiryDate.dateString}',
            findRichText: true,
          ),
          findsOneWidget,
        );
        expect(
          find.text(
            '${'Qty'.tr()}: ${invoiceDetail.billingQuantity.getOrDefaultValue(0)}',
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
                    ? invoiceDetail.unitNetPrice
                    : invoiceDetail.unitGrossPrice,
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
              invoiceDetail.unitNetPrice == 0
                  ? 'FREE'
                  : StringUtils.priceComponentDisplayPrice(
                      currentSalesOrgConfigs,
                      currentSalesOrgConfigs.displaySubtotalTaxBreakdown
                          ? invoiceDetail.netAmount
                          : (invoiceDetail.netAmount *
                              (1 + invoiceDetail.taxPercent / 100)),
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
              ' (${invoiceDetail.taxPercent}% ${'tax'.tr()})',
            ),
          ),
          (currentSalesOrgConfigs.displayItemTaxBreakdown &&
                  invoiceDetail.netAmount > 0)
              ? findsOneWidget
              : findsNothing,
        );
        expect(
          find.descendant(
            of: find.byType(ItemTax),
            matching: find.text(
              StringUtils.priceComponentDisplayPrice(
                currentSalesOrgConfigs,
                invoiceDetail.netAmount * (1 + invoiceDetail.taxPercent / 100),
                false,
              ),
              findRichText: true,
            ),
          ),
          (currentSalesOrgConfigs.displayItemTaxBreakdown &&
                  invoiceDetail.netAmount > 0)
              ? findsOneWidget
              : findsNothing,
        );
      },
      variant: eligibilityStateVariant,
    );

    testWidgets('Find Gov.No in Invoice Details Page', (tester) async {
      when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
        CreditAndInvoiceDetailsState.initial().copyWith(basicInfo: fakeInvoice),
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

    testWidgets(
      ' => Test tax value for invoice item section for VN market',
      (tester) async {
        final invoiceDetail = fakeInvoiceDetail[2].copyWith(
          batches: [
            Batches(
              batchNumber: fakeBatch1,
              expiryDate: fakeExpiry1,
            ),
          ],
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: fakeVNSalesOrgConfigs,
            salesOrganisation: fakeVNSalesOrganisation,
          ),
        );

        when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
          CreditAndInvoiceDetailsState.initial().copyWith(
            itemsInfo: [invoiceDetail],
          ),
        );

        await getWidget(tester);
        await tester.pump();

        await tester.dragUntilVisible(
          find.byKey(
            Key(invoiceDetail.batches.first.batchNumber.getOrDefaultValue('')),
          ),
          find.byKey(
            WidgetKeys.scrollList,
          ),
          const Offset(0.0, -1000),
        );
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byType(ItemTax),
            matching: find.text(
              'VND 34,017.00',
              findRichText: true,
            ),
          ),
          (fakeVNSalesOrgConfigs.displayItemTaxBreakdown &&
                  invoiceDetail.netAmount > 0 &&
                  invoiceDetail.taxPercent > 0)
              ? findsOneWidget
              : findsNothing,
        );
      },
    );

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
        ' -> Find marketplace logo and display batch, expiry date as NA',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial()
            .copyWith(salesOrgConfigs: fakeMYSalesOrgConfigs),
      );
      when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
        CreditAndInvoiceDetailsState.initial().copyWith(
          itemsInfo: [
            fakeInvoiceDetail.first.copyWith(
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
      final scrollList = find.byKey(WidgetKeys.scrollList);
      final mpLogo = find.byType(MarketPlaceTitleWithLogo);
      await tester.dragUntilVisible(
        mpLogo,
        scrollList,
        const Offset(0, -200),
      );
      await tester.pump();
      expect(mpLogo, findsOne);
      final invoiceTile = find.byKey(WidgetKeys.invoiceDetailMaterial(0, 0));
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
            fakeInvoiceDetail.first.principalData.principalName.name,
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
        ' => Show error message when tap on the order number and order is disable from user config',
        (tester) async {
      when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
        CreditAndInvoiceDetailsState.initial().copyWith(
          itemsInfo: fakeInvoiceDetail,
          basicInfo: fakeInvoice,
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            accessRight: AccessRight.empty().copyWith(
              orders: false,
            ),
          ),
        ),
      );

      await getWidget(tester);
      await tester.pumpAndSettle();
      expect(find.byKey(WidgetKeys.scrollList), findsOneWidget);
      expect(find.byType(InvoiceDetailsSection), findsOneWidget);
      expect(find.byType(OrderNumberSection), findsOneWidget);
      expect(find.textContaining('Order number'), findsOneWidget);
      final invoiceDetailsOrderNumberButton =
          find.byKey(WidgetKeys.invoiceDetailsOrderNumberButton);
      expect(
        invoiceDetailsOrderNumberButton,
        findsOneWidget,
      );
      await tester.tap(invoiceDetailsOrderNumberButton);
      await tester.pumpAndSettle();

      final snackBarFinder = find.byKey(WidgetKeys.customSnackBar);
      expect(snackBarFinder, findsOneWidget);
      final msg = find.textContaining(
        'You do not have access to view this order'.tr(),
      );
      expect(msg, findsOneWidget);
    });

    testWidgets(
        ' => Show error message when tap on the order number and get order header empty from api',
        (tester) async {
      when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
        CreditAndInvoiceDetailsState.initial().copyWith(
          itemsInfo: fakeInvoiceDetail,
          basicInfo: fakeInvoice,
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            accessRight: AccessRight.empty().copyWith(
              orders: true,
            ),
          ),
        ),
      );

      whenListen(
        viewByOrderBlocMock,
        Stream.fromIterable([
          ViewByOrderState.initial(),
          ViewByOrderState.initial().copyWith(
            failureOrSuccessOption: optionOf(const Right(unit)),
            viewByOrderList: ViewByOrder.empty().copyWith(
              orderHeaders: [],
            ),
            searchKey: SearchKey.search('test'),
          ),
        ]),
      );

      await getWidget(tester);
      await tester.pumpAndSettle();
      expect(find.byKey(WidgetKeys.scrollList), findsOneWidget);
      expect(find.byType(InvoiceDetailsSection), findsOneWidget);
      expect(find.byType(OrderNumberSection), findsOneWidget);
      expect(find.textContaining('Order number'), findsOneWidget);
      final invoiceDetailsOrderNumberButton =
          find.byKey(WidgetKeys.invoiceDetailsOrderNumberButton);
      expect(
        invoiceDetailsOrderNumberButton,
        findsOneWidget,
      );
      await tester.tap(invoiceDetailsOrderNumberButton);
      await tester.pumpAndSettle();

      final snackBarFinder = find.byKey(WidgetKeys.customSnackBar);
      expect(snackBarFinder, findsOneWidget);
      final msg = find.textContaining(
        'You do not have access to view this order'.tr(),
      );
      expect(msg, findsOneWidget);
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
            fakeInvoiceDetail.first.copyWith(
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
      final scrollList = find.byKey(WidgetKeys.scrollList);
      final invoiceTile = find.byKey(WidgetKeys.invoiceDetailMaterial(0, 0));
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
            fakeInvoiceDetail.first.copyWith(
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
      final scrollList = find.byKey(WidgetKeys.scrollList);
      final invoiceTile = find.byKey(WidgetKeys.invoiceDetailMaterial(0, 0));
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

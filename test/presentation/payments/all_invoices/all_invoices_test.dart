import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/presentation/payments/all_invoices/all_invoices.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/filter/all_invoices_filter_bloc.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late ZPAllInvoicesBloc allInvoicesBlocMock;
  late MPAllInvoicesBloc mpAllInvoicesBlocMock;
  late AllInvoicesFilterBloc allInvoicesFilterBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late AppRouter autoRouterMock;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late List<CreditAndInvoiceItem> allInvoicesData;
  late NewPaymentBlocMock newPaymentBlocMock;
  late CreditAndInvoiceDetailsBlocMock creditAndInvoiceDetailsBlocMock;

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
    autoRouterMock = locator<AppRouter>();
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    allInvoicesBlocMock = ZPAllInvoicesBlocMock();
    mpAllInvoicesBlocMock = MPAllInvoicesBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    allInvoicesFilterBlocMock = AllInvoicesFilterBlocMock();
    customerCodeBlocMock = CustomerCodeBlocMock();
    userBlocMock = UserBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    authBlocMock = AuthBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    newPaymentBlocMock = NewPaymentBlocMock();
    creditAndInvoiceDetailsBlocMock = CreditAndInvoiceDetailsBlocMock();
    allInvoicesData =
        await AllCreditsAndInvoicesLocalDataSource().getDocumentHeaderList();

    when(() => allInvoicesBlocMock.state)
        .thenReturn(AllInvoicesState.initial());
    when(() => mpAllInvoicesBlocMock.state)
        .thenReturn(AllInvoicesState.initial());
    when(() => allInvoicesFilterBlocMock.state)
        .thenReturn(AllInvoicesFilterState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => userBlocMock.state).thenReturn(UserState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    when(() => newPaymentBlocMock.state).thenReturn(NewPaymentState.initial());
    when(() => creditAndInvoiceDetailsBlocMock.state)
        .thenReturn(CreditAndInvoiceDetailsState.initial());
  });

  Widget getWidget({bool isMarketPlace = false}) {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      useMediaQuery: false,
      usingLocalization: true,
      providers: [
        BlocProvider<ZPAllInvoicesBloc>(
          create: (context) => allInvoicesBlocMock,
        ),
        BlocProvider<MPAllInvoicesBloc>(
          create: (context) => mpAllInvoicesBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<AllInvoicesFilterBloc>(
          create: (context) => allInvoicesFilterBlocMock,
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
        BlocProvider<AnnouncementBloc>(
          create: (context) => announcementBlocMock,
        ),
        BlocProvider<NewPaymentBloc>(
          create: (context) => newPaymentBlocMock,
        ),
        BlocProvider<CreditAndInvoiceDetailsBloc>(
          create: (context) => creditAndInvoiceDetailsBlocMock,
        ),
      ],
      child: AllInvoicesPage(isMarketPlace: isMarketPlace),
    );
  }

  group('All Invoices Screen', () {
    testWidgets('=> Invoice Due date formatting for TH market', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeTHSalesOrganisation,
        ),
      );

      when(() => allInvoicesBlocMock.state).thenReturn(
        AllInvoicesState.initial().copyWith(
          items: [
            CreditAndInvoiceItem.empty().copyWith(
              searchKey: StringValue('123456780'),
              netDueDate: DateTimeStringValue('20230919'),
              postingDate: DateTimeStringValue('20230917'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
          ],
        ),
      );

      await tester.pumpWidget(getWidget());

      await tester.pump();
      //Make sure due date display on format dd MMM yyyy for TH market
      final dueDateText = find.textContaining('${'Due on'.tr()} 19 Sep 2023');
      expect(dueDateText, findsOneWidget);
    });

    testWidgets('=> Invoice Due date formatting for SG market', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSGSalesOrganisation,
        ),
      );

      when(() => allInvoicesBlocMock.state).thenReturn(
        AllInvoicesState.initial().copyWith(
          items: [
            CreditAndInvoiceItem.empty().copyWith(
              searchKey: StringValue('123456781'),
              netDueDate: DateTimeStringValue('20230920'),
              postingDate: DateTimeStringValue('20230917'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
          ],
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      //Make sure due date display on format dd MMM yyyy for TH market
      final dueDateText = find.textContaining('${'Due on'.tr()} 20 Sep 2023');
      expect(dueDateText, findsOneWidget);
    });

    testWidgets('=> Body Test when loading', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerCodeSoldTo: 'mock-customerCodeSoldTo',
          ),
          shipToInfo: ShipToInfo.empty().copyWith(
            shipToCustomerCode: 'mock-shipToCustomerCode',
          ),
        ),
      );
      when(() => allInvoicesBlocMock.state).thenReturn(
        AllInvoicesState.initial().copyWith(
          isLoading: true,
        ),
      );

      final expectedState = [
        AllInvoicesFilterState.initial(),
        AllInvoicesFilterState.initial(),
      ];
      whenListen(allInvoicesFilterBlocMock, Stream.fromIterable(expectedState));

      await tester.pumpWidget(getWidget());
      await tester.pump(const Duration(milliseconds: 100));

      final loaderImage = find.byKey(WidgetKeys.loaderImage);
      expect(loaderImage, findsOneWidget);
      await tester.pump();
    });

    testWidgets('=> Body Test onRefresh', (tester) async {
      when(() => allInvoicesBlocMock.state)
          .thenReturn(AllInvoicesState.initial());
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          shipToInfo: fakeShipToInfo,
        ),
      );

      when(() => allInvoicesBlocMock.state).thenReturn(
        AllInvoicesState.initial().copyWith(
          isLoading: false,
          failureOrSuccessOption: optionOf(const Right('')),
          items: [
            CreditAndInvoiceItem.empty().copyWith(
              searchKey: StringValue('123456789'),
              netDueDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
          ],
        ),
      );
      final handle = tester.ensureSemantics();
      await tester.runAsync(() async => await tester.pumpWidget(getWidget()));
      await tester.pump(const Duration(milliseconds: 100));

      await tester.drag(
        find.textContaining('123456789'),
        const Offset(0.0, 1000.0),
      );
      await tester.pump(const Duration(seconds: 1));
      expect(
        tester.getSemantics(find.byType(RefreshProgressIndicator)),
        matchesSemantics(
          label: 'Refresh',
        ),
      );

      await tester
          .pump(const Duration(seconds: 1)); // finish the scroll animation
      await tester.pump(
        const Duration(seconds: 1),
      ); // finish the indicator settle animation
      await tester.pump(
        const Duration(seconds: 1),
      ); // finish the indicator hide animation

      handle.dispose();
      await tester.pump();
    });

    testWidgets('=> Body Test onLoadMore', (tester) async {
      when(() => allInvoicesFilterBlocMock.state)
          .thenReturn(AllInvoicesFilterState.initial());
      when(() => allInvoicesBlocMock.state).thenReturn(
        AllInvoicesState.initial().copyWith(
          isLoading: false,
          canLoadMore: true,
          items: <CreditAndInvoiceItem>[
            CreditAndInvoiceItem.empty().copyWith(
              searchKey: StringValue('123456780'),
              netDueDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
            CreditAndInvoiceItem.empty().copyWith(
              searchKey: StringValue('123456780'),
              netDueDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
            CreditAndInvoiceItem.empty().copyWith(
              searchKey: StringValue('123456780'),
              netDueDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
            CreditAndInvoiceItem.empty().copyWith(
              searchKey: StringValue('123456780'),
              netDueDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
            CreditAndInvoiceItem.empty().copyWith(
              searchKey: StringValue('123456780'),
              netDueDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
            CreditAndInvoiceItem.empty().copyWith(
              searchKey: StringValue('123456780'),
              netDueDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
          ],
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          shipToInfo: fakeShipToInfo,
        ),
      );
      await tester.pumpWidget(getWidget());
      // await tester.drag(
      //   find.textContaining('123456780').last,
      //   const Offset(0.0, -1000.0),
      // );
      // await tester.pump(const Duration(seconds: 1));
      // await tester
      //     .pump(const Duration(seconds: 1)); // finish the scroll animation
      await tester.pump(
        const Duration(seconds: 1),
      ); // finish the indicator settle animation
      await tester.pump(
        const Duration(seconds: 1),
      ); // finish the indicator hide animation
      await tester.pump();
    });

    testWidgets('=> Invoice order Id', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeTHSalesOrganisation,
        ),
      );

      when(() => allInvoicesBlocMock.state).thenReturn(
        AllInvoicesState.initial().copyWith(
          items: <CreditAndInvoiceItem>[
            CreditAndInvoiceItem.empty().copyWith(
              searchKey: StringValue('123456780'),
              netDueDate: DateTimeStringValue('20230919'),
              postingDate: DateTimeStringValue('20230917'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
              orderId: StringValue('123456789'),
            ),
          ],
        ),
      );

      await tester.pumpWidget(getWidget());

      await tester.pump();
      expect(find.byKey(WidgetKeys.invoiceItemOrderId), findsWidgets);
    });

    testWidgets('Find Gov.No for all invoices', (tester) async {
      when(() => allInvoicesBlocMock.state).thenReturn(
        AllInvoicesState.initial().copyWith(items: allInvoicesData),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeVNSalesOrganisation,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      final documentReferenceID = find.text('Gov. no 0810234244');
      expect(documentReferenceID, findsOneWidget);
    });

    testWidgets(
        '=> Invoice details should display no found invoice screen in failure state',
        (tester) async {
      when(() => allInvoicesBlocMock.state).thenReturn(
        AllInvoicesState.initial().copyWith(
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      final loaderImage = find.byKey(WidgetKeys.loaderImage);
      expect(loaderImage, findsNothing);
      final noRecordFoundWidgetFinder = find.byType(NoRecordFound);
      expect(noRecordFoundWidgetFinder, findsOneWidget);

      final noRecordTextFinder = find.text('No invoice found');

      expect(noRecordTextFinder, findsOneWidget);
    });

    testWidgets(
        '=> Find marketplace logo in MP all invoice and navigate to invoice detail',
        (tester) async {
      when(() => mpAllInvoicesBlocMock.state).thenReturn(
        AllInvoicesState.initial()
            .copyWith(items: allInvoicesData.take(1).toList()),
      );
      await tester.pumpWidget(getWidget(isMarketPlace: true));
      await tester.pump();

      final invoiceItem = find.byKey(WidgetKeys.invoiceItem);
      expect(invoiceItem, findsOne);
      expect(
        find.descendant(
          of: invoiceItem,
          matching: find.byType(MarketPlaceLogo),
        ),
        findsOne,
      );

      await tester.tap(invoiceItem);
      await tester.pump();
      verify(
        () => creditAndInvoiceDetailsBlocMock.add(
          CreditAndInvoiceDetailsEvent.fetch(
            creditAndInvoiceItem: allInvoicesData.first,
            isMarketPlace: true,
          ),
        ),
      ).called(1);
      expect(
        autoRouterMock.current.name,
        InvoiceDetailsPageRoute(isMarketPlace: true).routeName,
      );
    });
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/payments/account_summary/account_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/filter/available_credit_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/filter/outstanding_invoice_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_local.dart';
import 'package:ezrxmobile/presentation/core/custom_badge.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/edge_checkbox.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/new_payment/tabs/outstanding_invoices_tab/outstanding_invoices_tab.dart';
import 'package:ezrxmobile/presentation/payments/widgets/payment_module.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../common_mock_data/mock_other.dart';
import '../../../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../../../utils/widget_utils.dart';
import '../../../../../common_mock_data/mock_bloc.dart';

void main() {
  late ZPAccountSummaryBloc accountSummaryBlocMock;
  late OutstandingInvoicesBloc outstandingInvoicesBlocMock;
  late OutstandingInvoiceFilterBloc outstandingInvoiceFilterBlocMock;
  late AvailableCreditsBloc availableCreditsBlocMock;
  late AvailableCreditFilterBloc availableCreditFilterBlocMock;
  late NewPaymentBloc newPaymentBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late AppRouter autoRouterMock;
  final locator = GetIt.instance;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late List<CustomerOpenItem> fakeInvoices;

  final invoiceFilter = OutstandingInvoiceFilter.defaultFilter().copyWith(
    amountValueFrom: RangeValue('1'),
    amountValueTo: RangeValue('10'),
    documentDateFrom: DateTimeStringValue('-'),
    documentDateTo: DateTimeStringValue('-'),
  );

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
    autoRouterMock = locator<AppRouter>();
  });

  setUp(() async {
    accountSummaryBlocMock = ZPAccountSummaryBlocMock();
    outstandingInvoicesBlocMock = OutstandingInvoicesBlocMock();
    outstandingInvoiceFilterBlocMock = OutstandingInvoiceFilterBlocMock();
    availableCreditsBlocMock = AvailableCreditsBlocMock();
    availableCreditFilterBlocMock = AvailableCreditFilterBlocMock();
    newPaymentBlocMock = NewPaymentBlocMock();
    customerCodeBlocMock = CustomerCodeBlocMock();
    userBlocMock = UserBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    authBlocMock = AuthBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();

    when(() => accountSummaryBlocMock.state)
        .thenReturn(AccountSummaryState.initial());
    when(() => outstandingInvoicesBlocMock.state)
        .thenReturn(OutstandingInvoicesState.initial());
    when(() => outstandingInvoiceFilterBlocMock.state)
        .thenReturn(OutstandingInvoiceFilterState.initial());
    when(() => availableCreditsBlocMock.state)
        .thenReturn(AvailableCreditsState.initial());
    when(() => availableCreditFilterBlocMock.state)
        .thenReturn(AvailableCreditFilterState.initial());
    when(() => newPaymentBlocMock.state).thenReturn(NewPaymentState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => userBlocMock.state).thenReturn(UserState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    when(() => outstandingInvoicesBlocMock.state)
        .thenReturn(OutstandingInvoicesState.initial());
    when(() => availableCreditsBlocMock.state)
        .thenReturn(AvailableCreditsState.initial());
    when(() => newPaymentBlocMock.state).thenReturn(NewPaymentState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());

    fakeInvoices = await NewPaymentLocalDataSource().getCustomerOpenItems();
  });

  Widget getWidget({bool isMarketPlace = false}) {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      routeName: NewPaymentPageRoute.name,
      providers: [
        BlocProvider<ZPAccountSummaryBloc>(
          create: (context) => accountSummaryBlocMock,
        ),
        BlocProvider<OutstandingInvoicesBloc>(
          create: (context) => outstandingInvoicesBlocMock,
        ),
        BlocProvider<OutstandingInvoiceFilterBloc>(
          create: (context) => outstandingInvoiceFilterBlocMock,
        ),
        BlocProvider<AvailableCreditsBloc>(
          create: (context) => availableCreditsBlocMock,
        ),
        BlocProvider<AvailableCreditFilterBloc>(
          create: (context) => availableCreditFilterBlocMock,
        ),
        BlocProvider<NewPaymentBloc>(
          create: (context) => newPaymentBlocMock,
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
      child: PaymentModule(
        isMarketPlace: isMarketPlace,
        child: const Scaffold(
          body: OutstandingInvoicesTab(),
        ),
      ),
    );
  }

  group('Outstanding invoice tab test', () {
    testWidgets('Search bar show', (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      final searchBar = find.byType(CustomSearchBar);
      expect(searchBar, findsOneWidget);
    });

    testWidgets('Search with search icon test', (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();

      final textFormField = find.byType(TextFormField);
      expect(textFormField, findsOneWidget);

      await tester.enterText(textFormField, '26');
      await tester.pumpAndSettle();

      final searchIcon = find.byKey(WidgetKeys.searchIconKey);
      expect(searchIcon, findsNothing);

      final clearIcon = find.byKey(WidgetKeys.clearIconKey);
      expect(clearIcon, findsOneWidget);

      verify(
        () => outstandingInvoicesBlocMock.add(
          OutstandingInvoicesEvent.fetch(
            appliedFilter: outstandingInvoicesBlocMock.state.appliedFilter,
            searchKey: SearchKey.search('26'),
            isMarketPlace: true,
          ),
        ),
      );
    });

    testWidgets('Auto search test', (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();

      final textFormField = find.byType(TextFormField);
      expect(textFormField, findsOneWidget);

      await tester.enterText(textFormField, '26');
      await tester.pumpAndSettle(const Duration(seconds: 2));

      verify(
        () => outstandingInvoicesBlocMock.add(
          OutstandingInvoicesEvent.fetch(
            appliedFilter: outstandingInvoicesBlocMock.state.appliedFilter,
            searchKey: SearchKey.search('26'),
            isMarketPlace: true,
          ),
        ),
      );
    });
    testWidgets('Search with keyboard action test', (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();

      final textFormField = find.byType(TextFormField);
      expect(textFormField, findsOneWidget);

      await tester.enterText(textFormField, '26');
      await tester.pump();
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      verify(
        () => outstandingInvoicesBlocMock.add(
          OutstandingInvoicesEvent.fetch(
            appliedFilter: outstandingInvoicesBlocMock.state.appliedFilter,
            searchKey: SearchKey.search('26'),
            isMarketPlace: true,
          ),
        ),
      );
    });

    testWidgets('Should rebuild search bar if isLoading finished',
        (tester) async {
      whenListen(
        outstandingInvoicesBlocMock,
        Stream.fromIterable([
          OutstandingInvoicesState.initial().copyWith(isLoading: true),
          OutstandingInvoicesState.initial(),
        ]),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();

      final textFormField = find.byType(TextFormField);
      expect(textFormField, findsOneWidget);
    });

    testWidgets('Should show snackbar error if any failure', (tester) async {
      whenListen(
        outstandingInvoicesBlocMock,
        Stream.fromIterable([
          OutstandingInvoicesState.initial().copyWith(isLoading: true),
          OutstandingInvoicesState.initial().copyWith(
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('dummy'))),
          ),
        ]),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();

      final textFormField = find.byType(TextFormField);
      expect(textFormField, findsOneWidget);
      expect(find.byKey(WidgetKeys.customSnackBar), findsAtLeastNWidgets(1));
    });

    testWidgets('Clear search test', (tester) async {
      when(() => outstandingInvoicesBlocMock.state).thenReturn(
        OutstandingInvoicesState.initial().copyWith(
          searchKey: SearchKey.search('26'),
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      final clearIcon = find.byKey(WidgetKeys.clearIconKey);
      expect(clearIcon, findsOneWidget);

      await tester.tap(clearIcon);
      await tester.pumpAndSettle();

      verify(
        () => outstandingInvoicesBlocMock.add(
          OutstandingInvoicesEvent.fetch(
            appliedFilter: outstandingInvoicesBlocMock.state.appliedFilter,
            searchKey: SearchKey.search(''),
            isMarketPlace: true,
          ),
        ),
      );
    });

    testWidgets('Outstanding tab title', (tester) async {
      when(() => outstandingInvoicesBlocMock.state).thenReturn(
        OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();
      final title = find.text('Outstanding: ');
      expect(title, findsOneWidget);
    });

    testWidgets('Loading view', (tester) async {
      when(() => outstandingInvoicesBlocMock.state).thenReturn(
        OutstandingInvoicesState.initial().copyWith(isLoading: true, items: []),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();
      final loadingImage = find.byKey(WidgetKeys.loaderImage);
      expect(loadingImage, findsOneWidget);
    });
    testWidgets('No record', (tester) async {
      when(() => outstandingInvoicesBlocMock.state).thenReturn(
        OutstandingInvoicesState.initial().copyWith(isLoading: false),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();
      final noRecordTitleText = find.text('No available invoices');
      final noRecordSubTitleText =
          find.textContaining('Available invoices will be shown here');
      expect(noRecordTitleText, findsOneWidget);
      expect(noRecordSubTitleText, findsOneWidget);
    });

    testWidgets('First item show for other market except PH', (tester) async {
      final invoiceItem =
          fakeInvoices.first.copyWith(orderId: StringValue('0800072883'));
      final invoiceAmount = invoiceItem.openAmountInTransCrcy.toString();
      when(() => outstandingInvoicesBlocMock.state).thenReturn(
        OutstandingInvoicesState.initial().copyWith(items: [invoiceItem]),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      final accountingDocText = find.text('Invoice #1100001163');
      expect(accountingDocText, findsOneWidget);

      final statusText = find.text('Overdue');
      expect(statusText, findsOneWidget);

      final documentReferenceID = find.text('Order #0800072883');
      expect(documentReferenceID, findsOneWidget);

      final dueOnText = find.text('Due on 31 Jul 2023');
      expect(dueOnText, findsOneWidget);

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is RichText &&
              widget.key == WidgetKeys.priceComponent &&
              widget.text.toPlainText().contains(invoiceAmount),
        ),
        findsOneWidget,
      );
    });

    testWidgets('First item show for PH - G2 & G4 tax excluded',
        (tester) async {
      final invoiceItem = fakeInvoices.first.copyWith(
        displayCurrency: Currency('PHP'),
        orderId: StringValue('0800072883'),
      );
      final invoiceAmountForPH = invoiceItem.openAmountInTransCrcy.toString();
      when(() => outstandingInvoicesBlocMock.state).thenReturn(
        OutstandingInvoicesState.initial().copyWith(items: [invoiceItem]),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      final accountingDocText = find.text('Invoice #1100001163');
      expect(accountingDocText, findsOneWidget);

      final statusText = find.text('Overdue');
      expect(statusText, findsOneWidget);

      final documentReferenceID = find.text('Order #0800072883');
      expect(documentReferenceID, findsOneWidget);

      final dueOnText = find.text('Due on 31 Jul 2023');
      expect(dueOnText, findsOneWidget);

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is RichText &&
              widget.key == WidgetKeys.priceComponent &&
              widget.text.toPlainText().contains(invoiceAmountForPH),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Select invoice test', (tester) async {
      when(() => outstandingInvoicesBlocMock.state).thenReturn(
        OutstandingInvoicesState.initial()
            .copyWith(isLoading: false, items: fakeInvoices),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      final invoiceBox = find.byType(EdgeCheckbox);
      expect(invoiceBox, findsAtLeastNWidgets(1));

      await tester.tap(invoiceBox.first);
      await tester.pumpAndSettle();

      verify(
        () => newPaymentBlocMock.add(
          NewPaymentEvent.toggleInvoice(
            selected: true,
            item: fakeInvoices.first,
          ),
        ),
      );
    });

    testWidgets('Refresh test', (tester) async {
      when(() => outstandingInvoicesBlocMock.state).thenReturn(
        OutstandingInvoicesState.initial()
            .copyWith(isLoading: false, items: fakeInvoices),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      await tester.drag(
        find.byType(
          RefreshIndicator,
        ),
        const Offset(0.0, 100.0),
      );
      await tester.pump(const Duration(seconds: 2));
      await tester.pump(const Duration(seconds: 1));
      await tester.pump(const Duration(seconds: 1));
      await tester.pump();

      verify(
        () => outstandingInvoicesBlocMock.add(
          OutstandingInvoicesEvent.fetch(
            appliedFilter: OutstandingInvoiceFilter.defaultFilter(),
            searchKey: outstandingInvoicesBlocMock.state.searchKey,
            isMarketPlace: true,
          ),
        ),
      );
    });

    testWidgets('Load more test', (tester) async {
      when(() => outstandingInvoicesBlocMock.state).thenReturn(
        OutstandingInvoicesState.initial().copyWith(
          canLoadMore: true,
          failureOrSuccessOption: optionOf(
            Right(fakeInvoices),
          ),
          items: [
            ...fakeInvoices,
            ...fakeInvoices,
            ...fakeInvoices,
          ],
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      await tester.drag(
        find.byType(CustomScrollView),
        const Offset(0.0, -2000),
      );

      await tester.pumpAndSettle(const Duration(microseconds: 500));

      verify(
        () => outstandingInvoicesBlocMock.add(
          const OutstandingInvoicesEvent.loadMore(
            isMarketPlace: false,
          ),
        ),
      );
    });

    testWidgets('Filter show', (tester) async {
      when(() => outstandingInvoicesBlocMock.state).thenReturn(
        OutstandingInvoicesState.initial().copyWith(
          isLoading: false,
          items: fakeInvoices,
          appliedFilter: invoiceFilter,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      final filterBadge = find.byType(CustomBadge);
      expect(filterBadge, findsOneWidget);

      final badgeText = find.text('1');
      expect(badgeText, findsOneWidget);

      await tester.tap(filterBadge);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      verify(
        () => outstandingInvoiceFilterBlocMock.add(
          OutstandingInvoiceFilterEvent.updateFilterToLastApplied(
            lastAppliedFilter: outstandingInvoicesBlocMock.state.appliedFilter,
          ),
        ),
      );

      final filterPage = find.byKey(WidgetKeys.outstandingInvoiceFilterPage);
      expect(filterPage, findsOneWidget);

      final filterTitle = find.text('Filter');
      expect(filterTitle, findsOneWidget);

      final closeButton = find.byKey(WidgetKeys.closeButton);
      expect(closeButton, findsOneWidget);

      await tester.tap(closeButton);
      await tester.pumpAndSettle(const Duration(seconds: 3));
    });

    testWidgets('Apply filter test', (tester) async {
      when(() => outstandingInvoicesBlocMock.state).thenReturn(
        OutstandingInvoicesState.initial()
            .copyWith(isLoading: false, items: fakeInvoices),
      );
      when(() => outstandingInvoiceFilterBlocMock.state).thenReturn(
        OutstandingInvoiceFilterState.initial().copyWith(
          filter: invoiceFilter,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      final filterBadge = find.byType(CustomBadge);
      expect(filterBadge, findsOneWidget);

      await tester.tap(filterBadge);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final filterPage = find.byKey(WidgetKeys.outstandingInvoiceFilterPage);
      expect(filterPage, findsOneWidget);

      final filterTitle = find.text('Filter');
      expect(filterTitle, findsOneWidget);

      final filterApplyButton = find.byKey(WidgetKeys.filterApplyButton);
      expect(filterApplyButton, findsOneWidget);

      await tester.tap(filterApplyButton);
      await tester.pumpAndSettle(const Duration(seconds: 3));

      verify(
        () => outstandingInvoicesBlocMock.add(
          OutstandingInvoicesEvent.fetch(
            appliedFilter: invoiceFilter,
            searchKey: outstandingInvoicesBlocMock.state.searchKey,
            isMarketPlace: true,
          ),
        ),
      );
    });

    testWidgets('Search invoice initial state', (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is CustomSearchBar && (widget.hintText == 'Search'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Find Gov.No in outstanding invoices', (tester) async {
      when(() => outstandingInvoicesBlocMock.state).thenReturn(
        OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeVNSalesOrganisation,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      final documentReferenceID = find.text('Gov. no 0800072883');
      expect(documentReferenceID, findsOneWidget);
    });

    testWidgets('Find order id in outstanding invoices', (tester) async {
      when(() => outstandingInvoicesBlocMock.state).thenReturn(
        OutstandingInvoicesState.initial().copyWith(
          items: [fakeInvoices.first],
        ),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeVNSalesOrganisation,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      final invoiceOrderIdFinder = find.text('Order #0239453435');
      expect(invoiceOrderIdFinder, findsOneWidget);
    });

    testWidgets('Search bar should display keyword same as searchKey state',
        (tester) async {
      const searchKey = 'fake-search-key';
      whenListen(
        outstandingInvoicesBlocMock,
        Stream.fromIterable([
          OutstandingInvoicesState.initial().copyWith(
            searchKey: SearchKey.search(searchKey),
          ),
        ]),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      final searchField =
          tester.widget<TextFormField>(find.byKey(WidgetKeys.searchBar));
      expect(searchField.controller?.text, searchKey);
    });
  });
}

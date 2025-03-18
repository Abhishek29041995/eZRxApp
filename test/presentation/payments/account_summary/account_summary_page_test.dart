import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/filter/all_invoices_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/full_summary/filter/full_summary_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/full_summary/full_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/full_summary_filter.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/payments/all_credits/filter_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/payments/all_invoices/filter_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/payments/full_summary/widgets/filter_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:file/file.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/presentation/payments/account_summary/account_summary_page.dart';
import 'package:ezrxmobile/application/payments/all_credits/filter/all_credits_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_bloc.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late AuthBloc authBlocMock;
  late AppRouter autoRouterMock;
  late ZPAllCreditsBloc allCreditsBlocMock;
  late MPAllCreditsBloc mpAllCreditsBlocMock;
  late ZPAllInvoicesBloc allInvoicesBlocMock;
  late MPAllInvoicesBloc mpAllInvoicesBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late AllCreditsFilterBloc allCreditsFilterBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late AllInvoicesFilterBloc allInvoicesFilterBlocMock;
  late ZPFullSummaryBloc fullSummaryBlocMock;
  late MPFullSummaryBloc mpFullSummaryBlocMock;
  late FullSummaryFilterBloc fullSummaryFilterBlocMock;
  late DownloadPaymentAttachmentsBloc mockDownloadPaymentAttachmentsBloc;
  final allCreditsFilter = AllCreditsFilter(
    amountValueFrom: RangeValue('0'),
    amountValueTo: RangeValue('100'),
    documentDateFrom: DateTimeStringValue('20221011'),
    documentDateTo: DateTimeStringValue('20231011'),
    filterStatuses: ['Pending'],
    searchKey: SearchKey.search('fake-search-key'),
    filterOption: FilterOption.documentDate(),
  );
  final allInvoicesFilter = AllInvoicesFilter(
    amountValueFrom: RangeValue('0'),
    amountValueTo: RangeValue('100'),
    documentDateFrom: DateTimeStringValue('20221011'),
    documentDateTo: DateTimeStringValue('20231011'),
    dueDateFrom: DateTimeStringValue('20221011'),
    dueDateTo: DateTimeStringValue('20231011'),
    filterStatuses: ['Pending'],
    searchKey: SearchKey.search('fake-search-key'),
    filterOption: FilterOption.documentDate(),
  );
  final fullSummaryFilter = FullSummaryFilter(
    documentDateFrom: DateTimeStringValue('20221011'),
    documentDateTo: DateTimeStringValue('20231011'),
    dueDateFrom: DateTimeStringValue('20221011'),
    dueDateTo: DateTimeStringValue('20231011'),
    filterStatuses: ['Open'],
    searchKey: SearchKey.search('fake-search-key'),
    filterOption: FilterOption.documentDate(),
  );
  late NewPaymentBlocMock newPaymentBlocMock;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AppRouter());
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    authBlocMock = AuthBlocMock();
    autoRouterMock = locator<AppRouter>();
    allCreditsBlocMock = ZPAllCreditsBlocMock();
    mpAllCreditsBlocMock = MPAllCreditsBlocMock();
    allInvoicesBlocMock = ZPAllInvoicesBlocMock();
    mpAllInvoicesBlocMock = MPAllInvoicesBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    allCreditsFilterBlocMock = AllCreditsFilterBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    allInvoicesFilterBlocMock = AllInvoicesFilterBlocMock();
    mockDownloadPaymentAttachmentsBloc = DownloadPaymentAttachmentsBlocMock();
    newPaymentBlocMock = NewPaymentBlocMock();
    fullSummaryBlocMock = ZPFullSummaryBlocMock();
    mpFullSummaryBlocMock = MPFullSummaryBlocMock();
    fullSummaryFilterBlocMock = FullSummaryFilterBlocMock();
  });

  setUp(() async {
    when(() => allInvoicesBlocMock.state)
        .thenReturn(AllInvoicesState.initial());
    when(() => mpAllInvoicesBlocMock.state)
        .thenReturn(AllInvoicesState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    when(() => allCreditsFilterBlocMock.state)
        .thenReturn(AllCreditsFilterState.initial());
    when(() => mpAllCreditsBlocMock.state)
        .thenReturn(AllCreditsState.initial());
    when(() => mockDownloadPaymentAttachmentsBloc.state)
        .thenReturn(DownloadPaymentAttachmentsState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => allCreditsBlocMock.state).thenReturn(AllCreditsState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => allInvoicesFilterBlocMock.state)
        .thenReturn(AllInvoicesFilterState.initial());
    when(() => newPaymentBlocMock.state).thenReturn(NewPaymentState.initial());
    when(() => fullSummaryBlocMock.state)
        .thenReturn(FullSummaryState.initial());
    when(() => mpFullSummaryBlocMock.state)
        .thenReturn(FullSummaryState.initial());
    when(() => fullSummaryFilterBlocMock.state)
        .thenReturn(FullSummaryFilterState.initial());
  });

  ///////////////////////////Finder//////////////////////////////////////////////
  final accountSummaryDownloadButton =
      find.byKey(WidgetKeys.accountSummaryDownloadButton);
  final accountSummaryFilterButton =
      find.byKey(WidgetKeys.accountSummaryFilterButton);
  final accountSummarySearchBar =
      find.byKey(WidgetKeys.accountSummarySearchBar);
  final paymentSummaryFilterIcon =
      find.byKey(WidgetKeys.paymentSummaryFilterIcon);
  final creditsTab = find.byKey(WidgetKeys.creditsTab);
  final fullSummaryTab = find.byKey(WidgetKeys.summaryTab);
  //////////////////////////////////////////////////////////////////////////////

  Widget getWidget({bool isMarketPlace = false}) {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      routeName: AccountSummaryRoute.name,
      providers: [
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<ZPAllCreditsBloc>(
          create: (context) => allCreditsBlocMock,
        ),
        BlocProvider<MPAllCreditsBloc>(
          create: (context) => mpAllCreditsBlocMock,
        ),
        BlocProvider<AllCreditsFilterBloc>(
          create: (context) => allCreditsFilterBlocMock,
        ),
        BlocProvider<ZPAllInvoicesBloc>(
          create: (context) => allInvoicesBlocMock,
        ),
        BlocProvider<MPAllInvoicesBloc>(
          create: (context) => mpAllInvoicesBlocMock,
        ),
        BlocProvider<AnnouncementBloc>(
          create: (context) => announcementBlocMock,
        ),
        BlocProvider<AuthBloc>(create: (context) => authBlocMock),
        BlocProvider<DownloadPaymentAttachmentsBloc>(
          create: (context) => mockDownloadPaymentAttachmentsBloc,
        ),
        BlocProvider<AllInvoicesFilterBloc>(
          create: (context) => allInvoicesFilterBlocMock,
        ),
        BlocProvider<NewPaymentBloc>(
          create: (context) => newPaymentBlocMock,
        ),
        BlocProvider<ZPFullSummaryBloc>(
          create: (context) => fullSummaryBlocMock,
        ),
        BlocProvider<MPFullSummaryBloc>(
          create: (context) => mpFullSummaryBlocMock,
        ),
        BlocProvider<FullSummaryFilterBloc>(
          create: (context) => fullSummaryFilterBlocMock,
        ),
      ],
      child: AccountSummary(isMarketPlace: isMarketPlace),
    );
  }

  group('Account Summary Screen', () {
    testWidgets('=> Test download Account summary invoice', (tester) async {
      when(() => allInvoicesBlocMock.state).thenReturn(
        AllInvoicesState.initial().copyWith(
          appliedFilter: allInvoicesFilter,
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(accountSummaryDownloadButton, findsOneWidget);
      await tester.tap(accountSummaryDownloadButton);
      await tester.pump();

      verify(
        () => mockDownloadPaymentAttachmentsBloc.add(
          DownloadPaymentAttachmentEvent.fetchAllInvoiceUrl(
            queryObject: allInvoicesFilter,
            isMarketPlace: false,
          ),
        ),
      ).called(1);
    });

    testWidgets('=> Test download Account summary credit', (tester) async {
      when(() => allCreditsBlocMock.state).thenReturn(
        AllCreditsState.initial().copyWith(
          appliedFilter: allCreditsFilter,
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(creditsTab, findsOneWidget);
      await tester.tap(creditsTab);
      await tester.pumpAndSettle();
      expect(accountSummaryDownloadButton, findsOneWidget);
      await tester.tap(accountSummaryDownloadButton);
      await tester.pump();

      verify(
        () => mockDownloadPaymentAttachmentsBloc.add(
          DownloadPaymentAttachmentEvent.fetchAllCreditUrl(
            queryObject: allCreditsFilter,
            isMarketPlace: false,
          ),
        ),
      ).called(1);
    });

    testWidgets('=> Test filter Account summary invoice', (tester) async {
      await tester.binding.setSurfaceSize(const Size(480, 900));
      when(() => allInvoicesBlocMock.state).thenReturn(
        AllInvoicesState.initial().copyWith(
          appliedFilter: allInvoicesFilter,
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(accountSummaryFilterButton, findsOneWidget);
      expect(paymentSummaryFilterIcon, findsOneWidget);
      await tester.tap(paymentSummaryFilterIcon);
      await tester.pump();
      expect(find.byType(AllInvoicesFilterBottomSheet), findsOneWidget);
      verify(
        () => allInvoicesFilterBlocMock.add(
          AllInvoicesFilterEvent.openFilterBottomSheet(
            appliedFilter: allInvoicesFilter,
          ),
        ),
      ).called(1);
    });
    testWidgets('=> Test filter build when Account summary invoice',
        (tester) async {
      final expectedState = [
        AllInvoicesState.initial().copyWith(
          isLoading: true,
        ),
        AllInvoicesState.initial().copyWith(
          appliedFilter: allInvoicesFilter,
        ),
      ];
      whenListen(
        allInvoicesBlocMock,
        Stream.fromIterable(expectedState),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(accountSummaryFilterButton, findsOneWidget);
      expect(paymentSummaryFilterIcon, findsOneWidget);
      await tester.tap(paymentSummaryFilterIcon);
      await tester.pump();
      expect(find.byType(AllInvoicesFilterBottomSheet), findsOneWidget);
    });

    testWidgets('=> Test filter Account summary credit', (tester) async {
      when(() => allCreditsBlocMock.state).thenReturn(
        AllCreditsState.initial().copyWith(
          appliedFilter: allCreditsFilter,
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(creditsTab, findsOneWidget);
      await tester.tap(creditsTab);
      await tester.pumpAndSettle();
      expect(accountSummaryFilterButton, findsOneWidget);
      expect(paymentSummaryFilterIcon, findsOneWidget);
      await tester.tap(paymentSummaryFilterIcon);
      await tester.pump();
      expect(find.byType(AllCreditsFilterBottomSheet), findsOneWidget);
      verify(
        () => allCreditsFilterBlocMock.add(
          AllCreditsFilterEvent.openFilterBottomSheet(
            appliedFilter: allCreditsFilter,
          ),
        ),
      ).called(1);
    });
    testWidgets('=> Test filter build when Account summary credit',
        (tester) async {
      final expectedState = [
        AllCreditsState.initial().copyWith(
          isLoading: true,
        ),
        AllCreditsState.initial().copyWith(
          appliedFilter: allCreditsFilter,
        ),
      ];
      whenListen(
        allCreditsBlocMock,
        Stream.fromIterable(expectedState),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(creditsTab, findsOneWidget);
      await tester.tap(creditsTab);
      await tester.pumpAndSettle();
      expect(accountSummaryFilterButton, findsOneWidget);
      expect(paymentSummaryFilterIcon, findsOneWidget);
      await tester.tap(paymentSummaryFilterIcon);
      await tester.pump();
      expect(find.byType(AllCreditsFilterBottomSheet), findsOneWidget);
    });

    testWidgets('=> Test download Account summary Listner success',
        (tester) async {
      when(() => allCreditsBlocMock.state).thenReturn(
        AllCreditsState.initial().copyWith(
          appliedFilter: allCreditsFilter,
        ),
      );
      final expectedState = [
        DownloadPaymentAttachmentsState.initial().copyWith(
          isDownloadInProgress: true,
          failureOrSuccessOption: optionOf(
            const Right(File),
          ),
        ),
      ];
      whenListen(
        mockDownloadPaymentAttachmentsBloc,
        Stream.fromIterable(expectedState),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(creditsTab, findsOneWidget);
      expect(accountSummaryDownloadButton, findsOneWidget);
      final successText = find.text('File downloaded successfully');
      expect(successText, findsWidgets);
    });
    testWidgets('=> Test download Account summary Listner failure',
        (tester) async {
      when(() => allCreditsBlocMock.state).thenReturn(
        AllCreditsState.initial().copyWith(
          appliedFilter: allCreditsFilter,
        ),
      );
      final expectedState = [
        DownloadPaymentAttachmentsState.initial().copyWith(
          isDownloadInProgress: true,
          failureOrSuccessOption: optionOf(
            const Left(ApiFailure.other('fake_error')),
          ),
        ),
      ];
      whenListen(
        mockDownloadPaymentAttachmentsBloc,
        Stream.fromIterable(expectedState),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(creditsTab, findsOneWidget);
      expect(accountSummaryDownloadButton, findsOneWidget);
      final successText = find.text('File downloaded successfully');
      expect(successText, findsNothing);
    });

    testWidgets('=> Test search Account summary invoice', (tester) async {
      final allInvoicesFilter = AllInvoicesFilter.empty().copyWith(
        searchKey: SearchKey.search('12345'),
      );
      when(() => allInvoicesBlocMock.state).thenReturn(
        AllInvoicesState.initial().copyWith(
          appliedFilter: allInvoicesFilter,
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(accountSummarySearchBar, findsOneWidget);
      await tester.enterText(find.byType(TextFormField), '1');
      await tester.pumpAndSettle(
        Duration(milliseconds: locator<Config>().autoSearchTimeout),
      );

      final appliedFilterWithSearch = AllInvoicesFilter.empty().copyWith(
        documentDateFrom: DateTimeStringValue(''),
        documentDateTo: DateTimeStringValue(''),
      );

      verify(
        () => allInvoicesBlocMock.add(
          AllInvoicesEvent.fetch(
            appliedFilter: appliedFilterWithSearch.copyWith(
              searchKey: SearchKey.search('1'),
            ),
          ),
        ),
      ).called(1);
      await tester.enterText(find.byType(TextFormField), '123');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      verify(
        () => allInvoicesBlocMock.add(
          AllInvoicesEvent.fetch(
            appliedFilter: appliedFilterWithSearch.copyWith(
              searchKey: SearchKey.search('123'),
            ),
          ),
        ),
      ).called(1);
      await tester.tap(find.byKey(WidgetKeys.clearIconKey));
      await tester.pumpAndSettle();
      verify(
        () => allInvoicesBlocMock.add(
          AllInvoicesEvent.fetch(
            appliedFilter: AllInvoicesFilter.defaultFilter(),
          ),
        ),
      ).called(1);
    });
    testWidgets('=> Test search build when Account summary invoice',
        (tester) async {
      final allInvoicesFilter = AllInvoicesFilter.defaultFilter().copyWith(
        searchKey: SearchKey.search('12345'),
      );
      final expectedState = [
        AllInvoicesState.initial().copyWith(
          isLoading: true,
        ),
        AllInvoicesState.initial().copyWith(
          appliedFilter: allInvoicesFilter,
        ),
      ];
      whenListen(
        allInvoicesBlocMock,
        Stream.fromIterable(expectedState),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(accountSummarySearchBar, findsOneWidget);
    });
    testWidgets('=> Test search Account summary credit', (tester) async {
      final allCreditsFilter = AllCreditsFilter.empty().copyWith(
        searchKey: SearchKey.search('12345'),
      );
      when(() => allCreditsBlocMock.state).thenReturn(
        AllCreditsState.initial().copyWith(
          appliedFilter: allCreditsFilter,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(creditsTab, findsOneWidget);
      await tester.tap(creditsTab);
      await tester.pumpAndSettle();
      expect(accountSummarySearchBar, findsOneWidget);
      await tester.enterText(find.byType(TextFormField), '1');
      await tester.pumpAndSettle(
        Duration(milliseconds: locator<Config>().autoSearchTimeout),
      );

      final appliedFilterWithSearch = AllCreditsFilter.empty();

      verify(
        () => allCreditsBlocMock.add(
          AllCreditsEvent.fetch(
            appliedFilter: appliedFilterWithSearch.copyWith(
              searchKey: SearchKey.search('1'),
            ),
          ),
        ),
      ).called(1);
      await tester.enterText(find.byType(TextFormField), '123');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      verify(
        () => allCreditsBlocMock.add(
          AllCreditsEvent.fetch(
            appliedFilter: appliedFilterWithSearch.copyWith(
              searchKey: SearchKey.search('123'),
            ),
          ),
        ),
      ).called(1);
      await tester.tap(find.byKey(WidgetKeys.clearIconKey));
      await tester.pumpAndSettle();
      verify(
        () => allCreditsBlocMock.add(
          AllCreditsEvent.fetch(
            appliedFilter: AllCreditsFilter.defaultFilter(),
          ),
        ),
      ).called(1);
    });

    testWidgets('=> Test search build when Account summary credit',
        (tester) async {
      final allCreditsFilter = AllCreditsFilter.defaultFilter().copyWith(
        searchKey: SearchKey.search('12345'),
      );
      final expectedState = [
        AllCreditsState.initial().copyWith(
          isLoading: true,
        ),
        AllCreditsState.initial().copyWith(
          appliedFilter: allCreditsFilter,
        ),
      ];
      whenListen(
        allCreditsBlocMock,
        Stream.fromIterable(expectedState),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(creditsTab, findsOneWidget);
      await tester.tap(creditsTab);
      await tester.pumpAndSettle();
      expect(accountSummarySearchBar, findsOneWidget);
    });

    testWidgets('=> Test Full Summary Search Bar', (tester) async {
      final expectedState = [
        FullSummaryState.initial().copyWith(
          isLoading: true,
        ),
        FullSummaryState.initial(),
      ];
      whenListen(
        fullSummaryBlocMock,
        Stream.fromIterable(expectedState),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(fullSummaryTab, findsOneWidget);
      await tester.tap(fullSummaryTab);
      await tester.pumpAndSettle();
      expect(accountSummarySearchBar, findsOneWidget);
      await tester.enterText(accountSummarySearchBar, '123');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      final appliedFilterWithSearch = FullSummaryFilter.empty();
      verify(
        () => fullSummaryBlocMock.add(
          FullSummaryEvent.fetch(
            appliedFilter: appliedFilterWithSearch.copyWith(
              searchKey: SearchKey.search('123'),
            ),
          ),
        ),
      ).called(1);
    });

    testWidgets('=> Test Full Summary Export Button', (tester) async {
      when(() => fullSummaryBlocMock.state).thenReturn(
        FullSummaryState.initial().copyWith(appliedFilter: fullSummaryFilter),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(fullSummaryTab, findsOneWidget);
      await tester.tap(fullSummaryTab);
      await tester.pumpAndSettle();
      expect(accountSummaryDownloadButton, findsOneWidget);
      await tester.tap(accountSummaryDownloadButton);
      await tester.pump();
      verify(
        () => mockDownloadPaymentAttachmentsBloc.add(
          DownloadPaymentAttachmentEvent.fetchFullSummaryUrl(
            queryObject: fullSummaryFilter,
            isMarketPlace: false,
          ),
        ),
      ).called(1);
    });

    testWidgets('=> Test Full Summary Filter Button', (tester) async {
      final expectedState = [
        FullSummaryState.initial().copyWith(
          isLoading: true,
        ),
        FullSummaryState.initial().copyWith(
          appliedFilter: FullSummaryFilter.empty().copyWith(
            filterOption: FilterOption.status(),
            filterStatuses: ['fake-status'],
          ),
        ),
      ];
      whenListen(
        fullSummaryBlocMock,
        Stream.fromIterable(expectedState),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(fullSummaryTab, findsOneWidget);
      await tester.tap(fullSummaryTab);
      await tester.pumpAndSettle();
      expect(accountSummaryFilterButton, findsOneWidget);
      await tester.tap(accountSummaryFilterButton);
      await tester.pumpAndSettle();
      verify(
        () => fullSummaryFilterBlocMock.add(
          FullSummaryFilterEvent.openFilterBottomSheet(
            appliedFilter: FullSummaryFilter.empty().copyWith(
              filterOption: FilterOption.status(),
              filterStatuses: ['fake-status'],
            ),
          ),
        ),
      ).called(1);
      expect(find.byType(FullSummaryFilterBottomSheet), findsOneWidget);
    });

    testWidgets(
      ' -> Find Account Suspended Banner when Customer Code is blocked',
      (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeBlockedCustomerCodeInfo,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final customerBlockedBanner =
            find.byKey(WidgetKeys.customerBlockedBanner);

        expect(customerBlockedBanner, findsOneWidget);
      },
    );

    testWidgets(
      ' -> Find Account Suspended Banner when ship to Code is blocked',
      (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            shipToInfo: fakeBlockedShipToInfo,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final customerBlockedBanner =
            find.byKey(WidgetKeys.customerBlockedBanner);

        expect(customerBlockedBanner, findsOneWidget);
      },
    );

    group('=> Test search bar hint text -', () {
      testWidgets('ZP payment', (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        expect(
          find.descendant(
            of: accountSummarySearchBar,
            matching: find.text('Search by full invoice number'),
          ),
          findsOne,
        );
        await tester.tap(creditsTab);
        await tester.pumpAndSettle();
        expect(
          find.descendant(
            of: accountSummarySearchBar,
            matching: find.text('Search by full credit note number'),
          ),
          findsOne,
        );
        await tester.tap(fullSummaryTab);
        await tester.pumpAndSettle();
        expect(
          find.descendant(
            of: accountSummarySearchBar,
            matching: find.text('Search by invoice/credit number'),
          ),
          findsOne,
        );
      });

      testWidgets('MP payment', (tester) async {
        await tester.pumpWidget(getWidget(isMarketPlace: true));
        await tester.pump();

        expect(
          find.descendant(
            of: accountSummarySearchBar,
            matching: find.text('Search by MP full invoice number'),
          ),
          findsOne,
        );
        await tester.tap(creditsTab);
        await tester.pumpAndSettle();
        expect(
          find.descendant(
            of: accountSummarySearchBar,
            matching: find.text('Search by MP full credit note number'),
          ),
          findsOne,
        );
        await tester.tap(fullSummaryTab);
        await tester.pumpAndSettle();
        expect(
          find.descendant(
            of: accountSummarySearchBar,
            matching: find.text('Search by MP full invoice/credit number'),
          ),
          findsOne,
        );
      });
    });

    testWidgets('=> Test export button in MP payment', (tester) async {
      when(() => mpAllInvoicesBlocMock.state).thenReturn(
        AllInvoicesState.initial().copyWith(appliedFilter: allInvoicesFilter),
      );
      when(() => mpAllCreditsBlocMock.state).thenReturn(
        AllCreditsState.initial().copyWith(appliedFilter: allCreditsFilter),
      );
      when(() => mpFullSummaryBlocMock.state).thenReturn(
        FullSummaryState.initial().copyWith(appliedFilter: fullSummaryFilter),
      );
      await tester.pumpWidget(getWidget(isMarketPlace: true));
      await tester.pumpAndSettle();
      expect(accountSummaryDownloadButton, findsOneWidget);
      await tester.tap(accountSummaryDownloadButton);
      await tester.pump();

      verify(
        () => mockDownloadPaymentAttachmentsBloc.add(
          DownloadPaymentAttachmentEvent.fetchAllInvoiceUrl(
            queryObject: allInvoicesFilter,
            isMarketPlace: true,
          ),
        ),
      ).called(1);

      await tester.tap(creditsTab);
      await tester.pumpAndSettle();
      expect(accountSummaryDownloadButton, findsOneWidget);
      await tester.tap(accountSummaryDownloadButton);
      await tester.pump();

      verify(
        () => mockDownloadPaymentAttachmentsBloc.add(
          DownloadPaymentAttachmentEvent.fetchAllCreditUrl(
            queryObject: allCreditsFilter,
            isMarketPlace: true,
          ),
        ),
      ).called(1);

      await tester.tap(fullSummaryTab);
      await tester.pumpAndSettle();
      expect(accountSummaryDownloadButton, findsOneWidget);
      await tester.tap(accountSummaryDownloadButton);
      await tester.pump();
      verify(
        () => mockDownloadPaymentAttachmentsBloc.add(
          DownloadPaymentAttachmentEvent.fetchFullSummaryUrl(
            queryObject: fullSummaryFilter,
            isMarketPlace: true,
          ),
        ),
      ).called(1);
    });

    testWidgets(
        'All invoice search bar should display keyword same as searchKey state',
        (tester) async {
      const searchKey = 'fake-search-key';
      whenListen(
        allInvoicesBlocMock,
        Stream.fromIterable([
          AllInvoicesState.initial().copyWith(
            appliedFilter: AllInvoicesFilter.empty().copyWith(
              searchKey: SearchKey.search(searchKey),
            ),
          ),
        ]),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      final searchField =
          tester.widget<TextFormField>(find.byKey(WidgetKeys.searchBar));
      expect(searchField.controller?.text, searchKey);
    });
    testWidgets(
        'All credit search bar should display keyword same as searchKey state',
        (tester) async {
      const searchKey = 'fake-search-key';
      whenListen(
        allCreditsBlocMock,
        Stream.fromIterable([
          AllCreditsState.initial().copyWith(
            appliedFilter: AllCreditsFilter.empty().copyWith(
              searchKey: SearchKey.search(searchKey),
            ),
          ),
        ]),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      await tester.tap(creditsTab);
      await tester.pumpAndSettle();
      final searchField =
          tester.widget<TextFormField>(find.byKey(WidgetKeys.searchBar));
      expect(searchField.controller?.text, searchKey);
    });
    testWidgets(
        'Full summary search bar should display keyword same as searchKey state',
        (tester) async {
      const searchKey = 'fake-search-key';
      whenListen(
        fullSummaryBlocMock,
        Stream.fromIterable([
          FullSummaryState.initial().copyWith(
            appliedFilter: FullSummaryFilter.empty().copyWith(
              searchKey: SearchKey.search(searchKey),
            ),
          ),
        ]),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      await tester.tap(fullSummaryTab);
      await tester.pumpAndSettle();
      final searchField =
          tester.widget<TextFormField>(find.byKey(WidgetKeys.searchBar));
      expect(searchField.controller?.text, searchKey);
    });
  });
}

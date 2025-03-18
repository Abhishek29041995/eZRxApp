import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/filter/available_credit_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/custom_badge.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/edge_checkbox.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/new_payment/tabs/available_credits_tab/available_credit_payment_filter_page.dart';
import 'package:ezrxmobile/presentation/payments/new_payment/tabs/available_credits_tab/available_credits_tab.dart';
import 'package:ezrxmobile/presentation/payments/widgets/payment_module.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../common_mock_data/mock_other.dart';
import '../../../../../utils/widget_utils.dart';
import '../../../../../common_mock_data/mock_bloc.dart';

void main() {
  late AvailableCreditsBloc availableCreditsBlocMock;
  late AvailableCreditFilterBloc availableCreditFilterBlocMock;
  late NewPaymentBloc newPaymentBlocMock;
  late AppRouter autoRouterMock;
  late EligibilityBloc eligibilityBlocMock;
  late MixpanelService mixpanelServiceMock;
  late List<CustomerOpenItem> fakeCredits;
  late Config configMock;
  const fakeSearchKey = '26';
  final creditFilter = AvailableCreditFilter.defaultFilter().copyWith(
    amountValueFrom: RangeValue('10'),
    amountValueTo: RangeValue('100'),
    documentDateFrom: DateTimeStringValue('-'),
    documentDateTo: DateTimeStringValue('-'),
  );

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton<AppRouter>(() => AutoRouteMock());
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
    autoRouterMock = locator<AppRouter>();
    mixpanelServiceMock = locator<MixpanelService>();
    configMock = locator<Config>();
    fakeCredits = await NewPaymentLocalDataSource().getCustomerOpenItems();
  });

  setUp(() async {
    availableCreditFilterBlocMock = AvailableCreditFilterBlocMock();
    newPaymentBlocMock = NewPaymentBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    availableCreditsBlocMock = AvailableCreditsBlocMock();
    when(() => availableCreditsBlocMock.state)
        .thenReturn(AvailableCreditsState.initial());
    when(() => availableCreditFilterBlocMock.state)
        .thenReturn(AvailableCreditFilterState.initial());
    when(() => newPaymentBlocMock.state).thenReturn(NewPaymentState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    clearInteractions(mixpanelServiceMock);
  });

  Widget getWidget({bool isMarketPlace = false}) {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      routeName: NewPaymentPageRoute.name,
      providers: [
        BlocProvider<AvailableCreditsBloc>(
          create: (context) => availableCreditsBlocMock,
        ),
        BlocProvider<AvailableCreditFilterBloc>(
          create: (context) => availableCreditFilterBlocMock,
        ),
        BlocProvider<NewPaymentBloc>(
          create: (context) => newPaymentBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
      ],
      child: PaymentModule(
        isMarketPlace: isMarketPlace,
        child: const Scaffold(
          body: AvailableCreditsTab(),
        ),
      ),
    );
  }

  Widget getBottomSheetWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<AvailableCreditsBloc>(
          create: (context) => availableCreditsBlocMock,
        ),
        BlocProvider<AvailableCreditFilterBloc>(
          create: (context) => availableCreditFilterBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
      ],
      child: const Scaffold(
        body: AvailableCreditPaymentFilterPage(),
      ),
    );
  }

  group('Available credit tab test', () {
    Future openFilterBottomSheet(WidgetTester tester) async {
      final filterBadge = find.byType(CustomBadge);
      whenListen(
        availableCreditsBlocMock,
        Stream.fromIterable(
          [
            AvailableCreditsState.initial().copyWith(
              failureOrSuccessOption: optionOf(
                const Left(
                  ApiFailure.other('fake-error'),
                ),
              ),
            ),
            AvailableCreditsState.initial(),
          ],
        ),
      );
      expect(filterBadge, findsOneWidget);

      await tester.tap(filterBadge);
      await tester.pumpAndSettle();
      verify(
        () => availableCreditsBlocMock.add(
          AvailableCreditsEvent.fetch(
            appliedFilter: creditFilter,
            searchKey: availableCreditsBlocMock.state.searchKey,
            isMarketPlace: false,
          ),
        ),
      );
    }

    testWidgets('Search bar show', (tester) async {
      whenListen(
        availableCreditsBlocMock,
        Stream.fromIterable(
          [
            AvailableCreditsState.initial().copyWith(
              isLoading: true,
            ),
            AvailableCreditsState.initial(),
          ],
        ),
      );
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

    testWidgets('Search bar hint text in MP', (tester) async {
      await tester.pumpWidget(getWidget(isMarketPlace: true));
      await tester.pumpAndSettle();
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is CustomSearchBar &&
              (widget.hintText == 'Search by MP document number'),
        ),
        findsOneWidget,
      );

      final textFormField = find.byType(TextFormField);
      expect(textFormField, findsOneWidget);
      await tester.enterText(textFormField, fakeSearchKey);
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      verify(
        () => availableCreditsBlocMock.add(
          AvailableCreditsEvent.fetch(
            appliedFilter: AvailableCreditFilter.empty(),
            searchKey: SearchKey.search(fakeSearchKey),
            isMarketPlace: true,
          ),
        ),
      ).called(1);
    });

    testWidgets('Search Change And Submit Test', (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();

      final textFormField = find.byType(TextFormField);
      expect(textFormField, findsOneWidget);

      await tester.enterText(textFormField, fakeSearchKey);
      await tester.pump(
        Duration(
          milliseconds: configMock.autoSearchTimeout,
        ),
      );

      final appliedFilterWithSearch = AvailableCreditFilter.empty();
      verify(
        () => mixpanelServiceMock.trackEvent(
          eventName: TrackingEvents.documentNumberSearched,
          properties: null,
        ),
      ).called(1);
      verify(
        () => availableCreditsBlocMock.add(
          AvailableCreditsEvent.fetch(
            appliedFilter: appliedFilterWithSearch,
            searchKey: SearchKey.search(fakeSearchKey),
            isMarketPlace: false,
          ),
        ),
      ).called(1);
      final clearIcon = find.byKey(WidgetKeys.clearIconKey);
      expect(clearIcon, findsOneWidget);
      await tester.tap(clearIcon);
      await tester.pumpAndSettle();
      verify(
        () => mixpanelServiceMock.trackEvent(
          eventName: TrackingEvents.documentNumberSearched,
          properties: null,
        ),
      ).called(1);
      verify(
        () => availableCreditsBlocMock.add(
          AvailableCreditsEvent.fetch(
            appliedFilter: AvailableCreditFilter.defaultFilter(),
            searchKey: SearchKey.search(''),
            isMarketPlace: false,
          ),
        ),
      ).called(1);
      await tester.enterText(textFormField, fakeSearchKey);
      final searchIcon = find.byKey(WidgetKeys.searchIconKey);
      expect(searchIcon, findsOneWidget);
      await tester.tap(searchIcon);

      verify(
        () => mixpanelServiceMock.trackEvent(
          eventName: TrackingEvents.documentNumberSearched,
          properties: null,
        ),
      ).called(1);
      verify(
        () => availableCreditsBlocMock.add(
          AvailableCreditsEvent.fetch(
            appliedFilter: appliedFilterWithSearch,
            searchKey: SearchKey.search(fakeSearchKey),
            isMarketPlace: false,
          ),
        ),
      ).called(1);
    });

    testWidgets('Clear search test', (tester) async {
      when(() => availableCreditsBlocMock.state).thenReturn(
        AvailableCreditsState.initial().copyWith(
          searchKey: SearchKey.search(fakeSearchKey),
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      final clearIcon = find.byKey(WidgetKeys.clearIconKey);
      expect(clearIcon, findsOneWidget);

      await tester.tap(clearIcon);

      verify(
        () => mixpanelServiceMock.trackEvent(
          eventName: TrackingEvents.documentNumberSearched,
          properties: null,
        ),
      ).called(1);
      verify(
        () => availableCreditsBlocMock.add(
          AvailableCreditsEvent.fetch(
            appliedFilter: AvailableCreditFilter.defaultFilter(),
            searchKey: SearchKey.empty(),
            isMarketPlace: false,
          ),
        ),
      ).called(1);
    });

    testWidgets('Loading view', (tester) async {
      when(() => availableCreditsBlocMock.state).thenReturn(
        AvailableCreditsState.initial().copyWith(isLoading: true),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();
      final availableText = find.byKey(WidgetKeys.loaderImage);
      expect(availableText, findsOneWidget);
    });

    testWidgets('No record', (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      final noRecordTitleText = find.text('No available credits');
      final noRecordSubTitleText =
          find.textContaining('Available credit notes will be shown here');
      expect(noRecordTitleText, findsOneWidget);
      expect(noRecordSubTitleText, findsOneWidget);
    });

    testWidgets('First item credit show for other market except PH',
        (tester) async {
      final creditItem = fakeCredits.first;
      final creditAmount = creditItem.openAmountInTransCrcy.abs().toString();

      when(() => availableCreditsBlocMock.state).thenReturn(
        AvailableCreditsState.initial().copyWith(
          items: [creditItem],
        ),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('3070'),
          ),
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();
      final creditCard = find.byKey(WidgetKeys.creditPaymentItem);
      expect(
        find.descendant(
          of: creditCard,
          matching: find.text('Credit Note #1100001163'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(of: creditCard, matching: find.text('31 Jul 2016')),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: creditCard,
          matching: find.text('Gov. no 0800072883'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: creditCard,
          matching: find.text('Invoice'),
        ),
        findsOneWidget,
      );
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is RichText &&
              widget.key == WidgetKeys.priceComponent &&
              widget.text.toPlainText().contains(creditAmount),
        ),
        findsOneWidget,
      );
    });

    testWidgets('First item credit show for PH - G2 & G4 tax excluded',
        (tester) async {
      final creditItem =
          fakeCredits.first.copyWith(displayCurrency: Currency('PHP'));
      final creditAmountForPH =
          creditItem.openAmountInTransCrcy.abs().toString();

      when(() => availableCreditsBlocMock.state).thenReturn(
        AvailableCreditsState.initial().copyWith(
          items: [creditItem],
        ),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('3070'),
          ),
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();
      final creditCard = find.byKey(WidgetKeys.creditPaymentItem);
      expect(
        find.descendant(
          of: creditCard,
          matching: find.text('Credit Note #1100001163'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(of: creditCard, matching: find.text('31 Jul 2016')),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: creditCard,
          matching: find.text('Gov. no 0800072883'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: creditCard,
          matching: find.text('Invoice'),
        ),
        findsOneWidget,
      );
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is RichText &&
              widget.key == WidgetKeys.priceComponent &&
              widget.text.toPlainText().contains(creditAmountForPH),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Select credit test', (tester) async {
      when(() => availableCreditsBlocMock.state).thenReturn(
        AvailableCreditsState.initial().copyWith(items: fakeCredits),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      final creditBox = find.byType(EdgeCheckbox);
      expect(creditBox, findsAtLeastNWidgets(1));

      await tester.tap(creditBox.first);

      verify(
        () => newPaymentBlocMock.add(
          NewPaymentEvent.toggleCredit(selected: true, item: fakeCredits.first),
        ),
      );
    });

    testWidgets('Load more test', (tester) async {
      when(() => availableCreditsBlocMock.state).thenReturn(
        AvailableCreditsState.initial().copyWith(
          canLoadMore: true,
          failureOrSuccessOption: optionOf(
            Right(fakeCredits),
          ),
          items: [
            ...fakeCredits,
            ...fakeCredits,
            ...fakeCredits,
          ],
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      await tester.drag(
        find.byType(CustomScrollView),
        const Offset(0.0, -2000),
      );

      await tester.pumpAndSettle();

      verify(
        () => availableCreditsBlocMock.add(
          const AvailableCreditsEvent.loadMore(isMarketPlace: false),
        ),
      );
    });

    testWidgets(
        'Apply filter test - Available Credit Amount Value Range Invalid',
        (tester) async {
      final invalidCreditFilter =
          AvailableCreditFilter.defaultFilter().copyWith(
        amountValueFrom: RangeValue('100'),
        amountValueTo: RangeValue('10'),
        documentDateFrom: DateTimeStringValue('-'),
        documentDateTo: DateTimeStringValue('-'),
      );
      when(() => availableCreditsBlocMock.state).thenReturn(
        AvailableCreditsState.initial().copyWith(
          items: fakeCredits,
        ),
      );
      when(() => availableCreditFilterBlocMock.state).thenReturn(
        AvailableCreditFilterState.initial().copyWith(
          filter: invalidCreditFilter,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      await openFilterBottomSheet(tester);
      final filterApplyButton = find.byKey(WidgetKeys.filterApplyButton);
      expect(filterApplyButton, findsOneWidget);

      await tester.tap(filterApplyButton);
      await tester.pumpAndSettle();
      verify(
        () => availableCreditFilterBlocMock.add(
          const AvailableCreditFilterEvent.setValidationFailure(),
        ),
      );
    });

    testWidgets('Apply filter test - Available Credit Amount Value Range Valid',
        (tester) async {
      when(() => availableCreditsBlocMock.state).thenReturn(
        AvailableCreditsState.initial().copyWith(
          items: fakeCredits,
        ),
      );
      when(() => availableCreditFilterBlocMock.state).thenReturn(
        AvailableCreditFilterState.initial().copyWith(
          filter: creditFilter,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      await openFilterBottomSheet(tester);
      final filterApplyButton = find.byKey(WidgetKeys.filterApplyButton);
      expect(filterApplyButton, findsOneWidget);

      await tester.tap(filterApplyButton);
      await tester.pumpAndSettle();
      verify(
        () => mixpanelServiceMock.trackEvent(
          eventName: TrackingEvents.newPaymentFilterUsed,
          properties: {TrackingProps.filterUsed: creditFilter.trackingInfo},
        ),
      ).called(1);
      verify(
        () => availableCreditsBlocMock.add(
          AvailableCreditsEvent.fetch(
            appliedFilter: creditFilter,
            searchKey: SearchKey.empty(),
            isMarketPlace: false,
          ),
        ),
      ).called(1);
    });

    testWidgets('Show toast when Api failure', (tester) async {
      const fakeError = 'fake-error';
      whenListen(
        availableCreditsBlocMock,
        Stream.fromIterable(
          [
            AvailableCreditsState.initial().copyWith(
              failureOrSuccessOption: optionOf(
                const Left(
                  ApiFailure.other(fakeError),
                ),
              ),
            ),
          ],
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.customSnackBar),
          matching: find.text(fakeError),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Pull to refresh list view', (tester) async {
      when(() => availableCreditsBlocMock.state).thenAnswer(
        (_) => AvailableCreditsState.initial().copyWith(
          items: fakeCredits,
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();

      final scrollList = find.byKey(WidgetKeys.scrollList);
      await tester.drag(scrollList, const Offset(0, 1000));
      await tester.pumpAndSettle();
      verify(
        () => availableCreditsBlocMock.add(
          AvailableCreditsEvent.fetch(
            appliedFilter: AvailableCreditFilter.defaultFilter(),
            searchKey: SearchKey.empty(),
            isMarketPlace: false,
          ),
        ),
      ).called(1);
    });

    testWidgets('On Tap Close Filter', (tester) async {
      when(() => availableCreditsBlocMock.state).thenReturn(
        AvailableCreditsState.initial().copyWith(
          items: fakeCredits,
        ),
      );
      when(() => availableCreditFilterBlocMock.state).thenReturn(
        AvailableCreditFilterState.initial().copyWith(
          filter: creditFilter,
        ),
      );
      when(() => autoRouterMock.maybePop()).thenAnswer(
        (invocation) => Future.value(true),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      await openFilterBottomSheet(tester);
      expect(find.byKey(WidgetKeys.closeButton), findsOneWidget);
      await tester.tap(find.byKey(WidgetKeys.closeButton));
      verify(() => autoRouterMock.maybePop()).called(1);
    });

    testWidgets('tap reset filter button', (tester) async {
      await tester.pumpWidget(getBottomSheetWidget());
      await tester.pump();
      final resetButton = find.byKey(WidgetKeys.filterResetButton);
      expect(resetButton, findsOneWidget);
      await tester.tap(resetButton);
      verify(
        () => availableCreditFilterBlocMock.add(
          const AvailableCreditFilterEvent.resetFilters(),
        ),
      ).called(1);
    });

    testWidgets('tap from date filter', (tester) async {
      final fromDate = DateTimeStringValue('2023-09-11');
      final toDate = DateTimeStringValue('2023-09-20');
      when(() => availableCreditFilterBlocMock.state).thenReturn(
        AvailableCreditFilterState.initial().copyWith(
          filter: AvailableCreditFilter.defaultFilter().copyWith(
            documentDateFrom: fromDate,
            documentDateTo: toDate,
          ),
        ),
      );
      await tester.pumpWidget(getBottomSheetWidget());
      await tester.pump();
      final fromDateField = find.byKey(WidgetKeys.fromDocumentDateField);
      expect(fromDateField, findsOneWidget);
      await tester.tap(fromDateField);
      await tester.pumpAndSettle();
      // Verify that the date picker is displayed
      await tester.tap(find.widgetWithIcon(IconButton, Icons.edit_outlined));
      await tester.pump();
      final okButton = find.text('OK');
      await tester.tap(okButton);
      await tester.pumpAndSettle();
      final range = DateTimeRange(
        start: fromDate.dateTime,
        end: toDate.dateTime,
      );
      verify(
        () => availableCreditFilterBlocMock.add(
          AvailableCreditFilterEvent.setDocumentDate(
            documentDateRange: range,
          ),
        ),
      ).called(1);
    });

    testWidgets('tap to date filter', (tester) async {
      final fromDate = DateTimeStringValue('2023-09-11');
      final toDate = DateTimeStringValue('2023-09-20');
      when(() => availableCreditFilterBlocMock.state).thenReturn(
        AvailableCreditFilterState.initial().copyWith(
          filter: AvailableCreditFilter.defaultFilter().copyWith(
            documentDateFrom: fromDate,
            documentDateTo: toDate,
          ),
        ),
      );
      await tester.pumpWidget(getBottomSheetWidget());
      await tester.pump();
      final toDateField = find.byKey(WidgetKeys.toDocumentDateField);
      expect(toDateField, findsOneWidget);
      await tester.tap(toDateField);
      await tester.pumpAndSettle();
      // Verify that the date picker is displayed
      await tester.tap(find.widgetWithIcon(IconButton, Icons.edit_outlined));
      await tester.pump();
      final okButton = find.text('OK');
      await tester.tap(okButton);
      await tester.pumpAndSettle();
      final range = DateTimeRange(
        start: fromDate.dateTime,
        end: toDate.dateTime,
      );
      verify(
        () => availableCreditFilterBlocMock.add(
          AvailableCreditFilterEvent.setDocumentDate(
            documentDateRange: range,
          ),
        ),
      ).called(1);
    });

    testWidgets('amount value from filter', (tester) async {
      const value = '2';
      await tester.pumpWidget(getBottomSheetWidget());
      await tester.pump();
      final amountValueFromField = find.byKey(WidgetKeys.amountValueFrom);
      expect(amountValueFromField, findsOneWidget);
      await tester.enterText(amountValueFromField, value);
      await tester.pump();
      verify(
        () => availableCreditFilterBlocMock.add(
          const AvailableCreditFilterEvent.setAmountFrom(
            amountFrom: value,
          ),
        ),
      ).called(1);
    });

    testWidgets('amount value to filter', (tester) async {
      const value = '10';
      await tester.pumpWidget(getBottomSheetWidget());
      await tester.pump();
      final amountValueToField = find.byKey(WidgetKeys.amountValueTo);
      expect(amountValueToField, findsOneWidget);
      await tester.enterText(amountValueToField, value);
      await tester.pump();
      verify(
        () => availableCreditFilterBlocMock.add(
          const AvailableCreditFilterEvent.setAmountTo(
            amountTo: value,
          ),
        ),
      ).called(1);
    });

    testWidgets('Find postingDate in available credits tab', (tester) async {
      when(() => availableCreditsBlocMock.state).thenReturn(
        AvailableCreditsState.initial().copyWith(items: fakeCredits),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();

      final postingDate = find.text('31 Jul 2016');
      expect(postingDate, findsOneWidget);
    });

    testWidgets('Search bar should display keyword same as searchKey state',
        (tester) async {
      const searchKey = 'fake-search-key';
      whenListen(
        availableCreditsBlocMock,
        Stream.fromIterable([
          AvailableCreditsState.initial().copyWith(
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

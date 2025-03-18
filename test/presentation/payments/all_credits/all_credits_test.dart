import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/download_e_credit/download_e_credit_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/presentation/payments/all_credits/all_credits.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_bloc.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/payments/all_credits/filter/all_credits_filter_bloc.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_local.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late ZPAllCreditsBloc allCreditsBlocMock;
  late MPAllCreditsBloc mpAllCreditsBlocMock;
  late AllCreditsFilterBloc allCreditsFilterBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late AppRouter autoRouterMock;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late CreditAndInvoiceDetailsBloc creditAndInvoiceDetailsBlocMock;
  late List<CreditAndInvoiceItem> creditItemList;
  late NewPaymentBlocMock newPaymentBlocMock;
  late DownloadECreditBloc downloadECreditBlocMock;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    creditItemList =
        await AllCreditsAndInvoicesLocalDataSource().getDocumentHeaderList();
    autoRouterMock = locator<AppRouter>();
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    allCreditsBlocMock = ZPAllCreditsBlocMock();
    mpAllCreditsBlocMock = MPAllCreditsBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    allCreditsFilterBlocMock = AllCreditsFilterBlocMock();
    customerCodeBlocMock = CustomerCodeBlocMock();
    userBlocMock = UserBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    authBlocMock = AuthBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    creditAndInvoiceDetailsBlocMock = CreditAndInvoiceDetailsBlocMock();
    newPaymentBlocMock = NewPaymentBlocMock();
    downloadECreditBlocMock = DownloadECreditBlocMock();

    when(() => allCreditsBlocMock.state).thenReturn(AllCreditsState.initial());
    when(() => mpAllCreditsBlocMock.state)
        .thenReturn(AllCreditsState.initial());
    when(() => allCreditsFilterBlocMock.state)
        .thenReturn(AllCreditsFilterState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => userBlocMock.state).thenReturn(UserState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => creditAndInvoiceDetailsBlocMock.state)
        .thenReturn(CreditAndInvoiceDetailsState.initial());
    when(() => newPaymentBlocMock.state).thenReturn(NewPaymentState.initial());
    when(() => downloadECreditBlocMock.state)
        .thenReturn(DownloadECreditState.initial());
  });

  Widget getWidget({bool isMarketPlace = false}) {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<ZPAllCreditsBloc>(
          create: (context) => allCreditsBlocMock,
        ),
        BlocProvider<MPAllCreditsBloc>(
          create: (context) => mpAllCreditsBlocMock,
        ),
        BlocProvider<AllCreditsFilterBloc>(
          create: (context) => allCreditsFilterBlocMock,
        ),
        BlocProvider<CustomerCodeBloc>(
          create: (context) => customerCodeBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
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
        BlocProvider<CreditAndInvoiceDetailsBloc>(
          create: (context) => creditAndInvoiceDetailsBlocMock,
        ),
        BlocProvider<NewPaymentBloc>(
          create: (context) => newPaymentBlocMock,
        ),
        BlocProvider<DownloadECreditBloc>(
          create: (context) => downloadECreditBlocMock,
        ),
      ],
      child: AllCreditsPage(isMarketPlace: isMarketPlace),
    );
  }

  ////////////////////////Finder/////////////////////////////////////////////
  final creditStatusTag = find.byKey(WidgetKeys.creditStatusTag);
  final creditsItemTile = find.byKey(WidgetKeys.creditsItemTile);
  ///////////////////////////////////////////////////////////////////////////
  group('All Credits Screen', () {
    // testWidgets('=> AppBar Test', (tester) async {
    //   when(() => allCreditsBlocMock.state)
    //       .thenReturn(AllCreditsState.initial().copyWith(
    //     isLoading: true,
    //   ));
    //   final expectedState = [
    //     AllCreditsFilterState.initial(),
    //     AllCreditsFilterState.initial(),
    //     AllCreditsFilterState.initial(),
    //   ];
    //   whenListen(allCreditsFilterBlocMock, Stream.fromIterable(expectedState));

    //   await getWidget(tester);

    //   await tester.pump(const Duration(milliseconds: 100));
    //   final allCreditsText = find.text('Credits'.tr());
    //   expect(allCreditsText, findsOneWidget);
    // });

    testWidgets('=> Body Test when loading', (tester) async {
      when(() => allCreditsBlocMock.state).thenReturn(
        AllCreditsState.initial().copyWith(
          isLoading: true,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump(const Duration(milliseconds: 100));

      final loaderImage = find.byKey(WidgetKeys.loaderImage);
      expect(loaderImage, findsOneWidget);
      await tester.pump();
    });

    testWidgets('=> Body Test onRefresh', (tester) async {
      when(() => allCreditsBlocMock.state)
          .thenReturn(AllCreditsState.initial());

      when(() => allCreditsBlocMock.state).thenReturn(
        AllCreditsState.initial().copyWith(
          failureOrSuccessOption: optionOf(const Right('')),
          items: [
            creditItemList.first.copyWith(
              searchKey: StringValue('123456789'),
            ),
          ],
        ),
      );

      final handle = tester.ensureSemantics();
      await tester.runAsync(() async => await tester.pumpWidget(getWidget()));
      await tester.pumpAndSettle();

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
      when(() => allCreditsFilterBlocMock.state)
          .thenReturn(AllCreditsFilterState.initial());
      when(() => allCreditsBlocMock.state).thenReturn(
        AllCreditsState.initial().copyWith(
          items: creditItemList,
        ),
      );

      await tester.pumpWidget(getWidget());
      // await tester.drag(
      //   find.textContaining('123456780').last,
      //   const Offset(0.0, -1000.0),
      // );
      await tester.pump(const Duration(seconds: 1));
      await tester
          .pump(const Duration(seconds: 1)); // finish the scroll animation
      await tester.pump(
        const Duration(seconds: 1),
      ); // finish the indicator settle animation
      await tester.pump(
        const Duration(seconds: 1),
      ); // finish the indicator hide animation
      await tester.pump();
    });

    testWidgets('Find Created on text', (tester) async {
      when(() => allCreditsBlocMock.state).thenReturn(
        AllCreditsState.initial().copyWith(
          items: [
            creditItemList.first.copyWith(
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
          ],
        ),
      );

      await tester.pumpWidget(getWidget());

      await tester.pump();
      final createdOnText = find.textContaining('Created on');
      expect(createdOnText, findsOneWidget);
    });

    testWidgets('=> Credit Status tag available for all market',
        (tester) async {
      when(() => allCreditsBlocMock.state).thenReturn(
        AllCreditsState.initial().copyWith(
          items: creditItemList,
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(creditStatusTag, findsWidgets);
    });

    testWidgets('=> Credit Status tag not available of ID market',
        (tester) async {
      when(() => allCreditsBlocMock.state).thenReturn(
        AllCreditsState.initial().copyWith(
          items: creditItemList,
        ),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeIDSalesOrganisation,
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(creditStatusTag, findsNothing);
    });

    testWidgets('=> Credit details page for all market', (tester) async {
      when(() => allCreditsBlocMock.state).thenReturn(
        AllCreditsState.initial().copyWith(
          items: creditItemList,
        ),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(creditsItemTile, findsWidgets);
      await tester.tap(creditsItemTile.first);
      await tester.pumpAndSettle();
      verify(
        () => creditAndInvoiceDetailsBlocMock.add(
          CreditAndInvoiceDetailsEvent.fetch(
            creditAndInvoiceItem: creditItemList.first,
            isMarketPlace: false,
          ),
        ),
      ).called(1);
    });

    testWidgets('=> Credit details page accountingDocumentType all market',
        (tester) async {
      when(() => allCreditsBlocMock.state).thenReturn(
        AllCreditsState.initial().copyWith(
          items: creditItemList
              .map((e) => e.copyWith(accountingDocumentType: 'Credit-Memo'))
              .toList(),
        ),
      );

      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      final accountingDocumentType = find.text('Credit-Memo');
      expect(accountingDocumentType, findsWidgets);
    });

    testWidgets('=> Credit no details page for ID market', (tester) async {
      when(() => allCreditsBlocMock.state).thenReturn(
        AllCreditsState.initial().copyWith(
          items: creditItemList,
        ),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeIDSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(creditsItemTile, findsWidgets);
      await tester.tap(creditsItemTile.first);
      await tester.pumpAndSettle();
      verifyNever(
        () => creditAndInvoiceDetailsBlocMock.add(
          CreditAndInvoiceDetailsEvent.fetch(
            creditAndInvoiceItem: creditItemList.first,
            isMarketPlace: false,
          ),
        ),
      );
    });

    testWidgets('Find Gov.No for all credits', (tester) async {
      when(() => allCreditsBlocMock.state).thenReturn(
        AllCreditsState.initial().copyWith(items: creditItemList),
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
        '=> Find marketplace logo in MP all credit and navigate to credit detail',
        (tester) async {
      when(() => mpAllCreditsBlocMock.state).thenReturn(
        AllCreditsState.initial()
            .copyWith(items: creditItemList.take(1).toList()),
      );
      await tester.pumpWidget(getWidget(isMarketPlace: true));
      await tester.pump();

      expect(creditsItemTile, findsOne);
      expect(
        find.descendant(
          of: creditsItemTile,
          matching: find.byType(MarketPlaceLogo),
        ),
        findsOne,
      );
      await tester.tap(creditsItemTile);
      await tester.pump();
      verify(
        () => creditAndInvoiceDetailsBlocMock.add(
          CreditAndInvoiceDetailsEvent.fetch(
            creditAndInvoiceItem: creditItemList.first,
            isMarketPlace: true,
          ),
        ),
      ).called(1);
      expect(
        autoRouterMock.current.name,
        CreditDetailsPageRoute(isMarketPlace: true).routeName,
      );
    });

    testWidgets('Show no record found when search key is empty',
        (tester) async {
      when(() => allCreditsBlocMock.state).thenReturn(
        AllCreditsState.initial().copyWith.appliedFilter(
              filterOption: FilterOption.amountRange(),
              amountValueFrom: RangeValue('0'),
              amountValueTo: RangeValue('1'),
            ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();

      final noRecordWidget = find.byType(NoRecordFound);
      expect(creditsItemTile, findsNothing);
      expect(noRecordWidget, findsOne);
      expect(
        find.descendant(
          of: noRecordWidget,
          matching: find.text('No credit to show'),
        ),
        findsOne,
      );
      expect(
        find.descendant(
          of: noRecordWidget,
          matching: find.text('Credits issued on eZRx+ will be shown here.'),
        ),
        findsOne,
      );
    });

    testWidgets('Show no record found when search key is not empty',
        (tester) async {
      when(() => allCreditsBlocMock.state).thenReturn(
        AllCreditsState.initial().copyWith.appliedFilter(
              searchKey: SearchKey.search('fake-key'),
            ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();

      final noRecordWidget = find.byType(NoRecordFound);
      expect(creditsItemTile, findsNothing);
      expect(noRecordWidget, findsOne);
      expect(
        find.descendant(
          of: noRecordWidget,
          matching: find.text("That didn't match anything"),
        ),
        findsOne,
      );
      expect(
        find.descendant(
          of: noRecordWidget,
          matching: find.text(
            'Try adjusting your search or filter selection to find what you’re looking for.',
          ),
        ),
        findsOne,
      );
    });
  });
}

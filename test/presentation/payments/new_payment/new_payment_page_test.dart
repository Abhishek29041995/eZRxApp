import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/payments/account_summary/account_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/bank_in_accounts/bank_in_accounts_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/filter/available_credit_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/filter/outstanding_invoice_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/new_payment_method.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_method_option.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/confirm_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/info_label.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_icon.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/new_payment/new_payment_page.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';
import '../../../common_mock_data/mock_bloc.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MPAccountSummaryBloc mpAccountSummaryBlocMock;
  late ZPAccountSummaryBloc accountSummaryBlocMock;
  late OutstandingInvoicesBloc outstandingInvoicesBlocMock;
  late OutstandingInvoiceFilterBloc outstandingInvoiceFilterBlocMock;
  late AvailableCreditsBloc availableCreditsBlocMock;
  late AvailableCreditFilterBloc availableCreditFilterBlocMock;
  late NewPaymentBloc newPaymentBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late AppRouter autoRouterMock;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  const error = Left(ApiFailure.other('fake-error'));
  late BankInAccountBlocMock bankInAccountsBlocMock;
  final fakeData = await NewPaymentLocalDataSource().getCustomerOpenItems();
  final fakeInvoices = fakeData;
  final fakeCredits = fakeData
      .map((e) => e.copyWith(openAmountInTransCrcy: -e.openAmountInTransCrcy))
      .toList();

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
    autoRouterMock = locator<AppRouter>();
  });

  setUp(() async {
    accountSummaryBlocMock = ZPAccountSummaryBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    outstandingInvoicesBlocMock = OutstandingInvoicesBlocMock();
    outstandingInvoiceFilterBlocMock = OutstandingInvoiceFilterBlocMock();
    availableCreditsBlocMock = AvailableCreditsBlocMock();
    availableCreditFilterBlocMock = AvailableCreditFilterBlocMock();
    newPaymentBlocMock = NewPaymentBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    authBlocMock = AuthBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    bankInAccountsBlocMock = BankInAccountBlocMock();
    mpAccountSummaryBlocMock = MPAccountSummaryBlocMock();

    when(() => accountSummaryBlocMock.state)
        .thenReturn(AccountSummaryState.initial());
    when(() => mpAccountSummaryBlocMock.state)
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
    when(() => bankInAccountsBlocMock.state)
        .thenReturn(BankInAccountsState.initial());
  });

  //////////////////////////////Finder//////////////////////////////////////
  final confirmBottomSheetConfirmButton =
      find.byKey(WidgetKeys.confirmBottomSheetConfirmButton);
  final closeButton = find.byKey(WidgetKeys.closeButton);
  final nextButton = find.byKey(WidgetKeys.nextButton);
  final nextButtonID = find.byKey(WidgetKeys.nextButtonID);
  final checkAllWidget = find.byKey(WidgetKeys.checkAllWidget);
  final confirmBottomSheet = find.byKey(WidgetKeys.confirmBottomSheet);

  ///////////////////////////////////////////////////////////////////////

  Widget getWidget({bool isMarketPlace = false}) {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      routeName: NewPaymentPageRoute.name,
      providers: [
        BlocProvider<ZPAccountSummaryBloc>(
          create: (context) => accountSummaryBlocMock,
        ),
        BlocProvider<MPAccountSummaryBloc>(
          create: (context) => mpAccountSummaryBlocMock,
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
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<NewPaymentBloc>(
          create: (context) => newPaymentBlocMock,
        ),
        BlocProvider<SalesOrgBloc>(
          create: (context) => salesOrgBlocMock,
        ),
        BlocProvider<AuthBloc>(create: (context) => authBlocMock),
        BlocProvider<AnnouncementBloc>(
          create: (context) => announcementBlocMock,
        ),
        BlocProvider<BankInAccountsBloc>(
          create: (context) => bankInAccountsBlocMock,
        ),
      ],
      child: NewPaymentPage(
        isMarketPlace: isMarketPlace,
      ),
    );
  }

  group('New payment page test', () {
    group('=> Display correct steps', () {
      testWidgets('=> For ID market', (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );
        when(() => outstandingInvoicesBlocMock.state).thenReturn(
          OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
        );
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial(),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final correctStepsTxt = find.textContaining('Step 1 of 2:');
        expect(correctStepsTxt, findsOneWidget);
      });
      testWidgets('=> For other markets', (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeSalesOrganisation,
          ),
        );
        when(() => outstandingInvoicesBlocMock.state).thenReturn(
          OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
        );
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial(),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final correctStepsTxt = find.textContaining('Step 1 of 3:');
        expect(correctStepsTxt, findsOneWidget);
      });
    });

    group('=> Step 1: Select invoices', () {
      testWidgets('=> AllCheckbox is unchecked as default',
          (WidgetTester tester) async {
        when(() => outstandingInvoicesBlocMock.state).thenReturn(
          OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
        );
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial(),
        );
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([NewPaymentState.initial()]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final checkAllInvoices = find.byType(CheckboxListTile);
        expect(checkAllInvoices, findsOneWidget);
        final value =
            (tester.firstWidget(checkAllInvoices) as CheckboxListTile).value;
        expect(value, false);
      });
      testWidgets('=> AllCheckbox is checked as all invoices are selected',
          (WidgetTester tester) async {
        when(() => outstandingInvoicesBlocMock.state).thenReturn(
          OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
        );
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(selectedInvoices: fakeInvoices),
        );
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([
            NewPaymentState.initial().copyWith(selectedInvoices: fakeInvoices),
          ]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final checkAllInvoices = find.byType(CheckboxListTile);
        expect(checkAllInvoices, findsOneWidget);
        final value =
            (tester.firstWidget(checkAllInvoices) as CheckboxListTile).value;
        expect(value, true);
      });
      testWidgets('=> Next button is disabled as default',
          (WidgetTester tester) async {
        when(() => outstandingInvoicesBlocMock.state).thenReturn(
          OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
        );
        when(() => newPaymentBlocMock.state)
            .thenReturn(NewPaymentState.initial());
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([NewPaymentState.initial()]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final nextButton1 = find.byKey(WidgetKeys.nextButton);
        expect(nextButton1, findsOneWidget);
        final value =
            (tester.firstWidget(nextButton1) as ElevatedButton).enabled;
        expect(value, false);
      });
      testWidgets('=> Next button is enabled as at least 1 invoice is selected',
          (WidgetTester tester) async {
        when(() => outstandingInvoicesBlocMock.state).thenReturn(
          OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
        );
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedInvoices: [fakeInvoices.first],
          ),
        );
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([
            NewPaymentState.initial().copyWith(
              selectedInvoices: [fakeInvoices.first],
            ),
          ]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final nextButton1 = find.byKey(WidgetKeys.nextButton);
        expect(nextButton1, findsOneWidget);
        final value =
            (tester.firstWidget(nextButton1) as ElevatedButton).enabled;
        expect(value, true);
      });

      testWidgets('=> Invoice Ph tax deducted price',
          (WidgetTester tester) async {
        when(() => outstandingInvoicesBlocMock.state).thenReturn(
          OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
        );
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedInvoices: [
              fakeInvoices.first.copyWith(
                displayCurrency: Currency('php'),
              ),
            ],
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final nextButton1 = find.byKey(WidgetKeys.nextButton);
        expect(nextButton1, findsOneWidget);
        final value =
            (tester.firstWidget(nextButton1) as ElevatedButton).enabled;
        expect(value, true);
        expect(
          find.text(
            fakeInvoices.first.openAmountInTransCrcy.toStringAsFixed(2),
          ),
          findsWidgets,
        );
      });
    });

    group('=> Step 2: Select credits', () {
      testWidgets('=> AllCheckbox is unchecked as default',
          (WidgetTester tester) async {
        when(() => outstandingInvoicesBlocMock.state).thenReturn(
          OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
        );
        when(() => availableCreditsBlocMock.state).thenReturn(
          AvailableCreditsState.initial().copyWith(items: fakeCredits),
        );
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial(),
        );
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([NewPaymentState.initial()]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final nextButton1 = find.byKey(WidgetKeys.nextButton);
        expect(nextButton1, findsOneWidget);
        await tester.tap(nextButton1);
        await tester.pumpAndSettle();

        final checkAllInvoices = find.byType(CheckboxListTile);
        expect(checkAllInvoices, findsOneWidget);
        final value =
            (tester.firstWidget(checkAllInvoices) as CheckboxListTile).value;
        expect(value, false);
      });
      testWidgets('=> AllCheckbox is checked as all credits are selected',
          (WidgetTester tester) async {
        when(() => outstandingInvoicesBlocMock.state).thenReturn(
          OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
        );
        when(() => availableCreditsBlocMock.state).thenReturn(
          AvailableCreditsState.initial().copyWith(items: fakeCredits),
        );
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedInvoices: fakeInvoices,
            selectedCredits: fakeCredits,
          ),
        );
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([
            NewPaymentState.initial().copyWith(
              selectedInvoices: fakeInvoices,
              selectedCredits: fakeCredits,
            ),
          ]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final nextButton = find.byKey(WidgetKeys.nextButton);
        expect(nextButton, findsOneWidget);
        await tester.tap(nextButton);
        await tester.pumpAndSettle();

        final checkAllInvoices = find.byType(CheckboxListTile);
        expect(checkAllInvoices, findsOneWidget);
        final value =
            (tester.firstWidget(checkAllInvoices) as CheckboxListTile).value;
        expect(value, true);
      });
      testWidgets('=> Next button is disabled as default',
          (WidgetTester tester) async {
        when(() => outstandingInvoicesBlocMock.state).thenReturn(
          OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
        );
        when(() => availableCreditsBlocMock.state).thenReturn(
          AvailableCreditsState.initial().copyWith(items: fakeCredits),
        );
        when(() => newPaymentBlocMock.state)
            .thenReturn(NewPaymentState.initial());
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([NewPaymentState.initial()]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final nextButton1 = find.byKey(WidgetKeys.nextButton);
        expect(nextButton1, findsOneWidget);
        await tester.tap(nextButton1);
        await tester.pumpAndSettle();

        final nextButton2 = find.byKey(WidgetKeys.nextButton);
        expect(nextButton2, findsOneWidget);
        final value =
            (tester.firstWidget(nextButton2) as ElevatedButton).enabled;
        expect(value, false);
      });
      testWidgets('=> Next button is enabled as at least 1 credit is selected',
          (WidgetTester tester) async {
        when(() => outstandingInvoicesBlocMock.state).thenReturn(
          OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
        );
        when(() => availableCreditsBlocMock.state).thenReturn(
          AvailableCreditsState.initial().copyWith(items: fakeCredits),
        );
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedInvoices: [fakeInvoices.first],
            selectedCredits: [fakeCredits.first],
          ),
        );
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([
            NewPaymentState.initial().copyWith(
              selectedInvoices: [fakeInvoices.first],
              selectedCredits: [fakeCredits.first],
            ),
          ]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final nextButton1 = find.byKey(WidgetKeys.nextButton);
        expect(nextButton1, findsOneWidget);
        await tester.tap(nextButton1);
        await tester.pumpAndSettle();

        final nextButton2 = find.byKey(WidgetKeys.nextButton);
        expect(nextButton2, findsOneWidget);
        final value =
            (tester.firstWidget(nextButton2) as ElevatedButton).enabled;
        expect(value, true);
      });
    });

    group('=> Step 3: Pay now', () {
      testWidgets('=> Tap Pay now button', (WidgetTester tester) async {
        when(() => outstandingInvoicesBlocMock.state).thenReturn(
          OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
        );
        when(() => availableCreditsBlocMock.state).thenReturn(
          AvailableCreditsState.initial().copyWith(items: fakeCredits),
        );
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedInvoices: [fakeInvoices.first],
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final nextButton1 = find.byKey(WidgetKeys.nextButton);
        expect(nextButton1, findsOneWidget);
        await tester.tap(nextButton1);
        await tester.pumpAndSettle();

        final nextButton2 = find.byKey(WidgetKeys.nextButton);
        expect(nextButton2, findsOneWidget);
        await tester.tap(nextButton2);
        await tester.pumpAndSettle();

        final generatePaymentAdviceButton =
            find.byKey(WidgetKeys.generatePaymentAdvice);
        expect(generatePaymentAdviceButton, findsOneWidget);
        expect(
          find.descendant(
            of: generatePaymentAdviceButton,
            matching: find.text('Generate payment advice'),
          ),
          findsOne,
        );
        await tester.tap(generatePaymentAdviceButton);
        verify(
          () => newPaymentBlocMock.add(const NewPaymentEvent.pay()),
        ).called(1);
      });

      testWidgets('=> Tap Generate payment advice button in marketplace',
          (tester) async {
        when(() => outstandingInvoicesBlocMock.state).thenReturn(
          OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
        );
        when(() => availableCreditsBlocMock.state).thenReturn(
          AvailableCreditsState.initial().copyWith(items: fakeCredits),
        );
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial()
              .copyWith(selectedInvoices: [fakeInvoices.first]),
        );
        await tester.pumpWidget(getWidget(isMarketPlace: true));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(WidgetKeys.nextButton));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(WidgetKeys.nextButton));
        await tester.pumpAndSettle();
        await tester.tap(
          find.descendant(
            of: find.byKey(WidgetKeys.generatePaymentAdvice),
            matching: find.text('Generate MP payment advice'),
          ),
        );
        verify(
          () => newPaymentBlocMock.add(const NewPaymentEvent.pay()),
        ).called(1);
        expect(
          autoRouterMock.current.name,
          PaymentAdviceCreatedPageRoute(isMarketPlace: true).routeName,
        );
        expect(
          (autoRouterMock.current.args as PaymentAdviceCreatedPageRouteArgs)
              .isMarketPlace,
          true,
        );
      });

      testWidgets('=> Tap Pay now button successful',
          (WidgetTester tester) async {
        when(() => outstandingInvoicesBlocMock.state).thenReturn(
          OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
        );
        when(() => availableCreditsBlocMock.state).thenReturn(
          AvailableCreditsState.initial().copyWith(items: fakeCredits),
        );
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedInvoices: [fakeInvoices.first],
          ),
        );
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([
            NewPaymentState.initial().copyWith(
              isLoading: true,
            ),
            NewPaymentState.initial().copyWith(
              isLoading: false,
            ),
          ]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        expect(autoRouterMock.currentPath, '/payments/payment_advice_created');
      });

      testWidgets('=> Test Previous button', (WidgetTester tester) async {
        await tester.binding.setSurfaceSize(const Size(480, 900));
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([
            NewPaymentState.initial().copyWith(
              failureOrSuccessOption: optionOf(error),
            ),
            NewPaymentState.initial(),
          ]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        expect(closeButton, findsOneWidget);
        await tester.tap(closeButton);
        expect(
          find.descendant(
            of: find.byType(ConfirmBottomSheet),
            matching: closeButton,
          ),
          findsNothing,
        );
      });

      testWidgets('=> Test new payment amount is negative',
          (WidgetTester tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedInvoices: fakeInvoices
                .map(
                  (e) => e.copyWith(
                    openAmountInTransCrcy: -100,
                  ),
                )
                .toList(),
            selectedCredits: fakeCredits,
            selectedPaymentMethod: NewPaymentMethod(
              paymentMethod: PaymentMethodValue('Bank-In'),
              options: [
                PaymentMethodOption.empty(),
              ],
            ),
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        expect(
          find.descendant(
            of: find.byType(InfoLabel),
            matching:
                find.text('Total credit amount cannot exceed invoice amount.'),
          ),
          findsOneWidget,
        );
        await tester.tap(nextButton);
        await tester.pumpAndSettle();
        expect(
          find.descendant(
            of: find.byType(InfoLabel),
            matching:
                find.text('Please select your virtual bank account to proceed'),
          ),
          findsOneWidget,
        );
      });

      testWidgets('=> Payment check invoice all selection',
          (WidgetTester tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedInvoices: fakeInvoices,
            selectedCredits: fakeCredits,
          ),
        );
        whenListen(
          outstandingInvoicesBlocMock,
          Stream.fromIterable([
            OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
          ]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        expect(checkAllWidget, findsOneWidget);
        await tester.tap(checkAllWidget);
        await tester.pumpAndSettle();
        verify(
          () => newPaymentBlocMock
              .add(const NewPaymentEvent.updateAllInvoices(items: [])),
        ).called(1);
      });

      testWidgets('=> Payment check Credit all selection',
          (WidgetTester tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedInvoices: fakeInvoices,
            selectedCredits: fakeCredits,
          ),
        );
        whenListen(
          outstandingInvoicesBlocMock,
          Stream.fromIterable([
            OutstandingInvoicesState.initial(),
            OutstandingInvoicesState.initial().copyWith(items: fakeInvoices),
          ]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        expect(nextButton, findsOneWidget);
        await tester.tap(nextButton);
        await tester.pumpAndSettle();
        expect(checkAllWidget, findsOneWidget);
        await tester.tap(checkAllWidget);
        await tester.pumpAndSettle();
        verify(
          () => newPaymentBlocMock
              .add(const NewPaymentEvent.updateAllCredits(items: [])),
        ).called(1);
      });

      testWidgets('=> Payment check total for ID', (WidgetTester tester) async {
        await tester.binding.setSurfaceSize(const Size(480, 900));

        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedInvoices: fakeInvoices,
            selectedCredits: fakeCredits,
            paymentMethods: [
              NewPaymentMethod(
                paymentMethod: PaymentMethodValue('Bank-In'),
                options: [
                  PaymentMethodOption.empty().copyWith(
                    bankOptionId: BankOptionId('permata'),
                  ),
                ],
              ),
            ],
            selectedPaymentMethod: NewPaymentMethod(
              paymentMethod: PaymentMethodValue('Bank-In'),
              options: [
                PaymentMethodOption.empty().copyWith(
                  bankOptionId: BankOptionId('permata'),
                ),
              ],
            ),
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );
        whenListen(
          availableCreditsBlocMock,
          Stream.fromIterable([
            AvailableCreditsState.initial(),
            AvailableCreditsState.initial().copyWith(items: fakeCredits),
          ]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        expect(nextButton, findsOneWidget);
        await tester.tap(nextButton);
        await tester.pumpAndSettle();
        await tester.tap(nextButtonID);
        await tester.pumpAndSettle();
        expect(
          confirmBottomSheet,
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: confirmBottomSheet,
            matching: find.text('Confirm payment settings?'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byType(ConfirmBottomSheet),
            matching: confirmBottomSheetConfirmButton,
          ),
          findsOneWidget,
        );
        await tester.tap(confirmBottomSheetConfirmButton);
        await tester.pumpAndSettle();
        verify(
          () => newPaymentBlocMock.add(
            const NewPaymentEvent.createVirtualAccount(),
          ),
        ).called(1);
      });

      testWidgets('=> Button Next ID listener disable',
          (WidgetTester tester) async {
        await tester.binding.setSurfaceSize(const Size(480, 900));

        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedInvoices: fakeInvoices,
            selectedCredits: fakeCredits,
            paymentMethods: [
              NewPaymentMethod(
                paymentMethod: PaymentMethodValue('Bank-In'),
                options: [
                  PaymentMethodOption.empty().copyWith(
                    bankOptionId: BankOptionId('permata'),
                  ),
                ],
              ),
            ],
            selectedPaymentMethod: NewPaymentMethod(
              paymentMethod: PaymentMethodValue('Bank-In'),
              options: [
                PaymentMethodOption.empty().copyWith(
                  bankOptionId: BankOptionId('permata'),
                ),
              ],
            ),
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );
        whenListen(
          availableCreditsBlocMock,
          Stream.fromIterable([
            AvailableCreditsState.initial(),
            AvailableCreditsState.initial().copyWith(items: fakeCredits),
          ]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        expect(nextButton, findsOneWidget);
        await tester.tap(nextButton);
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([
            NewPaymentState.initial().copyWith(
              selectedInvoices: fakeInvoices,
              selectedCredits: fakeCredits,
              paymentMethods: [
                NewPaymentMethod(
                  paymentMethod: PaymentMethodValue('Bank-In'),
                  options: [
                    PaymentMethodOption.empty().copyWith(
                      bankOptionId: BankOptionId('permata'),
                    ),
                  ],
                ),
              ],
              selectedPaymentMethod: NewPaymentMethod(
                paymentMethod: PaymentMethodValue('Bank-In'),
                options: [
                  PaymentMethodOption.empty().copyWith(
                    bankOptionId: BankOptionId('permata'),
                  ),
                ],
              ),
            ),
            NewPaymentState.initial().copyWith(
              selectedInvoices: fakeInvoices,
              selectedCredits: fakeCredits,
              paymentMethods: [
                NewPaymentMethod(
                  paymentMethod: PaymentMethodValue('Bank-In'),
                  options: [
                    PaymentMethodOption.empty().copyWith(
                      bankOptionId: BankOptionId('permata'),
                    ),
                  ],
                ),
              ],
              selectedPaymentMethod: NewPaymentMethod(
                paymentMethod: PaymentMethodValue('Bank-In'),
                options: [PaymentMethodOption.empty()],
              ),
            ),
          ]),
        );
        await tester.pumpAndSettle();
        await tester.tap(nextButtonID);
        await tester.pumpAndSettle();
        expect(
          confirmBottomSheet,
          findsNothing,
        );
        expect(
          find.descendant(
            of: confirmBottomSheet,
            matching: find.text('Confirm payment settings?'),
          ),
          findsNothing,
        );
        expect(
          find.descendant(
            of: find.byType(ConfirmBottomSheet),
            matching: confirmBottomSheetConfirmButton,
          ),
          findsNothing,
        );
        verifyNever(
          () => newPaymentBlocMock.add(
            const NewPaymentEvent.createVirtualAccount(),
          ),
        );
      });

      testWidgets('=> Button Next ID listener enable',
          (WidgetTester tester) async {
        await tester.binding.setSurfaceSize(const Size(480, 900));

        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedInvoices: fakeInvoices,
            selectedCredits: fakeCredits,
            paymentMethods: [
              NewPaymentMethod(
                paymentMethod: PaymentMethodValue('Bank-In'),
                options: [
                  PaymentMethodOption.empty().copyWith(
                    bankOptionId: BankOptionId('permata'),
                  ),
                ],
              ),
            ],
            selectedPaymentMethod: NewPaymentMethod(
              paymentMethod: PaymentMethodValue('Bank-In'),
              options: [
                PaymentMethodOption.empty().copyWith(
                  bankOptionId: BankOptionId('permata'),
                ),
              ],
            ),
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );
        whenListen(
          availableCreditsBlocMock,
          Stream.fromIterable([
            AvailableCreditsState.initial(),
            AvailableCreditsState.initial().copyWith(items: fakeCredits),
          ]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        expect(nextButton, findsOneWidget);
        await tester.tap(nextButton);
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([
            NewPaymentState.initial().copyWith(
              selectedInvoices: fakeInvoices,
              selectedCredits: fakeCredits,
              paymentMethods: [
                NewPaymentMethod(
                  paymentMethod: PaymentMethodValue('Bank-In'),
                  options: [
                    PaymentMethodOption.empty().copyWith(
                      bankOptionId: BankOptionId('permata'),
                    ),
                  ],
                ),
              ],
              selectedPaymentMethod: NewPaymentMethod(
                paymentMethod: PaymentMethodValue('Bank-In'),
                options: [PaymentMethodOption.empty()],
              ),
            ),
            NewPaymentState.initial().copyWith(
              selectedInvoices: fakeInvoices,
              selectedCredits: fakeCredits,
              paymentMethods: [
                NewPaymentMethod(
                  paymentMethod: PaymentMethodValue('Bank-In'),
                  options: [
                    PaymentMethodOption.empty().copyWith(
                      bankOptionId: BankOptionId('permata'),
                    ),
                  ],
                ),
              ],
              selectedPaymentMethod: NewPaymentMethod(
                paymentMethod: PaymentMethodValue('Bank-In'),
                options: [
                  PaymentMethodOption.empty().copyWith(
                    bankOptionId: BankOptionId('permata'),
                  ),
                ],
              ),
            ),
          ]),
        );
        await tester.pumpAndSettle();
        await tester.tap(nextButtonID);
        await tester.pumpAndSettle();
        expect(
          confirmBottomSheet,
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: confirmBottomSheet,
            matching: find.text('Confirm payment settings?'),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byType(ConfirmBottomSheet),
            matching: confirmBottomSheetConfirmButton,
          ),
          findsOneWidget,
        );
        await tester.tap(confirmBottomSheetConfirmButton);
        await tester.pumpAndSettle();
        verify(
          () => newPaymentBlocMock.add(
            const NewPaymentEvent.createVirtualAccount(),
          ),
        ).called(1);
      });
    });

    testWidgets(
      ' -> Find Account Suspended Banner when Customer Code is blocked',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeBlockedCustomerCodeInfo,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

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
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final customerBlockedBanner =
            find.byKey(WidgetKeys.customerBlockedBanner);

        expect(customerBlockedBanner, findsOneWidget);
      },
    );

    group('=> Appbar', () {
      testWidgets('- ZP payment', (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byType(AppBar),
            matching: find.textContaining('New payment', findRichText: true),
          ),
          findsOne,
        );
      });

      testWidgets('- MP payment', (tester) async {
        await tester.pumpWidget(getWidget(isMarketPlace: true));
        await tester.pumpAndSettle();
        final appBar = find.byType(AppBar);
        expect(
          find.descendant(
            of: appBar,
            matching:
                find.textContaining('Make a MP payment', findRichText: true),
          ),
          findsOne,
        );
        expect(
          find.descendant(of: appBar, matching: find.byType(MarketPlaceIcon)),
          findsOne,
        );
      });
    });
  });
}

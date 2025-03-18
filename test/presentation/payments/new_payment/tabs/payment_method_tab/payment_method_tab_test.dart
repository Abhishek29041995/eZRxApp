import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/bank_in_accounts/bank_in_accounts_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary_details/payment_summary_details_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/payments/entities/new_payment_method.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_method_option.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/edge_checkbox.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/payment_method_tab.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../common_mock_data/mock_bloc.dart';
import '../../../../../common_mock_data/mock_other.dart';
import '../../../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../../../utils/widget_utils.dart';

void main() {
  late NewPaymentBloc newPaymentBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late AppRouter autoRouterMock;
  late EligibilityBloc eligibilityBlocMock;
  late BankInAccountsBloc bankInAccountsBlocMock;
  late PaymentSummaryDetailsBloc paymentSummaryDetailsBlocMock;
  late List<NewPaymentMethod> paymentMethodList;
  const fakeErrorMessage = 'fake-error';

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AutoRouteMock());
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
    autoRouterMock = locator<AutoRouteMock>();
  });

  setUp(() async {
    paymentSummaryDetailsBlocMock = PaymentSummaryDetailsBlocMock();
    newPaymentBlocMock = NewPaymentBlocMock();
    customerCodeBlocMock = CustomerCodeBlocMock();
    bankInAccountsBlocMock = BankInAccountBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    paymentSummaryDetailsBlocMock = PaymentSummaryDetailsBlocMock();
    registerFallbackValue((Route route) {
      return route.settings.name == PaymentPageRoute.name;
    });
    paymentMethodList = await NewPaymentLocalDataSource().fetchPaymentMethods();
  });

  setUp(() async {
    when(() => newPaymentBlocMock.state).thenReturn(NewPaymentState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => newPaymentBlocMock.state).thenReturn(NewPaymentState.initial());
    when(() => eligibilityBlocMock.state).thenReturn(
      EligibilityState.initial().copyWith(
        salesOrgConfigs: fakeMYSalesOrgConfigs,
        salesOrganisation: fakeSalesOrganisation,
      ),
    );
    when(() => bankInAccountsBlocMock.state)
        .thenReturn(BankInAccountsState.initial());
    when(() => paymentSummaryDetailsBlocMock.state)
        .thenReturn(PaymentSummaryDetailsState.initial());
  });

  //////////////////Finder////////////////////////////////////////////////////
  final paymentMethodRadio = find.byKey(WidgetKeys.paymentMethodRadio);
  ////////////////////////////////////////////////////////////////////////////

  Widget getWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      routeName: NewPaymentPageRoute.name,
      providers: [
        BlocProvider<NewPaymentBloc>(
          create: (context) => newPaymentBlocMock,
        ),
        BlocProvider<CustomerCodeBloc>(
          create: (context) => customerCodeBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<BankInAccountsBloc>(
          create: (context) => bankInAccountsBlocMock,
        ),
        BlocProvider<PaymentSummaryDetailsBloc>(
          create: (context) => paymentSummaryDetailsBlocMock,
        ),
      ],
      child: const Scaffold(
        body: PaymentMethodTab(),
      ),
    );
  }

  group('Payment method tab -', () {
    testWidgets('Initial state', (tester) async {
      await tester.binding.setSurfaceSize(const Size(480, 900));

      when(() => newPaymentBlocMock.state).thenReturn(
        NewPaymentState.initial().copyWith(
          selectedPaymentMethod: NewPaymentMethod.empty().copyWith(
            paymentMethod: PaymentMethodValue('Bank-In'),
          ),
        ),
      );
      whenListen(
        bankInAccountsBlocMock,
        Stream.fromIterable([
          BankInAccountsState.initial().copyWith(
            isFetching: true,
          ),
          BankInAccountsState.initial(),
        ]),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();

      expect(find.byKey(WidgetKeys.createPaymentAdviseNote), findsOneWidget);
      expect(
        find.byKey(WidgetKeys.detailInfoSection('Select payment method'.tr())),
        findsOneWidget,
      );
      expect(find.byKey(WidgetKeys.paymentMethodSelector), findsOneWidget);
      expect(
        find.byKey(WidgetKeys.detailInfoSection('Payment details'.tr())),
        findsOneWidget,
      );
      expect(find.byType(AddressInfoSection), findsOneWidget);
      expect(find.byKey(WidgetKeys.invoiceCreditListView), findsOneWidget);
      verify(
        () => newPaymentBlocMock.add(
          const NewPaymentEvent.fetchAvailablePaymentMethods(),
        ),
      ).called(1);
    });

    group('Create payment advise note -', () {
      testWidgets('Not visible when market is not PH', (tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedPaymentMethod: NewPaymentMethod.empty().copyWith(
              paymentMethod: PaymentMethodValue('Bank-In'),
            ),
          ),
        );
        whenListen(
          bankInAccountsBlocMock,
          Stream.fromIterable([
            BankInAccountsState.initial().copyWith(
              bankInAccounts: [BankBeneficiary.empty()],
            ),
            BankInAccountsState.initial(),
          ]),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(find.byKey(WidgetKeys.createPaymentAdviseWarning), findsNothing);
      });

      testWidgets('Visible when market is PH', (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial()
              .copyWith
              .salesOrganisation(salesOrg: fakePHSalesOrg),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        expect(
          find.byKey(WidgetKeys.createPaymentAdviseWarning),
          findsOneWidget,
        );
        expect(
          find.text(
            'You are advised to generate the Payment Advice Notice (PAN) only when you intend to make payment within 15 calendar days. Unused PANs will be automatically deleted after 30 days. You may create a new PAN thereafter.',
            findRichText: true,
          ),
          findsOneWidget,
        );
      });
    });

    group('Payment selector -', () {
      const selectedIndex = 0;

      testWidgets('Fetch payment methods when pull to refresh', (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();
        await tester.fling(
          find.byKey(WidgetKeys.scrollList),
          const Offset(0.0, 300.0),
          800.0,
        );
        await tester.pump();
        expect(
          find.byType(RefreshProgressIndicator),
          findsOneWidget,
        );
        await tester.pumpAndSettle();
        verify(
          () => newPaymentBlocMock
              .add(const NewPaymentEvent.fetchAvailablePaymentMethods()),
        ).called(2);
      });

      testWidgets('Show shimmer when loading', (tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(isFetchingPaymentMethod: true),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final paymentMethodSelector =
            find.byKey(WidgetKeys.paymentMethodSelector);
        expect(paymentMethodSelector, findsOneWidget);
        expect(
          find.descendant(
            of: paymentMethodSelector,
            matching: find.byType(LoadingShimmer),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: paymentMethodSelector,
            matching: find.byKey(WidgetKeys.paymentMethodTile),
          ),
          findsNothing,
        );
      });

      testWidgets('Show no record found when there is no payment method',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final paymentMethodSelector =
            find.byKey(WidgetKeys.paymentMethodSelector);
        expect(paymentMethodSelector, findsOneWidget);
        expect(
          find.descendant(
            of: paymentMethodSelector,
            matching: find.text('No available payment method'),
          ),
          findsOneWidget,
        );
      });

      testWidgets('Show list of payment method when loaded success',
          (tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedPaymentMethod: paymentMethodList[selectedIndex],
            paymentMethods: paymentMethodList,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final paymentMethodSelector =
            find.byKey(WidgetKeys.paymentMethodSelector);
        expect(paymentMethodSelector, findsOneWidget);
        expect(
          find.descendant(
            of: paymentMethodSelector,
            matching: find.byType(LoadingShimmer),
          ),
          findsNothing,
        );
        final tile = find.byKey(WidgetKeys.paymentMethodTile);
        expect(
          find.descendant(of: paymentMethodSelector, matching: tile),
          findsNWidgets(paymentMethodList.length),
        );
        final radio = find.byKey(WidgetKeys.paymentMethodRadio);
        expect(
          find.descendant(of: tile, matching: radio),
          findsNWidgets(paymentMethodList.length),
        );
        for (var i = 0; i < paymentMethodList.length; i++) {
          final widget = tester.widget<Radio>(radio.at(i));
          expect(widget.value, paymentMethodList[i].paymentMethod);
          expect(
            widget.groupValue,
            paymentMethodList[selectedIndex].paymentMethod,
          );
        }
      });

      testWidgets('Show snack bar when loaded failure', (tester) async {
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([
            NewPaymentState.initial().copyWith(
              isFetchingPaymentMethod: true,
            ),
            NewPaymentState.initial().copyWith(
              failureOrSuccessOption:
                  optionOf(const Left(ApiFailure.other(fakeErrorMessage))),
            ),
          ]),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
        final message = find.byKey(WidgetKeys.customSnackBarMessage);
        expect(
          tester.widget<Text>(message).data,
          equals(fakeErrorMessage.tr()),
        );
      });

      testWidgets('Update status when tap on item', (tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            paymentMethods: paymentMethodList,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final item = find.byKey(WidgetKeys.paymentMethodTile);
        expect(item, findsNWidgets(paymentMethodList.length));

        await tester.tap(item.at(selectedIndex));
        await tester.pump();

        verify(
          () => newPaymentBlocMock.add(
            NewPaymentEvent.updatePaymentMethodSelected(
              paymentMethodSelected: paymentMethodList[selectedIndex],
            ),
          ),
        ).called(1);
      });
    });

    group('Bank-in information -', () {
      final bankInWidget = find.byKey(WidgetKeys.bankInAccountInfo);
      final bankInfoTile = find.byKey(WidgetKeys.bankInfoTile);

      testWidgets(
          'Not visible and not fetch when selected payment method is not bank-in',
          (tester) async {
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable(
            [
              NewPaymentState.initial().copyWith(
                selectedPaymentMethod: NewPaymentMethod(
                  paymentMethod: PaymentMethodValue('fake'),
                  options: [],
                ),
              ),
            ],
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        expect(bankInWidget, findsNothing);

        verifyNever(
          () => bankInAccountsBlocMock.add(
            BankInAccountsEvent.bankInFetch(salesOrg: fakeSalesOrg),
          ),
        );
      });

      testWidgets(
          'Visible and start fetch when selected payment method is bank-in',
          (tester) async {
        final bankInSelectedState = NewPaymentState.initial().copyWith(
          selectedPaymentMethod: NewPaymentMethod(
            paymentMethod: PaymentMethodValue('Bank-In'),
            options: [],
          ),
        );
        when(() => newPaymentBlocMock.state).thenReturn(bankInSelectedState);
        whenListen(
          newPaymentBlocMock,
          Stream.fromIterable([NewPaymentState.initial(), bankInSelectedState]),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        expect(bankInWidget, findsOneWidget);
        expect(
          find.descendant(
            of: bankInWidget,
            matching: find.byKey(WidgetKeys.bankInInstructionNote),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(of: bankInWidget, matching: bankInfoTile),
          findsNothing,
        );

        verify(
          () => bankInAccountsBlocMock.add(
            BankInAccountsEvent.bankInFetch(salesOrg: fakeSalesOrg),
          ),
        ).called(1);
      });

      testWidgets('Show loading logo when fetching', (tester) async {
        final bankInSelectedState = NewPaymentState.initial().copyWith(
          selectedPaymentMethod: NewPaymentMethod(
            paymentMethod: PaymentMethodValue('Bank-In'),
            options: [],
          ),
        );
        when(() => newPaymentBlocMock.state).thenReturn(bankInSelectedState);
        when(() => bankInAccountsBlocMock.state).thenReturn(
          BankInAccountsState.initial().copyWith(isFetching: true),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        expect(bankInWidget, findsNothing);
        expect(
          find.byKey(WidgetKeys.loaderImage),
          findsOneWidget,
        );
      });

      testWidgets('Show bank info detail list', (tester) async {
        final bankInfoList = [BankBeneficiary.empty(), BankBeneficiary.empty()];
        final bankInSelectedState = NewPaymentState.initial().copyWith(
          selectedPaymentMethod: NewPaymentMethod(
            paymentMethod: PaymentMethodValue('Bank-In'),
            options: [],
          ),
        );
        when(() => newPaymentBlocMock.state).thenReturn(bankInSelectedState);
        when(() => bankInAccountsBlocMock.state).thenReturn(
          BankInAccountsState.initial().copyWith(bankInAccounts: bankInfoList),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        expect(bankInWidget, findsOneWidget);
        expect(
          find.descendant(of: bankInWidget, matching: bankInfoTile),
          findsNWidgets(bankInfoList.length),
        );
      });
    });

    group('Credit and invoice list -', () {
      const fakeAccountingDocument = 'fake-id';
      const fakeAmount = 10000.0;
      final priceText = StringUtils.priceComponentDisplayPrice(
        fakeMYSalesOrgConfigs,
        fakeAmount,
        true,
      );
      final fakeNetDueDate = DateTimeStringValue('fake');
      final fakeItem = CustomerOpenItem.empty().copyWith(
        accountingDocument: fakeAccountingDocument,
        openAmountInTransCrcy: fakeAmount,
        netDueDate: fakeNetDueDate,
        documentReferenceID: StringValue('0800072883'),
      );
      final items = [fakeItem, fakeItem];
      testWidgets('Not display when no selected invoice and credit ',
          (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        expect(find.byKey(WidgetKeys.invoiceCreditItemTile), findsNothing);
      });

      testWidgets('Display when having selected credits', (tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedCredits: items,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        expect(
          find.byKey(WidgetKeys.invoiceCreditItemTile),
          findsNWidgets(items.length),
        );
      });

      testWidgets('Display when having selected invoices', (tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedInvoices: items,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        expect(
          find.byKey(WidgetKeys.invoiceCreditItemTile),
          findsNWidgets(items.length),
        );
      });

      testWidgets('Display invoice/credit information', (tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(selectedCredits: items),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();
        final tile = find.byKey(WidgetKeys.invoiceCreditItemTile);
        expect(
          find.byKey(WidgetKeys.invoiceCreditItemTile),
          findsNWidgets(items.length),
        );

        final id = find.byKey(WidgetKeys.invoiceCreditItemId);
        final amount = find.byKey(WidgetKeys.invoiceCreditItemAmount);
        final dueDate = find.byKey(WidgetKeys.invoiceCreditItemDate);
        expect(
          find.descendant(of: tile, matching: id),
          findsNWidgets(items.length),
        );
        expect(
          find.descendant(of: tile, matching: amount),
          findsNWidgets(items.length),
        );
        expect(
          find.descendant(of: tile, matching: dueDate),
          findsNWidgets(items.length),
        );
        expect(
          tester.widget<Text>(id.first).data,
          contains(fakeAccountingDocument),
        );
        expect(
          tester.widget<Text>(dueDate.first).data,
          equals(fakeNetDueDate.dateString),
        );
        expect(
          find.descendant(
            of: amount.first,
            matching: find.text(priceText, findRichText: true),
          ),
          findsOneWidget,
        );
      });
      testWidgets('Apl payment bank selection', (tester) async {
        await tester.binding.setSurfaceSize(const Size(480, 900));

        final paymentMethodOption = PaymentMethodOption.empty().copyWith(
          bankOptionId: BankOptionId('permata'),
        );
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            paymentMethods: [
              NewPaymentMethod(
                paymentMethod: PaymentMethodValue('Bank-In'),
                options: [
                  paymentMethodOption.copyWith(
                    bankOptionId: BankOptionId('mandiri'),
                  ),
                ],
              ),
              NewPaymentMethod(
                paymentMethod: PaymentMethodValue('Bank-In'),
                options: [paymentMethodOption],
              ),
            ],
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle(const Duration(seconds: 1));
        expect(
          paymentMethodRadio,
          findsAtLeastNWidgets(2),
        );
        final edgeCheckbox = find.byType(EdgeCheckbox);
        expect(
          find.byType(EdgeCheckbox),
          findsAtLeastNWidgets(2),
        );
        await tester.tap(edgeCheckbox.last);
        await tester.pumpAndSettle(const Duration(seconds: 1));

        verify(
          () => newPaymentBlocMock.add(
            NewPaymentEvent.updatePaymentMethodOptionSelected(
              paymentMethodOptionSelected: paymentMethodOption,
            ),
          ),
        ).called(1);
      });

      testWidgets('Find Gov.No in payment method tab', (tester) async {
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial().copyWith(
            selectedInvoices: [fakeItem],
          ),
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
    });

    group('APL Payment Method Test', () {
      setUp(
        () {
          when(() => newPaymentBlocMock.state).thenReturn(
            NewPaymentState.initial().copyWith(
              paymentMethods: paymentMethodList,
            ),
          );
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrganisation: fakeIDSalesOrganisation,
            ),
          );
        },
      );
      testWidgets('Display For ID market', (tester) async {
        await tester.binding.setSurfaceSize(const Size(600, 900));
        tester.view.devicePixelRatio = 1;
        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(find.byKey(WidgetKeys.aplPaymentSelector), findsOneWidget);
        expect(
          find.byKey(WidgetKeys.paymentMethodRadio),
          findsNWidgets(paymentMethodList.length),
        );
      });

      testWidgets('On Payment Option Change', (tester) async {
        await tester.binding.setSurfaceSize(const Size(600, 900));
        await tester.pumpWidget(getWidget());
        await tester.pump();
        final checkBoxFinder =
            find.byKey(WidgetKeys.paymentMethodCheckbox).first;
        await tester.tap(checkBoxFinder);
        verify(
          () => newPaymentBlocMock.add(
            NewPaymentEvent.updatePaymentMethodOptionSelected(
              paymentMethodOptionSelected:
                  paymentMethodList.first.banksOnlyAllowTransferSameBank.first,
            ),
          ),
        ).called(1);
      });
    });

    group('Warning Announcement', () {
      testWidgets('Show warning announcement for PH market', (tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: fakePHSalesOrganisation,
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();
        expect(
          find.byKey(WidgetKeys.createPaymentAdviseWarning),
          findsOneWidget,
        );
      });
    });
  });
}

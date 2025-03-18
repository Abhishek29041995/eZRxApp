import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/payments/account_summary/account_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/claim_management/claim_management_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/application/payments/full_summary/full_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/filter/available_credit_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_in_progress/payment_in_progress_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/filter/payment_summary_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary_details/payment_summary_details_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_filter/soa_filter_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_limit.dart';
import 'package:ezrxmobile/domain/payments/entities/full_summary_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_balance.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/principal_cutoffs.dart';
import 'package:ezrxmobile/domain/payments/entities/soa.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/soa_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/section_tile.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/payment_home/payment_page.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_ph_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late AuthBloc authBlocMock;
  late AppRouter autoRouterMock;
  late NewPaymentBloc newPaymentBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late ZPAccountSummaryBloc accountSummaryBlocMock;
  late MPAccountSummaryBloc mpAccountSummaryBloc;
  late AccountSummaryState accountSummaryState;
  late ZPPaymentInProgressBloc paymentInProgressBloc;
  late MPPaymentInProgressBloc mpPaymentInProgressBloc;
  late ZPSoaBloc soaBloc;
  late MPSoaBloc mpSoaBloc;
  late PaymentInProgressState paymentInProgressState;
  late AvailableCreditsBloc availableCreditsBlocMock;
  late AvailableCreditFilterBloc availableCreditFilterBloc;
  late OutstandingInvoicesBloc outstandingInvoicesBlocMock;
  late DownloadPaymentAttachmentsBloc downloadPaymentAttachmentsBloc;
  late ClaimManagementBloc claimManagementBloc;
  late SoaFilterBloc soaFilterBlocMock;
  const fakeError = ApiFailure.other('fake-error');
  late List<Soa> soaList;
  late ZPFullSummaryBloc fullSummaryBlocMock;
  late MPFullSummaryBloc mpFullSummaryBlocMock;
  late ZPAllInvoicesBloc allInvoicesBlocMock;
  late MPAllInvoicesBloc mpAllInvoicesBlocMock;
  late ZPAllCreditsBloc allCreditsBlocMock;
  late MPAllCreditsBloc mpAllCreditsBlocMock;
  late ZPPaymentSummaryBloc paymentSummaryBlocMock;
  late MPPaymentSummaryBloc mpPaymentSummaryBlocMock;

  late PaymentSummaryFilterBloc paymentSummaryFilterBlocMock;
  late PaymentSummaryDetailsBloc paymentSummaryDetailsBlocMock;

  //////////////////////Finder/////////////////////////////

  final statementOfAccountsMenu =
      find.byKey(WidgetKeys.statementOfAccountsMenu);
  final paymentHomeInProgressCard =
      find.byKey(WidgetKeys.paymentHomeInProgressCard);
  final paymentHomeObscuredAmount =
      find.byKey(WidgetKeys.paymentHomeObscuredAmount);
  final claimsMenu = find.byKey(WidgetKeys.claimsMenu);
  final paymentHome = find.byKey(WidgetKeys.scrollList);
  final appBar = find.byKey(WidgetKeys.paymentHomeAppBar);
  final totalOverdue = find.byKey(WidgetKeys.totalOverdue);
  final paymentHomeSoa = find.byKey(WidgetKeys.paymentHomeSoa);
  final totalCreditLimit = find.byKey(WidgetKeys.totalCreditLimit);
  final inProgressAmount = find.byKey(WidgetKeys.inProgressAmount);
  final totalOutstanding = find.byKey(WidgetKeys.totalOutstanding);
  final accountSummaryMenu = find.byKey(WidgetKeys.accountSummaryMenu);
  final paymentSummaryMenu = find.byKey(WidgetKeys.paymentSummaryMenu);
  final creditLimitUtilized = find.byKey(WidgetKeys.creditLimitUtilized);
  final creditLimitRemaining = find.byKey(WidgetKeys.creditLimitRemaining);
  final paymentHomeOptionMenu = find.byKey(WidgetKeys.paymentHomeOptionMenu);
  final paymentHomeCreditCard = find.byKey(WidgetKeys.paymentHomeCreditCard);
  final paymentHomeInvoiceCard = find.byKey(WidgetKeys.paymentHomeInvoiceCard);

  ////////////////////////////////////////////////////////

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AutoRouteMock());
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
    autoRouterMock = locator<AutoRouteMock>();
    accountSummaryState = AccountSummaryState.initial().copyWith(
      creditLimit: CreditLimit.empty().copyWith(
        creditLimit: StringValue('101'),
        creditExposure: StringValue('102'),
        creditBalance: StringValue('103'),
      ),
      outstandingBalance: OutstandingBalance.empty().copyWith(
        amount: StringValue('104'),
        overdue: StringValue('105'),
      ),
    );
    paymentInProgressState = PaymentInProgressState.initial().copyWith(
      amount: StringValue('100'),
    );
    soaList = await SoaLocalDataSource().getSoa();
  });

  setUp(() async {
    reset(autoRouterMock);
    soaBloc = ZPSoaBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    claimManagementBloc = ClaimManagementBlocMock();
    authBlocMock = AuthBlocMock();
    newPaymentBlocMock = NewPaymentBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    accountSummaryBlocMock = ZPAccountSummaryBlocMock();
    paymentInProgressBloc = ZPPaymentInProgressBlocMock();
    availableCreditsBlocMock = AvailableCreditsBlocMock();
    availableCreditFilterBloc = AvailableCreditFilterBlocMock();
    outstandingInvoicesBlocMock = OutstandingInvoicesBlocMock();
    downloadPaymentAttachmentsBloc = DownloadPaymentAttachmentsBlocMock();
    soaFilterBlocMock = SoaFilterBlocMock();
    mpSoaBloc = MPSoaBlocMock();
    mpAccountSummaryBloc = MPAccountSummaryBlocMock();
    mpPaymentInProgressBloc = MPPaymentInProgressBlocMock();
    fullSummaryBlocMock = ZPFullSummaryBlocMock();
    allInvoicesBlocMock = ZPAllInvoicesBlocMock();
    allCreditsBlocMock = ZPAllCreditsBlocMock();
    paymentSummaryBlocMock = ZPPaymentSummaryBlocMock();
    paymentSummaryFilterBlocMock = PaymentSummaryFilterBlocMock();
    paymentSummaryDetailsBlocMock = PaymentSummaryDetailsBlocMock();
    mpFullSummaryBlocMock = MPFullSummaryBlocMock();
    mpAllInvoicesBlocMock = MPAllInvoicesBlocMock();
    mpAllCreditsBlocMock = MPAllCreditsBlocMock();
    mpPaymentSummaryBlocMock = MPPaymentSummaryBlocMock();

    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    when(() => paymentInProgressBloc.state)
        .thenReturn(PaymentInProgressState.initial());
    when(() => accountSummaryBlocMock.state)
        .thenReturn(AccountSummaryState.initial());
    when(() => availableCreditsBlocMock.state)
        .thenReturn(AvailableCreditsState.initial());
    when(() => availableCreditsBlocMock.state)
        .thenReturn(AvailableCreditsState.initial());
    when(() => availableCreditFilterBloc.state)
        .thenReturn(AvailableCreditFilterState.initial());
    when(() => outstandingInvoicesBlocMock.state)
        .thenReturn(OutstandingInvoicesState.initial());
    when(() => outstandingInvoicesBlocMock.state)
        .thenReturn(OutstandingInvoicesState.initial());
    when(() => downloadPaymentAttachmentsBloc.state)
        .thenReturn(DownloadPaymentAttachmentsState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => soaBloc.state).thenReturn(SoaState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => newPaymentBlocMock.state).thenReturn(NewPaymentState.initial());
    when(() => newPaymentBlocMock.state).thenReturn(NewPaymentState.initial());
    when(() => claimManagementBloc.state)
        .thenReturn(ClaimManagementState.initial());

    when(() => autoRouterMock.currentPath).thenReturn(PaymentPageRoute.name);
    when(() => autoRouterMock.stack).thenReturn([MaterialPageXMock()]);
    when(() => autoRouterMock.maybePop())
        .thenAnswer((invocation) async => true);
    when(() => mpSoaBloc.state).thenReturn(SoaState.initial());
    when(() => mpAccountSummaryBloc.state)
        .thenReturn(AccountSummaryState.initial());
    when(() => mpPaymentInProgressBloc.state)
        .thenReturn(PaymentInProgressState.initial());
    when(() => fullSummaryBlocMock.state)
        .thenReturn(FullSummaryState.initial());
    when(() => allInvoicesBlocMock.state)
        .thenReturn(AllInvoicesState.initial());
    when(() => allCreditsBlocMock.state).thenReturn(AllCreditsState.initial());
    when(() => paymentSummaryBlocMock.state)
        .thenReturn(PaymentSummaryState.initial());
    when(() => paymentSummaryFilterBlocMock.state)
        .thenReturn(PaymentSummaryFilterState.initial());
    when(() => paymentSummaryDetailsBlocMock.state)
        .thenReturn(PaymentSummaryDetailsState.initial());
    when(() => mpFullSummaryBlocMock.state)
        .thenReturn(FullSummaryState.initial());
    when(() => mpAllInvoicesBlocMock.state)
        .thenReturn(AllInvoicesState.initial());
    when(() => mpAllCreditsBlocMock.state)
        .thenReturn(AllCreditsState.initial());
    when(() => mpPaymentSummaryBlocMock.state)
        .thenReturn(PaymentSummaryState.initial());
  });

  //////////////////////////////Finder//////////////////////////////////////
  final downloadStatementAccountIcon =
      find.byKey(WidgetKeys.downloadStatementAccountIcon);
  final itemStatementAccounts = find.byKey(WidgetKeys.itemStatementAccounts);
  final confirmBottomSheet = find.byKey(WidgetKeys.confirmBottomSheet);

  ///////////////////////////////////////////////////////////////////////

  Widget getWidget({bool isMarketPlace = false}) {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      routeName: NewPaymentPageRoute.name,
      providers: [
        BlocProvider<ZPSoaBloc>(
          create: (context) => soaBloc,
        ),
        BlocProvider<MPSoaBloc>(
          create: (context) => mpSoaBloc,
        ),
        BlocProvider<NewPaymentBloc>(
          create: (context) => newPaymentBlocMock,
        ),
        BlocProvider<AnnouncementBloc>(
          create: (context) => announcementBlocMock,
        ),
        BlocProvider<ZPPaymentInProgressBloc>(
          create: (context) => paymentInProgressBloc,
        ),
        BlocProvider<MPPaymentInProgressBloc>(
          create: (context) => mpPaymentInProgressBloc,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<ZPAccountSummaryBloc>(
          create: (context) => accountSummaryBlocMock,
        ),
        BlocProvider<MPAccountSummaryBloc>(
          create: (context) => mpAccountSummaryBloc,
        ),
        BlocProvider<AvailableCreditsBloc>(
          create: (context) => availableCreditsBlocMock,
        ),
        BlocProvider<AvailableCreditFilterBloc>(
          create: (context) => availableCreditFilterBloc,
        ),
        BlocProvider<OutstandingInvoicesBloc>(
          create: (context) => outstandingInvoicesBlocMock,
        ),
        BlocProvider<DownloadPaymentAttachmentsBloc>(
          create: (context) => downloadPaymentAttachmentsBloc,
        ),
        BlocProvider<AuthBloc>(create: (context) => authBlocMock),
        BlocProvider<SoaFilterBloc>(create: (context) => soaFilterBlocMock),
        BlocProvider<ZPFullSummaryBloc>(
          create: (context) => fullSummaryBlocMock,
        ),
        BlocProvider<MPFullSummaryBloc>(
          create: (context) => mpFullSummaryBlocMock,
        ),
        BlocProvider<ZPAllInvoicesBloc>(
          create: (context) => allInvoicesBlocMock,
        ),
        BlocProvider<MPAllInvoicesBloc>(
          create: (context) => mpAllInvoicesBlocMock,
        ),
        BlocProvider<ZPAllCreditsBloc>(
          create: (context) => allCreditsBlocMock,
        ),
        BlocProvider<MPAllCreditsBloc>(
          create: (context) => mpAllCreditsBlocMock,
        ),
        BlocProvider<ZPPaymentSummaryBloc>(
          create: (context) => paymentSummaryBlocMock,
        ),
        BlocProvider<MPPaymentSummaryBloc>(
          create: (context) => mpPaymentSummaryBlocMock,
        ),
        BlocProvider<PaymentSummaryFilterBloc>(
          create: (context) => paymentSummaryFilterBlocMock,
        ),
        BlocProvider<PaymentSummaryDetailsBloc>(
          create: (context) => paymentSummaryDetailsBlocMock,
        ),
        BlocProvider<ClaimManagementBloc>(
          create: (context) => claimManagementBloc,
        ),
      ],
      child: PaymentPage(isMarketPlace: isMarketPlace),
    );
  }

  group('Payment Home Initialize', () {
    testWidgets('Check payment home initialize for ZP Payment',
        (WidgetTester tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClientUser,
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      expect(paymentHomeOptionMenu, findsOneWidget);
      expect(accountSummaryMenu, findsOneWidget);
      expect(paymentSummaryMenu, findsOneWidget);
      expect(statementOfAccountsMenu, findsOneWidget);
      expect(claimsMenu, findsNothing);

      //ZP Payment
      verify(
        () => accountSummaryBlocMock.add(
          AccountSummaryEvent.fetchInvoiceSummary(
            custCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            salesOrg: fakeMYSalesOrganisation.salesOrg,
          ),
        ),
      ).called(1);
      verify(
        () => accountSummaryBlocMock.add(
          AccountSummaryEvent.fetchCreditSummary(
            custCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            salesOrg: fakeMYSalesOrganisation.salesOrg,
          ),
        ),
      ).called(1);
      verify(
        () => paymentInProgressBloc.add(
          PaymentInProgressEvent.fetch(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganization: fakeMYSalesOrganisation,
          ),
        ),
      ).called(1);
      verify(
        () => soaBloc.add(
          SoaEvent.fetch(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrg: fakeMYSalesOrganisation.salesOrg,
          ),
        ),
      ).called(1);

      verify(
        () => allInvoicesBlocMock.add(
          AllInvoicesEvent.initialized(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        ),
      ).called(1);
      verify(
        () => allInvoicesBlocMock.add(
          AllInvoicesEvent.fetch(
            appliedFilter: AllInvoicesFilter.defaultFilter(),
          ),
        ),
      ).called(1);

      verify(
        () => allCreditsBlocMock.add(
          AllCreditsEvent.initialized(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        ),
      ).called(1);
      verify(
        () => allCreditsBlocMock.add(
          AllCreditsEvent.fetch(
            appliedFilter: AllCreditsFilter.defaultFilter(),
          ),
        ),
      ).called(1);

      verify(
        () => fullSummaryBlocMock.add(
          FullSummaryEvent.initialized(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        ),
      ).called(1);
      verify(
        () => fullSummaryBlocMock.add(
          FullSummaryEvent.fetch(
            appliedFilter: FullSummaryFilter.defaultFilter(),
          ),
        ),
      ).called(1);

      verify(
        () => paymentSummaryBlocMock.add(
          PaymentSummaryEvent.initialized(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganization: fakeMYSalesOrganisation,
          ),
        ),
      ).called(1);
      verify(
        () => paymentSummaryBlocMock.add(
          PaymentSummaryEvent.fetch(
            appliedFilter: PaymentSummaryFilter.defaultFilter(),
          ),
        ),
      ).called(1);

      verify(
        () => paymentSummaryFilterBlocMock.add(
          PaymentSummaryFilterEvent.initialized(
            salesOrg: fakeMYSalesOrganisation.salesOrg,
          ),
        ),
      ).called(1);

      //MP Payment
      verifyNever(
        () => mpAccountSummaryBloc.add(
          AccountSummaryEvent.fetchInvoiceSummary(
            custCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            salesOrg: fakeMYSalesOrganisation.salesOrg,
          ),
        ),
      );
      verifyNever(
        () => mpAccountSummaryBloc.add(
          AccountSummaryEvent.fetchCreditSummary(
            custCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            salesOrg: fakeMYSalesOrganisation.salesOrg,
          ),
        ),
      );
      verifyNever(
        () => mpPaymentInProgressBloc.add(
          PaymentInProgressEvent.fetch(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganization: fakeMYSalesOrganisation,
          ),
        ),
      );
      verifyNever(
        () => mpSoaBloc.add(
          SoaEvent.fetch(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrg: fakeMYSalesOrganisation.salesOrg,
          ),
        ),
      );

      verifyNever(
        () => mpAllInvoicesBlocMock.add(
          AllInvoicesEvent.initialized(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        ),
      );
      verifyNever(
        () => mpAllInvoicesBlocMock.add(
          AllInvoicesEvent.fetch(
            appliedFilter: AllInvoicesFilter.defaultFilter(),
          ),
        ),
      );

      verifyNever(
        () => mpAllCreditsBlocMock.add(
          AllCreditsEvent.initialized(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        ),
      );
      verifyNever(
        () => mpAllCreditsBlocMock.add(
          AllCreditsEvent.fetch(
            appliedFilter: AllCreditsFilter.defaultFilter(),
          ),
        ),
      );

      verifyNever(
        () => mpFullSummaryBlocMock.add(
          FullSummaryEvent.initialized(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        ),
      );
      verifyNever(
        () => mpFullSummaryBlocMock.add(
          FullSummaryEvent.fetch(
            appliedFilter: FullSummaryFilter.defaultFilter(),
          ),
        ),
      );

      verifyNever(
        () => mpPaymentSummaryBlocMock.add(
          PaymentSummaryEvent.initialized(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganization: fakeMYSalesOrganisation,
          ),
        ),
      );
      verifyNever(
        () => mpPaymentSummaryBlocMock.add(
          PaymentSummaryEvent.fetch(
            appliedFilter: PaymentSummaryFilter.defaultFilter(),
          ),
        ),
      );

      verifyNever(
        () => paymentSummaryFilterBlocMock.add(
          PaymentSummaryFilterEvent.initialized(
            salesOrg: fakeMYSalesOrganisation.salesOrg,
          ),
        ),
      );
    });

    testWidgets('Check payment home initialize for MP Payment',
        (WidgetTester tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeMarketPlaceCustomerCode,
          shipToInfo: fakeShipToInfo,
          user: fakeClientUserAccessMarketPlace,
        ),
      );
      await tester.pumpWidget(getWidget(isMarketPlace: true));
      await tester.pump();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      expect(paymentHomeOptionMenu, findsOneWidget);
      expect(accountSummaryMenu, findsOneWidget);
      expect(paymentSummaryMenu, findsOneWidget);
      expect(statementOfAccountsMenu, findsOneWidget);
      expect(claimsMenu, findsNothing);

      //MP Payment
      verify(
        () => mpAccountSummaryBloc.add(
          AccountSummaryEvent.fetchInvoiceSummary(
            custCode: fakeMarketPlaceCustomerCode.customerCodeSoldTo,
            salesOrg: fakeMYSalesOrganisation.salesOrg,
          ),
        ),
      ).called(1);
      verify(
        () => mpAccountSummaryBloc.add(
          AccountSummaryEvent.fetchCreditSummary(
            custCode: fakeMarketPlaceCustomerCode.customerCodeSoldTo,
            salesOrg: fakeMYSalesOrganisation.salesOrg,
          ),
        ),
      ).called(1);
      verify(
        () => mpPaymentInProgressBloc.add(
          PaymentInProgressEvent.fetch(
            customerCodeInfo: fakeMarketPlaceCustomerCode,
            salesOrganization: fakeMYSalesOrganisation,
          ),
        ),
      ).called(1);
      verify(
        () => mpSoaBloc.add(
          SoaEvent.fetch(
            customerCodeInfo: fakeMarketPlaceCustomerCode,
            salesOrg: fakeMYSalesOrganisation.salesOrg,
          ),
        ),
      ).called(1);

      verify(
        () => mpAllInvoicesBlocMock.add(
          AllInvoicesEvent.initialized(
            customerCodeInfo: fakeMarketPlaceCustomerCode,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        ),
      ).called(1);
      verify(
        () => mpAllInvoicesBlocMock.add(
          AllInvoicesEvent.fetch(
            appliedFilter: AllInvoicesFilter.defaultFilter(),
          ),
        ),
      ).called(1);

      verify(
        () => mpAllCreditsBlocMock.add(
          AllCreditsEvent.initialized(
            customerCodeInfo: fakeMarketPlaceCustomerCode,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        ),
      ).called(1);
      verify(
        () => mpAllCreditsBlocMock.add(
          AllCreditsEvent.fetch(
            appliedFilter: AllCreditsFilter.defaultFilter(),
          ),
        ),
      ).called(1);

      verify(
        () => mpFullSummaryBlocMock.add(
          FullSummaryEvent.initialized(
            customerCodeInfo: fakeMarketPlaceCustomerCode,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        ),
      ).called(1);
      verify(
        () => mpFullSummaryBlocMock.add(
          FullSummaryEvent.fetch(
            appliedFilter: FullSummaryFilter.defaultFilter(),
          ),
        ),
      ).called(1);

      verify(
        () => mpPaymentSummaryBlocMock.add(
          PaymentSummaryEvent.initialized(
            customerCodeInfo: fakeMarketPlaceCustomerCode,
            salesOrganization: fakeMYSalesOrganisation,
          ),
        ),
      ).called(1);
      verify(
        () => mpPaymentSummaryBlocMock.add(
          PaymentSummaryEvent.fetch(
            appliedFilter: PaymentSummaryFilter.defaultFilter(),
          ),
        ),
      ).called(1);

      verify(
        () => paymentSummaryFilterBlocMock.add(
          PaymentSummaryFilterEvent.initialized(
            salesOrg: fakeMYSalesOrganisation.salesOrg,
          ),
        ),
      ).called(1);

      //ZP Payment
      verifyNever(
        () => accountSummaryBlocMock.add(
          AccountSummaryEvent.fetchInvoiceSummary(
            custCode: fakeMarketPlaceCustomerCode.customerCodeSoldTo,
            salesOrg: fakeMYSalesOrganisation.salesOrg,
          ),
        ),
      );
      verifyNever(
        () => accountSummaryBlocMock.add(
          AccountSummaryEvent.fetchCreditSummary(
            custCode: fakeMarketPlaceCustomerCode.customerCodeSoldTo,
            salesOrg: fakeMYSalesOrganisation.salesOrg,
          ),
        ),
      );
      verifyNever(
        () => paymentInProgressBloc.add(
          PaymentInProgressEvent.fetch(
            customerCodeInfo: fakeMarketPlaceCustomerCode,
            salesOrganization: fakeMYSalesOrganisation,
          ),
        ),
      );
      verifyNever(
        () => soaBloc.add(
          SoaEvent.fetch(
            customerCodeInfo: fakeMarketPlaceCustomerCode,
            salesOrg: fakeMYSalesOrganisation.salesOrg,
          ),
        ),
      );

      verifyNever(
        () => allInvoicesBlocMock.add(
          AllInvoicesEvent.initialized(
            customerCodeInfo: fakeMarketPlaceCustomerCode,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        ),
      );
      verifyNever(
        () => allInvoicesBlocMock.add(
          AllInvoicesEvent.fetch(
            appliedFilter: AllInvoicesFilter.defaultFilter(),
          ),
        ),
      );

      verifyNever(
        () => allCreditsBlocMock.add(
          AllCreditsEvent.initialized(
            customerCodeInfo: fakeMarketPlaceCustomerCode,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        ),
      );
      verifyNever(
        () => allCreditsBlocMock.add(
          AllCreditsEvent.fetch(
            appliedFilter: AllCreditsFilter.defaultFilter(),
          ),
        ),
      );

      verifyNever(
        () => fullSummaryBlocMock.add(
          FullSummaryEvent.initialized(
            customerCodeInfo: fakeMarketPlaceCustomerCode,
            salesOrganisation: fakeMYSalesOrganisation,
          ),
        ),
      );
      verifyNever(
        () => fullSummaryBlocMock.add(
          FullSummaryEvent.fetch(
            appliedFilter: FullSummaryFilter.defaultFilter(),
          ),
        ),
      );

      verifyNever(
        () => paymentSummaryBlocMock.add(
          PaymentSummaryEvent.initialized(
            customerCodeInfo: fakeMarketPlaceCustomerCode,
            salesOrganization: fakeMYSalesOrganisation,
          ),
        ),
      );
      verifyNever(
        () => paymentSummaryBlocMock.add(
          PaymentSummaryEvent.fetch(
            appliedFilter: PaymentSummaryFilter.defaultFilter(),
          ),
        ),
      );
    });
  });

  group('Payment Home Option menu check', () {
    testWidgets('Check payment option menu noClaim',
        (WidgetTester tester) async {
      final soaRoute = StatementAccountsPageRoute(isMarketPlace: false);
      final accountSummaryRoute = AccountSummaryRoute(isMarketPlace: false);
      final paymentSummaryRoute = PaymentSummaryPageRoute(isMarketPlace: false);
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      when(() => autoRouterMock.push(accountSummaryRoute)).thenAnswer(
        (_) => Future.value(),
      );
      when(() => autoRouterMock.push(soaRoute)).thenAnswer(
        (_) => Future.value(),
      );
      when(() => autoRouterMock.push(paymentSummaryRoute)).thenAnswer(
        (_) => Future.value(),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      expect(paymentHomeOptionMenu, findsOneWidget);
      expect(accountSummaryMenu, findsOneWidget);
      expect(paymentSummaryMenu, findsOneWidget);
      expect(statementOfAccountsMenu, findsOneWidget);
      expect(claimsMenu, findsNothing);
      await tester.tap(accountSummaryMenu);
      await tester.pumpAndSettle();
      verify(
        () => autoRouterMock.push(accountSummaryRoute),
      ).called(1);
      await tester.tap(statementOfAccountsMenu);
      await tester.pumpAndSettle();
      verify(
        () => soaFilterBlocMock.add(const SoaFilterEvent.initialized()),
      ).called(1);
      verify(
        () => autoRouterMock.push(soaRoute),
      ).called(1);
      await tester.tap(paymentSummaryMenu);
      verify(
        () => autoRouterMock.push(paymentSummaryRoute),
      ).called(1);
    });

    testWidgets('Check payment option menu With Claim',
        (WidgetTester tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakePHSalesOrganisation,
          salesOrgConfigs: fakePHSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeClientUser,
        ),
      );
      when(() => autoRouterMock.push(const ClaimManagementPageRoute()))
          .thenAnswer(
        (_) => Future.value(),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      expect(paymentHomeOptionMenu, findsOneWidget);
      expect(accountSummaryMenu, findsOneWidget);
      expect(paymentSummaryMenu, findsOneWidget);
      expect(statementOfAccountsMenu, findsOneWidget);
      expect(claimsMenu, findsOneWidget);
      await tester.tap(claimsMenu);
      verify(
        () => claimManagementBloc.add(
          ClaimManagementEvent.initialized(
            salesOrganisation: fakePHSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeClientUser,
          ),
        ),
      ).called(1);

      verify(
        () => autoRouterMock.push(const ClaimManagementPageRoute()),
      ).called(1);
    });

    testWidgets('Check payment option in marketplace payment', (tester) async {
      final accountSummaryRoute = AccountSummaryRoute(isMarketPlace: true);
      final soaRoute = StatementAccountsPageRoute(isMarketPlace: true);
      final paymentSummaryRoute = PaymentSummaryPageRoute(isMarketPlace: true);
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          user: fakeClientUserAccessMarketPlace,
        ),
      );
      when(() => autoRouterMock.push(accountSummaryRoute)).thenAnswer(
        (_) => Future.value(),
      );
      when(() => autoRouterMock.push(soaRoute))
          .thenAnswer((_) => Future.value());

      when(() => autoRouterMock.push(paymentSummaryRoute))
          .thenAnswer((_) => Future.value());

      await tester.pumpWidget(getWidget(isMarketPlace: true));
      await tester.pump();

      expect(
        find.descendant(
          of: paymentSummaryMenu,
          matching: find.text('MP\nPayment summary'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: accountSummaryMenu,
          matching: find.text('MP\nAccount summary'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: statementOfAccountsMenu,
          matching: find.text('MP\nStatement of accounts'),
        ),
        findsOneWidget,
      );
      expect(claimsMenu, findsNothing);

      await tester.tap(accountSummaryMenu);
      await tester.pumpAndSettle();
      verify(
        () => autoRouterMock.push(accountSummaryRoute),
      ).called(1);

      await tester.tap(statementOfAccountsMenu);
      await tester.pumpAndSettle();
      verify(
        () => soaFilterBlocMock.add(const SoaFilterEvent.initialized()),
      ).called(1);
      verify(
        () => autoRouterMock.push(soaRoute),
      ).called(1);

      await tester.tap(paymentSummaryMenu);
      verify(
        () => autoRouterMock.push(paymentSummaryRoute),
      ).called(1);
    });
  });

  group('Principle cut off', () {
    testWidgets('Updating Principle cut off', (tester) async {
      whenListen(
        newPaymentBlocMock,
        Stream.fromIterable([
          NewPaymentState.initial().copyWith(
            isFetchingPrincipalCutoffs: true,
          ),
          NewPaymentState.initial().copyWith(),
        ]),
      );
      when(
        () => autoRouterMock.push(
          NewPaymentPageRoute(
            isMarketPlace: false,
          ),
        ),
      ).thenAnswer((invocation) => Future.value());
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();

      verify(
        () => outstandingInvoicesBlocMock.add(
          OutstandingInvoicesEvent.fetch(
            appliedFilter: OutstandingInvoiceFilter.defaultFilter(),
            searchKey: SearchKey.empty(),
            isMarketPlace: false,
          ),
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
      verify(
        () => availableCreditFilterBloc.add(
          const AvailableCreditFilterEvent.initialize(),
        ),
      ).called(1);
    });

    testWidgets('Updating Principle cut off to 0', (tester) async {
      whenListen(
        newPaymentBlocMock,
        Stream.fromIterable([
          NewPaymentState.initial().copyWith(
            isFetchingPrincipalCutoffs: true,
          ),
          NewPaymentState.initial().copyWith(
            principalCutoffs: const PrincipalCutoffs(total: 0),
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        ]),
      );
      when(
        () => autoRouterMock.push(
          NewPaymentPageRoute(
            isMarketPlace: false,
          ),
        ),
      ).thenAnswer((invocation) => Future.value());
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      verify(
        () => outstandingInvoicesBlocMock.add(
          OutstandingInvoicesEvent.fetch(
            appliedFilter: OutstandingInvoiceFilter.defaultFilter(),
            searchKey: SearchKey.empty(),
            isMarketPlace: false,
          ),
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

    testWidgets('Updating Principle cut off for Id and closed for payment',
        (tester) async {
      whenListen(
        newPaymentBlocMock,
        Stream.fromIterable([
          NewPaymentState.initial().copyWith(
            isFetchingPrincipalCutoffs: true,
          ),
          NewPaymentState.initial().copyWith(
            principalCutoffs: const PrincipalCutoffs(total: 100),
            salesOrganisation: fakeIDSalesOrganisation,
          ),
        ]),
      );
      when(
        () => autoRouterMock.push(
          NewPaymentPageRoute(
            isMarketPlace: false,
          ),
        ),
      ).thenAnswer((invocation) => Future.value());
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(
        confirmBottomSheet,
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: confirmBottomSheet,
          matching: find.text('We are closed for payment'),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: confirmBottomSheet,
          matching: find.text(
            "We are unable to proceed with the payment during the month's end. Please try again the following month. Thank you",
          ),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Updating Principle cut off error', (tester) async {
      whenListen(
        newPaymentBlocMock,
        Stream.fromIterable([
          NewPaymentState.initial().copyWith(
            isFetchingPrincipalCutoffs: true,
          ),
          NewPaymentState.initial().copyWith(
            failureOrSuccessOption: optionOf(const Left(fakeError)),
          ),
        ]),
      );
      when(
        () => autoRouterMock.push(
          NewPaymentPageRoute(
            isMarketPlace: false,
          ),
        ),
      ).thenAnswer((invocation) => Future.value());
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byType(CustomSnackBar),
          matching: find.text(fakeError.failureMessage.message),
        ),
        findsOneWidget,
      );
    });
  });

  group('Payment Home Credit', () {
    testWidgets('Check Credit Widgets', (WidgetTester tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(appBar, findsOneWidget);
      expect(paymentHome, findsOneWidget);
      expect(paymentHomeCreditCard, findsOneWidget);
      expect(creditLimitUtilized, findsOneWidget);
      expect(creditLimitRemaining, findsOneWidget);
      expect(totalCreditLimit, findsOneWidget);
    });

    testWidgets('Credit section is not visible when hideCredit is true',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith.salesOrgConfigs(hideCredit: true),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();

      expect(paymentHomeCreditCard, findsNothing);
      expect(creditLimitUtilized, findsNothing);
      expect(creditLimitRemaining, findsNothing);
      expect(totalCreditLimit, findsNothing);
    });
  });

  group('Payment Home Invoice', () {
    testWidgets('Check Invoice widgets', (WidgetTester tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      expect(paymentHomeInvoiceCard, findsOneWidget);
      expect(totalOutstanding, findsOneWidget);
      expect(totalCreditLimit, findsOneWidget);
      expect(totalOverdue, findsOneWidget);
    });

    testWidgets('check loading', (WidgetTester tester) async {
      whenListen(
        accountSummaryBlocMock,
        Stream.fromIterable([
          accountSummaryState.copyWith(isFetchingOutstandingBalance: true),
        ]),
      );

      await tester.pumpFrames(
        getWidget(),
        const Duration(seconds: 1),
      );
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      expect(paymentHomeInvoiceCard, findsOneWidget);
      expect(
        find.descendant(
          of: paymentHomeInvoiceCard,
          matching: find.byType(LoadingShimmer),
        ),
        findsWidgets,
      );
    });
  });

  group('Payment Home In progress', () {
    testWidgets('Check progress widgets', (WidgetTester tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      await tester.scrollUntilVisible(paymentHomeInProgressCard, 200);
      expect(paymentHomeInProgressCard, findsOneWidget);
      expect(inProgressAmount, findsOneWidget);
    });

    testWidgets('Check in progress Amount empty', (WidgetTester tester) async {
      when(() => accountSummaryBlocMock.state).thenReturn(
        accountSummaryState,
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      await tester.scrollUntilVisible(paymentHomeInProgressCard, 200);
      expect(paymentHomeInProgressCard, findsOneWidget);
      expect(inProgressAmount, findsOneWidget);
      expect(
        find.text(
          'NA',
          findRichText: true,
        ),
        findsOneWidget,
      );
    });

    testWidgets('Check check obscured', (WidgetTester tester) async {
      when(() => paymentInProgressBloc.state).thenReturn(
        paymentInProgressState,
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      await tester.scrollUntilVisible(paymentHomeInProgressCard, 200);
      expect(paymentHomeInProgressCard, findsOneWidget);

      expect(inProgressAmount, findsOneWidget);
      expect(
        find.text(
          '100',
          findRichText: true,
        ),
        findsNothing,
      );
      expect(paymentHomeObscuredAmount, findsNWidgets(3));
      await tester.ensureVisible(paymentHomeObscuredAmount.last);
      await tester.pump();
      await tester.tap(paymentHomeObscuredAmount.last);
      await tester.pump();
      expect(
        find.textContaining(
          '100',
          findRichText: true,
        ),
        findsOneWidget,
      );
    });

    testWidgets('check loading', (WidgetTester tester) async {
      whenListen(
        paymentInProgressBloc,
        Stream.fromIterable([
          paymentInProgressState.copyWith(isFetching: true),
        ]),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      await tester.scrollUntilVisible(paymentHomeInProgressCard, 200);
      expect(paymentHomeInProgressCard, findsOneWidget);
      expect(inProgressAmount, findsOneWidget);
    });

    testWidgets('payment summary fetch failure', (WidgetTester tester) async {
      final paymentSummaryRoute = PaymentSummaryPageRoute(isMarketPlace: false);
      await tester.binding.setSurfaceSize(const Size(480, 900));

      whenListen(
        paymentInProgressBloc,
        Stream.fromIterable([
          paymentInProgressState.copyWith(
            failureOrSuccessOption: optionOf(
              const Left(fakeError),
            ),
          ),
        ]),
      );
      when(() => autoRouterMock.push(paymentSummaryRoute)).thenAnswer(
        (_) => Future.value(),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      expect(paymentHomeInProgressCard, findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(CustomSnackBar),
          matching: find.text(fakeError.failureMessage.message),
        ),
        findsOneWidget,
      );
      final paymentSummarySection = find.descendant(
        of: find.byType(SectionTitle),
        matching: find.text('Payment summary'),
      );
      expect(
        paymentSummarySection,
        findsWidgets,
      );
      await tester.tap(
        find.byKey(WidgetKeys.sectionTileIcon('Payment summary'.tr())),
      );
      await tester.pumpAndSettle();
      verify(
        () => autoRouterMock.push(paymentSummaryRoute),
      ).called(1);
    });

    testWidgets('payment summary in MP payment', (WidgetTester tester) async {
      final route = PaymentSummaryPageRoute(isMarketPlace: true);
      when(() => autoRouterMock.push(route)).thenAnswer((_) => Future.value());

      await tester.pumpWidget(getWidget(isMarketPlace: true));
      await tester.pumpAndSettle();

      final sectionTile =
          find.byKey(WidgetKeys.sectionTileIcon('MP Payment summary'));
      await tester.scrollUntilVisible(sectionTile, 200);
      await tester.pump();
      expect(sectionTile, findsOne);
      await tester.tap(sectionTile);
      await tester.pumpAndSettle();
      verify(() => autoRouterMock.push(route)).called(1);
    });
  });

  group('Payment Home Statement of account', () {
    testWidgets('Check statement of account', (WidgetTester tester) async {
      when(() => autoRouterMock.isTopMost).thenReturn(true);
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakePHSalesOrganisation,
          salesOrgConfigs: fakePHSalesOrgConfigs,
        ),
      );
      whenListen(
        downloadPaymentAttachmentsBloc,
        Stream.fromIterable([
          DownloadPaymentAttachmentsState.initial().copyWith(
            isDownloadInProgress: true,
          ),
          DownloadPaymentAttachmentsState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Left(fakeError),
            ),
          ),
        ]),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      await tester.fling(paymentHome, const Offset(0.0, -300.0), 800.0);
      await tester.pumpAndSettle();
      expect(paymentHomeSoa, findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(CustomSnackBar),
          matching: find.text(fakeError.failureMessage.message.tr()),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Check statement of account downloaded failed',
        (WidgetTester tester) async {
      when(() => autoRouterMock.isTopMost).thenReturn(true);
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakePHSalesOrganisation,
          salesOrgConfigs: fakePHSalesOrgConfigs,
        ),
      );
      whenListen(
        downloadPaymentAttachmentsBloc,
        Stream.fromIterable([
          DownloadPaymentAttachmentsState.initial().copyWith(
            isDownloadInProgress: true,
          ),
          DownloadPaymentAttachmentsState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Right(unit),
            ),
          ),
        ]),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      await tester.fling(paymentHome, const Offset(0.0, -300.0), 800.0);
      await tester.pumpAndSettle();
      expect(paymentHomeSoa, findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(CustomSnackBar),
          matching: find.text('File downloaded successfully'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('No Statement of Accounts payment option for ID',
        (WidgetTester tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('1900')),
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentHome, findsOneWidget);
      expect(paymentHomeOptionMenu, findsOneWidget);
      expect(accountSummaryMenu, findsOneWidget);
      expect(paymentSummaryMenu, findsOneWidget);
      expect(statementOfAccountsMenu, findsNothing);
      expect(claimsMenu, findsNothing);
    });
    testWidgets('account summary navigation', (WidgetTester tester) async {
      final soaRoute = StatementAccountsPageRoute(isMarketPlace: false);
      await tester.binding.setSurfaceSize(const Size(480, 900));
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakePHSalesOrganisation,
          salesOrgConfigs: fakePHSalesOrgConfigs,
        ),
      );
      when(() => autoRouterMock.push(soaRoute)).thenAnswer(
        (_) => Future.value(),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      expect(statementOfAccountsMenu, findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(SectionTitle),
          matching: find.text('Statement of accounts'),
        ),
        findsOneWidget,
      );
      await tester.tap(
        find.byKey(WidgetKeys.sectionTileIcon('Statement of accounts'.tr())),
      );
      await tester.pumpAndSettle();
      verify(
        () => autoRouterMock.push(soaRoute),
      ).called(1);
    });

    testWidgets('soa in MP payment', (tester) async {
      final soaRoute = StatementAccountsPageRoute(isMarketPlace: true);
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakePHSalesOrganisation,
          salesOrgConfigs: fakePHSalesOrgConfigs,
        ),
      );
      when(() => autoRouterMock.push(soaRoute))
          .thenAnswer((_) => Future.value());

      await tester.pumpWidget(getWidget(isMarketPlace: true));
      await tester.pumpAndSettle();
      final section =
          find.byKey(WidgetKeys.sectionTileIcon('MP Statement of accounts'));
      await tester.scrollUntilVisible(section, 400);
      await tester.pump();
      expect(section, findsOneWidget);
      await tester.tap(section);
      await tester.pumpAndSettle();

      verify(
        () => autoRouterMock.push(soaRoute),
      ).called(1);
    });

    testWidgets('account summary soa List', (WidgetTester tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakePHSalesOrganisation,
          salesOrgConfigs: fakePHSalesOrgConfigs,
        ),
      );
      when(() => soaBloc.state).thenReturn(
        SoaState.initial().copyWith(soaList: soaList),
      );

      await tester.binding.setSurfaceSize(const Size(480, 900));
      tester.view.devicePixelRatio = 1;
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      expect(paymentHome, findsOneWidget);
      expect(appBar, findsOneWidget);
      expect(statementOfAccountsMenu, findsOneWidget);
      expect(
        find.descendant(
          of: find.byType(SectionTitle),
          matching: find.text('Statement of accounts'),
        ),
        findsOneWidget,
      );
      expect(itemStatementAccounts, findsWidgets);
      expect(downloadStatementAccountIcon, findsWidgets);
      await tester.fling(
        find.byKey(WidgetKeys.scrollList),
        const Offset(0.0, -1000.0),
        1000.0,
      );
      await tester.pump();
      await tester.tap(downloadStatementAccountIcon.first);
      await tester.pumpAndSettle();
      verify(
        () => downloadPaymentAttachmentsBloc.add(
          DownloadPaymentAttachmentEvent.downloadSOA(
            soaData: soaList.first.soaData,
          ),
        ),
      ).called(1);
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
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final customerBlockedBanner =
            find.byKey(WidgetKeys.customerBlockedBanner);

        expect(customerBlockedBanner, findsOneWidget);
      },
    );
  });

  group('Refresh', () {
    testWidgets('ZP payment', (WidgetTester tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      verify(
        () => soaBloc.add(
          SoaEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrg: SalesOrg(''),
          ),
        ),
      ).called(1);

      verify(
        () => accountSummaryBlocMock.add(
          AccountSummaryEvent.fetchCreditSummary(
            custCode: '',
            salesOrg: SalesOrg(''),
          ),
        ),
      ).called(1);

      verify(
        () => accountSummaryBlocMock.add(
          AccountSummaryEvent.fetchInvoiceSummary(
            custCode: '',
            salesOrg: SalesOrg(''),
          ),
        ),
      ).called(1);

      verify(
        () => paymentInProgressBloc.add(
          PaymentInProgressEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganization: SalesOrganisation.empty(),
          ),
        ),
      ).called(1);

      await tester.fling(paymentHome, const Offset(0.0, 300.0), 800.0);
      await tester.pump();
      expect(
        find.byType(RefreshProgressIndicator),
        findsOneWidget,
      );
      await tester.pumpAndSettle();
      verify(
        () => soaBloc.add(
          SoaEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrg: SalesOrg(''),
          ),
        ),
      ).called(1);
    });

    testWidgets(
        'ZP payment when statementOfAccountEnabled is off in salesOrgConfig',
        (WidgetTester tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pumpAndSettle();
      verifyNever(
        () => soaBloc.add(
          SoaEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrg: SalesOrg(''),
          ),
        ),
      );

      verify(
        () => accountSummaryBlocMock.add(
          AccountSummaryEvent.fetchCreditSummary(
            custCode: '',
            salesOrg: SalesOrg(''),
          ),
        ),
      ).called(1);

      verify(
        () => accountSummaryBlocMock.add(
          AccountSummaryEvent.fetchInvoiceSummary(
            custCode: '',
            salesOrg: SalesOrg(''),
          ),
        ),
      ).called(1);

      verify(
        () => paymentInProgressBloc.add(
          PaymentInProgressEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganization: SalesOrganisation.empty(),
          ),
        ),
      ).called(1);

      await tester.fling(paymentHome, const Offset(0.0, 300.0), 800.0);
      await tester.pump();
      expect(
        find.byType(RefreshProgressIndicator),
        findsOneWidget,
      );
      await tester.pumpAndSettle();
      verifyNever(
        () => soaBloc.add(
          SoaEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrg: SalesOrg(''),
          ),
        ),
      );
    });

    testWidgets('MP payment', (WidgetTester tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
        ),
      );
      await tester.pumpWidget(getWidget(isMarketPlace: true));
      await tester.pumpAndSettle();
      verify(
        () => mpSoaBloc.add(
          SoaEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrg: SalesOrg(''),
          ),
        ),
      ).called(1);

      verify(
        () => mpAccountSummaryBloc.add(
          AccountSummaryEvent.fetchCreditSummary(
            custCode: '',
            salesOrg: SalesOrg(''),
          ),
        ),
      ).called(1);

      verify(
        () => mpAccountSummaryBloc.add(
          AccountSummaryEvent.fetchInvoiceSummary(
            custCode: '',
            salesOrg: SalesOrg(''),
          ),
        ),
      ).called(1);

      verify(
        () => mpPaymentInProgressBloc.add(
          PaymentInProgressEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganization: SalesOrganisation.empty(),
          ),
        ),
      ).called(1);

      await tester.fling(paymentHome, const Offset(0.0, 300.0), 800.0);
      await tester.pump();
      expect(
        find.byType(RefreshProgressIndicator),
        findsOneWidget,
      );
      await tester.pumpAndSettle();
      verify(
        () => mpSoaBloc.add(
          SoaEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrg: SalesOrg(''),
          ),
        ),
      ).called(1);
    });

    testWidgets(
        'MP payment when statementOfAccountEnabled is off in salesOrgConfig',
        (WidgetTester tester) async {
      await tester.pumpWidget(getWidget(isMarketPlace: true));
      await tester.pumpAndSettle();
      verifyNever(
        () => mpSoaBloc.add(
          SoaEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrg: SalesOrg(''),
          ),
        ),
      );

      verify(
        () => mpAccountSummaryBloc.add(
          AccountSummaryEvent.fetchCreditSummary(
            custCode: '',
            salesOrg: SalesOrg(''),
          ),
        ),
      ).called(1);

      verify(
        () => mpAccountSummaryBloc.add(
          AccountSummaryEvent.fetchInvoiceSummary(
            custCode: '',
            salesOrg: SalesOrg(''),
          ),
        ),
      ).called(1);

      verify(
        () => mpPaymentInProgressBloc.add(
          PaymentInProgressEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganization: SalesOrganisation.empty(),
          ),
        ),
      ).called(1);

      await tester.fling(paymentHome, const Offset(0.0, 300.0), 800.0);
      await tester.pump();
      expect(
        find.byType(RefreshProgressIndicator),
        findsOneWidget,
      );
      await tester.pumpAndSettle();
      verifyNever(
        () => mpSoaBloc.add(
          SoaEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrg: SalesOrg(''),
          ),
        ),
      );
    });
  });
}

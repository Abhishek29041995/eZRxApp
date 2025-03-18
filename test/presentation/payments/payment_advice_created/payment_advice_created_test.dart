import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_info.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/domain/payments/entities/new_payment_method.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_local.dart';
import 'package:ezrxmobile/presentation/payments/payment_advice_created/payment_advice_created_page.dart';
import 'package:ezrxmobile/application/payments/payment_summary_details/payment_summary_details_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_vn_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late AuthBloc authBlocMock;
  late AppRouter autoRouterMock;
  late SalesOrgBloc salesOrgBlocMock;
  late NewPaymentBloc newPaymentBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late NewPaymentMethod paymentMethodValueQr;
  late NewPaymentMethod paymentMethodValueBank;
  late List<CustomerOpenItem> customerOpenItemList;
  late AvailableCreditsBloc availableCreditsBlocMock;
  late OutstandingInvoicesBloc outstandingInvoicesBlocMock;
  late PaymentSummaryDetailsBloc mockPaymentSummaryDetailsBloc;
  late DownloadPaymentAttachmentsBloc downloadPaymentAttachmentsBloc;
  late ZPPaymentSummaryBloc mockPaymentSummaryBloc;

  //////////////////////Finder/////////////////////////////

  final paymentAdviceScreenLoader =
      find.byKey(WidgetKeys.paymentAdviceScreenLoader);
  final paymentAdviceScreenWaiting =
      find.byKey(WidgetKeys.paymentAdviceScreenWaiting);
  final paymentGatewayAdviceMessage =
      find.byKey(WidgetKeys.paymentGatewayAdviceMessage);
  final paymentBankInAdviceMessage =
      find.byKey(WidgetKeys.paymentBankInAdviceMessage);
  final paymentNeedOpenWebViewIcon =
      find.byKey(WidgetKeys.paymentNeedOpenWebViewIcon);
  final paymentAdvicePleaseNote =
      find.byKey(WidgetKeys.paymentAdvicePleaseNote);
  final paymentAdviceButton = find.byKey(WidgetKeys.paymentAdviceButton);
  final paymentSummaryButton = find.byKey(WidgetKeys.paymentSummaryButton);
  final paymentSavePdfButton = find.byKey(WidgetKeys.paymentSavePdfButton);
  final createAdviceSummary = find.byKey(WidgetKeys.createAdviceSummary);
  final priceText = find.byKey(WidgetKeys.priceText);
  final payButton = find.byKey(WidgetKeys.payButton);
  final paymentAdviceNextStep = find.byKey(WidgetKeys.paymentAdviceNextStep);
  final deleteCancelAdviceBottomSheet =
      find.byKey(WidgetKeys.deleteCancelAdviceBottomSheet);
  ////////////////////////////////////////////////////////

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AutoRouteMock());
    autoRouterMock = locator<AutoRouteMock>();
    locator.registerSingleton<MixpanelService>(MixpanelServiceMock());
    customerOpenItemList =
        await NewPaymentLocalDataSource().getCustomerOpenItems();
    paymentMethodValueQr = NewPaymentMethod.empty()
        .copyWith(paymentMethod: PaymentMethodValue('QR Code'));
    paymentMethodValueBank = NewPaymentMethod.empty().copyWith(
      paymentMethod: PaymentMethodValue('Bank-In'),
    );

    authBlocMock = AuthBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    newPaymentBlocMock = NewPaymentBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    availableCreditsBlocMock = AvailableCreditsBlocMock();
    outstandingInvoicesBlocMock = OutstandingInvoicesBlocMock();
    mockPaymentSummaryDetailsBloc = PaymentSummaryDetailsBlocMock();
    downloadPaymentAttachmentsBloc = DownloadPaymentAttachmentsBlocMock();
    mockPaymentSummaryBloc = ZPPaymentSummaryBlocMock();

    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    when(() => availableCreditsBlocMock.state)
        .thenReturn(AvailableCreditsState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => availableCreditsBlocMock.state)
        .thenReturn(AvailableCreditsState.initial());
    when(() => outstandingInvoicesBlocMock.state)
        .thenReturn(OutstandingInvoicesState.initial());
    when(() => mockPaymentSummaryDetailsBloc.state)
        .thenReturn(PaymentSummaryDetailsState.initial());
    when(() => outstandingInvoicesBlocMock.state)
        .thenReturn(OutstandingInvoicesState.initial());
    when(() => downloadPaymentAttachmentsBloc.state)
        .thenReturn(DownloadPaymentAttachmentsState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => newPaymentBlocMock.state).thenReturn(NewPaymentState.initial());
    when(() => newPaymentBlocMock.state).thenReturn(NewPaymentState.initial());
    when(() => mockPaymentSummaryBloc.state)
        .thenReturn(PaymentSummaryState.initial());
  });

  Widget getWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      routeName: NewPaymentPageRoute.name,
      providers: [
        BlocProvider<SalesOrgBloc>(
          create: (context) => salesOrgBlocMock,
        ),
        BlocProvider<NewPaymentBloc>(
          create: (context) => newPaymentBlocMock,
        ),
        BlocProvider<AnnouncementBloc>(
          create: (context) => announcementBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<AvailableCreditsBloc>(
          create: (context) => availableCreditsBlocMock,
        ),
        BlocProvider<OutstandingInvoicesBloc>(
          create: (context) => outstandingInvoicesBlocMock,
        ),
        BlocProvider<PaymentSummaryDetailsBloc>(
          create: (context) => mockPaymentSummaryDetailsBloc,
        ),
        BlocProvider<DownloadPaymentAttachmentsBloc>(
          create: (context) => downloadPaymentAttachmentsBloc,
        ),
        BlocProvider<AuthBloc>(create: (context) => authBlocMock),
        BlocProvider<ZPPaymentSummaryBloc>(
          create: (context) => mockPaymentSummaryBloc,
        ),
      ],
      child: const PaymentAdviceCreatedPage(
        isMarketPlace: false,
      ),
    );
  }

  group('Payment advice created page', () {
    testWidgets('Payment advice On Back button', (WidgetTester tester) async {
      when(() => newPaymentBlocMock.state).thenReturn(
        NewPaymentState.initial().copyWith(
          isFetchingInvoiceInfoPdf: false,
          salesOrganisation: fakeSGSalesOrganisation,
        ),
      );
      when(() => autoRouterMock.maybePop()).thenAnswer((invocation) async => true);
      await tester.pumpWidget(getWidget());
      await tester.pump();
      final closeButton = find.byKey(WidgetKeys.closeButton);
      expect(closeButton, findsOneWidget);
      await tester.tap(closeButton);
      await tester.pumpAndSettle();
    });

    testWidgets('Payment advice created page waiting customer API called',
        (WidgetTester tester) async {
      when(() => newPaymentBlocMock.state).thenReturn(
        NewPaymentState.initial().copyWith(
          isLoading: true,
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentAdviceScreenWaiting, findsOneWidget);
      expect(paymentAdviceScreenLoader, findsOneWidget);
    });

    testWidgets(
        'Payment advice created page waiting APL created advice API called',
        (WidgetTester tester) async {
      when(() => newPaymentBlocMock.state).thenReturn(
        NewPaymentState.initial().copyWith(
          isCreatingVirtualAccount: true,
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentAdviceScreenWaiting, findsOneWidget);
      expect(paymentAdviceScreenLoader, findsOneWidget);
    });

    testWidgets(
        'Payment advice created page waiting get payment invoice API called',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(480, 900));

      when(() => newPaymentBlocMock.state).thenReturn(
        NewPaymentState.initial().copyWith(
          isFetchingInvoiceInfoPdf: true,
          salesOrganisation: fakeSGSalesOrganisation,
          selectedPaymentMethod: paymentMethodValueQr,
          paymentInvoiceInfoPdf:
              PaymentInvoiceInfoPdf.empty().copyWith(zzAdvice: 'fake-zzadvice'),
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentAdviceScreenWaiting, findsNothing);
      expect(paymentAdviceScreenLoader, findsOneWidget);
    });

    testWidgets('Payment advice created => selected payment method valueQR',
        (WidgetTester tester) async {
      when(() => newPaymentBlocMock.state).thenReturn(
        NewPaymentState.initial().copyWith(
          selectedPaymentMethod: paymentMethodValueQr,
          salesOrganisation: fakeSGSalesOrganisation,
          paymentInfo: PaymentInfo.empty().copyWith(
            zzAdvice: 'fake-zzadvice',
          ),
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            email: EmailAddress('abcd@fake.com'),
          ),
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentGatewayAdviceMessage, findsOneWidget);
      expect(paymentNeedOpenWebViewIcon, findsOneWidget);
      final firstMsg = find.text(
        'Your payment advice #fake-zzadvice has been generated. Scan the QR code and complete payment.',
      );
      expect(firstMsg, findsOneWidget);
      final secondMsg = find.textContaining(
        'We’ll send a payment advice copy to a**d@fake.com shortly',
      );
      expect(secondMsg, findsOneWidget);
      expect(paymentAdvicePleaseNote, findsOneWidget);
      final pleaseNote = find.text(
        'Please note',
      );
      expect(pleaseNote, findsOneWidget);

      final paymentError = find.text(
        'If you encountered an error with the payment, delete the system-generated payment advice in the eZRx payment summary section and regenerate a new payment advice by repeating the payment process.',
        findRichText: true,
      );
      expect(paymentError, findsOneWidget);
      final paymentAdviceNotification = find.text(
        'Please note that system-generated payment advice(s) will be automatically deleted if payment is not received within 30 days.',
        findRichText: true,
      );
      expect(paymentAdviceNotification, findsOneWidget);

      when(
        () =>
            autoRouterMock.push(PaymentSummaryPageRoute(isMarketPlace: false)),
      ).thenAnswer((invocation) => Future(() => null));
      final finder = find.byWidgetPredicate(
        (widget) =>
            widget is RichText && tapTextSpan(widget, 'Payment summary'),
      );
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      expect(finder, findsOneWidget);
      await tester.pump(const Duration(seconds: 1));
    });

    testWidgets(
        'Payment advice created payment summary => selected payment method valueQR',
        (WidgetTester tester) async {
      when(() => newPaymentBlocMock.state).thenReturn(
        NewPaymentState.initial().copyWith(
          selectedPaymentMethod: paymentMethodValueQr,
          paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty().copyWith(
            zzAdvice: 'fake-zzadvice',
          ),
          selectedInvoices: [customerOpenItemList.first],
        ),
      );
      when(() => salesOrgBlocMock.state).thenReturn(
        SalesOrgState.initial().copyWith(
          configs: fakeVNSalesOrgConfigs,
        ),
      );
      when(
        () => autoRouterMock.push<Uri?>(const PaymentWebviewPageRoute()),
      ).thenAnswer((_) async => Uri());
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentGatewayAdviceMessage, findsOneWidget);
      expect(createAdviceSummary, findsOneWidget);
      expect(priceText, findsAtLeastNWidgets(2));
      final payableAmount = find.text(
        'Amount payable (VND)',
      );
      expect(payableAmount, findsOneWidget);
      final invoiceAmount = find.text(
        '999.00',
      );
      expect(invoiceAmount, findsOneWidget);
      final creditApplied = find.text(
        'Credit applied (VND)',
      );
      expect(creditApplied, findsOneWidget);
      final totalText = find.textContaining(
        'Total: ',
        findRichText: true,
      );
      expect(totalText, findsOneWidget);
      final totalAmount = find.textContaining(
        'VND 999.00',
        findRichText: true,
      );
      expect(totalAmount, findsOneWidget);
      expect(payButton, findsOneWidget);
      await tester.tap(payButton);
      await tester.pump(const Duration(seconds: 1));
      verify(
        () => autoRouterMock.push<Uri?>(const PaymentWebviewPageRoute()),
      ).called(1);
      await tester.pump(const Duration(seconds: 1));
    });

    testWidgets('Payment advice created payment  => next step',
        (WidgetTester tester) async {
      when(() => newPaymentBlocMock.state).thenReturn(
        NewPaymentState.initial().copyWith(
          selectedPaymentMethod: paymentMethodValueQr,
          paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty().copyWith(
            zzAdvice: 'fake-zzadvice',
          ),
        ),
      );
      when(() => salesOrgBlocMock.state).thenReturn(
        SalesOrgState.initial().copyWith(
          configs: fakeVNSalesOrgConfigs,
        ),
      );
      when(
        () => autoRouterMock.push<Uri?>(const PaymentWebviewPageRoute()),
      ).thenAnswer((_) async => Uri());
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentAdviceNextStep, findsOneWidget);
      final nextStep = find.text(
        'Next steps and notes',
      );
      expect(nextStep, findsOneWidget);
      final newBrowserTab = find.text(
        'It may take a few seconds for the payment gateway to open in a new browser tab.',
        findRichText: true,
      );
      expect(newBrowserTab, findsOneWidget);
      final clickOnTheBack = find.text(
        'Please do not click on the back button or refresh/cancel the page while the payment gateway is loading.',
        findRichText: true,
      );
      expect(clickOnTheBack, findsOneWidget);

      final downloadPaymentAdvice = find.text(
        'You may download the payment advice after the payment process or through the payment summary page.',
        findRichText: true,
      );
      expect(downloadPaymentAdvice, findsOneWidget);
      final emailAssociated = find.text(
        'The payment advice copy will be sent to the email associated with this account.',
        findRichText: true,
      );
      expect(emailAssociated, findsOneWidget);
      final deleteAdvice = find.text(
        'If there\'s any error in the selected invoice/credit notes, please delete this payment advice and generate a new payment advice.',
        findRichText: true,
      );
      expect(deleteAdvice, findsOneWidget);
      final finder = find.byWidgetPredicate(
        (widget) => widget is RichText && tapTextSpan(widget, 'delete'),
      );
      await tester.pump();
      expect(finder, findsOneWidget);
      await tester.pump(const Duration(seconds: 1));
      verify(
        () => mockPaymentSummaryDetailsBloc.add(
          PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
            details: PaymentSummaryDetails.fromPaymentInvoicePDF(
              PaymentInvoiceInfoPdf.empty().copyWith(
                zzAdvice: 'fake-zzadvice',
              ),
            ),
            isMarketPlace: false,
          ),
        ),
      ).called(1);
      await tester.pump(const Duration(seconds: 1));
      expect(deleteCancelAdviceBottomSheet, findsOneWidget);
    });

    testWidgets('Payment advice created => selected payment value bank',
        (WidgetTester tester) async {
      when(() => newPaymentBlocMock.state).thenReturn(
        NewPaymentState.initial().copyWith(
          selectedPaymentMethod: paymentMethodValueBank,
          salesOrganisation: fakeSGSalesOrganisation,
          paymentInfo: PaymentInfo.empty().copyWith(
            zzAdvice: 'fake-zzadvice',
          ),
          paymentInvoiceInfoPdf:
              PaymentInvoiceInfoPdf.empty().copyWith(zzAdvice: 'fake-zzadvice'),
        ),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            email: EmailAddress('abcd@fake.com'),
          ),
        ),
      );
      when(
        () => autoRouterMock
            .popAndPush(PaymentSummaryPageRoute(isMarketPlace: false)),
      ).thenAnswer((invocation) => Future(() => null));
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentBankInAdviceMessage, findsOneWidget);
      expect(paymentNeedOpenWebViewIcon, findsOneWidget);
      final adviceGenerated = find.text(
        'Your payment advice #fake-zzadvice has been generated.',
      );
      expect(adviceGenerated, findsOneWidget);
      final bankAccountProvided = find.textContaining(
        'Bank-in to either one of the bank accounts provided to complete the payment',
      );
      expect(bankAccountProvided, findsOneWidget);
      final paymentAdviceCopy = find.textContaining(
        'We’ll send a payment advice copy to a**d@fake.com shortly',
      );
      expect(paymentAdviceCopy, findsOneWidget);
      expect(paymentAdviceButton, findsOneWidget);
      expect(paymentSummaryButton, findsOneWidget);
      expect(paymentSavePdfButton, findsOneWidget);
      await tester.tap(paymentSummaryButton);
      await tester.pump(const Duration(seconds: 1));
      verify(
        () => autoRouterMock
            .popAndPush(PaymentSummaryPageRoute(isMarketPlace: false)),
      ).called(1);
      await tester.pump(const Duration(seconds: 1));
    });

    testWidgets(
        'Payment advice created => selected payment value bank - save pdf download success',
        (WidgetTester tester) async {
      when(() => newPaymentBlocMock.state).thenReturn(
        NewPaymentState.initial().copyWith(
          isSavingInvoicePdf: true,
          selectedPaymentMethod: paymentMethodValueBank,
          salesOrganisation: fakeSGSalesOrganisation,
          paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty().copyWith(
            zzAdvice: 'fake-zzadvice',
          ),
        ),
      );
      whenListen(
        newPaymentBlocMock,
        Stream.fromIterable([
          NewPaymentState.initial().copyWith(
            selectedPaymentMethod: paymentMethodValueBank,
            salesOrganisation: fakeSGSalesOrganisation,
            paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty().copyWith(
              zzAdvice: 'fake-zzadvice',
            ),
          ),
        ]),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            email: EmailAddress('abcd@fake.com'),
          ),
          salesOrganisation: fakeSGSalesOrganisation,
          shipToInfo: fakeShipToInfo,
        ),
      );
      when(
        () => autoRouterMock
            .popAndPush(PaymentSummaryPageRoute(isMarketPlace: false)),
      ).thenAnswer((invocation) => Future(() => null));
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentSavePdfButton, findsOneWidget);
      await tester.pump(const Duration(seconds: 1));
      await tester.tap(paymentSavePdfButton);
      await tester.pump(const Duration(seconds: 1));
      final downloadSuccessful = find.textContaining(
        'Download Successful',
      );
      expect(downloadSuccessful, findsOneWidget);
    });

    testWidgets(
        'Payment advice created => selected payment value bank - save pdf download fail',
        (WidgetTester tester) async {
      when(() => newPaymentBlocMock.state).thenReturn(
        NewPaymentState.initial().copyWith(
          isSavingInvoicePdf: true,
          selectedPaymentMethod: paymentMethodValueBank,
          salesOrganisation: fakeSGSalesOrganisation,
          paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty().copyWith(
            zzAdvice: 'fake-zzadvice',
          ),
          paymentInfo: PaymentInfo.empty().copyWith(
            createdDate: DateTimeStringValue('02/02/2024'),
            adviceExpiry: AdviceExpiryValue('fake-advice-Expiry'),
          ),
        ),
      );
      whenListen(
        newPaymentBlocMock,
        Stream.fromIterable([
          NewPaymentState.initial().copyWith(
            selectedPaymentMethod: paymentMethodValueBank,
            salesOrganisation: fakeSGSalesOrganisation,
            paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty().copyWith(
              zzAdvice: 'fake-zzadvice',
            ),
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Fake-Error'),
              ),
            ),
            paymentInfo: PaymentInfo.empty().copyWith(
              createdDate: DateTimeStringValue('02/02/2024'),
              adviceExpiry: AdviceExpiryValue('fake-advice-Expiry'),
            ),
          ),
        ]),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            email: EmailAddress('abcd@fake.com'),
          ),
          salesOrganisation: fakeSGSalesOrganisation,
          shipToInfo: fakeShipToInfo,
        ),
      );
      when(
        () => autoRouterMock
            .popAndPush(PaymentSummaryPageRoute(isMarketPlace: false)),
      ).thenAnswer((invocation) => Future(() => null));
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(paymentSavePdfButton, findsOneWidget);
      await tester.pump(const Duration(seconds: 1));
      await tester.tap(paymentSavePdfButton);
      await tester.pump(const Duration(seconds: 1));
      expect(find.byType(CustomSnackBar), findsOneWidget);
      final fakeError = find.textContaining(
        'Fake-Error',
      );
      expect(fakeError, findsOneWidget);
    });

    testWidgets(
        'Payment advice created => selected payment value bank - save pdf load fail',
        (WidgetTester tester) async {
      when(() => newPaymentBlocMock.state).thenReturn(
        NewPaymentState.initial().copyWith(
          isFetchingInvoiceInfoPdf: true,
          selectedPaymentMethod: paymentMethodValueBank,
          salesOrganisation: fakeSGSalesOrganisation,
          paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty().copyWith(
            zzAdvice: 'fake-zzadvice',
          ),
          paymentInfo: PaymentInfo.empty().copyWith(
            createdDate: DateTimeStringValue('02/02/2024'),
            adviceExpiry: AdviceExpiryValue('fake-advice-Expiry'),
          ),
        ),
      );
      whenListen(
        newPaymentBlocMock,
        Stream.fromIterable([
          NewPaymentState.initial().copyWith(
            selectedPaymentMethod: paymentMethodValueBank,
            salesOrganisation: fakeSGSalesOrganisation,
            paymentInvoiceInfoPdf: PaymentInvoiceInfoPdf.empty().copyWith(
              zzAdvice: 'fake-zzadvice',
            ),
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Fake-Error'),
              ),
            ),
            paymentInfo: PaymentInfo.empty().copyWith(
              createdDate: DateTimeStringValue('02/02/2024'),
              adviceExpiry: AdviceExpiryValue('fake-advice-Expiry'),
            ),
          ),
        ]),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            email: EmailAddress('abcd@fake.com'),
          ),
          salesOrganisation: fakeSGSalesOrganisation,
          shipToInfo: fakeShipToInfo,
        ),
      );
      when(
        () => autoRouterMock
            .popAndPush(PaymentSummaryPageRoute(isMarketPlace: false)),
      ).thenAnswer((invocation) => Future(() => null));
      await tester.pumpWidget(getWidget());
      await tester.pump();
    });

    testWidgets('Payment advice on createVirtualAccountFailed',
        (WidgetTester tester) async {
      when(() => newPaymentBlocMock.state).thenReturn(
        NewPaymentState.initial().copyWith(
          isFetchingInvoiceInfoPdf: false,
          salesOrganisation: fakeSGSalesOrganisation,
          createVirtualAccountFailed: true,
        ),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      final paymentAdviceFailed = find.byKey(WidgetKeys.paymentAdviceFailed);
      expect(paymentAdviceFailed, findsOneWidget);
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
}

bool tapTextSpan(RichText richText, String text) {
  final isTapped = !richText.text.visitChildren(
    (visitor) => findTextAndTap(visitor, text),
  );

  return isTapped;
}

bool findTextAndTap(InlineSpan visitor, String text) {
  if (visitor is TextSpan && visitor.text == text) {
    (visitor.recognizer as TapGestureRecognizer).onTap!();

    return false;
  }

  return true;
}

import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary_details/payment_summary_details_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_filter.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_local.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_item_local_datasource.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_rectangle_logo.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/payment_summary_details/payment_summary_details_screen.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late SalesOrgBloc mockSalesOrgBloc;
  late AppRouter autoRouterMock;
  late UserBloc mockUserBloc;
  late CustomerCodeBloc mockCustomerCodeBloc;
  late AnnouncementBloc mockAnnouncementBloc;
  late ZPPaymentSummaryBloc paymentSummaryBloc;
  late PaymentSummaryDetailsBloc mockPaymentSummaryDetailsBloc;
  late AuthBloc mockAuthBloc;
  late EligibilityBloc eligibilityBlocMock;
  late PaymentSummaryDetails fakePaymentDetails;
  late PaymentSummaryDetails mockPaymentDetails;
  late PaymentInvoiceInfoPdf mockPaymentInvoiceInfoPdf;
  late AutoRoutePage paymentSummaryPageMock;

  final routeData = RouteData(
    stackKey: const Key(''),
    type: const RouteType.adaptive(),
    route:  RouteMatch(
      segments: const ['payments', 'payment_summary', 'payment_summary_details'],
       config: AutoRoute(
        page: const PageInfo(PaymentSummaryDetailsPageRoute.name),
        path: '/payments/payment_summary/payment_summary_details',
      ),
      stringMatch: 'payments/payment_summary/payment_summary_details',
      key: const ValueKey('PaymentSummaryDetailsPageRoute'),
    ),
    router: AutoRouteMock(),
    pendingChildren: [],
  );

  final paymentSummaryRouteData = RouteData(
    stackKey: const Key(''),
    type: const RouteType.adaptive(),
    route: RouteMatch(
      segments: const ['payments', 'payment_summary'],
      config: AutoRoute(
        page: const PageInfo(PaymentSummaryPageRoute.name),
        path: '/payments/payment_summary',
      ),
      stringMatch: 'payments/payment_summary',
      key: const ValueKey('PaymentSummaryPageRoute'),
    ),
    router: AutoRouteMock(),
    pendingChildren: [],
  );

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => mockSalesOrgBloc);
    locator.registerLazySingleton(() => mockCustomerCodeBloc);
    mockPaymentDetails =
        await PaymentItemLocalDataSource().getPaymentSummaryDetails();
    mockPaymentInvoiceInfoPdf =
        await NewPaymentLocalDataSource().getPaymentInvoiceInfoPdf();
  });
  setUp(() async {
    mockSalesOrgBloc = SalesOrgBlocMock();
    mockUserBloc = UserBlocMock();
    autoRouterMock = AutoRouteMock();
    mockCustomerCodeBloc = CustomerCodeBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    mockAuthBloc = AuthBlocMock();
    mockAnnouncementBloc = AnnouncementBlocMock();
    paymentSummaryBloc = ZPPaymentSummaryBlocMock();
    mockPaymentSummaryDetailsBloc = PaymentSummaryDetailsBlocMock();
    fakePaymentDetails = PaymentSummaryDetails.empty()
        .copyWith(status: FilterStatus('In Progress'));
    paymentSummaryPageMock = AutoRoutePage(
      routeData: paymentSummaryRouteData,
      child: const SizedBox(),
    );
  });

  Future getWidget(tester, {bool isMarketPlace = false}) async {
    return tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => mockAuthBloc,
          ),
          BlocProvider<PaymentSummaryDetailsBloc>(
            create: (context) => mockPaymentSummaryDetailsBloc,
          ),
          BlocProvider<SalesOrgBloc>(
            create: (context) => mockSalesOrgBloc,
          ),
          BlocProvider<AnnouncementBloc>(
            create: (context) => mockAnnouncementBloc,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => mockCustomerCodeBloc,
          ),
          BlocProvider<ZPPaymentSummaryBloc>(
            create: (context) => paymentSummaryBloc,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
        ],
        child: PaymentSummaryDetailsPage(isMarketPlace: isMarketPlace),
      ),
    );
  }

  group('Payment Summary Details Page', () {
    setUp(() {
      when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
      when(() => mockUserBloc.state).thenReturn(UserState.initial());
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
      when(() => mockCustomerCodeBloc.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => mockAnnouncementBloc.state)
          .thenReturn(AnnouncementState.initial());
      when(() => paymentSummaryBloc.state)
          .thenReturn(PaymentSummaryState.initial());
      when(() => mockPaymentSummaryDetailsBloc.state)
          .thenReturn(PaymentSummaryDetailsState.initial());
      when(() => autoRouterMock.currentPath)
          .thenReturn('payments/payment_summary/payment_summary_details');
      when(() => autoRouterMock.current).thenReturn(routeData);
      when(() => autoRouterMock.stack)
          .thenReturn([MaterialPageXMock(), paymentSummaryPageMock]);
    });

    RouteDataScope getWUT({required Widget child}) {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => mockAuthBloc,
          ),
          BlocProvider<AnnouncementBloc>(
            create: (context) => mockAnnouncementBloc,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => mockCustomerCodeBloc,
          ),
          BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
          BlocProvider<UserBloc>(create: (context) => mockUserBloc),
          BlocProvider<ZPPaymentSummaryBloc>(
            create: (context) => paymentSummaryBloc,
          ),
          BlocProvider<PaymentSummaryDetailsBloc>(
            create: (context) => mockPaymentSummaryDetailsBloc,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
        ],
        child: Scaffold(
          body: child,
        ),
      );
    }

    testWidgets('Payment Summary Details Page Body Test - loading',
        (tester) async {
      when(() => mockPaymentSummaryDetailsBloc.state).thenReturn(
        PaymentSummaryDetailsState.initial().copyWith(
          isDetailFetching: true,
        ),
      );
      final expectedStates = [
        PaymentSummaryDetailsState.initial().copyWith(
          isFetchingAdvice: true,
        ),
      ];
      whenListen(
        mockPaymentSummaryDetailsBloc,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(
        getWUT(
          child: const PaymentSummaryDetailsPage(
            isMarketPlace: true,
          ),
        ),
      );
      await tester.pump();

      expect(
        find.byType(LoadingShimmer),
        findsWidgets,
      );
      await tester.pump();
      expect(
        find.byKey(WidgetKeys.paymentAdviceButtonLoading),
        findsOneWidget,
      );
    });
    testWidgets(
        'Payment Summary Details Page Body Test - find two buttons respect to the Payment Summary Details status',
        (tester) async {
      when(() => mockPaymentSummaryDetailsBloc.state).thenReturn(
        PaymentSummaryDetailsState.initial().copyWith(
          isDetailFetching: true,
          isFetchingAdvice: true,
        ),
      );
      final expectedStates = [
        PaymentSummaryDetailsState.initial().copyWith(
          isDetailFetching: false,
          isFetchingAdvice: false,
          details: PaymentSummaryDetails.empty().copyWith(
            paymentItems: [
              PaymentItem.empty().copyWith(
                documentDate: DateTimeStringValue(''),
              ),
            ],
          ),
          paymentInvoiceInfoPdf:
              PaymentInvoiceInfoPdf.empty().copyWith(paymentID: 'paymentID'),
        ),
      ];
      whenListen(
        mockPaymentSummaryDetailsBloc,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(
        getWUT(
          child: const PaymentSummaryDetailsPage(
            isMarketPlace: true,
          ),
        ),
      );
      await tester.pumpAndSettle();
      final findRow = find.byKey(WidgetKeys.buttonRowKey);
      expect(findRow, findsOneWidget);
      final downloadAdviceButton = find.byKey(
        WidgetKeys.downloadAdviceButtonKey,
      );
      expect(downloadAdviceButton, findsOneWidget);
      if (!fakePaymentDetails.status.getIsSuccessfulOrProcessed) {
        final deleteadviceButton = find.byKey(
          WidgetKeys.deleteAdviceButtonKey,
        );
        expect(deleteadviceButton, findsOneWidget);
      }
    });

    testWidgets(
        'Payment Summary Details Page - delete payment advice snackbar should not be displayed if not deleted',
        (tester) async {
      final expectedStates = [
        PaymentSummaryDetailsState.initial().copyWith(
          isDetailFetching: true,
          isFetchingAdvice: true,
          failureOrSuccessOption:
              optionOf(Left(FailureHandler.handleFailure('Fake-error'))),
        ),
        PaymentSummaryDetailsState.initial().copyWith(
          details: mockPaymentDetails,
          paymentInvoiceInfoPdf: mockPaymentInvoiceInfoPdf,
          failureOrSuccessOption: none(),
        ),
      ];
      whenListen(
        mockPaymentSummaryDetailsBloc,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(
        getWUT(
          child: const PaymentSummaryDetailsPage(
            isMarketPlace: true,
          ),
        ),
      );
      await tester.pumpAndSettle();

      verifyNever(
        () => paymentSummaryBloc.add(
          PaymentSummaryEvent.fetch(
            appliedFilter: PaymentSummaryFilter.defaultFilter(),
          ),
        ),
      );
      expect(
        find.widgetWithText(
          CustomSnackBar,
          'PA #09EZ230000544601 has been deleted',
        ),
        findsNothing,
      );
    });

    testWidgets(
        'Payment Summary Details Page - Delete payment advice and verify delete event call',
        (tester) async {
      when(() => mockPaymentSummaryDetailsBloc.state).thenReturn(
        PaymentSummaryDetailsState.initial().copyWith(
          isDetailFetching: true,
          isFetchingAdvice: true,
        ),
      );
      final expectedStates = [
        PaymentSummaryDetailsState.initial().copyWith(
          isDetailFetching: false,
          isFetchingAdvice: false,
          details: PaymentSummaryDetails.empty().copyWith(
            paymentItems: [
              PaymentItem.empty().copyWith(
                documentDate: DateTimeStringValue(''),
              ),
            ],
          ),
          paymentInvoiceInfoPdf:
              PaymentInvoiceInfoPdf.empty().copyWith(paymentID: 'paymentID'),
        ),
      ];

      whenListen(
        mockPaymentSummaryDetailsBloc,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(
        getWUT(
          child: const PaymentSummaryDetailsPage(
            isMarketPlace: true,
          ),
        ),
      );
      await tester.pumpAndSettle();
      final deleteAdviceButton = find.byKey(
        WidgetKeys.deleteAdviceButtonKey,
      );
      final deleteAdviceBottomSheetFinder = find.byKey(
        WidgetKeys.deleteCancelAdviceBottomSheet,
      );
      final deleteButtonFinder = find.byKey(
        WidgetKeys.deleteCancelAdviceBottomSheetButton,
      );
      expect(deleteAdviceButton, findsOneWidget);
      await tester.tap(deleteAdviceButton);
      await tester.pumpAndSettle();
      expect(deleteAdviceBottomSheetFinder, findsOneWidget);
      expect(deleteButtonFinder, findsOneWidget);
      await tester.tap(deleteButtonFinder);
      await tester.pump();
      verify(
        () => mockPaymentSummaryDetailsBloc.add(
          const PaymentSummaryDetailsEvent.deleteAdvice(isMarketPlace: true),
        ),
      ).called(1);
    });

    testWidgets(
        'Payment Summary Details Page - Delete payment advice success from Payment Summary Page',
        (tester) async {
      when(
        () =>
            autoRouterMock.popUntilRouteWithName(PaymentSummaryPageRoute.name),
      ).thenAnswer((invocation) => Future(() => null));

      final expectedStates = [
        PaymentSummaryDetailsState.initial().copyWith(
          isDeletingPayment: true,
        ),
        PaymentSummaryDetailsState.initial().copyWith(
          details: mockPaymentDetails,
          isDeletingPayment: false,
        ),
      ];

      whenListen(
        mockPaymentSummaryDetailsBloc,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(
        getWUT(
          child: DeleteCancelAdviceBottomSheet.delete(
            paymentAdviceNumber: '09EZ230000544601',
            isMarketPlace: false,
          ),
        ),
      );
      await tester.pumpAndSettle();
      verify(
        () => paymentSummaryBloc.add(
          PaymentSummaryEvent.fetch(
            appliedFilter: PaymentSummaryFilter.defaultFilter(),
          ),
        ),
      );

      verify(
        () =>
            autoRouterMock.popUntilRouteWithName(PaymentSummaryPageRoute.name),
      ).called(1);
      expect(
        find.widgetWithText(
          CustomSnackBar,
          'PA #09EZ230000544601 has been deleted',
        ),
        findsOneWidget,
      );
    });

    testWidgets('Payment Summary Details Page - Delete payment advice fail',
        (tester) async {
      final expectedStates = [
        PaymentSummaryDetailsState.initial().copyWith(
          isDeletingPayment: true,
        ),
        PaymentSummaryDetailsState.initial().copyWith(
          details: mockPaymentDetails,
          isDeletingPayment: false,
          failureOrSuccessOption:
              optionOf(Left(FailureHandler.handleFailure('Fake-error'))),
        ),
      ];

      whenListen(
        mockPaymentSummaryDetailsBloc,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(
        getWUT(
          child: DeleteCancelAdviceBottomSheet.delete(
            paymentAdviceNumber: '09EZ230000544601',
            isMarketPlace: false,
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(
        find.widgetWithText(
          CustomSnackBar,
          'Fake-error',
        ),
        findsOneWidget,
      );
    });

    testWidgets(
        'Payment Summary Details Page - Cancel payment advice and verify cancel event call',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeIDSalesOrganisation,
        ),
      );
      when(
        () => autoRouterMock.maybePop(),
      ).thenAnswer((invocation) async => false);
      when(() => mockPaymentSummaryDetailsBloc.state).thenReturn(
        PaymentSummaryDetailsState.initial().copyWith(
          isDetailFetching: true,
          isFetchingAdvice: true,
        ),
      );
      final expectedStates = PaymentSummaryDetailsState.initial().copyWith(
        isDetailFetching: false,
        isFetchingAdvice: false,
        details: PaymentSummaryDetails.empty().copyWith(
          paymentItems: [
            PaymentItem.empty().copyWith(
              documentDate: DateTimeStringValue(''),
            ),
          ],
        ),
        paymentInvoiceInfoPdf:
            PaymentInvoiceInfoPdf.empty().copyWith(paymentID: 'paymentID'),
      );

      when(
        () => mockPaymentSummaryDetailsBloc.state,
      ).thenReturn(expectedStates);

      await tester.pumpWidget(
        getWUT(
          child: const PaymentSummaryDetailsPage(
            isMarketPlace: true,
          ),
        ),
      );
      await tester.pumpAndSettle();
      final cancelAdviceButton = find.byKey(
        WidgetKeys.cancelAdviceButtonKey,
      );
      final deleteAdviceBottomSheetFinder = find.byKey(
        WidgetKeys.deleteCancelAdviceBottomSheet,
      );
      final deleteCancelAdviceBottomSheetButtonFinder = find.byKey(
        WidgetKeys.deleteCancelAdviceBottomSheetButton,
      );
      expect(cancelAdviceButton, findsOneWidget);
      await tester.tap(cancelAdviceButton);
      await tester.pumpAndSettle();
      expect(deleteAdviceBottomSheetFinder, findsOneWidget);
      expect(deleteCancelAdviceBottomSheetButtonFinder, findsOneWidget);
      await tester.tap(deleteCancelAdviceBottomSheetButtonFinder);
      await tester.pump();
      verify(
        () => mockPaymentSummaryDetailsBloc.add(
          const PaymentSummaryDetailsEvent.cancelAdvice(),
        ),
      ).called(1);
    });

    testWidgets('Payment Summary Details Page - Cancel payment advice success',
        (tester) async {
      final initialState = PaymentSummaryDetailsState.initial().copyWith(
        details: PaymentSummaryDetails.empty().copyWith(
          paymentItems: [
            PaymentItem.empty().copyWith(
              documentDate: DateTimeStringValue(''),
            ),
          ],
        ),
        paymentInvoiceInfoPdf:
            PaymentInvoiceInfoPdf.empty().copyWith(paymentID: 'paymentID'),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeIDSalesOrganisation,
        ),
      );

      when(() => mockPaymentSummaryDetailsBloc.state).thenReturn(
        initialState.copyWith(
          details: mockPaymentDetails,
          failureOrSuccessOption: optionOf(const Right('')),
        ),
      );
      final expectedStates = [
        initialState.copyWith(
          isCancelingAdvice: true,
        ),
        initialState.copyWith(
          details: mockPaymentDetails,
        ),
      ];

      whenListen(
        mockPaymentSummaryDetailsBloc,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(
        getWUT(
          child: const PaymentSummaryDetailsPage(
            isMarketPlace: false,
          ),
        ),
      );
      await tester.pump();

      verify(
        () => mockPaymentSummaryDetailsBloc.add(
          PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
            details: mockPaymentDetails,
            isMarketPlace: false,
          ),
        ),
      );

      verify(
        () => paymentSummaryBloc.add(
          PaymentSummaryEvent.fetch(
            appliedFilter: PaymentSummaryFilter.defaultFilter(),
          ),
        ),
      ).called(1);
    });

    testWidgets('Payment Summary Details Page - Cancel payment advice fail',
        (tester) async {
      final initialState = PaymentSummaryDetailsState.initial().copyWith(
        details: PaymentSummaryDetails.empty().copyWith(
          paymentItems: [
            PaymentItem.empty().copyWith(
              documentDate: DateTimeStringValue(''),
            ),
          ],
        ),
        paymentInvoiceInfoPdf:
            PaymentInvoiceInfoPdf.empty().copyWith(paymentID: 'paymentID'),
      );
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeIDSalesOrganisation,
        ),
      );

      when(() => mockPaymentSummaryDetailsBloc.state).thenReturn(
        initialState.copyWith(
          details: mockPaymentDetails,
          failureOrSuccessOption:
              optionOf(Left(FailureHandler.handleFailure('Fake-error'))),
        ),
      );
      final expectedStates = [
        initialState,
        initialState.copyWith(
          details: mockPaymentDetails,
          failureOrSuccessOption:
              optionOf(Left(FailureHandler.handleFailure('Fake-error'))),
        ),
      ];

      whenListen(
        mockPaymentSummaryDetailsBloc,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(
        getWUT(
          child: const PaymentSummaryDetailsPage(
            isMarketPlace: true,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.widgetWithText(
          CustomSnackBar,
          'Fake-error',
        ),
        findsOneWidget,
      );
    });

    testWidgets(
        'Payment Summary Details Page - Check Advice expiry for in progress',
        (tester) async {
      when(() => mockPaymentSummaryDetailsBloc.state).thenReturn(
        PaymentSummaryDetailsState.initial().copyWith(
          details: mockPaymentDetails,
        ),
      );

      await tester.pumpWidget(
        getWUT(
          child: const PaymentSummaryDetailsPage(
            isMarketPlace: true,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Expires in 23 day(s)'), findsOneWidget);
    });

    testWidgets(
        'Payment Summary Details Page - Check Advice expiry for Successful',
        (tester) async {
      when(() => mockPaymentSummaryDetailsBloc.state).thenReturn(
        PaymentSummaryDetailsState.initial().copyWith(
          details: mockPaymentDetails.copyWith(
            status: FilterStatus('Successful'),
          ),
        ),
      );

      await tester.pumpWidget(
        getWUT(
          child: const PaymentSummaryDetailsPage(
            isMarketPlace: true,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('in 23 Day(s)'), findsNothing);
    });

    testWidgets(
        'Payment Summary Details Page - find PA created date NA if Empty for Successful',
        (tester) async {
      when(() => mockPaymentSummaryDetailsBloc.state).thenReturn(
        PaymentSummaryDetailsState.initial().copyWith(
          details: mockPaymentDetails.copyWith(
            status: FilterStatus('Successful'),
            createdDate: DateTimeStringValue(''),
          ),
        ),
      );

      await tester.pumpWidget(
        getWUT(
          child: const PaymentSummaryDetailsPage(
            isMarketPlace: true,
          ),
        ),
      );
      await tester.pumpAndSettle();
      final paCreatedDateFinder = find.byKey(
        WidgetKeys.balanceTextRow(
          'PA created date',
          'NA',
        ),
      );

      expect(paCreatedDateFinder, findsOneWidget);
    });

    testWidgets(
        'Payment Summary Details Page - find Payment date NA if Empty for Successful',
        (tester) async {
      when(() => mockPaymentSummaryDetailsBloc.state).thenReturn(
        PaymentSummaryDetailsState.initial().copyWith(
          details: mockPaymentDetails.copyWith(
            paymentDate: DateTimeStringValue(''),
          ),
        ),
      );

      await tester.pumpWidget(
        getWUT(
          child: const PaymentSummaryDetailsPage(
            isMarketPlace: true,
          ),
        ),
      );
      await tester.pumpAndSettle();
      final paCreatedDateFinder = find.byKey(
        WidgetKeys.balanceTextRow(
          'Payment date',
          'NA',
        ),
      );

      expect(paCreatedDateFinder, findsOneWidget);
    });

    testWidgets(
      'Show date text from value date field for ID market on successful items',
      (tester) async {
        final paymentDate = DateTimeStringValue('2024-01-11');

        when(() => mockPaymentSummaryDetailsBloc.state).thenReturn(
          PaymentSummaryDetailsState.initial().copyWith(
            salesOrganization: fakeMYSalesOrganisation,
            details: PaymentSummaryDetails.empty().copyWith(
              paymentDate: paymentDate,
              status: FilterStatus('Successful'),
            ),
          ),
        );
        await tester.pumpWidget(
          getWUT(
            child: const PaymentSummaryDetailsPage(
              isMarketPlace: true,
            ),
          ),
        );
        await tester.pumpAndSettle();
        final paymentDateFinder = find.byKey(
          WidgetKeys.balanceTextRow('Payment date', paymentDate.dateOrNaString),
        );
        expect(paymentDateFinder, findsOneWidget);
      },
    );

    testWidgets(
        'Check delete payment advice content when status is in progress',
        (tester) async {
      when(() => mockPaymentSummaryDetailsBloc.state).thenReturn(
        PaymentSummaryDetailsState.initial().copyWith(
          details: PaymentSummaryDetails.empty().copyWith(
            status: FilterStatus('processing'),
            zzAdvice: StringValue('fake_id'),
          ),
        ),
      );
      await tester.pumpWidget(
        getWUT(
          child: const PaymentSummaryDetailsPage(
            isMarketPlace: true,
          ),
        ),
      );
      await tester.pump();
      final deleteButton = find.byKey(WidgetKeys.deleteAdviceButtonKey);
      expect(deleteButton, findsOneWidget);
      await tester.tap(deleteButton);
      await tester.pumpAndSettle();
      expect(find.text('${'Delete payment advice'.tr()}?'), findsOneWidget);
      expect(
        find.text(
          'Payment advice #{adviceNumber} is still in progress.'.tr(
            namedArgs: {
              'adviceNumber': 'fake_id',
            },
          ),
        ),
        findsOneWidget,
      );
      expect(
        find.text(
          'Deletion is not recommended as it may result in duplicate payments for the same invoices.',
        ),
        findsOneWidget,
      );
      expect(
        find.text(
          '${'You may proceed if you are certain that your payment has not been processed.'.tr()} ${'Once deleted, payment advice cannot be recovered. You will be required to create a new payment advice to complete payment.'.tr()}',
        ),
        findsOneWidget,
      );
    });

    testWidgets('Test open payment advice button', (tester) async {
      when(() => mockPaymentSummaryDetailsBloc.state).thenReturn(
        PaymentSummaryDetailsState.initial().copyWith(
          savedAdvice: AttachmentFileBuffer.empty().copyWith(name: 'fake-name'),
        ),
      );
      await tester.pumpWidget(
        getWUT(
          child: const PaymentSummaryDetailsPage(
            isMarketPlace: false,
          ),
        ),
      );
      await tester.pump();
      final openAdviceButton = find.byKey(WidgetKeys.downloadAdviceButtonKey);
      final openAdviceText = find.text('Open advice');
      expect(openAdviceText, findsOneWidget);
      await tester.tap(openAdviceButton);
      verify(
        () => mockPaymentSummaryDetailsBloc
            .add(const PaymentSummaryDetailsEvent.viewSavedAdvice()),
      ).called(1);
      await tester.pump();
    });

    testWidgets('Check delete payment advice content when status is failed',
        (tester) async {
      when(() => mockPaymentSummaryDetailsBloc.state).thenReturn(
        PaymentSummaryDetailsState.initial().copyWith(
          details: PaymentSummaryDetails.empty().copyWith(
            status: FilterStatus('Failed'),
            zzAdvice: StringValue('fake_id'),
          ),
        ),
      );
      await tester.pumpWidget(
        getWUT(
          child: const PaymentSummaryDetailsPage(
            isMarketPlace: true,
          ),
        ),
      );
      await tester.pump();
      final deleteButton = find.byKey(WidgetKeys.deleteAdviceButtonKey);
      expect(deleteButton, findsOneWidget);
      await tester.tap(deleteButton);
      await tester.pumpAndSettle();
      expect(find.text('${'Delete payment advice'.tr()}?'), findsOneWidget);

      expect(
        find.text(
          'Payment advice #fake_id will be permanently deleted once you proceed. Please create a new payment advice for these invoices to complete the payment.',
        ),
        findsOneWidget,
      );
    });

    testWidgets(' -> Find marketplace logo', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial()
            .copyWith(salesOrgConfigs: fakeMYSalesOrgConfigs),
      );
      when(() => mockPaymentSummaryDetailsBloc.state).thenReturn(
        PaymentSummaryDetailsState.initial(),
      );
      await getWidget(tester, isMarketPlace: true);
      final mpLogo = find.byType(MarketPlaceRectangleLogo);
      await tester.pump();
      expect(mpLogo, findsOne);
    });
  });
}

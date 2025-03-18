import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_filter/soa_filter_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/payments/entities/soa.dart';
import 'package:ezrxmobile/domain/payments/entities/soa_filter.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/soa_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_logo.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/statement_accounts/statement_accounts.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late SalesOrgBloc mockSalesOrgBloc;
  late AppRouter autoRouterMock;
  late UserBloc mockUserBloc;
  late ZPPaymentSummaryBloc paymentSummaryBlocMock;
  late CustomerCodeBloc mockCustomerCodeBloc;
  late EligibilityBloc mockEligibilityBloc;
  late AnnouncementBloc mockAnnouncementBloc;
  late DownloadPaymentAttachmentsBloc mockDownloadPaymentAttachmentsBloc;
  late OutstandingInvoicesBloc mockOutstandingInvoicesBloc;
  late AvailableCreditsBloc mockAvailableCreditsBloc;
  late NewPaymentBloc mockNewPaymentBloc;
  late ZPSoaBloc mockSoaBloc;
  late MPSoaBloc mpMockSoaBloc;
  late SoaFilterBloc mockSoaFilterBloc;
  late AuthBloc mockAuthBloc;
  late List<Soa> fakeSoaList;
  final salesOrg = SalesOrg('2001');
  final applyFilter = SoaFilter.empty().copyWith(
    fromDate: DateTimeStringValue('20230615'),
    toDate: DateTimeStringValue('20231105'),
  );

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => mockSalesOrgBloc);
    locator.registerLazySingleton(() => mockCustomerCodeBloc);
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
    fakeSoaList = await SoaLocalDataSource().getSoa();
  });

  setUp(() async {
    mockSalesOrgBloc = SalesOrgBlocMock();
    mockUserBloc = UserBlocMock();
    paymentSummaryBlocMock = ZPPaymentSummaryBlocMock();
    autoRouterMock = locator<AppRouter>();
    mockCustomerCodeBloc = CustomerCodeBlocMock();
    mockEligibilityBloc = EligibilityBlocMock();
    mockAuthBloc = AuthBlocMock();
    mockAnnouncementBloc = AnnouncementBlocMock();
    mockSoaBloc = ZPSoaBlocMock();
    mockSoaFilterBloc = SoaFilterBlocMock();
    mockDownloadPaymentAttachmentsBloc = DownloadPaymentAttachmentsBlocMock();
    mockAvailableCreditsBloc = AvailableCreditsBlocMock();
    mockOutstandingInvoicesBloc = OutstandingInvoicesBlocMock();
    mockNewPaymentBloc = NewPaymentBlocMock();
    mpMockSoaBloc = MPSoaBlocMock();

    when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
    when(() => mockUserBloc.state).thenReturn(UserState.initial());
    when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
    when(() => mockCustomerCodeBloc.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => mockEligibilityBloc.state)
        .thenReturn(EligibilityState.initial());
    when(() => mockAnnouncementBloc.state)
        .thenReturn(AnnouncementState.initial());
    when(() => mockSoaBloc.state).thenReturn(SoaState.initial());
    when(() => mpMockSoaBloc.state).thenReturn(SoaState.initial());
    when(() => mockSoaFilterBloc.state).thenReturn(SoaFilterState.initial());
    when(() => mockDownloadPaymentAttachmentsBloc.state)
        .thenReturn(DownloadPaymentAttachmentsState.initial());
    when(() => mockAvailableCreditsBloc.state)
        .thenReturn(AvailableCreditsState.initial());
    when(() => mockOutstandingInvoicesBloc.state)
        .thenReturn(OutstandingInvoicesState.initial());
    when(() => mockNewPaymentBloc.state).thenReturn(NewPaymentState.initial());
  });

  group('Statement of accounts Page', () {
    RouteDataScope getWUT({bool isMarketPlace = false}) {
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
          BlocProvider<EligibilityBloc>(
            create: (context) => mockEligibilityBloc,
          ),
          BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
          BlocProvider<UserBloc>(create: (context) => mockUserBloc),
          BlocProvider<ZPSoaBloc>(create: (context) => mockSoaBloc),
          BlocProvider<MPSoaBloc>(create: (context) => mpMockSoaBloc),
          BlocProvider<SoaFilterBloc>(
            create: (context) => mockSoaFilterBloc,
          ),
          BlocProvider<DownloadPaymentAttachmentsBloc>(
            create: (context) => mockDownloadPaymentAttachmentsBloc,
          ),
          BlocProvider<AvailableCreditsBloc>(
            create: (context) => mockAvailableCreditsBloc,
          ),
          BlocProvider<OutstandingInvoicesBloc>(
            create: (context) => mockOutstandingInvoicesBloc,
          ),
          BlocProvider<NewPaymentBloc>(
            create: (context) => mockNewPaymentBloc,
          ),
          BlocProvider<ZPPaymentSummaryBloc>(
            create: (context) => paymentSummaryBlocMock,
          ),
        ],
        child: StatementAccountsPage(isMarketPlace: isMarketPlace),
      );
    }

    testWidgets('Body Test - loading', (tester) async {
      when(() => mockSoaBloc.state).thenReturn(
        SoaState.initial().copyWith(
          isFetching: true,
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byKey(WidgetKeys.loaderImage),
        findsOneWidget,
      );
    });
    testWidgets('Body Test - Error', (tester) async {
      when(() => mockSoaBloc.state).thenReturn(
        SoaState.initial().copyWith(
          isFetching: true,
        ),
      );
      final expectedStates = [
        SoaState.initial().copyWith(
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Fake-Error'))),
        ),
      ];
      whenListen(
        mockSoaBloc,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();

      expect(
        find.byKey(WidgetKeys.customSnackBar),
        findsOneWidget,
      );
    });
    testWidgets('Body Test - Load with data', (tester) async {
      when(() => mockSoaBloc.state).thenReturn(
        SoaState.initial().copyWith(
          isFetching: true,
          soaList: [],
        ),
      );
      final expectedStates = [
        SoaState.initial().copyWith(
          soaList: fakeSoaList,
          appliedFilter: applyFilter,
        ),
      ];
      whenListen(
        mockSoaBloc,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();

      expect(
        find.descendant(
          of: find.byType(AppBar),
          matching: find.text('Statement of accounts'),
        ),
        findsOne,
      );
      final findSoaItem = find.byKey(WidgetKeys.genericKey(key: 'SoaItem#0'));
      expect(findSoaItem, findsOneWidget);
      expect(
        find.descendant(
          of: findSoaItem,
          matching: find.byType(MarketPlaceLogo),
        ),
        findsNothing,
      );
    });

    testWidgets('Body Test - Header Test', (tester) async {
      when(() => mockSoaBloc.state).thenReturn(
        SoaState.initial().copyWith(
          soaList: fakeSoaList,
          appliedFilter: applyFilter,
        ),
      );
      final expectedStates = [
        EligibilityState.initial()
            .copyWith(customerCodeInfo: CustomerCodeInfo.empty()),
        EligibilityState.initial().copyWith(
          customerCodeInfo: CustomerCodeInfo.empty()
              .copyWith(customerCodeSoldTo: '0030082707'),
        ),
      ];
      whenListen(
        mockEligibilityBloc,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      expect(find.byKey(WidgetKeys.soaHeaderCustomerCodeKey), findsOneWidget);
    });

    testWidgets(
        'Statement of accounts Page Body Test - Download Button Pressed when Download In Progress',
        (tester) async {
      when(() => mockSoaBloc.state).thenReturn(
        SoaState.initial().copyWith(
          soaList: fakeSoaList,
          appliedFilter: applyFilter,
        ),
      );
      final expectedStatesForDownloadPaymentAttachments = [
        DownloadPaymentAttachmentsState.initial().copyWith(
          isDownloadInProgress: true,
        ),
        DownloadPaymentAttachmentsState.initial(),
      ];
      whenListen(
        mockDownloadPaymentAttachmentsBloc,
        Stream.fromIterable(expectedStatesForDownloadPaymentAttachments),
      );

      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      final findSoaItem = find.byKey(WidgetKeys.genericKey(key: 'SoaItem#0'));
      expect(findSoaItem, findsOneWidget);
      final downloadButtonKey = find.byKey(
        WidgetKeys.genericKey(
          key:
              'soaDownloadButton#${fakeSoaList.first.soaData.simpleDateString}',
        ),
      );
      expect(downloadButtonKey, findsOneWidget);
      await tester.tap(downloadButtonKey);
    });

    testWidgets(
        'Statement of accounts Page Body Test - Find LoadingAnimationWidget ',
        (tester) async {
      when(() => mockSoaBloc.state).thenReturn(
        SoaState.initial().copyWith(
          soaList: fakeSoaList,
          appliedFilter: applyFilter,
        ),
      );
      when(() => mockDownloadPaymentAttachmentsBloc.state).thenReturn(
        DownloadPaymentAttachmentsState.initial().copyWith(
          isDownloadInProgress: true,
          fileUrl: const DownloadPaymentAttachment(
            url:
                'ezrx_prod/uploads/MY_QA/20010030082707_0723_20230705_155346.pdf',
          ),
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump(const Duration(seconds: 2));
      final findSoaItem = find.byKey(WidgetKeys.genericKey(key: 'SoaItem#0'));
      expect(findSoaItem, findsOneWidget);
      final soaLoadingAnimationWidgetKey = find.byKey(
        WidgetKeys.soaLoadingAnimationWidgetKey,
      );
      expect(soaLoadingAnimationWidgetKey, findsOneWidget);
    });

    testWidgets('Body Test - onRefresh', (tester) async {
      when(() => mockSoaBloc.state).thenReturn(
        SoaState.initial().copyWith(
          soaList: <Soa>[],
        ),
      );
      final handle = tester.ensureSemantics();
      await tester.pumpWidget(getWUT());

      await tester.pump(const Duration(milliseconds: 100));
      final soaNotFoundRecordKey = find.byKey(WidgetKeys.soaNotFoundRecordKey);
      await tester.drag(
        soaNotFoundRecordKey,
        const Offset(0.0, 1000.0),
        warnIfMissed: false,
      );
      await tester.pump(const Duration(seconds: 1));
      expect(
        tester.getSemantics(find.byType(RefreshProgressIndicator)),
        matchesSemantics(
          label: 'Refresh',
        ),
      );
      await tester.pumpAndSettle();

      verify(
        () => mockSoaBloc.add(
          SoaEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrg: SalesOrg(''),
          ),
        ),
      ).called(1);
      handle.dispose();
    });

    testWidgets('New payment Button', (tester) async {
      when(() => mockSoaBloc.state).thenReturn(
        SoaState.initial().copyWith(),
      );
      when(
        () => mockSalesOrgBloc.state,
      ).thenReturn(
        SalesOrgState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
        ),
      );
      when(
        () => mockEligibilityBloc.state,
      ).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerCodeSoldTo: 'mock-customerCodeSoldTo',
          ),
        ),
      );

      await tester.pumpWidget(getWUT());
      await tester.pump();

      final paymentButton = find.byKey(WidgetKeys.newPaymentButton);
      expect(
        paymentButton,
        findsOneWidget,
      );
      await tester.tap(paymentButton);
      await tester.pumpAndSettle();
      verify(
        () => mockNewPaymentBloc.add(
          NewPaymentEvent.initialized(
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              customerCodeSoldTo: 'mock-customerCodeSoldTo',
            ),
            shipToInfo: ShipToInfo.empty(),
            user: User.empty(),
            isMarketPlace: false,
          ),
        ),
      ).called(1);
    });

    testWidgets('New payment Button disable', (tester) async {
      whenListen(
        mockNewPaymentBloc,
        Stream.fromIterable([
          NewPaymentState.initial().copyWith(isFetchingPrincipalCutoffs: true),
        ]),
      );

      await tester.pumpWidget(getWUT());
      await tester.pump();

      final paymentButton = find.byKey(WidgetKeys.newPaymentButton);
      expect(
        paymentButton,
        findsOneWidget,
      );
      await tester.tap(paymentButton);
      await tester.pumpAndSettle();
      verifyNever(
        () => mockNewPaymentBloc.add(
          NewPaymentEvent.initialized(
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: salesOrg,
            ),
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              customerCodeSoldTo: 'mock-customerCodeSoldTo',
            ),
            shipToInfo: ShipToInfo.empty(),
            user: User.empty(),
            isMarketPlace: false,
          ),
        ),
      );
    });

    testWidgets('New payment Button show failed bottom sheet', (tester) async {
      await tester.binding.setSurfaceSize(const Size(480, 900));
      when(() => paymentSummaryBlocMock.state).thenReturn(
        PaymentSummaryState.initial().copyWith(
          details: [
            PaymentSummaryDetails.empty().copyWith(
              status: FilterStatus('In Progress'),
            ),
          ],
        ),
      );

      when(
        () => mockEligibilityBloc.state,
      ).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: fakeIDSalesOrgConfigs.salesOrg,
          ),
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerCodeSoldTo: 'mock-customerCodeSoldTo',
          ),
        ),
      );

      await tester.pumpWidget(getWUT());
      await tester.pump();

      final paymentButton = find.byKey(WidgetKeys.newPaymentButton);
      expect(
        paymentButton,
        findsOneWidget,
      );
      await tester.tap(paymentButton);
      await tester.pumpAndSettle();

      final confirmBottomSheet = find.byKey(WidgetKeys.confirmBottomSheet);
      expect(
        confirmBottomSheet,
        findsOneWidget,
      );
    });

    testWidgets('New payment Button success', (tester) async {
      when(() => paymentSummaryBlocMock.state).thenReturn(
        PaymentSummaryState.initial().copyWith(
          details: [
            PaymentSummaryDetails.empty().copyWith(
              status: FilterStatus('Pending'),
            ),
          ],
        ),
      );

      when(
        () => mockEligibilityBloc.state,
      ).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: fakeIDSalesOrgConfigs.salesOrg,
          ),
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerCodeSoldTo: 'mock-customerCodeSoldTo',
          ),
        ),
      );

      await tester.pumpWidget(getWUT());
      await tester.pump();

      final paymentButton = find.byKey(WidgetKeys.newPaymentButton);
      expect(
        paymentButton,
        findsOneWidget,
      );
      await tester.tap(paymentButton);
      await tester.pumpAndSettle();

      final confirmBottomSheet = find.byKey(WidgetKeys.confirmBottomSheet);
      expect(
        confirmBottomSheet,
        findsNothing,
      );

      verify(
        () => mockNewPaymentBloc.add(
          NewPaymentEvent.initialized(
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: fakeIDSalesOrgConfigs.salesOrg,
            ),
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              customerCodeSoldTo: 'mock-customerCodeSoldTo',
            ),
            shipToInfo: ShipToInfo.empty(),
            user: User.empty(),
            isMarketPlace: false,
          ),
        ),
      ).called(1);

      verify(
        () => mockNewPaymentBloc.add(
          const NewPaymentEvent.getPrincipalCutoffs(),
        ),
      ).called(1);
    });

    group('Filter test-', () {
      testWidgets('Test filter section when data is empty ', (tester) async {
        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle();

        final filterIcon = find.byIcon(Icons.tune_outlined);
        expect(
          filterIcon,
          findsNothing,
        );
        final soaFilterbottomSheetFinder = find.byKey(
          WidgetKeys.soaSearchResultsKey,
        );
        expect(
          soaFilterbottomSheetFinder,
          findsNothing,
        );
        expect(find.byKey(WidgetKeys.soaFilterResultCount), findsNothing);
      });

      testWidgets('Filter result count not visible when none filter applied',
          (tester) async {
        when(() => mockSoaBloc.state).thenReturn(
          SoaState.initial().copyWith(soaList: fakeSoaList),
        );
        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.soaFilterButton),
            matching: find.text('0'),
          ),
          findsOne,
        );
        expect(find.byKey(WidgetKeys.soaFilterResultCount), findsNothing);
      });

      testWidgets('Show Filter result count hide when filter is applied',
          (tester) async {
        when(() => mockSoaBloc.state).thenReturn(
          SoaState.initial()
              .copyWith(soaList: fakeSoaList, appliedFilter: applyFilter),
        );
        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.soaFilterButton),
            matching: find.text('1'),
          ),
          findsOne,
        );
        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.soaFilterResultCount),
            matching: find.text('4'),
          ),
          findsOne,
        );
      });

      testWidgets('bottomSheet ', (tester) async {
        final expectedStates = [
          SoaState.initial().copyWith(
            isFetching: true,
          ),
          SoaState.initial().copyWith(
            appliedFilter: applyFilter,
            soaList: fakeSoaList,
          ),
        ];
        whenListen(
          mockSoaBloc,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle();

        final filterIcon = find.byIcon(Icons.tune_outlined);
        expect(
          filterIcon,
          findsOneWidget,
        );
        await tester.tap(filterIcon);
        await tester.pumpAndSettle();
        final soaFilterBottomSheetFinder =
            find.byKey(WidgetKeys.soaFilterBottomSheetKey);
        expect(
          soaFilterBottomSheetFinder,
          findsOneWidget,
        );
        final closeButtonFinder = find.byKey(WidgetKeys.closeButton);
        expect(closeButtonFinder, findsOneWidget);
        await tester.tap(closeButtonFinder);
        await tester.pumpAndSettle();
        expect(
          soaFilterBottomSheetFinder,
          findsNothing,
        );
      });

      testWidgets('bottomSheet Apply button', (tester) async {
        final expectedStates = [
          SoaState.initial().copyWith(
            isFetching: true,
          ),
          SoaState.initial().copyWith(
            appliedFilter: applyFilter,
            soaList: fakeSoaList,
          ),
        ];
        whenListen(
          mockSoaBloc,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle();

        final filterIcon = find.byIcon(Icons.tune_outlined);
        expect(
          filterIcon,
          findsOneWidget,
        );
        await tester.tap(filterIcon);
        await tester.pumpAndSettle();
        final soaFilterBottomSheetFinder =
            find.byKey(WidgetKeys.soaFilterBottomSheetKey);
        expect(
          soaFilterBottomSheetFinder,
          findsOneWidget,
        );

        final applyButtonKey = find.byKey(
          WidgetKeys.soaFilterApplyButtonKey,
        );
        expect(applyButtonKey, findsOneWidget);
        await tester.tap(applyButtonKey);
        await tester.pumpAndSettle();
        expect(
          soaFilterBottomSheetFinder,
          findsNothing,
        );
      });

      testWidgets('bottomSheet Reset button', (tester) async {
        final expectedStates = [
          SoaState.initial().copyWith(
            isFetching: true,
          ),
          SoaState.initial().copyWith(
            appliedFilter: applyFilter,
            soaList: fakeSoaList,
          ),
        ];
        whenListen(
          mockSoaBloc,
          Stream.fromIterable(expectedStates),
        );
        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle();

        final filterIcon = find.byIcon(Icons.tune_outlined);
        expect(
          filterIcon,
          findsOneWidget,
        );
        await tester.tap(filterIcon);
        await tester.pumpAndSettle();
        final soaFilterBottomSheetFinder =
            find.byKey(WidgetKeys.soaFilterBottomSheetKey);
        expect(
          soaFilterBottomSheetFinder,
          findsOneWidget,
        );
        await tester.pumpAndSettle();
        final resetButtonKey = find.byKey(
          WidgetKeys.soaFilterResetButtonKey,
        );
        expect(resetButtonKey, findsOneWidget);
        await tester.tap(resetButtonKey);
        await tester.pumpAndSettle();
        expect(
          soaFilterBottomSheetFinder,
          findsNothing,
        );
      });

      testWidgets('bottomSheet - FormDataField', (tester) async {
        when(() => mockSoaFilterBloc.state).thenReturn(
          SoaFilterState.initial().copyWith(
            filter: applyFilter,
          ),
        );
        final expectedStates = [
          SoaState.initial().copyWith(
            isFetching: true,
            appliedFilter: applyFilter,
          ),
          SoaState.initial().copyWith(
            appliedFilter: applyFilter,
            soaList: fakeSoaList,
          ),
        ];
        whenListen(
          mockSoaBloc,
          Stream.fromIterable(expectedStates),
        );

        tester.view.physicalSize = const Size(480, 800);
        tester.view.devicePixelRatio = 1;
        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle();

        final filterIcon = find.byIcon(Icons.tune_outlined);
        expect(
          filterIcon,
          findsOneWidget,
        );
        await tester.tap(filterIcon);
        await tester.pumpAndSettle();
        final soaFilterBottomSheetFinder =
            find.byKey(WidgetKeys.soaFilterBottomSheetKey);
        expect(
          soaFilterBottomSheetFinder,
          findsOneWidget,
        );
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.closeButton), findsOneWidget);

        final fromDataField = find.byKey(WidgetKeys.soaFromDateFieldKey);
        expect(fromDataField, findsOneWidget);
        await tester.tap(fromDataField);
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.monthPickerKey), findsOneWidget);
      });

      testWidgets('bottomSheet - ToDataField', (tester) async {
        final expectedStates = [
          SoaState.initial().copyWith(
            isFetching: true,
            appliedFilter: applyFilter,
          ),
          SoaState.initial().copyWith(
            appliedFilter: applyFilter,
            soaList: fakeSoaList,
          ),
        ];
        whenListen(
          mockSoaBloc,
          Stream.fromIterable(expectedStates),
        );

        tester.view.physicalSize = const Size(480, 800);
        tester.view.devicePixelRatio = 1;
        await tester.pumpWidget(getWUT());
        await tester.pumpAndSettle();
        final filterIcon = find.byIcon(Icons.tune_outlined);
        expect(
          filterIcon,
          findsOneWidget,
        );
        await tester.tap(filterIcon);
        await tester.pumpAndSettle();
        final soaFilterBottomSheetFinder =
            find.byKey(WidgetKeys.soaFilterBottomSheetKey);
        expect(
          soaFilterBottomSheetFinder,
          findsOneWidget,
        );
        await tester.pumpAndSettle();
        final toDataField = find.byKey(WidgetKeys.soaToDateFieldKey);
        expect(toDataField, findsOneWidget);
        await tester.tap(toDataField);
        await tester.pumpAndSettle();

        expect(find.byKey(WidgetKeys.monthPickerKey), findsOneWidget);
      });

      testWidgets('bottomSheet - Respect with soafilter bloc ', (tester) async {
        when(() => mockSoaBloc.state).thenReturn(
          SoaState.initial().copyWith(
            appliedFilter: applyFilter,
            soaList: fakeSoaList,
          ),
        );
        when(() => mockSoaFilterBloc.state).thenReturn(
          SoaFilterState.initial().copyWith(
            filter: SoaFilter.empty(),
          ),
        );
        final expectedStates = [
          SoaFilterState.initial().copyWith(
            filter: applyFilter,
          ),
        ];
        whenListen(
          mockSoaFilterBloc,
          Stream.fromIterable(expectedStates),
        );

        tester.view.physicalSize = const Size(480, 800);
        tester.view.devicePixelRatio = 1;
        await tester.pumpWidget(getWUT());
        await tester.pump();
        final filterIcon = find.byIcon(Icons.tune_outlined);
        expect(
          filterIcon,
          findsOneWidget,
        );
        await tester.tap(filterIcon);
        await tester.pumpAndSettle();
        final soaFilterBottomSheetFinder =
            find.byKey(WidgetKeys.soaFilterBottomSheetKey);
        expect(
          soaFilterBottomSheetFinder,
          findsOneWidget,
        );
        await tester.pumpAndSettle();
        final toDataField = find.byKey(WidgetKeys.soaToDateFieldKey);
        expect(toDataField, findsOneWidget);
        await tester.tap(toDataField);
        await tester.pumpAndSettle();
        expect(find.byKey(WidgetKeys.monthPickerKey), findsOneWidget);
      });
    });

    testWidgets('Body Test - Load with data with updated response format',
        (tester) async {
      when(() => mockSoaBloc.state).thenReturn(
        SoaState.initial().copyWith(
          soaList: fakeSoaList,
          appliedFilter: applyFilter,
        ),
      );

      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      final findSoaItem = find.text('Oct 2023');
      expect(findSoaItem, findsOneWidget);
      final downloadButtonKey = find.byKey(
        WidgetKeys.genericKey(
          key: 'soaDownloadButton#${fakeSoaList[3].soaData.simpleDateString}',
        ),
      );
      expect(downloadButtonKey, findsOneWidget);
      await tester.tap(downloadButtonKey);
    });

    testWidgets(
      ' -> Find Account Suspended Banner when Customer Code is blocked',
      (tester) async {
        when(() => mockEligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeBlockedCustomerCodeInfo,
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();

        final customerBlockedBanner =
            find.byKey(WidgetKeys.customerBlockedBanner);

        expect(customerBlockedBanner, findsOneWidget);
      },
    );

    testWidgets(
      ' -> Find Account Suspended Banner when ship to Code is blocked',
      (tester) async {
        when(() => mockEligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            shipToInfo: fakeBlockedShipToInfo,
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();

        final customerBlockedBanner =
            find.byKey(WidgetKeys.customerBlockedBanner);

        expect(customerBlockedBanner, findsOneWidget);
      },
    );

    testWidgets('-> Find marketplace logo && marketplace title in MP SOA',
        (tester) async {
      when(() => mpMockSoaBloc.state).thenReturn(
        SoaState.initial().copyWith(soaList: fakeSoaList.take(1).toList()),
      );

      await tester.pumpWidget(getWUT(isMarketPlace: true));
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byType(AppBar),
          matching: find.text('MP Statement of accounts'),
        ),
        findsOne,
      );
      final soaItem = find.byKey(WidgetKeys.soaSearchResultsKey);
      expect(soaItem, findsOne);
      expect(
        find.descendant(of: soaItem, matching: find.byType(MarketPlaceLogo)),
        findsOne,
      );
    });
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/ez_point/ez_point_bloc.dart';
import 'package:ezrxmobile/application/chatbot/chat_bot_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_config.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/core/package_info/package_info.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/widgets/quick_access_menu.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late CustomerCodeBloc customerCodeBlocMock;
  late AuthBloc authBlocMock;
  late UserBloc userBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late AppRouter autoRouterMock;
  late EZPointBloc eZPointBlocMock;
  late ChatBotBloc chatBotBlocMock;

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => PackageInfoService());
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    salesOrgBlocMock = SalesOrgBlocMock();
    autoRouterMock = AutoRouteMock();
    eZPointBlocMock = EZPointBlocMock();
    chatBotBlocMock = ChatBotMockBloc();

    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => eZPointBlocMock.state).thenReturn(EZPointState.initial());
    when(() => chatBotBlocMock.state).thenReturn(ChatBotState.initial());
    customerCodeBlocMock = CustomerCodeBlocMock();
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    authBlocMock = AuthBlocMock();
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());

    userBlocMock = UserBlocMock();
    when(() => userBlocMock.state).thenReturn(UserState.initial());
    eligibilityBlocMock = EligibilityBlocMock();
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
  });

  Future getWidget(WidgetTester tester) {
    return tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<UserBloc>(
            create: (context) => userBlocMock,
          ),
          BlocProvider<AuthBloc>(
            create: (context) => authBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<SalesOrgBloc>(
            create: (context) => salesOrgBlocMock,
          ),
          BlocProvider<EZPointBloc>(
            create: (context) => eZPointBlocMock,
          ),
          BlocProvider<ChatBotBloc>(
            create: (context) => chatBotBlocMock,
          ),
        ],
        child: const Scaffold(body: QuickAccessMenuPanel()),
      ),
    );
  }

  group('Quick Access Menu Panel Test', () {
    testWidgets(
      ' -> Find Quick Access Menu Panel',
      (WidgetTester tester) async {
        await getWidget(tester);
        await tester.pump();
        final comboOffersSectionFinder = find.byType(QuickAccessMenuPanel);
        expect(comboOffersSectionFinder, findsOneWidget);
      },
    );

    group('Test homeQuickAccessPaymentsMenu', () {
      testWidgets(
        ' -> Show paymentsTile when Enable Payment Configuration is On for Client User',
        (WidgetTester tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeSGSalesOrgConfigs,
              user: fakeClientUser,
            ),
          );
          when(
            () =>
                autoRouterMock.navigate(PaymentPageRoute(isMarketPlace: false)),
          ).thenAnswer((_) => Future.value());

          await getWidget(tester);
          await tester.pumpAndSettle();
          final paymentsTile =
              find.byKey(WidgetKeys.homeQuickAccessPaymentsMenu);
          expect(paymentsTile, findsOneWidget);
          await tester.tap(paymentsTile);
          verify(
            () =>
                autoRouterMock.navigate(PaymentPageRoute(isMarketPlace: false)),
          ).called(1);
        },
      );

      testWidgets(
        ' -> Show paymentsTile when user is RootAdmin ',
        (WidgetTester tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              user: fakeRootAdminUser,
            ),
          );

          await getWidget(tester);
          await tester.pumpAndSettle();
          final paymentsTile =
              find.byKey(WidgetKeys.homeQuickAccessPaymentsMenu);
          expect(paymentsTile, findsOneWidget);
        },
      );

      testWidgets(
        ' -> Hide paymentsTile when Enable Payment Configuration is Off',
        (WidgetTester tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeKHSalesOrgConfigs,
            ),
          );

          await getWidget(tester);
          await tester.pump();
          final paymentsTile =
              find.byKey(WidgetKeys.homeQuickAccessPaymentsMenu);
          expect(paymentsTile, findsNothing);
        },
      );

      testWidgets(
        ' -> Hide paymentsTile when user is customer and paymentAccess is disable from user level',
        (WidgetTester tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeSGSalesOrgConfigs,
              user: fakeClientUser.copyWith(
                disablePaymentAccess: true,
              ),
            ),
          );

          await getWidget(tester);
          await tester.pump();
          final paymentsTile =
              find.byKey(WidgetKeys.homeQuickAccessPaymentsMenu);
          expect(paymentsTile, findsNothing);
        },
      );

      testWidgets(
        ' -> Hide paymentsTile Sales Org SG and Customer Payment term is Outside of system --> A007',
        (WidgetTester tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrganisation: fakeSGSalesOrganisation,
              salesOrgConfigs: fakeSGSalesOrgConfigs,
              customerCodeInfo: fakeCustomerCodeInfo.copyWith(
                paymentTerm: PaymentTermCode('A007'),
              ),
            ),
          );
          await getWidget(tester);
          await tester.pump();
          final paymentsTile =
              find.byKey(WidgetKeys.homeQuickAccessPaymentsMenu);
          expect(paymentsTile, findsNothing);
        },
      );

      testWidgets(
        ' -> Hide paymentsTile Sales Org SG and Customer Payment term is Outside of system --> C024',
        (WidgetTester tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrganisation: fakeSGSalesOrganisation,
              salesOrgConfigs: fakeSGSalesOrgConfigs,
              customerCodeInfo: fakeCustomerCodeInfo.copyWith(
                paymentTerm: PaymentTermCode('C024'),
              ),
            ),
          );
          await getWidget(tester);
          await tester.pump();
          final paymentsTile =
              find.byKey(WidgetKeys.homeQuickAccessPaymentsMenu);
          expect(paymentsTile, findsNothing);
        },
      );
    });

    group('Test homeQuickAccessReturnMenu', () {
      testWidgets(
        ' -> Show returnTile when Disable Returns for Customers is ON and Disable Returns for SalesRep is OFF for SalesRep User',
        (WidgetTester tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeMYSalesOrgConfigs.copyWith(
                disableReturnsAccess: true,
              ),
              user: fakeSalesRepUser,
            ),
          );

          when(() => autoRouterMock.navigate(const ReturnRootRoute()))
              .thenAnswer((_) => Future.value());

          await getWidget(tester);
          await tester.pumpAndSettle();
          final returnTile = find.byKey(WidgetKeys.homeQuickAccessReturnsMenu);
          expect(returnTile, findsOneWidget);

          await tester.tap(returnTile);
          verify(() => autoRouterMock.navigate(const ReturnRootRoute()))
              .called(1);
        },
      );

      testWidgets(
        ' -> Show returnTile when Disable Returns for Customers Customer Code Config is ON',
        (WidgetTester tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              customerCodeConfig: CustomerCodeConfig.empty().copyWith(
                disableReturns: true,
              ),
            ),
          );

          await getWidget(tester);
          await tester.pumpAndSettle();
          final returnTile = find.byKey(WidgetKeys.homeQuickAccessReturnsMenu);
          expect(returnTile, findsNothing);
        },
      );
    });

    testWidgets('Test homeQuickAccessOrdersMenu', (tester) async {
      whenListen(
        eligibilityBlocMock,
        Stream.fromIterable([
          EligibilityState.initial().copyWith(
            user: fakeRootAdminUser,
            customerCodeConfig: CustomerCodeConfig.empty()
                .copyWith(customerCode: 'fake-customer-code'),
          ),
        ]),
      );

      when(() => autoRouterMock.navigate(const OrdersTabRoute()))
          .thenAnswer((_) => Future.value());

      await getWidget(tester);
      await tester.pumpAndSettle();
      final orderTile = find.byKey(WidgetKeys.homeQuickAccessOrdersMenu);
      expect(orderTile, findsOneWidget);
      await tester.tap(orderTile);
      verify(() => autoRouterMock.navigate(const OrdersTabRoute())).called(1);
    });

    testWidgets('Test homeQuickAccessMPPaymentsMenu', (tester) async {
      when(
        () => eligibilityBlocMock.state,
      ).thenReturn(
        EligibilityState.initial().copyWith(
          user: fakeClientUserAccessMarketPlace,
          customerCodeInfo: fakeMarketPlaceCustomerCode,
        ),
      );

      when(() => autoRouterMock.navigate(PaymentPageRoute(isMarketPlace: true)))
          .thenAnswer((_) => Future.value());

      await getWidget(tester);
      await tester.pumpAndSettle();
      final mPPaymentsMenuTile =
          find.byKey(WidgetKeys.homeQuickAccessMPPaymentsMenu);
      expect(mPPaymentsMenuTile, findsOneWidget);
      await tester.tap(mPPaymentsMenuTile);
      verify(
        () => autoRouterMock.navigate(PaymentPageRoute(isMarketPlace: true)),
      ).called(1);
    });

    testWidgets('Test homeQuickAccessEZPointMenu', (tester) async {
      when(
        () => eligibilityBlocMock.state,
      ).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeIDSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
        ),
      );

      when(() => autoRouterMock.push(const EZPointWebviewPageRoute()))
          .thenAnswer((_) => Future.value());

      await getWidget(tester);
      await tester.pumpAndSettle();
      final eZPointMenuTile = find.byKey(WidgetKeys.homeQuickAccessEZPointMenu);
      expect(eZPointMenuTile, findsOneWidget);
      await tester.tap(eZPointMenuTile);

      verify(
        () => eZPointBlocMock.add(
          EZPointEvent.fetch(
            customerCodeInfo: fakeCustomerCodeInfo,
          ),
        ),
      ).called(1);
      verify(
        () => autoRouterMock.push(const EZPointWebviewPageRoute()),
      ).called(1);
    });

    testWidgets('Test homeQuickAccessChatSupportMenu', (tester) async {
      await getWidget(tester);
      await tester.pumpAndSettle();
      final chatSupportTile =
          find.byKey(WidgetKeys.homeQuickAccessChatSupportMenu);
      expect(chatSupportTile, findsOneWidget);
      await tester.tap(chatSupportTile);
      verify(() => chatBotBlocMock.add(const ChatBotEvent.startChatbot()))
          .called(1);
    });
  });
}

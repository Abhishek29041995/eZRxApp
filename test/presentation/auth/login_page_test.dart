//TODO: Remove ignore when login with web introduce

// ignore_for_file: dead_code

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/about_us/about_us_bloc.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/forgot_password/forgot_password_bloc.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/application/chatbot/chat_bot_bloc.dart';
import 'package:ezrxmobile/application/deep_linking/deep_linking_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/application/order/scan_material_info/scan_material_info_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/application/payments/account_summary/account_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/return_list_by_item_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/auth/entities/login.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/auth/login/login_page.dart';
import 'package:ezrxmobile/presentation/core/or_divider.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:upgrader/upgrader.dart';

import '../../common_mock_data/mock_bloc.dart';
import '../../utils/material_frame_wrapper.dart';
import '../../utils/widget_utils.dart';

class LoginFormBlocMock extends MockBloc<LoginFormEvent, LoginFormState>
    implements LoginFormBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class AboutUsBlocMock extends MockBloc<AboutUsEvent, AboutUsState>
    implements AboutUsBloc {}

class AccountSummaryBlocMock
    extends MockBloc<AccountSummaryEvent, AccountSummaryState>
    implements AccountSummaryBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class PaymentCustomerInformationBlocMock extends MockBloc<
        PaymentCustomerInformationEvent, PaymentCustomerInformationState>
    implements PaymentCustomerInformationBloc {}

class DeepLinkingMockBloc extends MockBloc<DeepLinkingEvent, DeepLinkingState>
    implements DeepLinkingBloc {}

class AutoRouterMock extends Mock implements AppRouter {
  @override
  String currentPath = '';
}

class MaterialListMockBloc
    extends MockBloc<MaterialListEvent, MaterialListState>
    implements MaterialListBloc {}

class MaterialPriceMockBloc
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class ViewByItemsMockBloc extends MockBloc<ViewByItemsEvent, ViewByItemsState>
    implements ViewByItemsBloc {}

class ReturnListByItemMockBloc
    extends MockBloc<ReturnListByItemEvent, ReturnListByItemState>
    implements ReturnListByItemBloc {}

class ViewByItemDetailsMockBloc
    extends MockBloc<ViewByItemDetailsEvent, ViewByItemDetailsState>
    implements ViewByItemDetailsBloc {}

class ScanMaterialInfoBlocMock
    extends MockBloc<ScanMaterialInfoEvent, ScanMaterialInfoState>
    implements ScanMaterialInfoBloc {}

class ViewByOrderDetailsMockBloc
    extends MockBloc<ViewByOrderDetailsEvent, ViewByOrderDetailsState>
    implements ViewByOrderDetailsBloc {}

class ProductDetailMockBloc
    extends MockBloc<ProductDetailEvent, ProductDetailState>
    implements ProductDetailBloc {}

class CreditAndInvoiceDetailsMockBloc
    extends MockBloc<CreditAndInvoiceDetailsEvent, CreditAndInvoiceDetailsState>
    implements CreditAndInvoiceDetailsBloc {}

class ChatBotMockBloc extends MockBloc<ChatBotEvent, ChatBotState>
    implements ChatBotBloc {}

class AupTcBlocMock extends MockBloc<AupTcEvent, AupTcState>
    implements AupTcBloc {}

void main() {
  late GetIt locator;
  late LoginFormBloc loginBlocMock;
  late AuthBloc authBlocMock;
  late AboutUsBloc aboutUsBlocMock;
  late ScanMaterialInfoBloc scanMaterialInfoBlocMock;
  late AccountSummaryBloc accountSummaryMock;
  late AnnouncementBloc announcementBlocMock;
  late DeepLinkingBloc deepLinkingBlocMock;
  final UserBloc userBlocMock = UserBlocMock();
  final SalesOrgBloc salesOrgBlocMock = SalesOrgBlocMock();
  final CustomerCodeBloc customerCodeBlocMock = CustomerCodeBlocMock();
  final CartBloc cartBlocMock = CartBlocMock();
  final eligibilityBlocMock = EligibilityBlocMock();
  late AppRouter autoRouterMock;
  final PaymentCustomerInformationBloc paymentCustomerInformationBlocMock =
      PaymentCustomerInformationBlocMock();
  late MaterialListBloc materialListBloc;
  late MaterialPriceBloc materialPriceBloc;
  late ViewByItemsBloc viewByItemsBloc;
  late ReturnListByItemBloc returnListByItemBloc;
  late ViewByItemDetailsBloc viewByItemDetailsBlocMock;
  late ViewByOrderDetailsBloc viewByOrderDetailsBlocMock;
  late ProductDetailBloc productDetailBloc;
  late ChatBotBloc chatBotBloc;
  late CreditAndInvoiceDetailsBloc creditAndInvoiceDetailsBloc;
  late AupTcBloc aupTcBloc;
  late ForgotPasswordBloc forgotPasswordBloc;

  final appMarketVariant = ValueVariant<AppMarket>(
    {
      // AppMarket('hk'),
      AppMarket('kh'),
      // AppMarket('kr'),
      AppMarket('mm'),
      AppMarket('ph'),
      AppMarket('sg'),
      AppMarket('th'),
      AppMarket('tw'),
      AppMarket('vn'),
      AppMarket('my'),
      AppMarket('id'),
    },
  );
  final mediaQueryVariant = ValueVariant<bool>({true, false});

  setUpAll(() {
    locator = GetIt.instance;
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(
      () => MixpanelService(config: locator<Config>()),
    );
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(
      () => Upgrader(),
    );
  });

  ///////////////////////////Finder/////////////////////////////////////////////
  final ssoLoginButton = find.byKey(const Key('ssoLoginButton'));
  final ezrxAplLogo = find.byKey(WidgetKeys.ezrxAplLogo);
  final createAccount = find.byKey(WidgetKeys.createAccountButton);
  final username = find.byKey(WidgetKeys.loginUsernameField);
  final loginPasswordField = find.byKey(WidgetKeys.loginPasswordField);
  final loginSubmitButton = find.byKey(WidgetKeys.loginSubmitButton);
  final loginMobileScreen = find.byKey(WidgetKeys.loginMobileScreen);
  final loginWebScreen = find.byKey(WidgetKeys.loginWebScreen);
  /////////////////////////////////////////////////////////////////////////////

  group('Login Screen', () {
    setUp(() {
      WidgetsFlutterBinding.ensureInitialized();
      loginBlocMock = LoginFormBlocMock();
      autoRouterMock = locator<AppRouter>();
      authBlocMock = AuthBlocMock();
      aboutUsBlocMock = AboutUsBlocMock();
      scanMaterialInfoBlocMock = ScanMaterialInfoBlocMock();
      accountSummaryMock = AccountSummaryBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      deepLinkingBlocMock = DeepLinkingMockBloc();
      materialListBloc = MaterialListMockBloc();
      materialPriceBloc = MaterialPriceMockBloc();
      viewByItemsBloc = ViewByItemsMockBloc();
      returnListByItemBloc = ReturnListByItemMockBloc();
      viewByItemDetailsBlocMock = ViewByItemDetailsMockBloc();
      viewByOrderDetailsBlocMock = ViewByOrderDetailsMockBloc();
      productDetailBloc = ProductDetailMockBloc();
      creditAndInvoiceDetailsBloc = CreditAndInvoiceDetailsMockBloc();
      forgotPasswordBloc = ForgotPasswordBlocMock();
      chatBotBloc = ChatBotMockBloc();
      aupTcBloc = AupTcBlocMock();
      when(() => loginBlocMock.state).thenReturn(LoginFormState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => accountSummaryMock.state)
          .thenReturn(AccountSummaryState.initial());
      when(() => aboutUsBlocMock.state).thenReturn(AboutUsState.initial());
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => paymentCustomerInformationBlocMock.state)
          .thenReturn(PaymentCustomerInformationState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => scanMaterialInfoBlocMock.state)
          .thenReturn(ScanMaterialInfoState.initial());
      when(() => deepLinkingBlocMock.state)
          .thenReturn(const DeepLinkingState.initial());
      when(() => materialListBloc.state)
          .thenReturn(MaterialListState.initial());
      when(() => materialPriceBloc.state)
          .thenReturn(MaterialPriceState.initial());
      when(() => viewByItemsBloc.state).thenReturn(ViewByItemsState.initial());
      when(() => returnListByItemBloc.state)
          .thenReturn(ReturnListByItemState.initial());
      when(() => viewByItemDetailsBlocMock.state)
          .thenReturn(ViewByItemDetailsState.initial());
      when(() => viewByOrderDetailsBlocMock.state)
          .thenReturn(ViewByOrderDetailsState.initial());
      when(() => productDetailBloc.state)
          .thenReturn(ProductDetailState.initial());
      when(() => creditAndInvoiceDetailsBloc.state)
          .thenReturn(CreditAndInvoiceDetailsState.initial());
      when(() => chatBotBloc.state).thenReturn(ChatBotState.initial());
      when(() => aupTcBloc.state).thenReturn(
        AupTcState.initial(),
      );
      when(() => forgotPasswordBloc.state).thenReturn(
        ForgotPasswordState.initial(),
      );
    });

    Widget loginTestPage({bool? useMediaQuery}) => WidgetUtils.getScopedWidget(
          useMediaQuery: useMediaQuery ?? true,
          autoRouterMock: autoRouterMock,
          usingLocalization: true,
          child: MultiBlocProvider(
            providers: [
              BlocProvider<LoginFormBloc>(
                create: (context) => loginBlocMock,
              ),
              BlocProvider<AnnouncementBloc>(
                create: (context) => announcementBlocMock,
              ),
              BlocProvider<PaymentCustomerInformationBloc>(
                create: (context) => paymentCustomerInformationBlocMock,
              ),
              BlocProvider<CartBloc>(
                create: (context) => CartBlocMock(),
              ),
              BlocProvider<UserBloc>(
                create: (context) => userBlocMock,
              ),
              BlocProvider<AuthBloc>(
                create: (context) => authBlocMock,
              ),
              BlocProvider<ScanMaterialInfoBloc>(
                create: (context) => scanMaterialInfoBlocMock,
              ),
              BlocProvider<AboutUsBloc>(
                create: (context) => aboutUsBlocMock,
              ),
              BlocProvider<AccountSummaryBloc>(
                create: (context) => accountSummaryMock,
              ),
              BlocProvider<MaterialListBloc>(
                create: (context) => materialListBloc,
              ),
              BlocProvider<MaterialPriceBloc>(
                create: (context) => materialPriceBloc,
              ),
              BlocProvider<ViewByItemsBloc>(
                create: (context) => viewByItemsBloc,
              ),
              BlocProvider<ReturnListByItemBloc>(
                create: (context) => returnListByItemBloc,
              ),
              BlocProvider<ViewByItemDetailsBloc>(
                create: (context) => viewByItemDetailsBlocMock,
              ),
              BlocProvider<ViewByOrderDetailsBloc>(
                create: (context) => viewByOrderDetailsBlocMock,
              ),
              BlocProvider<ProductDetailBloc>(
                create: (context) => productDetailBloc,
              ),
              BlocProvider<CreditAndInvoiceDetailsBloc>(
                create: (context) => creditAndInvoiceDetailsBloc,
              ),
              BlocProvider<ChatBotBloc>(
                create: (context) => chatBotBloc,
              ),
              BlocProvider<AupTcBloc>(
                create: (context) => aupTcBloc,
              ),
            ],
            child: const LoginPage(),
          ),
        );

    testWidgets("Test don't have credential", (tester) async {
      await tester.pumpWidget(loginTestPage());
      await tester.pump();
      // Create the Finders.
      final userNameTextField = find.byKey(const Key('loginUsernameField'));
      final rememberPasswordCheckBox =
          find.byKey(const Key('loginRememberPasswordCheckbox'));

      expect(userNameTextField, findsOneWidget);
      expect(loginPasswordField, findsOneWidget);
      expect(loginSubmitButton, findsOneWidget);
      expect(ssoLoginButton, findsOneWidget);
      expect(rememberPasswordCheckBox, findsOneWidget);
    });

    testWidgets('Test login error', (tester) async {
      final expectedStates = [
        LoginFormState.initial().copyWith(
          authFailureOrSuccessOption: optionOf(
            const Left(ApiFailure.other('fake-message')),
          ),
          showErrorMessages: true,
        ),
      ];

      whenListen(loginBlocMock, Stream.fromIterable(expectedStates));

      await tester.pumpWidget(loginTestPage());
      await tester.pump();

      final errorMessage = find.byKey(WidgetKeys.customSnackBar);

      expect(errorMessage, findsNothing);
      await tester.pump();

      expect(errorMessage, findsOneWidget);
    });

    testWidgets('Test login success', (tester) async {
      final expectedStates = [
        LoginFormState.initial().copyWith(
          authFailureOrSuccessOption: optionOf(
            Right(
              Login(
                access: JWT('fake-success'),
                refresh: JWT('fake-refresh'),
                user: User.empty(),
              ),
            ),
          ),
        ),
      ];

      when(() => authBlocMock.state)
          .thenReturn(const AuthState.authenticated());

      whenListen(loginBlocMock, Stream.fromIterable(expectedStates));

      await tester.pumpWidget(loginTestPage());

      await tester.pump();

      final rememberPasswordBox =
          find.byKey(const Key('loginRememberPasswordCheckbox'));

      expect(rememberPasswordBox, findsOneWidget);
      await tester.tap(rememberPasswordBox);
      await tester.pump();

      await tester.pumpWidget(
        MaterialFrameWrapper(
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => loginBlocMock,
              ),
              BlocProvider(
                create: (context) => authBlocMock,
              ),
              BlocProvider<UserBloc>(
                create: (context) => userBlocMock,
              ),
              BlocProvider<SalesOrgBloc>(
                create: (context) => salesOrgBlocMock,
              ),
              BlocProvider<CustomerCodeBloc>(
                create: (context) => customerCodeBlocMock,
              ),
              BlocProvider<ScanMaterialInfoBloc>(
                create: (context) => scanMaterialInfoBlocMock,
              ),
              BlocProvider<PaymentCustomerInformationBloc>(
                create: (context) => paymentCustomerInformationBlocMock,
              ),
              BlocProvider<CartBloc>(
                create: (context) => cartBlocMock,
              ),
              BlocProvider<EligibilityBloc>(
                create: (context) => eligibilityBlocMock,
              ),
              BlocProvider<DeepLinkingBloc>(
                create: (context) => deepLinkingBlocMock,
              ),
              BlocProvider<AccountSummaryBloc>(
                create: (context) => accountSummaryMock,
              ),
              BlocProvider<MaterialListBloc>(
                create: (context) => materialListBloc,
              ),
              BlocProvider<MaterialPriceBloc>(
                create: (context) => materialPriceBloc,
              ),
              BlocProvider<ViewByItemsBloc>(
                create: (context) => viewByItemsBloc,
              ),
              BlocProvider<ReturnListByItemBloc>(
                create: (context) => returnListByItemBloc,
              ),
              BlocProvider<ViewByItemDetailsBloc>(
                create: (context) => viewByItemDetailsBlocMock,
              ),
              BlocProvider<ViewByOrderDetailsBloc>(
                create: (context) => viewByOrderDetailsBlocMock,
              ),
              BlocProvider<ProductDetailBloc>(
                create: (context) => productDetailBloc,
              ),
              BlocProvider<CreditAndInvoiceDetailsBloc>(
                create: (context) => creditAndInvoiceDetailsBloc,
              ),
              BlocProvider<ChatBotBloc>(
                create: (context) => chatBotBloc,
              ),
              BlocProvider<AupTcBloc>(
                create: (context) => aupTcBloc,
              ),
              BlocProvider<ForgotPasswordBloc>(
                create: (context) => forgotPasswordBloc,
              ),
            ],
            child: const SplashPage(),
          ),
        ),
      );

      // Create the Finders.
      final userNameTextField = find.byKey(const Key('loginUsernameField'));
      // final ssoLoginButton = find.byKey(const Key('ssoLoginButton'));
      final rememberPasswordCheckBox =
          find.byKey(const Key('loginRememberPasswordCheckbox'));

      expect(userNameTextField, findsNothing);
      expect(loginPasswordField, findsNothing);
      expect(loginSubmitButton, findsNothing);
      // expect(ssoLoginButton, findsNothing);
      expect(rememberPasswordCheckBox, findsNothing);
    });

    testWidgets('Test user is not assigned to any sale orgs', (tester) async {
      final expectedStates = [
        LoginFormState.initial().copyWith(
          authFailureOrSuccessOption: optionOf(
            const Left(ApiFailure.accountCreationIncomplete()),
          ),
          showErrorMessages: true,
        ),
      ];

      whenListen(loginBlocMock, Stream.fromIterable(expectedStates));

      await tester.pumpWidget(loginTestPage());
      await tester.pump();

      final userIsNotAssignedSaleOrgsSnackBar = find.byKey(WidgetKeys.customSnackBar);

      expect(userIsNotAssignedSaleOrgsSnackBar, findsNothing);
      await tester.pump();

      expect(userIsNotAssignedSaleOrgsSnackBar, findsOneWidget);
    });

    testWidgets(
      'test onWillPop',
      (tester) async {
        var willPopCalled = false;
        await tester.pumpWidget(loginTestPage());

        await tester.pump();
        final dynamic widgetsAppState = tester.state(find.byType(WidgetsApp));
        willPopCalled = await widgetsAppState.didPopRoute();
        await tester.pump();
        expect(willPopCalled, true);
      },
    );

    testWidgets(
      'SSOLogin Login',
      (tester) async {
        await tester.binding.setSurfaceSize(const Size(600, 900));

        await tester.pumpWidget(loginTestPage());
        await tester.pump();
        expect(ssoLoginButton, findsOneWidget);
        await tester.tap(ssoLoginButton);
        await tester.pump();
        verify(
          () => loginBlocMock.add(
            const LoginFormEvent.loginWithOktaButtonPressed(),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'Check only LoginMobile available',
      (tester) async {
        tester.view.physicalSize = const Size(2732, 2048);
        tester.view.devicePixelRatio = 1;
        await tester.pumpWidget(
          loginTestPage(
            useMediaQuery: false,
          ),
        );
        await tester.pump();
        expect(loginMobileScreen, findsOneWidget);
        expect(loginWebScreen, findsNothing);
      },
    );

    testWidgets(
      'onChange Username',
      (tester) async {
        final expectedStates = [
          LoginFormState.initial(),
          LoginFormState.initial().copyWith(
            username: Username('ezrxtest05'),
          ),
        ];

        whenListen(loginBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(loginTestPage());
        await tester.pump();
        final userName = find.byKey(const Key('loginUsernameField'));
        expect(userName, findsOneWidget);
        await tester.enterText(userName, 'ezrxtest06');
        await tester.pump();
        expect(loginSubmitButton, findsOneWidget);
        await tester.tap(loginSubmitButton);
        await tester.pumpAndSettle();
      },
    );

    testWidgets('Username is Valid', (tester) async {
      final expectedStates = [
        LoginFormState.initial().copyWith(
          username: Username('1\n2'),
          showErrorMessages: true,
        ),
      ];
      when(() => loginBlocMock.state).thenReturn(
        LoginFormState.initial().copyWith(
          username: Username('1\n2'),
          showErrorMessages: true,
        ),
      );
      whenListen(loginBlocMock, Stream.fromIterable(expectedStates));

      await tester.pumpWidget(loginTestPage());
      await tester.pump();
      await tester.enterText(
        find.byKey(const Key('loginUsernameField')),
        '1\n2',
      );
      await tester.pump(
        const Duration(
          seconds: 2,
        ),
      );
      expect(find.byKey(const Key('loginUsernameField')), findsOneWidget);
    });

    testWidgets('Password is orElse', (tester) async {
      final expectedStates = [
        LoginFormState.initial().copyWith(
          username: Username('ezrxtest05'),
          password: Password.reset('Staysafe01'),
          showErrorMessages: true,
        ),
      ];
      when(() => loginBlocMock.state).thenReturn(
        LoginFormState.initial().copyWith(
          username: Username('ezrxtest05'),
          password: Password.reset('Staysafe01'),
          showErrorMessages: true,
        ),
      );
      whenListen(loginBlocMock, Stream.fromIterable(expectedStates));

      await tester.pumpWidget(loginTestPage());
      await tester.pump();
      await tester.enterText(
        find.byKey(const Key('loginPasswordField')),
        'Staysafe01',
      );
      await tester.pump(
        const Duration(
          seconds: 2,
        ),
      );
      expect(loginPasswordField, findsOneWidget);
    });

    testWidgets('Password is Valid', (tester) async {
      final expectedStates = [
        LoginFormState.initial().copyWith(
          username: Username('ezrxtest05'),
          password: Password.reset('St@ysafe01'),
          showErrorMessages: true,
        ),
      ];
      when(() => loginBlocMock.state).thenReturn(
        LoginFormState.initial().copyWith(
          username: Username('ezrxtest05'),
          password: Password.reset('St@ysafe01'),
          showErrorMessages: true,
        ),
      );
      whenListen(loginBlocMock, Stream.fromIterable(expectedStates));

      await tester.pumpWidget(loginTestPage());
      await tester.pump();
      await tester.enterText(
        loginPasswordField,
        'St@ysafe01',
      );
      await tester.pump(
        const Duration(
          seconds: 2,
        ),
      );
      expect(loginPasswordField, findsOneWidget);
    });

    testWidgets(
      'onChange Password',
      (tester) async {
        final expectedStates = [
          LoginFormState.initial(),
          LoginFormState.initial().copyWith(
            password: Password.login('password'),
          ),
        ];

        whenListen(loginBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(loginTestPage());
        await tester.pump();
        expect(loginPasswordField, findsOneWidget);
        await tester.enterText(loginPasswordField, 'password1');
        await tester.pump();

        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();
        final loginPasswordFieldSuffixIcon =
            find.byKey(const Key('loginPasswordFieldSuffixIcon'));
        expect(loginPasswordFieldSuffixIcon, findsOneWidget);
        await tester.tap(loginPasswordFieldSuffixIcon);
        await tester.pumpAndSettle();

        await tester.sendKeyEvent(LogicalKeyboardKey.enter);
        await tester.pumpAndSettle();
      },
    );

    testWidgets(
      'Login Validation - Username is empty and Password is filled, validation error message only for username',
      (tester) async {
        final expectedStates = [
          LoginFormState.initial(),
          LoginFormState.initial().copyWith(
            username: Username(''),
            password: Password.login('password'),
            showErrorMessages: true,
          ),
        ];

        whenListen(loginBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(loginTestPage());
        await tester.pump();
        expect(loginPasswordField, findsOneWidget);

        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();

        expect(loginSubmitButton, findsOneWidget);
        await tester.tap(loginSubmitButton);
        await tester.pump();

        final usernameErrorText =
            find.textContaining('Username cannot be empty.'.tr());
        expect(usernameErrorText, findsOneWidget);
      },
    );

    testWidgets(
      'Login Validation - Password is empty and username is filled, validation error message only for password',
      (tester) async {
        final expectedStates = [
          LoginFormState.initial(),
          LoginFormState.initial().copyWith(
            username: Username('username'),
            password: Password.login(''),
            isSubmitting: false,
            showErrorMessages: true,
          ),
        ];

        whenListen(loginBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(loginTestPage());
        await tester.pump();
        expect(loginPasswordField, findsOneWidget);

        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();

        expect(loginSubmitButton, findsOneWidget);
        await tester.tap(loginSubmitButton);
        await tester.pump();

        final passwordErrorText =
            find.textContaining('Password cannot be empty.'.tr());
        expect(passwordErrorText, findsOneWidget);
      },
    );

    testWidgets(' Test After click on Create Account Button for Mobile',
        (tester) async {
      await tester.pumpWidget(loginTestPage());

      await tester.pump();
      expect(loginSubmitButton, findsOneWidget);
      await tester.drag(
        loginSubmitButton,
        const Offset(0.0, -1000.0),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));
      expect(createAccount, findsOneWidget);
      await tester.tap(createAccount);
      await tester.pumpAndSettle();
      expect(autoRouterMock.current.name, WebViewPageRoute.name);
    });

    testWidgets(' Test After click on Create Account Button for Tablet',
        (tester) async {
      tester.view.physicalSize = const Size(2732, 2048);
      tester.view.devicePixelRatio = 1;
      await tester.pumpWidget(loginTestPage(useMediaQuery: false));
      await tester.pump();

      final createAccountButton = find.byKey(WidgetKeys.createAccountButton);
      expect(createAccountButton, findsOneWidget);
      await tester.tap(createAccountButton);
      await tester.pumpAndSettle();
      expect(autoRouterMock.current.name, WebViewPageRoute.name);
    });
    testWidgets('Username should not contain Capital letters', (tester) async {
      final expectedStates = [
        LoginFormState.initial().copyWith(
          username: Username('ezrxtest05'),
          showErrorMessages: false,
          isSubmitting: false,
        ),
      ];
      when(() => loginBlocMock.state).thenReturn(
        LoginFormState.initial().copyWith(
          username: Username('ezrxtest05'),
          showErrorMessages: true,
          isSubmitting: true,
        ),
      );
      whenListen(loginBlocMock, Stream.fromIterable(expectedStates));
      await tester.pumpWidget(loginTestPage());
      await tester.pumpAndSettle();
      expect(username, findsOneWidget);
      await tester.enterText(username, 'EZRXtest05');
      await tester.pumpAndSettle();
      expect(find.text('ezrxtest05'), findsOneWidget);
    });

    testWidgets('Chat bot reset payload event call', (tester) async {
      final expectedStates = [
        LoginFormState.initial().copyWith(
          currentMarket: AppMarket('SG'),
        ),
      ];
      whenListen(loginBlocMock, Stream.fromIterable(expectedStates));

      await tester.pumpWidget(loginTestPage());
      await tester.pump();
      verify(
        () => chatBotBloc.add(const ChatBotEvent.resetChatbot()),
      ).called(1);
    });

    testWidgets(
      'Exrx apl logo visible for ID market mobile',
      (tester) async {
        final currentAppMarketVariant =
            appMarketVariant.currentValue ?? AppMarket('id');
        when(() => loginBlocMock.state).thenReturn(
          LoginFormState.initial().copyWith(
            currentMarket: currentAppMarketVariant,
          ),
        );
        await tester.pumpWidget(loginTestPage());
        await tester.pump();
        expect(loginMobileScreen, findsOneWidget);
        expect(
          ezrxAplLogo,
          currentAppMarketVariant.isID ? findsOneWidget : findsNothing,
        );
      },
      variant: appMarketVariant,
    );
    // commenting out cause LoginWeb not in use.
    // testWidgets(
    //   'Exrx apl logo visible for ID market tab',
    //   (tester) async {
    //     final currentAppMarketVariant =
    //         appMarketVariant.currentValue ?? AppMarket('id');
    //     when(() => loginBlocMock.state).thenReturn(
    //       LoginFormState.initial().copyWith(
    //         currentMarket: currentAppMarketVariant,
    //       ),
    //     );
    //     await tester.pumpWidget(loginTestPage(useMediaQuery: false));
    //     await tester.pump();
    //     expect(loginWebScreen, findsOneWidget);
    //     expect(
    //       ezrxAplLogo,
    //       currentAppMarketVariant.isID ? findsOneWidget : findsNothing,
    //     );
    //   },
    //   variant: appMarketVariant,
    // );

    testWidgets(
      'Exrx apl logo on market change from ID to other hide the logo',
      (tester) async {
        const currentMediaQueryVariant =
            true; // restore the current mediaQueryVariant when LoginWeb introduce again
        when(() => loginBlocMock.state).thenReturn(
          LoginFormState.initial().copyWith(
            currentMarket: AppMarket('id'),
          ),
        );
        final expectedStates = [
          LoginFormState.initial().copyWith(
            currentMarket: AppMarket('sg'),
          ),
        ];
        whenListen(loginBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(
          loginTestPage(
            useMediaQuery: currentMediaQueryVariant,
          ),
        );
        await tester.pump();
        expect(
          currentMediaQueryVariant ? loginMobileScreen : loginWebScreen,
          findsOneWidget,
        );
        expect(ezrxAplLogo, findsOneWidget);
        await tester.pump();
        expect(ezrxAplLogo, findsNothing);
      },
      variant: mediaQueryVariant,
    );

    testWidgets(
      'Exrx apl logo on market change from other to ID',
      (tester) async {
        const currentMediaQueryVariant =
            true; // restore the current mediaQueryVariant when LoginWeb introduce again
        when(() => loginBlocMock.state).thenReturn(
          LoginFormState.initial().copyWith(
            currentMarket: AppMarket('sg'),
          ),
        );
        final expectedStates = [
          LoginFormState.initial().copyWith(
            currentMarket: AppMarket('id'),
          ),
        ];
        whenListen(loginBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(
          loginTestPage(
            useMediaQuery: currentMediaQueryVariant,
          ),
        );
        await tester.pump();
        expect(
          currentMediaQueryVariant ? loginMobileScreen : loginWebScreen,
          findsOneWidget,
        );
        expect(ezrxAplLogo, findsNothing);
        await tester.pump();
        expect(ezrxAplLogo, findsOneWidget);
      },
      variant: mediaQueryVariant,
    );

    testWidgets(
      'Register option available for VN and ID market mobile',
      (tester) async {
        final currentAppMarketVariant =
            appMarketVariant.currentValue ?? AppMarket('id');
        when(() => loginBlocMock.state).thenReturn(
          LoginFormState.initial().copyWith(
            currentMarket: currentAppMarketVariant,
          ),
        );
        await tester.pumpWidget(loginTestPage());
        await tester.pump();
        expect(loginMobileScreen, findsOneWidget);
        expect(username, findsOneWidget);
        expect(loginSubmitButton, findsOneWidget);
        expect(loginPasswordField, findsOneWidget);
        await tester.fling(
          find.byType(ListView),
          const Offset(0.0, -1000.0),
          1000.0,
        );
        expect(
          ssoLoginButton,
          currentAppMarketVariant.isSSOLoginRestricted
              ? findsNothing
              : findsOneWidget,
        );
        expect(
          createAccount,
          currentAppMarketVariant.isRegistrationRestricted
              ? findsNothing
              : findsOneWidget,
        );
        expect(
          find.byType(OrDivider),
          currentAppMarketVariant.isSSOLoginRestricted
              ? findsNothing
              : findsOneWidget,
        );
      },
      variant: appMarketVariant,
    );

    // commenting out cause LoginWeb not in use.
    // testWidgets(
    //   'Register option available for VN and ID market Tab',
    //   (tester) async {
    //     final currentAppMarketVariant =
    //         appMarketVariant.currentValue ?? AppMarket('id');
    //     when(() => loginBlocMock.state).thenReturn(
    //       LoginFormState.initial().copyWith(
    //         currentMarket: currentAppMarketVariant,
    //       ),
    //     );
    //     await tester.pumpWidget(
    //       loginTestPage(
    //         useMediaQuery: false,
    //       ),
    //     );
    //     await tester.pump();
    //     expect(loginWebScreen, findsOneWidget);
    //     expect(username, findsOneWidget);
    //     expect(loginSubmitButton, findsOneWidget);
    //     expect(
    //       ssoLoginButton,
    //       currentAppMarketVariant.isRegistrationRestricted
    //           ? findsNothing
    //           : findsOneWidget,
    //     );
    //     expect(
    //       createAccount,
    //       currentAppMarketVariant.isRegistrationRestricted
    //           ? findsNothing
    //           : findsOneWidget,
    //     );
    //   },
    //   variant: appMarketVariant,
    // );

    testWidgets(
      'Exrx apl logo on market change from ID to other hide register',
      (tester) async {
        const currentMediaQueryVariant =
            true; // restore the current mediaQueryVariant when LoginWeb introduce again
        when(() => loginBlocMock.state).thenReturn(
          LoginFormState.initial().copyWith(
            currentMarket: AppMarket('id'),
          ),
        );
        final expectedStates = [
          LoginFormState.initial().copyWith(
            currentMarket: AppMarket('sg'),
          ),
        ];
        whenListen(loginBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(
          loginTestPage(
            useMediaQuery: currentMediaQueryVariant,
          ),
        );
        await tester.pump();
        expect(
          currentMediaQueryVariant ? loginMobileScreen : loginWebScreen,
          findsOneWidget,
        );
        expect(username, findsOneWidget);
        expect(loginSubmitButton, findsOneWidget);
        expect(loginPasswordField, findsOneWidget);
        expect(
          currentMediaQueryVariant ? loginMobileScreen : loginWebScreen,
          findsOneWidget,
        );
        expect(ssoLoginButton, findsNothing);
        expect(createAccount, findsNothing);
        expect(find.byType(OrDivider), findsNothing);
        await tester.pump();
        if (currentMediaQueryVariant) {
          await tester.fling(
            find.byType(ListView),
            const Offset(0.0, -1000.0),
            1000.0,
          );
        }
        expect(ssoLoginButton, findsOneWidget);
        expect(createAccount, findsOneWidget);
        expect(
          find.byType(OrDivider),
          currentMediaQueryVariant ? findsOneWidget : findsNothing,
        );
      },
      variant: mediaQueryVariant,
    );

    // commenting out cause LoginWeb not in use.
    // testWidgets(
    //   'Exrx apl logo on market change from other to ID show register Tab',
    //   (tester) async {
    //     when(() => loginBlocMock.state).thenReturn(
    //       LoginFormState.initial().copyWith(
    //         currentMarket: AppMarket('sg'),
    //       ),
    //     );
    //     final expectedStates = [
    //       LoginFormState.initial().copyWith(
    //         currentMarket: AppMarket('id'),
    //       ),
    //     ];
    //     whenListen(loginBlocMock, Stream.fromIterable(expectedStates));
    //     await tester.pumpWidget(
    //       loginTestPage(
    //         useMediaQuery: false,
    //       ),
    //     );
    //     await tester.pump();

    //     expect(
    //       loginWebScreen,
    //       findsOneWidget,
    //     );
    //     expect(username, findsOneWidget);
    //     expect(loginSubmitButton, findsOneWidget);
    //     expect(loginPasswordField, findsOneWidget);
    //     expect(
    //       loginWebScreen,
    //       findsOneWidget,
    //     );
    //     expect(ssoLoginButton, findsOneWidget);
    //     expect(createAccount, findsOneWidget);
    //     await tester.pump();
    //     expect(ssoLoginButton, findsNothing);
    //     expect(createAccount, findsNothing);
    //   },
    // );

    testWidgets(
      'Exrx apl logo on market change from VN to other hide register',
      (tester) async {
        const currentMediaQueryVariant =
            true; // restore the current mediaQueryVariant when LoginWeb introduce again
        when(() => loginBlocMock.state).thenReturn(
          LoginFormState.initial().copyWith(
            currentMarket: AppMarket('vn'),
          ),
        );
        final expectedStates = [
          LoginFormState.initial().copyWith(
            currentMarket: AppMarket('sg'),
          ),
        ];
        whenListen(loginBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(
          loginTestPage(
            useMediaQuery: currentMediaQueryVariant,
          ),
        );
        await tester.pump();
        expect(
          currentMediaQueryVariant ? loginMobileScreen : loginWebScreen,
          findsOneWidget,
        );
        expect(username, findsOneWidget);
        expect(loginSubmitButton, findsOneWidget);
        expect(loginPasswordField, findsOneWidget);
        expect(
          currentMediaQueryVariant ? loginMobileScreen : loginWebScreen,
          findsOneWidget,
        );
        expect(ssoLoginButton, findsNothing);
        expect(createAccount, findsNothing);
        expect(find.byType(OrDivider), findsNothing);
        await tester.pump();
        if (currentMediaQueryVariant) {
          await tester.fling(
            find.byType(ListView),
            const Offset(0.0, -1000.0),
            1000.0,
          );
        }
        expect(ssoLoginButton, findsOneWidget);
        expect(createAccount, findsOneWidget);
        expect(
          find.byType(OrDivider),
          currentMediaQueryVariant ? findsOneWidget : findsNothing,
        );
      },
      variant: mediaQueryVariant,
    );

    testWidgets(
      'Exrx apl logo on market change from other to VN show register',
      (tester) async {
        tester.view.physicalSize = const Size(2732, 2048);
        tester.view.devicePixelRatio = 1;
        when(() => loginBlocMock.state).thenReturn(
          LoginFormState.initial().copyWith(
            currentMarket: AppMarket('sg'),
          ),
        );
        final expectedStates = [
          LoginFormState.initial().copyWith(
            currentMarket: AppMarket('vn'),
          ),
        ];
        whenListen(loginBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(
          loginTestPage(
            useMediaQuery: false,
          ),
        );
        await tester.pump();

        expect(
          loginMobileScreen,
          findsOneWidget,
        );
        expect(username, findsOneWidget);
        expect(loginSubmitButton, findsOneWidget);
        expect(loginPasswordField, findsOneWidget);
        expect(ssoLoginButton, findsOneWidget);
        expect(createAccount, findsOneWidget);
        await tester.pump();
        expect(ssoLoginButton, findsNothing);
        expect(createAccount, findsNothing);
      },
    );
  });
}

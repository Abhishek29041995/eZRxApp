import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/aup_tc/aup_tc_page.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../common_mock_data/customer_code_mock.dart';
import '../../common_mock_data/mock_bloc.dart';
import '../../common_mock_data/mock_other.dart';
import '../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../common_mock_data/user_mock.dart';
import '../../utils/widget_utils.dart';
import '../../common_mock_data/mock_web_view.dart';

void main() {
  late AppRouter autoRouterMock;
  late AupTcBloc mockAupTcBloc;
  late AuthBloc mockAuthBloc;
  late AnnouncementBloc mockAnnouncementBloc;
  late UserBloc mockUserBloc;
  late EligibilityBloc mockEligibilityBloc;
  final mockWebViewDependencies = MockWebViewDependencies();

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    TestWidgetsFlutterBinding.ensureInitialized();

    locator.registerSingleton<AppRouter>(AutoRouteMock());
    locator.registerSingleton<AupTcBloc>(AupTcBlocMock());
    autoRouterMock = locator<AppRouter>();
    mockAupTcBloc = locator<AupTcBloc>();
    await mockWebViewDependencies.init();
    when(() => autoRouterMock.currentPath).thenReturn('');
  });

  setUp(() {
    mockEligibilityBloc = EligibilityBlocMock();
    mockUserBloc = UserBlocMock();
    mockAuthBloc = AuthBlocMock();
    mockAnnouncementBloc = AnnouncementBlocMock();

    when(() => mockEligibilityBloc.state).thenReturn(
      EligibilityState.initial(),
    );
    when(() => mockAupTcBloc.state).thenReturn(AupTcState.initial());
    when(() => mockUserBloc.state).thenReturn(UserState.initial());
    when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
    when(() => mockAnnouncementBloc.state)
        .thenReturn(AnnouncementState.initial());

    resetMocktailState();
  });

  Widget aupTcWidget(User user, bool isMarketPlace) =>
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<EligibilityBloc>(create: (_) => mockEligibilityBloc),
          BlocProvider<UserBloc>(create: (_) => mockUserBloc),
          BlocProvider<AuthBloc>(create: (_) => mockAuthBloc),
          BlocProvider<AnnouncementBloc>(create: (_) => mockAnnouncementBloc),
        ],
        child: AupTCPage(user: user, isMarketPlace: isMarketPlace),
      );
  group('Term and Condition dialog -', () {
    final appBar = find.byKey(WidgetKeys.tncDialogAppBar);
    final tncContent = find.byKey(WidgetKeys.tncContentBox);
    final privacyContent = find.byKey(WidgetKeys.privacyContentBox);
    final tncCheckBox = find.byKey(WidgetKeys.tncCheckBox);
    final privacyCheckBox = find.byKey(WidgetKeys.privacyCheckBox);
    final acceptButton = find.byKey(WidgetKeys.tncDialogAcceptButton);
    final cancelButton = find.byKey(WidgetKeys.tncDialogCancelButton);
    final webView = find.byKey(WidgetKeys.aupTcWebView);

    group('Normal TnC -', () {
      testWidgets('Show with default component', (tester) async {
        when(() => mockAupTcBloc.state).thenReturn(
          AupTcState.initial().copyWith(user: fakeClient),
        );

        await tester.pumpWidget(aupTcWidget(fakeClientUser, false));
        await tester.pump();

        verify(() => mockAupTcBloc.add(AupTcEvent.show(fakeClientUser)))
            .called(1);
        expect(appBar, findsOneWidget);
        expect(find.text('Welcome to eZRx+'.tr()), findsOneWidget);
        expect(
          find.text(
            'As a new user of eZRx+, we will require you to acknowledge the Terms of Use and Regional Privacy Policy before proceeding.'
                .tr(),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(of: tncContent, matching: webView),
          findsOneWidget,
        );
        expect(
          find.descendant(of: privacyContent, matching: webView),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: privacyCheckBox,
            matching: find.text(
              'I have read and hereby consent to my personal data being processed in accordance with the Regional Privacy Policy.'
                  .tr(),
            ),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: tncCheckBox,
            matching: find.text(
              'I have read and hereby agree to the Terms of Use and Acceptable Use Policy.'
                  .tr(),
            ),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: acceptButton,
            matching: find.text('Accept'.tr()),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: cancelButton,
            matching: find.text('Cancel'.tr()),
          ),
          findsOneWidget,
        );
      });

      testWidgets('Tap on cancel button', (tester) async {
        await tester.pumpWidget(aupTcWidget(fakeClient, false));
        await tester.pump();

        await tester.tap(cancelButton);

        verify(() => mockAuthBloc.add(const AuthEvent.logout())).called(1);
      });

      testWidgets('Tap on accept button when have consent', (tester) async {
        when(() => mockAupTcBloc.state).thenReturn(
          AupTcState.initial().copyWith(
            tncConsent: true,
            privacyConsent: true,
          ),
        );

        await tester.pumpWidget(aupTcWidget(fakeClient, false));
        await tester.pump();

        await tester.tap(acceptButton);

        verify(() => mockUserBloc.add(const UserEvent.acceptTnc())).called(1);
      });

      testWidgets('Can not tap on button when loading', (tester) async {
        when(() => mockUserBloc.state)
            .thenReturn(UserState.initial().copyWith(isLoading: true));
        when(() => mockAupTcBloc.state).thenReturn(
          AupTcState.initial().copyWith(
            tncConsent: true,
            privacyConsent: true,
          ),
        );

        await tester.pumpWidget(aupTcWidget(fakeClient, false));
        await tester.pump();

        await tester.tap(acceptButton);
        final acceptButtonShimmer = tester.widget<LoadingShimmer>(
          find.descendant(
            of: acceptButton,
            matching: find.byType(LoadingShimmer),
          ),
        );
        expect(acceptButtonShimmer.enabled, true);

        verifyNever(() => mockUserBloc.add(const UserEvent.acceptTnc()));

        await tester.tap(cancelButton);

        final cancelButtonShimmer = tester.widget<LoadingShimmer>(
          find.descendant(
            of: cancelButton,
            matching: find.byType(LoadingShimmer),
          ),
        );
        expect(cancelButtonShimmer.enabled, true);

        verifyNever(() => mockAuthBloc.add(const AuthEvent.logout()));
      });
    });

    group('Marketplace TnC -', () {
      testWidgets('Show with default component', (tester) async {
        when(() => mockAupTcBloc.state).thenReturn(
          AupTcState.initial().copyWith(user: fakeClient),
        );

        await tester.pumpWidget(aupTcWidget(fakeClientUser, true));
        await tester.pump();

        verify(() => mockAupTcBloc.add(AupTcEvent.show(fakeClientUser)))
            .called(1);
        expect(appBar, findsOneWidget);
        expect(
          find.textContaining(
            'Welcome to Marketplace'.tr(),
            findRichText: true,
          ),
          findsOneWidget,
        );
        expect(
          find.text(
            'New Marketplace is launched and now you can purchases products from that sold by sellers as well. Before proceed kindly read and agree to the terms of use, acceptable usage policy & regional privacy policy before processing.'
                .tr(),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(of: privacyContent, matching: webView),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: privacyCheckBox,
            matching: find.text(
              'I acknowledge and agree that the Regional Privacy Policy and Acceptable Use Policy for eZRx+ likewise applies to my usage of Marketplace. I consent to my personal data being processed by Marketplace in accordance with the Regional Privacy Policy.'
                  .tr(),
            ),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: tncCheckBox,
            matching: find.text(
              'I have read and hereby agree to the additional terms (shared above) that apply to my use of Marketplace.'
                  .tr(),
            ),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: acceptButton,
            matching: find.text('Accept'.tr()),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: cancelButton,
            matching: find.text('Skip & only see ZP products'.tr()),
          ),
          findsOneWidget,
        );
      });

      testWidgets('Tap on cancel button', (tester) async {
        await tester.pumpWidget(aupTcWidget(fakeClient, true));
        await tester.pump();

        await tester.tap(cancelButton);

        verify(
          () => mockUserBloc.add(
            UserEvent.setMarketPlaceTncAcceptance(
              MarketPlaceTnCAcceptance.reject(),
            ),
          ),
        ).called(1);
      });

      testWidgets('Tap on accept button', (tester) async {
        when(() => mockAupTcBloc.state).thenReturn(
          AupTcState.initial().copyWith(
            tncConsent: true,
            privacyConsent: true,
          ),
        );

        await tester.pumpWidget(aupTcWidget(fakeClient, true));
        await tester.pump();

        await tester.tap(acceptButton);

        verify(
          () => mockUserBloc.add(
            UserEvent.setMarketPlaceTncAcceptance(
              MarketPlaceTnCAcceptance.accept(),
            ),
          ),
        ).called(1);
      });

      testWidgets(
          'Disable Skip or Cancel button when user clicked both checkbox',
          (tester) async {
        when(() => mockAupTcBloc.state).thenReturn(
          AupTcState.initial().copyWith(
            tncConsent: true,
            privacyConsent: true,
          ),
        );

        await tester.pumpWidget(aupTcWidget(fakeClient, true));
        await tester.pump();
        final skipBtn = find.byKey(WidgetKeys.tncDialogCancelButton);
        expect(
          find.descendant(
            of: skipBtn,
            matching: find.text('Skip & only see ZP products'.tr()),
          ),
          findsOneWidget,
        );
        await tester.tap(skipBtn);
        verifyNever(
          () => mockUserBloc.add(
            UserEvent.setMarketPlaceTncAcceptance(
              MarketPlaceTnCAcceptance.reject(),
            ),
          ),
        );

        await tester.pumpWidget(aupTcWidget(fakeClient, false));
        await tester.pump();
        final cancelBtn = find.byKey(WidgetKeys.tncDialogCancelButton);
        await tester.tap(cancelBtn);

        verifyNever(
          () => mockUserBloc.add(
            UserEvent.setMarketPlaceTncAcceptance(
              MarketPlaceTnCAcceptance.reject(),
            ),
          ),
        );
      });
      testWidgets('Can not tap on button when loading', (tester) async {
        when(() => mockUserBloc.state)
            .thenReturn(UserState.initial().copyWith(isLoading: true));
        when(() => mockAupTcBloc.state).thenReturn(
          AupTcState.initial().copyWith(
            tncConsent: true,
            privacyConsent: true,
          ),
        );

        await tester.pumpWidget(aupTcWidget(fakeClient, true));
        await tester.pump();

        await tester.tap(acceptButton);
        final acceptButtonShimmer = tester.widget<LoadingShimmer>(
          find.descendant(
            of: acceptButton,
            matching: find.byType(LoadingShimmer),
          ),
        );
        expect(acceptButtonShimmer.enabled, true);

        verifyNever(
          () => mockUserBloc.add(
            UserEvent.setMarketPlaceTncAcceptance(
              MarketPlaceTnCAcceptance.accept(),
            ),
          ),
        );

        await tester.tap(cancelButton);

        final cancelButtonShimmer = tester.widget<LoadingShimmer>(
          find.descendant(
            of: cancelButton,
            matching: find.byType(LoadingShimmer),
          ),
        );
        expect(cancelButtonShimmer.enabled, true);

        verifyNever(
          () => mockUserBloc.add(
            UserEvent.setMarketPlaceTncAcceptance(
              MarketPlaceTnCAcceptance.reject(),
            ),
          ),
        );
      });

      testWidgets('Pop when user accept', (tester) async {
        final initialState = EligibilityState.initial().copyWith(
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          user: fakeClientUser.copyWith(
            acceptPrivacyPolicy: true,
            acceptMPTC: MarketPlaceTnCAcceptance.unknown(),
          ),
          customerCodeInfo: fakeMarketPlaceCustomerCode,
        );
        when(() => autoRouterMock.popForced()).thenAnswer((_) async => true);
        whenListen(
          mockEligibilityBloc,
          Stream.fromIterable([
            initialState,
            initialState.copyWith
                .user(acceptMPTC: MarketPlaceTnCAcceptance.accept()),
          ]),
        );

        await tester.pumpWidget(aupTcWidget(fakeClient, true));
        await tester.pump();

        verify(() => autoRouterMock.popForced()).called(1);
      });
    });

    testWidgets('Tap on privacy checkbox', (tester) async {
      const checkBoxInitialValue = true;
      when(() => mockAupTcBloc.state).thenReturn(
        AupTcState.initial().copyWith(
          privacyConsent: checkBoxInitialValue,
        ),
      );
      await tester.pumpWidget(aupTcWidget(fakeClient, false));
      await tester.pump();
      expect(
        tester.widget<CheckboxListTile>(privacyCheckBox).value,
        checkBoxInitialValue,
      );
      await tester.tap(privacyCheckBox);
      await tester.pump();

      verify(
        () => mockAupTcBloc.add(
          const AupTcEvent.privacyPolicyConsent(
            newValue: !checkBoxInitialValue,
          ),
        ),
      ).called(1);
    });

    testWidgets('Tap on term and condition checkbox', (tester) async {
      const checkBoxInitialValue = false;
      when(() => mockAupTcBloc.state).thenReturn(
        AupTcState.initial().copyWith(
          tncConsent: checkBoxInitialValue,
        ),
      );
      await tester.pumpWidget(aupTcWidget(fakeClient, false));
      await tester.pump();
      expect(
        tester.widget<CheckboxListTile>(tncCheckBox).value,
        checkBoxInitialValue,
      );
      await tester.tap(tncCheckBox);
      await tester.pump();

      verify(
        () => mockAupTcBloc.add(
          const AupTcEvent.termsOfUseConsent(
            newValue: !checkBoxInitialValue,
          ),
        ),
      ).called(1);
    });

    testWidgets(
        'Tap on accept button when do not have both tnc and privacy consent',
        (tester) async {
      when(() => mockAupTcBloc.state).thenReturn(
        AupTcState.initial().copyWith(
          tncConsent: true,
        ),
      );

      await tester.pumpWidget(aupTcWidget(fakeClient, false));
      await tester.pump();

      await tester.tap(acceptButton);
      await tester.pump();

      expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
      expect(
        find.text(
          'You need to read and accept full Terms of use and Privacy Policy before continue.'
              .tr(),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Show snackbar when API is failure', (tester) async {
      whenListen(
        mockUserBloc,
        Stream.fromIterable([
          UserState.initial().copyWith(isLoading: true),
          UserState.initial().copyWith(
            isLoading: false,
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake-error'))),
          ),
        ]),
      );

      await tester.pumpWidget(aupTcWidget(fakeClient, false));
      // Webview in the screen show loading.
      // double pump() is required here because using pumpAndSettle causes timeout
      await tester.pump();
      await tester.pump();

      expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
      expect(
        tester.widget<Text>(find.byKey(WidgetKeys.customSnackBarMessage)).data,
        equals('fake-error'),
      );
    });
  });
}

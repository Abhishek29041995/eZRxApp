import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/ez_point/ez_point_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/ez_point_token.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/presentation/account/ez_point/ez_point_webview_page.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_web_view.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

class AutoRouterMock extends Mock implements AppRouter {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class EZPointBlocMock extends MockBloc<EZPointEvent, EZPointState>
    implements EZPointBloc {}

final locator = GetIt.instance;

void main() {
  late AppRouter autoRouterMock;
  late EZPointBloc eZPointBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  final mockWebViewDependencies = MockWebViewDependencies();

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => eZPointBlocMock);
    locator.registerLazySingleton(() => eligibilityBlocMock);
    await mockWebViewDependencies.init();
  });
  setUp(() async {
    eZPointBlocMock = EZPointBlocMock();
    autoRouterMock = locator<AppRouter>();
    when(() => eZPointBlocMock.state).thenReturn(
      EZPointState.initial(),
    );
    eligibilityBlocMock = EligibilityBlocMock();
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
  });

  Widget getScopedWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<EZPointBloc>(
          create: (context) => eZPointBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
      ],
      child: const Scaffold(
        body: EZPointWebviewPage(),
      ),
    );
  }

  group(
    'EZPoint Webview Page',
    () {
      testWidgets(
        'Test Is Fetching',
        (tester) async {
          when(() => eZPointBlocMock.state).thenReturn(
            EZPointState.initial().copyWith(
              isFetching: true,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          final shimmerFinder = find.byKey(WidgetKeys.loaderImage);
          expect(shimmerFinder, findsOneWidget);
          expect(find.byType(AppBar), findsOneWidget);
        },
      );

      testWidgets(
        'Test Fetch Success',
        (tester) async {
          when(() => eZPointBlocMock.state).thenReturn(
            EZPointState.initial().copyWith(
              ezPointToken: EZPointToken.empty().copyWith(
                ezPointToken: 'mock-token',
              ),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          final webviewFinder = find.byKey(WidgetKeys.ezPointWebviewPage);
          expect(webviewFinder, findsOneWidget);
        },
      );

      testWidgets(
        'Test Fetch Failure',
        (tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrganisation: fakeIDSalesOrganisation,
              customerCodeInfo: fakeCustomerCodeInfo,
            ),
          );
          final expectedState = [
            EZPointState.initial().copyWith(
              isFetching: true,
            ),
            EZPointState.initial().copyWith(
              eZPointTokenFailureOrSuccessOption: optionOf(
                const Left(
                  ApiFailure.other('fake-error'),
                ),
              ),
            ),
          ];
          whenListen(eZPointBlocMock, Stream.fromIterable(expectedState));
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final snackBarFinder = find.byKey(WidgetKeys.customSnackBar);
          expect(snackBarFinder, findsOneWidget);
          final errorPageFinder = find.byKey(WidgetKeys.ezPointErrorPage);
          expect(errorPageFinder, findsOneWidget);
          // Test pull to refresh
          await tester.drag(
            errorPageFinder,
            const Offset(0.0, 1000.0),
          );
          await tester.pumpAndSettle();
          verify(
            () => eZPointBlocMock.add(
              EZPointEvent.fetch(
                customerCodeInfo: fakeCustomerCodeInfo,
              ),
            ),
          ).called(1);
        },
      );
    },
  );
}

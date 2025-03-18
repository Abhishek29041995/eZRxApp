import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/payment_webview/payment_webview_page.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/mock_web_view.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

class NewPaymentBlocMock extends MockBloc<NewPaymentEvent, NewPaymentState>
    implements NewPaymentBloc {}

class AppRouterMock extends Mock implements AppRouter {}

void main() {
  late AppRouter autoRouterMock;
  late NewPaymentBloc newPaymentBlocMock;
  final mockWebViewDependencies = MockWebViewDependencies();

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerFactory(() => AppRouter());
    registerFallbackValue(
      const PageRouteInfo(PaymentPageRoute.name),
    );

    autoRouterMock = locator<AppRouter>();
    registerFallbackValue((Route route) {
      return route.settings.name == PaymentPageRoute.name;
    });

    newPaymentBlocMock = NewPaymentBlocMock();
    await mockWebViewDependencies.init();
  });

  setUp(() {
    when(() => newPaymentBlocMock.state).thenReturn(NewPaymentState.initial());
  });

  Widget getWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      useMediaQuery: true,
      usingLocalization: true,
      routeName: PaymentAdviceCreatedPageRoute.name,
      providers: [
        BlocProvider<NewPaymentBloc>(
          create: (context) => newPaymentBlocMock,
        ),
      ],
      child: const PaymentWebviewPage(),
    );
  }

  group('Payment Webview Page Test =>', () {
    testWidgets('Test webview page when is TH market', (tester) async {
      when(() => newPaymentBlocMock.state).thenReturn(
        NewPaymentState.initial()
            .copyWith(salesOrganisation: fakeTHSalesOrganisation),
      );

      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(
        find.text(
          'Take a screen shot and scan the QR code for payment using the KBank mobile app',
        ),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.closeButton),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.paymentWebviewPage),
        findsOneWidget,
      );
    });

    testWidgets('Test webview page when is other market', (tester) async {
      when(() => newPaymentBlocMock.state).thenReturn(
        NewPaymentState.initial()
            .copyWith(salesOrganisation: fakeMYSalesOrganisation),
      );
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(
        find.text(
          'Take a screen shot and scan the QR code for payment using the KBank mobile app',
        ),
        findsNothing,
      );
      expect(
        find.byKey(WidgetKeys.closeButton),
        findsNothing,
      );
      expect(
        find.byKey(WidgetKeys.paymentWebviewPage),
        findsOneWidget,
      );
    });
  });
}

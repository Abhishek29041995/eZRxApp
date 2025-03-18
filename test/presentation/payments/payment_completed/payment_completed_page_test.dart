import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/full_name.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/bullet_widget.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/payment_completed/payment_completed_page.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/mock_bloc.dart';
import '../../../utils/widget_utils.dart';

void main() {
  late AppRouter autoRouterMock;
  late NewPaymentBloc newPaymentBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  final isMarketPlaceVariant = ValueVariant<bool>({true, false});

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
    eligibilityBlocMock = EligibilityBlocMock();
  });

  setUp(() {
    when(() => newPaymentBlocMock.state).thenReturn(NewPaymentState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
  });

  Widget getWidget({bool isMarketPlace = false}) {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      useMediaQuery: true,
      usingLocalization: true,
      routeName: PaymentAdviceCreatedPageRoute.name,
      providers: [
        BlocProvider<NewPaymentBloc>(
          create: (context) => newPaymentBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
      ],
      child: PaymentCompletedPage(isMarketPlace: isMarketPlace),
    );
  }

  group('Payment Completed Page Test =>', () {
    testWidgets('Test AppBar', (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(find.text('Payment request submitted'), findsOneWidget);
      final paymentAdviceCreatedPageBack =
          find.byKey(WidgetKeys.paymentAdviceCreatedPageBack);
      expect(paymentAdviceCreatedPageBack, findsOneWidget);
      await tester.tap(paymentAdviceCreatedPageBack);
      await tester.pumpAndSettle();
      expect(find.byType(PaymentCompletedPage), findsNothing);
    });
    testWidgets(
      'Test Body Content',
      (tester) async {
        final isMarketPlace = isMarketPlaceVariant.currentValue!;
        final fakeEmail = EmailAddress('vmnguyen@zuelligpharma.com');
        const fakeName = FullName(firstName: 'Tom', lastName: 'Nguyen');
        const fakePaymentID = 'fake-id';
        when(() => newPaymentBlocMock.state).thenReturn(
          NewPaymentState.initial()
              .copyWith
              .paymentInvoiceInfoPdf(zzAdvice: fakePaymentID),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial()
              .copyWith
              .user(email: fakeEmail, fullName: fakeName),
        );
        await tester.pumpWidget(getWidget(isMarketPlace: isMarketPlace));
        await tester.pump();
        expect(
          find.text(
            isMarketPlace
                ? 'Thank you ${fakeName.toTitleCase}! Our payment processor is coordinating with the bank to process your Marketplace payment request.'
                : 'Our payment processor is coordinating with the bank to process your payment request for payment advice  #$fakePaymentID.',
          ),
          findsOneWidget,
        );
        expect(
          find.text(
            'We’ll send a payment advice copy to ${fakeEmail.maskedValue} shortly.',
          ),
          findsOneWidget,
        );
        expect(find.text('Please note'), findsOneWidget);

        final bulletWidget = find.byType(BulletWidget);
        expect(bulletWidget, findsNWidgets(4));
        expect(
          find.descendant(
            of: bulletWidget,
            matching: find.text(
              'There may be situations where payments fail during the payment process, or it may take longer time. Please make sure to check the payment status of your payment request.',
              findRichText: true,
            ),
          ),
          findsOne,
        );
        expect(
          find.descendant(
            of: bulletWidget,
            matching: find.text(
              isMarketPlace
                  ? 'If payment request fails, you may choose to retry payment or delete the failed payment advice then generate a new payment advice.'
                  : 'If you encountered an error with the payment, delete the system-generated payment advice in the eZRx payment summary section and regenerate a new payment advice by repeating the payment process.',
              findRichText: true,
            ),
          ),
          findsOne,
        );
        expect(
          find.descendant(
            of: bulletWidget,
            matching: find.text(
              'Please note that system-generated payment advice(s) will be automatically deleted if payment is not received within 30 days.',
              findRichText: true,
            ),
          ),
          findsOne,
        );
        expect(
          find.descendant(
            of: bulletWidget,
            matching: find.text(
              'You can check your payment status from the. "${isMarketPlace ? 'MP Payment summary' : 'Payment summary'}" page.',
              findRichText: true,
            ),
          ),
          findsOne,
        );
        final finder = find.byWidgetPredicate(
          (widget) =>
              widget is RichText &&
              _tapTextSpan(
                widget,
                isMarketPlace ? 'MP Payment summary' : 'Payment summary',
              ),
        );
        expect(finder, findsWidgets);
        await tester.pumpAndSettle();
        expect(
          autoRouterMock.current.name,
          PaymentSummaryPageRoute(isMarketPlace: isMarketPlace).routeName,
        );
        expect(
          (autoRouterMock.current.args as PaymentSummaryPageRouteArgs)
              .isMarketPlace,
          isMarketPlace,
        );
      },
      variant: isMarketPlaceVariant,
    );

    testWidgets(
      'Test Account Summary Button',
      (tester) async {
        final isMarketPlace = isMarketPlaceVariant.currentValue!;
        await tester.pumpWidget(getWidget(isMarketPlace: isMarketPlace));
        await tester.pump();
        final accountSummaryButton = find.byKey(
          WidgetKeys.accountSummaryButton,
        );
        expect(accountSummaryButton, findsOneWidget);
        expect(
          find.descendant(
            of: accountSummaryButton,
            matching: find.text(
              isMarketPlace ? 'MP Account summary' : 'Account summary',
            ),
          ),
          findsOne,
        );
        await tester.tap(accountSummaryButton);
        await tester.pumpAndSettle();
        expect(
          autoRouterMock.current.name,
          AccountSummaryRoute(isMarketPlace: isMarketPlace).routeName,
        );
        expect(
          (autoRouterMock.current.args as AccountSummaryRouteArgs)
              .isMarketPlace,
          isMarketPlace,
        );
      },
      variant: isMarketPlaceVariant,
    );

    testWidgets(
      'Test payment Summary Button',
      (tester) async {
        final isMarketPlace = isMarketPlaceVariant.currentValue!;
        await tester.pumpWidget(getWidget(isMarketPlace: isMarketPlace));
        await tester.pump();
        final accountSummaryButton = find.byKey(
          WidgetKeys.paymentSummaryRouteButton,
        );
        expect(accountSummaryButton, findsOneWidget);
        expect(
          find.descendant(
            of: accountSummaryButton,
            matching: find.text(
              isMarketPlace ? 'MP Payment summary' : 'Payment summary',
            ),
          ),
          findsOne,
        );
        await tester.tap(accountSummaryButton);
        await tester.pumpAndSettle();
        expect(
          autoRouterMock.current.name,
          PaymentSummaryPageRoute(
            isMarketPlace: isMarketPlace,
          ).routeName,
        );
        expect(
          (autoRouterMock.current.args as PaymentSummaryPageRouteArgs)
              .isMarketPlace,
          isMarketPlace,
        );
      },
      variant: isMarketPlaceVariant,
    );
  });
}

bool _findTextAndTap(InlineSpan visitor, String text) {
  if (visitor is TextSpan && visitor.text == text) {
    if (visitor.recognizer is TapGestureRecognizer) {
      (visitor.recognizer as TapGestureRecognizer).onTap?.call();
    }

    return false;
  }

  return true;
}

bool _tapTextSpan(RichText richText, String text) {
  final isTapped = !richText.text.visitChildren(
    (visitor) => _findTextAndTap(visitor, text),
  );

  return isTapped;
}

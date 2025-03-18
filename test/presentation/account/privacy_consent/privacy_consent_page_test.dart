import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/privacy_consent/privacy_consent_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/privacy_control.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/account/privacy_consent/privacy_consent_page.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:mocktail/mocktail.dart';
import '../../../utils/widget_utils.dart';

class AutoRouterMock extends Mock implements AppRouter {}

class PrivacyConsentBlocMock
    extends MockBloc<PrivacyConsentEvent, PrivacyConsentState>
    implements PrivacyConsentBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

void main() {
  late AppRouter autoRouterMock;
  late PrivacyConsentBloc privacyConsentBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late PrivacyControl previousPrivacyControl;
  late PrivacyControl newPrivacyControl;
  const fakeError = ApiFailure.other('fake-error');

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    privacyConsentBlocMock = PrivacyConsentBlocMock();
    previousPrivacyControl = PrivacyControl.empty().copyWith(
      automatedPersonalisation: false,
      viaEmails: true,
      viaPushNotification: false,
      viaSMS: true,
    );
    newPrivacyControl = PrivacyControl.empty().copyWith(
      automatedPersonalisation: true,
      viaEmails: false,
      viaPushNotification: true,
      viaSMS: false,
    );
    eligibilityBlocMock = EligibilityBlocMock();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => privacyConsentBlocMock);

    autoRouterMock = locator<AppRouter>();
    when(() => privacyConsentBlocMock.state).thenReturn(
      PrivacyConsentState.initial(),
    );
    when(() => eligibilityBlocMock.state).thenReturn(
      EligibilityState.initial(),
    );
  });

  Widget getScopedWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
      ],
      child: const PrivacyConsentPage(),
    );
  }

  group(
    'Privacy consent Page',
    () {
      testWidgets(
        'Test Page Display with success fetch api',
        (tester) async {
          final expectedState = [
            PrivacyConsentState.initial().copyWith(
              currentPrivacyControl: newPrivacyControl,
            ),
          ];
          whenListen(
            privacyConsentBlocMock,
            Stream.fromIterable(expectedState),
          );

          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();

          //Testing app bar
          final commonAppBarFinder =
              find.byKey(WidgetKeys.privacyConsentAppBarTitle);
          final textFinder = find.descendant(
            of: find.byType(CustomAppBar),
            matching: find.text('Privacy consent'),
          );
          expect(textFinder, findsOneWidget);
          final textStyle = tester.widget<Text>(commonAppBarFinder).style;
          expect(textStyle!.fontSize, 18);
          expect(
            textStyle.fontWeight,
            FontWeight.w600,
          );

          final clearButtonFinder =
              find.byKey(WidgetKeys.privacyConsentClearButton);
          expect(clearButtonFinder, findsOneWidget);
          final submitButtonFinder =
              find.byKey(WidgetKeys.privacyConsentSubmitButton);
          expect(submitButtonFinder, findsOneWidget);
          // verify correct check box values from mock api
          // automated personalisation
          final automatedPersonalisationFinder =
              find.byKey(WidgetKeys.automatedPersonalisationTile);
          expect(automatedPersonalisationFinder, findsOneWidget);
          final automatedPersonalisationCheckbox =
              tester.widget<CheckboxListTile>(automatedPersonalisationFinder);
          expect(automatedPersonalisationCheckbox.value, isTrue);
          // viaEmail
          final viaEmailFinder = find.byKey(WidgetKeys.viaEmailTile);
          expect(viaEmailFinder, findsOneWidget);
          final viaEmailCheckBox =
              tester.widget<CheckboxListTile>(viaEmailFinder);
          expect(viaEmailCheckBox.value, isFalse);
          // viaNotification
          final viaNotificationFinder =
              find.byKey(WidgetKeys.viaPushNotificationTile);
          expect(viaNotificationFinder, findsOneWidget);
          final viaNotificationCheckBox =
              tester.widget<CheckboxListTile>(viaNotificationFinder);
          expect(viaNotificationCheckBox.value, isTrue);
          // viaSMS
          final viaSMSFinder = find.byKey(WidgetKeys.viaSMSTile);
          expect(viaSMSFinder, findsOneWidget);
          final viaSMSCheckBox = tester.widget<CheckboxListTile>(viaSMSFinder);
          expect(viaSMSCheckBox.value, isFalse);
        },
      );

      testWidgets(
        'Test Page Fetch Failure Show SnackBar Error',
        (tester) async {
          final expectedState = [
            PrivacyConsentState.initial().copyWith(
              failureOrSuccessOption: optionOf(
                const Left(
                  fakeError,
                ),
              ),
            ),
          ];
          whenListen(
            privacyConsentBlocMock,
            Stream.fromIterable(expectedState),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final snackBarFinder = find.byKey(WidgetKeys.customSnackBar);
          expect(snackBarFinder, findsOneWidget);
        },
      );

      testWidgets(
        'Test  Submit Failure Show SnackBar Error',
        (tester) async {
          final expectedState = [
            PrivacyConsentState.initial().copyWith(
              submitFailureOrSuccessOption: optionOf(
                const Left(
                  fakeError,
                ),
              ),
            ),
          ];
          whenListen(
            privacyConsentBlocMock,
            Stream.fromIterable(expectedState),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final snackBarFinder = find.byKey(WidgetKeys.customSnackBar);
          expect(snackBarFinder, findsOneWidget);
        },
      );

      testWidgets(
        'Test  Submit Success Show SnackBar Success',
        (tester) async {
          final expectedState = [
            PrivacyConsentState.initial().copyWith(
              submitFailureOrSuccessOption: optionOf(
                const Right(true),
              ),
            ),
          ];
          whenListen(
            privacyConsentBlocMock,
            Stream.fromIterable(expectedState),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();

          //Testing success snack bar
          final snackBarFinder =
              find.byKey(WidgetKeys.privacyConsentSuccessSnackBar);

          final textFinder = find.descendant(
            of: snackBarFinder,
            matching: find.text('Privacy settings saved successfully'),
          );
          expect(textFinder, findsOneWidget);

          final textStyle =
              tester.widget<CustomSnackBar>(snackBarFinder).textStyle;

          expect(textStyle!.fontSize, 14);
          expect(
            textStyle.color,
            ZPColors.black,
          );
        },
      );

      testWidgets(
        'Test On Tap Automated Personalisation Checkbox Tile',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final checkBoxFinder =
              find.byKey(WidgetKeys.automatedPersonalisationTile);
          expect(checkBoxFinder, findsOneWidget);

          await tester.tap(checkBoxFinder);
          verify(
            () => privacyConsentBlocMock.add(
              const PrivacyConsentEvent.updateAutomatedPersonalisation(
                value: true,
              ),
            ),
          );
        },
      );

      testWidgets(
        'Test On Tap Via Email Checkbox Tile',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final checkBoxFinder = find.byKey(WidgetKeys.viaEmailTile);
          // Scroll until the target item is fully visible
          await tester.scrollUntilVisible(
            checkBoxFinder,
            500.0,
          );
          expect(checkBoxFinder, findsOneWidget);

          await tester.pumpAndSettle();

          await tester.tap(checkBoxFinder);
          verify(
            () => privacyConsentBlocMock.add(
              const PrivacyConsentEvent.updateViaEmail(
                value: true,
              ),
            ),
          );
        },
      );

      testWidgets(
        'Test On Tap Via Notification Checkbox Tile',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final checkBoxFinder = find.byKey(WidgetKeys.viaPushNotificationTile);
          // Scroll until the target item is fully visible
          await tester.scrollUntilVisible(
            checkBoxFinder,
            500.0,
          );
          expect(checkBoxFinder, findsOneWidget);

          await tester.pumpAndSettle();

          await tester.tap(checkBoxFinder);
          verify(
            () => privacyConsentBlocMock.add(
              const PrivacyConsentEvent.updateViaPushNotification(
                value: true,
              ),
            ),
          );
        },
      );

      testWidgets(
        'Test On Tap Via SMS Checkbox Tile',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final checkBoxFinder = find.byKey(WidgetKeys.viaSMSTile);
          // Scroll until the target item is fully visible
          await tester.scrollUntilVisible(
            checkBoxFinder,
            500.0,
          );
          expect(checkBoxFinder, findsOneWidget);

          await tester.pumpAndSettle();

          await tester.tap(checkBoxFinder);
          verify(
            () => privacyConsentBlocMock.add(
              const PrivacyConsentEvent.updateViaSMS(
                value: true,
              ),
            ),
          );
        },
      );

      testWidgets(
        'Test On Tap Clear Changes Button',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final clearButtonFinder =
              find.byKey(WidgetKeys.privacyConsentClearButton);

          await tester.tap(clearButtonFinder);
          verify(
            () => privacyConsentBlocMock.add(
              const PrivacyConsentEvent.clear(),
            ),
          );
        },
      );

      testWidgets(
        'Test On Tap Submit Button',
        (tester) async {
          when(() => privacyConsentBlocMock.state).thenReturn(
            PrivacyConsentState.initial().copyWith(
              currentPrivacyControl: newPrivacyControl,
              previousPrivacyControl: previousPrivacyControl,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final submitButtonFinder =
              find.byKey(WidgetKeys.privacyConsentSubmitButton);

          await tester.tap(submitButtonFinder);
          verify(
            () => privacyConsentBlocMock.add(
              const PrivacyConsentEvent.submit(),
            ),
          );
        },
      );
    },
  );
}

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/national_privacy_commission/national_privacy_commission_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/account/national_privacy_commission/national_privacy_commission_page.dart';
import 'package:ezrxmobile/presentation/core/png_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/mock_bloc.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../utils/widget_utils.dart';

class NationalPrivacyCommissionBlocMock extends MockBloc<
    NationalPrivacyCommissionEvent,
    NationalPrivacyCommissionState> implements NationalPrivacyCommissionBloc {}

void main() {
  late AppRouter autoRouterMock;
  late EligibilityBloc eligibilityBlocMock;
  late NationalPrivacyCommissionBloc nationalPrivacyCommissionBlocMock;
  final page = find.byKey(WidgetKeys.nationalPrivacyCommissionPage);
  final seal25Jul2024 =
      find.byKey(WidgetKeys.sealImage(PngImage.seal25Jul2024));
  final seal27Jul2024 =
      find.byKey(WidgetKeys.sealImage(PngImage.seal27Jul2024));
  final seal24Aug2024 =
      find.byKey(WidgetKeys.sealImage(PngImage.seal24Aug2024));
  final seal6Dec2024 = find.byKey(WidgetKeys.sealImage(PngImage.seal6Dec2024));
  final closeButton = find.byKey(WidgetKeys.closeButton);
  final saveButton = find.byKey(WidgetKeys.saveSealImages);

  setUpAll(() {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    eligibilityBlocMock = EligibilityBlocMock();
    nationalPrivacyCommissionBlocMock = NationalPrivacyCommissionBlocMock();
    locator.registerLazySingleton(() => AutoRouteMock());
    autoRouterMock = locator<AutoRouteMock>();
  });
  setUp(() {
    when(() => eligibilityBlocMock.state).thenReturn(
      EligibilityState.initial(),
    );
    when(() => nationalPrivacyCommissionBlocMock.state).thenReturn(
      NationalPrivacyCommissionState.initial(),
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
        BlocProvider<NationalPrivacyCommissionBloc>(
          create: (context) => nationalPrivacyCommissionBlocMock,
        ),
      ],
      child: const Scaffold(
        body: NationalPrivacyCommissionPage(),
      ),
    );
  }

  group('National Privacy Commission Page', () {
    testWidgets(
      'Test Page UI',
      (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(
          page,
          findsOneWidget,
        );
        expect(find.text('National Privacy Commission'.tr()), findsOneWidget);
        expect(
          find.text('Save the images and scan for more details'.tr()),
          findsOneWidget,
        );
        expect(
          saveButton,
          findsOneWidget,
        );

        expect(
          seal25Jul2024,
          findsOneWidget,
        );
        await tester.dragUntilVisible(
          seal27Jul2024,
          page,
          const Offset(0.0, -500),
        );
        expect(
          seal27Jul2024,
          findsOneWidget,
        );
        await tester.dragUntilVisible(
          seal24Aug2024,
          page,
          const Offset(0.0, -500),
        );
        expect(
          seal24Aug2024,
          findsOneWidget,
        );
        await tester.dragUntilVisible(
          seal6Dec2024,
          page,
          const Offset(0.0, -500),
        );
        expect(
          seal6Dec2024,
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'Test close button',
      (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        expect(
          closeButton,
          findsOneWidget,
        );
        await tester.tap(closeButton);
        verify(() => autoRouterMock.back()).called(1);
      },
    );

    testWidgets(
      'Test tap save button onSaving is true',
      (tester) async {
        when(() => nationalPrivacyCommissionBlocMock.state).thenReturn(
          NationalPrivacyCommissionState.initial().copyWith(isSaving: true),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        await tester.tap(saveButton);
        verifyNever(
          () => nationalPrivacyCommissionBlocMock.add(
            const NationalPrivacyCommissionEvent.saveImages(images: sealList),
          ),
        );
      },
    );

    testWidgets(
      'Test tap save button onSaving is false',
      (tester) async {
        whenListen(
          nationalPrivacyCommissionBlocMock,
          Stream.fromIterable([
            NationalPrivacyCommissionState.initial().copyWith(isSaving: true),
            NationalPrivacyCommissionState.initial(),
          ]),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        await tester.tap(saveButton);
        verify(
          () => nationalPrivacyCommissionBlocMock.add(
            const NationalPrivacyCommissionEvent.saveImages(images: sealList),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'Show error message when save images failed',
      (tester) async {
        whenListen(
          nationalPrivacyCommissionBlocMock,
          Stream.fromIterable([
            NationalPrivacyCommissionState.initial().copyWith(
              failureOrSuccessOption:
                  optionOf(const Left(ApiFailure.other('fake-error'))),
            ),
          ]),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        expect(
          find.descendant(
            of: find.byKey(WidgetKeys.customSnackBar),
            matching: find.text('fake-error'.tr()),
          ),
          findsOneWidget,
        );
      },
    );
  });
}

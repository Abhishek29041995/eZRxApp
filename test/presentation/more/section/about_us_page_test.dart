import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/about_us/about_us_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/about_us/entities/about_us.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/about_us/datasource/about_us_local.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/more/section/about_us/about_us_page.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:universal_io/io.dart';

import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';

class AboutUsBlocMock extends MockBloc<AboutUsEvent, AboutUsState>
    implements AboutUsBloc {}

class EligibilityBlockMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  late AboutUsBloc aboutUsBloc;
  late EligibilityBloc eligibilityBloc;
  final locator = GetIt.instance;
  late AppRouter appRouter;
  final eligibilityState = EligibilityState.initial().copyWith(
    salesOrganisation: fakeMYSalesOrganisation,
  );
  const defaultScrollOffset = Offset(0, -500);
  late AboutUs aboutUs;
  final aboutUsState = AboutUsState.initial();

  setUpAll(() async {
    HttpOverrides.global = null;
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(
      () => aboutUsBloc,
    );
    aboutUsBloc = AboutUsBlocMock();
    eligibilityBloc = EligibilityBlockMock();
    appRouter = AutoRouteMock();
    aboutUs = (await AboutUsLocalDataSource()
            .getAboutUsStaticInfo(fakeSGSalesOrg.aboutUsMockFile))
        .copyWith(
      banner: BannerTemplate.empty(),
      ourPartners: MediaListTemplate.empty(),
      certifications: SliderTemplate.empty()
          .copyWith(certificates: [Certifications.empty()]),
    );
    when(() => eligibilityBloc.state).thenReturn(
      eligibilityState,
    );
    when(() => aboutUsBloc.state).thenReturn(
      aboutUsState,
    );
  });
  Widget getWidgetToTest() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: appRouter,
      usingLocalization: true,
      providers: [
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBloc,
        ),
        BlocProvider<AboutUsBloc>(
          create: (context) => aboutUsBloc,
        ),
      ],
      child: const AboutUsPage(),
    );
  }

  group('Test about us page', () {
    testWidgets('Should show the loading when fetching', (tester) async {
      when(() => aboutUsBloc.state).thenReturn(
        aboutUsState.copyWith(isFetching: true),
      );
      await tester.pumpWidget(getWidgetToTest());
      await tester.pump();

      verify(
        () => aboutUsBloc.add(
          const AboutUsEvent.fetchAboutUsInfo(),
        ),
      ).called(1);

      expect(find.byKey(WidgetKeys.loaderImage), findsOneWidget);
    });
    testWidgets(
        'Should show the layout when fetching success with multiple partner',
        (tester) async {
      when(() => aboutUsBloc.state).thenReturn(
        aboutUsState.copyWith(isFetching: false, aboutUsInfo: aboutUs),
      );
      whenListen(
        aboutUsBloc,
        Stream.fromIterable([
          aboutUsState.copyWith(isFetching: true),
          aboutUsState.copyWith(
            isFetching: false,
            aboutUsInfo: aboutUs.copyWith(
              ourPartners: MediaListTemplate.empty()
                  .copyWith(mediaItems: [const MediaItem(url: 'fake-url')]),
            ),
          ),
        ]),
      );

      await tester.pumpWidget(getWidgetToTest());
      await tester.pump();

      expect(find.byKey(WidgetKeys.loaderImage), findsNothing);
      expect(find.byKey(WidgetKeys.aboutUsHeaderSection), findsOneWidget);
      expect(
        find.byKey(WidgetKeys.aboutUsCertificationsSection),
        findsOneWidget,
      );
      expect(find.byKey(WidgetKeys.aboutUsHeaderSection), findsOneWidget);

      // verify button on header section
      when(
        () => appRouter.push(
          ContactUsPageRoute(appMarket: aboutUsState.salesOrg.appMarket),
        ),
      ).thenAnswer((_) => Future.value());
      final buttonFinder = find.ancestor(
        of: find.text(aboutUs.banner.buttonName),
        matching: find.byType(ElevatedButton),
      );
      await tester.tap(buttonFinder);
      await tester.pumpAndSettle();
      verify(
        () => appRouter.push(
          ContactUsPageRoute(appMarket: aboutUsState.salesOrg.appMarket),
        ),
      ).called(1);

      expect(find.byKey(WidgetKeys.aboutUsWhoWeAreSection), findsOneWidget);
      await tester.dragUntilVisible(
        find.byKey(WidgetKeys.aboutUsOutPartnersSection),
        find.byKey(WidgetKeys.aboutUsListContent),
        defaultScrollOffset,
      );
      await tester.pump();

      expect(
        find.byKey(WidgetKeys.aboutUsOutPartnersSection),
        findsOneWidget,
      );
      // verify custom image display
      expect(find.byKey(WidgetKeys.imageBanner), findsOneWidget);
      await tester.dragUntilVisible(
        find.byKey(WidgetKeys.aboutUsReachUsSection),
        find.byKey(WidgetKeys.aboutUsListContent),
        defaultScrollOffset,
      );
      await tester.pump();
      expect(find.byKey(WidgetKeys.aboutUsReachUsSection), findsOneWidget);
    });
    testWidgets('Should show the empty layout when the info is empty',
        (tester) async {
      when(() => aboutUsBloc.state).thenReturn(
        aboutUsState.copyWith(isFetching: false, aboutUsInfo: AboutUs.empty()),
      );
      await tester.pumpWidget(getWidgetToTest());
      await tester.pump();

      expect(find.byKey(WidgetKeys.loaderImage), findsNothing);
      expect(find.byKey(WidgetKeys.aboutUsHeaderSection), findsNothing);
      expect(find.byKey(WidgetKeys.aboutUsCertificationsSection), findsNothing);
    });

    testWidgets('Should fetchAboutUsInfo when pull to refresh', (tester) async {
      when(() => aboutUsBloc.state).thenReturn(
        aboutUsState.copyWith(isFetching: false, aboutUsInfo: aboutUs),
      );
      whenListen(
        aboutUsBloc,
        Stream.fromIterable([
          aboutUsState.copyWith(isFetching: true),
          aboutUsState.copyWith(isFetching: false, aboutUsInfo: aboutUs),
        ]),
      );

      await tester.pumpWidget(getWidgetToTest());
      await tester.pump();

      expect(find.byKey(WidgetKeys.loaderImage), findsNothing);
      expect(find.byKey(WidgetKeys.aboutUsHeaderSection), findsOneWidget);
      expect(
        find.byKey(WidgetKeys.aboutUsCertificationsSection),
        findsOneWidget,
      );
      await tester.drag(
        find.byKey(WidgetKeys.aboutUsHeaderSection),
        const Offset(0.0, 1000.0),
      );
      await tester.pumpAndSettle();
      verify(
            () => aboutUsBloc.add(
              const AboutUsEvent.fetchAboutUsInfo(),
            ),
          ).callCount >
          0;
    });
    testWidgets('Should show error when api failure', (tester) async {
      when(() => aboutUsBloc.state).thenReturn(
        aboutUsState.copyWith(
          isFetching: false,
          apiFailureOrSuccessOption: optionOf(const Left(ApiFailure.other(''))),
        ),
      );

      whenListen(
        aboutUsBloc,
        Stream.fromIterable([
          aboutUsState.copyWith(
            isFetching: true,
            apiFailureOrSuccessOption: none(),
          ),
          aboutUsState.copyWith(
            isFetching: false,
            apiFailureOrSuccessOption: optionOf(
              const Left(ApiFailure.other('fake-error')),
            ),
          ),
        ]),
      );

      await tester.pumpWidget(getWidgetToTest());
      await tester.pumpAndSettle();
      expect(find.byKey(WidgetKeys.loaderImage), findsNothing);
      expect(find.byKey(WidgetKeys.aboutUsHeaderSection), findsNothing);
      expect(find.byKey(WidgetKeys.aboutUsCertificationsSection), findsNothing);
      expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
    });
    testWidgets('Should not show error when api fold right unit',
        (tester) async {
      whenListen(
        aboutUsBloc,
        Stream.fromIterable([
          aboutUsState.copyWith(
            isFetching: true,
            apiFailureOrSuccessOption: none(),
          ),
          aboutUsState.copyWith(
            isFetching: false,
            apiFailureOrSuccessOption: optionOf(const Right(unit)),
          ),
        ]),
      );
      await tester.pumpWidget(getWidgetToTest());
      await tester.pumpAndSettle();
      expect(find.byKey(WidgetKeys.customSnackBar), findsNothing);
    });
    testWidgets('Should show button scroll to top when scroll down',
        (tester) async {
      when(() => aboutUsBloc.state).thenReturn(
        aboutUsState.copyWith(isFetching: false, aboutUsInfo: aboutUs),
      );
      whenListen(
        aboutUsBloc,
        Stream.fromIterable([
          aboutUsState.copyWith(isFetching: true),
          aboutUsState.copyWith(isFetching: false, aboutUsInfo: aboutUs),
        ]),
      );

      await tester.pumpWidget(getWidgetToTest());
      await tester.pump();

      expect(find.byKey(WidgetKeys.loaderImage), findsNothing);
      expect(find.byKey(WidgetKeys.aboutUsHeaderSection), findsOneWidget);
      expect(
        find.byKey(WidgetKeys.aboutUsCertificationsSection),
        findsOneWidget,
      );
      await tester.drag(
        find.byKey(WidgetKeys.aboutUsHeaderSection),
        defaultScrollOffset,
      );
      await tester.pumpAndSettle();
      expect(find.byKey(WidgetKeys.scrollToTopFloatingButton), findsOneWidget);
    });
  });
}

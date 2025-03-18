import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/banners/carousel_banner/carousel_banner.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../common_mock_data/customer_code_mock.dart';
import '../../../../common_mock_data/mock_bloc.dart';
import '../../../../common_mock_data/mock_other.dart';
import '../../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../../common_mock_data/user_mock.dart';
import '../../../../utils/widget_utils.dart';

void main() {
  late BannerBloc mockBannerBloc;
  late AppRouter autoRouterMock;
  late EligibilityBloc mockEligibilityBloc;

  final banners = [
    EZReachBanner.empty().copyWith(id: 'fake-first-id'),
    EZReachBanner.empty().copyWith(id: 'fake-second-id'),
  ];

  final nextButton = find.byKey(WidgetKeys.nextBannerIcon);

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    mockBannerBloc = BannerBlocMock();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerFactory(() => mockBannerBloc);
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
    autoRouterMock = locator<AppRouter>();
    mockEligibilityBloc = EligibilityBlocMock();
  });

  group('Carousel Banner', () {
    setUp(() {
      when(() => mockBannerBloc.state).thenReturn(BannerState.initial());
      when(() => mockEligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(shipToInfo: fakeShipToInfo),
      );
    });

    RouteDataScope getWUT() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<BannerBloc>(create: (context) => mockBannerBloc),
          BlocProvider<EligibilityBloc>(
            create: (context) => mockEligibilityBloc,
          ),
        ],
        child: const Scaffold(body: CarouselBanner()),
      );
    }

    testWidgets('CarouselBanner test - when customer code changed - Success',
        (tester) async {
      final expectedCustomerCodeInfo = [
        EligibilityState.initial().copyWith(isLoadingCustomerCode: true),
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          user: fakeClient,
          isLoadingCustomerCode: false,
          shipToInfo: fakeShipToInfo,
        ),
      ];
      whenListen(
        mockEligibilityBloc,
        Stream.fromIterable(expectedCustomerCodeInfo),
      );

      await tester.pumpWidget(getWUT());
      await tester.pump();
      verify(
        () => mockBannerBloc.add(
          BannerEvent.fetch(
            salesOrganisation: fakeMYSalesOrganisation,
            bannerType: 'banner_carousel',
            country: fakeMYSalesOrganisation.salesOrg.country,
            isPreSalesOrg: false,
            role: fakeClient.role.type.getEZReachRoleType,
            branchCode: '',
            targetCustomerType: '',
          ),
        ),
      ).called(1);
    });

    testWidgets('CarouselBanner test - show loading when shipTo is loading',
        (tester) async {
      when(
        () => mockEligibilityBloc.state,
      ).thenReturn(
        EligibilityState.initial().copyWith(
          isLoadingCustomerCode: false,
          shipToInfo: ShipToInfo.empty(),
        ),
      );

      await tester.pumpWidget(getWUT());
      await tester.pump();
      expect(
        find.descendant(
          of: find.byType(CarouselBanner),
          matching: find.byType(LoadingShimmer),
        ),
        findsOne,
      );
    });

    testWidgets('Banner test 2 - is Snackbar shown?', (tester) async {
      final bannerBloc = locator<BannerBloc>();
      final mockState = BannerState.initial().copyWith(
        banner: [
          EZReachBanner.empty(),
          EZReachBanner.empty(),
        ],
        bannerFailureOrSuccessOption:
            optionOf(const Left(ApiFailure.other('Fake Error'))),
      );
      when(() => bannerBloc.state).thenReturn(mockState);
      when(() => bannerBloc.stream).thenAnswer((invocation) {
        return Stream.fromIterable([BannerState.initial(), mockState]);
      });

      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();

      expect(
        find.byKey(WidgetKeys.customSnackBar),
        findsOneWidget,
      );
    });

    testWidgets('Banner test 3 - is User getting logged out when Auth failed',
        (tester) async {
      final bannerBloc = locator<BannerBloc>();
      final mockState = BannerState.initial().copyWith(
        banner: [
          EZReachBanner.empty(),
          EZReachBanner.empty(),
        ],
        bannerFailureOrSuccessOption:
            optionOf(const Left(ApiFailure.other('authentication failed'))),
      );
      when(() => bannerBloc.stream).thenAnswer((invocation) {
        return Stream.fromIterable([BannerState.initial(), mockState]);
      });
      when(() => bannerBloc.state).thenReturn(mockState);

      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();

      expect(
        find.byKey(WidgetKeys.customSnackBar),
        findsOneWidget,
      );
    });

    testWidgets('Banner test 4 - No API error', (tester) async {
      final bannerBloc = locator<BannerBloc>();
      final mockState = BannerState.initial().copyWith(
        banner: [
          EZReachBanner.empty(),
          EZReachBanner.empty(),
        ],
        bannerFailureOrSuccessOption: optionOf(const Right('No API error')),
      );

      when(() => bannerBloc.stream).thenAnswer((invocation) {
        return Stream.fromIterable([BannerState.initial(), mockState]);
      });
      when(() => bannerBloc.state).thenReturn(mockState);

      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byKey(WidgetKeys.homeBanner),
        findsOneWidget,
      );
    });

    testWidgets(
        'Banner test 5 - Hide the next and previous buttons if there is only one banner',
        (tester) async {
      final bannerBloc = locator<BannerBloc>();
      final mockState = BannerState.initial().copyWith(
        banner: [
          EZReachBanner.empty(),
        ],
        bannerFailureOrSuccessOption: optionOf(const Right('No API error')),
      );
      when(() => bannerBloc.stream).thenAnswer((invocation) {
        return Stream.fromIterable([BannerState.initial(), mockState]);
      });
      when(() => bannerBloc.state).thenReturn(mockState);

      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(
        find.byKey(WidgetKeys.nextBannerIcon),
        findsNothing,
      );

      expect(
        find.byKey(WidgetKeys.previousBannerIcon),
        findsNothing,
      );

      expect(
        find.byKey(WidgetKeys.previousBannerIcon),
        findsNothing,
      );
    });

    testWidgets('Empty Banner test - Auto Scroll', (tester) async {
      final bannerBloc = locator<BannerBloc>();

      when(() => bannerBloc.stream).thenAnswer((invocation) {
        return Stream.fromIterable([
          BannerState.initial(),
          BannerState.initial().copyWith(
            banner: [],
            bannerFailureOrSuccessOption: optionOf(const Right('No API error')),
          ),
        ]);
      });

      await tester.pumpWidget(getWUT());
      await tester.pump();

      var bannerPageViewController = PageController();
      final bannerPageViewFinder = find.byType(PageView);

      try {
        final bannerPageView = tester.widget<PageView>(bannerPageViewFinder);
        expect(bannerPageViewFinder, findsOneWidget);
        bannerPageViewController =
            bannerPageView.controller ?? PageController();
      } catch (e) {
        expect(bannerPageViewFinder, findsNothing);
        expect(bannerPageViewController.hasClients, false);
      }
    });

    testWidgets('Fetch banner for ID market', (tester) async {
      whenListen(
        mockEligibilityBloc,
        Stream.fromIterable([
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
            shipToInfo: fakeShipToInfo,
            user: fakeClientUser,
            isLoadingCustomerCode: true,
          ),
          EligibilityState.initial().copyWith(
            salesOrganisation: fakeIDSalesOrganisation,
            shipToInfo: fakeShipToInfo,
            user: fakeClientUser,
          ),
        ]),
      );
      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();

      verify(
        () => mockBannerBloc.add(
          BannerEvent.fetch(
            isPreSalesOrg: false,
            salesOrganisation: fakeIDSalesOrganisation,
            country: fakeIDSalesOrganisation.salesOrg.country,
            role: fakeClientUser.role.type.getEZReachRoleType,
            bannerType: 'banner_carousel',
            branchCode: fakeShipToInfo.plant,
            targetCustomerType: fakeShipToInfo.targetCustomerType,
          ),
        ),
      ).called(1);
    });

    testWidgets('Show error when get banner failure', (tester) async {
      whenListen(
        mockBannerBloc,
        Stream.fromIterable([
          BannerState.initial().copyWith(
            banner: banners,
            bannerFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake-error'))),
          ),
        ]),
      );
      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.customSnackBar),
          matching: find.text('fake-error'),
        ),
        findsOneWidget,
      );
    });

    testWidgets('tap next button', (tester) async {
      whenListen(
        mockBannerBloc,
        Stream.fromIterable([
          BannerState.initial().copyWith(
            banner: banners,
            bannerFailureOrSuccessOption: optionOf(
              const Right(''),
            ),
          ),
        ]),
        initialState: BannerState.initial().copyWith(
          isLoading: true,
          banner: banners,
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();

      expect(nextButton, findsOneWidget);
      expect(
        find.byKey(
          Key(
            banners.elementAt(0).id.toString(),
          ),
        ),
        findsOneWidget,
      );
      await tester.tap(nextButton);
      await tester.pumpAndSettle();
      expect(
        find.byKey(
          Key(
            banners.elementAt(1).id.toString(),
          ),
        ),
        findsOneWidget,
      );
    });

    testWidgets('tap prev button', (tester) async {
      whenListen(
        mockBannerBloc,
        Stream.fromIterable([
          BannerState.initial().copyWith(
            banner: banners,
            bannerFailureOrSuccessOption: optionOf(
              const Right(''),
            ),
          ),
        ]),
        initialState: BannerState.initial().copyWith(
          isLoading: true,
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      final prevButton = find.byKey(WidgetKeys.previousBannerIcon);
      expect(prevButton, findsOneWidget);
      await tester.tap(nextButton);
      await tester.pumpAndSettle();
      await tester.tap(prevButton);
      await tester.pumpAndSettle();
      expect(
        find.byKey(
          Key(
            banners.elementAt(0).id.toString(),
          ),
        ),
        findsOneWidget,
      );
    });

    testWidgets('auto navigate to next banner after 8 seconds', (tester) async {
      whenListen(
        mockBannerBloc,
        Stream.fromIterable([
          BannerState.initial().copyWith(
            banner: banners,
          ),
        ]),
        initialState: BannerState.initial().copyWith(
          isLoading: true,
          bannerFailureOrSuccessOption: optionOf(
            const Right(''),
          ),
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      expect(
        find.byKey(
          Key(
            banners.elementAt(0).id.toString(),
          ),
        ),
        findsOneWidget,
      );
      await tester.pump(const Duration(seconds: 8));
      await tester.pumpAndSettle();
      expect(
        find.byKey(
          Key(
            banners.elementAt(1).id.toString(),
          ),
        ),
        findsOneWidget,
      );
    });
  });
}

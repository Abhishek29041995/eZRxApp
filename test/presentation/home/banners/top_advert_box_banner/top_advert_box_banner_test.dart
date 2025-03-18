import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/home/banners/top_advert_box_banner/top_advert_box_banner.dart';
import 'package:ezrxmobile/presentation/home/banners/top_advert_box_banner/top_advert_box_banner_tile.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../common_mock_data/mock_bloc.dart';
import '../../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../../common_mock_data/user_mock.dart';
import '../../../../utils/widget_utils.dart';

void main() {
  late BannerBloc mockBannerBloc;
  late AppRouter autoRouterMock;
  late CustomerCodeBloc mockCustomerCodeBloc;
  late EligibilityBloc mockEligibilityBloc;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockEligibilityBloc = EligibilityBlocMock();
    mockBannerBloc = BannerBlocMock();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => mockEligibilityBloc);
    locator.registerFactory(() => mockBannerBloc);
    locator.registerLazySingleton(() => mockCustomerCodeBloc);
    locator.registerLazySingleton(
      () => MixpanelService(config: locator<Config>()),
    );
    autoRouterMock = locator<AppRouter>();
    mockCustomerCodeBloc = CustomerCodeBlocMock();
  });

  group('Carousel Banner', () {
    setUp(() {
      when(() => mockBannerBloc.state).thenReturn(BannerState.initial());
      when(() => mockEligibilityBloc.state)
          .thenReturn(EligibilityState.initial());
      when(() => mockCustomerCodeBloc.state)
          .thenReturn(CustomerCodeState.initial());
    });

    RouteDataScope getWUT({bool isMobile = true}) {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<BannerBloc>(create: (context) => mockBannerBloc),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => mockCustomerCodeBloc,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => mockEligibilityBloc,
          ),
        ],
        child: MediaQuery(
          data: MediaQueryData(size: Size(isMobile ? 480 : 500, 900)),
          child: const Material(child: TopAdvertBoxBanner()),
        ),
      );
    }

    testWidgets('Banner test - when customer code changed - Success',
        (tester) async {
      final expectedCustomerCodeInfo = [
        EligibilityState.initial().copyWith(isLoadingCustomerCode: true),
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          user: fakeClient,
        ),
      ];
      whenListen(
        mockEligibilityBloc,
        Stream.fromIterable(expectedCustomerCodeInfo),
      );

      when(() => mockBannerBloc.state).thenAnswer(
        (_) => BannerState.initial().copyWith(
          banner: [EZReachBanner.empty()],
        ),
      );

      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      verify(
        () => mockBannerBloc.add(
          BannerEvent.fetch(
            salesOrganisation: fakeMYSalesOrganisation,
            bannerType: 'top_advert_box',
            country: fakeMYSalesOrganisation.salesOrg.country,
            isPreSalesOrg: false,
            role: fakeClient.role.type.getEZReachRoleType,
            targetCustomerType: '',
            branchCode: '',
          ),
        ),
      ).called(1);
    });

    testWidgets('Banner test - Show banner for non mobile device',
        (tester) async {
      whenListen(
        mockBannerBloc,
        Stream.fromIterable([
          BannerState.initial().copyWith(
            banner: [EZReachBanner.empty()],
          ),
        ]),
      );

      await tester.pumpWidget(getWUT(isMobile: false));
      await tester.pumpAndSettle();
      expect(find.byType(TopAdvertBoxBannerTile), findsOneWidget);
    });
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_customer_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/banner/repository/banner_repository.dart';

import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockBannerBloc extends MockBloc<BannerEvent, BannerState>
    implements BannerBloc {}

class MockBannerRepository extends Mock implements BannerRepository {}

void main() {
  late GetIt locator;
  late BannerRepository mockBannerRepository;

  final mockSalesOrg = SalesOrg('mock-salesOrg');
  final salesOrg2601 = SalesOrg('2601');
  const role = 'customer';
  const country = 'SG';
  final mockSalesOrganisation = SalesOrganisation(
    salesOrg: mockSalesOrg,
    customerInfos: <SalesOrgCustomerInfo>[],
  );
  final salesOrganisation2601 = SalesOrganisation(
    salesOrg: salesOrg2601,
    customerInfos: <SalesOrgCustomerInfo>[],
  );

  const fakeBranchCode = 'fake-branch-code';
  const fakeTargetCustomerType = 'fake-target-customer-type';

  setUpAll(() {
    locator = GetIt.instance;
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton<HttpService>(
      () => HttpService(
        config: locator<Config>(),
        interceptors: [],
      ),
    );
    mockBannerRepository = MockBannerRepository();
  });

  group('Banner Bloc Test Group 1', () {
    blocTest<BannerBloc, BannerState>(
      'Init Banner Bloc and raise event Initialized',
      build: () => BannerBloc(
        bannerRepository: mockBannerRepository,
      ),
      setUp: () {},
      act: (bloc) {
        bloc.add(const BannerEvent.initialized());
      },
      expect: () => [BannerState.initial()],
    );

    blocTest<BannerBloc, BannerState>(
      'Simulate error during fetch banner',
      build: () => BannerBloc(
        bannerRepository: mockBannerRepository,
      ),
      setUp: () {
        when(
          () => mockBannerRepository.getEZReachBanner(
            salesOrganisation: mockSalesOrganisation,
            country: country,
            role: role,
            bannerType: 'banner_carousel',
            branchCode: fakeBranchCode,
            targetCustomerType: fakeTargetCustomerType,
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('mock-error')),
        );
      },
      act: (bloc) {
        bloc.add(
          BannerEvent.fetch(
            isPreSalesOrg: false,
            salesOrganisation: mockSalesOrganisation,
            role: role,
            country: country,
            bannerType: 'banner_carousel',
            branchCode: fakeBranchCode,
            targetCustomerType: fakeTargetCustomerType,
          ),
        );
      },
      expect: () => [
        BannerState.initial().copyWith(
          bannerFailureOrSuccessOption: none(),
          isLoading: true,
        ),
        BannerState.initial().copyWith(
          bannerFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('mock-error'))),
        ),
      ],
    );

    blocTest<BannerBloc, BannerState>(
      'Simulate successful fetch banner',
      build: () => BannerBloc(
        bannerRepository: mockBannerRepository,
      ),
      setUp: () {
        when(
          () => mockBannerRepository.getEZReachBanner(
            salesOrganisation: salesOrganisation2601,
            country: country,
            role: role,
            bannerType: 'banner_carousel',
            branchCode: fakeBranchCode,
            targetCustomerType: fakeTargetCustomerType,
          ),
        ).thenAnswer(
          (invocation) async => Right([EZReachBanner.empty()]),
        );
      },
      act: (bloc) {
        bloc.add(
          BannerEvent.fetch(
            isPreSalesOrg: false,
            salesOrganisation: salesOrganisation2601,
            role: role,
            country: country,
            bannerType: 'banner_carousel',
            branchCode: fakeBranchCode,
            targetCustomerType: fakeTargetCustomerType,
          ),
        );
      },
      expect: () => [
        BannerState.initial().copyWith(
          bannerFailureOrSuccessOption: none(),
          isLoading: true,
        ),
        BannerState.initial().copyWith(
          banner: [
            EZReachBanner.empty(),
          ],
          bannerFailureOrSuccessOption: none(),
        ),
      ],
    );

    blocTest<BannerBloc, BannerState>(
      'Test BannerBlocStream for SalesOrgState.initial',
      build: () => BannerBloc(
        bannerRepository: mockBannerRepository,
      ),
      setUp: () {
        when(
          () => mockBannerRepository.getEZReachBanner(
            salesOrganisation: mockSalesOrganisation,
            country: country,
            role: role,
            bannerType: 'banner_carousel',
            branchCode: fakeBranchCode,
            targetCustomerType: fakeTargetCustomerType,
          ),
        ).thenAnswer(
          (invocation) async => Right([EZReachBanner.empty()]),
        );
      },
      act: (bloc) {
        bloc.add(
          BannerEvent.fetch(
            isPreSalesOrg: false,
            salesOrganisation: mockSalesOrganisation,
            role: role,
            country: country,
            bannerType: 'banner_carousel',
            branchCode: fakeBranchCode,
            targetCustomerType: fakeTargetCustomerType,
          ),
        );
      },
      expect: () => [
        BannerState.initial().copyWith(
          isLoading: true,
        ),
        BannerState.initial().copyWith(
          banner: [
            EZReachBanner.empty(),
          ],
        ),
      ],
    );

    test('hasMultipleBanners getter', () {
      expect(
        BannerState.initial().copyWith(
          banner: [EZReachBanner.empty(), EZReachBanner.empty()],
        ).hasMultipleBanners,
        true,
      );

      expect(
        BannerState.initial().copyWith(
          banner: [EZReachBanner.empty()],
        ).hasMultipleBanners,
        false,
      );

      expect(
        BannerState.initial().hasMultipleBanners,
        false,
      );
    });
  });
}

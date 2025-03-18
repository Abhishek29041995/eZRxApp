import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_filter_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_filter_repository.dart';
import 'package:ezrxmobile/presentation/products/widgets/enum_material_filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class MaterialFilterRepositoryMock extends Mock
    implements MaterialFilterRepository {}

class MaterialFilterMockBloc
    extends MockBloc<MaterialFilterEvent, MaterialFilterState>
    implements MaterialFilterBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MaterialFilterRepository materialFilterRepositoryMock;
  late MaterialFilter materialFilterMockData;
  late MaterialFilter materialActiveFilterMockData;
  var filterState = MaterialFilterState.initial();
  final fakeShipToInfo = ShipToInfo.empty().copyWith(
    shipToCustomerCode: 'fake-1234',
  );
  final fakeCountryFilterKey = MaterialFilterCountry.empty();
  const fakeManufacturedFilterKey = 'fake-manufactured-key';
  const fakeFavoriteFilterKey = true;
  const fakeFOCMaterialFilterKey = true;
  const fakeBundleOffersFilterKey = true;
  const fakeProductOffersFilterKey = true;
  const fakeSortByFilterKey = Sort.za;
  const fakeMarketPlaceFilterKey = true;
  const fakeTenderContractFilterKey = true;
  const fakeComboOfferFilterKey = true;

  group('Material Filter Bloc', () {
    setUp(() async {
      materialFilterRepositoryMock = MaterialFilterRepositoryMock();
      materialFilterMockData =
          await MaterialFilterLocalDataSource().getFilters();
      final manufactureMap = Map<String, bool>.from(
        materialFilterMockData.manufactureMapOptions,
      );
      final countryMap = Map<MaterialFilterCountry, bool>.from(
        materialFilterMockData.countryMapOptions,
      );
      final manufactureSelectedList = <String>[];
      final countrySelectedList = <MaterialFilterCountry>[];
      if (manufactureMap.isNotEmpty) {
        manufactureSelectedList.add(manufactureMap.entries.first.key);
      }
      if (countryMap.isNotEmpty) {
        countrySelectedList.add(countryMap.entries.first.key);
      }
      materialActiveFilterMockData = materialFilterMockData.copyWith(
        manufactureListSelected: manufactureSelectedList,
        countryListSelected: countrySelectedList,
      );
      WidgetsFlutterBinding.ensureInitialized();
    });

    blocTest(
      'Initialize',
      build: () => MaterialFilterBloc(
        materialFilterRepository: materialFilterRepositoryMock,
      ),
      act: (MaterialFilterBloc bloc) => bloc.add(
        const MaterialFilterEvent.initialized(),
      ),
      expect: () => [MaterialFilterState.initial()],
    );

    blocTest(
      'Material Filter Fetch success',
      build: () => MaterialFilterBloc(
        materialFilterRepository: materialFilterRepositoryMock,
      ),
      setUp: () {
        when(
          () => materialFilterRepositoryMock.getMaterialFilterList(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeShipToInfo,
            user: fakeClient,
            searchKey: '',
          ),
        ).thenAnswer(
          (invocation) async => Right(
            materialFilterMockData,
          ),
        );
      },
      act: (MaterialFilterBloc bloc) => bloc.add(
        MaterialFilterEvent.fetch(
          salesOrganisation: fakeMYSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClient,
          hasAccessToCovidMaterial: false,
        ),
      ),
      expect: () => [
        MaterialFilterState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          apiFailureOrSuccessOption: none(),
          isFetching: true,
        ),
        MaterialFilterState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          materialFilter: materialFilterMockData,
          apiFailureOrSuccessOption: none(),
          isFetching: false,
        ),
      ],
    );

    blocTest(
      'Material Filter Fetch fail',
      build: () => MaterialFilterBloc(
        materialFilterRepository: materialFilterRepositoryMock,
      ),
      setUp: () {
        when(
          () => materialFilterRepositoryMock.getMaterialFilterList(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeMYSalesOrganisation,
            shipToInfo: fakeShipToInfo,
            user: fakeClient,
            searchKey: '',
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      act: (MaterialFilterBloc bloc) => bloc.add(
        MaterialFilterEvent.fetch(
          salesOrganisation: fakeMYSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          user: fakeClient,
          hasAccessToCovidMaterial: false,
        ),
      ),
      expect: () => [
        MaterialFilterState.initial().copyWith(
          isFetching: true,
          salesOrganisation: fakeMYSalesOrganisation,
        ),
        MaterialFilterState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          isFetching: false,
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ],
    );

    blocTest(
      'Selected Material Filter Country',
      build: () => MaterialFilterBloc(
        materialFilterRepository: materialFilterRepositoryMock,
      ),
      seed: () => filterState,
      act: (MaterialFilterBloc bloc) => bloc.add(
        MaterialFilterEvent.updateSelectedMaterialFilter(
          MaterialFilterType.countryList,
          fakeCountryFilterKey,
        ),
      ),
      expect: () {
        final materialFilterCountry = Map<MaterialFilterCountry, bool>.from(
          filterState.materialFilter.countryMapOptions,
        );

        materialFilterCountry[fakeCountryFilterKey] =
            !(materialFilterCountry[fakeCountryFilterKey] ?? false);

        return [
          MaterialFilterState.initial().copyWith(
            materialFilter: filterState.materialFilter.copyWith(
              countryMapOptions: materialFilterCountry,
              countryListSelected: materialFilterCountry.entries
                  .where((element) => element.value)
                  .map((e) => e.key)
                  .toList(),
            ),
          ),
        ];
      },
    );

    blocTest(
      'Selected Material Filter Manufactured',
      build: () => MaterialFilterBloc(
        materialFilterRepository: materialFilterRepositoryMock,
      ),
      seed: () => filterState,
      act: (MaterialFilterBloc bloc) => bloc.add(
        const MaterialFilterEvent.updateSelectedMaterialFilter(
          MaterialFilterType.manufactured,
          fakeManufacturedFilterKey,
        ),
      ),
      expect: () {
        final materialFilterManufacture = Map<String, bool>.from(
          filterState.materialFilter.manufactureMapOptions,
        );

        materialFilterManufacture[fakeManufacturedFilterKey] =
            !(materialFilterManufacture[fakeManufacturedFilterKey] ?? false);

        return [
          MaterialFilterState.initial().copyWith(
            materialFilter: filterState.materialFilter.copyWith(
              manufactureMapOptions: materialFilterManufacture,
              manufactureListSelected: materialFilterManufacture.entries
                  .where((element) => element.value)
                  .map((e) => e.key)
                  .toList(),
            ),
          ),
        ];
      },
    );

    blocTest(
      'Selected Material Filter Favourite',
      build: () => MaterialFilterBloc(
        materialFilterRepository: materialFilterRepositoryMock,
      ),
      seed: () => filterState,
      act: (MaterialFilterBloc bloc) => bloc.add(
        const MaterialFilterEvent.updateSelectedMaterialFilter(
          MaterialFilterType.isFavourite,
          fakeFavoriteFilterKey,
        ),
      ),
      expect: () => [
        MaterialFilterState.initial().copyWith(
          materialFilter: filterState.materialFilter
              .copyWith(isFavourite: fakeFavoriteFilterKey),
        ),
      ],
    );

    blocTest(
      'Selected Material Filter FOCMaterial',
      build: () => MaterialFilterBloc(
        materialFilterRepository: materialFilterRepositoryMock,
      ),
      seed: () => filterState,
      act: (MaterialFilterBloc bloc) => bloc.add(
        const MaterialFilterEvent.updateSelectedMaterialFilter(
          MaterialFilterType.isCovidSelected,
          fakeFOCMaterialFilterKey,
        ),
      ),
      expect: () => [
        MaterialFilterState.initial().copyWith(
          materialFilter: filterState.materialFilter
              .copyWith(isCovidSelected: fakeFOCMaterialFilterKey),
        ),
      ],
    );

    blocTest(
      'Selected Material Filter Bundle Offers',
      build: () => MaterialFilterBloc(
        materialFilterRepository: materialFilterRepositoryMock,
      ),
      seed: () => filterState,
      act: (MaterialFilterBloc bloc) => bloc.add(
        const MaterialFilterEvent.updateSelectedMaterialFilter(
          MaterialFilterType.bundleOffers,
          fakeBundleOffersFilterKey,
        ),
      ),
      expect: () => [
        MaterialFilterState.initial().copyWith(
          materialFilter: filterState.materialFilter
              .copyWith(bundleOffers: fakeBundleOffersFilterKey),
        ),
      ],
    );

    blocTest(
      'Selected Material Filter Product Offers',
      build: () => MaterialFilterBloc(
        materialFilterRepository: materialFilterRepositoryMock,
      ),
      seed: () => filterState,
      act: (MaterialFilterBloc bloc) => bloc.add(
        const MaterialFilterEvent.updateSelectedMaterialFilter(
          MaterialFilterType.productOffers,
          fakeProductOffersFilterKey,
        ),
      ),
      expect: () => [
        MaterialFilterState.initial().copyWith(
          materialFilter: filterState.materialFilter
              .copyWith(isProductOffer: fakeProductOffersFilterKey),
        ),
      ],
    );

    blocTest(
      'Selected Material Filter Is Market Place',
      build: () => MaterialFilterBloc(
        materialFilterRepository: materialFilterRepositoryMock,
      ),
      seed: () => filterState,
      act: (MaterialFilterBloc bloc) => bloc.add(
        const MaterialFilterEvent.updateSelectedMaterialFilter(
          MaterialFilterType.isMarketPlace,
          fakeMarketPlaceFilterKey,
        ),
      ),
      expect: () => [
        MaterialFilterState.initial().copyWith(
          materialFilter: filterState.materialFilter
              .copyWith(isMarketPlace: fakeMarketPlaceFilterKey),
        ),
      ],
    );

    blocTest(
      'Selected Material Filter Sort',
      build: () => MaterialFilterBloc(
        materialFilterRepository: materialFilterRepositoryMock,
      ),
      seed: () => filterState,
      act: (MaterialFilterBloc bloc) => bloc.add(
        const MaterialFilterEvent.updateSelectedMaterialFilter(
          MaterialFilterType.sortBy,
          fakeSortByFilterKey,
        ),
      ),
      expect: () => [
        MaterialFilterState.initial().copyWith(
          materialFilter:
              filterState.materialFilter.copyWith(sortBy: fakeSortByFilterKey),
        ),
      ],
    );

    blocTest(
      'Update Search Key',
      build: () => MaterialFilterBloc(
        materialFilterRepository: materialFilterRepositoryMock,
      ),
      seed: () => filterState,
      act: (MaterialFilterBloc bloc) => bloc.add(
        const MaterialFilterEvent.updateSearchKey('fake-search-key'),
      ),
      expect: () => [
        MaterialFilterState.initial().copyWith(
          searchKey: SearchKey.search('fake-search-key'),
        ),
      ],
    );

    blocTest(
      'Init Selected Material Filter',
      build: () => MaterialFilterBloc(
        materialFilterRepository: materialFilterRepositoryMock,
      ),
      seed: () {
        final manufactureMap = Map<String, bool>.from(
          materialActiveFilterMockData.manufactureMapOptions,
        );
        manufactureMap.updateAll((key, value) => value = false);
        final countryMap = Map<MaterialFilterCountry, bool>.from(
          materialActiveFilterMockData.countryMapOptions,
        );
        countryMap.updateAll((key, value) => value = false);
        filterState = MaterialFilterState.initial().copyWith(
          materialFilter: materialActiveFilterMockData.copyWith(
            manufactureMapOptions: manufactureMap,
            countryMapOptions: countryMap,
          ),
        );
        return filterState;
      },
      act: (MaterialFilterBloc bloc) => bloc.add(
        MaterialFilterEvent.initSelectedMaterialFilter(
          materialActiveFilterMockData,
        ),
      ),
      expect: () {
        final manufactureMap = Map<String, bool>.from(
          filterState.materialFilter.manufactureMapOptions,
        );
        manufactureMap.updateAll((key, value) => value = false);

        final countryMap = Map<MaterialFilterCountry, bool>.from(
          filterState.materialFilter.countryMapOptions,
        );
        countryMap.updateAll((key, value) => value = false);

        for (final element
            in materialActiveFilterMockData.manufactureListSelected) {
          manufactureMap[element] = true;
        }
        for (final element
            in materialActiveFilterMockData.countryListSelected) {
          countryMap[element] = true;
        }
        return [
          MaterialFilterState.initial().copyWith(
            materialFilter: filterState.materialFilter.copyWith(
              isFavourite: materialActiveFilterMockData.isFavourite,
              sortBy: materialActiveFilterMockData.sortBy,
              bundleOffers: materialActiveFilterMockData.bundleOffers,
              isProductOffer: materialActiveFilterMockData.isProductOffer,
              isMarketPlace: materialActiveFilterMockData.isMarketPlace,
              manufactureMapOptions: manufactureMap,
              countryMapOptions: countryMap,
              manufactureListSelected:
                  materialActiveFilterMockData.manufactureListSelected,
              countryListSelected:
                  materialActiveFilterMockData.countryListSelected,
            ),
          ),
        ];
      },
    );

    blocTest(
      'Reset Filter',
      build: () => MaterialFilterBloc(
        materialFilterRepository: materialFilterRepositoryMock,
      ),
      seed: () {
        filterState = MaterialFilterState.initial().copyWith(
          materialFilter: materialFilterMockData.copyWith(
            brandList: [
              'fake-brand',
            ],
          ),
        );
        return filterState;
      },
      act: (MaterialFilterBloc bloc) => bloc.add(
        const MaterialFilterEvent.resetFilter(),
      ),
      expect: () {
        final manufactureMap = Map<String, bool>.from(
          filterState.materialFilter.manufactureMapOptions,
        );
        manufactureMap.updateAll((key, value) => value = false);

        final countryMap = Map<MaterialFilterCountry, bool>.from(
          filterState.materialFilter.countryMapOptions,
        );
        countryMap.updateAll((key, value) => value = false);

        return [
          MaterialFilterState.initial().copyWith(
            materialFilter: MaterialFilter.empty().copyWith(
              manufactureMapOptions: manufactureMap,
              countryMapOptions: countryMap,
            ),
          ),
        ];
      },
    );

    blocTest(
      'Selected Material Filter Tender Contract',
      build: () => MaterialFilterBloc(
        materialFilterRepository: materialFilterRepositoryMock,
      ),
      seed: () => filterState,
      act: (MaterialFilterBloc bloc) => bloc.add(
        const MaterialFilterEvent.updateSelectedMaterialFilter(
          MaterialFilterType.isTender,
          fakeTenderContractFilterKey,
        ),
      ),
      expect: () => [
        MaterialFilterState.initial().copyWith(
          materialFilter: filterState.materialFilter
              .copyWith(isTender: fakeTenderContractFilterKey),
        ),
      ],
    );

    blocTest(
      'Selected Material Filter Combo Offers',
      build: () => MaterialFilterBloc(
        materialFilterRepository: materialFilterRepositoryMock,
      ),
      seed: () => filterState,
      act: (MaterialFilterBloc bloc) => bloc.add(
        const MaterialFilterEvent.updateSelectedMaterialFilter(
          MaterialFilterType.comboOffers,
          fakeComboOfferFilterKey,
        ),
      ),
      expect: () => [
        MaterialFilterState.initial().copyWith(
          materialFilter: filterState.materialFilter
              .copyWith(comboOffers: fakeComboOfferFilterKey),
        ),
      ],
    );

    test('Test Display Material Filter', () {
      final materialFilterBloc = MaterialFilterBloc(
        materialFilterRepository: materialFilterRepositoryMock,
      );
      materialFilterBloc.emit(
        MaterialFilterState.initial().copyWith(
          materialFilter: materialFilterMockData,
        ),
      );
      final materialFilter = MaterialFilter(
        manufactureMapOptions: Map<String, bool>.fromEntries(
          materialFilterBloc.state.materialFilter.manufactureMapOptions.entries
              .where(
            (element) => element.key.toLowerCase().contains(
                  materialFilterBloc.state.searchKey.getValue().toLowerCase(),
                ),
          ),
        ),
        countryMapOptions: Map<MaterialFilterCountry, bool>.fromEntries(
          materialFilterBloc.state.materialFilter.countryMapOptions.entries
              .where(
            (element) => element.key.name.toLowerCase().contains(
                  materialFilterBloc.state.searchKey.getValue().toLowerCase(),
                ),
          ),
        ),
        brandList: <String>[],
      );
      expect(materialFilterBloc.state.displayMaterialFilter, materialFilter);
    });

    test('Get sort filter list by default', () {
      expect(
        MaterialFilterState.initial().displaySortFilter,
        [Sort.az, Sort.za],
      );
    });

    test('Get sort filter in ID market', () {
      final state = MaterialFilterState.initial()
          .copyWith(salesOrganisation: fakeIDSalesOrganisation);
      expect(state.displaySortFilter, Sort.values);
    });
  });
}

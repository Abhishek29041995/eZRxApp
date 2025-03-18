import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/returns/new_request/return_items/return_items_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_items_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material_list.dart';
import 'package:ezrxmobile/domain/returns/entities/return_materials_params.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_local.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_request_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class _ReturnRequestRepositoryMock extends Mock
    implements ReturnRequestRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late ReturnRequestRepository repositoryMock;
  late Config config;
  late ReturnMaterialList fakeReturnMaterialList;
  late ReturnItemsFilter fakeReturnItemsFilter;
  late ReturnItemsState initState;
  final fakeSearchKey = SearchKey.search('fake-search-key');

  setUpAll(() async {
    initState = ReturnItemsState.initial().copyWith(
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: fakeSalesOrganisation,
      shipToInfo: fakeShipToInfo,
      user: fakeUserWithLanguageCode,
      appliedFilter: ReturnItemsFilter.init(),
    );
    fakeReturnItemsFilter = ReturnItemsFilter.empty();

    fakeReturnMaterialList =
        await ReturnRequestLocalDataSource().searchReturnMaterials();
  });
  group('Return Items Bloc Testing=>', () {
    setUp(() {
      repositoryMock = _ReturnRequestRepositoryMock();
      config = Config()..appFlavor = Flavor.mock;
    });

    blocTest<ReturnItemsBloc, ReturnItemsState>(
      'For "initialized" Event',
      build: () => ReturnItemsBloc(
        newRequestRepository: repositoryMock,
        config: config,
      ),
      setUp: () {
        when(
          () => repositoryMock.searchReturnMaterials(
            requestParams: ReturnMaterialsParams(
              salesOrg: initState.salesOrganisation.salesOrg,
              soldToInfo: initState.customerCodeInfo.customerCodeSoldTo,
              shipToInfo: initState.shipToInfo.shipToCustomerCode,
              pageSize: config.pageSize,
              offset: 0,
              filter: ReturnItemsFilter.init(),
              searchKey: SearchKey.empty(),
              language: initState.user.preferredLanguage.languageCode,
              user: fakeUserWithLanguageCode,
            ),
          ),
        ).thenAnswer(
          (invocation) async => Right(fakeReturnMaterialList),
        );
      },
      act: (ReturnItemsBloc bloc) => bloc.add(
        ReturnItemsEvent.initialized(
          customerCodeInfo: initState.customerCodeInfo,
          salesOrganisation: initState.salesOrganisation,
          shipToInfo: initState.shipToInfo,
          user: initState.user,
        ),
      ),
      expect: () => [
        initState,
        initState.copyWith(
          isLoading: true,
          appliedFilter: ReturnItemsFilter.init(),
          searchKey: SearchKey.empty(),
        ),
        initState.copyWith(
          canLoadMore: false,
          appliedFilter: ReturnItemsFilter.init(),
          searchKey: SearchKey.empty(),
          items: fakeReturnMaterialList.items,
        ),
      ],
    );

    blocTest<ReturnItemsBloc, ReturnItemsState>(
      'For "fetch" Event with same filter and search key',
      build: () => ReturnItemsBloc(
        newRequestRepository: repositoryMock,
        config: config,
      ),
      seed: () => initState.copyWith(
        appliedFilter: fakeReturnItemsFilter,
        searchKey: fakeSearchKey,
      ),
      act: (bloc) => bloc.add(
        ReturnItemsEvent.fetch(
          appliedFilter: fakeReturnItemsFilter,
          searchKey: fakeSearchKey,
        ),
      ),
      expect: () => [],
    );

    blocTest<ReturnItemsBloc, ReturnItemsState>(
      'For "fetch" Event with success',
      seed: () => initState,
      build: () => ReturnItemsBloc(
        newRequestRepository: repositoryMock,
        config: config,
      ),
      setUp: () {
        when(
          () => repositoryMock.searchReturnMaterials(
            requestParams: ReturnMaterialsParams(
              salesOrg: initState.salesOrganisation.salesOrg,
              soldToInfo: initState.customerCodeInfo.customerCodeSoldTo,
              shipToInfo: initState.shipToInfo.shipToCustomerCode,
              pageSize: config.pageSize,
              offset: 0,
              filter: fakeReturnItemsFilter,
              searchKey: SearchKey.empty(),
              language: initState.user.preferredLanguage.languageCode,
              user: fakeUserWithLanguageCode,
            ),
          ),
        ).thenAnswer(
          (invocation) async => Right(fakeReturnMaterialList),
        );
      },
      act: (bloc) => bloc.add(
        ReturnItemsEvent.fetch(
          appliedFilter: fakeReturnItemsFilter,
          searchKey: SearchKey.empty(),
        ),
      ),
      expect: () => [
        initState.copyWith(
          isLoading: true,
          appliedFilter: fakeReturnItemsFilter,
          searchKey: SearchKey.empty(),
        ),
        initState.copyWith(
          canLoadMore: false,
          appliedFilter: fakeReturnItemsFilter,
          searchKey: SearchKey.empty(),
          items: fakeReturnMaterialList.items,
        ),
      ],
    );

    blocTest<ReturnItemsBloc, ReturnItemsState>(
      'For "fetch" Event with failure',
      build: () => ReturnItemsBloc(
        newRequestRepository: repositoryMock,
        config: config,
      ),
      seed: () => initState,
      setUp: () {
        when(
          () => repositoryMock.searchReturnMaterials(
            requestParams: ReturnMaterialsParams(
              salesOrg: initState.salesOrganisation.salesOrg,
              soldToInfo: initState.customerCodeInfo.customerCodeSoldTo,
              shipToInfo: initState.shipToInfo.shipToCustomerCode,
              pageSize: config.pageSize,
              offset: 0,
              filter: fakeReturnItemsFilter,
              searchKey: SearchKey.empty(),
              language: initState.user.preferredLanguage.languageCode,
              user: fakeUserWithLanguageCode,
            ),
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('Fake-Error')),
        );
      },
      act: (bloc) => bloc.add(
        ReturnItemsEvent.fetch(
          appliedFilter: fakeReturnItemsFilter,
          searchKey: SearchKey.empty(),
        ),
      ),
      expect: () => [
        initState.copyWith(
          isLoading: true,
          appliedFilter: fakeReturnItemsFilter,
          searchKey: SearchKey.empty(),
        ),
        initState.copyWith(
          appliedFilter: fakeReturnItemsFilter,
          searchKey: SearchKey.empty(),
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Fake-Error'))),
        ),
      ],
    );

    blocTest<ReturnItemsBloc, ReturnItemsState>(
      'For "loadMore" Event with success',
      build: () => ReturnItemsBloc(
        newRequestRepository: repositoryMock,
        config: config,
      ),
      seed: () => initState.copyWith(
        appliedFilter: fakeReturnItemsFilter,
        searchKey: SearchKey.empty(),
        items: fakeReturnMaterialList.items,
      ),
      setUp: () {
        when(
          () => repositoryMock.searchReturnMaterials(
            requestParams: ReturnMaterialsParams(
              salesOrg: initState.salesOrganisation.salesOrg,
              soldToInfo: initState.customerCodeInfo.customerCodeSoldTo,
              shipToInfo: initState.shipToInfo.shipToCustomerCode,
              pageSize: config.pageSize,
              offset: fakeReturnMaterialList.items.length,
              filter: fakeReturnItemsFilter,
              searchKey: SearchKey.empty(),
              language: initState.user.preferredLanguage.languageCode,
              user: fakeUserWithLanguageCode,
            ),
          ),
        ).thenAnswer(
          (invocation) async => Right(fakeReturnMaterialList),
        );
      },
      act: (bloc) => bloc.add(
        const ReturnItemsEvent.loadMore(),
      ),
      expect: () => [
        initState.copyWith(
          appliedFilter: fakeReturnItemsFilter,
          searchKey: SearchKey.empty(),
          items: fakeReturnMaterialList.items,
          isLoading: true,
        ),
        initState.copyWith(
          canLoadMore: false,
          appliedFilter: fakeReturnItemsFilter,
          searchKey: SearchKey.empty(),
          items: [
            ...fakeReturnMaterialList.items,
            ...fakeReturnMaterialList.items,
          ],
        ),
      ],
    );
    blocTest<ReturnItemsBloc, ReturnItemsState>(
      'For "loadMore" Event with failure',
      build: () => ReturnItemsBloc(
        newRequestRepository: repositoryMock,
        config: config,
      ),
      seed: () => initState.copyWith(
        appliedFilter: fakeReturnItemsFilter,
        searchKey: SearchKey.empty(),
        items: fakeReturnMaterialList.items,
      ),
      setUp: () {
        when(
          () => repositoryMock.searchReturnMaterials(
            requestParams: ReturnMaterialsParams(
              salesOrg: initState.salesOrganisation.salesOrg,
              soldToInfo: initState.customerCodeInfo.customerCodeSoldTo,
              shipToInfo: initState.shipToInfo.shipToCustomerCode,
              pageSize: config.pageSize,
              offset: fakeReturnMaterialList.items.length,
              filter: fakeReturnItemsFilter,
              searchKey: SearchKey.empty(),
              language: initState.user.preferredLanguage.languageCode,
              user: fakeUserWithLanguageCode,
            ),
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('Fake-Error')),
        );
      },
      act: (bloc) => bloc.add(
        const ReturnItemsEvent.loadMore(),
      ),
      expect: () => [
        initState.copyWith(
          appliedFilter: fakeReturnItemsFilter,
          searchKey: SearchKey.empty(),
          items: fakeReturnMaterialList.items,
          isLoading: true,
        ),
        initState.copyWith(
          appliedFilter: fakeReturnItemsFilter,
          searchKey: SearchKey.empty(),
          items: fakeReturnMaterialList.items,
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Fake-Error'))),
        ),
      ],
    );
  });
}

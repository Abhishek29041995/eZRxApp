import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/return_list_by_item_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_list_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';
import 'package:permission_handler/permission_handler.dart';

class ReturnListRepositoryMock extends Mock implements ReturnListRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late ReturnListRepository returnListRepositoryMock;
  late Config config;
  final mockSalesOrg = SalesOrg('2001');
  final mockShipInfo =
      ShipToInfo.empty().copyWith(shipToCustomerCode: 'mock-customer-code-1');
  final mockUser = User.empty().copyWith(username: Username('mock-user-name'));
  final mockCustomerCodeInfo =
      CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: 'mockCustomerCode');
  final mockReturnItemList = <ReturnItem>[
    ReturnItem.empty().copyWith(
      requestId: '01',
    ),
    ReturnItem.empty().copyWith(
      requestId: '02',
    ),
  ];
  final fakeFile = File('fake-file');
  const fakeApiFailure = ApiFailure.other('fake-error');
  group('Return List BLOC Testing=>', () {
    setUp(() {
      returnListRepositoryMock = ReturnListRepositoryMock();
      config = Config()..appFlavor = Flavor.mock;
    });

    blocTest<ReturnListByItemBloc, ReturnListByItemState>(
      'For "initialized" Event',
      build: () => ReturnListByItemBloc(
        returnListRepository: returnListRepositoryMock,
        config: config,
      ),
      setUp: () {
        when(
          () => returnListRepositoryMock.fetchReturnListByItem(
            appliedFilter: ReturnFilter.empty(),
            salesOrg: mockSalesOrg,
            shipToInfo: mockShipInfo,
            customerCode: mockCustomerCodeInfo,
            user: mockUser,
            searchKey: SearchKey.empty(),
            offset: 0,
            pageSize: config.pageSize,
          ),
        ).thenAnswer(
          (invocation) async => Right(mockReturnItemList),
        );
      },
      act: (ReturnListByItemBloc bloc) => bloc.add(
        ReturnListByItemEvent.initialized(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
        ),
      ),
      expect: () => [
        ReturnListByItemState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
        ),
        ReturnListByItemState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          failureOrSuccessOption: none(),
          isFetching: true,
        ),
        ReturnListByItemState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          failureOrSuccessOption: optionOf(
            Right(
              mockReturnItemList,
            ),
          ),
          isFetching: false,
          returnItemList: mockReturnItemList,
          canLoadMore: false,
        ),
      ],
    );

    blocTest<ReturnListByItemBloc, ReturnListByItemState>(
      'For "fetch" Event with failure',
      build: () => ReturnListByItemBloc(
        returnListRepository: returnListRepositoryMock,
        config: config,
      ),
      seed: () => ReturnListByItemState.initial().copyWith(
        salesOrg: mockSalesOrg,
        shipInfo: mockShipInfo,
        customerCodeInfo: mockCustomerCodeInfo,
        user: mockUser,
      ),
      setUp: () {
        when(
          () => returnListRepositoryMock.fetchReturnListByItem(
            appliedFilter: ReturnFilter.empty(),
            salesOrg: mockSalesOrg,
            shipToInfo: mockShipInfo,
            customerCode: mockCustomerCodeInfo,
            user: mockUser,
            searchKey: SearchKey.empty(),
            offset: 0,
            pageSize: config.pageSize,
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('Fake-Error')),
        );
      },
      act: (bloc) => bloc.add(
        ReturnListByItemEvent.fetch(
          appliedFilter: ReturnFilter.empty(),
          searchKey: SearchKey.empty(),
        ),
      ),
      expect: () => [
        ReturnListByItemState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          isFetching: true,
        ),
        ReturnListByItemState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          isFetching: false,
          canLoadMore: false,
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Fake-Error'))),
        ),
      ],
    );

    blocTest<ReturnListByItemBloc, ReturnListByItemState>(
      'For "loadMore" Event with success',
      build: () => ReturnListByItemBloc(
        returnListRepository: returnListRepositoryMock,
        config: config,
      ),
      seed: () => ReturnListByItemState.initial().copyWith(
        salesOrg: mockSalesOrg,
        shipInfo: mockShipInfo,
        customerCodeInfo: mockCustomerCodeInfo,
        user: mockUser,
      ),
      setUp: () {
        when(
          () => returnListRepositoryMock.fetchReturnListByItem(
            appliedFilter: ReturnFilter.empty(),
            salesOrg: mockSalesOrg,
            shipToInfo: mockShipInfo,
            customerCode: mockCustomerCodeInfo,
            user: mockUser,
            searchKey: SearchKey.empty(),
            offset: 0,
            pageSize: config.pageSize,
          ),
        ).thenAnswer(
          (invocation) async => Right(mockReturnItemList),
        );
      },
      act: (bloc) => bloc.add(
        const ReturnListByItemEvent.loadMore(),
      ),
      expect: () => [
        ReturnListByItemState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          isFetching: true,
        ),
        ReturnListByItemState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          isFetching: false,
          canLoadMore: false,
          returnItemList: mockReturnItemList,
          failureOrSuccessOption: optionOf(Right(mockReturnItemList)),
        ),
      ],
    );

    blocTest<ReturnListByItemBloc, ReturnListByItemState>(
      'For "loadMore" Event with failure',
      build: () => ReturnListByItemBloc(
        returnListRepository: returnListRepositoryMock,
        config: config,
      ),
      seed: () => ReturnListByItemState.initial().copyWith(
        salesOrg: mockSalesOrg,
        shipInfo: mockShipInfo,
        customerCodeInfo: mockCustomerCodeInfo,
        user: mockUser,
      ),
      setUp: () {
        when(
          () => returnListRepositoryMock.fetchReturnListByItem(
            appliedFilter: ReturnFilter.empty(),
            salesOrg: mockSalesOrg,
            shipToInfo: mockShipInfo,
            customerCode: mockCustomerCodeInfo,
            user: mockUser,
            searchKey: SearchKey.empty(),
            offset: 0,
            pageSize: config.pageSize,
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('Fake-Error')),
        );
      },
      act: (bloc) => bloc.add(
        const ReturnListByItemEvent.loadMore(),
      ),
      expect: () => [
        ReturnListByItemState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          isFetching: true,
        ),
        ReturnListByItemState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          isFetching: false,
          canLoadMore: false,
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Fake-Error'))),
        ),
      ],
    );

    blocTest(
      'For Download event with success',
      build: () => ReturnListByItemBloc(
        config: config,
        returnListRepository: returnListRepositoryMock,
      ),
      setUp: () {
        when(
          () => returnListRepositoryMock.getDownloadPermission(),
        ).thenAnswer((_) async => const Right(PermissionStatus.granted));
        when(
          () => returnListRepositoryMock.getFileUrl(
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipInfo,
            user: mockUser,
            salesOrg: mockSalesOrg,
            isViewByReturn: false,
            appliedFilter: ReturnFilter.empty(),
            searchKey: SearchKey.empty(),
          ),
        ).thenAnswer((_) async => const Right('fake-url'));
        when(
          () => returnListRepositoryMock.downloadFile(url: 'fake-url'),
        ).thenAnswer((_) async => Right(fakeFile));
      },
      seed: () => ReturnListByItemState.initial().copyWith(
        salesOrg: mockSalesOrg,
        shipInfo: mockShipInfo,
        customerCodeInfo: mockCustomerCodeInfo,
        user: mockUser,
      ),
      act: (bloc) => bloc.add(
        const ReturnListByItemEvent.downloadFile(),
      ),
      expect: () => [
        ReturnListByItemState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          isDownloadInProgress: true,
          failureOrSuccessOption: none(),
        ),
        ReturnListByItemState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          failureOrSuccessOption: optionOf(Right(fakeFile)),
        ),
      ],
    );

    blocTest(
      'For Download event with failure due to no permission',
      build: () => ReturnListByItemBloc(
        config: config,
        returnListRepository: returnListRepositoryMock,
      ),
      setUp: () {
        when(
          () => returnListRepositoryMock.getDownloadPermission(),
        ).thenAnswer((_) async => const Left(fakeApiFailure));
      },
      seed: () => ReturnListByItemState.initial().copyWith(
        salesOrg: mockSalesOrg,
        shipInfo: mockShipInfo,
        customerCodeInfo: mockCustomerCodeInfo,
        user: mockUser,
      ),
      act: (bloc) => bloc.add(
        const ReturnListByItemEvent.downloadFile(),
      ),
      expect: () => [
        ReturnListByItemState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          isDownloadInProgress: true,
          failureOrSuccessOption: none(),
        ),
        ReturnListByItemState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          failureOrSuccessOption: optionOf(const Left(fakeApiFailure)),
        ),
      ],
    );

    blocTest(
      'For Download event with failure due to invalid file url',
      build: () => ReturnListByItemBloc(
        config: config,
        returnListRepository: returnListRepositoryMock,
      ),
      setUp: () {
        when(
          () => returnListRepositoryMock.getDownloadPermission(),
        ).thenAnswer((_) async => const Right(PermissionStatus.granted));
        when(
          () => returnListRepositoryMock.getFileUrl(
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipInfo,
            user: mockUser,
            salesOrg: mockSalesOrg,
            isViewByReturn: false,
            appliedFilter: ReturnFilter.empty(),
            searchKey: SearchKey.empty(),
          ),
        ).thenAnswer((_) async => const Left(fakeApiFailure));
      },
      seed: () => ReturnListByItemState.initial().copyWith(
        salesOrg: mockSalesOrg,
        shipInfo: mockShipInfo,
        customerCodeInfo: mockCustomerCodeInfo,
        user: mockUser,
      ),
      act: (bloc) => bloc.add(
        const ReturnListByItemEvent.downloadFile(),
      ),
      expect: () => [
        ReturnListByItemState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          isDownloadInProgress: true,
          failureOrSuccessOption: none(),
        ),
        ReturnListByItemState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          failureOrSuccessOption: optionOf(const Left(fakeApiFailure)),
        ),
      ],
    );

    blocTest(
      'For Download event with failure due to file not found',
      build: () => ReturnListByItemBloc(
        config: config,
        returnListRepository: returnListRepositoryMock,
      ),
      setUp: () {
        when(
          () => returnListRepositoryMock.getDownloadPermission(),
        ).thenAnswer((_) async => const Right(PermissionStatus.granted));
        when(
          () => returnListRepositoryMock.getFileUrl(
            appliedFilter: ReturnFilter.empty(),
            searchKey: SearchKey.empty(),
            customerCodeInfo: mockCustomerCodeInfo,
            shipToInfo: mockShipInfo,
            user: mockUser,
            salesOrg: mockSalesOrg,
            isViewByReturn: false,
          ),
        ).thenAnswer((_) async => const Right('fake-url'));
        when(
          () => returnListRepositoryMock.downloadFile(url: 'fake-url'),
        ).thenAnswer((_) async => const Left(fakeApiFailure));
      },
      seed: () => ReturnListByItemState.initial().copyWith(
        salesOrg: mockSalesOrg,
        shipInfo: mockShipInfo,
        customerCodeInfo: mockCustomerCodeInfo,
        user: mockUser,
      ),
      act: (bloc) => bloc.add(
        const ReturnListByItemEvent.downloadFile(),
      ),
      expect: () => [
        ReturnListByItemState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          isDownloadInProgress: true,
          failureOrSuccessOption: none(),
        ),
        ReturnListByItemState.initial().copyWith(
          salesOrg: mockSalesOrg,
          shipInfo: mockShipInfo,
          customerCodeInfo: mockCustomerCodeInfo,
          user: mockUser,
          failureOrSuccessOption: optionOf(const Left(fakeApiFailure)),
        ),
      ],
    );
  });
}

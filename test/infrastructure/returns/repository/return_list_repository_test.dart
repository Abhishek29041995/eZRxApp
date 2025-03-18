import 'dart:io';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_excel_list_request.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/domain/returns/entities/return_list_request.dart';
import 'package:ezrxmobile/infrastructure/core/common/device_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/extensions.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_path_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/permission_service.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_list_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_list_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_excel_list_request_dto.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_list_request_dto.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_list_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class MockConfig extends Mock implements Config {}

class ReturnListLocalDataSourceMock extends Mock
    implements ReturnListLocalDataSource {}

class ReturnListRemoteDataSourceMock extends Mock
    implements ReturnListRemoteDataSource {}

class PermissionServiceMock extends Mock implements PermissionService {}

class DeviceInfoMock extends Mock implements DeviceInfo {}

class FileSystemHelperMock extends Mock implements FileSystemHelper {}

class DeviceStorageMock extends Mock implements DeviceStorage {}

void main() {
  late ReturnListRepository returnListRepository;
  late Config mockConfig;
  late ReturnListLocalDataSource returnListLocalDataSource;
  late ReturnListRemoteDataSource returnListRemoteDataSource;
  late Map<String, dynamic> inputParams;
  late Map<String, dynamic> returnExcelRequestParams;
  late FileSystemHelper fileSystemHelper;
  late DeviceInfo deviceInfo;
  late PermissionService permissionService;
  late DeviceStorage deviceStorage;

  final returnListByRequest = [ReturnItem.empty()];
  final errorMock = Exception('fake-error');
  final appliedFilterMock = ReturnFilter.empty();
  final searchKeyMock = SearchKey.search('fake-search-key');
  const fakeMarket = 'fake-market';
  final buffer = Uint8List.fromList([1, 2, 3, 4, 5]);
  final returnListRequest = ReturnListRequest.empty().copyWith(
    customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
    salesOrg: fakeSalesOrg,
    shipToInfo: fakeCustomerCodeInfo.shipToInfos.first.shipToCustomerCode,
    userName: fakeClient.username,
    after: 0,
    first: 10,
    filter: appliedFilterMock,
    searchKey: searchKeyMock,
  );

  final returnExcelListRequest = ReturnExcelListRequest.empty().copyWith(
    customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
    shipToInfo: fakeCustomerCodeInfo.shipToInfos.first.shipToCustomerCode,
    userName: fakeClient.username,
    filter: appliedFilterMock,
    searchKey: searchKeyMock,
  );

  setUpAll(() {
    mockConfig = MockConfig();
    returnListLocalDataSource = ReturnListLocalDataSourceMock();
    returnListRemoteDataSource = ReturnListRemoteDataSourceMock();
    permissionService = PermissionServiceMock();
    deviceInfo = DeviceInfoMock();
    fileSystemHelper = FileSystemHelperMock();
    deviceStorage = DeviceStorageMock();

    returnListRepository = ReturnListRepository(
      config: mockConfig,
      localDataSource: returnListLocalDataSource,
      remoteDataSource: returnListRemoteDataSource,
      deviceInfo: deviceInfo,
      fileSystemHelper: fileSystemHelper,
      permissionService: permissionService,
      deviceStorage: deviceStorage,
    );
    final returnListRequestDto =
        ReturnListRequestDto.fromDomain(returnListRequest);
    inputParams = returnListRequestDto
        .toJson()
        .excludeEmptyString(returnListRequestDto.filterQuery.toJson());

    final returnExcelRequestDto =
        ReturnExcelListRequestDto.fromDomain(returnExcelListRequest);
    returnExcelRequestParams = returnExcelRequestDto
        .toJson()
        .excludeEmptyString(returnExcelRequestDto.filterQuery.toJson());
  });

  group(
    'Return list repository test',
    () {
      test(
        'Fetch Return List By Item Success Locally',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
          when(
            () => returnListLocalDataSource.fetchReturnByItems(),
          ).thenAnswer((invocation) async => returnListByRequest);
          final result = await returnListRepository.fetchReturnListByItem(
            salesOrg: fakeSalesOrg,
            customerCode: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeClient,
            pageSize: 10,
            offset: 0,
            appliedFilter: appliedFilterMock,
            searchKey: searchKeyMock,
          );
          expect(result.isRight(), true);
          expect(
            result.getOrElse(
              () => <ReturnItem>[],
            ),
            returnListByRequest,
          );
        },
      );

      test(
        'Fetch Return List By Item Failure Locally',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
          when(
            () => returnListLocalDataSource.fetchReturnByItems(),
          ).thenThrow(errorMock);
          final result = await returnListRepository.fetchReturnListByItem(
            salesOrg: fakeSalesOrg,
            customerCode: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeClient,
            pageSize: 10,
            offset: 0,
            appliedFilter: appliedFilterMock,
            searchKey: searchKeyMock,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Fetch Return List By Item Success Remote',
        () async {
          when(() => deviceStorage.currentMarket()).thenReturn(fakeMarket);
          when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
          when(
            () => returnListRemoteDataSource.fetchReturnByItems(
              requestParams: inputParams,
              market: fakeMarket,
            ),
          ).thenAnswer(
            (invocation) async => returnListByRequest,
          );
          final result = await returnListRepository.fetchReturnListByItem(
            salesOrg: fakeSalesOrg,
            customerCode: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeClient,
            pageSize: 10,
            offset: 0,
            appliedFilter: appliedFilterMock,
            searchKey: searchKeyMock,
          );
          expect(result.isRight(), true);
          expect(
            result.getOrElse(
              () => <ReturnItem>[],
            ),
            returnListByRequest,
          );
        },
      );

      test(
        'Fetch Return List By Item Failure Remote',
        () async {
          when(() => deviceStorage.currentMarket()).thenReturn(fakeMarket);
          when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
          when(
            () => returnListRemoteDataSource.fetchReturnByItems(
              requestParams: inputParams,
              market: fakeMarket,
            ),
          ).thenThrow(errorMock);
          final result = await returnListRepository.fetchReturnListByItem(
            salesOrg: fakeSalesOrg,
            customerCode: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeClient,
            pageSize: 10,
            offset: 0,
            appliedFilter: appliedFilterMock,
            searchKey: searchKeyMock,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Fetch Return Item By Request Success Remote',
        () async {
          when(() => deviceStorage.currentMarket()).thenReturn(fakeMarket);
          when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
          when(
            () => returnListRemoteDataSource.fetchReturnByRequest(
              requestParams: inputParams,
              market: fakeMarket,
            ),
          ).thenAnswer((invocation) async => returnListByRequest);

          final result = await returnListRepository.fetchReturnListByRequest(
            appliedFilter: appliedFilterMock,
            customerCode: fakeCustomerCodeInfo,
            offset: 0,
            pageSize: 10,
            salesOrg: fakeSalesOrg,
            searchKey: searchKeyMock,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeClient,
          );
          expect(
            result.isRight(),
            true,
          );
          expect(
            result.getOrElse(
              () => <ReturnItem>[],
            ),
            returnListByRequest,
          );
        },
      );

      test(
        'Fetch Return List By Request Success Locally',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
          when(
            () => returnListLocalDataSource.fetchReturnByRequests(),
          ).thenAnswer((invocation) async => returnListByRequest);
          final result = await returnListRepository.fetchReturnListByRequest(
            salesOrg: fakeSalesOrg,
            customerCode: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeClient,
            pageSize: 10,
            offset: 0,
            appliedFilter: appliedFilterMock,
            searchKey: searchKeyMock,
          );
          expect(result.isRight(), true);
          expect(
            result.getOrElse(
              () => <ReturnItem>[],
            ),
            returnListByRequest,
          );
        },
      );

      test(
        'Fetch Return List By Request Failure Locally',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
          when(
            () => returnListLocalDataSource.fetchReturnByRequests(),
          ).thenThrow(errorMock);
          final result = await returnListRepository.fetchReturnListByRequest(
            salesOrg: fakeSalesOrg,
            customerCode: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeClient,
            pageSize: 10,
            offset: 0,
            appliedFilter: appliedFilterMock,
            searchKey: searchKeyMock,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Fetch Return List By Request Failure Remote',
        () async {
          when(() => deviceStorage.currentMarket()).thenReturn(fakeMarket);
          when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
          when(
            () => returnListRemoteDataSource.fetchReturnByRequest(
              requestParams: inputParams,
              market: fakeMarket,
            ),
          ).thenThrow(errorMock);
          final result = await returnListRepository.fetchReturnListByRequest(
            salesOrg: fakeSalesOrg,
            customerCode: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeClient,
            pageSize: 10,
            offset: 0,
            appliedFilter: appliedFilterMock,
            searchKey: searchKeyMock,
          );
          expect(result.isLeft(), true);
        },
      );
      test(
        'Get Download Permission For IOs',
        () async {
          debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

          final result = await returnListRepository.getDownloadPermission();
          expect(result.isRight(), true);
        },
      );

      test(
        'Get Download Permission For Android With SDK33',
        () async {
          debugDefaultTargetPlatformOverride = TargetPlatform.android;
          when(
            () => deviceInfo.checkIfDeviceIsAndroidWithSDK33(),
          ).thenAnswer(
            (_) async => true,
          );
          final result = await returnListRepository.getDownloadPermission();
          expect(result.isRight(), true);
        },
      );

      test(
        'Get Download Permission For Android Without SDK33 Success',
        () async {
          debugDefaultTargetPlatformOverride = TargetPlatform.android;
          when(
            () => deviceInfo.checkIfDeviceIsAndroidWithSDK33(),
          ).thenAnswer(
            (_) async => false,
          );
          when(
            () => permissionService.requestStoragePermission(),
          ).thenAnswer(
            (_) async => PermissionStatus.granted,
          );
          final result = await returnListRepository.getDownloadPermission();
          expect(result.isRight(), true);
        },
      );

      test(
        'Get Download Permission For Android Without SDK33 Failure',
        () async {
          debugDefaultTargetPlatformOverride = TargetPlatform.android;
          when(
            () => deviceInfo.checkIfDeviceIsAndroidWithSDK33(),
          ).thenAnswer(
            (_) async => false,
          );
          when(
            () => permissionService.requestStoragePermission(),
          ).thenAnswer(
            (_) async => PermissionStatus.denied,
          );
          final result = await returnListRepository.getDownloadPermission();
          expect(result.isLeft(), true);
        },
      );

      test(
        'Get Download Permission Error',
        () async {
          when(
            () => deviceInfo.checkIfDeviceIsAndroidWithSDK33(),
          ).thenThrow(
            (_) => errorMock,
          );
          final result = await returnListRepository.getDownloadPermission();
          expect(result.isLeft(), true);
        },
      );
      test(
        'Get File Url Succeas Remote',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
          when(
            () => returnListRemoteDataSource.getFileUrl(
              salesOrg: fakeSalesOrg.getOrCrash(),
              requestParams: returnExcelRequestParams,
            ),
          ).thenAnswer((invocation) async => '');
          final result = await returnListRepository.getFileUrl(
            salesOrg: fakeSalesOrg,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeRootAdminUser,
            isViewByReturn: false,
            appliedFilter: appliedFilterMock,
            searchKey: searchKeyMock,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Get File Url Succeas local',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
          when(
            () => returnListLocalDataSource.getFileUrl(),
          ).thenAnswer((invocation) async => '');
          final result = await returnListRepository.getFileUrl(
            salesOrg: fakeSalesOrg,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeRootAdminUser,
            isViewByReturn: false,
            appliedFilter: appliedFilterMock,
            searchKey: searchKeyMock,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Get File Url Failure local',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
          when(
            () => returnListLocalDataSource.getFileUrl(),
          ).thenThrow(errorMock);
          final result = await returnListRepository.getFileUrl(
            salesOrg: fakeSalesOrg,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeRootAdminUser,
            isViewByReturn: false,
            appliedFilter: appliedFilterMock,
            searchKey: searchKeyMock,
          );
          expect(result.isLeft(), true);
        },
      );
      test(
        'Get File Url Failure Remote',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
          when(
            () => returnListRemoteDataSource.getFileUrl(
              requestParams: returnExcelRequestParams,
              salesOrg: fakeSalesOrg.getOrCrash(),
            ),
          ).thenThrow(errorMock);
          final result = await returnListRepository.getFileUrl(
            salesOrg: fakeSalesOrg,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeRootAdminUser,
            isViewByReturn: false,
            appliedFilter: appliedFilterMock,
            searchKey: searchKeyMock,
          );
          expect(result.isLeft(), true);
        },
      );
      test(
        'Download File Success Remote',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
          when(
            () => deviceInfo.checkIfDeviceIsAndroidWithSDK33(),
          ).thenAnswer(
            (invocation) async => false,
          );
          when(
            () => returnListRemoteDataSource.downloadFile(
              url: 'fake_url',
            ),
          ).thenAnswer(
            (invocation) async => AttachmentFileBuffer(
              name: Uri.parse('fake_url').pathSegments.last,
              buffer: buffer,
            ),
          );
          when(
            () => fileSystemHelper.getDownloadedFile(
              AttachmentFileBuffer(
                name: Uri.parse('fake_url').pathSegments.last,
                buffer: buffer,
              ),
            ),
          ).thenAnswer((invocation) async => File('fake_url'));
          final result = await returnListRepository.downloadFile(
            url: 'fake_url',
          );
          expect(result.isRight(), true);
        },
      );
      test(
        'Download File Failure Remote',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
          when(
            () => deviceInfo.checkIfDeviceIsAndroidWithSDK33(),
          ).thenAnswer(
            (invocation) async => false,
          );
          when(
            () => returnListRemoteDataSource.downloadFile(
              url: 'fake_url',
            ),
          ).thenThrow(errorMock);
          when(
            () => fileSystemHelper.getDownloadedFile(
              AttachmentFileBuffer(
                name: Uri.parse('fake_url').pathSegments.last,
                buffer: buffer,
              ),
            ),
          ).thenAnswer((invocation) async => File('fake_url'));
          final result = await returnListRepository.downloadFile(
            url: 'fake_url',
          );
          expect(result.isLeft(), true);
        },
      );
      test(
        'Download File Success Remote',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
          when(
            () => deviceInfo.checkIfDeviceIsAndroidWithSDK33(),
          ).thenAnswer(
            (invocation) async => false,
          );
          when(
            () => returnListRemoteDataSource.downloadFile(
              url: 'fake_url',
            ),
          ).thenAnswer(
            (invocation) async => AttachmentFileBuffer(
              name: Uri.parse('fake_url').pathSegments.last,
              buffer: buffer,
            ),
          );
          when(
            () => fileSystemHelper.getDownloadedFile(
              AttachmentFileBuffer(
                name: Uri.parse('fake_url').pathSegments.last,
                buffer: buffer,
              ),
            ),
          ).thenAnswer((invocation) async => File('fake_url'));
          final result = await returnListRepository.downloadFile(
            url: 'fake_url',
          );
          expect(result.isRight(), true);
        },
      );
      test(
        'Download File Failure Remote',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
          when(
            () => deviceInfo.checkIfDeviceIsAndroidWithSDK33(),
          ).thenAnswer(
            (invocation) async => false,
          );
          when(
            () => returnListRemoteDataSource.downloadFile(
              url: 'fake_url',
            ),
          ).thenThrow(errorMock);
          when(
            () => fileSystemHelper.getDownloadedFile(
              AttachmentFileBuffer(
                name: Uri.parse('fake_url').pathSegments.last,
                buffer: buffer,
              ),
            ),
          ).thenAnswer((invocation) async => File('fake_url'));
          final result = await returnListRepository.downloadFile(
            url: 'fake_url',
          );
          expect(result.isLeft(), true);
        },
      );
    },
  );
}

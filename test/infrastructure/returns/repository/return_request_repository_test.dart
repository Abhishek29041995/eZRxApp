import 'package:ezrxmobile/application/returns/new_request/attachments/return_request_attachment_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/add_request_params.dart';
import 'package:ezrxmobile/domain/returns/entities/invoice_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_items_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material_list.dart';
import 'package:ezrxmobile/domain/returns/entities/return_materials_params.dart';
import 'package:ezrxmobile/infrastructure/core/common/device_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_path_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_picker.dart';
import 'package:ezrxmobile/infrastructure/core/common/permission_service.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/device_storage.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/po_document_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/po_document_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/add_request_params_dto.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_materials_params_dto.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_request_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../order/repository/po_attachment_repository_test.dart';

class ConfigMock extends Mock implements Config {}

class ReturnRequestLocalDataSourceMock extends Mock
    implements ReturnRequestLocalDataSource {}

class ReturnRequestRemoteDataSourceMock extends Mock
    implements ReturnRequestRemoteDataSource {}

class DeviceInfoMock extends Mock implements DeviceInfo {}

class PermissionServiceMock extends Mock implements PermissionService {}

class FilePickerServiceMock extends Mock implements FilePickerService {}

class FileSystemHelperMock extends Mock implements FileSystemHelper {}

final locator = GetIt.instance;

void main() {
  late ReturnRequestRepository repository;
  late Config configMock;
  late ReturnRequestLocalDataSource localDataSourceMock;
  late ReturnRequestRemoteDataSource remoteDataSourceMock;
  late PoDocumentLocalDataSource poDocumentLocalDataSourceMock;
  late PoDocumentRemoteDataSource poDocumentRemoteDataSourceMock;
  late DeviceInfo deviceInfoMock;
  late PermissionService permissionServiceMock;
  late FilePickerService filePickerServiceMock;
  late FileSystemHelper fileSystemHelperMock;
  late DeviceStorage deviceStorageMock;
  const mockMarket = 'mockMarket';
  const pageSizeMock = 10;
  const offsetMock = 0;
  final requestParamsMock = ReturnMaterialsParams(
    salesOrg: fakeSalesOrg,
    shipToInfo: fakeCustomerCodeInfo.shipToInfos.first.shipToCustomerCode,
    soldToInfo: fakeCustomerCodeInfo.customerCodeSoldTo,
    pageSize: pageSizeMock,
    offset: offsetMock,
    filter: ReturnItemsFilter.empty(),
    searchKey: SearchKey.empty(),
    language: fakeUserWithLanguageCode.preferredLanguage.languageCode,
    user: fakeUserWithLanguageCode,
  );
  final errorMock = Exception('fake-error');
  const fakePath = 'fake-path';
  const fakeName = 'fake-name';
  final fakeFile = PlatformFile(
    path: fakePath,
    name: fakeName,
    size: 10,
  );
  final fakeRequestParams = AddRequestParams(
    specialInstruction: 'fake-special-instruction',
    returnReference: 'fake-return-reference',
    user: User.empty().copyWith(
      username: Username('fake-ext-sales-rep-user'),
      role: Role.empty().copyWith(
        type: RoleType(
          'external_sales_rep',
        ),
      ),
    ),
    soldTo: 'fake-sold_to',
    invoiceDetails: <InvoiceDetails>[],
  );
  final fakeAllowedExtensions = [
    'jpg',
    'pdf',
    'doc',
  ];

  setUpAll(
    () {
      configMock = ConfigMock();
      localDataSourceMock = ReturnRequestLocalDataSourceMock();
      remoteDataSourceMock = ReturnRequestRemoteDataSourceMock();
      poDocumentLocalDataSourceMock = PoDocumentLocalDataSourceMock();
      poDocumentRemoteDataSourceMock = PoDocumentRemoteDataSourceMock();
      deviceInfoMock = DeviceInfoMock();
      permissionServiceMock = PermissionServiceMock();
      filePickerServiceMock = FilePickerServiceMock();
      fileSystemHelperMock = FileSystemHelperMock();
      deviceStorageMock = DeviceStorageMock();
      locator.registerLazySingleton(() => configMock);
      when(() => deviceStorageMock.currentMarket()).thenReturn(mockMarket);
      repository = ReturnRequestRepository(
        config: configMock,
        localDataSource: localDataSourceMock,
        remoteDataSource: remoteDataSourceMock,
        deviceInfo: deviceInfoMock,
        permissionService: permissionServiceMock,
        filePickerService: filePickerServiceMock,
        fileSystemHelper: fileSystemHelperMock,
        deviceStorage: deviceStorageMock,
        poDocumentRemoteDataSource: poDocumentRemoteDataSourceMock,
        poDocumentLocalDataSource: poDocumentLocalDataSourceMock,
      );
      when(() => configMock.maximumUploadSize).thenReturn(20);
    },
  );

  group(
    'Return Request Repository',
    () {
      test(
        'Search Return Materials Success Locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(() => localDataSourceMock.searchReturnMaterials()).thenAnswer(
            (_) async => ReturnMaterialList.empty(),
          );
          final result = await repository.searchReturnMaterials(
            requestParams: requestParamsMock,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Search Return Materials Failure Locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(() => localDataSourceMock.searchReturnMaterials()).thenThrow(
            errorMock,
          );
          final result = await repository.searchReturnMaterials(
            requestParams: requestParamsMock,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Search Return Materials Success Remote',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.searchReturnMaterials(
              requestParams:
                  ReturnMaterialsParamsDto.fromDomain(requestParamsMock)
                      .copyWith(username: '')
                      .toMap(),
              market: mockMarket,
            ),
          ).thenAnswer(
            (_) async => ReturnMaterialList.empty(),
          );
          final result = await repository.searchReturnMaterials(
            requestParams: requestParamsMock,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Search Return Materials Failure Remote',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.searchReturnMaterials(
              requestParams:
                  ReturnMaterialsParamsDto.fromDomain(requestParamsMock)
                      .copyWith(username: '')
                      .toMap(),
              market: mockMarket,
            ),
          ).thenThrow(errorMock);
          final result = await repository.searchReturnMaterials(
            requestParams: requestParamsMock,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Get Permission For Android With SDK33',
        () async {
          when(
            () => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33(),
          ).thenAnswer(
            (_) async => true,
          );
          final result = await repository.getPermission(
            uploadOptionType: UploadOptionType.file,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Get Permission For iOS And Upload File',
        () async {
          when(
            () => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33(),
          ).thenAnswer(
            (_) async => false,
          );
          debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
          final result = await repository.getPermission(
            uploadOptionType: UploadOptionType.file,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Get Permission For iOS And Upload File',
        () async {
          when(
            () => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33(),
          ).thenAnswer(
            (_) async => false,
          );
          debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
          final result = await repository.getPermission(
            uploadOptionType: UploadOptionType.file,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Get Permission For iOS And Upload Gallery',
        () async {
          when(
            () => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33(),
          ).thenAnswer(
            (_) async => false,
          );
          when(
            () => permissionServiceMock.requestPhotoPermission(),
          ).thenAnswer(
            (_) async => PermissionStatus.granted,
          );

          debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
          final result = await repository.getPermission(
            uploadOptionType: UploadOptionType.gallery,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Get Permission For Android Without SDK33',
        () async {
          when(
            () => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33(),
          ).thenAnswer(
            (_) async => false,
          );
          when(
            () => permissionServiceMock.requestStoragePermission(),
          ).thenAnswer(
            (_) async => PermissionStatus.granted,
          );

          debugDefaultTargetPlatformOverride = TargetPlatform.android;
          final result = await repository.getPermission(
            uploadOptionType: UploadOptionType.gallery,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Get Permission Failure',
        () async {
          when(
            () => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33(),
          ).thenAnswer(
            (_) async => false,
          );
          when(
            () => permissionServiceMock.requestStoragePermission(),
          ).thenAnswer(
            (_) async => PermissionStatus.denied,
          );

          debugDefaultTargetPlatformOverride = TargetPlatform.android;
          final result = await repository.getPermission(
            uploadOptionType: UploadOptionType.gallery,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Get Permission Error',
        () async {
          when(
            () => deviceInfoMock.checkIfDeviceIsAndroidWithSDK33(),
          ).thenThrow(errorMock);

          final result = await repository.getPermission(
            uploadOptionType: UploadOptionType.gallery,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Pick Files Failure',
        () async {
          when(
            () => filePickerServiceMock.pickFiles(),
          ).thenThrow(errorMock);

          final result = await repository.pickFiles(
            uploadOptionType: UploadOptionType.gallery,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Pick Files Type File Success',
        () async {
          when(
            () => configMock.allowedExtensions,
          ).thenAnswer(
            (_) => fakeAllowedExtensions,
          );
          when(
            () => filePickerServiceMock.pickFiles(
              fileType: FileType.custom,
              allowedExtensions: fakeAllowedExtensions,
            ),
          ).thenAnswer(
            (_) async => FilePickerResult(
              [fakeFile],
            ),
          );

          final result = await repository.pickFiles(
            uploadOptionType: UploadOptionType.file,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Pick Files Type Gallery Success',
        () async {
          when(
            () => filePickerServiceMock.pickFiles(),
          ).thenAnswer(
            (_) async => FilePickerResult(
              [fakeFile],
            ),
          );

          final result = await repository.pickFiles(
            uploadOptionType: UploadOptionType.gallery,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Add Request Success Locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(
            () => localDataSourceMock.addRequest(),
          ).thenAnswer((_) async => 'fake-response');
          final result = await repository.addRequest(
            requestParams: fakeRequestParams,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Add Request Failure Locally',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.mock);
          when(
            () => localDataSourceMock.addRequest(),
          ).thenThrow(
            (_) => errorMock,
          );
          final result = await repository.addRequest(
            requestParams: fakeRequestParams,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Add Request Success Remote',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.addRequest(
              requestParams:
                  AddRequestParamsDto.fromDomain(fakeRequestParams).toJson(),
            ),
          ).thenAnswer(
            (_) async => 'fake-response',
          );
          final result = await repository.addRequest(
            requestParams: fakeRequestParams,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Add Request Failure Remote',
        () async {
          when(() => configMock.appFlavor).thenReturn(Flavor.uat);
          when(
            () => remoteDataSourceMock.addRequest(
              requestParams:
                  AddRequestParamsDto.fromDomain(fakeRequestParams).toJson(),
            ),
          ).thenThrow(
            (_) => errorMock,
          );
          final result = await repository.addRequest(
            requestParams: fakeRequestParams,
          );
          expect(result.isLeft(), true);
        },
      );
    },
  );
}

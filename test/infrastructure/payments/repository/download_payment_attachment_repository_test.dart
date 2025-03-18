import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';
import 'package:ezrxmobile/domain/payments/entities/full_summary_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_filter.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/infrastructure/core/common/device_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_path_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/permission_service.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/download_payment_attachment_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/download_payment_attachment_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/all_credits_filter_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/all_invoices_filter_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/full_summary_filter_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_summary_filter_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/download_payment_attachment_repository.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class MockConfig extends Mock implements Config {}

class DownloadPaymentAttachmentLocalDataSourceMock extends Mock
    implements DownloadPaymentAttachmentLocalDataSource {}

class DownloadPaymentAttachmentRemoteDataSourceMock extends Mock
    implements DownloadPaymentAttachmentRemoteDataSource {}

class DeviceInfoMock extends Mock implements DeviceInfo {}

class PermissionServiceMock extends Mock implements PermissionService {}

class FileSystemHelperMock extends Mock implements FileSystemHelper {}

void main() {
  late DownloadPaymentAttachmentRepository downloadPaymentAttachmentRepository;
  late Config mockConfig;
  late DownloadPaymentAttachmentLocalDataSource localDataSource;
  late DownloadPaymentAttachmentRemoteDataSource remoteDataSource;
  late DeviceInfo deviceInfo;
  late PermissionService permissionService;
  late FileSystemHelper fileSystemHelper;
  late DownloadPaymentAttachment downloadPaymentAttachment;
  late AttachmentFileBuffer attachmentFileBuffer;
  final filterListForInvoice =
      AllInvoicesFilterDto.fromDomain(AllInvoicesFilter.defaultFilter())
          .toMapList;
  final filterListForCredits =
      AllCreditsFilterDto.fromDomain(AllCreditsFilter.defaultFilter())
          .toMapList;
  final filterListForFullSummary =
      FullSummaryFilterDto.fromDomain(FullSummaryFilter.defaultFilter())
          .toMapList;
  final filterListForPaymentSummary =
      PaymentSummaryFilterDto.fromDomain(PaymentSummaryFilter.defaultFilter())
          .toMapList;
  final fakeError = MockException(message: 'fake-exception');
  final fileMock = FileMock();

  setUpAll(
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      mockConfig = Config()..appFlavor = Flavor.mock;
      localDataSource = DownloadPaymentAttachmentLocalDataSourceMock();
      remoteDataSource = DownloadPaymentAttachmentRemoteDataSourceMock();
      deviceInfo = DeviceInfoMock();
      permissionService = PermissionServiceMock();
      fileSystemHelper = FileSystemHelperMock();
      downloadPaymentAttachmentRepository = DownloadPaymentAttachmentRepository(
        config: mockConfig,
        localDataSource: localDataSource,
        remoteDataSource: remoteDataSource,
        deviceInfo: deviceInfo,
        fileSystemHelper: fileSystemHelper,
        permissionService: permissionService,
      );
      downloadPaymentAttachment =
          await DownloadPaymentAttachmentLocalDataSource().getFileDownloadUrl();
      attachmentFileBuffer =
          await DownloadPaymentAttachmentLocalDataSource().fileDownload();
    },
  );

  group('DownloadPaymentAttachmentRepository tests', () {
    group('fetch AllInvoice Url tests', () {
      test('fetch AllInvoice Url successfully local', () async {
        when(() => localDataSource.getFileDownloadUrl()).thenAnswer(
          (invocation) async => downloadPaymentAttachment,
        );

        final result =
            await downloadPaymentAttachmentRepository.fetchAllInvoiceUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeSalesOrganisation,
          queryObject: AllInvoicesFilter.defaultFilter(),
          isMarketPlace: true,
        );
        expect(
          result,
          Right(downloadPaymentAttachment),
        );
      });

      test('fetch AllInvoice Url failed local', () async {
        when(() => localDataSource.getFileDownloadUrl()).thenThrow(fakeError);

        final result =
            await downloadPaymentAttachmentRepository.fetchAllInvoiceUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeSalesOrganisation,
          queryObject: AllInvoicesFilter.defaultFilter(),
          isMarketPlace: true,
        );
        expect(
          result,
          Left(FailureHandler.handleFailure(fakeError)),
        );
      });

      test('fetch AllInvoice Url success remote', () async {
        mockConfig.appFlavor = Flavor.uat;
        when(
          () => remoteDataSource.getFileDownloadUrl(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            excelFor: 'Debit',
            queryObject: filterListForInvoice,
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            isMarketPlace: true,
          ),
        ).thenAnswer((invocation) async => downloadPaymentAttachment);

        final result =
            await downloadPaymentAttachmentRepository.fetchAllInvoiceUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeSalesOrganisation,
          queryObject: AllInvoicesFilter.defaultFilter(),
          isMarketPlace: true,
        );
        expect(
          result,
          Right(downloadPaymentAttachment),
        );
      });

      test('fetch AllInvoice Url failure remote', () async {
        mockConfig.appFlavor = Flavor.uat;
        when(
          () => remoteDataSource.getFileDownloadUrl(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            excelFor: 'Debit',
            queryObject: filterListForInvoice,
            salesOrg: fakeMYSalesOrganisation.salesOrg.getOrCrash(),
            isMarketPlace: false,
          ),
        ).thenThrow(fakeError);

        final result =
            await downloadPaymentAttachmentRepository.fetchAllInvoiceUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeMYSalesOrganisation,
          queryObject: AllInvoicesFilter.defaultFilter(),
          isMarketPlace: false,
        );
        expect(
          result,
          Left(FailureHandler.handleFailure(fakeError)),
        );
      });
    });

    group('fetch AllCredit Url tests', () {
      test('fetch AllCredit Url successfully local', () async {
        mockConfig.appFlavor = Flavor.mock;
        when(() => localDataSource.getFileDownloadUrl()).thenAnswer(
          (invocation) async => downloadPaymentAttachment,
        );

        final result =
            await downloadPaymentAttachmentRepository.fetchAllCreditUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeSalesOrganisation,
          queryObject: AllCreditsFilter.defaultFilter(),
          isMarketPlace: true,
        );
        expect(
          result,
          Right(downloadPaymentAttachment),
        );
      });

      test('fetch AllCredit Url failed local', () async {
        when(() => localDataSource.getFileDownloadUrl()).thenThrow(fakeError);

        final result =
            await downloadPaymentAttachmentRepository.fetchAllCreditUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeMYSalesOrganisation,
          queryObject: AllCreditsFilter.defaultFilter(),
          isMarketPlace: true,
        );
        expect(
          result,
          Left(FailureHandler.handleFailure(fakeError)),
        );
      });

      test('fetch AllCredit Url success remote', () async {
        mockConfig.appFlavor = Flavor.uat;
        when(
          () => remoteDataSource.getFileDownloadUrl(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            excelFor: 'Credit',
            queryObject: filterListForCredits,
            salesOrg: fakeMYSalesOrganisation.salesOrg.getOrCrash(),
            isMarketPlace: true,
          ),
        ).thenAnswer((invocation) async => downloadPaymentAttachment);

        final result =
            await downloadPaymentAttachmentRepository.fetchAllCreditUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeMYSalesOrganisation,
          queryObject: AllCreditsFilter.defaultFilter(),
          isMarketPlace: true,
        );
        expect(
          result,
          Right(downloadPaymentAttachment),
        );
      });

      test('fetch AllCredit Url failure remote', () async {
        mockConfig.appFlavor = Flavor.uat;
        when(
          () => remoteDataSource.getFileDownloadUrl(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            excelFor: 'Credit',
            queryObject: filterListForCredits,
            salesOrg: fakeMYSalesOrganisation.salesOrg.getOrCrash(),
            isMarketPlace: false,
          ),
        ).thenThrow(fakeError);

        final result =
            await downloadPaymentAttachmentRepository.fetchAllCreditUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeMYSalesOrganisation,
          queryObject: AllCreditsFilter.defaultFilter(),
          isMarketPlace: false,
        );
        expect(
          result,
          Left(FailureHandler.handleFailure(fakeError)),
        );
      });
    });

    group('fetch FullSummary Url tests', () {
      test('fetch FullSummary Url successfully local', () async {
        mockConfig.appFlavor = Flavor.mock;
        when(() => localDataSource.getFileDownloadUrl()).thenAnswer(
          (invocation) async => downloadPaymentAttachment,
        );

        final result =
            await downloadPaymentAttachmentRepository.fetchFullSummaryUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeMYSalesOrganisation,
          queryObject: FullSummaryFilter.defaultFilter(),
          isMarketPlace: true,
        );
        expect(
          result,
          Right(downloadPaymentAttachment),
        );
      });

      test('fetch FullSummary Url failed local', () async {
        when(() => localDataSource.getFileDownloadUrl())
            .thenThrow(MockException());

        final result =
            await downloadPaymentAttachmentRepository.fetchFullSummaryUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeMYSalesOrganisation,
          queryObject: FullSummaryFilter.defaultFilter(),
          isMarketPlace: true,
        );
        expect(
          result,
          Left(FailureHandler.handleFailure(MockException())),
        );
      });

      test('fetch FullSummary Url success remote', () async {
        mockConfig.appFlavor = Flavor.uat;
        when(
          () => remoteDataSource.getFileDownloadUrl(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            excelFor: 'AccountSummary',
            queryObject: filterListForFullSummary,
            salesOrg: fakeMYSalesOrganisation.salesOrg.getOrCrash(),
            isMarketPlace: false,
          ),
        ).thenAnswer((invocation) async => downloadPaymentAttachment);

        final result =
            await downloadPaymentAttachmentRepository.fetchFullSummaryUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeMYSalesOrganisation,
          queryObject: FullSummaryFilter.defaultFilter(),
          isMarketPlace: false,
        );
        expect(
          result,
          Right(downloadPaymentAttachment),
        );
      });

      test('fetch FullSummary Url failure remote', () async {
        mockConfig.appFlavor = Flavor.uat;
        when(
          () => remoteDataSource.getFileDownloadUrl(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            excelFor: 'AccountSummary',
            queryObject: filterListForFullSummary,
            salesOrg: fakeMYSalesOrganisation.salesOrg.getOrCrash(),
            isMarketPlace: true,
          ),
        ).thenThrow(fakeError);

        final result =
            await downloadPaymentAttachmentRepository.fetchFullSummaryUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeMYSalesOrganisation,
          queryObject: FullSummaryFilter.defaultFilter(),
          isMarketPlace: true,
        );
        expect(
          result,
          Left(FailureHandler.handleFailure(fakeError)),
        );
      });
    });
    group('fetch Payment Summary Url tests', () {
      test('fetch Payment Summary Url successfully local', () async {
        mockConfig.appFlavor = Flavor.mock;
        when(() => localDataSource.getPaymentSummaryFileDownloadUrl())
            .thenAnswer(
          (invocation) async => downloadPaymentAttachment,
        );

        final result =
            await downloadPaymentAttachmentRepository.fetchPaymentSummaryUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeMYSalesOrganisation,
          paymentSummaryFilter: PaymentSummaryFilter.defaultFilter(),
          isMarketPlace: true,
        );
        expect(
          result,
          Right(downloadPaymentAttachment),
        );
      });

      test('fetch Payment Summary Url failure local', () async {
        mockConfig.appFlavor = Flavor.mock;
        when(() => localDataSource.getPaymentSummaryFileDownloadUrl())
            .thenThrow(fakeError);

        final result =
            await downloadPaymentAttachmentRepository.fetchPaymentSummaryUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeMYSalesOrganisation,
          paymentSummaryFilter: PaymentSummaryFilter.defaultFilter(),
          isMarketPlace: true,
        );
        expect(
          result,
          Left(FailureHandler.handleFailure(fakeError)),
        );
      });

      test('fetch Payment Summary Url success remote', () async {
        mockConfig.appFlavor = Flavor.uat;
        when(
          () => remoteDataSource.getPaymentSummaryFileDownloadUrl(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            salesOrg: fakeMYSalesOrganisation.salesOrg.getOrCrash(),
            filterBy: filterListForPaymentSummary,
            isMarketPlace: true,
          ),
        ).thenAnswer(
          (invocation) async => downloadPaymentAttachment,
        );

        final result =
            await downloadPaymentAttachmentRepository.fetchPaymentSummaryUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeMYSalesOrganisation,
          paymentSummaryFilter: PaymentSummaryFilter.defaultFilter(),
          isMarketPlace: true,
        );
        expect(
          result,
          Right(downloadPaymentAttachment),
        );
      });

      test(
        'fetch Payment Summary Url success remote for ID',
        () async {
          mockConfig.appFlavor = Flavor.uat;
          final filter = PaymentSummaryFilter.defaultFilter()
              .copyWith(filterStatuses: [FilterStatus('in progress')]);
          when(
            () => remoteDataSource.getPaymentSummaryFileDownloadUrl(
              customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
              salesOrg: fakeIDSalesOrganisation.salesOrg.getOrCrash(),
              filterBy: PaymentSummaryFilterDto.fromDomain(filter).toMapList,
              isMarketPlace: false,
            ),
          ).thenAnswer(
            (invocation) async => downloadPaymentAttachment,
          );

          final result =
              await downloadPaymentAttachmentRepository.fetchPaymentSummaryUrl(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganization: fakeIDSalesOrganisation,
            paymentSummaryFilter: filter,
            isMarketPlace: false,
          );
          expect(
            result,
            Right(downloadPaymentAttachment),
          );
        },
      );

      test('fetch Payment Summary Url failure remote', () async {
        mockConfig.appFlavor = Flavor.uat;
        when(
          () => remoteDataSource.getPaymentSummaryFileDownloadUrl(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            salesOrg: fakeMYSalesOrganisation.salesOrg.getOrCrash(),
            filterBy: filterListForPaymentSummary,
            isMarketPlace: false,
          ),
        ).thenThrow(fakeError);

        final result =
            await downloadPaymentAttachmentRepository.fetchPaymentSummaryUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          salesOrganization: fakeMYSalesOrganisation,
          paymentSummaryFilter: PaymentSummaryFilter.defaultFilter(),
          isMarketPlace: false,
        );
        expect(
          result,
          Left(FailureHandler.handleFailure(fakeError)),
        );
      });

      test(
        'fetch Payment Summary Url failure remote for ID',
        () async {
          mockConfig.appFlavor = Flavor.uat;
          final filter = PaymentSummaryFilter.defaultFilter()
              .copyWith(filterStatuses: [FilterStatus('in progress')]);
          when(
            () => remoteDataSource.getPaymentSummaryFileDownloadUrl(
              customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
              salesOrg: fakeIDSalesOrganisation.salesOrg.getOrCrash(),
              filterBy: PaymentSummaryFilterDto.fromDomain(filter).toMapList,
              isMarketPlace: false,
            ),
          ).thenThrow(fakeError);

          final result =
              await downloadPaymentAttachmentRepository.fetchPaymentSummaryUrl(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganization: fakeIDSalesOrganisation,
            paymentSummaryFilter: filter,
            isMarketPlace: false,
          );
          expect(
            result,
            Left(FailureHandler.handleFailure(fakeError)),
          );
        },
      );
    });

    group('Download Permission tests', () {
      test(
          'Download Permission successfully when checkIfDeviceIsAndroidWithSDK33 is true',
          () async {
        when(() => deviceInfo.checkIfDeviceIsAndroidWithSDK33()).thenAnswer(
          (_) async => true,
        );

        final result =
            await downloadPaymentAttachmentRepository.downloadPermission();
        expect(
          result,
          const Right(PermissionStatus.granted),
        );
      });

      test(
          'Download Permission successfully when checkIfDeviceIsAndroidWithSDK33 is false and PermissionStatus is granted',
          () async {
        when(() => deviceInfo.checkIfDeviceIsAndroidWithSDK33()).thenAnswer(
          (_) async => false,
        );
        when(() => permissionService.requestStoragePermission()).thenAnswer(
          (_) async => PermissionStatus.granted,
        );

        final result =
            await downloadPaymentAttachmentRepository.downloadPermission();
        expect(
          result,
          const Right(PermissionStatus.granted),
        );
      });

      test(
          'Download Permission successfully when checkIfDeviceIsAndroidWithSDK33 is false and PermissionStatus is limited',
          () async {
        when(() => deviceInfo.checkIfDeviceIsAndroidWithSDK33()).thenAnswer(
          (_) async => false,
        );
        when(() => permissionService.requestStoragePermission()).thenAnswer(
          (_) async => PermissionStatus.limited,
        );

        final result =
            await downloadPaymentAttachmentRepository.downloadPermission();
        expect(
          result,
          const Right(PermissionStatus.limited),
        );
      });

      test(
          'Download Permission failed when checkIfDeviceIsAndroidWithSDK33 is false and PermissionStatus is other than granted & limited',
          () async {
        when(() => deviceInfo.checkIfDeviceIsAndroidWithSDK33())
            .thenThrow(fakeError);
        when(() => permissionService.requestStoragePermission()).thenAnswer(
          (_) async => PermissionStatus.denied,
        );

        final result =
            await downloadPaymentAttachmentRepository.downloadPermission();
        expect(
          result,
          Left(FailureHandler.handleFailure(fakeError)),
        );
      });
    });

    group('Download Files tests', () {
      test('Download Files successfully local', () async {
        mockConfig.appFlavor = Flavor.mock;
        when(() => localDataSource.fileDownload()).thenAnswer(
          (_) async => attachmentFileBuffer,
        );
        when(
          () => fileSystemHelper.getDownloadedFile(
            attachmentFileBuffer,
          ),
        ).thenAnswer(
          (_) async => fileMock,
        );

        final result = await downloadPaymentAttachmentRepository.downloadFiles(
          files: downloadPaymentAttachment,
        );
        expect(
          result,
          Right(fileMock),
        );
      });

      test('Download Files failure local', () async {
        when(() => localDataSource.fileDownload()).thenAnswer(
          (_) async => attachmentFileBuffer,
        );
        when(
          () => fileSystemHelper.getDownloadedFile(
            attachmentFileBuffer,
          ),
        ).thenThrow(fakeError);

        final result = await downloadPaymentAttachmentRepository.downloadFiles(
          files: downloadPaymentAttachment,
        );
        expect(
          result,
          Left(FailureHandler.handleFailure(fakeError)),
        );
      });

      test('Download Files successfully remote', () async {
        mockConfig.appFlavor = Flavor.uat;
        when(() => remoteDataSource.fileDownload(downloadPaymentAttachment.url))
            .thenAnswer(
          (_) async => attachmentFileBuffer,
        );
        when(
          () => fileSystemHelper.getDownloadedFile(
            attachmentFileBuffer,
          ),
        ).thenAnswer(
          (_) async => fileMock,
        );

        final result = await downloadPaymentAttachmentRepository.downloadFiles(
          files: downloadPaymentAttachment,
        );
        expect(
          result,
          Right(fileMock),
        );
      });

      test('Download Files failure remote', () async {
        mockConfig.appFlavor = Flavor.uat;
        when(() => remoteDataSource.fileDownload(downloadPaymentAttachment.url))
            .thenAnswer(
          (_) async => attachmentFileBuffer,
        );
        when(
          () => fileSystemHelper.getDownloadedFile(
            attachmentFileBuffer,
          ),
        ).thenThrow(fakeError);

        final result = await downloadPaymentAttachmentRepository.downloadFiles(
          files: downloadPaymentAttachment,
        );
        expect(
          result,
          Left(FailureHandler.handleFailure(fakeError)),
        );
      });
    });

    group('Soa Download tests', () {
      test('Soa Download successfully local', () async {
        mockConfig.appFlavor = Flavor.mock;
        when(() => localDataSource.soaDownload()).thenAnswer(
          (_) async => attachmentFileBuffer,
        );
        when(
          () => fileSystemHelper.getDownloadedFile(
            attachmentFileBuffer,
          ),
        ).thenAnswer(
          (_) async => fileMock,
        );

        final result = await downloadPaymentAttachmentRepository.soaDownload(
          soaData: SoaData(''),
        );
        expect(
          result,
          Right(fileMock),
        );
      });

      test('Soa Download failure local', () async {
        when(() => localDataSource.soaDownload()).thenThrow(fakeError);
        when(
          () => fileSystemHelper.getDownloadedFile(
            attachmentFileBuffer,
          ),
        ).thenThrow(fakeError);

        final result = await downloadPaymentAttachmentRepository.soaDownload(
          soaData: SoaData(''),
        );
        expect(
          result,
          Left(FailureHandler.handleFailure(fakeError)),
        );
      });

      test('Soa Download successfully remote', () async {
        mockConfig.appFlavor = Flavor.uat;
        when(() => remoteDataSource.soaDownload('fake_Data')).thenAnswer(
          (_) async => attachmentFileBuffer,
        );
        when(
          () => fileSystemHelper.getDownloadedFile(
            attachmentFileBuffer,
          ),
        ).thenAnswer(
          (_) async => fileMock,
        );

        final result = await downloadPaymentAttachmentRepository.soaDownload(
          soaData: SoaData('fake_Data'),
        );
        expect(
          result,
          Right(fileMock),
        );
      });

      test('Soa Download failure remote', () async {
        mockConfig.appFlavor = Flavor.uat;
        when(() => remoteDataSource.soaDownload('fake_Data')).thenAnswer(
          (_) async => attachmentFileBuffer,
        );
        when(
          () => fileSystemHelper.getDownloadedFile(
            attachmentFileBuffer,
          ),
        ).thenThrow(fakeError);

        final result = await downloadPaymentAttachmentRepository.soaDownload(
          soaData: SoaData('fake_Data'),
        );
        expect(
          result,
          Left(FailureHandler.handleFailure(fakeError)),
        );
      });
    });

    group('eInvoiceDownload Download tests', () {
      test('eInvoiceDownload Download successfully local', () async {
        mockConfig.appFlavor = Flavor.mock;
        when(() => localDataSource.eInvoiceDownload()).thenAnswer(
          (_) async => attachmentFileBuffer,
        );
        when(
          () => fileSystemHelper.getDownloadedFile(
            attachmentFileBuffer,
          ),
        ).thenAnswer(
          (_) async => fileMock,
        );

        final result =
            await downloadPaymentAttachmentRepository.eCreditInvoiceDownload(
          eCreditInvoiceUrl: DownloadPaymentAttachment.empty(),
        );
        expect(
          result,
          Right(attachmentFileBuffer),
        );
      });

      test('eInvoiceDownload Download failure local', () async {
        when(() => localDataSource.eInvoiceDownload()).thenThrow(fakeError);
        when(
          () => fileSystemHelper.getDownloadedFile(
            attachmentFileBuffer,
          ),
        ).thenThrow(
          (_) async => fakeError,
        );

        final result =
            await downloadPaymentAttachmentRepository.eCreditInvoiceDownload(
          eCreditInvoiceUrl: DownloadPaymentAttachment.empty(),
        );
        expect(
          result,
          Left(FailureHandler.handleFailure(fakeError)),
        );
      });

      test('eInvoiceDownload Download successfully remote', () async {
        mockConfig.appFlavor = Flavor.uat;
        when(() => remoteDataSource.eInvoiceDownload('fake-url')).thenAnswer(
          (_) async => attachmentFileBuffer,
        );
        when(
          () => fileSystemHelper.getDownloadedFile(
            attachmentFileBuffer,
          ),
        ).thenAnswer(
          (_) async => fileMock,
        );

        final result =
            await downloadPaymentAttachmentRepository.eCreditInvoiceDownload(
          eCreditInvoiceUrl: const DownloadPaymentAttachment(url: 'fake-url'),
        );
        expect(
          result,
          Right(attachmentFileBuffer),
        );
      });

      test('eInvoiceDownload Download failure remote', () async {
        when(() => remoteDataSource.eInvoiceDownload('fake-url'))
            .thenThrow(fakeError);
        when(
          () => fileSystemHelper.getDownloadedFile(
            attachmentFileBuffer,
          ),
        ).thenThrow(fakeError);

        final result =
            await downloadPaymentAttachmentRepository.eCreditInvoiceDownload(
          eCreditInvoiceUrl: const DownloadPaymentAttachment(url: 'fake-url'),
        );
        expect(
          result,
          Left(FailureHandler.handleFailure(fakeError)),
        );
      });
    });
  });

  group('Test Download e-credit', () {
    test('fetch credit Url successfully local', () async {
      mockConfig.appFlavor = Flavor.mock;
      when(() => localDataSource.getECreditDownloadUrl()).thenAnswer(
        (invocation) async => downloadPaymentAttachment,
      );

      final result =
          await downloadPaymentAttachmentRepository.getECreditDownloadUrl(
        eCreditNumber: 'fake-eCredit',
      );
      expect(
        result,
        Right(downloadPaymentAttachment),
      );
    });
    test('fetch credit Url fail local', () async {
      mockConfig.appFlavor = Flavor.mock;
      when(() => localDataSource.getECreditDownloadUrl()).thenThrow(
        (invocation) async => fakeError,
      );

      final result =
          await downloadPaymentAttachmentRepository.getECreditDownloadUrl(
        eCreditNumber: 'fake-eCredit',
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('fetch credit Url successfully remote', () async {
      mockConfig.appFlavor = Flavor.uat;
      when(
        () => remoteDataSource.getECreditDownloadUrl(
          eCreditNumber: 'fake-eCredit',
        ),
      ).thenAnswer(
        (invocation) async => downloadPaymentAttachment,
      );

      final result =
          await downloadPaymentAttachmentRepository.getECreditDownloadUrl(
        eCreditNumber: 'fake-eCredit',
      );
      expect(
        result,
        Right(downloadPaymentAttachment),
      );
    });
    test('fetch credit Url fail remote', () async {
      mockConfig.appFlavor = Flavor.uat;
      when(
        () => remoteDataSource.getECreditDownloadUrl(
          eCreditNumber: 'fake-eCredit',
        ),
      ).thenThrow(
        (invocation) async => fakeError,
      );

      final result =
          await downloadPaymentAttachmentRepository.getECreditDownloadUrl(
        eCreditNumber: 'fake-eCredit',
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test('fetch credit Url successfully remote and response is empty',
        () async {
      mockConfig.appFlavor = Flavor.uat;
      when(
        () => remoteDataSource.getECreditDownloadUrl(
          eCreditNumber: 'fake-eCredit',
        ),
      ).thenAnswer(
        (invocation) async => DownloadPaymentAttachment.empty(),
      );

      final result =
          await downloadPaymentAttachmentRepository.getECreditDownloadUrl(
        eCreditNumber: 'fake-eCredit',
      );
      expect(
        result,
        Right(DownloadPaymentAttachment.empty()),
      );
    });

    group('View saved file -', () {
      test('Success', () async {
        when(
          () => fileSystemHelper.openFile(attachmentFileBuffer),
        ).thenAnswer((invocation) async => OpenResult());

        final result = await downloadPaymentAttachmentRepository.viewSavedFile(
          savedFile: attachmentFileBuffer,
        );
        expect(result, const Right(unit));
      });

      test('Failure with default failure type', () async {
        when(
          () => fileSystemHelper.openFile(attachmentFileBuffer),
        ).thenAnswer(
          (_) async =>
              OpenResult(type: ResultType.error, message: 'fake-error'),
        );

        final result = await downloadPaymentAttachmentRepository.viewSavedFile(
          savedFile: attachmentFileBuffer,
        );
        expect(
          result,
          const Left(ApiFailure.openDownloadedFileError('fake-error')),
        );
      });

      test('Failure with exception', () async {
        when(
          () => fileSystemHelper.openFile(attachmentFileBuffer),
        ).thenThrow(MockException(message: 'fake-error'));

        final result = await downloadPaymentAttachmentRepository.viewSavedFile(
          savedFile: attachmentFileBuffer,
        );
        expect(result, const Left(ApiFailure.other('fake-error')));
      });
    });
  });
}

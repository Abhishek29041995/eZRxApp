import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_filter.dart';
import 'package:universal_io/io.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/soa.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/full_summary_filter.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/soa_local.dart';
import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/download_payment_attachment_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/download_payment_attachment_local_datasource.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class DownloadPaymentAttachmentRepositoryMock extends Mock
    implements DownloadPaymentAttachmentRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late DownloadPaymentAttachmentRepository downloadPaymentAttachmentRepository;
  late DownloadPaymentAttachment downloadPaymentAttachmentMockData;
  late List<Soa> soaList;
  const fakeError = ApiFailure.other('fake-error');
  final salesOrganization = fakeMYSalesOrganisation;
  final customerCodeInfo = fakeCustomerCodeInfo;
  final file = File('fake-url');

  group('Download Payment Attachment', () {
    setUpAll(() async {
      downloadPaymentAttachmentRepository =
          DownloadPaymentAttachmentRepositoryMock();

      downloadPaymentAttachmentMockData =
          await DownloadPaymentAttachmentLocalDataSource().getFileDownloadUrl();
      soaList = await SoaLocalDataSource().getSoa();
      downloadPaymentAttachmentMockData =
          await DownloadPaymentAttachmentLocalDataSource().getFileDownloadUrl();
    });

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download all invoice url fail',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      )..add(
          DownloadPaymentAttachmentEvent.initialized(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
          ),
        ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.fetchAllInvoiceUrl(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
            queryObject: AllInvoicesFilter.defaultFilter(),
            isMarketPlace: true,
          ),
        ).thenAnswer(
          (invocation) async => const Left(fakeError),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.fetchAllInvoiceUrl(
          queryObject: AllInvoicesFilter.defaultFilter(),
          isMarketPlace: true,
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          isDownloadInProgress: true,
          failureOrSuccessOption: none(),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          failureOrSuccessOption: optionOf(
            const Left(fakeError),
          ),
          isDownloadInProgress: false,
        ),
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download all invoice url success',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      )..add(
          DownloadPaymentAttachmentEvent.initialized(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
          ),
        ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.fetchAllInvoiceUrl(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
            queryObject: AllInvoicesFilter.defaultFilter(),
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => Right(downloadPaymentAttachmentMockData),
        );
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer(
          (invocation) async => const Right(PermissionStatus.granted),
        );
        when(
          () => downloadPaymentAttachmentRepository.downloadFiles(
            files: downloadPaymentAttachmentMockData,
          ),
        ).thenAnswer(
          (invocation) async => Right(file),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.fetchAllInvoiceUrl(
          queryObject: AllInvoicesFilter.defaultFilter(),
          isMarketPlace: false,
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          isDownloadInProgress: true,
          failureOrSuccessOption: none(),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          failureOrSuccessOption: optionOf(Right(file)),
          isDownloadInProgress: false,
        ),
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download credit url fail',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      )..add(
          DownloadPaymentAttachmentEvent.initialized(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
          ),
        ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.fetchAllCreditUrl(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
            queryObject: AllCreditsFilter.defaultFilter(),
            isMarketPlace: true,
          ),
        ).thenAnswer(
          (invocation) async => const Left(fakeError),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.fetchAllCreditUrl(
          queryObject: AllCreditsFilter.defaultFilter(),
          isMarketPlace: true,
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          isDownloadInProgress: true,
          failureOrSuccessOption: none(),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          failureOrSuccessOption: optionOf(
            const Left(fakeError),
          ),
          isDownloadInProgress: false,
        ),
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download credit url success',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      )..add(
          DownloadPaymentAttachmentEvent.initialized(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
          ),
        ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.fetchAllCreditUrl(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
            queryObject: AllCreditsFilter.defaultFilter(),
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => Right(downloadPaymentAttachmentMockData),
        );
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer(
          (invocation) async => const Right(PermissionStatus.granted),
        );
        when(
          () => downloadPaymentAttachmentRepository.downloadFiles(
            files: downloadPaymentAttachmentMockData,
          ),
        ).thenAnswer(
          (invocation) async => Right(file),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.fetchAllCreditUrl(
          queryObject: AllCreditsFilter.defaultFilter(),
          isMarketPlace: false,
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          isDownloadInProgress: true,
          failureOrSuccessOption: none(),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          failureOrSuccessOption: optionOf(Right(file)),
          isDownloadInProgress: false,
        ),
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download paymentSummary url fail',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      )..add(
          DownloadPaymentAttachmentEvent.initialized(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
          ),
        ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.fetchPaymentSummaryUrl(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
            paymentSummaryFilter: PaymentSummaryFilter.defaultFilter(),
            isMarketPlace: true,
          ),
        ).thenAnswer(
          (invocation) async => const Left(fakeError),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.fetchPaymentSummaryUrl(
          paymentSummaryFilter: PaymentSummaryFilter.defaultFilter(),
          isMarketPlace: true,
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          isDownloadInProgress: true,
          failureOrSuccessOption: none(),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          failureOrSuccessOption: optionOf(
            const Left(fakeError),
          ),
          isDownloadInProgress: false,
        ),
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download paymentSummary url success',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      )..add(
          DownloadPaymentAttachmentEvent.initialized(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
          ),
        ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.fetchPaymentSummaryUrl(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
            paymentSummaryFilter: PaymentSummaryFilter.defaultFilter(),
            isMarketPlace: true,
          ),
        ).thenAnswer(
          (invocation) async => Right(downloadPaymentAttachmentMockData),
        );
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer(
          (invocation) async => const Right(PermissionStatus.granted),
        );
        when(
          () => downloadPaymentAttachmentRepository.downloadFiles(
            files: downloadPaymentAttachmentMockData,
          ),
        ).thenAnswer(
          (invocation) async => Right(file),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.fetchPaymentSummaryUrl(
          paymentSummaryFilter: PaymentSummaryFilter.defaultFilter(),
          isMarketPlace: true,
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          isDownloadInProgress: true,
          failureOrSuccessOption: none(),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          failureOrSuccessOption: optionOf(Right(file)),
          isDownloadInProgress: false,
        ),
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download permission failed',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      )..add(
          DownloadPaymentAttachmentEvent.initialized(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
          ),
        ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.fetchPaymentSummaryUrl(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
            paymentSummaryFilter: PaymentSummaryFilter.defaultFilter(),
            isMarketPlace: true,
          ),
        ).thenAnswer(
          (invocation) async => Right(downloadPaymentAttachmentMockData),
        );
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer(
          (invocation) async => const Left(fakeError),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.fetchPaymentSummaryUrl(
          paymentSummaryFilter: PaymentSummaryFilter.defaultFilter(),
          isMarketPlace: true,
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          isDownloadInProgress: true,
          failureOrSuccessOption: none(),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          failureOrSuccessOption: optionOf(
            const Left(fakeError),
          ),
          isDownloadInProgress: false,
        ),
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download file failed',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      )..add(
          DownloadPaymentAttachmentEvent.initialized(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
          ),
        ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.fetchPaymentSummaryUrl(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
            paymentSummaryFilter: PaymentSummaryFilter.defaultFilter(),
            isMarketPlace: true,
          ),
        ).thenAnswer(
          (invocation) async => Right(downloadPaymentAttachmentMockData),
        );
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer(
          (invocation) async => const Right(PermissionStatus.granted),
        );
        when(
          () => downloadPaymentAttachmentRepository.downloadFiles(
            files: downloadPaymentAttachmentMockData,
          ),
        ).thenAnswer(
          (invocation) async => const Left(fakeError),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.fetchPaymentSummaryUrl(
          paymentSummaryFilter: PaymentSummaryFilter.defaultFilter(),
          isMarketPlace: true,
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          isDownloadInProgress: true,
          failureOrSuccessOption: none(),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          failureOrSuccessOption: optionOf(
            const Left(fakeError),
          ),
          isDownloadInProgress: false,
        ),
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download full summary url success',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      ),
      seed: () => DownloadPaymentAttachmentsState.initial().copyWith(
        customerCodeInfo: customerCodeInfo,
        salesOrganization: salesOrganization,
      ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.fetchFullSummaryUrl(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
            queryObject: FullSummaryFilter.defaultFilter(),
            isMarketPlace: true,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            downloadPaymentAttachmentMockData,
          ),
        );
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer(
          (invocation) async => const Right(PermissionStatus.granted),
        );
        when(
          () => downloadPaymentAttachmentRepository.downloadFiles(
            files: downloadPaymentAttachmentMockData,
          ),
        ).thenAnswer(
          (invocation) async => Right(file),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.fetchFullSummaryUrl(
          queryObject: FullSummaryFilter.defaultFilter(),
          isMarketPlace: true,
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          isDownloadInProgress: true,
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          failureOrSuccessOption: optionOf(
            Right(file),
          ),
        ),
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download full summary url failure',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      ),
      seed: () => DownloadPaymentAttachmentsState.initial().copyWith(
        customerCodeInfo: customerCodeInfo,
        salesOrganization: salesOrganization,
      ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.fetchFullSummaryUrl(
            customerCodeInfo: customerCodeInfo,
            salesOrganization: salesOrganization,
            queryObject: FullSummaryFilter.defaultFilter(),
            isMarketPlace: false,
          ),
        ).thenAnswer(
          (invocation) async => const Left(fakeError),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.fetchFullSummaryUrl(
          queryObject: FullSummaryFilter.defaultFilter(),
          isMarketPlace: false,
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          isDownloadInProgress: true,
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          failureOrSuccessOption: optionOf(
            const Left(fakeError),
          ),
        ),
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download Soa url success',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      ),
      seed: () => DownloadPaymentAttachmentsState.initial().copyWith(
        customerCodeInfo: customerCodeInfo,
        salesOrganization: salesOrganization,
      ),
      setUp: () {
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer(
          (invocation) async => const Right(PermissionStatus.granted),
        );
        when(
          () => downloadPaymentAttachmentRepository.soaDownload(
            soaData: soaList.first.soaData,
          ),
        ).thenAnswer(
          (invocation) async => Right(file),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.downloadSOA(
          soaData: soaList.first.soaData,
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          isDownloadInProgress: true,
          fileUrl: DownloadPaymentAttachment(
            url: soaList.first.soaData.getValue(),
          ),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          fileUrl: DownloadPaymentAttachment(
            url: soaList.first.soaData.getValue(),
          ),
          failureOrSuccessOption: optionOf(
            Right(file),
          ),
        ),
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download Soa url fail',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      ),
      seed: () => DownloadPaymentAttachmentsState.initial().copyWith(
        customerCodeInfo: customerCodeInfo,
        salesOrganization: salesOrganization,
      ),
      setUp: () {
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer(
          (invocation) async => const Right(PermissionStatus.granted),
        );
        when(
          () => downloadPaymentAttachmentRepository.soaDownload(
            soaData: soaList.first.soaData,
          ),
        ).thenAnswer(
          (invocation) async => const Left(fakeError),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.downloadSOA(
          soaData: soaList.first.soaData,
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          isDownloadInProgress: true,
          fileUrl: DownloadPaymentAttachment(
            url: soaList.first.soaData.getValue(),
          ),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          fileUrl: DownloadPaymentAttachment(
            url: soaList.first.soaData.getValue(),
          ),
          failureOrSuccessOption: optionOf(const Left(fakeError)),
        ),
      ],
    );

    blocTest<DownloadPaymentAttachmentsBloc, DownloadPaymentAttachmentsState>(
      'Download Soa storage permission failure',
      build: () => DownloadPaymentAttachmentsBloc(
        paymentAttachmentRepository: downloadPaymentAttachmentRepository,
      ),
      seed: () => DownloadPaymentAttachmentsState.initial().copyWith(
        customerCodeInfo: customerCodeInfo,
        salesOrganization: salesOrganization,
      ),
      setUp: () {
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer(
          (invocation) async => const Left(fakeError),
        );
      },
      act: (bloc) => bloc.add(
        DownloadPaymentAttachmentEvent.downloadSOA(
          soaData: soaList.first.soaData,
        ),
      ),
      expect: () => [
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          isDownloadInProgress: true,
          fileUrl: DownloadPaymentAttachment(
            url: soaList.first.soaData.getValue(),
          ),
        ),
        DownloadPaymentAttachmentsState.initial().copyWith(
          customerCodeInfo: customerCodeInfo,
          salesOrganization: salesOrganization,
          fileUrl: DownloadPaymentAttachment(
            url: soaList.first.soaData.getValue(),
          ),
          failureOrSuccessOption: optionOf(const Left(fakeError)),
        ),
      ],
    );
  });
}

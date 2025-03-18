import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/download_payment_attachment_repository.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/e_invoice_repository.dart';
import 'package:ezrxmobile/application/payments/download_e_invoice/download_e_invoice_bloc.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/download_payment_attachment_local_datasource.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class EInvoiceRepositoryMock extends Mock implements EInvoiceRepository {}

class DownloadPaymentAttachmentRepositoryMock extends Mock
    implements DownloadPaymentAttachmentRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late EInvoiceRepository eInvoiceRepository;
  late DownloadPaymentAttachmentRepository downloadPaymentAttachmentRepository;
  late DownloadPaymentAttachment downloadPaymentAttachmentMockData;
  const invoiceNumber = 'fake-invoice-number';
  const fakeError = ApiFailure.other('fake-error');
  const fakeUrl = DownloadPaymentAttachment(url: 'fake-e-invoice-url');
  final fakeFile = AttachmentFileBuffer.empty().copyWith(name: 'fake-file');
  group('Download Payment Attachment', () {
    setUpAll(() async {
      eInvoiceRepository = EInvoiceRepositoryMock();
      downloadPaymentAttachmentRepository =
          DownloadPaymentAttachmentRepositoryMock();
      downloadPaymentAttachmentMockData =
          await DownloadPaymentAttachmentLocalDataSource().getFileDownloadUrl();
      WidgetsFlutterBinding.ensureInitialized();
    });

    blocTest<DownloadEInvoiceBloc, DownloadEInvoiceState>(
      'Download e invoice initialized event',
      build: () => DownloadEInvoiceBloc(
        eInvoiceRepository: eInvoiceRepository,
        downloadPaymentAttachmentRepository:
            downloadPaymentAttachmentRepository,
      ),
      act: (bloc) => bloc.add(
        const DownloadEInvoiceEvent.initialized(),
      ),
      expect: () => [DownloadEInvoiceState.initial()],
    );

    blocTest<DownloadEInvoiceBloc, DownloadEInvoiceState>(
      'Download e invoice url fetch fail',
      build: () => DownloadEInvoiceBloc(
        eInvoiceRepository: eInvoiceRepository,
        downloadPaymentAttachmentRepository:
            downloadPaymentAttachmentRepository,
      ),
      setUp: () {
        when(
          () => eInvoiceRepository.getEInvoice(
            customerCodeInfo: fakeCustomerCodeInfo,
            invoiceNumber: invoiceNumber,
            salesOrg: fakeMYSalesOrg,
          ),
        ).thenAnswer((_) async => const Left(fakeError));
      },
      act: (bloc) => bloc.add(
        DownloadEInvoiceEvent.fetchUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          invoiceNumber: invoiceNumber,
          salesOrg: fakeMYSalesOrg,
        ),
      ),
      expect: () => [
        DownloadEInvoiceState.initial(),
        DownloadEInvoiceState.initial().copyWith(
          failureOrSuccessOption: optionOf(const Left(fakeError)),
        ),
      ],
    );

    blocTest<DownloadEInvoiceBloc, DownloadEInvoiceState>(
      'Download e invoice url fetch success',
      build: () => DownloadEInvoiceBloc(
        eInvoiceRepository: eInvoiceRepository,
        downloadPaymentAttachmentRepository:
            downloadPaymentAttachmentRepository,
      ),
      seed: () => DownloadEInvoiceState.initial().copyWith(
        failureOrSuccessOption: optionOf(const Left(fakeError)),
      ),
      setUp: () {
        when(
          () => eInvoiceRepository.getEInvoice(
            customerCodeInfo: fakeCustomerCodeInfo,
            invoiceNumber: invoiceNumber,
            salesOrg: fakeMYSalesOrg,
          ),
        ).thenAnswer((_) async => Right(downloadPaymentAttachmentMockData));
      },
      act: (bloc) => bloc.add(
        DownloadEInvoiceEvent.fetchUrl(
          customerCodeInfo: fakeCustomerCodeInfo,
          invoiceNumber: invoiceNumber,
          salesOrg: fakeMYSalesOrg,
        ),
      ),
      expect: () => [
        DownloadEInvoiceState.initial(),
        DownloadEInvoiceState.initial().copyWith(
          eInvoiceUrl: downloadPaymentAttachmentMockData,
        ),
      ],
    );

    blocTest<DownloadEInvoiceBloc, DownloadEInvoiceState>(
      'Download e invoice fail when ask for permission',
      build: () => DownloadEInvoiceBloc(
        eInvoiceRepository: eInvoiceRepository,
        downloadPaymentAttachmentRepository:
            downloadPaymentAttachmentRepository,
      ),
      seed: () => DownloadEInvoiceState.initial().copyWith(
        failureOrSuccessOption: optionOf(const Left(fakeError)),
        eInvoiceUrl: fakeUrl,
      ),
      setUp: () {
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer((_) async => const Left(fakeError));
      },
      act: (bloc) => bloc.add(const DownloadEInvoiceEvent.download()),
      expect: () => [
        DownloadEInvoiceState.initial().copyWith(
          isDownloading: true,
          eInvoiceUrl: fakeUrl,
        ),
        DownloadEInvoiceState.initial().copyWith(
          failureOrSuccessOption: optionOf(const Left(fakeError)),
          eInvoiceUrl: fakeUrl,
        ),
      ],
    );

    blocTest<DownloadEInvoiceBloc, DownloadEInvoiceState>(
      'Download e invoice fail when download the file',
      build: () => DownloadEInvoiceBloc(
        eInvoiceRepository: eInvoiceRepository,
        downloadPaymentAttachmentRepository:
            downloadPaymentAttachmentRepository,
      ),
      seed: () => DownloadEInvoiceState.initial().copyWith(
        failureOrSuccessOption: optionOf(const Left(fakeError)),
        eInvoiceUrl: fakeUrl,
      ),
      setUp: () {
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer((_) async => const Right(PermissionStatus.granted));
        when(
          () => downloadPaymentAttachmentRepository.eCreditInvoiceDownload(
            eCreditInvoiceUrl: fakeUrl,
          ),
        ).thenAnswer((_) async => const Left(fakeError));
      },
      act: (bloc) => bloc.add(const DownloadEInvoiceEvent.download()),
      expect: () => [
        DownloadEInvoiceState.initial().copyWith(
          isDownloading: true,
          eInvoiceUrl: fakeUrl,
        ),
        DownloadEInvoiceState.initial().copyWith(
          failureOrSuccessOption: optionOf(const Left(fakeError)),
          eInvoiceUrl: fakeUrl,
        ),
      ],
    );

    blocTest<DownloadEInvoiceBloc, DownloadEInvoiceState>(
      'Download e invoice success',
      build: () => DownloadEInvoiceBloc(
        eInvoiceRepository: eInvoiceRepository,
        downloadPaymentAttachmentRepository:
            downloadPaymentAttachmentRepository,
      ),
      seed: () => DownloadEInvoiceState.initial().copyWith(
        failureOrSuccessOption: optionOf(const Left(fakeError)),
        eInvoiceUrl: fakeUrl,
      ),
      setUp: () {
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer((_) async => const Right(PermissionStatus.granted));
        when(
          () => downloadPaymentAttachmentRepository.eCreditInvoiceDownload(
            eCreditInvoiceUrl: fakeUrl,
          ),
        ).thenAnswer((_) async => Right(fakeFile));
      },
      act: (bloc) => bloc.add(const DownloadEInvoiceEvent.download()),
      expect: () => [
        DownloadEInvoiceState.initial().copyWith(
          isDownloading: true,
          eInvoiceUrl: fakeUrl,
        ),
        DownloadEInvoiceState.initial().copyWith(
          failureOrSuccessOption: optionOf(Right(fakeFile)),
          eInvoice: fakeFile,
          eInvoiceUrl: fakeUrl,
        ),
      ],
    );

    blocTest<DownloadEInvoiceBloc, DownloadEInvoiceState>(
      'Open e invoice failure',
      build: () => DownloadEInvoiceBloc(
        eInvoiceRepository: eInvoiceRepository,
        downloadPaymentAttachmentRepository:
            downloadPaymentAttachmentRepository,
      ),
      seed: () => DownloadEInvoiceState.initial().copyWith(
        failureOrSuccessOption: optionOf(const Left(fakeError)),
        eInvoice: fakeFile,
      ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.viewSavedFile(
            savedFile: fakeFile,
          ),
        ).thenAnswer((_) async => const Left(fakeError));
      },
      act: (bloc) => bloc.add(const DownloadEInvoiceEvent.openFile()),
      expect: () => [
        DownloadEInvoiceState.initial().copyWith(eInvoice: fakeFile),
        DownloadEInvoiceState.initial().copyWith(
          eInvoice: fakeFile,
          failureOrSuccessOption: optionOf(const Left(fakeError)),
        ),
      ],
    );

    blocTest<DownloadEInvoiceBloc, DownloadEInvoiceState>(
      'Open e invoice success',
      build: () => DownloadEInvoiceBloc(
        eInvoiceRepository: eInvoiceRepository,
        downloadPaymentAttachmentRepository:
            downloadPaymentAttachmentRepository,
      ),
      seed: () => DownloadEInvoiceState.initial().copyWith(
        failureOrSuccessOption: optionOf(const Left(fakeError)),
        eInvoice: fakeFile,
      ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.viewSavedFile(
            savedFile: fakeFile,
          ),
        ).thenAnswer((_) async => const Right(unit));
      },
      act: (bloc) => bloc.add(const DownloadEInvoiceEvent.openFile()),
      expect: () => [
        DownloadEInvoiceState.initial().copyWith(eInvoice: fakeFile),
      ],
    );
  });
}

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/download_e_credit/download_e_credit_bloc.dart';
import 'package:ezrxmobile/domain/core/attachment_files/entities/attachment_file_buffer.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/download_payment_attachment_repository.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/download_payment_attachment_local_datasource.dart';

class DownloadPaymentAttachmentRepositoryMock extends Mock
    implements DownloadPaymentAttachmentRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late DownloadPaymentAttachmentRepository downloadPaymentAttachmentRepository;
  late DownloadPaymentAttachment downloadPaymentAttachmentMockData;
  const fakeError = ApiFailure.other('fake-error');
  final file = AttachmentFileBuffer.empty().copyWith(name: 'fake-name');

  group('Download e-credit', () {
    setUpAll(() async {
      downloadPaymentAttachmentRepository =
          DownloadPaymentAttachmentRepositoryMock();

      downloadPaymentAttachmentMockData =
          await DownloadPaymentAttachmentLocalDataSource().getFileDownloadUrl();

      downloadPaymentAttachmentMockData =
          await DownloadPaymentAttachmentLocalDataSource().getFileDownloadUrl();
    });

    blocTest<DownloadECreditBloc, DownloadECreditState>(
      'Download e-credit success',
      build: () => DownloadECreditBloc(
        repository: downloadPaymentAttachmentRepository,
      ),
      seed: () => DownloadECreditState.initial().copyWith(
        fileUrl: downloadPaymentAttachmentMockData,
      ),
      setUp: () {
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer(
          (invocation) async => const Right(PermissionStatus.granted),
        );

        when(
          () => downloadPaymentAttachmentRepository.eCreditInvoiceDownload(
            eCreditInvoiceUrl: downloadPaymentAttachmentMockData,
          ),
        ).thenAnswer(
          (invocation) async => Right(file),
        );
      },
      act: (bloc) => bloc.add(
        const DownloadECreditEvent.downloadECredit(),
      ),
      expect: () => [
        DownloadECreditState.initial().copyWith(
          isDownloading: true,
          fileUrl: downloadPaymentAttachmentMockData,
        ),
        DownloadECreditState.initial().copyWith(
          isDownloading: false,
          fileUrl: downloadPaymentAttachmentMockData,
          failureOrSuccessOption: optionOf(Right(file)),
        ),
      ],
    );

    blocTest<DownloadECreditBloc, DownloadECreditState>(
      'Download e-credit failure',
      build: () => DownloadECreditBloc(
        repository: downloadPaymentAttachmentRepository,
      ),
      seed: () => DownloadECreditState.initial().copyWith(
        fileUrl: downloadPaymentAttachmentMockData,
      ),
      setUp: () {
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer(
          (invocation) async => const Right(PermissionStatus.granted),
        );

        when(
          () => downloadPaymentAttachmentRepository.eCreditInvoiceDownload(
            eCreditInvoiceUrl: downloadPaymentAttachmentMockData,
          ),
        ).thenAnswer(
          (invocation) async => const Left(fakeError),
        );
      },
      act: (bloc) => bloc.add(
        const DownloadECreditEvent.downloadECredit(),
      ),
      expect: () => [
        DownloadECreditState.initial().copyWith(
          isDownloading: true,
          fileUrl: downloadPaymentAttachmentMockData,
        ),
        DownloadECreditState.initial().copyWith(
          isDownloading: false,
          fileUrl: downloadPaymentAttachmentMockData,
          failureOrSuccessOption: optionOf(const Left(fakeError)),
        ),
      ],
    );
    blocTest<DownloadECreditBloc, DownloadECreditState>(
      'Fetch e-credit url failure',
      build: () => DownloadECreditBloc(
        repository: downloadPaymentAttachmentRepository,
      ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.getECreditDownloadUrl(
            eCreditNumber: 'fake-url',
          ),
        ).thenAnswer(
          (invocation) async => const Left(fakeError),
        );
      },
      act: (bloc) => bloc.add(
        const DownloadECreditEvent.fetchECreditDownloadUrl(
          eCredit: 'fake-url',
        ),
      ),
      expect: () => [
        DownloadECreditState.initial(),
        DownloadECreditState.initial().copyWith(
          failureOrSuccessOption: optionOf(const Left(fakeError)),
        ),
      ],
    );

    blocTest<DownloadECreditBloc, DownloadECreditState>(
      'Fetch e-credit url success',
      build: () => DownloadECreditBloc(
        repository: downloadPaymentAttachmentRepository,
      ),
      setUp: () {
        when(
          () => downloadPaymentAttachmentRepository.getECreditDownloadUrl(
            eCreditNumber: 'fake-url',
          ),
        ).thenAnswer(
          (invocation) async => Right(downloadPaymentAttachmentMockData),
        );
      },
      act: (bloc) => bloc.add(
        const DownloadECreditEvent.fetchECreditDownloadUrl(
          eCredit: 'fake-url',
        ),
      ),
      expect: () => [
        DownloadECreditState.initial(),
        DownloadECreditState.initial().copyWith(
          fileUrl: downloadPaymentAttachmentMockData,
        ),
      ],
    );

    blocTest<DownloadECreditBloc, DownloadECreditState>(
      'Download permission for e credit download  failure',
      build: () => DownloadECreditBloc(
        repository: downloadPaymentAttachmentRepository,
      ),
      seed: () => DownloadECreditState.initial().copyWith(
        fileUrl: downloadPaymentAttachmentMockData,
      ),
      setUp: () {
        when(() => downloadPaymentAttachmentRepository.downloadPermission())
            .thenAnswer(
          (invocation) async => const Left(fakeError),
        );
      },
      act: (bloc) => bloc.add(
        const DownloadECreditEvent.downloadECredit(),
      ),
      expect: () => [
        DownloadECreditState.initial().copyWith(
          isDownloading: true,
          fileUrl: downloadPaymentAttachmentMockData,
        ),
        DownloadECreditState.initial().copyWith(
          isDownloading: false,
          fileUrl: downloadPaymentAttachmentMockData,
          failureOrSuccessOption: optionOf(const Left(fakeError)),
        ),
      ],
    );
  });
}

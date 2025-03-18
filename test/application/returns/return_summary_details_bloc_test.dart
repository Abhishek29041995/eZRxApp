import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/returns/return_summary_details/return_summary_details_bloc.dart';
import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information_header.dart';
import 'package:ezrxmobile/infrastructure/order/repository/po_attachment_repository.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_request_repository.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_summary_details_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../presentation/orders/core/po_attachment_test.dart';

class _MockReturnSummaryDetailsRepository extends Mock
    implements ReturnSummaryDetailsRepository {}

class _MockReturnRequestRepository extends Mock
    implements ReturnRequestRepository {}

void main() {
  late _MockReturnSummaryDetailsRepository mockReturnSummaryDetailsRepository;
  late ReturnRequestRepository mockReturnRequestRepository;
  late PoAttachmentRepository poAttachmentRepository;
  final file = [File('')];
  final fakeReturnItem =
      ReturnItem.empty().copyWith(invoiceID: 'fake-invoice-id');
  final fakeReturnRequestInformation =
      ReturnRequestInformation.empty().copyWith(
    invoiceNo: 'fake-invoice-no',
  );

  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    mockReturnSummaryDetailsRepository = _MockReturnSummaryDetailsRepository();
    mockReturnRequestRepository = _MockReturnRequestRepository();
    poAttachmentRepository = PoAttachmentRepositoryMock();
  });

  group('Return Summary Details Test -', () {
    blocTest(
      'Initialize',
      build: () => ReturnSummaryDetailsBloc(
        returnSummaryDetailsRepository: mockReturnSummaryDetailsRepository,
        returnRequestRepository: mockReturnRequestRepository,
        poAttachmentRepository: poAttachmentRepository,
      ),
      act: (ReturnSummaryDetailsBloc bloc) =>
          bloc.add(const ReturnSummaryDetailsEvent.initialized()),
      expect: () => [ReturnSummaryDetailsState.initial()],
    );

    blocTest(
      'Fetch success',
      build: () => ReturnSummaryDetailsBloc(
        returnSummaryDetailsRepository: mockReturnSummaryDetailsRepository,
        returnRequestRepository: mockReturnRequestRepository,
        poAttachmentRepository: poAttachmentRepository,
      ),
      setUp: () {
        when(
          () => mockReturnSummaryDetailsRepository.getReturnInformation(
            returnItem: fakeReturnItem,
          ),
        ).thenAnswer((_) async => Right(RequestInformation.empty()));
      },
      act: (ReturnSummaryDetailsBloc bloc) => bloc.add(
        ReturnSummaryDetailsEvent.fetch(
          returnItem: fakeReturnItem,
        ),
      ),
      expect: () => [
        ReturnSummaryDetailsState.initial().copyWith(
          isLoading: true,
        ),
        ReturnSummaryDetailsState.initial().copyWith(
          isLoading: false,
          requestInformation: ReturnRequestInformation.empty(),
          requestInformationHeader: ReturnRequestInformationHeader.empty(),
        ),
      ],
    );

    blocTest(
      'Fetch success with data not empty',
      build: () => ReturnSummaryDetailsBloc(
        returnSummaryDetailsRepository: mockReturnSummaryDetailsRepository,
        returnRequestRepository: mockReturnRequestRepository,
        poAttachmentRepository: poAttachmentRepository,
      ),
      setUp: () {
        when(
          () => mockReturnSummaryDetailsRepository.getReturnInformation(
            returnItem: fakeReturnItem,
          ),
        ).thenAnswer(
          (_) async => Right(
            RequestInformation.empty().copyWith(
              returnRequestInformationList: [fakeReturnRequestInformation],
            ),
          ),
        );
      },
      act: (ReturnSummaryDetailsBloc bloc) => bloc.add(
        ReturnSummaryDetailsEvent.fetch(
          returnItem: fakeReturnItem,
        ),
      ),
      expect: () => [
        ReturnSummaryDetailsState.initial().copyWith(
          isLoading: true,
        ),
        ReturnSummaryDetailsState.initial().copyWith(
          isLoading: false,
          requestInformation: fakeReturnRequestInformation,
          requestInformationHeader: ReturnRequestInformationHeader.empty(),
        ),
      ],
    );

    blocTest(
      'Fetch failure',
      build: () => ReturnSummaryDetailsBloc(
        returnSummaryDetailsRepository: mockReturnSummaryDetailsRepository,
        returnRequestRepository: mockReturnRequestRepository,
        poAttachmentRepository: poAttachmentRepository,
      ),
      setUp: () {
        when(
          () => mockReturnSummaryDetailsRepository.getReturnInformation(
            returnItem: fakeReturnItem,
          ),
        ).thenAnswer((_) async => const Left(ApiFailure.other('mock-error')));
      },
      act: (ReturnSummaryDetailsBloc bloc) => bloc.add(
        ReturnSummaryDetailsEvent.fetch(
          returnItem: fakeReturnItem,
        ),
      ),
      expect: () => [
        ReturnSummaryDetailsState.initial().copyWith(
          isLoading: true,
        ),
        ReturnSummaryDetailsState.initial().copyWith(
          isLoading: false,
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('mock-error'))),
        ),
      ],
    );

    group('Download -', () {
      final attachment1 = PoDocuments.empty().copyWith(url: 'fake-url-1');
      final attachment2 = PoDocuments.empty().copyWith(url: 'fake-url-2');

      blocTest(
        'Get permission failed',
        build: () => ReturnSummaryDetailsBloc(
          returnSummaryDetailsRepository: mockReturnSummaryDetailsRepository,
          returnRequestRepository: mockReturnRequestRepository,
          poAttachmentRepository: poAttachmentRepository,
        ),
        setUp: () {
          when(
            () => poAttachmentRepository.downloadPermission(),
          ).thenAnswer((_) async => const Left(ApiFailure.other('mock-error')));
        },
        act: (ReturnSummaryDetailsBloc bloc) => bloc.add(
          ReturnSummaryDetailsEvent.downloadFile(file: attachment1),
        ),
        expect: () => [
          ReturnSummaryDetailsState.initial().copyWith(
            downloadingAttachments: [attachment1],
          ),
          ReturnSummaryDetailsState.initial().copyWith(
            downloadingAttachments: [],
            downloadedAttachment: attachment1,
            downloadFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('mock-error'))),
          ),
        ],
      );

      blocTest(
        'Download failed',
        build: () => ReturnSummaryDetailsBloc(
          returnSummaryDetailsRepository: mockReturnSummaryDetailsRepository,
          returnRequestRepository: mockReturnRequestRepository,
          poAttachmentRepository: poAttachmentRepository,
        ),
        setUp: () {
          when(
            () => poAttachmentRepository.downloadPermission(),
          ).thenAnswer((_) async => const Right(PermissionStatus.granted));
          when(
            () => poAttachmentRepository.downloadFiles(files: [attachment1]),
          ).thenAnswer((_) async => const Left(ApiFailure.other('mock-error')));
        },
        seed: () => ReturnSummaryDetailsState.initial().copyWith(
          downloadingAttachments: [attachment2],
          downloadedAttachment: attachment2,
          downloadFailureOrSuccessOption: optionOf(const Right('')),
        ),
        act: (ReturnSummaryDetailsBloc bloc) => bloc.add(
          ReturnSummaryDetailsEvent.downloadFile(file: attachment1),
        ),
        expect: () => [
          ReturnSummaryDetailsState.initial().copyWith(
            downloadingAttachments: [attachment2, attachment1],
            downloadedAttachment: PoDocuments.empty(),
            downloadFailureOrSuccessOption: none(),
          ),
          ReturnSummaryDetailsState.initial().copyWith(
            downloadingAttachments: [attachment2],
            downloadedAttachment: attachment1,
            downloadFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('mock-error'))),
          ),
        ],
      );

      blocTest(
        'Download success',
        build: () => ReturnSummaryDetailsBloc(
          returnSummaryDetailsRepository: mockReturnSummaryDetailsRepository,
          returnRequestRepository: mockReturnRequestRepository,
          poAttachmentRepository: poAttachmentRepository,
        ),
        setUp: () {
          when(
            () => poAttachmentRepository.downloadPermission(),
          ).thenAnswer((_) async => const Right(PermissionStatus.granted));
          when(
            () => poAttachmentRepository.downloadFiles(files: [attachment1]),
          ).thenAnswer((_) async => Right(file));
        },
        seed: () => ReturnSummaryDetailsState.initial().copyWith(
          downloadingAttachments: [attachment2],
          downloadedAttachment: attachment2,
          downloadFailureOrSuccessOption: optionOf(const Right('')),
        ),
        act: (ReturnSummaryDetailsBloc bloc) => bloc.add(
          ReturnSummaryDetailsEvent.downloadFile(file: attachment1),
        ),
        expect: () => [
          ReturnSummaryDetailsState.initial().copyWith(
            downloadingAttachments: [attachment2, attachment1],
            downloadedAttachment: PoDocuments.empty(),
            downloadFailureOrSuccessOption: none(),
          ),
          ReturnSummaryDetailsState.initial().copyWith(
            downloadingAttachments: [attachment2],
            downloadedAttachment: attachment1,
            downloadFailureOrSuccessOption: optionOf(Right(file)),
          ),
        ],
      );
    });
  });
}

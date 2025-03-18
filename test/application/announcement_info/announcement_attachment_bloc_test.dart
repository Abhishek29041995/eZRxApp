import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_attachment_bloc/announcement_attachment_bloc.dart';
import 'package:ezrxmobile/domain/announcement_info/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/repository/announcement_attachment_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';

class _AnnouncementAttachmentRepositoryMock extends Mock
    implements AnnouncementAttachmentRepository {}

void main() {
  late _AnnouncementAttachmentRepositoryMock repository;
  final announcementAttachmentInitState = AnnouncementAttachmentState.initial();
  const fakeError = ApiFailure.other('fake-error');
  final fakeAttachment = Attachment('fake-url');
  final fakeFile = File('fake-path');

  setUpAll(() {
    repository = _AnnouncementAttachmentRepositoryMock();
  });

  group('Announcement Attachment Bloc', () {
    blocTest(
      'Announcement attachment Initialize',
      build: () => AnnouncementAttachmentBloc(
        announcementAttachmentRepository: repository,
      ),
      act: (AnnouncementAttachmentBloc bloc) => bloc.add(
        const AnnouncementAttachmentEvent.initialized(),
      ),
      expect: () => [
        announcementAttachmentInitState,
      ],
    );

    blocTest(
      'Announcement attachment download file fail by permission',
      build: () => AnnouncementAttachmentBloc(
        announcementAttachmentRepository: repository,
      ),
      setUp: () {
        when(
          () => repository.downloadPermission(),
        ).thenAnswer(
          (_) async => const Left(fakeError),
        );
      },
      act: (AnnouncementAttachmentBloc bloc) => bloc.add(
        AnnouncementAttachmentEvent.downloadFile(url: fakeAttachment),
      ),
      expect: () => [
        announcementAttachmentInitState.copyWith(
          isDownloading: true,
          failureOrSuccessOption: none(),
        ),
        announcementAttachmentInitState.copyWith(
          isDownloading: true,
          failureOrSuccessOption: optionOf(const Left(fakeError)),
        ),
      ],
    );

    blocTest(
      'Announcement attachment download file fail',
      build: () => AnnouncementAttachmentBloc(
        announcementAttachmentRepository: repository,
      ),
      setUp: () {
        when(
          () => repository.downloadPermission(),
        ).thenAnswer(
          (_) async => const Right(PermissionStatus.granted),
        );
        when(
          () => repository.downloadFiles(url: fakeAttachment),
        ).thenAnswer(
          (_) async => const Left(fakeError),
        );
      },
      act: (AnnouncementAttachmentBloc bloc) => bloc.add(
        AnnouncementAttachmentEvent.downloadFile(url: fakeAttachment),
      ),
      expect: () => [
        announcementAttachmentInitState.copyWith(
          isDownloading: true,
          failureOrSuccessOption: none(),
        ),
        announcementAttachmentInitState.copyWith(
          isDownloading: false,
          failureOrSuccessOption: optionOf(const Left(fakeError)),
        ),
      ],
    );

    blocTest(
      'Announcement attachment download file success',
      build: () => AnnouncementAttachmentBloc(
        announcementAttachmentRepository: repository,
      ),
      setUp: () {
        when(
          () => repository.downloadPermission(),
        ).thenAnswer(
          (_) async => const Right(PermissionStatus.granted),
        );
        when(
          () => repository.downloadFiles(url: fakeAttachment),
        ).thenAnswer(
          (_) async => Right(fakeFile),
        );
      },
      act: (AnnouncementAttachmentBloc bloc) => bloc.add(
        AnnouncementAttachmentEvent.downloadFile(url: fakeAttachment),
      ),
      expect: () => [
        announcementAttachmentInitState.copyWith(
          isDownloading: true,
          failureOrSuccessOption: none(),
        ),
        announcementAttachmentInitState.copyWith(
          isDownloading: false,
          failureOrSuccessOption: optionOf(Right(fakeFile)),
        ),
      ],
    );
  });
}

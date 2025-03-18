import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/core/upload_option_type.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:ezrxmobile/infrastructure/order/repository/po_attachment_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../common_mock_data/user_mock.dart';

class PoAttachmentRepositoryMock extends Mock
    implements PoAttachmentRepository {}

class MockFile extends Mock implements File {}

void main() {
  late PoAttachmentRepository poAttachmentRepository;
  final fakePoDocument = PoDocuments.empty().copyWith(
    name: 'fake-file',
    url: 'fake-url',
  );
  final fakePoDocument1 = PoDocuments.empty().copyWith(
    name: 'fake-file-1',
    url: 'fake-url-1',
  );
  final file = [File('')];
  final uploadedFiles = [fakePoDocument];
  final platformFile = PlatformFile(name: fakePoDocument.name, size: 0);
  final listFile = [platformFile];

  group(
    'PoAttachmentBloc Bloc Download Test',
    () {
      setUpAll(() {
        poAttachmentRepository = PoAttachmentRepositoryMock();
      });
      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Initial',
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(
          const PoAttachmentEvent.initialized(),
        ),
        expect: () => [
          PoAttachmentState.initial(),
        ],
      );
      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc Download Permission fail',
        setUp: () {
          when(() => poAttachmentRepository.downloadPermission()).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.storagePermissionFailed(),
            ),
          );
        },
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(
          PoAttachmentEvent.downloadFile(
            files: [fakePoDocument1],
          ),
        ),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.download,
          ),
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.download,
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.storagePermissionFailed(),
              ),
            ),
          ),
        ],
      );
      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc Download file fail',
        setUp: () {
          when(() => poAttachmentRepository.downloadPermission()).thenAnswer(
            (invocation) async => const Right(
              PermissionStatus.granted,
            ),
          );
          when(
            () => poAttachmentRepository.downloadFiles(
              files: [fakePoDocument1],
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(
          PoAttachmentEvent.downloadFile(
            files: [fakePoDocument1],
          ),
        ),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.download,
          ),
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.download,
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake-error'))),
          ),
        ],
      );

      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc Download file success',
        setUp: () {
          when(() => poAttachmentRepository.downloadPermission()).thenAnswer(
            (invocation) async => const Right(
              PermissionStatus.granted,
            ),
          );
          when(
            () => poAttachmentRepository.downloadFiles(
              files: [fakePoDocument1],
            ),
          ).thenAnswer(
            (invocation) async => Right(file),
          );
        },
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(
          PoAttachmentEvent.downloadFile(
            files: [fakePoDocument1],
          ),
        ),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.download,
          ),
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.download,
            failureOrSuccessOption: optionOf(Right(file)),
          ),
        ],
      );
    },
  );

  group(
    'PoAttachmentBloc Bloc Open File Test',
    () {
      setUpAll(() {
        poAttachmentRepository = PoAttachmentRepositoryMock();
      });

      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc Open Permission fail',
        setUp: () {
          when(() => poAttachmentRepository.downloadPermission()).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.storagePermissionFailed(),
            ),
          );
        },
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(
          PoAttachmentEvent.openFile(
            files: fakePoDocument1,
          ),
        ),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            isFetching: true,
            fileOperationMode: FileOperationMode.view,
          ),
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.view,
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.storagePermissionFailed(),
              ),
            ),
          ),
        ],
      );
      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc Open file fail',
        setUp: () {
          when(() => poAttachmentRepository.downloadPermission()).thenAnswer(
            (invocation) async => const Right(
              PermissionStatus.granted,
            ),
          );
          when(
            () => poAttachmentRepository.openFile(
              files: fakePoDocument1,
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(
          PoAttachmentEvent.openFile(
            files: fakePoDocument1,
          ),
        ),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.view,
            isFetching: true,
          ),
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.view,
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake-error'))),
          ),
        ],
      );

      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc Open file success',
        setUp: () {
          when(() => poAttachmentRepository.downloadPermission()).thenAnswer(
            (invocation) async => const Right(
              PermissionStatus.granted,
            ),
          );
          when(
            () => poAttachmentRepository.openFile(
              files: fakePoDocument1,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              OpenResult(),
            ),
          );
        },
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(
          PoAttachmentEvent.openFile(
            files: fakePoDocument1,
          ),
        ),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.view,
            isFetching: true,
          ),
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.view,
          ),
        ],
      );
    },
  );

  group(
    'PoAttachmentBloc Bloc Upload Test',
    () {
      setUpAll(() {
        poAttachmentRepository = PoAttachmentRepositoryMock();
      });

      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc Upload Permission fail',
        setUp: () {
          when(
            () => poAttachmentRepository.getPermission(
              uploadOptionType: UploadOptionType.file,
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.storagePermissionFailed(),
            ),
          );
        },
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(
          const PoAttachmentEvent.pickFile(
            uploadOptionType: UploadOptionType.file,
            submitTicketFileExtension: false,
          ),
        ),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.none,
          ),
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.none,
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.storagePermissionFailed(),
              ),
            ),
          ),
        ],
      );

      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc Upload Invalid format choose',
        setUp: () {
          when(
            () => poAttachmentRepository.pickFiles(
              uploadOptionType: UploadOptionType.file,
              submitTicketFileExtension: false,
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.invalidFileFormat(),
            ),
          );
          when(
            () => poAttachmentRepository.getPermission(
              uploadOptionType: UploadOptionType.file,
            ),
          ).thenAnswer(
            (invocation) async => const Right(
              PermissionStatus.granted,
            ),
          );
        },
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(
          const PoAttachmentEvent.pickFile(
            uploadOptionType: UploadOptionType.file,
            submitTicketFileExtension: false,
          ),
        ),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.none,
          ),
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.none,
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.invalidFileFormat(),
              ),
            ),
          ),
        ],
      );

      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc Upload no file selected',
        setUp: () {
          when(
            () => poAttachmentRepository.pickFiles(
              uploadOptionType: UploadOptionType.file,
              submitTicketFileExtension: false,
            ),
          ).thenAnswer(
            (invocation) async => const Right([]),
          );
          when(
            () => poAttachmentRepository.getPermission(
              uploadOptionType: UploadOptionType.file,
            ),
          ).thenAnswer(
            (invocation) async => const Right(
              PermissionStatus.granted,
            ),
          );
        },
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(
          const PoAttachmentEvent.pickFile(
            uploadOptionType: UploadOptionType.file,
            submitTicketFileExtension: false,
          ),
        ),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.none,
          ),
        ],
      );

      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc pick at least one file',
        setUp: () {
          when(
            () => poAttachmentRepository.pickFiles(
              uploadOptionType: UploadOptionType.file,
              submitTicketFileExtension: false,
            ),
          ).thenAnswer(
            (invocation) async => Right(listFile),
          );
          when(
            () => poAttachmentRepository.getPermission(
              uploadOptionType: UploadOptionType.file,
            ),
          ).thenAnswer(
            (invocation) async => const Right(
              PermissionStatus.granted,
            ),
          );
        },
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(
          const PoAttachmentEvent.pickFile(
            uploadOptionType: UploadOptionType.file,
            submitTicketFileExtension: false,
          ),
        ),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.none,
          ),
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.none,
            failureOrSuccessOption: optionOf(
              Right(listFile),
            ),
            localFiles: listFile,
          ),
        ],
      );

      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc Upload file upload fail',
        seed: () => PoAttachmentState.initial().copyWith(
          localFiles: [platformFile],
        ),
        setUp: () {
          when(
            () => poAttachmentRepository.uploadFiles(
              files: [platformFile],
              user: fakeClientUser,
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('Fake-error'),
            ),
          );
        },
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(
          PoAttachmentEvent.uploadFile(
            user: fakeClientUser,
          ),
        ),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            isFetching: true,
            localFiles: [platformFile],
            fileOperationMode: FileOperationMode.none,
          ),
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.none,
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Fake-error'),
              ),
            ),
          ),
        ],
      );

      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc Upload file upload success',
        seed: () => PoAttachmentState.initial().copyWith(
          localFiles: [platformFile],
        ),
        setUp: () {
          when(
            () => poAttachmentRepository.uploadFiles(
              files: [platformFile],
              user: fakeClientUser,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              uploadedFiles,
            ),
          );
        },
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(
          PoAttachmentEvent.uploadFile(
            user: fakeClientUser,
          ),
        ),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            isFetching: true,
            localFiles: [platformFile],
            fileOperationMode: FileOperationMode.none,
          ),
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.upload,
            fileUrl: uploadedFiles,
            failureOrSuccessOption: optionOf(Right(uploadedFiles)),
          ),
        ],
      );

      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc Upload file upload success with existing file',
        seed: () => PoAttachmentState.initial().copyWith(
          fileOperationMode: FileOperationMode.upload,
          fileUrl: [fakePoDocument1],
          localFiles: [platformFile],
        ),
        setUp: () {
          when(
            () => poAttachmentRepository.uploadFiles(
              files: [platformFile],
              user: fakeClientUser,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              uploadedFiles,
            ),
          );
        },
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(
          PoAttachmentEvent.uploadFile(
            user: fakeClientUser,
          ),
        ),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            isFetching: true,
            fileOperationMode: FileOperationMode.none,
            localFiles: [platformFile],
            fileUrl: [fakePoDocument1],
          ),
          PoAttachmentState.initial().copyWith(
            fileOperationMode: FileOperationMode.upload,
            fileUrl: [fakePoDocument, fakePoDocument1],
            failureOrSuccessOption: optionOf(Right(uploadedFiles)),
          ),
        ],
      );

      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc delete file failed',
        setUp: () {
          when(
            () => poAttachmentRepository.deleteFile(
              filePath: fakePoDocument.url,
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('Fake-error'),
            ),
          );
        },
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(
          PoAttachmentEvent.deleteFile(
            file: fakePoDocument,
          ),
        ),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
            fileOperationMode: FileOperationMode.none,
          ),
          PoAttachmentState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Fake-error'),
              ),
            ),
            fileUrl: [],
          ),
        ],
      );

      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc delete file success',
        setUp: () {
          when(
            () => poAttachmentRepository.deleteFile(
              filePath: fakePoDocument.url,
            ),
          ).thenAnswer(
            (invocation) async => const Right(true),
          );
        },
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        seed: () => PoAttachmentState.initial().copyWith(
          fileUrl: [fakePoDocument, fakePoDocument1],
        ),
        act: (bloc) => bloc.add(
          PoAttachmentEvent.deleteFile(
            file: fakePoDocument,
          ),
        ),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
            fileOperationMode: FileOperationMode.none,
            fileUrl: [fakePoDocument, fakePoDocument1],
          ),
          PoAttachmentState.initial().copyWith(
            failureOrSuccessOption: none(),
            fileUrl: [fakePoDocument1],
            fileOperationMode: FileOperationMode.delete,
          ),
        ],
      );
    },
  );

  group(
    'PoAttachmentBloc Bloc Delete file Test',
    () {
      setUpAll(() {
        poAttachmentRepository = PoAttachmentRepositoryMock();
      });

      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc delete file failed',
        setUp: () {
          when(
            () => poAttachmentRepository.deleteFile(
              filePath: fakePoDocument.url,
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('Fake-error'),
            ),
          );
        },
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        act: (bloc) => bloc.add(
          PoAttachmentEvent.deleteFile(
            file: fakePoDocument,
          ),
        ),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
            fileOperationMode: FileOperationMode.none,
          ),
          PoAttachmentState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Fake-error'),
              ),
            ),
            fileUrl: [],
          ),
        ],
      );

      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc delete file success',
        setUp: () {
          when(
            () => poAttachmentRepository.deleteFile(
              filePath: fakePoDocument.url,
            ),
          ).thenAnswer(
            (invocation) async => const Right(true),
          );
        },
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        seed: () => PoAttachmentState.initial().copyWith(
          fileUrl: [fakePoDocument, fakePoDocument1],
        ),
        act: (bloc) => bloc.add(
          PoAttachmentEvent.deleteFile(
            file: fakePoDocument,
          ),
        ),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
            fileOperationMode: FileOperationMode.none,
            fileUrl: [fakePoDocument, fakePoDocument1],
          ),
          PoAttachmentState.initial().copyWith(
            failureOrSuccessOption: none(),
            fileUrl: [fakePoDocument1],
            fileOperationMode: FileOperationMode.delete,
          ),
        ],
      );

      blocTest<PoAttachmentBloc, PoAttachmentState>(
        'PoAttachmentBloc Bloc delete local file',
        build: () =>
            PoAttachmentBloc(poAttachmentRepository: poAttachmentRepository),
        seed: () => PoAttachmentState.initial().copyWith(
          localFiles: [platformFile],
        ),
        act: (bloc) => bloc.add(
          PoAttachmentEvent.deleteLocalFile(
            file: platformFile,
          ),
        ),
        expect: () => [
          PoAttachmentState.initial().copyWith(
            localFiles: [],
            fileOperationMode: FileOperationMode.delete,
          ),
        ],
      );
    },
  );
}

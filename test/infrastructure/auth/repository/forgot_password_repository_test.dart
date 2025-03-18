import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/entities/forgot_password.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/forgot_password_local.dart';
import 'package:ezrxmobile/infrastructure/auth/datasource/forgot_password_remote.dart';
import 'package:ezrxmobile/infrastructure/auth/repository/forgot_password_repository.dart';

class ConfigMock extends Mock implements Config {}

class ForgotPasswordLocalDataSourceMock extends Mock
    implements ForgotPasswordLocalDataSource {}

class ForgotPasswordRemoteDataSourceMock extends Mock
    implements ForgotPasswordRemoteDataSource {}

void main() {
  late Config configMock;
  late ForgotPasswordLocalDataSource localDataSourceMock;
  late ForgotPasswordRemoteDataSource remoteDataSourceMock;
  late ForgotPasswordRepository repository;

  final fakeUserName = Username('fake-user-name');
  final fakeError = Exception('fake-error');

  setUpAll(
    () {
      configMock = ConfigMock();
      localDataSourceMock = ForgotPasswordLocalDataSourceMock();
      remoteDataSourceMock = ForgotPasswordRemoteDataSourceMock();

      repository = ForgotPasswordRepository(
        config: configMock,
        localDataSource: localDataSourceMock,
        remoteDataSource: remoteDataSourceMock,
      );
    },
  );

  group(
    'Forgot Password Repository',
    () {
      test(
        'Test requestResetPassword mock success',
        () async {
          when(() => configMock.appFlavor)
              .thenAnswer((invocation) => Flavor.mock);
          when(() => localDataSourceMock.requestResetPassword())
              .thenAnswer((invocation) async => ForgotPassword.empty());

          final result = await repository.requestResetPassword(
            username: fakeUserName,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Test requestResetPassword mock failure',
        () async {
          when(() => configMock.appFlavor)
              .thenAnswer((invocation) => Flavor.mock);
          when(() => localDataSourceMock.requestResetPassword())
              .thenThrow((invocation) => fakeError);

          final result = await repository.requestResetPassword(
            username: fakeUserName,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Test requestResetPassword uat success',
        () async {
          when(() => configMock.appFlavor)
              .thenAnswer((invocation) => Flavor.uat);
          when(
            () => remoteDataSourceMock.requestResetPassword(
              username: fakeUserName.getOrCrash(),
            ),
          ).thenAnswer(
            (invocation) async => ForgotPassword.empty().copyWith(
              success: true,
            ),
          );

          final result = await repository.requestResetPassword(
            username: fakeUserName,
          );
          expect(result.isRight(), true);
        },
      );

      test(
        'Test requestResetPassword uat failure',
        () async {
          when(() => configMock.appFlavor)
              .thenAnswer((invocation) => Flavor.uat);
          when(
            () => remoteDataSourceMock.requestResetPassword(
              username: fakeUserName.getOrCrash(),
            ),
          ).thenAnswer(
            (invocation) async => ForgotPassword.empty().copyWith(
              success: false,
            ),
          );

          final result = await repository.requestResetPassword(
            username: fakeUserName,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Test requestResetPassword uat error',
        () async {
          when(() => configMock.appFlavor)
              .thenAnswer((invocation) => Flavor.uat);
          when(
            () => remoteDataSourceMock.requestResetPassword(
              username: fakeUserName.getOrCrash(),
            ),
          ).thenThrow((invocation) => fakeError);

          final result = await repository.requestResetPassword(
            username: fakeUserName,
          );
          expect(result.isLeft(), true);
        },
      );
    },
  );
}

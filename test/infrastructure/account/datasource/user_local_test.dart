import 'package:ezrxmobile/infrastructure/account/datasource/user_local.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/jwt_dto.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTokenStorage extends Mock implements TokenStorage {}

void main() {
  group('UserLocalDataSource should - ', () {
    late UserLocalDataSource userLocal;
    late TokenStorage tokenStorage;
    const rootAdminToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBVVRIX1RPS0VOIjoidzl4cEFhQkRZUSIsImV4cCI6MTY2MzQwOTAzNiwiaWF0IjoxNjYzMzIyNjM2LCJpZCI6MTE0NjEsInJpZ2h0cyI6W3sidmFsdWUiOlt7ImN1c3RvbWVyQ29kZSI6ImFsbCIsInNhbGVzT3JnIjoiMjYwMSIsInNoaXBUb0NvZGUiOlsiYWxsIl19XX1dLCJyb2xlIjoiWlAgQWRtaW4iLCJzYWxlc09yZ3MiOlsiMjYwMSJdLCJ1c2VybmFtZSI6ImV6cnh0ZXN0MDUifQ.MakZTQ3JUVqeRuXQcBU1cUKmHZft5AmFPJDvuG4DjlA';
    const refreshToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBVVRIX1RPS0VOIjoiZXlKaGJHY2lPaUpJVXpJMU5pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SkJWVlJJWDFSUFMwVk9Jam9pZHpsNGNFRmhRa1JaVVNJc0lrTlNSVUZVUlVSZlFWUWlPakUyT0RZeU9UWTRPRFFzSW1WNGNDSTZNVFk0TmpNd01EUTROQ3dpYVdGMElqb3hOamcyTWprMk9EZzBMQ0pwWkNJNk16ZzJNQ3dpY21sbmFIUnpJanBiZXlKMllXeDFaU0k2VzNzaVkzVnpkRzl0WlhKRGIyUmxJam9pWVd4c0lpd2ljMkZzWlhOUGNtY2lPaUl5TURBeElpd2ljMmhwY0ZSdlEyOWtaU0k2V3lKaGJHd2lYWDFkZlYwc0luSnZiR1VpT2lKU1QwOVVJRUZrYldsdUlpd2ljMkZzWlhOUGNtZHpJanBiSWpJd01ERWlYU3dpZFhObGNtNWhiV1VpT2lKeWIyOTBZV1J0YVc0aWZRLmp0ZkxBZjcyaFdkVU1EZ0xEYnJoUXpOQmNhd2hsb19PSHJfTmFFTE5fbGMiLCJleHAiOjE2OTQwNzI4ODQsImlhdCI6MTY4NjI5Njg4NH0.fx4Lnfs1omLm81hBAwTetEnddSQnK2hTS_Kj9O25tYA';

    setUpAll(() {
      WidgetsFlutterBinding.ensureInitialized();
      tokenStorage = MockTokenStorage();
      userLocal = UserLocalDataSource(
        tokenStorage: tokenStorage,
      );
    });
    test('getUser with rootAdminToken', () async {
      when(() => tokenStorage.get()).thenAnswer(
        (invocation) async =>
            JWTDto(access: rootAdminToken, refresh: refreshToken),
      );

      final user = await userLocal.getUser();
      expect(user.id, '3860');
    });

    test('getUser with empty token', () async {
      when(() => tokenStorage.get())
          .thenAnswer((invocation) async => JWTDto(access: '', refresh: ''));

      final user = await userLocal.getUser();
      expect(user.id, '3860');
    });

    test('getUser with other token', () async {
      when(() => tokenStorage.get()).thenAnswer(
        (invocation) async => JWTDto(access: '1234', refresh: '1234'),
      );

      final user = await userLocal.getUser();
      expect(user.id, '7725');
    });

    test('updateUserTC successfully', () async {
      final settingTc = await userLocal.updateUserTC();
      expect(settingTc.acceptTC, true);
    });

    test(
      'Update Privacy Control',
      () async {
        final result = await userLocal.updatePrivacyControl();
        expect(
          result,
          true,
        );
      },
    );
  });
}

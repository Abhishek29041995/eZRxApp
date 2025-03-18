import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/user_local.dart';
import 'package:ezrxmobile/infrastructure/aup_tc/repository/aup_tc_repository.dart';
import 'package:ezrxmobile/infrastructure/auth/dtos/jwt_dto.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAupTcRepository extends Mock implements AupTcRepository {
  bool getTncConfig() {
    return true;
  }
}

class MockTokenStorage extends Mock implements TokenStorage {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AupTcRepository aupTcRepository = MockAupTcRepository();
  late Config config;
  late User user;

  // late TncDate tncDate;
  // late Role role;
  late TokenStorage tokenStorage;

  setUpAll(() async {
    const rootAdminToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBVVRIX1RPS0VOIjoidzl4cEFhQkRZUSIsIkNSRUFURURfQVQiOjE2ODYxMTE2ODcsImV4cCI6MTY4NjExNTI4NywiaWF0IjoxNjg2MTExNjg3LCJpZCI6Mzg2MCwicmlnaHRzIjpbeyJ2YWx1ZSI6W3siY3VzdG9tZXJDb2RlIjoiYWxsIiwic2FsZXNPcmciOiIyMDAxIiwic2hpcFRvQ29kZSI6WyJhbGwiXX1dfV0sInJvbGUiOiJST09UIEFkbWluIiwic2FsZXNPcmdzIjpbIjIwMDEiXSwidXNlcm5hbWUiOiJyb290YWRtaW4ifQ.StCC3ABQsxfsnKud8SL74AV_hHQGqKhf8IoH_9pYGcM';
    const refreshToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBVVRIX1RPS0VOIjoiZXlKaGJHY2lPaUpJVXpJMU5pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SkJWVlJJWDFSUFMwVk9Jam9pZHpsNGNFRmhRa1JaVVNJc0lrTlNSVUZVUlVSZlFWUWlPakUyT0RZeU9UWTRPRFFzSW1WNGNDSTZNVFk0TmpNd01EUTROQ3dpYVdGMElqb3hOamcyTWprMk9EZzBMQ0pwWkNJNk16ZzJNQ3dpY21sbmFIUnpJanBiZXlKMllXeDFaU0k2VzNzaVkzVnpkRzl0WlhKRGIyUmxJam9pWVd4c0lpd2ljMkZzWlhOUGNtY2lPaUl5TURBeElpd2ljMmhwY0ZSdlEyOWtaU0k2V3lKaGJHd2lYWDFkZlYwc0luSnZiR1VpT2lKU1QwOVVJRUZrYldsdUlpd2ljMkZzWlhOUGNtZHpJanBiSWpJd01ERWlYU3dpZFhObGNtNWhiV1VpT2lKeWIyOTBZV1J0YVc0aWZRLmp0ZkxBZjcyaFdkVU1EZ0xEYnJoUXpOQmNhd2hsb19PSHJfTmFFTE5fbGMiLCJleHAiOjE2OTQwNzI4ODQsImlhdCI6MTY4NjI5Njg4NH0.fx4Lnfs1omLm81hBAwTetEnddSQnK2hTS_Kj9O25tYA';
    //final fakeJWT = JWT(rootAdminToken);
    config = Config()..appFlavor = Flavor.mock;
    aupTcRepository = MockAupTcRepository();
    aupTcRepository = MockAupTcRepository();
    tokenStorage = MockTokenStorage();
    when(() => tokenStorage.get()).thenAnswer(
      (invocation) async =>
          JWTDto(access: rootAdminToken, refresh: refreshToken),
    );
    user = await UserLocalDataSource(tokenStorage: tokenStorage).getUser();
    await UserLocalDataSource(tokenStorage: tokenStorage).updateUserTC();

    // tncDate = TncDate(date: DateTime.parse('1970-01-01 00:00:00'));
    // role = Role.empty().copyWith(type: RoleType('internal_sales_rep'));
  });

  group(
    'UserLogin Accept Updated Privacy Policy',
    () {
      setUpAll(() async {
        when(() => MockTokenStorage().get())
            .thenAnswer((invocation) async => JWTDto(access: '', refresh: ''));
        user = await UserLocalDataSource(tokenStorage: tokenStorage).getUser();
      });

      blocTest<AupTcBloc, AupTcState>(
        '''Loged in and userbloc state is Not empty, acceptPrivacyPolicy - false,
        ''',
        build: () => AupTcBloc(
          aupTcRepository: aupTcRepository,
          config: config,
        ),
        act: (AupTcBloc bloc) {
          bloc.add(
            AupTcEvent.show(
              user.copyWith(acceptPrivacyPolicy: false),
            ),
          );
        },
        expect: () => [
          AupTcState(
            user: user.copyWith(acceptPrivacyPolicy: false),
            tncConsent: false,
            privacyConsent: false,
          ),
        ],
      );
      blocTest<AupTcBloc, AupTcState>(
        '''Loged in and userbloc state is Not empty, acceptPrivacyPolicy - true,
        ''',
        build: () => AupTcBloc(
          aupTcRepository: aupTcRepository,
          config: config,
        ),
        act: (AupTcBloc bloc) {
          bloc.add(
            AupTcEvent.show(
              user.copyWith(acceptPrivacyPolicy: true),
            ),
          );
        },
        expect: () => [
          AupTcState(
            user: user.copyWith(acceptPrivacyPolicy: true),
            tncConsent: false,
            privacyConsent: false,
          ),
        ],
      );

      blocTest<AupTcBloc, AupTcState>(
        '''Loged in and userbloc state is Not empty, acceptPrivacyPolicy - false, Sales Org is VN
        ''',
        build: () => AupTcBloc(
          aupTcRepository: aupTcRepository,
          config: config,
        ),
        act: (AupTcBloc bloc) {
          bloc.add(
            AupTcEvent.show(
              user.copyWith(acceptPrivacyPolicy: false),
            ),
          );
        },
        expect: () => [
          AupTcState(
            user: user.copyWith(acceptPrivacyPolicy: false),
            tncConsent: false,
            privacyConsent: false,
          ),
        ],
      );

      blocTest<AupTcBloc, AupTcState>(
        '''Loged in and userbloc state is Not empty, acceptPrivacyPolicy - false, Sales Org is TW
        ''',
        build: () => AupTcBloc(
          aupTcRepository: aupTcRepository,
          config: config,
        ),
        act: (AupTcBloc bloc) {
          bloc.add(
            AupTcEvent.show(
              user.copyWith(acceptPrivacyPolicy: false),
            ),
          );
        },
        expect: () => [
          AupTcState(
            user: user.copyWith(acceptPrivacyPolicy: false),
            tncConsent: false,
            privacyConsent: false,
          ),
        ],
      );

      blocTest<AupTcBloc, AupTcState>(
        '''Loged in and userbloc state is Not empty, acceptPrivacyPolicy - false, Sales Org is TH
        ''',
        build: () => AupTcBloc(
          aupTcRepository: aupTcRepository,
          config: config,
        ),
        act: (AupTcBloc bloc) {
          bloc.add(
            AupTcEvent.show(
              user.copyWith(acceptPrivacyPolicy: false),
            ),
          );
        },
        expect: () => [
          AupTcState(
            user: user.copyWith(acceptPrivacyPolicy: false),
            tncConsent: false,
            privacyConsent: false,
          ),
        ],
      );

      blocTest<AupTcBloc, AupTcState>(
        '''Loged in and userbloc state is Not empty, acceptPrivacyPolicy - false, Sales Org is MM
        ''',
        build: () => AupTcBloc(
          aupTcRepository: aupTcRepository,
          config: config,
        ),
        act: (AupTcBloc bloc) {
          bloc.add(
            AupTcEvent.show(
              user.copyWith(acceptPrivacyPolicy: false),
            ),
          );
        },
        expect: () => [
          AupTcState(
            user: user.copyWith(acceptPrivacyPolicy: false),
            tncConsent: false,
            privacyConsent: false,
          ),
        ],
      );

      blocTest<AupTcBloc, AupTcState>(
        '''Loged in and userbloc state is Not empty, acceptPrivacyPolicy - false, Sales Org is KH
        ''',
        build: () => AupTcBloc(
          aupTcRepository: aupTcRepository,
          config: config,
        ),
        act: (AupTcBloc bloc) {
          bloc.add(
            AupTcEvent.show(
              user.copyWith(acceptPrivacyPolicy: false),
            ),
          );
        },
        expect: () => [
          AupTcState(
            user: user.copyWith(acceptPrivacyPolicy: false),
            tncConsent: false,
            privacyConsent: false,
          ),
        ],
      );

      blocTest<AupTcBloc, AupTcState>(
        '''Loged in and userbloc state is Not empty, tncConsent - true
        ''',
        seed: () => AupTcState(
          user: user,
          tncConsent: false,
          privacyConsent: false,
        ),
        build: () => AupTcBloc(
          aupTcRepository: aupTcRepository,
          config: config,
        ),
        act: (AupTcBloc bloc) {
          bloc.add(
            const AupTcEvent.termsOfUseConsent(newValue: true),
          );
        },
        expect: () => [
          AupTcState(
            user: user,
            tncConsent: true,
            privacyConsent: false,
          ),
        ],
      );

      blocTest<AupTcBloc, AupTcState>(
        '''Loged in and userbloc state is Not empty, acceptPrivacyPolicy - true
        ''',
        seed: () => AupTcState(
          user: user,
          tncConsent: false,
          privacyConsent: false,
        ),
        build: () => AupTcBloc(
          aupTcRepository: aupTcRepository,
          config: config,
        ),
        act: (AupTcBloc bloc) {
          bloc.add(
            const AupTcEvent.privacyPolicyConsent(newValue: true),
          );
        },
        expect: () => [
          AupTcState(
            user: user,
            tncConsent: false,
            privacyConsent: true,
          ),
        ],
      );
    },
  );
}

import 'package:ezrxmobile/config.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/entities/contact_us.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/contact_us_dto.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/contact_us_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/contact_us_remote.dart';
import 'package:ezrxmobile/infrastructure/account/repository/contact_us_repository.dart';

class ConfigMock extends Mock implements Config {}

class ContactUsRemoteDataSourceMock extends Mock
    implements ContactUsRemoteDataSource {}

class ContactUsLocalDataSourceMock extends Mock
    implements ContactUsLocalDataSource {}

void main() {
  late Config configMock;
  late ContactUsLocalDataSource localDataSourceMock;
  late ContactUsRemoteDataSource remoteDataSourceMock;
  late ContactUsRepository repository;
  late ContactUs contactUsMock;
  final fakeMarket = AppMarket('fake');

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    configMock = ConfigMock();
    localDataSourceMock = ContactUsLocalDataSourceMock();
    remoteDataSourceMock = ContactUsRemoteDataSourceMock();

    repository = ContactUsRepository(
      config: configMock,
      remoteDataSource: remoteDataSourceMock,
      localDataSource: localDataSourceMock,
    );

    contactUsMock = ContactUs.empty().copyWith(
      username: Username('mock-user-name'),
      contactNumber: PhoneNumber('mock-phone'),
      email: EmailAddress('mock-email@a.com'),
      message: StringValue('mock-message'),
    );
  });

  group('Contact us repository', () {
    test('submit local failed', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);
      when(
        () => localDataSourceMock.submit(),
      ).thenThrow((invocation) async => MockException());

      final result = await repository.submit(
        contactUs: contactUsMock,
        appMarket: fakeMarket,
      );
      expect(result.isLeft(), true);
    });

    test('submit local success', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);
      when(
        () => localDataSourceMock.submit(),
      ).thenAnswer((invocation) async => true);

      final result = await repository.submit(
        contactUs: contactUsMock,
        appMarket: fakeMarket,
      );
      expect(result.isRight(), true);
    });

    test('submit remote failed', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(() => configMock.getContactUsStaticEmail(fakeMarket.country))
          .thenReturn('mock-email@a.com');
      when(
        () => remoteDataSourceMock.submit(
          contactUsMap: ContactUsDto.fromDomain(contactUsMock).toJson(),
          country: fakeMarket.country,
          sendToEmail: 'mock-email@a.com',
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await repository.submit(
        contactUs: contactUsMock,
        appMarket: fakeMarket,
      );
      expect(result.isLeft(), true);
    });

    test('submit remote success', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);
      when(() => configMock.getContactUsStaticEmail(fakeMarket.country))
          .thenReturn('mock-email@a.com');
      when(
        () => remoteDataSourceMock.submit(
          contactUsMap: ContactUsDto.fromDomain(contactUsMock).toJson(),
          country: fakeMarket.country,
          sendToEmail: 'mock-email@a.com',
        ),
      ).thenAnswer((invocation) async => true);

      final result = await repository.submit(
        contactUs: contactUsMock,
        appMarket: fakeMarket,
      );
      expect(result.isRight(), true);
    });
  });
}

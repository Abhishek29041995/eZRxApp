import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_organisation_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/user_dto.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'dart:convert';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test User DTO', () {
    setUp(() async {
      data = json
          .decode(await rootBundle.loadString('assets/json/user/userResponse.json'));
    });
    test('For _mergeSalesOrg', () async {
      final user = UserDto.fromJson(data['data']['user']).toDomain();
      expect(user.userSalesOrganisations.length, 1); //19
      expect(user.acceptMPTC, MarketPlaceTnCAcceptance('0'));
    });

    test('Test fromJson with default value', () {
      final json = data['data']['user'];

      expect(
        UserDto.fromJson({...json}..remove('acceptMPTC')).toDomain().acceptMPTC,
        MarketPlaceTnCAcceptance(''),
      );
    });

    // TODO: migrate to v3 skip this for now
    // test('For _splitSalesOrg', () async {
    //   final user = UserDto.fromJson(data['data']['user']).toDomain();
    //   final userDto = UserDto.fromDomain(user);
    //   final userDtoMap = userDto.toJson();
    //   final dynamic userSalesOrganisationList =
    //       userDtoMap['userSalesOrganisationList'];
    //   expect(userDto.userSalesOrganisations.length, 20);
    //   expect(userSalesOrganisationList['value'].length, 20);
    // });
    test('For Empty Sale Organisation DTO', () async {
      final newUser = User.empty().copyWith(
        userSalesOrganisations: [SalesOrganisationDto.empty().toDomain()],
      );
      SalesOrganisationDto.empty().toJson();
      expect(newUser.userSalesOrganisations.length, 1);
    });
  });
}

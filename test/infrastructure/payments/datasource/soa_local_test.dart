import 'dart:convert';
import 'package:ezrxmobile/infrastructure/payments/datasource/soa_local.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/soa_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SoaLocalDataSource localDataSource;

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = SoaLocalDataSource();
    },
  );

  test('get soa ', () async {
    final data = json.decode(
      await rootBundle.loadString(
        'assets/json/common/listSoaResponse.json',
      ),
    )['data'];

    final expectResult =
        List.from(data).map((e) => SoaDto.fromJson(e).toDomain()).toList();

    final result = await localDataSource.getSoa();
    expect(
      result,
      expectResult,
    );
  });
}

import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception_handler.dart';
import 'package:ezrxmobile/domain/payments/entities/soa.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/soa_dto.dart';

class SoaRemoteDataSource {
  HttpService httpService;
  Config config;
  DataSourceExceptionHandler dataSourceExceptionHandler;

  SoaRemoteDataSource({
    required this.httpService,
    required this.config,
    required this.dataSourceExceptionHandler,
  });

  Future<List<Soa>> getSoa(String soaInput, bool isMarketPlace) async {
    return await dataSourceExceptionHandler.handle(() async {
      final res = await httpService.request(
        method: 'POST',
        url: '${config.urlConstants}payment/listSoa',
        data: jsonEncode(
          {
            'customer_code': soaInput,
            if (isMarketPlace) 'isMarketPlace': isMarketPlace,
          },
        ),
      );
      dataSourceExceptionHandler.handleExceptionChecker(res: res);

      final data = res.data['data'];

      return List.from(data).map((e) => SoaDto.fromJson(e).toDomain()).toList();
    });
  }
}

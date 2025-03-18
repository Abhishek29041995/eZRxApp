import 'package:get_it/get_it.dart';

import 'infrastructure/infra_core/dio_service/dio_service.dart';
import 'infrastructure/infra_core/zephyr_service/zephyr_service.dart';
import 'infrastructure/zephyr/datasource/zephyr_remote.dart';
import 'infrastructure/zephyr/repository/zephyr_repository.dart';
import 'test_config.dart';

GetIt locator = GetIt.instance;

void setUpTestLocator(){
  //infra_core
  locator.registerLazySingleton(() => TestConfig());
  locator.registerLazySingleton(() => DioService(
    testConfig: locator<TestConfig>(),
  ),);
  locator.registerLazySingleton(() => ZephyrService());
  //zephyr repository
  locator.registerLazySingleton(() => ZephyrRemoteDataSource(
    dioService: locator<DioService>(),
    testConfig: locator<TestConfig>(),
  ),);
  locator.registerLazySingleton(
    () => ZephyrRepository(
      remoteDataSource: locator<ZephyrRemoteDataSource>(),
      zephyrService: locator<ZephyrService>(),
    ),
  );
}

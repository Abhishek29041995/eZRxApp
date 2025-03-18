// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

import '../../../domain/value/value_objects.dart';
import '../../../test_config.dart';
import '../../../domain/entities/step.dart';
import '../../infra_core/dio_service/dio_service.dart';
import 'package:test_api/src/backend/state.dart';

import '../../infra_core/zephyr_service/zephyr_service.dart';
import '../dtos/execution_dto.dart';
import '../dtos/step_dto.dart';

class ZephyrRemoteDataSource {
  final DioService dioService;
  final TestConfig testConfig;

  ZephyrRemoteDataSource({
    required this.dioService,
    required this.testConfig,
  });

  //Update status to Zephyr Scall after executing finished.
  Future<void> update({
    required CycleKeyId id,
    required String testCycleKey,
    required Map<String, Result> testCase,
  }) async {
    for (final testCaseKey in testCase.keys) {
      //Get number of test script step:
      final totalSteps = (await _getTotalSteps(testCaseKey)).total;
      //Update result to Each test case execution
      final body = ExecutionDto(
        projectKey: testConfig.PROJECT_KEY,
        statusName: ZephyrStatus(testCase[testCaseKey].toString()).getStatus,
        testCaseKey: testCaseKey,
        testCycleKey: testCycleKey,
        stepCount: totalSteps,
      ).toJson();
      final response = await dioService.post(testConfig.EXECUTION_URL, body);
      _exceptionChecker(
        'Failed update status for test case $testCaseKey ',
        response,
      );
    }
  }

  //Get the number of test step in each test case
  Future<Step> _getTotalSteps(String testCaseKey) async {
    final url = testConfig.STEP_URL.replaceAll('{ID}', testCaseKey);
    final response = await dioService.get(
      url,
    );
    _exceptionChecker(
      'Failed to load test case step for test case $testCaseKey',
      response,
    );
    return StepDto.fromJson(response.data).toDomain();
  }

  void _exceptionChecker(
    String msg,
    Response<dynamic> res,
  ) {
    if (!(res.statusCode == 200 || res.statusCode == 201)) {
      throw Exception(msg);
    }
  }
}

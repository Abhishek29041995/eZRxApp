import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/infrastructure/connectivity/repository/connectivity_repository.dart';
import 'package:ezrxmobile/infrastructure/core/connectivity/connectivity_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ConnectivityServiceMock extends Mock implements ConnectivityService {}

void main() {
  late ConnectivityService connectivityService;
  late ConnectivityRepository connectivityRepository;

  const stream = Stream<bool>.empty();
  final streamSub = stream.listen((data) {});
  final error = Exception('fake-error');

  setUpAll(() {
    connectivityService = ConnectivityServiceMock();
    connectivityRepository =
        ConnectivityRepository(connectivityService: connectivityService);
  });

  group('Connectivity Repository Test', () {
    test('watchNetworkAvailability test', () async {
      when(() => connectivityService.getStream).thenAnswer((_) => stream);
      final result = connectivityRepository.watchNetworkAvailability();
      expect(result, stream);
    });
    test('initializeConnectivity success test', () async {
      when(() => connectivityService.init()).thenReturn(streamSub);
      final result = await connectivityRepository.initializeConnectivity();
      expect(
        result.isRight(),
        true,
      );
      expect(result, const Right(unit));
    });

    test('initializeConnectivity failure test', () async {
      when(() => connectivityService.init()).thenThrow(error);
      final result = await connectivityRepository.initializeConnectivity();
      expect(
        result.isLeft(),
        true,
      );
      expect(result, Left(FailureHandler.handleFailure(error)));
    });
  });
}

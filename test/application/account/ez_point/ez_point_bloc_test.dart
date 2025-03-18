import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/ez_point/ez_point_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/ez_point_token.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/ez_point_local.dart';
import 'package:ezrxmobile/infrastructure/account/repository/ez_point_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';

class EZPointRepositoryMock extends Mock implements EZPointRepository {}

void main() {
  late EZPointRepository repository;
  late EZPointToken eZPointTokenMock;
  const fakeError = ApiFailure.other('fake-error');

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = EZPointRepositoryMock();
    eZPointTokenMock = await EZPointLocalDataSource().getEZPointToken();
  });

  group(
    'eZPoint Bloc',
    () {
      blocTest(
        'Initialize event',
        build: () => EZPointBloc(eZPointRepository: repository),
        seed: () => EZPointState.initial().copyWith(
          ezPointToken: eZPointTokenMock,
          isFetching: true,
          eZPointTokenFailureOrSuccessOption: optionOf(const Left(fakeError)),
        ),
        act: (bloc) => bloc.add(const EZPointEvent.initialized()),
        expect: () => [EZPointState.initial()],
      );

      blocTest(
        'Get eZPoint Token Failure',
        build: () => EZPointBloc(eZPointRepository: repository),
        setUp: () {
          when(
            () => repository.getEZPointToken(
              customerCodeInfo: fakeCustomerCodeInfo,
            ),
          ).thenAnswer((_) async => const Left(fakeError));
        },
        act: (EZPointBloc bloc) => bloc.add(
          EZPointEvent.fetch(customerCodeInfo: fakeCustomerCodeInfo),
        ),
        expect: () => [
          EZPointState.initial().copyWith(isFetching: true),
          EZPointState.initial().copyWith(
            eZPointTokenFailureOrSuccessOption: optionOf(
              const Left(fakeError),
            ),
          ),
        ],
      );

      blocTest(
        'Get eZPoint Token Success',
        build: () => EZPointBloc(eZPointRepository: repository),
        setUp: () {
          when(
            () => repository.getEZPointToken(
              customerCodeInfo: fakeCustomerCodeInfo,
            ),
          ).thenAnswer((_) async => Right(eZPointTokenMock));
        },
        act: (EZPointBloc bloc) => bloc.add(
          EZPointEvent.fetch(customerCodeInfo: fakeCustomerCodeInfo),
        ),
        expect: () => [
          EZPointState.initial().copyWith(isFetching: true),
          EZPointState.initial().copyWith(ezPointToken: eZPointTokenMock),
        ],
      );
    },
  );
}

import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_representative_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/repository/i_sales_rep_repository.dart';
import 'package:ezrxmobile/domain/account/repository/i_user_repository.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/repository/i_auth_repository.dart';
import 'package:ezrxmobile/domain/core/device/repository/i_device_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final IUserRepository userRepository;
  final IAuthRepository authRepository;
  final ISalesRepRepository salesRepRepository;
  final IDeviceRepository deviceRepository;

  UserBloc({
    required this.userRepository,
    required this.authRepository,
    required this.salesRepRepository,
    required this.deviceRepository,
  }) : super(UserState.initial()) {
    on<UserEvent>(_onEvent);
  }

  Future<void> _onEvent(UserEvent event, Emitter<UserState> emit) async {
    await event.map(
      initialized: (e) {
        emit(UserState.initial());
      },
      fetch: (e) async {
        final failureOrSuccess = await userRepository.getUser();

        await failureOrSuccess.fold(
          (failure) async {
            if (isClosed) return;
            emit(
              state.copyWith(
                userFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (user) async {
            final isFirstLaunch =
                (await deviceRepository.getDeviceData()).getOrElse(() => false);
            final refreshTokenFailureOrSuccess =
                await authRepository.getRefreshToken();
            if (isClosed) return;
            //If login on behalf, the refresh token will always be empty string
            final isLoginOnBehalf = refreshTokenFailureOrSuccess.fold(
              (failure) => failure == const ApiFailure.refreshTokenInvalid(),
              (token) => !token.isValid(),
            );

            emit(
              state.copyWith(
                user: user,
                isLoginOnBehalf: isLoginOnBehalf,
                isAppFirstLaunch: isFirstLaunch,
                userFailureOrSuccessOption: none(),
              ),
            );
            if (state.isSalesRep) {
              add(const UserEvent.fetchSalesRepInfo());
            }
          },
        );
      },
      acceptTnc: (e) async {
        emit(state.copyWith(isLoading: true));

        final failureOrSuccess = await userRepository.updateUserTc();
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              isLoading: false,
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (settingTc) => emit(
            state.copyWith(
              user: state.user.copyWith(
                acceptPrivacyPolicy: settingTc.acceptTC,
              ),
              isLoading: false,
              failureOrSuccessOption: none(),
            ),
          ),
        );
      },
      setMarketPlaceTncAcceptance: (e) async {
        emit(state.copyWith(isLoading: true));

        final failureOrSuccess =
            await userRepository.updateUserMarketPlaceTc(e.value);
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              isLoading: false,
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (_) => emit(
            state.copyWith(
              isLoading: false,
              user: state.user.copyWith(acceptMPTC: e.value),
              failureOrSuccessOption: none(),
            ),
          ),
        );
      },
      updateLanguage: (_UpdateLanguage e) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccessOption =
            await userRepository.updateLanguage(language: e.language);
        if (isClosed) return;
        failureOrSuccessOption.fold(
          (failure) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccessOption),
            ),
          ),
          (_) {
            emit(
              state.copyWith(
                failureOrSuccessOption: none(),
                user: state.user.copyWith(
                  preferredLanguage: e.language,
                ),
              ),
            );
          },
        );
      },
      selectLanguage: (_SelectLanguage e) {
        emit(
          state.copyWith(
            activeLanguage: e.language,
          ),
        );
      },
      selectOrderType: (e) async {
        emit(
          state.copyWith(
            isSelectingOrderType: true,
            failureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await userRepository.updateSelectedOrderType(e.orderType);

        if (isClosed) return;

        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              isSelectingOrderType: false,
            ),
          ),
          (newOrderType) => emit(
            state.copyWith(
              user: state.user.copyWith(selectedOrderType: newOrderType),
              failureOrSuccessOption: optionOf(failureOrSuccess),
              isSelectingOrderType: false,
            ),
          ),
        );
      },
      fetchSalesRepInfo: (e) async {
        final failureOrSuccess = await salesRepRepository.getSalesRepInfo(
          user: state.user,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (info) => emit(
            state.copyWith(
              salesRepInfo: info,
              failureOrSuccessOption: none(),
            ),
          ),
        );
      },
      setAppFirstLaunch: (e) async {
        await deviceRepository.setDeviceData(isAppFirstLaunch: false);
        if (isClosed) return;
        emit(state.copyWith(isAppFirstLaunch: false));
      },
    );
  }
}

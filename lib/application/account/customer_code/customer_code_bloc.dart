import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/repository/i_customer_code_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_code_bloc.freezed.dart';

part 'customer_code_event.dart';

part 'customer_code_state.dart';

class CustomerCodeBloc extends Bloc<CustomerCodeEvent, CustomerCodeState> {
  final ICustomerCodeRepository customerCodeRepository;
  final Config config;

  CustomerCodeBloc({
    required this.customerCodeRepository,
    required this.config,
  }) : super(CustomerCodeState.initial()) {
    on<_Initialized>(
      (e, emit) => emit(
        CustomerCodeState.initial().copyWith(
          hideCustomer: e.hideCustomer,
          userInfo: e.userInfo,
          selectedSalesOrg: e.selectedSalesOrg,
        ),
      ),
    );
    on<_Fetch>(
      (e, emit) async {
        if (!e.searchValue.isValid()) return;

        if (e.searchValue == state.searchKey &&
            e.searchValue.validateNotEmpty) {
          return;
        }

        emit(
          state.copyWith(
            isFetching: true,
            searchKey: e.searchValue,
            canLoadMore: false,
            customerCodeList: <CustomerCodeInfo>[],
            apiFailureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await customerCodeRepository.getCustomerCode(
          salesOrganisation: state.selectedSalesOrg,
          searchKey: e.searchValue,
          hideCustomer: state.hideCustomer,
          user: state.userInfo,
          pageSize: config.pageSize,
          offset: 0,
        );
        failureOrSuccess.fold(
          (failure) {
            if (emit.isDone) return;
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                canLoadMore: false,
                isFetching: false,
                searchKey: e.searchValue,
              ),
            );
          },
          (customerInformation) {
            if (emit.isDone) return;
            emit(
              state.copyWith(
                customerCodeList: customerInformation.soldToInformation,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
                canLoadMore: customerInformation.shipToCount >= config.pageSize,
                searchKey: e.searchValue,
              ),
            );
          },
        );
      },
      transformer: restartable(),
    );
    on<_LoadMore>((e, emit) async {
      if (!state.canLoadMore || state.isFetching) return;
      emit(state.copyWith(isFetching: true));

      final failureOrSuccess = await customerCodeRepository.getCustomerCode(
        salesOrganisation: state.selectedSalesOrg,
        searchKey: state.searchKey,
        hideCustomer: state.hideCustomer,
        user: state.userInfo,
        pageSize: config.pageSize,
        offset: state.customerCodeList.shipToCount,
      );
      failureOrSuccess.fold(
        (failure) {
          emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          );
        },
        (customerInformation) {
          final finalCustomerCodeInfoList =
              List<CustomerCodeInfo>.from(state.customerCodeList)
                ..addAll(customerInformation.soldToInformation);
          emit(
            state.copyWith(
              customerCodeList: finalCustomerCodeInfoList,
              apiFailureOrSuccessOption: none(),
              isFetching: false,
              canLoadMore: customerInformation.shipToCount >= config.pageSize,
            ),
          );
        },
      );
    });
    on<_FetchCustomerCodeConfig>(
      (event, emit) async {
        emit(
          state.copyWith(
            configFailureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess =
            await customerCodeRepository.getCustomerCodeConfig(
          customerCodeInfo: event.customerCodeInfo,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              configFailureOrSuccessOption: optionOf(failureOrSuccess),
              customerCodeConfig: CustomerCodeConfig.empty(),
            ),
          ),
          (config) => emit(
            state.copyWith(
              customerCodeConfig: config,
              apiFailureOrSuccessOption: none(),
            ),
          ),
        );
      },
    );
  }
}

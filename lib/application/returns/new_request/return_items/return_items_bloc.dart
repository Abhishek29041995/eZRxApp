import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_items_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material_list.dart';
import 'package:ezrxmobile/domain/returns/entities/return_materials_params.dart';
import 'package:ezrxmobile/domain/returns/repository/i_return_request_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/config.dart';

part 'return_items_event.dart';

part 'return_items_state.dart';

part 'return_items_bloc.freezed.dart';

class ReturnItemsBloc extends Bloc<ReturnItemsEvent, ReturnItemsState> {
  final IReturnRequestRepository newRequestRepository;
  final Config config;

  ReturnItemsBloc({required this.newRequestRepository, required this.config})
      : super(ReturnItemsState.initial()) {
    on<_Initialized>((event, emit) {
      emit(
        ReturnItemsState.initial().copyWith(
          user: event.user,
          salesOrganisation: event.salesOrganisation,
          shipToInfo: event.shipToInfo,
          customerCodeInfo: event.customerCodeInfo,
          appliedFilter: ReturnItemsFilter.init(),
        ),
      );
      add(
        _Fetch(
          appliedFilter: ReturnItemsFilter.init(),
          searchKey: SearchKey.empty(),
        ),
      );
    });

    on<_Fetch>(
      (event, emit) async {
        if (event.searchKey == state.searchKey &&
            event.searchKey.validateNotEmpty &&
            event.appliedFilter == state.appliedFilter) {
          return;
        }
        if (!event.searchKey.isValid()) return;

        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            items: <ReturnMaterial>[],
            isLoading: true,
            appliedFilter: event.appliedFilter,
            searchKey: event.searchKey,
          ),
        );

        final failureOrSuccess =
            await newRequestRepository.searchReturnMaterials(
          requestParams: ReturnMaterialsParams(
            salesOrg: state.salesOrganisation.salesOrg,
            soldToInfo: state.customerCodeInfo.customerCodeSoldTo,
            shipToInfo: state.shipToInfo.shipToCustomerCode,
            pageSize: config.pageSize,
            offset: 0,
            filter: event.appliedFilter,
            searchKey: event.searchKey,
            language: state.user.preferredLanguage.languageCode,
            user: state.user,
          ),
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isLoading: false,
              ),
            );
          },
          (data) {
            emit(
              state.copyWith(
                items: data.items,
                canLoadMore: data.items.length >= config.pageSize,
                failureOrSuccessOption: none(),
                isLoading: false,
              ),
            );
          },
        );
      },
      transformer: restartable(),
    );

    on<_LoadMore>((event, emit) async {
      if (state.isLoading || !state.canLoadMore) return;

      emit(
        state.copyWith(
          isLoading: true,
          failureOrSuccessOption: none(),
        ),
      );

      final failureOrSuccess = await newRequestRepository.searchReturnMaterials(
        requestParams: ReturnMaterialsParams(
          salesOrg: state.salesOrganisation.salesOrg,
          soldToInfo: state.customerCodeInfo.customerCodeSoldTo,
          shipToInfo: state.shipToInfo.shipToCustomerCode,
          pageSize: config.pageSize,
          offset: state.items.length,
          filter: state.appliedFilter,
          searchKey: state.searchKey,
          language: state.user.preferredLanguage.languageCode,
          user: state.user,
        ),
      );

      failureOrSuccess.fold(
        (failure) {
          emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              isLoading: false,
            ),
          );
        },
        (data) {
          final updateItemList = List<ReturnMaterial>.from(state.items)
            ..addAll(data.items);
          emit(
            state.copyWith(
              items: updateItemList,
              canLoadMore: data.items.length >= config.pageSize,
              failureOrSuccessOption: none(),
              isLoading: false,
            ),
          );
        },
      );
    });
  }
}

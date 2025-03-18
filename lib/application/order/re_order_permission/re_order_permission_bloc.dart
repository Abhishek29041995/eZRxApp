import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/repository/i_material_price_repository.dart';
import 'package:ezrxmobile/domain/order/repository/i_re_order_permission_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 're_order_permission_bloc.freezed.dart';
part 're_order_permission_event.dart';
part 're_order_permission_state.dart';

class ReOrderPermissionBloc
    extends Bloc<ReOrderPermissionEvent, ReOrderPermissionState> {
  final IReOrderPermissionRepository reOrderPermissionRepository;
  final IMaterialPriceRepository materialPriceRepository;

  ReOrderPermissionBloc({
    required this.reOrderPermissionRepository,
    required this.materialPriceRepository,
  }) : super(ReOrderPermissionState.initial()) {
    on<ReOrderPermissionEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
    ReOrderPermissionEvent event,
    Emitter<ReOrderPermissionState> emit,
  ) async {
    await event.map(
      initialized: (e) {
        emit(
          ReOrderPermissionState.initial().copyWith(
            customerCodeInfo: e.customerCodeInfo,
            salesOrganisation: e.salesOrganisation,
            salesOrganisationConfigs: e.salesOrganisationConfigs,
            shipToInfo: e.shipToInfo,
            user: e.user,
          ),
        );
      },
      fetchOrder: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
            orderNumberWillUpsert: e.orderNumberWillUpsert,
          ),
        );

        final failureOrSuccess =
            await reOrderPermissionRepository.getReorderPermission(
          salesOrganisation: state.salesOrganisation,
          materialNumbers: e.orderHistoryDetailsOrderItems
              .map((e) => e.materialNumber)
              .toList(),
          customerCodeInfo: state.customerCodeInfo,
          shipToInfo: state.shipToInfo,
          salesOrganisationConfigs: state.salesOrganisationConfigs,
          user: state.user,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              isFetching: false,
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (validMaterials) {
            final validOrderItem = e.orderHistoryDetailsOrderItems
                .where(
                  (item) {
                    final isValidMaterial = validMaterials.any(
                      (e) =>
                          e.materialNumber == item.materialNumber && e.isValid,
                    );

                    return isValidMaterial && item.type.isMaterialTypeComm;
                  },
                )
                .map(
                  (item) => PriceAggregate.empty().copyWith(
                    materialInfo: item.reOrderMaterialInfo,
                    tenderContract: item.tenderContractDetails.contractNumber
                            .isContractNumberEmpty
                        ? TenderContract.empty()
                        : item.orderItemTenderContract,
                  ),
                )
                .toList();

            add(
              ReOrderPermissionEvent.fetchPrice(
                reorderItems: validOrderItem,
              ),
            );
          },
        );
      },
      fetchItem: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
          ),
        );

        final reOrderItem = e.item.isBonusMaterial
            ? e.orderHistoryDetail.getParentMaterial(e.item)
            : e.item;
        final validOrderItem = reOrderItem.reOrderMaterialInfo;
        final tenderContract = reOrderItem.orderItemTenderContract;

        final failureOrSuccess =
            await reOrderPermissionRepository.getReorderItemPermission(
          salesOrganisation: state.salesOrganisation,
          materialNumber: reOrderItem.materialNumber,
          customerCodeInfo: state.customerCodeInfo,
          shipToInfo: state.shipToInfo,
          salesOrganisationConfigs: state.salesOrganisationConfigs,
          user: state.user,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              isFetching: false,
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (validMaterial) {
            add(
              ReOrderPermissionEvent.fetchPrice(
                reorderItems: [
                  PriceAggregate.empty().copyWith(
                    materialInfo: validOrderItem,
                    tenderContract: tenderContract,
                  ),
                ],
              ),
            );
          },
        );
      },
      fetchPrice: (e) async {
        final failureOrSuccess = await materialPriceRepository.getMaterialPrice(
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisation: state.salesOrganisation,
          salesConfigs: state.salesOrganisationConfigs,
          shipToInfo: state.shipToInfo,
          //Only fetch price for type material to be able to determine correct bonus offer
          materialNumberList: e.reorderItems
              .where((e) => e.materialInfo.type.typeMaterial)
              .map((e) => e.getMaterialNumber)
              .toList(),
          comboDealEligible: false,
        );
        if (isClosed) return;
        failureOrSuccess.fold(
          (_) => emit(
            state.copyWith(
              isFetching: false,
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (priceMap) => emit(
            state.copyWith(
              isFetching: false,
              failureOrSuccessOption: none(),
              validOrderItems: e.reorderItems
                  .map(
                    (e) => e.copyWith(
                      price: priceMap[e.getMaterialNumber] ?? Price.empty(),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
      resetOrderNumberWillUpsert: (e) {
        emit(
          state.copyWith(
            orderNumberWillUpsert: e.orderNumberWillUpsert,
          ),
        );
      },
    );
  }
}

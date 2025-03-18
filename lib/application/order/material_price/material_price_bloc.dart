import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/repository/i_material_price_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_price_bloc.freezed.dart';
part 'material_price_event.dart';
part 'material_price_state.dart';

class MaterialPriceBloc extends Bloc<MaterialPriceEvent, MaterialPriceState> {
  final IMaterialPriceRepository repository;
  MaterialPriceBloc({required this.repository})
      : super(MaterialPriceState.initial()) {
    on<MaterialPriceEvent>(_onEvent);
  }

  Future<void> _onEvent(
    MaterialPriceEvent event,
    Emitter<MaterialPriceState> emit,
  ) async {
    await event.map(
      initialized: (e) {
        emit(
          MaterialPriceState.initial().copyWith(
            customerCodeInfo: e.customerCodeInfo,
            salesConfigs: e.salesConfigs,
            salesOrganisation: e.salesOrganisation,
            shipToInfo: e.shipToInfo,
          ),
        );
      },
      fetch: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
          ),
        );

        _filterFOCMaterial(e.materials, emit);

        final materialNumbers =
            e.materials.map((e) => e.materialNumber).toList();
        final queryMaterialNumber = List<MaterialNumber>.from(materialNumbers)
          ..removeWhere(
            (element) => state.materialPrice.containsKey(
              element,
            ),
          );
        if (queryMaterialNumber.isEmpty) {
          emit(
            state.copyWith(
              isFetching: false,
            ),
          );

          return;
        }

        final failureOrSuccess = await repository.getMaterialPrice(
          customerCodeInfo: state.customerCodeInfo,
          shipToInfo: state.shipToInfo,
          salesOrganisation: state.salesOrganisation,
          salesConfigs: state.salesConfigs,
          materialNumberList: queryMaterialNumber.toSet().toList(),
          comboDealEligible: e.comboDealEligible,
        );

        failureOrSuccess.fold(
          (_) {
            emit(
              state.copyWith(
                isFetching: false,
              ),
            );
          },
          (newPriceFetched) {
            final newPriceMap =
                Map<MaterialNumber, Price>.from(state.materialPrice)
                  ..addAll(newPriceFetched);
            emit(
              state.copyWith(
                isFetching: false,
                materialPrice: newPriceMap,
              ),
            );
          },
        );
      },
      fetchPriceCartProduct: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
          ),
        );
        _filterFOCMaterial(e.products, emit);
        final materialNumbers =
            e.products.map((e) => e.materialNumber).toList();
        final queryMaterialNumber = materialNumbers
            .where(
              (element) => !state.materialPrice.containsKey(element),
            )
            .toList();
        if (queryMaterialNumber.isEmpty) {
          emit(
            state.copyWith(
              isFetching: false,
            ),
          );

          return;
        }

        final failureOrSuccess = await repository.getMaterialPrice(
          customerCodeInfo: state.customerCodeInfo,
          shipToInfo: state.shipToInfo,
          salesOrganisation: state.salesOrganisation,
          salesConfigs: state.salesConfigs,
          materialNumberList: materialNumbers.toSet().toList(),
          comboDealEligible: e.comboDealEligible,
        );

        failureOrSuccess.fold(
          (_) {},
          (newPriceFetched) {
            final newPriceMap =
                Map<MaterialNumber, Price>.from(state.materialPrice)
                  ..addAll(newPriceFetched);
            emit(
              state.copyWith(
                isFetching: false,
                materialPrice: newPriceMap,
              ),
            );
          },
        );
      },
      fetchPriceForZDP5Materials: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
          ),
        );

        final materialPrice =
            state.getPriceForMaterial(e.materialInfo.materialNumber);
        final failureOrSuccess =
            await repository.getMaterialPriceForZDP5Material(
          customerCodeInfo: state.customerCodeInfo,
          shipToInfo: state.shipToInfo,
          salesOrganisation: state.salesOrganisation,
          salesConfigs: state.salesConfigs,
          materialNumber: e.materialInfo.materialNumber,
          exceedQty: e.materialInfo.materialQtyConfirmZDP5Rule(
            materialPrice.zdp5MaxQuota.intValue,
            materialPrice.zdp5RemainingQuota.intValue,
          ),
        );

        failureOrSuccess.fold(
          (_) {
            emit(
              state.copyWith(
                isFetching: false,
              ),
            );
          },
          (newPriceFetched) {
            final finalPrice =
                Map<MaterialNumber, Price>.from(state.materialPrice);
            if (finalPrice[e.materialInfo.materialNumber] != null) {
              finalPrice[e.materialInfo.materialNumber] =
                  finalPrice[e.materialInfo.materialNumber]!.copyWith(
                tiers: newPriceFetched.tiers,
              );
            }
            emit(
              state.copyWith(
                isFetching: false,
                materialPrice: finalPrice,
              ),
            );
          },
        );
      },
    );
  }

  void _filterFOCMaterial(
    List<MaterialInfo> materials,
    Emitter<MaterialPriceState> emit,
  ) {
    final focMaterialDetails = <MaterialNumber, Price>{};
    for (final material in materials) {
      if (material.isFOCMaterial) {
        final materialNumber = material.materialNumber;
        focMaterialDetails.addEntries(
          {
            materialNumber: Price.empty().copyWith(
              materialNumber: materialNumber,
              isValid: false,
            ),
          }.entries,
        );
      }
    }
    if (focMaterialDetails.isNotEmpty) {
      emit(
        state.copyWith(
          materialPrice: Map.from(state.materialPrice)
            ..addAll(
              focMaterialDetails,
            ),
        ),
      );
    }
  }
}

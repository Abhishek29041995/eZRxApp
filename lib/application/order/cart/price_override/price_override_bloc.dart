import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/domain/order/repository/i_price_override_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_override_event.dart';
part 'price_override_state.dart';
part 'price_override_bloc.freezed.dart';

class PriceOverrideBloc extends Bloc<PriceOverrideEvent, PriceOverrideState> {
  final IPriceOverrideRepository priceOverrideRepository;
  PriceOverrideBloc({
    required this.priceOverrideRepository,
  }) : super(PriceOverrideState.initial()) {
    on<PriceOverrideEvent>(_onEvent);
  }

  Future<void> _onEvent(
    PriceOverrideEvent event,
    Emitter<PriceOverrideState> emit,
  ) async {
    await event.map(
      initialized: (e) {
        emit(
          PriceOverrideState.initial().copyWith(
            item: e.item,
          ),
        );
      },
      onPriceValueChange: (e) {
        emit(
          state.copyWith(
            showErrorMessages: false,
            item: state.item.copyWith(
              materialInfo: state.item.materialInfo.copyWith(
                counterOfferDetails:
                    state.item.materialInfo.counterOfferDetails.copyWith(
                  counterOfferPrice: CounterOfferValue(e.newPrice),
                ),
              ),
            ),
          ),
        );
      },
      onDiscountValueChanged: (e) {
        emit(
          state.copyWith(
            showErrorMessages: false,
            item: state.item.copyWith(
              materialInfo: state.item.materialInfo.copyWith(
                counterOfferDetails:
                    state.item.materialInfo.counterOfferDetails.copyWith(
                  discountOverridePercentage:
                      CounterOfferDiscountValue(e.newValue),
                ),
              ),
            ),
          ),
        );
      },
      onRemarksValueChange: (e) {
        emit(
          state.copyWith(
            item: state.item.copyWith(
              materialInfo: state.item.materialInfo.copyWith(
                counterOfferDetails:
                    state.item.materialInfo.counterOfferDetails.copyWith(
                  comment: StringValue(e.newRemarks),
                ),
              ),
            ),
          ),
        );
      },
      validateInputFields: (e) {
        emit(
          state.copyWith(
            showErrorMessages: !state.isInputFieldValid,
          ),
        );
      },
      fetch: (_Fetch value) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
            showErrorMessages: false,
          ),
        );
        final failureOrSuccess = await priceOverrideRepository.updateItemPrice(
          customerCodeInfo: value.customerCodeInfo,
          item: state.item,
          salesOrganisation: value.salesOrganisation,
        );
        if (isClosed) return;

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                showErrorMessages: true,
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (itemPrice) {
            emit(
              state.copyWith(
                item: state.item.copyWith(
                  price: itemPrice.copyWith(
                    isPriceOverride: state.isPriceOverride,
                    isDiscountOverride: state.isDiscountOverride,
                    priceOverride: state.item.materialInfo.counterOfferDetails
                        .counterOfferPrice.toPriceOverrideValue,
                    zdp8Override: state.item.materialInfo.counterOfferDetails
                        .discountOverridePercentage.toZdp8OverrideValue,
                  ),
                ),
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
                showErrorMessages: false,
              ),
            );
          },
        );
      },
    );
  }
}

import 'dart:async';

import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bundle_add_to_cart_event.dart';
part 'bundle_add_to_cart_state.dart';
part 'bundle_add_to_cart_bloc.freezed.dart';

class BundleAddToCartBloc
    extends Bloc<BundleAddToCartEvent, BundleAddToCartState> {
  BundleAddToCartBloc() : super(BundleAddToCartState.initial()) {
    on<BundleAddToCartEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
    BundleAddToCartEvent event,
    Emitter<BundleAddToCartState> emit,
  ) {
    event.map(
      initialized: (_) => emit(BundleAddToCartState.initial()),
      set: (_Set e) => emit(
        state.copyWith(
          materialInfo: e.bundle,
        ),
      ),
      updateQuantity: (e) => emit(
        state.copyWith.materialInfo.bundle(
          materials: state.materialInfo.bundle.materials
              .map(
                (element) => element.materialNumber == e.materialNumber
                    ? element.copyWith(quantity: MaterialQty(e.quantity))
                    : element,
              )
              .toList(),
        ),
      ),
      validateQuantity: (e) =>
          emit(state.copyWith(showErrorMessage: e.showErrorMessage)),
    );
  }
}

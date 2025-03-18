import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/sales_rep_authorized_details.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/tr_object.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/order/value/value_objects.dart';

part 'order_eligibility_event.dart';

part 'order_eligibility_state.dart';

part 'order_eligibility_bloc.freezed.dart';

class OrderEligibilityBloc
    extends Bloc<OrderEligibilityEvent, OrderEligibilityState> {
  OrderEligibilityBloc() : super(OrderEligibilityState.initial()) {
    on<OrderEligibilityEvent>(_onEvent);
  }

  void _onEvent(
    OrderEligibilityEvent event,
    Emitter<OrderEligibilityState> emit,
  ) {
    event.map(
      initialized: (e) => emit(
        OrderEligibilityState.initial().copyWith(
          configs: e.configs,
          customerCodeInfo: e.customerCodeInfo,
          salesOrg: e.salesOrg,
          shipInfo: e.shipInfo,
          user: e.user,
          urgentDeliveryOption: e.configs.urgentDeliveryOptions.firstOrNull ??
              UrgentDeliveryTimePickerOption(''),
        ),
      ),
      update: (e) => emit(
        state.copyWith(
          mpSubtotal: e.mpSubtotal,
          zpSubtotal: e.zpSubtotal,
          subTotal: e.subTotal,
          grandTotal: e.grandTotal,
          cartItems: e.cartItems,
        ),
      ),
      validateOrderEligibility: (e) => emit(
        state.copyWith(
          showErrorMessage: !state.isMinOrderValuePassed ||
              state.isMWPNotAllowedAndPresentInCart ||
              !state.isOOSOrderAllowedToSubmit ||
              state.displayInvalidItemsBanner,
        ),
      ),
      selectDeliveryOption: (e) =>
          emit(state.copyWith(deliveryOption: e.value)),
      updateUrgentDeliveryOption: (e) =>
          emit(state.copyWith(urgentDeliveryOption: e.value)),
      selectRequestDeliveryDate: (e) {
        emit(state.copyWith(selectedRequestDeliveryDate: e.value));
      },
    );
  }
}

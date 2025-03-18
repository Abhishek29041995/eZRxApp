import 'package:ezrxmobile/domain/order/entities/order_status_tracker.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history_step.freezed.dart';

@freezed
class OrderHistoryStep with _$OrderHistoryStep {
  const OrderHistoryStep._();

  const factory OrderHistoryStep({
    required String dateString,
    required String timeString,
    required IconData icon,
    required String title,
    required String subTitle,
    required List<OrderStatusTracker> subSteps,
    required OrderHistoryStepStates state,
  }) = _OrderHistoryStep;

  factory OrderHistoryStep.empty() => const OrderHistoryStep(
        dateString: '',
        timeString: '',
        title: '',
        subTitle: '',
        icon: Icons.circle,
        subSteps: <OrderStatusTracker>[],
        state: OrderHistoryStepStates.inactive,
      );
}

enum OrderHistoryStepStates {
  active,
  inactive,
}

extension OrderHistoryStepExtension on List<OrderHistoryStep> {
  List<OrderHistoryStep> updatedOutOfDeliverySubSteps(
    List<OrderStatusTracker> subSteps,
  ) {
    final needToUpdated = any(
      (status) => ['out for delivery', 'delivered', 'out for redelivery']
          .contains(status.title.trim().toLowerCase()),
    );

    if (needToUpdated) {
      return map(
        (step) => step.title != 'Out for delivery'
            ? step
            : step.copyWith(
                subSteps: subSteps
                    .where(
                      (element) => element != OrderStatusTracker.empty(),
                    )
                    .toList(),
              ),
      ).toList();
    }

    return this;
  }
}

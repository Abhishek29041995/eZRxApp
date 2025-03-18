import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_status_tracker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_status_tracker_dto.freezed.dart';

part 'order_status_tracker_dto.g.dart';

@freezed
class OrderStatusTrackerDto with _$OrderStatusTrackerDto {
  const OrderStatusTrackerDto._();

  const factory OrderStatusTrackerDto({
    @JsonKey(name: 'Actiom', defaultValue: '') required String action,
    @JsonKey(name: 'StepName', defaultValue: '') required String stepName,
    @JsonKey(name: 'StepStape', defaultValue: '') required String stepStage,
    @JsonKey(name: 'State', defaultValue: '') required String state,
    @JsonKey(name: 'Status', defaultValue: '') required String status,
    @JsonKey(name: 'UpdateTimeStamp', defaultValue: '')
    required String updateTimeStamp,
    @JsonKey(name: 'PreformedAt', defaultValue: '') required String preformedAt,
  }) = _OrderStatusTrackerDto;

  factory OrderStatusTrackerDto.fromDomain(
    OrderStatusTracker orderStatusTracker,
  ) {
    return OrderStatusTrackerDto(
      action: orderStatusTracker.action,
      stepName: orderStatusTracker.stepName,
      stepStage: orderStatusTracker.stepStage,
      state: orderStatusTracker.state,
      status: orderStatusTracker.status.getOrDefaultValue(''),
      updateTimeStamp: orderStatusTracker.updateTimeStamp.dateString,
      preformedAt: orderStatusTracker.preformedAt.dateString,
    );
  }

  OrderStatusTracker toDomain() {
    return OrderStatusTracker(
      action: action,
      stepName: stepName,
      stepStage: stepStage,
      state: state,
      status: StatusType(
        status,
      ),
      updateTimeStamp: DateTimeStringValue(
        updateTimeStamp,
      ),
      preformedAt: DateTimeStringValue(
        preformedAt,
      ),
    );
  }

  factory OrderStatusTrackerDto.fromJson(Map<String, dynamic> json) =>
      _$OrderStatusTrackerDtoFromJson(json);
}

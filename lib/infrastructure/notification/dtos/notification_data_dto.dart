import 'package:ezrxmobile/domain/banner/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/notification/entities/notification_data.dart';
import 'package:ezrxmobile/domain/notification/value/value_object.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_requests_id.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_readvalue_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_data_dto.freezed.dart';

part 'notification_data_dto.g.dart';

@freezed
class NotificationDataDto with _$NotificationDataDto {
  const NotificationDataDto._();

  const factory NotificationDataDto({
    @JsonKey(name: 'id', defaultValue: 0) required int id,
    @JsonKey(name: 'type', defaultValue: '') required String type,
    @JsonKey(name: 'title', defaultValue: '') required String title,
    @JsonKey(name: 'description', defaultValue: '') required String description,
    @JsonKey(name: 'createdAt', defaultValue: '') required String createdAt,
    @JsonKey(
      name: 'isRead',
    )
    required bool isRead,
    @JsonKey(name: 'returnRequestNumber', defaultValue: '')
    required String returnRequestId,
    @JsonKey(name: 'orderNumber', defaultValue: '') required String orderNumber,
    @JsonKey(name: 'paymentNumber', defaultValue: '')
    required String paymentNumber,
    @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
    required String paymentBatchAdditionalInfo,
    @JsonKey(
      defaultValue: false,
      readValue: JsonReadValueHelper.mappingIsMarketPlace,
    )
    required bool isMarketPlace,
  }) = _NotificationDataDto;

  NotificationData toDomain() {
    return NotificationData(
      id: id,
      type: NotificationType(type),
      title: NotificationTitle(title),
      description: description,
      createdAt: DateTimeStringValue(createdAt),
      isRead: isRead,
      returnRequestId: ReturnRequestsId(requestId: returnRequestId),
      orderNumber: OrderNumber(orderNumber),
      paymentNumber: StringValue(paymentNumber),
      paymentBatchAdditionalInfo: StringValue(paymentBatchAdditionalInfo),
      hyperLink: EZReachBannerLink(''),
      isMarketPlace: isMarketPlace,
    );
  }

  factory NotificationDataDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataDtoFromJson(json);
}

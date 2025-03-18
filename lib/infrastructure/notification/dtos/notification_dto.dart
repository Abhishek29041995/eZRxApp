import 'package:ezrxmobile/domain/notification/entities/notification.dart';
import 'package:ezrxmobile/domain/notification/entities/pagination.dart';
import 'package:ezrxmobile/infrastructure/notification/dtos/notification_data_dto.dart';
import 'package:ezrxmobile/infrastructure/notification/dtos/pagination_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'notification_dto.freezed.dart';
part 'notification_dto.g.dart';

@freezed
class NotificationDto with _$NotificationDto {
  const NotificationDto._();
  const factory NotificationDto({
    @JsonKey(
      name: 'pagination',
    )
        required PaginationDto pagination,
    @JsonKey(name: 'data', defaultValue: <NotificationDataDto>[])
        required List<NotificationDataDto> notificationData,
  }) = _NotificationDto;

  Notifications toDomain() {
    return Notifications(
      pagination: Pagination(
        totalItem: pagination.totalItem,
        totalPage: pagination.totalPage,
        totalUnread: pagination.totalUnread,
      ),
      notificationData: notificationData.map((e) => e.toDomain()).toList(),
    );
  }

  factory NotificationDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationDtoFromJson(json);
}

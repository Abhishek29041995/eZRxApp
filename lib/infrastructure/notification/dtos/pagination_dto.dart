import 'package:ezrxmobile/domain/notification/entities/pagination.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'pagination_dto.freezed.dart';
part 'pagination_dto.g.dart';

@freezed
class PaginationDto with _$PaginationDto {
  const PaginationDto._();
  const factory PaginationDto({
    @JsonKey(name: 'totalItem', defaultValue: 0) required int totalItem,
    @JsonKey(name: 'totalPage', defaultValue: 0) required int totalPage,
    @JsonKey(name: 'totalUnread', defaultValue: 0) required int totalUnread,
  }) = _PaginationDto;
  factory PaginationDto.fromDomain(Pagination pagination) {
    return PaginationDto(
      totalItem: pagination.totalItem,
      totalPage: pagination.totalPage,
      totalUnread: pagination.totalUnread,
    );
  }

  Pagination toDomain() {
    return Pagination(
      totalItem: 0,
      totalPage: 0,
      totalUnread: 0,
    );
  }

  factory PaginationDto.fromJson(Map<String, dynamic> json) =>
      _$PaginationDtoFromJson(json);
}

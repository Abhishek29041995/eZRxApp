import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';

@freezed
class Pagination with _$Pagination {
  const Pagination._();

  factory Pagination({
   required int totalPage,
    required int totalItem,
    required int totalUnread,
  }) = _Pagination;

  factory Pagination.empty() => Pagination(
      totalPage: 0,
        totalItem: 0,
        totalUnread: 0,
      );
}

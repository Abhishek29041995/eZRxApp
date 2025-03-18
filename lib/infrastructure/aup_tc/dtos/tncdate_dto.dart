import 'package:ezrxmobile/domain/aup_tc/entities/tncdate.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'tncdate_dto.freezed.dart';
part 'tncdate_dto.g.dart';

@Freezed(toJson: false)
class TncDateDto with _$TncDateDto {
  const TncDateDto._();

  const factory TncDateDto({
    required String date,
  }) = _TncDateDto;

  TncDate toDomain() {
    return TncDate(date: DateFormat('dd/MM/yyyy').parse(date));
  }

  factory TncDateDto.fromJson(Map<String, dynamic> json) =>
      _$TncDateDtoFromJson(json);
}

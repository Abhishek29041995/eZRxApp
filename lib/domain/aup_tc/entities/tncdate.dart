import 'package:freezed_annotation/freezed_annotation.dart';

part 'tncdate.freezed.dart';

@freezed
class TncDate with _$TncDate {
  const TncDate._();

  const factory TncDate({
    required DateTime date,
  }) = _TncDate;

  factory TncDate.empty() => TncDate(
        date: DateTime.parse('1970-01-01 00:00:00'),
      );
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'bill_to_name.freezed.dart';

@freezed
class BillToName with _$BillToName {
  const BillToName._();

  const factory BillToName({
    required String name1,
    required String name2,
    required String name3,
    required String name4,
  }) = _BillToName;

  factory BillToName.empty() => const BillToName(
        name1: '',
        name2: '',
        name3: '',
        name4: '',
      );

  @override
  String toString() => '$name1 $name2 $name3 $name4';
}

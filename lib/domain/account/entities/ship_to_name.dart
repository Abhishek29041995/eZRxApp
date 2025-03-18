import 'package:freezed_annotation/freezed_annotation.dart';

part 'ship_to_name.freezed.dart';

@freezed
class ShipToName with _$ShipToName {
  const ShipToName._();

  const factory ShipToName({
    required String name1,
    required String name2,
    required String name3,
    required String name4,
  }) = _ShipToName;

  factory ShipToName.empty() => const ShipToName(
        name1: '',
        name2: '',
        name3: '',
        name4: '',
      );

  @override
  String toString() => '$name1 $name2 $name3 $name4'.trim();
}

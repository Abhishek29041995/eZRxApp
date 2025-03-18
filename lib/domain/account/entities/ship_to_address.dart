import 'package:freezed_annotation/freezed_annotation.dart';

part 'ship_to_address.freezed.dart';

@freezed
class ShipToAddress with _$ShipToAddress {
  const ShipToAddress._();

  const factory ShipToAddress({
    required String street,
    required String street2,
    required String street3,
    required String street4,
    required String street5,
    required String city1,
    required String city2,
  }) = _ShipToAddress;

  factory ShipToAddress.empty() => const ShipToAddress(
        street: '',
        street2: '',
        street3: '',
        street4: '',
        street5: '',
        city1: '',
        city2: '',
      );

  @override
  String toString() {
    final streetList = [
      if (street.isNotEmpty) street,
      if (street2.isNotEmpty) street2,
      if (street3.isNotEmpty) street3,
      if (street4.isNotEmpty) street4,
      if (street5.isNotEmpty) street5,
    ];

    return streetList.join(', ');
  }

  String toAddress() {
    final cityList = [
      toString(),
      if (city1.isNotEmpty) city1,
      if (city2.isNotEmpty) city2,
    ];

    return cityList.join(', ');
  }
}

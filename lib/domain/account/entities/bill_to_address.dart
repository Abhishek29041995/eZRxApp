import 'package:freezed_annotation/freezed_annotation.dart';

part 'bill_to_address.freezed.dart';

@freezed
class BillToAddress with _$BillToAddress {
  const BillToAddress._();

  const factory BillToAddress({
    required String street,
    required String street2,
    required String street3,
    required String street4,
    required String street5,
    required String city1,
    required String city2,
  }) = _BillToAddress;

  factory BillToAddress.empty() => const BillToAddress(
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
    final street2Str = street2.isEmpty ? '' : ' $street2';
    final street3Str = street3.isEmpty ? '' : ' $street3';
    final street4Str = street4.isEmpty ? '' : ' $street4';
    final street5Str = street5.isEmpty ? '' : ' $street5';

    return '$street$street2Str$street3Str$street4Str$street5Str';
  }

  String toAddress() {
    final city1Str = city1.isEmpty ? '' : ', $city1';
    final city2Str = city2.isEmpty ? '' : ', $city2';

    return '${toString()}$city2Str$city1Str';
  }
}

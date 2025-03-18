import 'package:freezed_annotation/freezed_annotation.dart';

part 'bill_to_alt_name.freezed.dart';

@freezed
class BillToAltName with _$BillToAltName {
  const BillToAltName._();

  const factory BillToAltName({
    required String altName1,
    required String altName2,
    required String altName3,
    required String altName4,
  }) = _BillToAltName;

  factory BillToAltName.empty() => const BillToAltName(
        altName1: '',
        altName2: '',
        altName3: '',
        altName4: '',
      );

  @override
  String toString() => '$altName1 $altName2 $altName3 $altName4';
}

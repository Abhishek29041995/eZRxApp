import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'batches.freezed.dart';

@freezed
class Batches with _$Batches {
  const Batches._();
  factory Batches({
    required StringValue batchNumber,
    required DateTimeStringValue expiryDate,
  }) = _Batches;

  factory Batches.empty() => Batches(
        batchNumber: StringValue(''),
        expiryDate: DateTimeStringValue(''),
      );

  bool get batchNumHasData => batchNumber.isValid() || expiryDate.isNotEmpty;
}

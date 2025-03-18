import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart'
    as value_object;
import 'package:collection/collection.dart';

part 'payment_term.freezed.dart';

@freezed
class PaymentTerm with _$PaymentTerm {
  const PaymentTerm._();

  const factory PaymentTerm({
    required String paymentTermCode,
    required int paymentTermRanking,
    required String paymentTermDescription,
    required int paymentTermSubranking,
  }) = _PaymentTerm;

  factory PaymentTerm.empty() => const PaymentTerm(
        paymentTermCode: '',
        paymentTermRanking: 0,
        paymentTermDescription: '',
        paymentTermSubranking: 0,
      );
  
String get displayValue {
    if (paymentTermCode.isEmpty && paymentTermDescription.isEmpty) {
    return 'NA';
    }
    
    return '${paymentTermCode.trim()}${paymentTermDescription.isNotEmpty ? ' - $paymentTermDescription' : ''}';
}
}

extension PaymentTermListExtension on List<PaymentTerm> {
  List<String> get display =>
      where((element) => element.paymentTermCode.isNotEmpty)
          .map((e) => e.displayValue)
          .toSet()
          .toList();

  String? displaySelected(value_object.PaymentTerm paymentTerm) {
    if (paymentTerm.getOrDefaultValue('').isEmpty) return null;

    final selectedTerm = paymentTerm.getValue();
    final exactMatchTerm = display.firstWhereOrNull(
      (term) => term == selectedTerm,
    );
    final relativeMatchTerm = display.firstWhereOrNull(
      (term) => term.contains(selectedTerm),
    );

    return exactMatchTerm ?? relativeMatchTerm;
  }
}
